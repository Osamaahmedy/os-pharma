<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class InvoiceItemBatch extends Model
{
    public $timestamps = false;

    protected $guarded = [];

    public function invoiceItem()
    {
        return $this->belongsTo(InvoiceItem::class);
    }

    public function batch()
    {
        return $this->belongsTo(Batch::class);
    }
}
