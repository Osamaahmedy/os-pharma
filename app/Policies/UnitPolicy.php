<?php

namespace App\Policies;

use App\Models\User;

class UnitPolicy
{
    public function viewAny(User $user): bool
    {
        return $user->can('view unit');
    }

    public function view(User $user): bool
    {
        return $user->can('view unit');
    }

    public function create(User $user): bool
    {
        return $user->can('create unit');
    }

    public function update(User $user): bool
    {
        return $user->can('update unit');
    }

    public function delete(User $user): bool
    {
        return $user->can('delete unit');
    }
}
