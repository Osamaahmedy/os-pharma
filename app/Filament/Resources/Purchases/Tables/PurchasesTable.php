<?php

namespace App\Filament\Resources\Purchases\Tables;

use App\Models\User;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Forms\Components\DatePicker;
use Filament\Tables\Columns\Summarizers\Range;
use Filament\Tables\Columns\Summarizers\Sum;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;

class PurchasesTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('supplier.name')
                    ->sortable()
                    ->placeholder('-')
                    ->label(__('fields.supplier')),
                TextColumn::make('invoice_no')
                    ->sortable()
                    ->searchable()
                    ->label(__('fields.invoice_no')),
                TextColumn::make('total_amount')
                    ->numeric()
                    ->sortable()
                    ->money('YER')
                    ->label(__('fields.total_amount'))
                    ->summarize(Sum::make()->money('YER')),
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
                TextColumn::make('purchase_date')
                    ->date('d M Y')
                    ->sortable()
                    ->label(__('fields.purchase_date'))
                    ->summarize(Range::make()->minimalDateTimeDifference()->label(__('fields.date_range'))),
                TextColumn::make('createdBy.name')
                    ->numeric()
                    ->sortable()
                    ->label(__('fields.created_by')),
                TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->label(__('fields.created_at')),
                TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->label(__('fields.updated_at')),
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
                            ->when($data['from'], fn (Builder $q, $date) => $q->whereDate('purchase_date', '>=', $date))
                            ->when($data['to'], fn (Builder $q, $date) => $q->whereDate('purchase_date', '<=', $date));
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
