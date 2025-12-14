<?php

namespace App\Policies;

use App\Models\User;

class BatchPolicy
{
    public function viewAny(User $user): bool
    {
        return $user->can('view batch');
    }

    public function view(User $user): bool
    {
        return $user->can('view batch');
    }

    public function create(User $user): bool
    {
        return $user->can('create batch');
    }

    public function update(User $user): bool
    {
        return $user->can('update batch');
    }

    public function delete(User $user): bool
    {
        return $user->can('delete batch');
    }
}
