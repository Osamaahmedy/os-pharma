<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
public function up()
{
    if (!Schema::hasTable('examination_prescription_items')) {
        Schema::create('examination_prescription_items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('examination_prescription_id')->constrained(indexName:'examination_prescription_id_foreign')->cascadeOnDelete();
            $table->foreignId('examination_id')->constrained()->cascadeOnDelete();
            $table->string('patient_ratio')->nullable();
            $table->timestamps();
        });
    }
}



    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('examination_prescription_items');
    }
};
