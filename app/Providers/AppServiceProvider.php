<?php

namespace App\Providers;

use App\Policies\RolePolicy;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\ServiceProvider;
use Spatie\Permission\Models\Role;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
   public function boot(): void
{
    Gate::policy(Role::class, RolePolicy::class);

    // ✅ بدل id === 1، استخدم الـ role
    Gate::before(function ($user, $ability) {
        if ($user->hasRole('admin')) {
            return true; // admin يمر من كل شيء
        }
        // باقي اليوزرز يكملون للـ Policies والـ Permissions
    });
}
}
