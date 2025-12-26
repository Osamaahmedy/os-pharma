<?php

namespace App\Filament\Resources\PurchaseReturns\Pages;

use App\Filament\Resources\PurchaseReturns\ProductReturnResource;
use App\Models\Batch;
use App\Models\ProductReturn;
use App\Models\Purchase;
use App\Models\PurchaseItem;
use App\Models\SupplierAccount;
use App\Services\InventoryService;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class CreateProductReturn extends CreateRecord
{
    protected static string $resource = ProductReturnResource::class;

    protected function handleRecordCreation(array $data): Model
    {
        $items = $data['items'] ?? [];
        $data['created_by'] = auth()->user()->id;
        $data['total_amount'] = 0;

        // Remove items from invoice data before creating the return record
        $returnData = $data;
        unset($returnData['items']);
        unset($returnData['supplier_id']);

        $service = app(InventoryService::class);

        $productReturns = DB::transaction(function () use ($returnData, $items, $service, $data) {
            $batches = Batch::get();
            $purchaseItems = PurchaseItem::where('purchase_id', $returnData['reference_id'])->get();

            $productReturn = ProductReturn::create($returnData);
            $subtotal = 0;

            foreach($items as $item) {
                $productPrice = $purchaseItems->firstWhere('product_id', $item['product_id'])->unit_price;

                $lineTotal = $item['quantity'] * $productPrice;
                $subtotal += $lineTotal;

                $productReturn->items()->create([
                    'product_id' => $item['product_id'],
                    'batch_id' => $item['batch_id'],
                    'quantity' => $item['quantity'],
                    'reason' => $item['reason'],
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

                $batch = $batches->where('id', $item['batch_id'])->first();
                $batchNewQty = $batch->current_quantity - $item['quantity'];
                $batch->update(['current_quantity' => max($batchNewQty, 0)]);
            }

            $productReturn->update(['total_amount' => $subtotal]);

            // Adjust supplier account
            $supplierAccount = SupplierAccount::firstWhere('supplier_id', $data['supplier_id']);
            $purchase = Purchase::find($data['reference_id']);

            if ($supplierAccount && $purchase->payment_status != 'paid') {
                $supplierAccount->update(['balance' => max($subtotal, 0)]);
                $supplierAccount->transactions()->create([
                    'type' => 'payment',
                    'purchase_id' => $purchase->id,
                    'amount' => $subtotal,
                    'description' => 'مرتجع'
                ]);
            }
            return $productReturn;
        });

        return $productReturns;
    }
}
