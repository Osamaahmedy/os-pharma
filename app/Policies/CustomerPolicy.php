<?php

namespace App\Policies;

use App\Models\User;

class CustomerPolicy
{
    public function viewAny(User $user): bool
    {
        return $user->can('view customer');
    }

    public function view(User $user): bool
    {
        return $user->can('view customer');
    }

    public function create(User $user): bool
    {
        return $user->can('create customer');
    }

    public function update(User $user): bool
    {
        return $user->can('update customer');
    }

    public function delete(User $user): bool
    {
        return $user->can('delete customer');
    }
}
