<?php

namespace App\Filament\Resources\Batches\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class BatchesTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('product.name')
                    ->numeric()
                    ->sortable()
                    ->label(__('fields.product')),
                TextColumn::make('supplier.name')
                    ->numeric()
                    ->sortable()
                    ->label(__('fields.supplier')),
                TextColumn::make('batch_no')
                    ->searchable()
                    ->label(__('fields.batch_no')),
                TextColumn::make('expiry_date')
                    ->date('d M Y')
                    ->sortable()
                    ->label(__('fields.expiry_date')),
                TextColumn::make('purchase_price_per_base')
                    ->numeric()
                    ->sortable()
                    ->label(__('fields.purchase_price_per_base')),
                // TextColumn::make('sale_price_per_base')
                //     ->numeric()
                //     ->sortable()
                //     ->label(__('fields.sale_price_per_base')),
                TextColumn::make('initial_quantity')
                    ->numeric()
                    ->sortable()
                    ->label(__('fields.quantity')),
                TextColumn::make('current_quantity')
                    ->numeric()
                    ->sortable()
                    ->label(__('fields.current_quantity')),
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
                // BulkActionGroup::make([
                //     DeleteBulkAction::make(),
                // ]),
            ]);
    }
}
