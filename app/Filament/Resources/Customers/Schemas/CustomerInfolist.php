<?php

namespace App\Filament\Resources\Customers\Schemas;

use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Schema;

class CustomerInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextEntry::make('name')
                    ->label(__('fields.name')),
                TextEntry::make('email')
                    ->label(__('fields.email_address')),
                TextEntry::make('phone')
                    ->label(__('fields.phone')),
                TextEntry::make('address')
                    ->label(__('fields.address')),
                TextEntry::make('created_at')
                    ->date('d M Y')
                    ->placeholder('-')
                    ->label(__('fields.created_at')),
            ]);
    }
}
