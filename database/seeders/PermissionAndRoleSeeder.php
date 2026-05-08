<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class PermissionAndRoleSeeder extends Seeder
{
    public function run(): void
    {
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        // ─── الصلاحيات — يُضيف الجديد فقط، لا يمسح القديم ───────
        $permissions = [
            // الدفعات
            'view batch'   => 'عرض الدفعات',
            'create batch' => 'اضافة الدفعات',
            'update batch' => 'تحديث الدفعات',
            'delete batch' => 'حذف الدفعات',
            // الأقسام
            'view category'   => 'عرض الاقسام',
            'create category' => 'اضافة الاقسام',
            'update category' => 'تحديث الاقسام',
            'delete category' => 'حذف الاقسام',
            // الفواتير
            'view invoice'   => 'عرض الفواتير',
            'create invoice' => 'اضافة الفواتير',
            'update invoice' => 'تحديث الفواتير',
            'delete invoice' => 'حذف الفواتير',
            // الشركات المصنعة
            'view manufacturer'   => 'عرض الشركات المصنعة',
            'create manufacturer' => 'اضافة الشركات المصنعة',
            'update manufacturer' => 'تحديث الشركات المصنعة',
            'delete manufacturer' => 'حذف الشركات المصنعة',
            // المنتجات
            'view product'   => 'عرض المنتجات',
            'create product' => 'اضافة المنتجات',
            'update product' => 'تحديث المنتجات',
            'delete product' => 'حذف المنتجات',
            // المشتريات
            'view purchase'   => 'عرض المشتريات',
            'create purchase' => 'اضافة المشتريات',
            'update purchase' => 'تحديث المشتريات',
            'delete purchase' => 'حذف المشتريات',
            // المرتجعات
            'view return'   => 'عرض المرتجعات',
            'create return' => 'اضافة المرتجعات',
            'update return' => 'تحديث المرتجعات',
            'delete return' => 'حذف المرتجعات',
            // الأدوار
            'view role'   => 'عرض الادوار',
            'create role' => 'اضافة الادوار',
            'update role' => 'تحديث الادوار',
            'delete role' => 'حذف الادوار',
            // الموردين
            'view supplier'   => 'عرض الموردين',
            'create supplier' => 'اضافة الموردين',
            'update supplier' => 'تحديث الموردين',
            'delete supplier' => 'حذف الموردين',
            // حسابات الموردين
            'view supplier account'   => 'عرض حسابات الموردين',
            'create supplier account' => 'اضافة حسابات الموردين',
            'update supplier account' => 'تحديث حسابات الموردين',
            'delete supplier account' => 'حذف حسابات الموردين',
            // الوحدات
            'view unit'   => 'عرض الوحدات',
            'create unit' => 'اضافة الوحدات',
            'update unit' => 'تحديث الوحدات',
            'delete unit' => 'حذف الوحدات',
            // المستخدمين
            'view user'   => 'عرض المستخدمين',
            'create user' => 'اضافة المستخدمين',
            'update user' => 'تحديث المستخدمين',
            'delete user' => 'حذف المستخدمين',
            // العملاء
            'view customer'   => 'عرض العملاء',
            'create customer' => 'اضافة العملاء',
            'update customer' => 'تحديث العملاء',
            'delete customer' => 'حذف العملاء',
            // ديون العملاء
            'view customer account transaction'   => 'عرض سجل ديون العملاء',
            'create customer account transaction' => 'انشاء سجل دين للعملاء',
            'update customer account transaction' => 'تحديث سجل ديون العملاء',
            'delete customer account transaction' => 'حذف سجلات ديون العملاء',
            // مندوبي المبيعات
            'view sales representative'   => 'عرض مندوبي المبيعات',
            'create sales representative' => 'اضافة مندوبي المبيعات',
            'update sales representative' => 'تحديث مندوبي المبيعات',
            'delete sales representative' => 'حذف مندوبي المبيعات',
            // الإشعارات
            'view notification'        => 'عرض الإشعارات',
            'mark notification unread' => 'تمييز الإشعار مقروء',
            // سجل النشاطات
            'view activity logs' => 'عرض سجل النشاطات',
        ];

        foreach ($permissions as $name => $displayName) {
            // ✅ firstOrCreate → يُضيف الجديد فقط، يتجاهل الموجود
            Permission::firstOrCreate(
                ['name' => $name, 'guard_name' => 'web'],
                ['display_name' => $displayName]
            );
        }

        // ─── الأدوار — يُضيف الجديد فقط ─────────────────────────
        $admin = Role::firstOrCreate(['name' => 'admin', 'guard_name' => 'web']);

        // ✅ givePermissionTo → يُضيف الناقص فقط، لا يمسح الموجود
        $admin->givePermissionTo(
            Permission::whereNotIn(
                'id',
                $admin->permissions()->pluck('id')
            )->get()
        );

        Role::firstOrCreate(['name' => 'pharmacist',  'guard_name' => 'web']);
        Role::firstOrCreate(['name' => 'cashier',     'guard_name' => 'web']);
        Role::firstOrCreate(['name' => 'storekeeper', 'guard_name' => 'web']);

        // ─── أسند Admin لأول يوزر (إن لم يكن له دور) ────────────
        $adminUser = User::first();
        if ($adminUser && !$adminUser->hasRole('admin')) {
            $adminUser->assignRole('admin');
        }

        $this->command->info('✅ تمت الإضافة — الصلاحيات الجديدة فقط أُضيفت');
    }
}
