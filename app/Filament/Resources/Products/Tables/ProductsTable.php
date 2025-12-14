<?php

namespace App\Filament\Resources\Products\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class ProductsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('category.name')
                    ->numeric()
                    ->label(__('fields.category'))
                    ->sortable(),
                TextColumn::make('manufacturer.name')
                    ->numeric()
                    ->label(__('fields.manufacturer'))
                    ->sortable(),
                TextColumn::make('name')
                    ->label(__('fields.name'))
                    ->searchable(),
                TextColumn::make('generic_name')
                    ->label(__('fields.generic_name'))
                    ->searchable(),
                TextColumn::make('barcode')
                    ->label(__('fields.barcode'))
                    ->searchable(),
                TextColumn::make('reorder_level')
                    ->numeric()
                    ->label(__('fields.reorder_level'))
                    ->sortable(),
                IconColumn::make('is_active')
                    ->boolean()
                    ->label(__('fields.active')),
                TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->recordActions([
                ViewAction::make(),
                EditAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
