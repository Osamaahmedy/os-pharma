<?php

namespace App\Filament\Resources\PurchaseDebts\Widgets;

use App\Models\SupplierAccount;
use Filament\Widgets\StatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class TotalSupplierDebt extends StatsOverviewWidget
{
    protected function getStats(): array
    {
        // ✅ الديون الحقيقية فقط (رصيد موجب = مبلغ مستحق للمورد)
        $totalDebt = SupplierAccount::where('balance', '>', 0)->sum('balance');

        // ✅ المبالغ المستحقة الاسترداد (رصيد سالب = دفعنا أكثر مما يجب)
        $totalCredit = SupplierAccount::where('balance', '<', 0)->sum('balance');
        $totalCredit = abs($totalCredit); // نعرضه كرقم موجب مع وصف واضح

        // ✅ صافي الديون الكلية (قد يكون أقل من totalDebt بسبب الاسترداد)
        $netDebt = SupplierAccount::sum('balance');

        return [
            Stat::make('total_debt', number_format($totalDebt, thousands_separator: ','))
                ->label(__('app.total_debt'))
                ->description(__('app.amounts_owed_to_suppliers'))
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('danger'),

            Stat::make('total_credit', number_format($totalCredit, thousands_separator: ','))
                ->label(__('app.total_credit'))
                ->description(__('app.amounts_suppliers_owe_us'))
                ->descriptionIcon('heroicon-m-arrow-trending-down')
                ->color('success'),

            Stat::make('net_debt', number_format(max($netDebt, 0), thousands_separator: ','))
                ->label(__('app.net_debt'))
                ->description(__('app.net_after_returns'))
                ->descriptionIcon('heroicon-m-scale')
                ->color($netDebt > 0 ? 'warning' : 'success'),
        ];
    }
}
