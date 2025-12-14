<?php

namespace App\Filament\Resources\SalesRepresentatives\Pages;

use App\Filament\Resources\SalesRepresentatives\SalesRepresentativeResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ManageRecords;

class ManageSalesRepresentatives extends ManageRecords
{
    protected static string $resource = SalesRepresentativeResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
