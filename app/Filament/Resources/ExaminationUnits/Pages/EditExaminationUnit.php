<?php

namespace App\Filament\Resources\ExaminationUnits\Pages;

use App\Filament\Resources\ExaminationUnits\ExaminationUnitResource;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;

class EditExaminationUnit extends EditRecord
{
    protected static string $resource = ExaminationUnitResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}
