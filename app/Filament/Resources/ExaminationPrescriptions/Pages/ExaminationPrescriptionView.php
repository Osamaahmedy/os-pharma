<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Filament\Resources\ExaminationPrescriptions\Schemas\ExaminationPrescriptionInfolist;
use Filament\Schemas\Schema;

class ExaminationPrescriptionView extends Page
{
    // غير static
    protected string $view = 'filament.pages.examination-prescription-view';

    public function render(): \Illuminate\View\View
    {
        return view($this->view, [
            'components' => ExaminationPrescriptionInfolist::configure(new Schema())->getComponents(),
        ]);
    }
}
