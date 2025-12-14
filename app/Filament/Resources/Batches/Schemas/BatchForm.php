<?php

namespace App\Filament\Resources\Batches\Schemas;

use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class BatchForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                // Select::make('product_id')
                //     ->relationship('product', 'name')
                //     ->required()
                //     ->label(__('fields.product')),
                // Select::make('supplier_id')
                //     ->relationship('supplier', 'name')
                //     ->label(__('fields.supplier')),
                TextInput::make('batch_no')
                    ->required()
                    ->label(__('fields.batch_no')),
                DatePicker::make('expiry_date')
                    ->label(__('fields.expiry_date')),
                // TextInput::make('purchase_price_per_base')
                //     ->required()
                //     ->numeric()
                //     ->label(__('fields.purchase_price_per_base')),
                // TextInput::make('sale_price_per_base')
                //     ->required()
                //     ->numeric()
                //     ->label(__('fields.sale_price_per_base')),
                // TextInput::make('initial_quantity')
                //     ->required()
                //     ->numeric()
                //     ->label(__('fields.quantity')),
            ]);
    }
}
