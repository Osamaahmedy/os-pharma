<?php

namespace App\Filament\Resources\CustomerDebts\Widgets;

use App\Models\CustomerAccount;
use App\Models\CustomerAccountTransaction;
use Filament\Widgets\StatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class TotalCustomerDebt extends StatsOverviewWidget
{
    protected function getStats(): array
    {
        $totalDebt    = CustomerAccountTransaction::where('type', 'debt')->sum('amount');
        $totalPayment = CustomerAccountTransaction::where('type', 'payment')->sum('amount');
        $netBalance   = CustomerAccount::sum('balance');

        return [


            Stat::make('صافي الديون المتبقية', number_format($netBalance, 2) . ' ' . config('app.currency', 'ر.ي'))
                ->color($netBalance > 0 ? 'warning' : 'success')
                ->icon('heroicon-o-scale'),
        ];
    }
}
