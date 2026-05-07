<?php

namespace App\Filament\Resources\ExaminationPrescriptions;

use App\Filament\Resources\ExaminationPrescriptions\Pages\CreateExaminationPrescription;
use App\Filament\Resources\ExaminationPrescriptions\Pages\EditExaminationPrescription;
use App\Filament\Resources\ExaminationPrescriptions\Pages\ListExaminationPrescriptions;
use App\Filament\Resources\ExaminationPrescriptions\Pages\ViewExaminationPrescription;
use App\Filament\Resources\ExaminationPrescriptions\Schemas\ExaminationPrescriptionForm;
use App\Filament\Resources\ExaminationPrescriptions\Schemas\ExaminationPrescriptionInfolist;
use App\Filament\Resources\ExaminationPrescriptions\Tables\ExaminationPrescriptionsTable;
use App\Models\ExaminationPrescription;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;
use UnitEnum;

class ExaminationPrescriptionResource extends Resource
{
    protected static ?string $model = ExaminationPrescription::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    public static function getModelLabel(): string
    {
        return 'روشتة فحص';
    }

    public static function getPluralModelLabel(): string
    {
        return 'روشتات الفحوصات';
    }

    public static function getNavigationGroup(): string|UnitEnum|null
    {
        return 'الإعدادات الطبية';
    }

    protected static ?string $recordTitleAttribute = 'patient_name';

    public static function form(Schema $schema): Schema
    {
        return ExaminationPrescriptionForm::configure($schema);
    }

    // ✅ زي الفواتير تمامًا: infolist هنا
    public static function infolist(Schema $schema): Schema
    {
        return ExaminationPrescriptionInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return ExaminationPrescriptionsTable::configure($table);
    }
      public static function canViewAny(): bool
    {
        return auth()->user()?->can('view examination unit') ?? false;
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
            'index'  => ListExaminationPrescriptions::route('/'),
            'create' => CreateExaminationPrescription::route('/create'),
            'view'   => ViewExaminationPrescription::route('/{record}'),
            'edit'   => EditExaminationPrescription::route('/{record}/edit'),
        ];
    }
}
