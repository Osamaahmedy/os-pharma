<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
   public function up(): void
{
    Schema::table('invoice_items', function (Blueprint $table) {
        // 1) حذف الـ foreign key على invoice_id (هو اللي يحمي الـ unique)
        $table->dropForeign('invoice_items_invoice_id_foreign');

        // 2) حذف الـ unique index
        $table->dropUnique('invoice_items_invoice_id_product_id_unique');

        // 3) إعادة الـ foreign key على invoice_id
        $table->foreign('invoice_id')
              ->references('id')
              ->on('invoices')
              ->onDelete('cascade');
    });
}

public function down(): void
{
    Schema::table('invoice_items', function (Blueprint $table) {
        $table->dropForeign(['invoice_id']);
        $table->unique(['invoice_id', 'product_id']);
        $table->foreign('invoice_id')
              ->references('id')
              ->on('invoices')
              ->onDelete('cascade');
    });
}
};
