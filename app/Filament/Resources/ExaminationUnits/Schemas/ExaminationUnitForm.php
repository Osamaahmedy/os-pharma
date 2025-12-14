<?php

namespace App\Filament\Resources\ExaminationUnits\Schemas;

use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class ExaminationUnitForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('name')
                    ->required(),
            ]);
    }
}
