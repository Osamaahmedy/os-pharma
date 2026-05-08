<?php

namespace App\Filament\Resources\PurchaseReturns\Schemas;

use App\Models\Batch;
use App\Models\Purchase;
use App\Models\PurchaseItem;
use App\Models\ProductReturn;
use App\Models\ReturnItem;
use App\Models\Supplier;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class ProductReturnForm
{
    public static function configure(Schema $schema): Schema
    {
        $suppliers = Supplier::latest()->get();

        return $schema
            ->components([
                Hidden::make('type')
                    ->default('purchase'),

                Select::make('supplier_id')
                    ->options(fn () => $suppliers->pluck('name', 'id'))
                    ->live()
                    ->label(__('fields.supplier'))
                    ->afterStateUpdated(function ($set) {
                        $set('reference_id', null);
                        $set('items', []);
                    }),

                Select::make('reference_id')
                    ->label(__('fields.invoice_no'))
                    ->live()
                    ->required()
                    // ✅ يجلب الفواتير ديناميكياً عند اختيار المورد
                    ->options(function ($get) {
                        $supplierId = $get('supplier_id');
                        if (! $supplierId) return [];

                        return Purchase::where('supplier_id', $supplierId)
                            ->latest()
                            ->pluck('invoice_no', 'id');
                    })
                    ->searchable()
                    ->afterStateUpdated(fn ($set) => $set('items', [])),

                DatePicker::make('return_date')
                    ->label(__('fields.return_date'))
                    ->required()
                    ->default(now()),

                Repeater::make('items')
                    ->columns(6)
                    ->columnSpanFull()
                    ->minItems(1)
                    ->schema([

                        // ── 1. المنتج ──────────────────────────────────────
                        Select::make('product_id')
                            ->label(__('fields.product'))
                            ->live()
                            ->required()
                            // ✅ يجلب المنتجات ديناميكياً من الفاتورة المختارة
                            // ✅ جلب المنتجات عبر join مع جدول products مباشرة
->options(function ($get) {
    $referenceId = $get('../../reference_id');
    if (! $referenceId) return [];

    return \App\Models\Product::whereIn(
            'id',
            PurchaseItem::where('purchase_id', $referenceId)
                ->pluck('product_id')
                ->unique()
                ->toArray()
        )
        ->pluck('name', 'id');
})
                            ->afterStateUpdated(function ($set) {
                                $set('batch_id', null);
                                $set('available_quantity', null);
                                $set('invoice_quantity', null);
                                $set('unit_price', null);
                            })
                            // ✅ عرض كمية المنتج في فاتورة الشراء
                            ->hint(function ($get) {
                                $referenceId = $get('../../reference_id');
                                $productId   = $get('product_id');

                                if (! $referenceId || ! $productId) return null;

                                $totalPurchaseQty = PurchaseItem::where('purchase_id', $referenceId)
                                    ->where('product_id', $productId)
                                    ->sum('quantity');

                                if (! $totalPurchaseQty) return null;

                                // ✅ بدون whereHas — استخدام join مباشر
                                $alreadyReturned = ReturnItem::whereIn(
                                        'return_id',
                                        ProductReturn::where('reference_id', $referenceId)
                                            ->where('type', 'purchase')
                                            ->pluck('id')
                                    )
                                    ->where('product_id', $productId)
                                    ->sum('quantity');

                                $remaining = max($totalPurchaseQty - $alreadyReturned, 0);

                                return "في الفاتورة: {$totalPurchaseQty} | تم إرجاع: {$alreadyReturned} | متبقي: {$remaining}";
                            })
                            ->hintColor('primary')
                            ->columnSpan(1),

                        // ── 2. الدُّفعة ─────────────────────────────────────
                        Select::make('batch_id')
                            ->label(__('fields.batch_no'))
                            ->required()
                            ->live()
                            ->searchable()
                            ->options(function ($get) {
                                $referenceId = $get('../../reference_id');
                                $productId   = $get('product_id');

                                if (! $referenceId || ! $productId) return [];

                                $batchIds = PurchaseItem::where('purchase_id', $referenceId)
                                    ->where('product_id', $productId)
                                    ->pluck('batch_id')
                                    ->unique()
                                    ->filter()
                                    ->toArray();

                                return Batch::whereIn('id', $batchIds)
                                    ->where('current_quantity', '>', 0)
                                    ->pluck('batch_no', 'id');
                            })
                            ->afterStateUpdated(function ($set, $get) {
                                $batchId     = $get('batch_id');
                                $referenceId = $get('../../reference_id');
                                $productId   = $get('product_id');

                                if (! $batchId) {
                                    $set('available_quantity', null);
                                    $set('invoice_quantity', null);
                                    $set('unit_price', null);
                                    return;
                                }

                                // الكمية المتاحة في المخزن
                                $availableQty = Batch::find($batchId)?->current_quantity ?? 0;
                                $set('available_quantity', $availableQty);

                                // الكمية في فاتورة الشراء
                                $purchaseItem = PurchaseItem::where('purchase_id', $referenceId)
                                    ->where('product_id', $productId)
                                    ->where('batch_id', $batchId)
                                    ->first();

                                $purchaseQty = $purchaseItem?->quantity ?? 0;

                                // ✅ ما سبق إرجاعه — بدون whereHas
                                $alreadyReturned = ReturnItem::whereIn(
                                        'return_id',
                                        ProductReturn::where('reference_id', $referenceId)
                                            ->where('type', 'purchase')
                                            ->pluck('id')
                                    )
                                    ->where('product_id', $productId)
                                    ->where('batch_id', $batchId)
                                    ->sum('quantity');

                                $remainingReturnable = max($purchaseQty - $alreadyReturned, 0);
                                $set('invoice_quantity', $remainingReturnable);

                                $set('unit_price', $purchaseItem?->unit_price);
                            })
                            ->columnSpan(1),

                        // ── 3. المتاح بالمخزن ──────────────────────────────
                        TextInput::make('available_quantity')
                            ->label('المتاح بالمخزن')
                            ->live()
                            ->disabled()
                            ->dehydrated(false)
                            ->numeric()
                            ->suffix('وحدة')
                            ->extraInputAttributes(['class' => 'text-center font-bold'])
                            ->columnSpan(1),

                        // ── 4. المتبقي للإرجاع ─────────────────────────────
                        TextInput::make('invoice_quantity')
                            ->label('متبقي للإرجاع')
                            ->live()
                            ->disabled()
                            ->dehydrated(false)
                            ->numeric()
                            ->suffix('وحدة')
                            ->extraInputAttributes(['class' => 'text-center font-bold'])
                            ->columnSpan(1),

                        // ── 5. الكمية المُرجَعة ─────────────────────────────
                        TextInput::make('quantity')
                            ->label(__('fields.quantity'))
                            ->numeric()
                            ->required()
                            ->live(onBlur: true)
                            ->minValue(1)
                            ->maxValue(function ($get) {
                                $available  = (int) ($get('available_quantity') ?? 9999);
                                $invoiceQty = (int) ($get('invoice_quantity') ?? 9999);
                                return min($available, $invoiceQty);
                            })
                            ->helperText(function ($get) {
                                $available  = $get('available_quantity');
                                $invoiceQty = $get('invoice_quantity');

                                if ($available === null && $invoiceQty === null) return null;

                                $parts = [];
                                if ($available !== null)  $parts[] = 'المخزن: '        . number_format((int) $available);
                                if ($invoiceQty !== null) $parts[] = 'متبقي للإرجاع: ' . number_format((int) $invoiceQty);

                                return implode(' | ', $parts);
                            })
                            ->rules([
                                fn ($get) => function (string $attribute, $value, $fail) use ($get) {
                                    $available  = (int) ($get('available_quantity') ?? 0);
                                    $invoiceQty = (int) ($get('invoice_quantity') ?? 0);
                                    $qty        = (int) $value;

                                    if ($available > 0 && $qty > $available) {
                                        $fail("الكمية ({$qty}) تتجاوز المتاح في المخزن ({$available}).");
                                        return;
                                    }
                                    if ($invoiceQty > 0 && $qty > $invoiceQty) {
                                        $fail("الكمية ({$qty}) تتجاوز المتبقي للإرجاع من الفاتورة ({$invoiceQty}).");
                                    }
                                },
                            ])
                            ->columnSpan(1),

                        // ── 6. سعر الوحدة ──────────────────────────────────
                        TextInput::make('unit_price')
                            ->label(__('fields.unit_price'))
                            ->numeric()
                            ->required()
                            ->readOnly()
                            ->prefix(config('app.currency', 'ر.ي'))
                            ->columnSpan(1),

                        // ── 7. السبب ───────────────────────────────────────
                        TextInput::make('reason')
                            ->label(__('fields.reason'))
                            ->columnSpan(1),
                    ])
                    ->label(__('fields.products'))
                    ->addActionLabel(__('fields.add_item'))
                    ->rules([
                        fn () => function (string $attribute, $value, $fail) {
                            $seen = [];
                            foreach ((array) $value as $index => $item) {
                                $key = ($item['product_id'] ?? '') . '_' . ($item['batch_id'] ?? '');
                                if (isset($seen[$key])) {
                                    $fail('البند رقم ' . ($index + 1) . ': المنتج والدُّفعة مكررة.');
                                }
                                $seen[$key] = true;
                            }
                        },
                    ]),
            ]);
    }
}
