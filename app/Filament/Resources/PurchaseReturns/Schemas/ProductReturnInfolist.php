<?php

namespace App\Filament\Resources\PurchaseReturns\Schemas;

use Filament\Infolists\Components\RepeatableEntry;
use Filament\Infolists\Components\RepeatableEntry\TableColumn;
use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Schema;

class ProductReturnInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextEntry::make('reference_id')
                    ->state(fn ($record) => $record->purchase?->invoice_no)
                    ->label(__('fields.invoice_no')),
                TextEntry::make('total_amount')
                    ->numeric()
                    ->label(__('fields.total_amount')),
                TextEntry::make('return_date')
                    ->date('d M Y')
                    ->label(__('fields.return_date')),
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
                    ->label(__('fields.products'))
                    ->table([
                        TableColumn::make(__('fields.name')),
                        TableColumn::make(__('fields.batch_no')),
                        TableColumn::make(__('fields.quantity')),
                        TableColumn::make(__('fields.reason')),
                    ])
                    ->schema([
                        TextEntry::make('product.name'),
                        TextEntry::make('batch.batch_no'),
                        TextEntry::make('quantity'),
                        TextEntry::make('reason')
                    ])->columnSpanFull()
            ]);
    }
}
