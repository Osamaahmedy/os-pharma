<?php

namespace App\Policies;

use App\Models\User;

class SupplierAccountPolicy
{
    public function viewAny(User $user): bool
    {
        return $user->can('view supplier account');
    }

    public function view(User $user): bool
    {
        return $user->can('view supplier account'); // ✅ أزلنا "sales"
    }

    public function create(User $user): bool
    {
        return $user->can('create supplier account'); // ✅
    }

    public function update(User $user): bool
    {
        return $user->can('update supplier account'); // ✅
    }

    public function delete(User $user): bool
    {
        return $user->can('delete supplier account'); // ✅
    }
}
