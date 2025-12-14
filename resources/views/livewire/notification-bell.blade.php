<div @style(['position: relative'])>
    <x-filament::dropdown width="xs" max-height="400px">
        <x-slot name="trigger">
            <x-filament::button icon="heroicon-o-bell-alert"></x-filament::button>
        </x-slot>

        @php
            $notifications = \App\Models\Notification::whereNull('read_at')->get();
        @endphp

        <x-filament::dropdown.list>
            @forelse ($notifications as $notification)
                <x-filament::dropdown.list.item wire:click="markRead({{ $notification->id }})" wire:loading.attr="disabled">
                    {{ $notification->message }}
                </x-filament::dropdown.list.item>
            @empty
                <x-filament::dropdown.list.item>
                    لا توجد إشعارات جديدة
                </x-filament::dropdown.list.item>
            @endforelse
        </x-filament::dropdown.list>
    </x-filament::dropdown>

    @if ($notifications->count() > 0)
        <div
            @style([
                'position: absolute',
                'top: 0',
                'right: 0',
                'width: 12px',
                'height: 12px',
                'background-color: red',
                'border-radius: 50%',
                'border: 2px solid white',
                'transform: translate(50%, -50%)',
            ])
        ></div>
    @endif
</div>
