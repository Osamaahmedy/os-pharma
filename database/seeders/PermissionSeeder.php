<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;

class PermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $permissions = [
            'create batch' => 'اضافة الدفعات',
            'view batch' => 'عرض الدفعات',
            'update batch' => 'تحديث الدفعات',
            'delete batch' => 'حذف الدفعات',

            'create category' => 'اضافة الاقسام',
            'view category' => 'عرض الاقسام',
            'update category' => 'تحديث الاقسام',
            'delete category' => 'حذف الاقسام',

            'create invoice' => 'اضافة الفواتير',
            'view invoice' => 'عرض الفواتير',
            'update invoice' => 'تحديث الفواتير',
            'delete invoice' => 'حذف الفواتير',

            'create manufacturer' => 'اضافة الشركات المصنعة',
            'view manufacturer' => 'عرض الشركات المصنعة',
            'update manufacturer' => 'تحديث الشركات المصنعة',
            'delete manufacturer' => 'حذف الشركات المصنعة',

            'create return' => 'اضافة المرتجعات',
            'view return' => 'عرض المرتجعات',
            'update return' => 'تحديث المرتجعات',
            'delete return' => 'حذف المرتجعات',

            'create product' => 'اضافة المنتجات',
            'view product' => 'عرض المنتجات',
            'update product' => 'تحديث المنتجات',
            'delete product' => 'حذف المنتجات',

            'create purchase' => 'اضافة المشتريات',
            'view purchase' => 'عرض المشتريات',
            'update purchase' => 'تحديث المشتريات',
            'delete purchase' => 'حذف المشتريات',

            'create role' => 'اضافة الادوار',
            'view role' => 'عرض الادوار',
            'update role' => 'تحديث الادوار',
            'delete role' => 'حذف الادوار',

            'create supplier' => 'اضافة المزودين',
            'view supplier' => 'عرض المزودين',
            'update supplier' => 'تحديث المزودين',
            'delete supplier' => 'حذف المزودين',

            'create unit' => 'اضافة الوحدات',
            'view unit' => 'عرض الوحدات',
            'update unit' => 'تحديث الوحدات',
            'delete unit' => 'حذف الوحدات',

            'create user' => 'اضافة المستخدمين',
            'view user' => 'عرض المستخدمين',
            'update user' => 'تحديث المستخدمين',
            'delete user' => 'حذف المستخدمين',

            'create customer' => 'اضافة العملاء',
            'view customer' => 'عرض العملاء',
            'update customer' => 'تحديث العملاء',
            'delete customer' => 'حذف العملاء',

            'view notification' => 'عرض الإشعارات',
            'mark notification unread' => 'تمييز الإشعار مقروء',

            'view customer account transaction' => 'عرض سجل ديون العملاء',
            'create customer account transaction' => 'انشاء سجل دين للعملاء',
            'update customer account transaction' => 'تحديث سجل ديون العملاء',
            'delete customer account transaction' => 'حذف سجلات ديون العملاء',

            'view sales representative' => 'عرض مندوبي المبيعات',
            'create sales representative' => 'اضافة مندوبي مبيعات',
            'update sales representative' => 'تحديث مندوبي المبيعات',
            'delete sales representative' => 'حذف مندوبي المبيعات',

            'view supplier account' => 'عرض سجل ديون الموردين',
            'create supplier account' => 'اضافة سجل ديون الموردين',
            'update supplier account' => 'تحديث سجل ديون الموردين',
            'delete supplier account' => 'حذف سجل ديون الموردين',
            'view activity logs' => 'عرض سجل النشاطات',
        ];

        $permissionsInsertArr = [];

        foreach ($permissions as $name => $displayName) {
            $permissionsInsertArr[] = [
                'name' => $name,
                'display_name' => $displayName,
                'guard_name' => 'web'
            ];
        }

        Permission::insert($permissionsInsertArr);
    }
}
