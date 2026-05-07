<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RoleSeeder extends Seeder
{
    public function run(): void
    {
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        // Admin — كل الـ permissions
        $admin = Role::firstOrCreate(['name' => 'admin']);
        $admin->syncPermissions(Permission::all());

        // مثلاً pharmacist — صلاحيات محدودة
        $pharmacist = Role::firstOrCreate(['name' => 'pharmacist']);
        $pharmacist->syncPermissions([
            'view product',
            'view batch',
            'view invoice',
            'view purchase',
        ]);
    }
}
