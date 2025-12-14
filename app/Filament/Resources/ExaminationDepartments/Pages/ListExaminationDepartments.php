<?php

namespace App\Filament\Resources\ExaminationDepartments\Pages;

use App\Filament\Resources\ExaminationDepartments\ExaminationDepartmentResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListExaminationDepartments extends ListRecords
{
    protected static string $resource = ExaminationDepartmentResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
