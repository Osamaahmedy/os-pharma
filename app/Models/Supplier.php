<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class Supplier extends Model
{
    use LogsActivity;

    protected $guarded = [];

    public function salesRepresentatives()
    {
        return $this->hasMany(SalesRepresentative::class);
    }

    // Spatie activity logger
    public function getActivitylogOptions(): LogOptions
    {
        $eventNames = [
            'created' => 'إضافة مزود جديد',
            'updated' => 'تعديل بيانات المزود',
            'deleted' => 'حذف المزود',
        ];

        return LogOptions::defaults()
            ->logOnly(['name', 'phone', 'email', 'address'])
            ->logOnlyDirty()
            ->useLogName('supplier')
            ->setDescriptionForEvent(fn (string $eventName) => $eventNames[$eventName] ?? "Supplier has been {$eventName}");
    }
}
