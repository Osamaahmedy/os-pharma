<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SupplierAccount extends Model
{
    protected $guarded = [];

    public function transactions()
    {
        return $this->hasMany(SupplierAccountTransaction::class, 'supplier_account_id');
    }

    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
    }
}
