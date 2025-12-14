<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Services\PrintService;
use Illuminate\Support\Facades\Log;

class ExaminationPrescription extends Model
{
    protected $fillable = [
        'patient_name',
        'age',
        'gender',
    ];

    public function items()
    {
        return $this->hasMany(ExaminationPrescriptionItem::class);

    }
}
