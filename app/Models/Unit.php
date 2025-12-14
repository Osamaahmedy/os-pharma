<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class Unit extends Model
{
    use LogsActivity;

    protected $guarded = [];

    public function products()
    {
        return $this->belongsToMany(Product::class, 'product_units')
            ->withPivot('conversion_factor')
            ->withPivot('is_base', 'price')
            ->withTimestamps();
    }

    // Spatie activity logger
    public function getActivitylogOptions(): LogOptions
    {
        $eventNames = [
            'created' => 'إضافة وحدة جديدة',
            'updated' => 'تعديل بيانات الوحدة',
            'deleted' => 'حذف الوحدة',
        ];

        return LogOptions::defaults()
            ->logOnly(['name', 'abbreviation'])
            ->logOnlyDirty()
            ->useLogName('unit')
            ->setDescriptionForEvent(fn (string $eventName) => $eventNames[$eventName] ?? "Unit has been {$eventName}");
    }
}
