<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class ReturnItem extends Model
{
    use LogsActivity;

    protected $guarded = [];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function batch()
    {
        return $this->belongsTo(Batch::class);
    }

    // Spatie activity logger
    public function getActivitylogOptions(): LogOptions
    {
        $eventNames = [
            'created' => 'إضافة عنصر جديد',
            'updated' => 'تعديل بيانات العنصر المرتجع',
            'deleted' => 'حذف العنصر المرتجع',
        ];

        return LogOptions::defaults()
            ->logOnly(['quantity', 'reason'])
            ->logOnlyDirty()
            ->useLogName('returned_item')
            ->setDescriptionForEvent(fn (string $eventName) => $eventNames[$eventName] ?? "Returned item has been {$eventName}");
    }
}
