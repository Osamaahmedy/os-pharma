<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class EmployeeTransaction extends Model
{
    use LogsActivity;

    protected $guarded = [];

    public function account()
    {
        return $this->belongsTo(EmployeeAccount::class, 'employee_account_id');
    }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['type', 'amount', 'description'])
            ->logOnlyDirty()
            ->useLogName('employee_transaction')
            ->setDescriptionForEvent(fn (string $eventName) => match($eventName) {
                'created' => 'تسجيل عملية جديدة',
                'updated' => 'تعديل العملية',
                'deleted' => 'حذف العملية',
                default   => "Transaction has been {$eventName}",
            });
    }
}
