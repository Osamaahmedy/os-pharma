<?php

// database/seeders/RolesAndPermissionsSeeder.php
namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use App\Models\User;

class RolesAndPermissionsSeeder extends Seeder
{
    public function run(): void
    {
        // امسح الكاش أولاً
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        // ─── أنشئ كل الـ Permissions ───
        $permissions = [
            'view user',
            'create user',
            'update user',
            'delete user',
            'view activity logs',
            // أضف باقي الـ permissions من بقية الـ Policies هنا
        ];

        foreach ($permissions as $perm) {
            Permission::firstOrCreate(['name' => $perm]);
        }

        // ─── أنشئ الـ Roles وأسند لكل منها الـ Permissions ───

        // Admin — كل شيء
        $admin = Role::firstOrCreate(['name' => 'admin']);
        $admin->syncPermissions($permissions);

        // مثلاً pharmacist — صلاحيات محدودة
        $pharmacist = Role::firstOrCreate(['name' => 'pharmacist']);
        $pharmacist->syncPermissions([
            'view user',
        ]);

        // ─── أسند الـ Role لليوزر الـ Admin ───
        $adminUser = User::find(1); // أو عبر الإيميل
        $adminUser?->assignRole('admin');
    }
}
