<?php

namespace App\Filament\Resources\PurchaseDebts;

use App\Filament\Resources\PurchaseDebts\Pages\EditPurchaseDebt;
use App\Filament\Resources\PurchaseDebts\Pages\ManagePurchaseDebts;
use App\Filament\Resources\PurchaseDebts\Pages\ViewPurchaseDebts;
use App\Filament\Resources\PurchaseDebts\RelationManagers\TransactionRelationManager;
use App\Filament\Resources\PurchaseDebts\Schemas\PurchaseDebtInfolist;
use App\Models\SupplierAccount;
use BackedEnum;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Forms\Components\TextInput;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use UnitEnum;

class PurchaseDebtResource extends Resource
{
    public static function getModelLabel(): string
    {
        return __('app.supplier_debt');
    }

    public static function getPluralModelLabel(): string
    {
        return __('app.supplier_debts');
    }

    public static function getNavigationGroup(): string|UnitEnum|null
    {
        return __('app.purchases');
    }

    protected static ?string $model = SupplierAccount::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedBanknotes;

    protected static ?string $recordTitleAttribute = 'PurchaseDebt';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('supplier_id')
                    ->formatStateUsing(fn ($record) => $record->supplier->name)
                    ->disabled()
                    ->label(__('fields.supplier')),
            ]);
    }

    public static function infolist(Schema $schema): Schema
    {
        return PurchaseDebtInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('PurchaseDebt')
            ->columns([
                TextColumn::make('supplier.name')
                    ->searchable()
                    ->sortable()
                    ->label(__('fields.name')),
                TextColumn::make('balance')
                    ->sortable()
                    ->formatStateUsing(fn ($state) => number_format($state, thousands_separator: ','))
                    ->label(__('fields.amount')),
            ])
            ->defaultSort('created_at', 'desc')
            ->filters([
                //
            ])
            ->recordActions([
                ViewAction::make(),
                EditAction::make(),
                // DeleteAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    // DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            TransactionRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => ManagePurchaseDebts::route('/'),
            'view' => ViewPurchaseDebts::route('/{record}'),
            'edit' => EditPurchaseDebt::route('/{record}/edit'),
        ];
    }
}
