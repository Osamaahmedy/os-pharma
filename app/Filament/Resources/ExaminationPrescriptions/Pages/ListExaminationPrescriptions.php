<?php

namespace App\Filament\Resources\ExaminationPrescriptions\Pages;

use App\Filament\Resources\ExaminationPrescriptions\ExaminationPrescriptionResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListExaminationPrescriptions extends ListRecords
{
    protected static string $resource = ExaminationPrescriptionResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }

}
