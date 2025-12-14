<?php

namespace App\Filament\Resources\PurchaseReturns;

use App\Filament\Resources\PurchaseReturns\Pages\CreateProductReturn;
use App\Filament\Resources\PurchaseReturns\Pages\EditProductReturn;
use App\Filament\Resources\PurchaseReturns\Pages\ListProductReturns;
use App\Filament\Resources\PurchaseReturns\Pages\ViewProductReturn;
use App\Filament\Resources\PurchaseReturns\Schemas\ProductReturnForm;
use App\Filament\Resources\PurchaseReturns\Schemas\ProductReturnInfolist;
use App\Filament\Resources\PurchaseReturns\Tables\ProductReturnsTable;
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
        return __('app.purchase_returns');
    }

    public static function getNavigationGroup(): string|UnitEnum|null
    {
        return __('app.purchases');
    }

    protected static ?string $model = ProductReturn::class;

    protected static ?string $slug = 'purchase-returns';

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedArrowUturnRight;

    protected static ?string $recordTitleAttribute = 'PurchaseReturn';

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
        return parent::getEloquentQuery()->where('type', 'purchase');
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
