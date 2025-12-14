<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Examination extends Model
{
    protected $fillable = [
        'scientific_name',
        'normal_ratio',
        'department_id',
        'unit_id',
    ];

    public function unit()
    {
        return $this->belongsTo(ExaminationUnit::class, 'unit_id');
    }

    public function department()
    {
        return $this->belongsTo(ExaminationDepartment::class, 'department_id');
    }
}
