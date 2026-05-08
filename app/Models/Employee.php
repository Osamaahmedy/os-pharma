<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class Employee extends Model
{
    use LogsActivity;

    protected $guarded = [];

    public function account()
    {
        return $this->hasOne(EmployeeAccount::class);
    }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['name', 'phone', 'position', 'is_active' ,'salary'])
            ->logOnlyDirty()
            ->useLogName('employee')
            ->setDescriptionForEvent(fn (string $eventName) => match($eventName) {
                'created' => 'إضافة موظف جديد',
                'updated' => 'تعديل بيانات الموظف',
                'deleted' => 'حذف الموظف',
                default   => "Employee has been {$eventName}",
            });
    }
}
