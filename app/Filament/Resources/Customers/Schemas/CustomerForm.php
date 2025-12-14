<?php

namespace App\Filament\Resources\Customers\Schemas;

use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class CustomerForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('name')
                    ->required()
                    ->label(__('fields.name')),
                TextInput::make('email')
                    ->label(__('fields.email_address'))
                    ->email(),
                TextInput::make('phone')
                    ->tel()
                    ->label(__('fields.phone')),
                TextInput::make('address')
                    ->label(__('fields.address')),
            ]);
    }
}
