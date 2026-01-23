<?php

namespace App\Filament\Resources\ExaminationPrescriptions\Pages;

// use App\Filament\Resources\ExaminationPrescriptionResource;
use App\Filament\Resources\ExaminationPrescriptions\ExaminationPrescriptionResource;
use App\Models\ExaminationPrescription;
use Filament\Resources\Pages\Page;

class PrintExaminationPrescription extends Page
{
    protected static string $resource = ExaminationPrescriptionResource::class;

    // ✅ بدون static
    protected string $view = 'filament.examination-prescriptions.print';

    public ExaminationPrescription $record;

    public function mount(ExaminationPrescription $record): void
    {
        $this->record = $record;
    }
}
