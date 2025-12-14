<?php

namespace App\Filament\Resources\ExaminationPrescriptions\Schemas;

use Filament\Infolists\Components\RepeatableEntry\TableColumn;
use Filament\Infolists\Components\RepeatableEntry;
use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Schema;

class ExaminationPrescriptionInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([

                TextEntry::make('patient_name')
                    ->label('اسم المريض'),

                TextEntry::make('age')
                    ->label('العمر'),

                TextEntry::make('gender')
                    ->label('الجنس'),

                TextEntry::make('created_at')
                    ->date('d M Y')
                    ->label('تاريخ الإنشاء'),

                TextEntry::make('updated_at')
                    ->date('d M Y')
                    ->label('تاريخ التعديل'),

                RepeatableEntry::make('items')
                    ->label('الفحوصات')
                    ->table([
                        TableColumn::make('الفحص'),
                        TableColumn::make('النسبة'),
                    ])
                    ->schema([
                        TextEntry::make('examination.scientific_name')
                            ->label('الفحص'),

                        TextEntry::make('patient_ratio')
                            ->label('نسبة المريض'),
                    ])->columnSpanFull()
            ]);
    }
}
