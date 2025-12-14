<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class Product extends Model
{
    use LogsActivity;

    protected $guarded = [];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function manufacturer()
    {
        return $this->belongsTo(Manufacturer::class);
    }

    public function units()
    {
        return $this->belongsToMany(Unit::class, 'product_units')
            ->withPivot('conversion_factor')
            ->withPivot('is_base', 'price')
            ->withTimestamps();
    }

    public function batches()
    {
        return $this->hasMany(Batch::class);
    }

    public function stockMovements()
    {
        return $this->hasMany(StockMovement::class);
    }

    public function invoiceItems()
    {
        return $this->hasMany(InvoiceItem::class);
    }

    // Spatie activity logger
    public function getActivitylogOptions(): LogOptions
    {
        $eventNames = [
            'created' => 'إضافة منتج جديد',
            'updated' => 'تعديل بيانات المنتج',
            'deleted' => 'حذف المنتج',
        ];

        return LogOptions::defaults()
            ->logOnly(['name', 'category.name', 'generic_name', 'barcode', 'description', 'reorder_level', 'is_active'])
            ->logOnlyDirty()
            ->useLogName('product')
            ->setDescriptionForEvent(fn (string $eventName) => $eventNames[$eventName] ?? "Product has been {$eventName}");
    }
}
