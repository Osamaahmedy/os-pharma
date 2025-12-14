<?php

namespace App\Filament\Resources\Notifications;

use App\Filament\Resources\Notifications\Pages\ManageNotifications;
use App\Models\Notification;
use BackedEnum;
use Filament\Actions\Action;
use Filament\Tables\Columns\TextColumn;
use Filament\Resources\Resource;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class NotificationResource extends Resource
{
    public static function getModelLabel(): string
    {
        return __('app.notification');
    }

    public static function getPluralModelLabel(): string
    {
        return __('app.notifications');
    }

    protected static ?string $model = Notification::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedBellAlert;

    protected static ?string $recordTitleAttribute = 'Notification';

    public static function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('Notification')
            ->columns([
                TextColumn::make('message')
                    ->label(__('fields.message')),
                TextColumn::make('read_at')
                    ->date('d M Y')
                    ->sortable()
                    ->label(__('fields.read_at'))
                    ->placeholder(__('fields.unread')),
                TextColumn::make('created_at')
                    ->date('d M Y')
                    ->sortable()
                    ->label(__('fields.created_at')),
            ])
            ->filters([
                //
            ])
            ->recordActions([
                Action::make('markRead')
                    ->action(fn (Notification $record) => $record->update(['read_at' => now()]))
                    ->icon(Heroicon::OutlinedCheck)
                    ->label(__('fields.mark_read'))
                    ->visible(fn (Notification $record) => $record->read_at == null),
            ])
            ->toolbarActions([
                //
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => ManageNotifications::route('/'),
        ];
    }
}
