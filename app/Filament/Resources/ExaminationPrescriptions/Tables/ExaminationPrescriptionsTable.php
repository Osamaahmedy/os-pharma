<?php

namespace App\Filament\Resources\ExaminationPrescriptions\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Filament\Actions\ViewAction;

class ExaminationPrescriptionsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([

                TextColumn::make('patient_name')->label('المريض'),
                TextColumn::make('age')->label('العمر'),
                TextColumn::make('gender')->label('الجنس'),
                TextColumn::make('items_count')->counts('items')->label('عدد الفحوص'),

            ])
            ->filters([
                //
            ])
            ->recordActions([
                EditAction::make(),
                ViewAction::make(),

            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
