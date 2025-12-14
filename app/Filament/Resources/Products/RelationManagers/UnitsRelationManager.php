<?php

namespace App\Filament\Resources\Products\RelationManagers;

use Filament\Actions\AttachAction;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\CreateAction;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\DetachAction;
use Filament\Actions\DetachBulkAction;
use Filament\Actions\EditAction;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ToggleColumn;
use Filament\Tables\Table;

class UnitsRelationManager extends RelationManager
{
    protected static string $relationship = 'units';

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
                TextInput::make('name')
                    ->required()
                    ->label(__('fields.name')),
                TextInput::make('abbreviation')
                    ->required()
                    ->label(__('fields.abbreviation')),
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('name')
            ->columns([
                TextColumn::make('name')
                    ->searchable()
                    ->label(__('fields.name')),
                TextColumn::make('abbreviation')
                    ->searchable()
                    ->label(__('fields.abbreviation')),
                TextColumn::make('price')
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
                // CreateAction::make(),
                AttachAction::make()
                    ->schema(fn (AttachAction $action): array => [
                        $action->getRecordSelect()->searchable(),
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
                    ]),
            ])
            ->recordActions([
                EditAction::make()
                    ->schema(fn (): array => [
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
                    ]),
                DetachAction::make(),
                DeleteAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DetachBulkAction::make(),
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
