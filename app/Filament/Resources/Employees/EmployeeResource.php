<?php

namespace App\Filament\Resources\Employees;

use App\Filament\Resources\Employees\Pages\ManageEmployees;
use App\Filament\Resources\Employees\Pages\ViewEmployee;
use App\Filament\Resources\Employees\Widgets\TotalEmployeeDebts;
use App\Filament\Resources\Employees\Widgets\TotalEmployeePayments;
use App\Models\Employee;
use BackedEnum;
use Filament\Actions\Action;
use Filament\Actions\DeleteAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use UnitEnum;

class EmployeeResource extends Resource
{
    protected static ?string $model = Employee::class;
    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedUsers;

    public static function getModelLabel(): string
    {
        return __('app.employee');
    }

    public static function getPluralModelLabel(): string
    {
        return __('app.employees');
    }

    public static function getNavigationGroup(): string|UnitEnum|null
    {
        return __('app.hr');
    }

    public static function form(Schema $schema): Schema
    {
        return $schema->components([
            TextInput::make('name')
                ->label(__('fields.name'))
                ->required()
                ->maxLength(255),

            TextInput::make('phone')
                ->label(__('fields.phone'))
                ->tel()
                ->nullable(),
            TextInput::make('salary')
                ->label(__('fields.salary'))
                ->numeric()
                ->nullable(),

            TextInput::make('position')
                ->label(__('fields.position'))
                ->nullable(),

            Toggle::make('is_active')
                ->label(__('fields.is_active'))
                ->default(true),
        ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')
                    ->searchable()
                    ->sortable()
                    ->label(__('fields.name')),

                TextColumn::make('phone')
                    ->placeholder('-')
                    ->label(__('fields.phone')),

                TextColumn::make('position')
                    ->placeholder('-')
                    ->label(__('fields.position')),

                TextColumn::make('account.balance')
    ->label(__('fields.balance'))
    ->formatStateUsing(function ($state) {
        $amount = $state ?? 0;
        $sign   = $amount > 0 ? '-' : ($amount < 0 ? '+' : '');
        return $sign . number_format(abs($amount), 2, '.', ',') . ' ' . config('app.currency', 'ر.ي');
    })
    ->color(fn ($state) => match(true) {
        ($state ?? 0) > 0 => 'danger',   // عليه دين
        ($state ?? 0) < 0 => 'success',  // دفع زيادة
        default           => 'gray',     // صفر
    })
    ->sortable(),

                IconColumn::make('is_active')
                    ->boolean()
                    ->label(__('fields.is_active')),
            ])
            ->defaultSort('created_at', 'desc')
            ->recordActions([
                ViewAction::make(),
                EditAction::make(),
                DeleteAction::make(),
            ]);
    }

    public static function getWidgets(): array
    {
        return [
            TotalEmployeeDebts::class,
            TotalEmployeePayments::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => ManageEmployees::route('/'),
            'view'  => ViewEmployee::route('/{record}'),
        ];
    }
}
