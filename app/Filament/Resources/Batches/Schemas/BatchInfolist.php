<?php

namespace App\Filament\Resources\Batches\Schemas;

use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Schema;

class BatchInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextEntry::make('product.name')
                    ->numeric()
                    ->label(__('fields.product')),
                TextEntry::make('supplier.name')
                    ->numeric()
                    ->placeholder('-')
                    ->label(__('fields.supplier')),
                TextEntry::make('batch_no')
                    ->label(__('fields.batch_no')),
                TextEntry::make('expiry_date')
                    ->date('d M Y')
                    ->placeholder('-')
                    ->label(__('fields.expiry_date')),
                TextEntry::make('purchase_price_per_base')
                    ->numeric()
                    ->label(__('fields.purchase_price_per_base')),
                // TextEntry::make('sale_price_per_base')
                //     ->numeric()
                //     ->label(__('fields.sale_price_per_base')),
                TextEntry::make('initial_quantity')
                    ->numeric()
                    ->label(__('fields.quantity')),
                TextEntry::make('current_quantity')
                    ->numeric()
                    ->label(__('fields.current_quantity')),
                TextEntry::make('created_at')
                    ->date('d M Y')
                    ->placeholder('-')
                    ->label(__('fields.created_at')),
                TextEntry::make('updated_at')
                    ->date('d M Y')
                    ->placeholder('-')
                    ->label(__('fields.updated_at')),
            ]);
    }
}
