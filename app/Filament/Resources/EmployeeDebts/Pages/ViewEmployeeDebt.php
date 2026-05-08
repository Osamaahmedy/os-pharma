<?php

namespace App\Filament\Resources\EmployeeDebts\Pages;

use App\Filament\Resources\EmployeeDebts\EmployeeDebtResource;
use Filament\Actions\Action;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Resources\Pages\ViewRecord;

class ViewEmployeeDebt extends ViewRecord
{
    protected static string $resource = EmployeeDebtResource::class;

    protected function getHeaderActions(): array
    {
        return [
            // ✅ زر إضافة سريع في أعلى الصفحة أيضاً
            Action::make('add_transaction')
                ->label(__('app.add_transaction'))
                ->icon('heroicon-o-plus')
                ->color('primary')
                ->form([
                    Select::make('type')
                        ->label(__('fields.type'))
                        ->options([
                            'withdrawal' => __('fields.withdrawal'),
                            'payment'    => __('fields.payment'),
                        ])
                        ->required(),

                    TextInput::make('amount')
                        ->label(__('fields.amount'))
                        ->numeric()
                        ->required()
                        ->minValue(0.01)
                        ->prefix(config('app.currency', 'ر.ي')),

                    Textarea::make('description')
                        ->label(__('fields.description'))
                        ->nullable()
                        ->rows(2),
                ])
                ->action(function (array $data) {
                    $account = $this->record;
                    $account->transactions()->create($data);

                    if ($data['type'] === 'withdrawal') {
                        $account->increment('balance', $data['amount']);
                    } else {
                        $account->decrement('balance', $data['amount']);
                    }

                    // ✅ تحديث الصفحة لإظهار الرصيد الجديد
                    $this->refreshFormData(['balance']);
                }),
        ];
    }
}
