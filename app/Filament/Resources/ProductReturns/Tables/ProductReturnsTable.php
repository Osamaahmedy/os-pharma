<?php

namespace App\Filament\Resources\ProductReturns\Tables;

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

class ProductReturnsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('invoice.invoice_no')
                    ->numeric()
                    ->sortable()
                    ->searchable()
                    ->label(__('fields.invoice_no')),
                TextColumn::make('total_amount')
                    ->numeric()
                    ->sortable()
                    ->money('YER')
                    ->label(__('fields.total_amount'))
                    ->summarize(Sum::make()->money('YER')),
                TextColumn::make('return_date')
                    ->date('d M Y')
                    ->sortable()
                    ->label(__('fields.return_date'))
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
                            ->when($data['from'], fn (Builder $q, $date) => $q->whereDate('return_date', '>=', $date))
                            ->when($data['to'], fn (Builder $q, $date) => $q->whereDate('return_date', '<=', $date));
                    }),

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
