<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SupplierAccountTransaction extends Model
{
    protected $guarded = [];

    public function account()
    {
        return $this->belongsTo(SupplierAccount::class, 'supplier_account_id');
    }

    public function purchase()
    {
        return $this->belongsTo(Purchase::class);
    }
}
