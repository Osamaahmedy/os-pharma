<?php

namespace App\Filament\Resources\EmployeeDebts;

use App\Filament\Resources\EmployeeDebts\Pages\ManageEmployeeDebts;
use App\Filament\Resources\EmployeeDebts\Pages\ViewEmployeeDebt;
use App\Filament\Resources\EmployeeDebts\RelationManagers\TransactionRelationManager;
use App\Filament\Resources\EmployeeDebts\Schemas\EmployeeDebtInfolist;
use App\Models\EmployeeAccount;
use BackedEnum;
use Filament\Actions\ViewAction;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use UnitEnum;

class EmployeeDebtResource extends Resource
{
    protected static ?string $model = EmployeeAccount::class;
    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedBanknotes;

    public static function getModelLabel(): string
    {
        return __('app.employee_debt');
    }

    public static function getPluralModelLabel(): string
    {
        return __('app.employee_debts');
    }

    public static function getNavigationGroup(): string|UnitEnum|null
    {
        return __('app.hr');
    }

    public static function infolist(Schema $schema): Schema
    {
        return EmployeeDebtInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('employee.name')
                    ->searchable()
                    ->sortable()
                    ->label(__('fields.employee')),

                TextColumn::make('balance')
    ->sortable()
    ->formatStateUsing(function ($state) {
        $amount = $state ?? 0;
        $sign   = $amount > 0 ? '-' : ($amount < 0 ? '+' : '');
        return $sign . number_format(abs($amount), 2, '.', ',') . ' ' . config('app.currency', 'ر.ي');
    })
    ->color(fn ($state) => match(true) {
        ($state ?? 0) > 0 => 'danger',   // عليه دين
        ($state ?? 0) < 0 => 'success',  // دفع زيادة
        default           => 'gray',     // صفر
    })
    ->label(__('fields.balance')),
            ])
            ->defaultSort('balance', 'desc')
            ->recordActions([
                ViewAction::make(),
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
            'index' => ManageEmployeeDebts::route('/'),
            'view'  => ViewEmployeeDebt::route('/{record}'),
        ];
    }
}
