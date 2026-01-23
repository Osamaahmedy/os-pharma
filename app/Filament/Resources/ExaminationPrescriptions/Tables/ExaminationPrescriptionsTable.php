<?php

namespace App\Filament\Resources\ExaminationPrescriptions\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;

class ExaminationPrescriptionsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            // ✅ حمّل العلاقات عشان أعمدة الملخص تشتغل
            ->modifyQueryUsing(fn (Builder $query) => $query->with([
                'items.examination.unit',
                'items.examination.department',
            ]))

            ->columns([
                TextColumn::make('patient_name')->label('المريض')->searchable(),

                TextColumn::make('age')->label('العمر'),

                TextColumn::make('gender')
                    ->label('الجنس')
                    ->formatStateUsing(fn ($state) => match (strtolower((string) $state)) {
                        'male', 'm'   => 'رجل',
                        'female', 'f' => 'انثى',
                        default       => '-',
                    }),

                TextColumn::make('items_count')->counts('items')->label('عدد الفحوص'),

                // ✅ عمود ملخص النِسَب (يجلب من العلاقة)
                TextColumn::make('ratios')
                    ->label('النسب')
                    ->state(function ($record) {
                        // مثال: "CBC: 51 mg/dl, HbA1c: 7 %"
                        return $record->items
                            ->map(function ($item) {
                                $name  = $item->examination?->scientific_name ?? '-';
                                $ratio = $item->patient_ratio ?? '-';
                                $unit  = $item->examination?->unit?->name ?? '';
                                return trim("{$name}: {$ratio} {$unit}");
                            })
                            ->filter()
                            ->take(3) // خفف في اللست
                            ->implode(' | ');
                    })
                    ->wrap(),
            ])

            ->recordActions([
                EditAction::make(),
                ViewAction::make(),
            ])

            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
