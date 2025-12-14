<?php

namespace App\Policies;

use App\Models\User;

class InvoicePolicy
{
    public function viewAny(User $user): bool
    {
        return $user->can('view invoice');
    }

    public function view(User $user): bool
    {
        return $user->can('view invoice');
    }

    public function create(User $user): bool
    {
        return $user->can('create invoice');
    }

    public function update(User $user): bool
    {
        return $user->can('update invoice');
    }

    public function delete(User $user): bool
    {
        return $user->can('delete invoice');
    }
}
