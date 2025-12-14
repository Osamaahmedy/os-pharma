<?php

namespace App\Filament\Resources\Invoices\Tables;

use App\Models\User;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Forms\Components\DatePicker;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Columns\Summarizers\Range;
use Filament\Tables\Columns\Summarizers\Sum;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;

class InvoicesTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('invoice_no')
                    ->searchable()
                    ->label(__('fields.invoice_no')),
                TextColumn::make('total_amount')
                    ->numeric()
                    ->sortable()
                    ->money('YER')
                    ->label(__('fields.total_amount'))
                    ->summarize(Sum::make()->money('YER')),
                TextColumn::make('discount')
                    ->numeric()
                    ->sortable()
                    ->money('YER')
                    ->label(__('fields.discount')),
                TextColumn::make('paid')
                    ->numeric()
                    ->sortable()
                    ->money('YER')
                    ->placeholder('-')
                    ->label(__('fields.paid')),
                TextColumn::make('payment_status')
                    ->badge()
                    ->formatStateUsing(fn ($state) => __('fields.payment.'.$state))
                    ->label(__('fields.payment.status'))
                    ->color(fn (string $state): string => match ($state) {
                        'paid' => 'success',
                        'unpaid' => 'danger',
                        'partial' => 'warning',
                        default => 'secondary',
                    }),
                TextColumn::make('invoice_date')
                    ->date('d M Y')
                    ->sortable()
                    ->label(__('fields.invoice_date'))
                    ->summarize(Range::make()->minimalDateTimeDifference()->label(__('fields.date_range'))),
                TextColumn::make('createdBy.name')
                    ->numeric()
                    ->sortable()
                    ->label(__('fields.created_by')),
                TextColumn::make('created_at')
                    ->date('d M Y')
                    ->sortable()
                    ->label(__('fields.created_at'))
                    ->toggleable(isToggledHiddenByDefault: true),
                TextColumn::make('updated_at')
                    ->date('d M Y')
                    ->sortable()
                    ->label(__('fields.updated_at'))
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->defaultSort('created_at', 'desc')
            ->filters([
                Filter::make('date_range')
                    ->label(__('fields.date'))
                    ->schema([
                        DatePicker::make('from')->label(__('fields.from_date')),
                        DatePicker::make('to')->label(__('fields.to_date')),
                    ])
                    ->query(function (Builder $query, $data) {
                        return $query
                            ->when($data['from'], fn (Builder $q, $date) => $q->whereDate('invoice_date', '>=', $date))
                            ->when($data['to'], fn (Builder $q, $date) => $q->whereDate('invoice_date', '<=', $date));
                    }),

                SelectFilter::make('payment_status')
                    ->label(__('fields.payment.status'))
                    ->options([
                        'paid' => __('fields.payment.paid'),
                        'unpaid' => __('fields.payment.unpaid'),
                        'partial' => __('fields.payment.partial'),
                    ]),

                SelectFilter::make('created_by')
                    ->label(__('fields.created_by'))
                    ->options(User::pluck('name', 'id')),
            ])
            ->recordActions([
                ViewAction::make(),
                // EditAction::make(),
            ])
            ->toolbarActions([
                // BulkActionGroup::make([
                //     DeleteBulkAction::make(),
                // ]),
            ]);
    }
}
