<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class Customer extends Model
{
    use LogsActivity;

    protected $guarded = [];

    public function account(): \Illuminate\Database\Eloquent\Relations\HasOne
    {
        return $this->hasOne(CustomerAccount::class);
    }

    public function invoices(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Invoice::class);
    }

    // ✅ إنشاء حساب تلقائي عند إنشاء العميل
    protected static function booted(): void
    {
        static::created(function (self $customer) {
            CustomerAccount::firstOrCreate(
                ['customer_id' => $customer->id],
                ['balance' => 0]
            );
        });
    }

    public function getActivitylogOptions(): LogOptions
    {
        $eventNames = [
            'created' => 'إضافة عميل جديد',
            'updated' => 'تعديل بيانات العميل',
            'deleted' => 'حذف العميل',
        ];

        return LogOptions::defaults()
            ->logOnly(['name', 'email', 'phone', 'address'])
            ->logOnlyDirty()
            ->useLogName('customer')
            ->setDescriptionForEvent(fn (string $eventName) => $eventNames[$eventName] ?? "Customer has been {$eventName}");
    }
}
