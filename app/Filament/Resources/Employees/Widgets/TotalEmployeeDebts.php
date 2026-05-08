<?php

namespace App\Filament\Resources\Employees\Widgets;

use App\Models\EmployeeAccount;
use Filament\Widgets\StatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class TotalEmployeeDebts extends StatsOverviewWidget
{
    protected function getStats(): array
    {
        $total = EmployeeAccount::where('balance', '>', 0)->sum('balance');

        return [
            Stat::make(__('app.total_employee_debts'), number_format($total, 2, '.', ','))
                ->icon('heroicon-o-banknotes')
                ->color('danger'),
        ];
    }
}
