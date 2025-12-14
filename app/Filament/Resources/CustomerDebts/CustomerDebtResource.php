<?php

namespace App\Filament\Resources\CustomerDebts;

use App\Filament\Resources\CustomerDebts\Pages\ManageCustomerDebts;
use App\Models\CustomerAccountTransaction;
use App\Models\Invoice;
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

class CustomerDebtResource extends Resource
{
    public static function getModelLabel(): string
    {
        return __('app.customer_debt');
    }

    public static function getPluralModelLabel(): string
    {
        return __('app.customer_debts');
    }

    public static function getNavigationGroup(): string|UnitEnum|null
    {
        return __('app.sales');
    }

    protected static ?string $model = CustomerAccountTransaction::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedCurrencyDollar;

    protected static ?string $recordTitleAttribute = 'CustomerDebt';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('customer_name')
                    ->disabled()
                    ->label(__('fields.customer_name')),
                TextInput::make('amount')
                    ->required()
                    ->label(__('fields.amount')),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('CustomerDebt')
            ->columns([
                TextColumn::make('customer_name')
                    ->searchable()
                    ->label(__('fields.customer_name'))
                    ->placeholder('-'),
                TextColumn::make('invoice.invoice_no')
                    ->searchable()
                    ->sortable()
                    ->label(__('fields.invoice_no')),
                TextColumn::make('amount')
                    ->sortable()
                    ->label(__('fields.amount')),
                TextColumn::make('invoice.note')
                    ->label(__('fields.note')),
            ])
            ->filters([
                //
            ])
            ->recordActions([
                // ViewAction::make(),
                EditAction::make()
                    ->after(function ($record) {
                        if ($record->amount == 0) {
                            Invoice::find($record->invoice_id)?->update([
                                'payment_status' => 'paid',
                                'paid' => null,
                            ]);
                            $record->delete();
                        }
                    }),
                DeleteAction::make()
                    ->after(function ($record) {
                        Invoice::find($record->invoice_id)?->update([
                            'payment_status' => 'paid',
                            'paid' => null,
                        ]);
                    }),
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
            'index' => ManageCustomerDebts::route('/'),
        ];
    }
}
