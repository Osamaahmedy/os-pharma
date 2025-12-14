<?php

namespace App\Filament\Resources\ExaminationPrescriptions;

use App\Filament\Resources\ExaminationPrescriptions\Pages\CreateExaminationPrescription;
use App\Filament\Resources\ExaminationPrescriptions\Pages\EditExaminationPrescription;
use App\Filament\Resources\ExaminationPrescriptions\Pages\ListExaminationPrescriptions;
use App\Filament\Resources\ExaminationPrescriptions\Schemas\ExaminationPrescriptionForm;
use App\Filament\Resources\ExaminationPrescriptions\Tables\ExaminationPrescriptionsTable;
use App\Models\ExaminationPrescription;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class ExaminationPrescriptionResource extends Resource
{
    protected static ?string $model = ExaminationPrescription::class;
    protected static ?string $navigationLabel = 'روشتة الفحص';
    protected static ?string $modelLabel = 'روشتة الفحص';
    protected static ?string $pluralModelLabel = 'روشتات الفحوصات';
    protected static string|\UnitEnum|null $navigationGroup = 'الإعدادات الطبية';
    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    public static function form(Schema $schema): Schema
    {
        return ExaminationPrescriptionForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return ExaminationPrescriptionsTable::configure($table);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => ListExaminationPrescriptions::route('/'),
            'create' => CreateExaminationPrescription::route('/create'),
            'edit' => EditExaminationPrescription::route('/{record}/edit'),
        ];
    }
}
