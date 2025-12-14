<?php

namespace App\Filament\Resources\PurchaseDebts\Schemas;

use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Schema;

class PurchaseDebtInfolist
{
    public static function configure(Schema $schema)
    {
        return $schema
            ->components([
                TextEntry::make('supplier.name')
                    ->label(__('fields.supplier')),
                TextEntry::make('balance')
                    ->formatStateUsing(fn ($state) => number_format($state, thousands_separator: ','))
                    ->label(__('fields.amount')),
            ]);
    }
}