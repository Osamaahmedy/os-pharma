<?php

namespace App\Filament\Resources\Suppliers;

use App\Filament\Resources\Suppliers\Pages\ManageSuppliers;
use BackedEnum;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Infolists\Components\RepeatableEntry;
use Filament\Infolists\Components\RepeatableEntry\TableColumn;
use Filament\Infolists\Components\TextEntry;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use UnitEnum;

class SupplierResource extends Resource
{
    public static function getModelLabel(): string
    {
        return __('app.supplier');
    }

    public static function getPluralModelLabel(): string
    {
        return __('app.suppliers');
    }

    public static function getNavigationGroup(): string|UnitEnum|null
    {
        return __('app.purchases');
    }

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedTruck;

    protected static ?string $recordTitleAttribute = 'Supplier';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('name')
                    ->required()
                    ->label(__('fields.name')),
                TextInput::make('phone')
                    ->tel()
                    ->label(__('fields.phone')),
                TextInput::make('email')
                    ->email()
                    ->label(__('fields.email_address')),
                Textarea::make('address')
                    ->columnSpanFull()
                    ->label(__('fields.address')),
            ]);
    }

    public static function infolist(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextEntry::make('name')
                    ->label(__('fields.name')),
                TextEntry::make('phone')
                    ->label(__('fields.phone')),
                TextEntry::make('email')
                    ->label(__('fields.email_address')),
                TextEntry::make('address')
                    ->label(__('fields.address')),
                RepeatableEntry::make('salesRepresentatives')
                    ->label(__('app.sales_representatives'))
                    ->table([
                        TableColumn::make(__('fields.name')),
                        TableColumn::make(__('fields.email_address')),
                        TableColumn::make(__('fields.phone')),
                    ])
                    ->schema([
                        TextEntry::make('name'),
                        TextEntry::make('email'),
                        TextEntry::make('address'),
                    ])
                    ->columnSpanFull(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('Supplier')
            ->columns([
                TextColumn::make('name')
                    ->label(__('fields.name'))
                    ->searchable(),
                TextColumn::make('phone')
                    ->label(__('fields.phone'))
                    ->searchable(),
                TextColumn::make('email')
                    ->label(__('fields.email_address'))
                    ->searchable(),
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
            'index' => ManageSuppliers::route('/'),
        ];
    }
}
