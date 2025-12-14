<?php

namespace App\Filament\Resources\Purchases\Pages;

use App\Filament\Resources\Purchases\PurchaseResource;
use App\Models\Batch;
use App\Models\Product;
use App\Models\Purchase;
use App\Models\SupplierAccount;
use App\Services\InventoryService;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class CreatePurchase extends CreateRecord
{
    protected static string $resource = PurchaseResource::class;

    protected function handleRecordCreation(array $data): Model
    {
        $items = $data['items'] ?? [];
        $data['created_by'] = auth()->user()->id;
        $data['total_amount'] = 0;

        // Remove items from invoice data before creating the invoice record via service
        $purchaseData = $data;
        unset($purchaseData['items']);

        $service = app(InventoryService::class);

        $purchaseData['invoice_no'] = $service->generateSequentialNumber('PUR', 'Purchase', 'invoice_no');

        return DB::transaction(function () use ($purchaseData, $items, $service) {
            $purchase = Purchase::create($purchaseData);
            $subtotal = 0;

            foreach ($items as $item) {
                $product = Product::findOrFail($item['product_id']);

                $lineTotal = $item['quantity'] * $item['unit_price'];
                $subtotal += $lineTotal;

                // Create batch
                if (! $item['batch_id']) {
                    $batch = Batch::create([
                        'product_id' => $item['product_id'],
                        'supplier_id' => $purchaseData['supplier_id'],
                        'batch_no' => 'BATCH-' . strtoupper(uniqid()),
                        'expiry_date' => $item['expiry_date'] ?? null,
                        'initial_quantity' => $item['quantity'],
                        'current_quantity' => $item['quantity'],
                        'purchase_price_per_base' => $item['unit_price'],
                    ]);
                } else {
                    $batch = Batch::find($item['batch_id']);
                    $batch->increment('initial_quantity', $item['quantity']);
                    $batch->increment('current_quantity', $item['quantity']);
                }

                $purchaseItem = $purchase->items()->create([
                    'product_id' => $product->id,
                    'batch_id' => $batch->id,
                    'quantity' => $item['quantity'],
                    'unit_price' => $item['unit_price'],
                    'total_price' => $lineTotal
                ]);

                $service->recordStockMovement(
                    $product->id,
                    $item['batch_id'],
                    'purchase',
                    $item['quantity'],
                    'in',
                    'purchase',
                    $purchase->id,
                    $purchaseData['created_by']
                );
            }

            $purchase->update([
                'total_amount' => $subtotal
            ]);

            // Record supplier debt
            if ($purchaseData['supplier_id'] && in_array($purchaseData['payment_status'], ['unpaid', 'partial'])) {
                if ($purchaseData['payment_status'] === 'unpaid') {
                    $debt = $subtotal;
                }
                if ($purchaseData['payment_status'] === 'partial') {
                    $debt = $subtotal - $purchaseData['paid'];
                }

                // Create or update supplier account
                $supplierAccount = SupplierAccount::where('supplier_id', $purchaseData['supplier_id'])->first();
                if (! $supplierAccount) {
                    $supplierAccount = SupplierAccount::create([
                        'supplier_id' => $purchaseData['supplier_id'],
                        'balance' => $debt,
                    ]);
                } else {
                    $supplierAccount->increment('balance', $debt);
                }

                // Create transaction
                $supplierAccount->transactions()->create([
                    'type' => 'debt',
                    'purchase_id' => $purchase->id,
                    'amount' => $debt,
                ]);
            }

            return $purchase;
        });
    }
}
