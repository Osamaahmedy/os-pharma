<?php

namespace App\Filament\Resources\PurchaseDebts\Pages;

use App\Filament\Resources\PurchaseDebts\PurchaseDebtResource;
use Filament\Actions\EditAction;
use Filament\Resources\Pages\ViewRecord;

class ViewPurchaseDebts extends ViewRecord
{
    protected static string $resource = PurchaseDebtResource::class;

    protected function getHeaderActions(): array
    {
        return [
            EditAction::make(),
        ];
    }
}
