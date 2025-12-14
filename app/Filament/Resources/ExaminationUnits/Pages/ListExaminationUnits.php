<?php

namespace App\Filament\Resources\ExaminationUnits\Pages;

use App\Filament\Resources\ExaminationUnits\ExaminationUnitResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListExaminationUnits extends ListRecords
{
    protected static string $resource = ExaminationUnitResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
