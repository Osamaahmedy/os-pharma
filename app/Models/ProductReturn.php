<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class ProductReturn extends Model
{
    use LogsActivity;

    protected $guarded = [];

    public function items()
    {
        return $this->hasMany(ReturnItem::class, 'return_id');
    }

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by', 'id');
    }

    public function invoice()
    {
        return $this->belongsTo(Invoice::class, 'reference_id', 'id');
    }

    public function purchase()
    {
        return $this->belongsTo(Purchase::class, 'reference_id', 'id');
    }

    // Spatie activity logger
    public function getActivitylogOptions(): LogOptions
    {
        $eventNames = [
            'created' => 'إضافة مرتجع جديد',
            'updated' => 'تعديل بيانات المرتجع',
            'deleted' => 'حذف المرتجع',
        ];

        return LogOptions::defaults()
            ->logOnly(['total_amount', 'return_date'])
            ->logOnlyDirty()
            ->useLogName('product_return')
            ->setDescriptionForEvent(fn (string $eventName) => $eventNames[$eventName] ?? "Product return has been {$eventName}");
    }
}
