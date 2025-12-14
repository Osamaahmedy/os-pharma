<?php

namespace App\Services;

use App\Models\Adjustment;
use App\Models\Batch;
use App\Models\CustomerAccount;
use App\Models\CustomerAccountTransaction;
use App\Models\Invoice;
use App\Models\InvoiceItemBatch;
use App\Models\Notification as ModelsNotification;
use App\Models\Product;
use App\Models\ProductUnit;
use App\Models\StockMovement;
use Filament\Notifications\Notification;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;

class InventoryService
{
    public function toBaseUnits(int $productUnitId, float $qty)
    {
        $unit = ProductUnit::find($productUnitId);

        // Multiply then floor to avoid fractional base-units and ensure correct casting
        return (int) floor($qty * $unit->conversion_factor);
    }

    public function generateSequentialNumber(
        string $prefix,
        string $modelClass,
        string $columnName,
        int $padding = 5
    ) {
        // 1. Define the desired format: PREFIX-YYYYMMDD-SEQUENCE
        $datePart = now()->format('Ymd');
        $fullPrefix = $prefix.'-'.$datePart.'-';
        $fullPrefixRegex = $prefix.'-'.$datePart.'-';
        $modelClass = '\\App\\Models\\' . $modelClass;

        // 2. Retrieve the last generated number matching today's prefix
        $latestRecord = $modelClass::where($columnName, 'like', $fullPrefixRegex.'%')
            ->latest()
            ->lockForUpdate() // Lock the row/table to prevent race conditions
            ->first();

        $nextNumber = 1;

        if ($latestRecord) {
            // 3. Extract and increment the sequential part
            $lastNumber = (int) substr($latestRecord->$columnName, strlen($fullPrefix));
            $nextNumber = $lastNumber + 1;
        }

        // 4. Format the final unique number
        $paddedNumber = str_pad($nextNumber, $padding, '0', STR_PAD_LEFT);

        return $fullPrefix.$paddedNumber;

    }

    public function allocateFromBatches($productId, $qtyNeeded, string $policy = 'FEFO')
    {
        $query = Batch::where('product_id', $productId)
            ->where('current_quantity', '>', 0);

        // order by expiry for FEFO, otherwise by created_at (FIFO)
        if ($policy === 'FEFO') {
            $query->orderBy('expiry_date', 'asc')->orderBy('id', 'asc');
        } else {
            $query->orderBy('created_at', 'asc')->orderBy('id', 'asc');
        }

        $batches = $query->lockForUpdate()->get();

        $totalAvailable = $batches->sum('current_quantity');

        if ($totalAvailable < $qtyNeeded) {
            $productName = Product::find($productId)?->name ?? 'Unknown Product';
            Notification::make()->title("لا توجد كمية كافية في المخزون لهذا المنتج: {$productName}")->danger()->send();
            throw ValidationException::withMessages(['stock' => "Insufficient stock for product ID {$productId}. Available: {$totalAvailable}, required: {$qtyNeeded}"]);
        }

        $allocations = [];
        $remaining = $qtyNeeded;

        foreach ($batches as $batch) {
            if ($remaining <= 0) {
                break;
            }

            $take = min($remaining, $batch->current_quantity);
            $batch->current_quantity -= $take;
            $batch->save();

            $allocations[] = [
                'batch_id' => $batch->id,
                'qty_taken' => $take,
                'cost_per_unit' => $batch->purchase_price_per_base,
            ];

            $remaining -= $take;
        }

        if ($remaining > 0) {
            throw new \Exception("Insufficient stock for product #{$productId}");
        }

        return $allocations;
    }

    public function recordStockMovement($productId, $batchId, $movementType, $qty, $direction, $refType, $refId, $userId)
    {
        StockMovement::create([
            'product_id' => $productId,
            'batch_id' => $batchId,
            'movement_type' => $movementType, // INVOICE, PURCHASE, ADJUSTMENT
            'reference_type' => $refType, // 'invoice', 'purchase', 'product_return', 'adjustment'
            'reference_id' => $refId,
            'quantity' => $qty,
            'direction' => $direction,
            'created_by' => $userId,
        ]);
    }

