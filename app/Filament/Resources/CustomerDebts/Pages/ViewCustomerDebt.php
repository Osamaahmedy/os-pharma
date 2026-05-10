<?php

namespace App\Filament\Resources\CustomerDebts\Pages;

use App\Filament\Resources\CustomerDebts\CustomerDebtResource;
use App\Models\CustomerAccountTransaction;
use App\Models\Invoice;
use Filament\Actions\Action;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Infolists\Components\RepeatableEntry;
use Filament\Infolists\Components\TextEntry;
use Filament\Resources\Pages\ViewRecord;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;

class ViewCustomerDebt extends ViewRecord
{
    protected static string $resource = CustomerDebtResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Action::make('settle')
                ->label('تسوية دين')
                ->icon('heroicon-o-banknotes')
                ->color('success')
                ->form(fn () => [
                    Select::make('invoice_id')
                        ->label('الفاتورة')
                        ->options(
                            Invoice::where('customer_id', $this->record->customer_id)
                                ->whereIn('payment_status', ['unpaid', 'partial'])
                                ->pluck('invoice_no', 'id')
                        )
                        ->required()
                        ->searchable()
                        ->helperText('اختر الفاتورة المراد تسويتها'),

                    TextInput::make('amount')
                        ->label('مبلغ الدفع')
                        ->numeric()
                        ->required()
                        ->minValue(0.01)
                        ->prefix(config('app.currency', 'ر.ي'))
                        ->helperText(
                            'الرصيد الحالي: ' . number_format($this->record->balance, 2) . ' ' . config('app.currency', 'ر.ي')
                        ),

                    Textarea::make('description')
                        ->label(__('fields.description'))
                        ->nullable()
                        ->rows(2),
                ])
                ->action(function (array $data) {
                    CustomerDebtResource::processSettlement($this->record, $data);
                    $this->refreshFormData(['balance']);
                }),
        ];
    }

    public function infolist(Schema $schema): Schema
    {
        return $schema->components([

            // ── معلومات العميل ───────────────────────────
            Section::make('معلومات العميل')
                ->columns(3)
                ->schema([
                    TextEntry::make('customer.name')
                        ->label(__('fields.customer_name')),

                    TextEntry::make('customer.phone')
                        ->placeholder('-')
                        ->label(__('fields.phone')),

                    TextEntry::make('balance')
                        ->formatStateUsing(fn ($state) =>
                            number_format($state, 2, '.', ',') . ' ' . config('app.currency', 'ر.ي')
                        )
                        ->color('danger')
                        ->weight('bold')
                        ->label('إجمالي الدين'),
                ]),

            // ── سجل العمليات ─────────────────────────────
            RepeatableEntry::make('transactions')
                ->label('سجل العمليات')
                ->columnSpanFull()
                ->columns(5)
                ->schema([
                    TextEntry::make('created_at')
                        ->date('d M Y')
                        ->label(__('fields.date')),

                    TextEntry::make('type')
                        ->badge()
                        ->formatStateUsing(fn ($state) => match ($state) {
                            'debt'             => 'دين',
                            'payment'          => 'دفع',
                            'return_deduction' => 'خصم مرتجع',
                            'return_credit'    => 'رصيد دائن',
                            default            => $state,
                        })
                        ->color(fn ($state) => match ($state) {
                            'debt'             => 'danger',
                            'payment'          => 'success',
                            'return_deduction' => 'warning',
                            'return_credit'    => 'info',
                            default            => 'gray',
                        })
                        ->label(__('fields.type')),

                    TextEntry::make('invoice.invoice_no')
                        ->badge()
                        ->color('gray')
                        ->placeholder('-')
                        ->label(__('fields.invoice_no')),

                    TextEntry::make('amount')
                        ->formatStateUsing(fn ($state) =>
                            number_format($state, 2, '.', ',') . ' ' . config('app.currency', 'ر.ي')
                        )
                        ->label(__('fields.amount')),

                    TextEntry::make('description')
                        ->placeholder('-')
                        ->label(__('fields.description')),
                ]),
        ]);
    }
}
