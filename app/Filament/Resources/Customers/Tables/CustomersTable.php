<?php

namespace App\Filament\Resources\Customers\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class CustomersTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->modifyQueryUsing(fn ($query) => $query->with('account')) // ✅ eager load
            ->columns([
                TextColumn::make('name')
                    ->searchable()
                    ->label(__('fields.name')),

                TextColumn::make('email')
                    ->searchable()
                    ->label(__('fields.email_address')),

                TextColumn::make('phone')
                    ->searchable()
                    ->label(__('fields.phone')),

                TextColumn::make('address')
                    ->searchable()
                    ->label(__('fields.address')),

                // ✅ البالانس
                TextColumn::make('account.balance')
                    ->label('الرصيد المديون')
                    ->sortable()
                    ->default(0)
                    ->formatStateUsing(fn ($state) =>
                        number_format((float) $state, 2, '.', ',') . ' ' . config('app.currency', 'ر.ي')
                    )
                    ->color(fn ($state) => (float) $state > 0 ? 'danger' : 'success')
                    ->weight('bold'),
            ])
            ->filters([])
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
