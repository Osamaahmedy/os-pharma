<?php

namespace App\Filament\Resources\PurchaseReturns\Pages;

use App\Filament\Resources\PurchaseReturns\ProductReturnResource;
use Filament\Actions\Action;
use Filament\Actions\EditAction;
use Filament\Resources\Pages\ViewRecord;

class ViewProductReturn extends ViewRecord
{
    protected static string $resource = ProductReturnResource::class;

    protected function getHeaderActions(): array
    {
        return [
            // EditAction::make(),
            Action::make('print')
                ->label('طباعة')
                ->icon('heroicon-o-printer')
                ->iconButton()
                ->color('gray')
                ->alpineClickHandler('window.print()'),
        ];
    }
}
