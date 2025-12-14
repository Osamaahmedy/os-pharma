<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Batch extends Model
{
    protected $guarded = [];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
    }

    public function invoiceItems()
    {
        return $this->belongsToMany(InvoiceItem::class)
            ->withPivot('quantity');
    }

    protected static function booted()
    {
        static::creating(function ($model) {
            $model->current_quantity = $model->initial_quantity;
        });
    }
}
