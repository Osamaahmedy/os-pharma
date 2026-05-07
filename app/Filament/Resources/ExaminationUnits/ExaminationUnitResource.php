<?php

namespace App\Filament\Resources\ExaminationUnits;

use App\Filament\Resources\ExaminationUnits\Pages\CreateExaminationUnit;
use App\Filament\Resources\ExaminationUnits\Pages\EditExaminationUnit;
use App\Filament\Resources\ExaminationUnits\Pages\ListExaminationUnits;
use App\Filament\Resources\ExaminationUnits\Schemas\ExaminationUnitForm;
use App\Filament\Resources\ExaminationUnits\Tables\ExaminationUnitsTable;
use App\Models\ExaminationUnit;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class ExaminationUnitResource extends Resource
{
    protected static ?string $model = ExaminationUnit::class;
      protected static ?string $navigationLabel = 'وحدات الفحوصات';
    protected static ?string $modelLabel = 'وحدة فحص';
    protected static ?string $pluralModelLabel = 'وحدات الفحوصات';
    protected static string|\UnitEnum|null $navigationGroup = 'الإعدادات الطبية';

  public static function canViewAny(): bool
    {
        return auth()->user()?->can('view examination unit') ?? false;
    }

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    public static function form(Schema $schema): Schema
    {
        return ExaminationUnitForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return ExaminationUnitsTable::configure($table);
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
            'index' => ListExaminationUnits::route('/'),
            'create' => CreateExaminationUnit::route('/create'),
            'edit' => EditExaminationUnit::route('/{record}/edit'),
        ];
    }
}
