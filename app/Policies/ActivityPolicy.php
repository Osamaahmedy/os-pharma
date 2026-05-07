<?php

namespace App\Policies;

use Spatie\Activitylog\Models\Activity; // ✅ صح
use App\Models\User;

class ActivityPolicy
{
    public function viewAny(User $user): bool
    {
        return false;
    }

    public function view(User $user, Activity $activity): bool
    {
        return false;
    }

    public function create(User $user): bool
    {
        return false;
    }

    public function update(User $user, Activity $activity): bool
    {
        return false;
    }

    public function delete(User $user, Activity $activity): bool
    {
        return false;
    }

    public function restore(User $user, Activity $activity): bool
    {
        return false;
    }

    public function forceDelete(User $user, Activity $activity): bool
    {
        return false;
    }
}
