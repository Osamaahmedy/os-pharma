<?php

namespace App\Policies;

use App\Models\User;

class RolePolicy
{
    public function viewAny(User $user): bool
    {
        return $user->can('view role');
    }

    public function view(User $user): bool
    {
        return $user->can('view role');
    }

    public function create(User $user): bool
    {
        return $user->can('create role');
    }

    public function update(User $user): bool
    {
        return $user->can('update role');
    }

    public function delete(User $user): bool
    {
        return $user->can('delete role');
    }
}
