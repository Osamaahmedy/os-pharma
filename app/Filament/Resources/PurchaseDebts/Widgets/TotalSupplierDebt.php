<?php

namespace App\Filament\Resources\PurchaseDebts\Widgets;

use App\Models\SupplierAccount;
use Filament\Widgets\StatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class TotalSupplierDebt extends StatsOverviewWidget
{
    protected function getStats(): array
    {
        $totalDebt = SupplierAccount::sum('balance');
        return [
            Stat::make('Total Debt', number_format($totalDebt, thousands_separator: ','))
                ->label(__('app.total_debt')),
        ];
    }
}
