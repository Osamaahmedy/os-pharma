<?php

namespace App\Filament\Resources\EmployeeDebts\Pages;

use App\Filament\Resources\EmployeeDebts\EmployeeDebtResource;
use Filament\Actions\DeleteAction;
use Filament\Actions\ForceDeleteAction;
use Filament\Actions\RestoreAction;
use Filament\Actions\ViewAction;
use Filament\Resources\Pages\EditRecord;

class EditEmployeeDebt extends EditRecord
{
    protected static string $resource = EmployeeDebtResource::class;

    protected function getHeaderActions(): array
    {
        return [
            ViewAction::make(),
            DeleteAction::make(),
            ForceDeleteAction::make(),
            RestoreAction::make(),
        ];
    }
}
