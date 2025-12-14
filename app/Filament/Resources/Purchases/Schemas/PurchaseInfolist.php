<?php

namespace App\Filament\Resources\Purchases\Schemas;

use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Schema;

class PurchaseInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextEntry::make('supplier.name')
                    ->placeholder('-')
                    ->label(__('fields.supplier')),
                TextEntry::make('invoice_no')
                    ->placeholder('-')
                    ->label(__('fields.invoice_no')),
                TextEntry::make('total_amount')
                    ->numeric()
                    ->label(__('fields.total_amount')),
                TextEntry::make('payment_status')
                    ->formatStateUsing(fn ($state) => __('fields.payment.'.$state))
                    ->badge()
                    ->label(__('fields.payment.status')),
                TextEntry::make('purchase_date')
                    ->date('d M Y')
                    ->label(__('fields.purchase_date')),
                TextEntry::make('createdBy.name')
                    ->label(__('fields.created_by')),
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
