<?php

namespace App\Filament\Resources\SalesRepresentatives;

use App\Filament\Resources\SalesRepresentatives\Pages\ManageSalesRepresentatives;
use App\Models\SalesRepresentative;
use BackedEnum;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Infolists\Components\TextEntry;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use UnitEnum;

class SalesRepresentativeResource extends Resource
{
    public static function getModelLabel(): string
    {
        return __('app.sales_representative');
    }

    public static function getPluralModelLabel(): string
    {
        return __('app.sales_representatives');
    }

    public static function getNavigationGroup(): string|UnitEnum|null
    {
        return __('app.purchases');
    }

    protected static ?string $model = SalesRepresentative::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedIdentification;

    protected static ?string $recordTitleAttribute = 'SalesRepresentative';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('name')
                    ->required()
                    ->maxLength(255)
                    ->label(__('fields.name')),
                Select::make('supplier_id')
                    ->relationship('supplier', 'name')
                    ->searchable()
                    ->preload()
                    ->required()
                    ->label(__('fields.supplier')),
                TextInput::make('email')
                    ->email()
                    ->label(__('fields.email_address')),
                TextInput::make('phone')
                    ->label(__('fields.phone')),
                TextInput::make('address')
                    ->label(__('fields.address')),
            ]);
    }

    public static function infolist(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextEntry::make('name')
                    ->label(__('fields.name')),
                TextEntry::make('supplier.name')
                    ->label(__('fields.supplier')),
                TextEntry::make('email')
                    ->label(__('fields.email_address')),
                TextEntry::make('phone')
                    ->label(__('fields.phone')),
                TextEntry::make('address')
                    ->label(__('fields.address')),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('SalesRepresentative')
            ->columns([
                TextColumn::make('name')
                    ->searchable()
                    ->sortable()
                    ->label(__('fields.name')),
                TextColumn::make('supplier.name')
                    ->sortable()
                    ->label(__('fields.supplier')),
                TextColumn::make('phone')
                    ->label(__('fields.phone')),
                TextColumn::make('email')
                    ->label(__('fields.email_address')),
            ])
            ->defaultSort('created_at', 'desc')
            ->filters([
                //
            ])
            ->recordActions([
                ViewAction::make(),
                EditAction::make(),
                DeleteAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => ManageSalesRepresentatives::route('/'),
        ];
    }
}
