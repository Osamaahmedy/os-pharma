<?php

namespace App\Filament\Resources\ExaminationDepartments;

use App\Filament\Resources\ExaminationDepartments\Pages\CreateExaminationDepartment;
use App\Filament\Resources\ExaminationDepartments\Pages\EditExaminationDepartment;
use App\Filament\Resources\ExaminationDepartments\Pages\ListExaminationDepartments;
use App\Filament\Resources\ExaminationDepartments\Schemas\ExaminationDepartmentForm;
use App\Filament\Resources\ExaminationDepartments\Tables\ExaminationDepartmentsTable;
use App\Models\ExaminationDepartment;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class ExaminationDepartmentResource extends Resource
{
    protected static ?string $model = ExaminationDepartment::class;

    protected static ?string $navigationLabel = 'أقسام الفحوصات';
    protected static ?string $modelLabel = 'قسم فحص';
    protected static ?string $pluralModelLabel = 'أقسام الفحوصات';
    protected static string|\UnitEnum|null $navigationGroup = 'الإعدادات الطبية';

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    public static function form(Schema $schema): Schema
    {
        return ExaminationDepartmentForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return ExaminationDepartmentsTable::configure($table);
    }

    public static function getRelations(): array
    {
        return [];
    }
  public static function canViewAny(): bool
    {
        return auth()->user()?->can('view examination unit') ?? false;
    }

    public static function getPages(): array
    {
        return [
            'index' => ListExaminationDepartments::route('/'),
            'create' => CreateExaminationDepartment::route('/create'),
            'edit' => EditExaminationDepartment::route('/{record}/edit'),
        ];
    }
}
