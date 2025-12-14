<?php

namespace App\Livewire;

use App\Models\Notification;
use Livewire\Component;

class NotificationBell extends Component
{
    protected static string $view = 'livewire.notification-bell';

    public $notification;

    public function mount()
    {
        $this->notification = Notification::whereNull('read_at')->get();
    }

    public function markRead(int $id)
    {
        $this->authorize('mark_read', Notification::class);

        $notification = Notification::find($id);

        if (! $notification) {
            return;
        }

        $notification->read_at = now();
        $notification->save();

        $this->notification = Notification::whereNull('read_at')->get();
    }
}