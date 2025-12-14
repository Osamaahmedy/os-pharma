<?php

namespace App\Filament\Resources\Products\Schemas;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\Toggle;
use Filament\Schemas\Schema;

class ProductForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Select::make('category_id')
                    ->relationship('category', 'name')
                    ->label(__('fields.category')),
                Select::make('manufacturer_id')
                    ->relationship('manufacturer', 'name')
                    ->label(__('fields.manufacturer')),
                TextInput::make('name')
                    ->required()
                    ->label(__('fields.name')),
                TextInput::make('generic_name')
                    ->label(__('fields.generic_name')),
                TextInput::make('barcode')
                    ->unique('products', 'barcode')
                    ->label(__('fields.barcode')),
                Textarea::make('description')
                    ->columnSpanFull()
                    ->label(__('fields.description')),
                TextInput::make('reorder_level')
                    ->required()
                    ->numeric()
                    ->default(0)
                    ->label(__('fields.reorder_level')),
                Toggle::make('is_active')
                    ->required()
                    ->label(__('fields.active')),
            ]);
    }
}
