<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class ProductUnit extends Model
{
    use LogsActivity;

    protected $guarded = [];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function unit()
    {
        return $this->belongsTo(Unit::class);
    }

    // Spatie activity logger
    public function getActivitylogOptions(): LogOptions
    {
        $eventNames = [
            'created' => 'إضافة وحدة منتج جديدة',
            'updated' => 'تعديل بيانات وحدة المنتج',
            'deleted' => 'حذف وحدة المنتج',
        ];

        return LogOptions::defaults()
            ->logOnly(['conversion_factor', 'is_base', 'price'])
            ->logOnlyDirty()
            ->useLogName('product_unit')
            ->setDescriptionForEvent(fn (string $eventName) => $eventNames[$eventName] ?? "Product unit has been {$eventName}");
    }
}
