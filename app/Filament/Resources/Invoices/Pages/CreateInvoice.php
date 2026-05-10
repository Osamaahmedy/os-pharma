<?php

namespace App\Filament\Resources\Invoices\Pages;

use App\Filament\Resources\Invoices\InvoiceResource;
use App\Models\CustomerAccount;
use App\Models\CustomerAccountTransaction;
use App\Models\Invoice;
use Filament\Resources\Pages\CreateRecord;

class CreateInvoice extends CreateRecord
{
    protected static string $resource = InvoiceResource::class;
    protected array $invoiceItems = [];

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $this->invoiceItems = $data['items'] ?? [];
        unset($data['items']);

        $data['created_by'] = auth()->id();
        $data['invoice_no'] = 'TEMP-' . uniqid();

        // ✅ تعبئة customer_name تلقائياً من العميل المختار
        if (! empty($data['customer_id'])) {
            $data['customer_name'] = \App\Models\Customer::find($data['customer_id'])?->name;
        }

        foreach ($this->invoiceItems as $item) {
            $productId    = $item['product_id'];
            $quantityBase = (float) ($item['quantity_base'] ?? $item['quantity'] ?? 0);
            $available    = \App\Models\Batch::where('product_id', $productId)->sum('current_quantity');

            if ($quantityBase > $available) {
                $productName = \App\Models\Product::find($productId)?->name ?? 'المنتج';

                \Filament\Notifications\Notification::make()
                    ->title('كمية غير كافية')
                    ->body("الكمية المتاحة لـ ({$productName}) هي {$available} فقط.")
                    ->danger()
                    ->persistent()
                    ->send();

                $this->halt();
            }
        }

        return $data;
    }

    protected function afterCreate(): void
    {
        $this->record->updateQuietly([
            'invoice_no' => sprintf('INV-%s-%05d', now()->format('Y'), $this->record->id),
        ]);

        foreach ($this->invoiceItems as $item) {
            $quantity     = (float) ($item['quantity']      ?? 0);
            $quantityBase = (float) ($item['quantity_base'] ?? $quantity);
            $unitPrice    = (float) ($item['unit_price']    ?? 0);

            $this->record->items()->create([
                'product_id'    => $item['product_id'],
                'unit_id'       => $item['unit_id'],
                'quantity'      => $quantity,
                'quantity_base' => $quantityBase,
                'unit_price'    => $unitPrice,
                'base_price'    => (float) ($item['base_price'] ?? 0),
                'total_price'   => $quantity * $unitPrice,
            ]);

            $remaining = $quantityBase;
            $batches   = \App\Models\Batch::where('product_id', $item['product_id'])
                ->where('current_quantity', '>', 0)
                ->orderBy('expiry_date')
                ->get();

            foreach ($batches as $batch) {
                if ($remaining <= 0) break;
                $deduct = min($batch->current_quantity, $remaining);
                $batch->decrement('current_quantity', $deduct);
                $remaining -= $deduct;
            }
        }

        $this->settleCustomerDebt($this->record);
    }

    private function settleCustomerDebt(Invoice $invoice): void
    {
        if ($invoice->payment_status === 'paid') return;
        if (blank($invoice->customer_name)) return;

        $debtAmount = match ($invoice->payment_status) {
            'partial' => max($invoice->total_amount - (float) ($invoice->paid ?? 0), 0),
            default   => (float) $invoice->total_amount,
        };

        if ($debtAmount <= 0) return;

        // ✅ ربط الدين بحساب العميل
        $account = CustomerAccount::firstOrCreate(
            ['customer_id' => $invoice->customer_id],
            ['balance'     => 0]
        );

        CustomerAccountTransaction::create([
            'customer_account_id' => $account->id,
            'invoice_id'          => $invoice->id,
            'customer_name'       => $invoice->customer_name,
            'amount'              => $debtAmount,
            'type'                => 'debt',
            'description'         => 'دين فاتورة ' . $invoice->invoice_no,
        ]);

        // ✅ تحديث رصيد الحساب
        $account->increment('balance', $debtAmount);
    }
}
