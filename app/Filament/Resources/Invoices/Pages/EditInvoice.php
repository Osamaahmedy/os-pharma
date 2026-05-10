<?php

namespace App\Filament\Resources\Invoices\Pages;

use App\Filament\Resources\Invoices\InvoiceResource;
use App\Models\Batch;
use App\Models\CustomerAccountTransaction;
use App\Models\ProductUnit;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Support\Facades\DB;
use App\Models\CustomerAccount;              // ✅ أضف هذا
class EditInvoice extends EditRecord
{
    protected static string $resource = InvoiceResource::class;

    protected array $invoiceItems    = [];
    protected array $oldInvoiceItems = [];

    // ── تحميل البيانات ────────────────────────────────────────
   protected function mutateFormDataBeforeFill(array $data): array
{
    $items = $this->record->items()->get();

    $data['items'] = $items->map(fn ($item) => [
        'product_id'         => $item->product_id,
        'unit_id'            => $item->unit_id,
        'quantity'           => $item->quantity,
        'quantity_base'      => $item->quantity_base,
        'unit_price'         => $item->unit_price,
        'base_price'         => $item->base_price,
        'total_price'        => $item->total_price,
        'remaining_quantity' => 0,
    ])->toArray();

    return $data;
}

    // ── قبل الحفظ ─────────────────────────────────────────────
    protected function mutateFormDataBeforeSave(array $data): array
{
    // ✅ دائماً اقرأ القديم من DB في نفس اللحظة قبل الحفظ
    $this->oldInvoiceItems = $this->record->items()
        ->get(['product_id', 'quantity_base'])
        ->map(fn ($item) => [
            'product_id'    => $item->product_id,
            'quantity_base' => (float) $item->quantity_base,
        ])->toArray();

    $this->invoiceItems = $data['items'] ?? [];
    unset($data['items']);

    foreach ($this->invoiceItems as &$item) {
        $item['quantity_base'] = (float) ($item['quantity'] ?? 0);
    }
    unset($item);

    $subtotal = collect($this->invoiceItems)
        ->sum(fn ($i) => (float) ($i['quantity'] ?? 0) * (float) ($i['unit_price'] ?? 0));

    $data['total_amount'] = max($subtotal - (float) ($data['discount'] ?? 0), 0);

    return $data;
}

    // ── بعد الحفظ ─────────────────────────────────────────────
    protected function afterSave(): void
    {
        DB::transaction(function () {
            $this->adjustInventory();
            $this->rebuildItems();
            $this->updateCustomerDebt();
        });
    }

    // ── تعديل المخزون بالفرق فقط ─────────────────────────────
    private function adjustInventory(): void
    {
        // جمّع القديم
        $oldMap = [];
        foreach ($this->oldInvoiceItems as $old) {
            $pid = $old['product_id'];
            $oldMap[$pid] = ($oldMap[$pid] ?? 0) + (float) $old['quantity_base'];
        }

        // جمّع الجديد
        $newMap = [];
        foreach ($this->invoiceItems as $item) {
            $pid = $item['product_id'];
            $newMap[$pid] = ($newMap[$pid] ?? 0) + (float) ($item['quantity_base'] ?? 0);
        }

        $allProducts = array_unique(array_merge(array_keys($oldMap), array_keys($newMap)));

        foreach ($allProducts as $productId) {
            $oldQty = $oldMap[$productId] ?? 0;
            $newQty = $newMap[$productId] ?? 0;
            $diff   = $newQty - $oldQty;

            if ($diff == 0) continue;

            $batches = Batch::where('product_id', $productId)
                ->orderBy('expiry_date')
                ->get();

            if ($diff > 0) {
                // ✅ الكمية زادت → اخصم الفرق من المخزون
                $remaining = $diff;
                foreach ($batches->where('current_quantity', '>', 0) as $batch) {
                    if ($remaining <= 0) break;
                    $deduct = min((float) $batch->current_quantity, $remaining);
                    $batch->decrement('current_quantity', $deduct);
                    $remaining -= $deduct;
                }
            } else {
                // ✅ الكمية نقصت → أرجع الفرق للمخزون
                $toReturn = abs($diff);
                foreach ($batches as $batch) {
                    if ($toReturn <= 0) break;
                    $batch->increment('current_quantity', $toReturn);
                    $toReturn = 0;
                }
            }
        }
    }

    // ── إعادة بناء البنود ─────────────────────────────────────
    private function rebuildItems(): void
    {
        $this->record->items()->delete();

        foreach ($this->invoiceItems as $item) {
            $quantity  = (float) ($item['quantity']  ?? 0);
            $unitPrice = (float) ($item['unit_price'] ?? 0);

            $this->record->items()->create([
                'product_id'    => $item['product_id'],
                'unit_id'       => $item['unit_id'],
                'quantity'      => $quantity,
                'quantity_base' => (float) ($item['quantity_base'] ?? $quantity),
                'unit_price'    => $unitPrice,
                'base_price'    => (float) ($item['base_price'] ?? 0),
                'total_price'   => $quantity * $unitPrice,
            ]);
        }
    }

    // ── تحديث دين العميل ──────────────────────────────────────
  private function updateCustomerDebt(): void
{
    $invoice = $this->record->fresh();

    // ✅ احذف الدين القديم واخصم من الرصيد
    $oldDebt = CustomerAccountTransaction::where('invoice_id', $invoice->id)
        ->where('type', 'debt')
        ->first();

    if ($oldDebt) {
        $account = CustomerAccount::where('customer_id', $invoice->customer_id)->first();
        $account?->decrement('balance', $oldDebt->amount);
        $oldDebt->delete();
    }

    if ($invoice->payment_status === 'paid') return;
    if (blank($invoice->customer_name)) return;

    $debtAmount = match ($invoice->payment_status) {
        'partial' => max($invoice->total_amount - (float) ($invoice->paid ?? 0), 0),
        default   => (float) $invoice->total_amount,
    };

    if ($debtAmount <= 0) return;

    $account = CustomerAccount::firstOrCreate(
        ['customer_id' => $invoice->customer_id],
        ['balance'     => 0]
    );

    CustomerAccountTransaction::create([
        'customer_account_id' => $account->id,
        'invoice_id'          => $invoice->id,
        'customer_name'       => $invoice->customer_name,
        'amount'              => $debtAmount,
        'type'                => 'debt',
        'description'         => 'دين فاتورة ' . $invoice->invoice_no,
    ]);

    $account->increment('balance', $debtAmount);
}

    protected function getHeaderActions(): array
    {
        return [
            Actions\ViewAction::make(),
            Actions\DeleteAction::make(),

            Actions\Action::make('print')
                ->label('طباعة')
                ->icon('heroicon-o-printer')
                ->color('gray')
                ->url(fn (): string => route('print.invoice', $this->record->id))
                ->openUrlInNewTab(),
        ];
    }
}
