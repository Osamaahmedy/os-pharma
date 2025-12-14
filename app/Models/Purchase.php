<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class Purchase extends Model
{
    use LogsActivity;

    protected $guarded = [];

    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
    }

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by', 'id');
    }

    public function items()
    {
        return $this->hasMany(PurchaseItem::class);
    }

    public function products()
    {
        return $this->belongsToMany(Product::class, 'purchase_items')
            ->withPivot('unit_price');
    }

    // Spatie activity logger
    public function getActivitylogOptions(): LogOptions
    {
        $eventNames = [
            'created' => 'إضافة عملية شراء جديدة',
            'updated' => 'تعديل بيانات عملية الشراء',
            'deleted' => 'حذف عملية الشراء',
        ];

        return LogOptions::defaults()
            ->logOnly(['total_amount', 'payment_status', 'purchase_date'])
            ->logOnlyDirty()
            ->useLogName('purchase')
            ->setDescriptionForEvent(fn (string $eventName) => $eventNames[$eventName] ?? "Purchase has been {$eventName}");
    }
}
