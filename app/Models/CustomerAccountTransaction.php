<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CustomerAccountTransaction extends Model
{
    protected $guarded = [];

    public function account(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(CustomerAccount::class, 'customer_account_id');
    }

    public function invoice(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Invoice::class);
    }
}
