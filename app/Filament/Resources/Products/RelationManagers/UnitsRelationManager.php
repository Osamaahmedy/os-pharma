<?php

namespace App\Filament\Resources\Products\RelationManagers;

use App\Models\Unit;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\CreateAction;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class UnitsRelationManager extends RelationManager
{
    protected static string $relationship = 'productUnits';

    public static function getModelLabel(): string
    {
        return __('app.unit');
    }

    public static function getPluralModelLabel(): string
    {
        return __('app.units');
    }

    public function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                Select::make('unit_id')
                    ->label(__('app.unit'))
                    ->options(Unit::query()->pluck('name', 'id'))
                    ->searchable()
                    ->preload()
                    ->required()
                    ->disabledOn('edit'), // لا تسمح بتغيير الوحدة عند التعديل
                TextInput::make('price')
                    ->required()
                    ->numeric()
                    ->label(__('fields.price')),
                TextInput::make('conversion_factor')
                    ->required()
                    ->numeric()
                    ->label(__('fields.conversion_factor')),
                Toggle::make('is_base')
                    ->label(__('fields.is_base_unit')),
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('unit.name')
            ->columns([
                TextColumn::make('unit.name')
                    ->searchable()
                    ->sortable()
                    ->label(__('fields.name')),
                TextColumn::make('unit.abbreviation')
                    ->searchable()
                    ->label(__('fields.abbreviation')),
                TextColumn::make('price')
                    ->sortable()
                    ->label(__('fields.price')),
                TextColumn::make('conversion_factor')
                    ->label(__('fields.conversion_factor')),
                IconColumn::make('is_base')
                    ->boolean()
                    ->label(__('fields.is_base_unit')),
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
            ->headerActions([
                CreateAction::make(),
            ])
            ->recordActions([
                EditAction::make(),
                DeleteAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
