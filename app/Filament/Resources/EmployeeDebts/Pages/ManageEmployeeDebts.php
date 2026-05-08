<?php

namespace App\Filament\Resources\EmployeeDebts\Pages;

use App\Filament\Resources\EmployeeDebts\EmployeeDebtResource;
use Filament\Resources\Pages\ManageRecords;

class ManageEmployeeDebts extends ManageRecords
{
    protected static string $resource = EmployeeDebtResource::class;

    // ✅ لا يوجد CreateAction — الحسابات تُنشأ تلقائياً مع الموظف
    protected function getHeaderActions(): array
    {
        return [];
    }
}
