<?php

namespace App\Policies;

use App\Models\User;

class CustomerAccountTransactionPolicy
{
    public function viewAny(User $user): bool
    {
        return $user->can('view customer account transaction');
    }

    public function view(User $user): bool
    {
        return $user->can('view customer account transaction');
    }

    public function create(User $user): bool
    {
        return $user->can('create customer account transaction');
    }

    public function update(User $user): bool
    {
        return $user->can('update customer account transaction');
    }

    public function delete(User $user): bool
    {
        return $user->can('delete customer account transaction');
    }
}
