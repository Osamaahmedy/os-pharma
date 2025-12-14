<?php

namespace App\Filament\Widgets;

use App\Models\Batch;
use App\Models\Category;
use App\Models\Invoice;
use App\Models\Manufacturer;
use App\Models\Product;
use App\Models\ProductReturn;
use App\Models\Purchase;
use App\Models\Supplier;
use App\Models\User;
use Filament\Widgets\StatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class StatsOverview extends StatsOverviewWidget
{
    protected function getStats(): array
    {
        return [
            Stat::make('عدد الأقسام', Category::count()),
            Stat::make('عدد المنتجات', Product::count()),
            Stat::make('عدد الشركات المصنعة', Manufacturer::count()),
            Stat::make('عددالمزودين', Supplier::count()),
            Stat::make('عدد الدفعات', Batch::count()),
            Stat::make('عدد الفواتير', Invoice::count()),
            Stat::make('عدد عمليات الشراء', Purchase::count()),
            Stat::make('عددالمرتجعات', ProductReturn::count()),
            Stat::make('عدد المستخدمين', User::count()),
        ];
    }
}
