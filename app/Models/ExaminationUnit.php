<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ExaminationUnit extends Model
{
    protected $fillable = [
        'name',
    ];

    public function examination()
    {
        return $this->hasOne(Examination::class, 'unit_id');
    }
}
