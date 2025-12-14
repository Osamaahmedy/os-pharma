<?php

namespace App\Filament\Resources\ExaminationPrescriptions\Schemas;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Repeater;
use Filament\Schemas\Schema;
use App\Models\Examination;
use App\Models\ExaminationDepartment;
class ExaminationPrescriptionForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('patient_name')
                    ->label('اسم المريض')
                    ->required(),

                TextInput::make('age')
                    ->label('العمر')
                    ->numeric()
                    ->required(),

                Select::make('gender')
                    ->label('الجنس')
                    ->required()
                    ->options([
                        'male' => 'ذكر',
                        'female' => 'أنثى',
                    ]),

                Repeater::make('items')
    ->relationship()
    ->label('الفحوصات')
    ->columns(4)
    ->columnSpanFull()
    ->schema([
        // 1️⃣ اختيار القسم
        Select::make('department_id')
            ->label('القسم')
            ->options(ExaminationDepartment::pluck('name', 'id'))
            ->reactive()
            ->required()
            ->afterStateHydrated(function ($state, $set, $record) {
                if ($record && $record->examination_id) {
                    $set('department_id', $record->examination->department_id);
                }
            }),

        // 2️⃣ اختيار الفحص حسب القسم
        Select::make('examination_id')
            ->label('الفحص')
            ->options(function (callable $get) {
                $departmentId = $get('department_id');
                if (!$departmentId) return [];
                return Examination::where('department_id', $departmentId)
                    ->pluck('scientific_name', 'id');
            })
            ->reactive()
            ->searchable()
            ->required()
            ->afterStateHydrated(function ($state, $set, $record) {
                if ($record && $record->examination_id) {
                    $examination = $record->examination;
                    $set('normal_ratio', $examination->normal_ratio);
                    $set('unit_name', $examination->unit->name ?? '');
                }
            })
            ->afterStateUpdated(function (callable $get, callable $set, $state) {
                $examination = Examination::find($state);
                if ($examination) {
                    $set('normal_ratio', $examination->normal_ratio);
                    $set('unit_name', $examination->unit->name ?? '');
                }
            }),

        // 3️⃣ النسبة الطبيعية
        TextInput::make('normal_ratio')->label('النسبة الطبيعية')->disabled(),

        // 4️⃣ الوحدة
        TextInput::make('unit_name')->label('الوحدة')->disabled(),

        // النسبة التي يحددها المريض
        TextInput::make('patient_ratio')
        ->numeric()
        ->label('نسبة المريض')
        ->required(),
        ])
        ->addActionLabel('إضافة فحص'),
    ]);
    }
}
