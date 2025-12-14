<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class Category extends Model
{
    use LogsActivity;

    protected $guarded = [];

    // Spatie activity logger
    public function getActivitylogOptions(): LogOptions
    {
        $eventNames = [
            'created' => 'إضافة قسم جديد',
            'updated' => 'تعديل بيانات القسم',
            'deleted' => 'حذف القسم',
        ];

        return LogOptions::defaults()
            ->logOnly(['name', 'description'])
            ->logOnlyDirty()
            ->useLogName('category')
            ->setDescriptionForEvent(fn (string $eventName) => $eventNames[$eventName] ?? "Category has been {$eventName}");
    }
}
