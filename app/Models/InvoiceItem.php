<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class InvoiceItem extends Model
{
    use LogsActivity;

    protected $guarded = [];

    public function invoice()
    {
        return $this->belongsTo(Invoice::class);
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function unit()
    {
        return $this->belongsTo(ProductUnit::class, 'unit_id');
    }

    public function batches()
    {
        return $this->belongsToMany(Batch::class, 'invoice_item_batches')
            ->withPivot('quantity');
    }

    // Spatie activity logger
    public function getActivitylogOptions(): LogOptions
    {
        $eventNames = [
            'created' => 'إضافة عنصر فاتورة جديد',
            'updated' => 'تعديل بيانات عنصر الفاتورة',
            'deleted' => 'حذف عنصر الفاتورة',
        ];

        return LogOptions::defaults()
            ->logOnly(['quantity', 'unit_price', 'total_price'])
            ->logOnlyDirty()
            ->useLogName('invoice_item')
            ->setDescriptionForEvent(fn (string $eventName) => $eventNames[$eventName] ?? "Invoice item has been {$eventName}");
    }
}
