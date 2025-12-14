<?php

namespace App\Filament\Resources\ActivityLogs;

use App\Filament\Resources\ActivityLogs\Pages\ManageActivityLogs;
use Spatie\Activitylog\Models\Activity;
use BackedEnum;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Resources\Resource;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class ActivityLogResource extends Resource
{
    public static function getPluralModelLabel(): string
    {
        return __('app.activity_logs');
    }

    protected static ?string $model = Activity::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedClipboardDocument;

    protected static ?string $recordTitleAttribute = 'ActivityLog';

    public static function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('ActivityLog')
            ->columns([
                TextColumn::make('description')
                    ->searchable(),
                TextColumn::make('properties')
                    ->listWithLineBreaks()
                    ->getStateUsing(function (Activity $record): array {
                        $properties = $record->properties;
                        $changes = json_decode($properties ?? '{}', true)['attributes'] ?? [];

                        $output = [];
                        foreach ($changes as $key => $newValue) {
                            $oldValue = $properties['old'][$key] ?? 'N/A';
                            $label = str_replace('_', ' ', ucfirst($key));
                            $output[] = "**{$label}** changed from **{$oldValue}** to **{$newValue}**";
                        }
                        return $output;
                    })
                    ->markdown()
                    ->limitList(3)
                    ->expandableLimitedList(),
                    TextColumn::make('causer.name')
                        ->label('User')
                        ->sortable()
                        ->searchable(),
                    TextColumn::make('created_at')
                        ->label(__('fields.created_at'))
                        ->date('d M Y')
                        ->sortable(),
            ])
            ->searchable(false)
            ->defaultSort('created_at', 'desc')
            ->filters([
                //
            ])
            ->recordActions([
                // ViewAction::make(),
                // EditAction::make(),
                // DeleteAction::make(),
            ])
            ->toolbarActions([
                // BulkActionGroup::make([
                //     DeleteBulkAction::make(),
                // ]),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => ManageActivityLogs::route('/'),
        ];
    }
}
