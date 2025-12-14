<?php

namespace App\Filament\Resources\PurchaseDebts\RelationManagers;

use App\Models\Purchase;
use App\Models\SupplierAccountTransaction;
use Filament\Actions\CreateAction;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class TransactionRelationManager extends RelationManager
{
    protected static string $relationship = 'transactions';

    public static function getModelLabel(): string
    {
        return __('app.transaction');
    }

    public static function getPluralModelLabel(): string
    {
        return __('app.transactions');
    }

    public function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                Select::make('purchase_id')
                    ->options(function ($livewire) {
                        return Purchase::where('supplier_id', $livewire->ownerRecord->supplier_id)
                            ->latest()
                            ->pluck('invoice_no', 'id');
                    })
                    ->searchable()
                    ->required()
                    ->label(__('fields.invoice_no')),
                Select::make('type')
                    ->options(['payment' => __('fields.payment.payment')])
                    ->default('payment')
                    ->required()
                    ->label(__('fields.type')),
                TextInput::make('amount')
                    ->required()
                    ->label(__('fields.amount')),
                TextInput::make('description')
                    ->label(__('fields.note')),
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('name')
            ->columns([
                TextColumn::make('purchase.invoice_no')
                    ->sortable()
                    ->searchable()
                    ->label(__('fields.invoice_no')),
                TextColumn::make('type')
                    ->sortable()
                    ->formatStateUsing(fn ($state) => __('fields.payment.'.$state))
                    ->icon(fn ($state) => match ($state) {
                        'payment' => 'heroicon-o-currency-dollar',
                        'debt' => 'heroicon-o-exclamation-circle',
                        default => 'heroicon-o-question-mark-circle',
                    })
                    ->iconColor(fn ($state) => match ($state) {
                        'debt' => 'danger',
                        'payment' => 'success',
                        default => 'gray',
                    })
                    ->label(__('fields.type')),
                TextColumn::make('amount')
                    ->sortable()
                    ->formatStateUsing(fn ($state) => number_format($state, thousands_separator: ','))
                    ->label(__('fields.amount')),
                TextColumn::make('description')
                    ->label(__('fields.note'))
                    ->placeholder('-'),
            ])
            ->defaultSort('created_at', 'desc')
            ->headerActions([
                CreateAction::make()
                    ->after(function ($record) {
                        if ($record->type === 'payment') {
                            $record->account->decrement('balance', $record->amount);

                            // Make the purchase as paid
                            $totalPayment = SupplierAccountTransaction::where('type', 'payment')->where('purchase_id', $record->purchase_id)->sum('amount');
                            $purchase = Purchase::find($record->purchase_id);

                            if ($totalPayment >= $purchase->total_amount) {
                                $purchase->update(['payment_status' => 'paid']);
                            }
                        }
                        if ($record->type === 'debt') {
                            $record->account->increment('balance', $record->amount);
                        }
                    }),
            ]);
    }

    protected function getTableHeading(): ?string
    {
        return __('app.transactions');
    }
}