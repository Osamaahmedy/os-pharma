<?php

namespace App\Policies;

use App\Models\User;

class ProductPolicy
{
    public function viewAny(User $user): bool
    {
        return $user->can('view product');
    }

    public function view(User $user): bool
    {
        return $user->can('view product');
    }

    public function create(User $user): bool
    {
        return $user->can('create product');
    }

    public function update(User $user): bool
    {
        return $user->can('update product');
    }

    public function delete(User $user): bool
    {
        return $user->can('delete product');
    }
}
