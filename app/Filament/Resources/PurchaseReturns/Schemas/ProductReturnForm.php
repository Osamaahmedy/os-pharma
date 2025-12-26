<?php

namespace App\Filament\Resources\PurchaseReturns\Schemas;

use App\Models\Batch;
use App\Models\Purchase;
use App\Models\PurchaseItem;
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
        $purchases = Purchase::with('products')->latest()->get();

        return $schema
            ->components([
                Hidden::make('type')
                    ->default('purchase'),
                Select::make('supplier_id')
                    ->options(fn () => $suppliers->pluck('name', 'id'))
                    ->reactive()
                    ->label(__('fields.supplier'))
                    ->afterStateUpdated(function ($set) {
                        $set('reference_id', null);
                        $set('items.*.*', null);
                    }),
                Select::make('reference_id')
                    ->label(__('fields.invoice_no'))
                    ->reactive()
                    ->required()
                    ->options(fn ($get) => $purchases->where('supplier_id', $get('supplier_id'))->pluck('invoice_no', 'id'))
                    ->searchable()
                    ->afterStateUpdated(fn ($set) => $set('items.*.*', null)),
                DatePicker::make('return_date')
                    ->label(__('fields.return_date'))
                    ->required(),
                Repeater::make('items')
                    ->columns(4)
                    ->columnSpanFull()
                    ->schema([
                        Select::make('product_id')
                            ->label(__('fields.product'))
                            ->options(fn ($get) => $purchases->find($get('../../reference_id'))?->products->pluck('name', 'id'))
                            ->reactive()
                            ->required()
                            ->afterStateUpdated(fn ($set) => $set('batch_id', null)),
                        Select::make('batch_id')
                            ->label(__('fields.batch_no'))
                            ->required()
                            ->reactive()
                            ->searchable()
                            ->options(function ($get) {
                                $batchIds = PurchaseItem::where('purchase_id', $get('../../reference_id'))
                                    ->where('product_id', $get('product_id'))->get()->toArray();

                                return Batch::whereIn('id', array_unique(array_column($batchIds, 'batch_id')))->pluck('batch_no', 'id');
                            }),
                        TextInput::make('quantity')
                            ->label(__('fields.quantity'))
                            ->numeric()
                            ->required()
                            ->minValue(1),
                        TextInput::make('reason')
                            ->label(__('fields.reason'))
                    ])
                    ->label(__('fields.products'))
                    ->addActionLabel(__('fields.add_item'))
            ]);
    }
}
