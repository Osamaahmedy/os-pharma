<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class Invoice extends Model
{
    use LogsActivity;

    protected $guarded = [];

    public function items()
    {
        return $this->hasMany(InvoiceItem::class);
    }

    public function products()
    {
        return $this->belongsToMany(Product::class, 'invoice_items')
            ->withPivot('unit_price');
    }

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by', 'id');
    }

    // Spatie activity logger
    public function getActivitylogOptions(): LogOptions
    {
        $eventNames = [
            'created' => 'إضافة فاتورة جديدة',
            'updated' => 'تعديل بيانات الفاتورة',
            'deleted' => 'حذف الفاتورة',
        ];

        return LogOptions::defaults()
            ->logOnly(['total_amount', 'discount', 'paid', 'payment_status', 'invoice_date'])
            ->logOnlyDirty()
            ->useLogName('invoice')
            ->setDescriptionForEvent(fn (string $eventName) => $eventNames[$eventName] ?? "Invoice has been {$eventName}");
    }
}
