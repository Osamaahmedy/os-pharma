<?php

namespace App\Filament\Resources\ExaminationDepartments\Schemas;

use Filament\Schemas\Schema;
use Filament\Forms\Components\TextInput;

class ExaminationDepartmentForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                 TextInput::make('name')
                ->label('اسم القسم')
                ->required()
                ->maxLength(255),
            ]);
    }
}
