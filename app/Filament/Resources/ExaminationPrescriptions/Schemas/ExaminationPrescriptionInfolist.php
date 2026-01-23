<?php

namespace App\Filament\Resources\ExaminationPrescriptions\Schemas;

use Filament\Infolists\Components\RepeatableEntry;
use Filament\Infolists\Components\RepeatableEntry\TableColumn;
use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Schema;

class ExaminationPrescriptionInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema->components([
            TextEntry::make('patient_name')->label('اسم المريض'),
            TextEntry::make('age')->label('العمر'),

            TextEntry::make('gender')
                ->label('الجنس')
                ->formatStateUsing(fn ($state) => match (strtolower((string) $state)) {
                    'male', 'm'   => 'رجل',
                    'female', 'f' => 'امرأة',
                    default       => '-',
                }),

            TextEntry::make('created_at')->date('d M Y')->label('تاريخ الإنشاء'),
            TextEntry::make('updated_at')->date('d M Y')->label('تاريخ التعديل'),

            RepeatableEntry::make('items')
                ->label('الفحوصات')
                ->columnSpanFull()
                ->table([
                    TableColumn::make('القسم'),
                    TableColumn::make('الفحص'),
                    TableColumn::make('النسبة الطبيعية'),
                    TableColumn::make('الوحدة'),
                    TableColumn::make('نسبة المريض'),
                ])
                ->schema([
                    TextEntry::make('examination.department.name')
                        ->label('القسم')
                        ->placeholder('-'),

                    TextEntry::make('examination.scientific_name')
                        ->label('الفحص')
                        ->placeholder('-'),

                    TextEntry::make('examination.normal_ratio')
                        ->label('النسبة الطبيعية')
                        ->placeholder('-'),

                    TextEntry::make('examination.unit.name')
                        ->label('الوحدة')
                        ->placeholder('-'),

                    TextEntry::make('patient_ratio')
                        ->label('نسبة المريض')
                        ->placeholder('-'),
                ]),
        ]);
    }
}
