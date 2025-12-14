<?php

namespace App\Filament\Resources\Products\Schemas;

use Filament\Infolists\Components\IconEntry;
use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Schema;

class ProductInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextEntry::make('category.name')
                    ->numeric()
                    ->placeholder('-')
                    ->label(__('fields.category')),
                TextEntry::make('manufacturer.name')
                    ->numeric()
                    ->placeholder('-')
                    ->label(__('fields.manufacturer')),
                TextEntry::make('name')
                    ->label(__('fields.name')),
                TextEntry::make('generic_name')
                    ->placeholder('-')
                    ->label(__('fields.generic_name')),
                TextEntry::make('barcode')
                    ->placeholder('-')
                    ->label(__('fields.barcode'))
                    ->view('filament.infolists.components.qr-code'),
                TextEntry::make('description')
                    ->placeholder('-')
                    ->columnSpanFull()
                    ->label(__('fields.description')),
                TextEntry::make('reorder_level')
                    ->numeric()
                    ->label(__('fields.reorder_level')),
                IconEntry::make('is_active')
                    ->boolean()
                    ->label(__('fields.active')),
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
