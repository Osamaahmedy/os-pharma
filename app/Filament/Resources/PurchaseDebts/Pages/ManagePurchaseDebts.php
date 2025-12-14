<?php

namespace App\Filament\Resources\PurchaseDebts\Pages;

use App\Filament\Resources\PurchaseDebts\PurchaseDebtResource;
use App\Filament\Resources\PurchaseDebts\Widgets\TotalSupplierDebt;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ManageRecords;

class ManagePurchaseDebts extends ManageRecords
{
    protected static string $resource = PurchaseDebtResource::class;

    protected function getHeaderActions(): array
    {
        return [
            // CreateAction::make(),
        ];
    }

    protected function getHeaderWidgets(): array
    {
        return [
            TotalSupplierDebt::class,
        ];
    }
}
