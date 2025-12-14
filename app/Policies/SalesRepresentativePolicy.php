<?php

namespace App\Policies;

use App\Models\User;

class SalesRepresentativePolicy
{
    public function viewAny(User $user): bool
    {
        return $user->can('view sales representative');
    }

    public function view(User $user): bool
    {
        return $user->can('view sales representative');
    }

    public function create(User $user): bool
    {
        return $user->can('create sales representative');
    }

    public function update(User $user): bool
    {
        return $user->can('update sales representative');
    }

    public function delete(User $user): bool
    {
        return $user->can('delete sales representative');
    }
}
