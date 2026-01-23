<?php

namespace App\Filament\Resources\ExaminationPrescriptions\Pages;

use App\Filament\Resources\ExaminationPrescriptions\Schemas\ExaminationPrescriptionInfolist;
use App\Filament\Resources\ExaminationPrescriptions\ExaminationPrescriptionResource;
use Filament\Actions\Action;
use Filament\Resources\Pages\ViewRecord;
use Filament\Schemas\Schema;

class ViewExaminationPrescription extends ViewRecord
{
    protected static string $resource = ExaminationPrescriptionResource::class;

    public function infolist(Schema $schema): Schema
    {
        return ExaminationPrescriptionInfolist::configure($schema);
    }

    protected function getHeaderActions(): array
    {
        return [
            Action::make('print')
                ->label('طباعة')
                ->icon('heroicon-o-printer')
                ->color('gray')
                ->alpineClickHandler('window.print()'),
        ];
    }
}
