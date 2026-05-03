<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\InvoicePrintController;

Route::middleware(['auth'])->prefix('print')->name('print.')->group(function () {
    Route::get('/invoice/{invoice}',  [InvoicePrintController::class, 'show'])->name('invoice');
    Route::get('/invoices/bulk',      [InvoicePrintController::class, 'bulk'])->name('invoice.bulk');
});
