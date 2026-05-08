<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class PurchaseItem extends Model
{
    use LogsActivity;

    protected $guarded = [];

    // Spatie activity logger
    public function getActivitylogOptions(): LogOptions
    {
        $eventNames = [
            'created' => 'إضافة عنصر مشترى جديد',
            'updated' => 'تعديل بيانات العنصر المشترى',
            'deleted' => 'حذف العنصر المشترى',
        ];

        return LogOptions::defaults()
            ->logOnly(['quantity', 'unit_price', 'total_price'])
            ->logOnlyDirty()
            ->useLogName('purchase_item')
            ->setDescriptionForEvent(fn (string $eventName) => $eventNames[$eventName] ?? "Purchase_item has been {$eventName}");
    }
    public function product()
{
    return $this->belongsTo(\App\Models\Product::class);
}
public function batch()
{
    return $this->belongsTo(Batch::class);
}
}
