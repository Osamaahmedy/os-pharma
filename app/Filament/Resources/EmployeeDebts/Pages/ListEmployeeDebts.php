<?php

namespace App\Filament\Resources\EmployeeDebts\Pages;

use App\Filament\Resources\EmployeeDebts\EmployeeDebtResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListEmployeeDebts extends ListRecords
{
    protected static string $resource = EmployeeDebtResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
