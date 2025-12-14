<?php

namespace App\Filament\Resources\Examinations\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Tables;
use Filament\Tables\Table;

class ExaminationsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->label('#')
                    ->sortable(),

                Tables\Columns\TextColumn::make('scientific_name')
                    ->label('الاسم العلمي')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('normal_ratio')
                    ->label('النسبة الطبيعية'),

                Tables\Columns\TextColumn::make('unit.name')
                    ->label('الوحدة'),

                Tables\Columns\TextColumn::make('department.name')
                    ->label('القسم'),

                Tables\Columns\TextColumn::make('created_at')
                    ->label('تاريخ الإنشاء')
                    ->date(),
            ])
            ->filters([
                //
            ])
            ->recordActions([
                EditAction::make(),

            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
