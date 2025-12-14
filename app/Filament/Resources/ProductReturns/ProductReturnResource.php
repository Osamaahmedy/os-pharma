<?php

namespace App\Filament\Resources\ProductReturns;

use App\Filament\Resources\ProductReturns\Pages\CreateProductReturn;
use App\Filament\Resources\ProductReturns\Pages\EditProductReturn;
use App\Filament\Resources\ProductReturns\Pages\ListProductReturns;
use App\Filament\Resources\ProductReturns\Pages\ViewProductReturn;
use App\Filament\Resources\ProductReturns\Schemas\ProductReturnForm;
use App\Filament\Resources\ProductReturns\Schemas\ProductReturnInfolist;
use App\Filament\Resources\ProductReturns\Tables\ProductReturnsTable;
use App\Models\ProductReturn;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use UnitEnum;

class ProductReturnResource extends Resource
{
    public static function getModelLabel(): string
    {
        return __('app.product_return');
    }

    public static function getPluralModelLabel(): string
    {
        return __('app.customer_returns');
    }

    public static function getNavigationGroup(): string|UnitEnum|null
    {
        return __('app.sales');
    }

    protected static ?string $model = ProductReturn::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedArrowUturnLeft;

    protected static ?string $slug = 'customer-returns';

    protected static ?string $recordTitleAttribute = 'ProductReturn';

    public static function form(Schema $schema): Schema
    {
        return ProductReturnForm::configure($schema);
    }

    public static function infolist(Schema $schema): Schema
    {
        return ProductReturnInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return ProductReturnsTable::configure($table);
    }

    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()->where('type', 'invoice');
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => ListProductReturns::route('/'),
            'create' => CreateProductReturn::route('/create'),
            'view' => ViewProductReturn::route('/{record}'),
            'edit' => EditProductReturn::route('/{record}/edit'),
        ];
    }
}
