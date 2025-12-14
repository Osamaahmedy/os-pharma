<?php

namespace App\Filament\Resources\ExaminationPrescriptions\Pages;

use App\Filament\Resources\ExaminationPrescriptions\ExaminationPrescriptionResource;
use Filament\Resources\Pages\CreateRecord;

class CreateExaminationPrescription extends CreateRecord
{
    protected static string $resource = ExaminationPrescriptionResource::class;

    protected function afterCreate(): void
{
    $record = $this->record;

    // تحميل العناصر والعلاقات
    $record->load([
        'items.examination.unit',
        'items.examination.department'
    ]);

    $data = [
        'patient_name' => $record->patient_name,
        'age'          => $record->age,
        'gender'       => $record->gender,
        'items'        => $record->items->map(function ($item) {
            return [
                'name'          => $item->examination->scientific_name ?? '',
                'normal_ratio'  => $item->examination->normal_ratio ?? '',
                'unit'          => $item->examination->unit->name ?? '',
                'department'    => $item->examination->department->name ?? '',
                'patient_ratio' => $item->patient_ratio,
            ];
        })->toArray(),
    ];

    \App\Services\PrintService::printPrescription($data);

}

}
