<?php

namespace App\Policies;

use App\Models\User;

class NotificationPolicy
{
    public function viewAny(User $user): bool
    {
        return $user->can('view notification');
    }

    public function view(User $user): bool
    {
        return $user->can('view notification');
    }

    public function mark_read(User $user): bool
    {
        return $user->can('mark notification unread');
    }
}
