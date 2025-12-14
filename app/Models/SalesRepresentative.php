<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class SalesRepresentative extends Model
{
    use LogsActivity;

    protected $guarded = [];

    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
    }

    // Spatie activity logger
    public function getActivitylogOptions(): LogOptions
    {
        $eventNames = [
            'created' => 'إضافة مندوب جديد',
            'updated' => 'تعديل بيانات المندوب',
            'deleted' => 'حذف المندوب',
        ];

        return LogOptions::defaults()
            ->logOnly(['name', 'phone', 'email', 'address'])
            ->logOnlyDirty()
            ->useLogName('sales_representative')
            ->setDescriptionForEvent(fn (string $eventName) => $eventNames[$eventName] ?? "Sales representative has been {$eventName}");
    }
}
