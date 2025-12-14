<?php

namespace App\Filament\Resources\ProductReturns\Pages;

use App\Filament\Resources\ProductReturns\ProductReturnResource;
use Filament\Actions\Action;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListProductReturns extends ListRecords
{
    protected static string $resource = ProductReturnResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
            Action::make('print')
                ->label('طباعة')
                ->icon('heroicon-o-printer')
                ->iconButton()
                ->color('gray')
                ->alpineClickHandler('window.print()'),
        ];
    }
}
