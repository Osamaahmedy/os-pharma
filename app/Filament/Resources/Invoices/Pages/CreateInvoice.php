<?php

namespace App\Filament\Resources\Invoices\Pages;

use App\Filament\Resources\Invoices\InvoiceResource;
use App\Services\InventoryService;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Database\Eloquent\Model;

class CreateInvoice extends CreateRecord
{
    protected static string $resource = InvoiceResource::class;

    protected function handleRecordCreation(array $data): Model
    {
        $items = $data['items'] ?? [];
        $data['created_by'] = auth()->user()->id;
        $data['total_amount'] = 0;

        // Remove items from invoice data before creating the invoice record via service
        $invoiceData = $data;
        unset($invoiceData['items']);

        $service = app(InventoryService::class);

        $invoiceData['invoice_no'] = $service->generateSequentialNumber('INV', 'Invoice', 'invoice_no');

        // InventoryService::processSale will create the invoice, allocate batches and record movements
        $invoice = $service->processSale($invoiceData, $items, auth()->user()->id);

        return $invoice;
    }
}
