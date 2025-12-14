<?php

namespace App\Filament\Resources\Examinations\Schemas;

use Filament\Forms;
use Filament\Schemas\Schema;
use App\Models\ExaminationUnit;
use App\Models\ExaminationDepartment;

class ExaminationForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema->schema([

            Forms\Components\TextInput::make('scientific_name')
                ->label('الاسم العلمي للفحص')
                ->required(),

            Forms\Components\TextInput::make('normal_ratio')
                ->label('النسبة الطبيعية')
                ->maxLength(255),

            Forms\Components\Select::make('unit_id')
                ->label('وحدة الفحص')
                ->relationship('unit', 'name')
                ->searchable()
                ->preload()
                ->required(),

            Forms\Components\Select::make('department_id')
                ->label('قسم الفحص')
                ->relationship('department', 'name')
                ->searchable()
                ->preload()
                ->required(),

        ]);
    }
}
