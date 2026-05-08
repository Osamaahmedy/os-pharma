<?php

namespace App\Filament\Resources\PurchaseReturns\Pages;

use App\Filament\Resources\PurchaseReturns\ProductReturnResource;
use App\Models\Batch;
use App\Models\ProductReturn;
use App\Models\Purchase;
use App\Models\PurchaseItem;
use App\Models\ReturnItem;
use App\Models\SupplierAccount;
use App\Models\SupplierAccountTransaction;
use App\Services\InventoryService;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;

class CreateProductReturn extends CreateRecord
{
    protected static string $resource = ProductReturnResource::class;

    protected function handleRecordCreation(array $data): Model
    {
        $items       = $data['items'] ?? [];
        $supplierId  = $data['supplier_id'];
        $referenceId = $data['reference_id'];

        $data['created_by'] = auth()->user()->id;

        $returnData = $data;
        unset($returnData['items'], $returnData['supplier_id']);

        $service = app(InventoryService::class);

        return DB::transaction(function () use ($returnData, $items, $service, $supplierId, $referenceId) {

            $purchase      = Purchase::findOrFail($referenceId);
            $purchaseItems = PurchaseItem::where('purchase_id', $referenceId)->get();
            $batches       = Batch::whereIn('id', array_column($items, 'batch_id'))
                                  ->get()
                                  ->keyBy('id');

            $existingReturnIds = ProductReturn::where('reference_id', $referenceId)
                ->where('type', 'purchase')
                ->pluck('id');

            // ── التحقق من صحة البنود ──────────────────────────────
            $seen = [];

            foreach ($items as $index => $item) {
                $rowNum    = $index + 1;
                $productId = $item['product_id'];
                $batchId   = $item['batch_id'];
                $qty       = (int) $item['quantity'];

                $batch = $batches->get($batchId);
                if (! $batch) {
                    throw ValidationException::withMessages([
                        "items.{$index}.batch_id" => "البند {$rowNum}: الدُّفعة غير موجودة.",
                    ]);
                }

                $purchaseItem = $purchaseItems
                    ->where('product_id', $productId)
                    ->where('batch_id', $batchId)
                    ->first();

                if (! $purchaseItem) {
                    throw ValidationException::withMessages([
                        "items.{$index}.product_id" => "البند {$rowNum}: هذا المنتج غير موجود في فاتورة الشراء الأصلية.",
                    ]);
                }

                if ($qty > $batch->current_quantity) {
                    throw ValidationException::withMessages([
                        "items.{$index}.quantity" => "البند {$rowNum}: الكمية ({$qty}) تتجاوز المتاح في المخزن ({$batch->current_quantity}).",
                    ]);
                }

                $alreadyReturned = ReturnItem::whereIn('return_id', $existingReturnIds)
                    ->where('product_id', $productId)
                    ->where('batch_id', $batchId)
                    ->sum('quantity');

                $maxReturnable = $purchaseItem->quantity - $alreadyReturned;

                if ($qty > $maxReturnable) {
                    throw ValidationException::withMessages([
                        "items.{$index}.quantity" => "البند {$rowNum}: الكمية ({$qty}) تتجاوز المتبقي للإرجاع ({$maxReturnable}).",
                    ]);
                }

                $key = $productId . '_' . $batchId;
                if (isset($seen[$key])) {
                    throw ValidationException::withMessages([
                        "items.{$index}.batch_id" => "البند {$rowNum}: المنتج والدُّفعة مكررة.",
                    ]);
                }
                $seen[$key] = true;
            }

            // ── إنشاء المرتجع ─────────────────────────────────────
            $productReturn = ProductReturn::create(array_merge($returnData, [
                'total_amount' => 0,
            ]));

            $subtotal = 0;

            foreach ($items as $item) {
                $purchaseItem = $purchaseItems
                    ->where('product_id', $item['product_id'])
                    ->where('batch_id', $item['batch_id'])
                    ->first();

                $unitPrice = $purchaseItem->unit_price;
                $lineTotal = (int) $item['quantity'] * (float) $unitPrice;
                $subtotal += $lineTotal;

                $productReturn->items()->create([
                    'product_id' => $item['product_id'],
                    'batch_id'   => $item['batch_id'],
                    'quantity'   => $item['quantity'],
                    'unit_price' => $unitPrice,
                    'reason'     => $item['reason'] ?? null,
                ]);

                $service->recordStockMovement(
                    $item['product_id'],
                    $item['batch_id'],
                    'return',
                    $item['quantity'],
                    'out',
                    'product_return',
                    $productReturn->id,
                    $returnData['created_by']
                );

                $batches->get($item['batch_id'])
                        ->decrement('current_quantity', $item['quantity']);
            }

            $productReturn->update(['total_amount' => $subtotal]);

            $this->settleSupplierAccount($purchase, $supplierId, $subtotal);

            return $productReturn;
        });
    }

    private function settleSupplierAccount(Purchase $purchase, int $supplierId, float $subtotal): void
{
    $supplierAccount = SupplierAccount::firstWhere('supplier_id', $supplierId);
    if (! $supplierAccount) return;

    // ✅ اخصم فقط بحد الرصيد الحالي (لا تسمح بالسالب)
    $deductible = min($subtotal, $supplierAccount->balance);
    $supplierAccount->decrement('balance', $deductible);

    $supplierAccount->transactions()->create([
        'type'        => 'return_deduction',
        'purchase_id' => $purchase->id,
        'amount'      => $deductible,
        'description' => 'مرتجع مشتريات - خصم من الدين',
    ]);

    $this->updatePurchasePaymentStatus($purchase);
}

    private function updatePurchasePaymentStatus(Purchase $purchase): void
    {
        $totalPaid = SupplierAccountTransaction::where('purchase_id', $purchase->id)
            ->whereIn('type', ['payment', 'return_deduction'])
            ->sum('amount');

        if ($totalPaid >= $purchase->total_amount) {
            $purchase->update(['payment_status' => 'paid']);
        } elseif ($totalPaid > 0) {
            $purchase->update(['payment_status' => 'partial']);
        } else {
            $purchase->update(['payment_status' => 'unpaid']);
        }
    }
}
