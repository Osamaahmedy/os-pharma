<?php

namespace App\Policies;

use App\Models\User;

class ManufacturerPolicy
{
    public function viewAny(User $user): bool
    {
        return $user->can('view manufacturer');
    }

    public function view(User $user): bool
    {
        return $user->can('view manufacturer');
    }

    public function create(User $user): bool
    {
        return $user->can('create manufacturer');
    }

    public function update(User $user): bool
    {
        return $user->can('update manufacturer');
    }

    public function delete(User $user): bool
    {
        return $user->can('delete manufacturer');
    }
}
