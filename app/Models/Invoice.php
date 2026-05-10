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
protected static function booted(): void
{
    static::creating(function (self $invoice) {
        if (empty($invoice->created_by)) {
            $invoice->created_by = auth()->id();
        }
        if (empty($invoice->invoice_no)) {
            $invoice->invoice_no = 'TEMP-' . uniqid();
        }
    });

    static::created(function (self $invoice) {
        $invoice->updateQuietly([
            'invoice_no' => sprintf('INV-%s-%05d', now()->format('Y'), $invoice->id),
        ]);
    });
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
public function customer(): \Illuminate\Database\Eloquent\Relations\BelongsTo
{
    return $this->belongsTo(Customer::class);
}

}
