<?php

namespace App\Policies;

use App\Models\User;

class PurchasePolicy
{
    public function viewAny(User $user): bool
    {
        return $user->can('view purchase');
    }

    public function view(User $user): bool
    {
        return $user->can('view purchase');
    }

    public function create(User $user): bool
    {
        return $user->can('create purchase');
    }

    public function update(User $user): bool
    {
        return $user->can('update purchase');
    }

    public function delete(User $user): bool
    {
        return $user->can('delete purchase');
    }
}
