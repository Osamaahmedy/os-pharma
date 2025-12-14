<?php

namespace App\Filament\Resources\ExaminationDepartments\Pages;

use App\Filament\Resources\ExaminationDepartments\ExaminationDepartmentResource;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;

class EditExaminationDepartment extends EditRecord
{
    protected static string $resource = ExaminationDepartmentResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}
