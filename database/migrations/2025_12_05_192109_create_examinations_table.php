<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('examinations', function (Blueprint $table) {
            $table->id();

            $table->string('scientific_name');  // الاسم العلمي للفحص
            $table->string('normal_ratio')->nullable(); // النسبة الطبيعية

            // علاقات One To One إلى قسم الفحوصات
            $table->foreignId('department_id')
                ->constrained('examination_departments')
                ->cascadeOnDelete();

            // علاقة إلى وحدات الفحوصات
            $table->foreignId('unit_id')
                ->constrained('examination_units')
                ->cascadeOnDelete();

            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('examinations');
    }
};
