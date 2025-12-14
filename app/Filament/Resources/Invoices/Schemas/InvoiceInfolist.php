<?php

namespace App\Filament\Resources\Invoices\Schemas;

use Filament\Infolists\Components\RepeatableEntry\TableColumn;
use Filament\Infolists\Components\RepeatableEntry;
use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Schema;

class InvoiceInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextEntry::make('invoice_no')
                    ->label(__('fields.invoice_no')),
                TextEntry::make('total_amount')
                    ->numeric()
                    ->label(__('fields.total_amount')),
                TextEntry::make('discount')
                    ->numeric()
                    ->label(__('fields.discount')),
                TextEntry::make('paid')
                    ->numeric()
                    ->label(__('fields.paid')),
                TextEntry::make('payment_status')
                    ->badge()
                    ->label(__('fields.payment.status')),
                TextEntry::make('invoice_date')
                    ->date('d M Y')
                    ->label(__('fields.invoice_date')),
                TextEntry::make('createdBy.name')
                    ->numeric()
                    ->label(__('fields.created_by')),
                TextEntry::make('created_at')
                    ->date('d M Y')
                    ->placeholder('-')
                    ->label(__('fields.created_at')),
                TextEntry::make('updated_at')
                    ->date('d M Y')
                    ->placeholder('-')
                    ->label(__('fields.updated_at')),
                RepeatableEntry::make('items')
                    ->label(__('fields.invoice_items'))
                    ->table([
                        TableColumn::make(__('fields.name')),
                        TableColumn::make(__('fields.quantity')),
                        TableColumn::make(__('fields.unit')),
                        TableColumn::make(__('fields.unit_price')),
                        TableColumn::make(__('fields.total_price')),
                    ])
                    ->schema([
                        TextEntry::make('product.name'),
                        TextEntry::make('quantity'),
                        TextEntry::make('unit.unit.name'),
                        TextEntry::make('unit_price'),
                        TextEntry::make('total_price'),
                    ])->columnSpanFull()
            ]);
    }
}
