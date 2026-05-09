<?php

namespace App\Filament\Resources\EmployeeDebts\RelationManagers;

use Filament\Actions\CreateAction;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class TransactionRelationManager extends RelationManager
{
    protected static string $relationship = 'transactions';

    public static function getTitle(\Illuminate\Database\Eloquent\Model $ownerRecord, string $pageClass): string
    {
        return __('app.transactions');
    }

    public function form(Schema $schema): Schema
    {
        return $schema->components([
            Select::make('type')
                ->label(__('fields.type'))
                ->options([
                    'withdrawal' => __('fields.withdrawal'),
                    'payment'    => __('fields.payment'),
                ])
                ->required()
                ->live(),

            TextInput::make('amount')
                ->label(__('fields.amount'))
                ->numeric()
                ->required()
                ->minValue(0.01)
                ->prefix(config('app.currency', 'ر.ي')),

            Textarea::make('description')
                ->label(__('fields.description'))
                ->nullable()
                ->rows(2),
        ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->emptyStateHeading(__('app.no_transactions'))
            ->emptyStateDescription(__('app.add_transaction_hint'))
            ->emptyStateIcon('heroicon-o-banknotes')
            ->columns([
                TextColumn::make('created_at')
                    ->date('d M Y')
                    ->sortable()
                    ->label(__('fields.date')),

                TextColumn::make('type')
                    ->badge()
                    ->formatStateUsing(fn ($state) => match ($state) {
                        'withdrawal' => __('fields.withdrawal'),
                        'payment'    => __('fields.payment.payment'),
                        default      => $state,
                    })
                    ->color(fn ($state) => match ($state) {
                        'withdrawal' => 'danger',
                        'payment'    => 'success',
                        default      => 'gray',
                    })
                    ->label(__('fields.type')),

                TextColumn::make('amount')
                    ->formatStateUsing(
                        fn ($state) => config('app.currency', 'ر.ي') . "\u{00A0}" . number_format((float) $state, 2, '.', ',')
                    )
                    ->label(__('fields.amount'))
                    ->alignEnd(),

                TextColumn::make('description')
                    ->placeholder('-')
                    ->label(__('fields.description')),
            ])
            ->defaultSort('created_at', 'desc')
            ->toolbarActions([
                CreateAction::make()
                    ->label(__('app.add_transaction'))
                    ->after(function (array $data) {
                        $account = $this->getOwnerRecord();
                        if ($data['type'] === 'withdrawal') {
                            $account->increment('balance', $data['amount']);
                        } else {
                            $account->decrement('balance', $data['amount']);
                        }
                    }),
            ]);
    }
}
