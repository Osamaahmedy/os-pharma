<?php

namespace App\Filament\Resources\CustomerDebts\Widgets;

use App\Models\CustomerAccountTransaction;
use Filament\Widgets\StatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class TotalCustomerDebt extends StatsOverviewWidget
{
    protected function getStats(): array
    {
        return [
            Stat::make('Total Debt', CustomerAccountTransaction::sum('amount'))
                ->label(__('app.total_debt')),
        ];
    }
}
