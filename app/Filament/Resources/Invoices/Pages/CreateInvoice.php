<?php

namespace App\Filament\Resources\Invoices\Pages;

use App\Filament\Resources\Invoices\InvoiceResource;
use Filament\Resources\Pages\CreateRecord;

class CreateInvoice extends CreateRecord
{
    protected static string $resource = InvoiceResource::class;

    protected array $invoiceItems = [];

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $this->invoiceItems = $data['items'] ?? [];
        unset($data['items']);
        return $data;
    }

   protected function afterSave(): void
{
    $this->record->items()->delete();

    foreach ($this->invoiceItems as $item) {
        $quantity   = (float) ($item['quantity']   ?? 0);
        $unitPrice  = (float) ($item['unit_price']  ?? 0);
        $basePrice  = (float) ($item['base_price']  ?? 0);

        // احسب total_price بدل ما تعتمد على القيمة القادمة من الفورم
        $totalPrice = $quantity * $unitPrice;

        $this->record->items()->create([
            'product_id'    => $item['product_id'],
            'unit_id'       => $item['unit_id'],
            'quantity'      => $quantity,
            'quantity_base' => (float) ($item['quantity_base'] ?? 0),
            'unit_price'    => $unitPrice,
            'base_price'    => $basePrice,
            'total_price'   => $totalPrice,
        ]);
    }
}
}
