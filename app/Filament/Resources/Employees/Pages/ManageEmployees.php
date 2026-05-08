<?php

namespace App\Filament\Resources\Employees\Pages;

use App\Filament\Resources\Employees\EmployeeResource;
use App\Models\EmployeeAccount;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ManageRecords;

class ManageEmployees extends ManageRecords
{
    protected static string $resource = EmployeeResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }

    protected function afterCreate(): void
    {
        EmployeeAccount::firstOrCreate([
            'employee_id' => $this->record->id,
        ], [
            'balance' => 0,
        ]);
    }

    protected function getHeaderWidgets(): array
    {
        return EmployeeResource::getWidgets();
    }
}
