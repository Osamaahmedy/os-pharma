<?php

namespace App\Filament\Resources\Invoices\Pages;

use App\Filament\Resources\Invoices\InvoiceResource;
use Filament\Resources\Pages\EditRecord;
use Filament\Actions;

class EditInvoice extends EditRecord
{
    protected static string $resource = InvoiceResource::class;

    // ← مؤقت لتخزين الأيتمز
    protected array $invoiceItems = [];

    // ── عند تحميل البيانات للفورم ──
    protected function mutateFormDataBeforeFill(array $data): array
    {
        // حمّل الأيتمز من العلاقة وضعها في الفورم
        $data['items'] = $this->record->items->map(fn ($item) => [
            'product_id'        => $item->product_id,
            'unit_id'           => $item->unit_id,
            'quantity'          => $item->quantity,
            'quantity_base'     => $item->quantity_base,
            'unit_price'        => $item->unit_price,
            'base_price'        => $item->base_price,
            'total_price'       => $item->total_price,
            'remaining_quantity'=> 0,
        ])->toArray();

        return $data;
    }

    protected function mutateFormDataBeforeSave(array $data): array
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
     protected function getHeaderActions(): array
    {
        return [
            Actions\ViewAction::make(),
            Actions\DeleteAction::make(),

            Actions\Action::make('print')
                ->label('طباعة')
                ->icon('heroicon-o-printer')
                ->color('gray')
                ->url(fn (): string => route('print.invoice', $this->record->id))
                ->openUrlInNewTab(),
        ];
    }
}
