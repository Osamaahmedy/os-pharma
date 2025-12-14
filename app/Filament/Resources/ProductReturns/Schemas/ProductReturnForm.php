<?php

namespace App\Filament\Resources\ProductReturns\Schemas;

use App\Models\Batch;
use App\Models\Invoice;
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
        $invoices = Invoice::with('products')->latest()->get();

        return $schema
            ->components([
                Hidden::make('type')
                    ->default('invoice'),
                Select::make('reference_id')
                    ->label(__('fields.invoice_no'))
                    ->reactive()
                    ->required()
                    ->options(fn () => $invoices->pluck('invoice_no', 'id'))
                    ->searchable(),
                DatePicker::make('return_date')
                    ->label(__('fields.return_date'))
                    ->required(),
                Repeater::make('items')
                    ->columns(4)
                    ->columnSpanFull()
                    ->schema([
                        Select::make('product_id')
                            ->label(__('fields.product'))
                            ->reactive()
                            ->options(fn ($get) => $invoices->find($get('../../reference_id'))?->products->pluck('name', 'id'))
                            ->reactive()
                            ->required(),
                        Select::make('batch_id')
                            ->label(__('fields.batch_no'))
                            ->required()
                            ->options(fn (callable $get) => Batch::where('product_id', $get('product_id'))->orderBy('batch_no')->pluck('batch_no', 'id')),
                        // TextInput::make('unit_price')
                        //     ->label(__('fields.unit_price'))
                        //     ->numeric()
                        //     ->required(),
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
