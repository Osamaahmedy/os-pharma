<?php

namespace App\Filament\Resources\Roles\Schemas;

use Filament\Forms\Components\CheckboxList;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;
use Spatie\Permission\Models\Permission;

class RoleForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema->components([
            TextInput::make('name')
                ->required()
                ->label(__('fields.name')),

            Section::make(__('fields.permissions'))
                ->components([
                    CheckboxList::make('permissions')
                        ->label('')
                        ->relationship('permissions', 'display_name')
                        ->options(
                            Permission::all()->mapWithKeys(fn($p) => [$p->id => $p->display_name])
                        )
                        ->columns(3)          // ✅ 3 أعمدة جنب بعض
                        ->gridDirection('row') // ✅ يملأ أفقياً
                        ->selectAllAction(     // ✅ زر "تحديد الكل"
                            fn($action) => $action->label('تحديد الكل')
                        )
                        ->deselectAllAction(   // ✅ زر "إلغاء الكل"
                            fn($action) => $action->label('إلغاء الكل')
                        )
                        ->bulkToggleable()     // ✅ يفعّل الزرين
                        ->required(),
                ]),
        ]);
    }
}
