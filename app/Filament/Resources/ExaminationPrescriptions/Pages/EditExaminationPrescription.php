<?php

namespace App\Filament\Resources\ExaminationPrescriptions\Pages;

use App\Filament\Resources\ExaminationPrescriptions\ExaminationPrescriptionResource;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;

class EditExaminationPrescription extends EditRecord
{
    protected static string $resource = ExaminationPrescriptionResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}
