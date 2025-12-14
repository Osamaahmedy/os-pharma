<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ExaminationPrescriptionItem extends Model
{
    protected $fillable = [
        'examination_prescription_id',
        'examination_id',
        'patient_ratio',
    ];

    public function prescription()
    {
        return $this->belongsTo(ExaminationPrescription::class);
    }

    public function examination()
    {
        return $this->belongsTo(Examination::class);
    }
}
