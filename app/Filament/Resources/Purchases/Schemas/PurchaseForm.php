<?php

namespace App\Filament\Resources\Purchases\Schemas;

use App\Models\Batch;
use App\Models\Product;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class PurchaseForm
{
    public static function configure(Schema $schema): Schema
    {
        $products = Product::with('units')->orderBy('name')->get();
        return $schema
            ->components([
                Select::make('supplier_id')
                    ->relationship('supplier', 'name')
                    ->label(__('fields.supplier')),
                TextInput::make('total_amount')
                    ->required()
                    ->numeric()
                    ->disabled()
                    ->default(0.0)
                    ->label(__('fields.total_amount')),
                Select::make('payment_status')
                    ->options([
                        'paid' => __('fields.payment.paid'),
                        'unpaid' => __('fields.payment.unpaid'),
                        'partial' => __('fields.payment.partial'),
                    ])
                    ->default('unpaid')
                    ->required()
                    ->reactive()
                    ->label(__('fields.payment.status')),
                TextInput::make('paid')
                    ->default(0)
                    ->numeric()
                    ->label(__('fields.paid'))
                    ->disabled(fn ($get) => $get('payment_status') !== 'partial'),
                DatePicker::make('purchase_date')
                    ->required()
                    ->label(__('fields.purchase_date')),
                Repeater::make('items')
                    ->label(__('fields.purchase_items'))
                    ->columns(6)
                    ->columnSpanFull()
                    ->schema([
                        Select::make('product_id')
                            ->label(__('fields.product'))
                            ->options(fn () => $products->pluck('name', 'id'))
                            ->reactive()
                            ->required()
                            ->afterStateUpdated(
                                fn (callable $get, callable $set) => $set('unit_price', $products->where('id', $get('product_id'))->first()?->units->where('pivot.is_base', 1)->first()?->pivot->price)
                            ),
                        Select::make('batch_id')
                            ->label(__('fields.batch_no'))
                            ->options(fn (callable $get) => Batch::where('product_id', $get('product_id'))->orderBy('batch_no')->pluck('batch_no', 'id'))
                            ->reactive()
                            ->afterStateUpdated(function ($get, $set) {
                                $batch = Batch::find($get('batch_id'));
                                if ($batch) {
                                    $set('expiry_date', $batch->expiry_date);
                                }
                            }),
                        DatePicker::make('expiry_date')
                            ->required()
                            ->label(__('fields.expiry_date')),
                        TextInput::make('unit_price')
                            ->label(__('fields.unit_price'))
                            ->numeric()
                            ->reactive()
                            ->lazy()
                            ->required()
                            ->afterStateUpdated(function (callable $get, callable $set, $state) use ($products) {
                                $set('total_price', (int) $state * (int) $get('quantity'));
                            }),
                        TextInput::make('quantity')
                            ->label(__('fields.quantity'))
                            ->numeric()
                            ->reactive()
                            ->lazy()
                            ->required()
                            ->minValue(1)
                            ->afterStateUpdated(function (callable $get, callable $set, $state) {
                                $set('total_price', (int) $state * (int) $get('unit_price'));
                            }),
                        TextInput::make('total_price')
                            ->label(__('fields.total_price'))
                            ->numeric()
                            ->disabled(),
                    ])->afterStateUpdated(function (callable $get, callable $set, $state) {
                        $items = $state ?? [];
                        $sum = 0;
                        foreach ($items as $it) {
                            $sum += (((int) $it['quantity']) * ((int) $it['unit_price']));
                        }

                        $discount = $get('discount') ?? 0;
                        $set('total_amount', $sum - $discount);
                    })
                    ->addActionLabel(__('fields.add_item'))
            ]);
    }
}
