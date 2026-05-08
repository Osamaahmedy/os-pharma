<?php

namespace App\Observers;

use App\Models\Employee;
use App\Models\EmployeeAccount;

class EmployeeObserver
{
    public function created(Employee $employee): void
    {
        EmployeeAccount::firstOrCreate(
            ['employee_id' => $employee->id],
            ['balance' => 0]
        );
    }
}
