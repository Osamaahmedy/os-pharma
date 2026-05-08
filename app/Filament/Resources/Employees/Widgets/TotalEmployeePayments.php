<?php

namespace App\Filament\Resources\Employees\Widgets;

use App\Models\EmployeeTransaction;
use Filament\Widgets\StatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class TotalEmployeePayments extends StatsOverviewWidget
{
    protected function getStats(): array
    {
        $total = EmployeeTransaction::where('type', 'payment')->sum('amount');

        return [
            Stat::make(__('app.total_employee_payments'), number_format($total, 2, '.', ','))
                ->icon('heroicon-o-arrow-trending-down')
                ->color('success'),
        ];
    }
}
