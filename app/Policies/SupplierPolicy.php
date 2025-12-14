<?php

namespace App\Policies;

use App\Models\User;

class SupplierPolicy
{
    public function viewAny(User $user): bool
    {
        return $user->can('view supplier');
    }

    public function view(User $user): bool
    {
        return $user->can('view supplier');
    }

    public function create(User $user): bool
    {
        return $user->can('create supplier');
    }

    public function update(User $user): bool
    {
        return $user->can('update supplier');
    }

    public function delete(User $user): bool
    {
        return $user->can('delete supplier');
    }
}
