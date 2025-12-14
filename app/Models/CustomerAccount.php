<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CustomerAccount extends Model
{
    protected $guarded = [];

    public function transactions()
    {
        return $this->hasMany(CustomerAccountTransaction::class, 'customer_account_id');
    }
}
