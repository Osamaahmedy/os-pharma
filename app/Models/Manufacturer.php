<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class Manufacturer extends Model
{
    use LogsActivity;

    protected $guarded = [];

    // Spatie activity logger
    public function getActivitylogOptions(): LogOptions
    {
        $eventNames = [
            'created' => 'إضافة شركة مصنعة جديدة',
            'updated' => 'تعديل بيانات الشركة المصنعة',
            'deleted' => 'حذف الشركة المصنعة',
        ];

        return LogOptions::defaults()
            ->logOnly(['name'])
            ->logOnlyDirty()
            ->useLogName('manufacturer')
            ->setDescriptionForEvent(fn (string $eventName) => $eventNames[$eventName] ?? "Manufacturer has been {$eventName}");
    }
}
