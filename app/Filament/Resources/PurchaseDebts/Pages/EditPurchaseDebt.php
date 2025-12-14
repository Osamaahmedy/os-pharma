<?php

namespace App\Filament\Resources\PurchaseDebts\Pages;

use App\Filament\Resources\PurchaseDebts\PurchaseDebtResource;
use Filament\Resources\Pages\EditRecord;
use Filament\Actions\ViewAction;

class EditPurchaseDebt extends EditRecord
{
    protected static string $resource = PurchaseDebtResource::class;

    protected function getHeaderActions(): array
    {
        return [
            ViewAction::make(),
        ];
    }

    protected function getFormActions(): array
    {
        return [
            //
        ];
    }
}