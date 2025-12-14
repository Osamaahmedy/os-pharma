<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class Customer extends Model
{
    use LogsActivity;

    protected $guarded = [];

    // Spatie activity logger
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
