<?php

namespace App\Filament\Resources\ProductReturns\Pages;

use App\Filament\Resources\ProductReturns\ProductReturnResource;
use App\Models\Batch;
use App\Models\InvoiceItem;
use App\Models\ProductReturn;
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

        // Remove items from invoice data before creating the invoice record via service
        $returnData = $data;
        unset($returnData['items']);

        $service = app(InventoryService::class);

        $productReturns = DB::transaction(function () use ($returnData, $items, $service) {
            $batches = Batch::get();

            $invoiceItems = InvoiceItem::where('invoice_id', $returnData['reference_id'])->get();

            $productReturn = ProductReturn::create($returnData);
            $subtotal = 0;

            foreach($items as $item) {
                $productPrice = $invoiceItems->firstWhere('product_id', $item['product_id'])->unit_price;

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
                    'in',
                    'product_return',
                    $productReturn->id,
                    $returnData['created_by']
                );

                $batch = $batches->where('id', $item['batch_id'])->first();
                $batchNewQty =$batch->current_quantity + $item['quantity'];
                $batch->update(['current_quantity' => max($batchNewQty, 0)]);
            }

            $productReturn->update(['total_amount' => $subtotal]);
            return $productReturn;
        });

        return $productReturns;
    }
}
