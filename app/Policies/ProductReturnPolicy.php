<?php

namespace App\Policies;

use App\Models\User;

class ProductReturnPolicy
{
    public function viewAny(User $user): bool
    {
        return $user->can('view return');
    }

    public function view(User $user): bool
    {
        return $user->can('view return');
    }

    public function create(User $user): bool
    {
        return $user->can('create return');
    }

    public function update(User $user): bool
    {
        return $user->can('update return');
    }

    public function delete(User $user): bool
    {
        return $user->can('delete return');
    }
}
