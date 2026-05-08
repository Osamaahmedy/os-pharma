<?php

namespace App\Filament\Resources\EmployeeDebts\Schemas;

use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;

class EmployeeDebtInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema->components([
            Section::make()->columns(3)->schema([
                TextEntry::make('employee.name')
                    ->label(__('fields.employee')),

                TextEntry::make('employee.phone')
                    ->placeholder('-')
                    ->label(__('fields.phone')),

                TextEntry::make('employee.salary')
                    ->numeric()
                    ->placeholder('-')
                    ->label(__('fields.salary')),

                TextEntry::make('employee.position')
                    ->placeholder('-')
                    ->label(__('fields.position')),

                TextEntry::make('balance')
                    ->formatStateUsing(function ($state) {
                        $amount = $state ?? 0;
                        $sign   = $amount > 0 ? '-' : ($amount < 0 ? '+' : '');
                        return $sign . number_format(abs($amount), 2, '.', ',') . ' ' . config('app.currency', 'ر.ي');
                    })
                    ->color(fn ($state) => match(true) {
                        ($state ?? 0) > 0 => 'danger',
                        ($state ?? 0) < 0 => 'success',
                        default           => 'gray',
                    })
                    ->weight('bold')
                    ->label(__('fields.balance')),
            ]),
        ]);
    }
}
