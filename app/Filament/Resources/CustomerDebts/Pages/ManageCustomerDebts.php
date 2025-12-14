<?php

namespace App\Filament\Resources\CustomerDebts\Pages;

use App\Filament\Resources\CustomerDebts\CustomerDebtResource;
use App\Filament\Resources\CustomerDebts\Widgets\TotalCustomerDebt;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ManageRecords;

class ManageCustomerDebts extends ManageRecords
{
    protected static string $resource = CustomerDebtResource::class;

    protected function getHeaderActions(): array
    {
        return [
            // CreateAction::make(),
        ];
    }

    protected function getHeaderWidgets(): array
    {
        return [
            TotalCustomerDebt::class,
        ];
    }
}
