<?php

namespace App\Filament\Resources\Roles\Schemas;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class RoleForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('name')
                    ->required()
                    ->label(__('fields.name')),
                Select::make('permissions')
                    ->multiple()
                    ->relationship('permissions', 'display_name')
                    ->preload()
                    ->required()
                    ->label(__('fields.permissions')),
            ]);
    }
}
