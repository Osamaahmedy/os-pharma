<?php

namespace App\Filament\Resources\CustomerDebts;

use App\Filament\Resources\CustomerDebts\Pages\ManageCustomerDebts;
use App\Filament\Resources\CustomerDebts\Pages\ViewCustomerDebt;
use App\Models\CustomerAccount;
use App\Models\CustomerAccountTransaction;
use App\Models\Invoice;
use BackedEnum;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\ViewAction;
use Filament\Actions\Action;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use UnitEnum;

class CustomerDebtResource extends Resource
{
    protected static ?string $model = CustomerAccount::class;
    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedCurrencyDollar;

    public static function getModelLabel(): string
    {
        return __('app.customer_debt');
    }

    public static function getPluralModelLabel(): string
    {
        return __('app.customer_debts');
    }

    public static function getNavigationGroup(): string|UnitEnum|null
    {
        return __('app.sales');
    }

    public static function table(Table $table): Table
    {
        return $table
            ->modifyQueryUsing(fn ($query) => $query->with('customer')->where('balance', '>', 0))
            ->columns([
                TextColumn::make('customer.name')
                    ->searchable()
                    ->sortable()
                    ->label(__('fields.customer_name')),

                TextColumn::make('balance')
                    ->sortable()
                    ->formatStateUsing(fn ($state) =>
                        number_format($state, 2, '.', ',') . ' ' . config('app.currency', 'ر.ي')
                    )
                    ->color('danger')
                    ->weight('bold')
                    ->label('إجمالي الدين'),

                TextColumn::make('transactions_count')
                    ->counts('transactions')
                    ->label('عدد العمليات')
                    ->badge()
                    ->color('gray'),

                TextColumn::make('updated_at')
                    ->date('d M Y')
                    ->sortable()
                    ->label(__('fields.updated_at')),
            ])
            ->defaultSort('balance', 'desc')
            ->recordActions([
                ViewAction::make(),

                Action::make('settle')
                    ->label('تسوية دين')
                    ->icon('heroicon-o-banknotes')
                    ->color('success')
                    ->form(fn (CustomerAccount $record) => [
                        Select::make('invoice_id')
                            ->label('الفاتورة')
                            ->options(
                                Invoice::where('customer_id', $record->customer_id)
                                    ->whereIn('payment_status', ['unpaid', 'partial'])
                                    ->pluck('invoice_no', 'id')
                            )
                            ->required()           // ✅ ركواير
                            ->searchable()
                            ->helperText('اختر الفاتورة المراد تسويتها'),

                        TextInput::make('amount')
                            ->label('مبلغ الدفع')
                            ->numeric()
                            ->required()
                            ->minValue(0.01)
                            ->prefix(config('app.currency', 'ر.ي'))
                            ->helperText(
                                'الرصيد الحالي: ' . number_format($record->balance, 2) . ' ' . config('app.currency', 'ر.ي')
                            ),

                        Textarea::make('description')
                            ->label(__('fields.description'))
                            ->nullable()
                            ->rows(2),
                    ])
                    ->action(function (CustomerAccount $record, array $data) { // ✅ $record بدل $this
                        self::processSettlement($record, $data);              // ✅ self:: بدل $this->
                    }),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }

    // ✅ منطق التسوية المركزي
    public static function processSettlement(CustomerAccount $account, array $data): void
    {
        $amount    = (float) $data['amount'];
        $invoiceId = $data['invoice_id'] ?? null;

        CustomerAccountTransaction::create([
            'customer_account_id' => $account->id,
            'invoice_id'          => $invoiceId,
            'customer_name'       => $account->customer?->name,
            'amount'              => $amount,
            'type'                => 'payment',
            'description'         => $data['description'] ?? 'تسوية دين',
        ]);

        $newBalance = max($account->balance - $amount, 0);
        $account->update(['balance' => $newBalance]);

        if ($invoiceId) {
            self::updateInvoiceStatus($invoiceId);
        } else {
            self::settleOldestInvoices($account, $amount);
        }

        \Filament\Notifications\Notification::make()
            ->title('تم تسجيل الدفع بنجاح')
            ->success()
            ->send();
    }

    private static function updateInvoiceStatus(int $invoiceId): void
    {
        $invoice = Invoice::find($invoiceId);
        if (! $invoice) return;

        $totalPaid = CustomerAccountTransaction::where('invoice_id', $invoiceId)
            ->where('type', 'payment')
            ->sum('amount');

        if ($totalPaid >= $invoice->total_amount) {
            $invoice->update([
                'payment_status' => 'paid',
                'paid'           => $invoice->total_amount,
            ]);
        } else {
            $invoice->update([
                'payment_status' => 'partial',
                'paid'           => $totalPaid,
            ]);
        }
    }

    private static function settleOldestInvoices(CustomerAccount $account, float $amount): void
    {
        $unpaidInvoices = Invoice::where('customer_id', $account->customer_id)
            ->whereIn('payment_status', ['unpaid', 'partial'])
            ->orderBy('invoice_date')
            ->get();

        $remaining = $amount;

        foreach ($unpaidInvoices as $invoice) {
            if ($remaining <= 0) break;

            $alreadyPaid = (float) ($invoice->paid ?? 0);
            $outstanding = $invoice->total_amount - $alreadyPaid;

            if ($outstanding <= 0) continue;

            $toPay     = min($outstanding, $remaining);
            $remaining -= $toPay;
            $newPaid   = $alreadyPaid + $toPay;

            $invoice->update([
                'paid'           => $newPaid,
                'payment_status' => $newPaid >= $invoice->total_amount ? 'paid' : 'partial',
            ]);
        }
    }

    public static function getPages(): array
    {
        return [
            'index' => ManageCustomerDebts::route('/'),
            'view'  => ViewCustomerDebt::route('/{record}'),
        ];
    }
}