    public function processSale($invoiceData, $items, $userId)
    {
        return DB::transaction(function () use ($invoiceData, $items, $userId) {
            $invoice = Invoice::create($invoiceData);

            $subtotal = 0;

            foreach ($items as $item) {
                $product = Product::findOrFail($item['product_id']);
                $baseQty = $this->toBaseUnits($item['unit_id'], $item['quantity']);

                $allocs = $this->allocateFromBatches($product->id, $baseQty);

                $lineTotal = $item['quantity'] * $item['unit_price'];
                $subtotal += $lineTotal;

                $invoiceItem = $invoice->items()->create([
                    'product_id' => $product->id,
                    'unit_id' => $item['unit_id'],
                    'quantity' => $item['quantity'],
                    'quantity_base' => $baseQty,
                    'unit_price' => $item['unit_price'],
                    'base_price' => $item['base_price'],
                    'total_price' => $lineTotal,
                ]);

                // Record stock movement for each batch used
                foreach ($allocs as $a) {
                    $this->recordStockMovement(
                        $product->id,
                        $a['batch_id'],
                        'invoice',
                        $a['qty_taken'],
                        'out',
                        'invoice',
                        $invoice->id,
                        $userId
                    );

                    InvoiceItemBatch::create([
                        'invoice_item_id' => $invoiceItem->id,
                        'batch_id' => $a['batch_id'],
                        'quantity' => $a['qty_taken'],
                    ]);
                }

                $checkQuantity = Batch::where('product_id', $product->id)->sum('current_quantity');
                if ($checkQuantity < $product->reorder_level) {
                    ModelsNotification::create([
                        'message' => "لا توجد كمية كافية في المخزون لهذا المنتج: {$product->name}"
                    ]);
                    Notification::make()->title("لا توجد كمية كافية في المخزون لهذا المنتج: {$product->name}")->danger()->send();
                }
            }

            $invoice->update([
                'total_amount' => $subtotal,
            ]);

            // Record customer debt
            if ($invoiceData['customer_name'] && in_array($invoiceData['payment_status'], ['unpaid', 'partial'])) {
                if ($invoiceData['payment_status'] === 'unpaid') {
                    $debt = $subtotal - $invoiceData['discount'] ?? 0;
                }
                if ($invoiceData['payment_status'] === 'partial') {
                    $debt = $subtotal - $invoiceData['paid'] - $invoiceData['discount'] ?? 0;
                }

                // Create transaction
                CustomerAccountTransaction::create([
                    'type' => 'debt',
                    'invoice_id' => $invoice->id,
                    'amount' => $debt,
                    'customer_name' => $invoiceData['customer_name']
                ]);
            }

            return $invoice;
        });
    }

    public function adjustStock($productId, $batchId, $newQty, $reason, $userId, $direction)
    {
        $batch = Batch::findOrFail($batchId);
        $oldQuantity = $batch->current_quantity;
        $difference = $newQty - $oldQuantity;
        // If there's no change, do nothing
        if ($difference === 0) {
            return null;
        }

        $batch->current_quantity = $newQty;
        $batch->save();

        $adjustment = Adjustment::create([
            'product_id' => $productId,
            'batch_id' => $batchId,
            'old_quantity' => $oldQuantity,
            'new_quantity' => $newQty,
            'reason' => $reason,
            'created_by' => $userId,
        ]);

        // Movement quantity should be the magnitude of the change (in base units)
        $movementQty = (int) abs($difference);

        // If direction not provided, infer from the sign of the difference
        $movementDirection = $direction ?? ($difference > 0 ? 'in' : 'out');

        $this->recordStockMovement(
            $productId,
            $batchId,
            'adjustment',
            $movementQty,
            $movementDirection,
            'adjustment',
            $adjustment->id,
            $userId
        );
    }
}
