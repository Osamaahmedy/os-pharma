<?php

namespace App\Filament\Resources\Invoices\Schemas;

use App\Models\Batch;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use App\Models\Product;
use App\Models\ProductUnit;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Textarea;
use Filament\Schemas\Schema;

class InvoiceForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('total_amount')
                    ->disabled()
                    ->numeric()
                    ->label(__('fields.total_amount')),
                TextInput::make('discount')
                    ->numeric()
                    ->default(0)
                    ->lazy()
                    ->afterStateUpdated(function (callable $get, callable $set, $state) {
                        $items = $get('items') ?: [];
                        $sum = 0;
                        foreach ($items as $it) {
                            $sum += (($it['quantity'] ?? 0) * ($it['unit_price'] ?? 0));
                        }

                        $set('total_amount', $sum - ($state ?? 0));
                    })
                    ->label(__('fields.discount')),
                TextInput::make('paid')
                    ->default(0)
                    ->numeric()
                    ->label(__('fields.paid'))
                    ->disabled(fn ($get) => $get('payment_status') !== 'partial'),
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
                TextInput::make('customer_name')
                    ->disabled(fn ($get) => $get('payment_status') == 'paid')
                    ->label(__('app.customers')),
                Textarea::make('note')
                    ->label(__('fields.note')),
                DatePicker::make('invoice_date')
                    ->required()
                    ->label(__('fields.invoice_date')),
                Repeater::make('items')
                    ->label(__('fields.invoice_items'))
                    ->columns(6)
                    ->columnSpanFull()
                    ->schema([
                        Select::make('product_id')
                            ->label(__('fields.product'))
                            ->options(fn () => Product::orderBy('name')->pluck('name', 'id'))
                            ->reactive()
                            ->required()
                            ->afterStateUpdated(fn ($set, $state) => 
                                $set('remaining_quantity', Batch::where('product_id', $state)?->sum('current_quantity'))),

                        Select::make('unit_id')
                            ->label(__('fields.unit'))
                            ->options(function (callable $get) {
                                $units = [];
                                $productUnits = ProductUnit::with('unit')
                                    ->where('product_id', $get('product_id'))
                                    ->get();
                                foreach ($productUnits as $unit) {
                                    $units[$unit->id] = $unit->unit->name;
                                }
                                return $units;
                            })
                            ->reactive()
                            ->required()
                            ->afterStateUpdated(function (callable $get, callable $set, $state) {
                                $units = ProductUnit::where('product_id', $get('product_id'))->get();
                                $unitPrice = $units->where('id', $state)->first()?->price;
                                $basePrice = $units->where('is_base', true)->first()?->price;
                                $set('unit_price', $unitPrice);
                                $set('base_price', $basePrice);
                                $set('total_price', $unitPrice * (int) $get('quantity'));
                            }),

                        Hidden::make('base_price'),

                        TextInput::make('unit_price')
                            ->label(__('fields.unit_price'))
                            ->numeric()
                            ->reactive()
                            ->lazy()
                            ->required()
                            ->afterStateUpdated(function (callable $get, callable $set, $state) {
                                $price = $state ?? 0;
                                $qty = $get('quantity') ?? 0;
                                $set('total_price', $qty * $price);
                            }),

                        TextInput::make('quantity')
                            ->label(__('fields.quantity'))
                            ->numeric()
                            ->reactive()
                            ->lazy()
                            ->required()
                            ->minValue(1)
                            ->default(1)
                            ->afterStateUpdated(function (callable $get, callable $set, $state) {
                                $qty = $state ?? 0;
                                $price = $get('unit_price') ?? 0;
                                $set('total_price', $qty * $price);
                            }),

                        TextInput::make('remaining_quantity')
                            ->default(0)
                            ->disabled()
                            ->label(__('fields.current_quantity')),

                        TextInput::make('total_price')
                            ->label(__('fields.total_price'))
                            ->numeric()
                            ->disabled(),
                    ])
                    ->afterStateUpdated(function (callable $get, callable $set, $state) {
                        $items = $state ?: [];
                        $sum = 0;
                        foreach ($items as $it) {
                            $sum += (((int) $it['quantity']) * ((int) $it['unit_price']));
                        }

                        $discount = $get('discount') ?? 0;
                        $set('total_amount', $sum - $discount);
                    })
                    ->addActionLabel(__('fields.add_item')),
            ]);
    }
}
