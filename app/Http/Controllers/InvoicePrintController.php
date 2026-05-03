<?php

namespace App\Http\Controllers;

use App\Models\Invoice; // ← عدّل المسار حسب مشروعك
use Illuminate\Http\Request;

class InvoicePrintController extends Controller
{
    /**
     * طباعة فاتورة واحدة
     * Route: GET /print/invoice/{invoice}
     */
    public function show(Invoice $invoice)
    {
        abort_unless(auth()->check(), 403);

        $invoice->loadMissing([
            'items.product',
            'items.unit.unit',
            'createdBy',
        ]);

        return view('print.invoice', [
            'record' => $invoice,
        ]);
    }

    /**
     * طباعة جماعية
     * Route: GET /print/invoices/bulk?ids=1,2,3
     */
    public function bulk(Request $request)
    {
        abort_unless(auth()->check(), 403);

        $ids = array_filter(explode(',', $request->input('ids', '')));

        abort_if(empty($ids), 422, 'لم يتم تحديد أي فاتورة');

        $invoices = Invoice::whereIn('id', $ids)
            ->with([
                'items.product',
                'items.unit.unit',
                'createdBy',
            ])
            ->orderBy('invoice_date', 'desc')
            ->get();

        abort_if($invoices->isEmpty(), 404);

        return view('print.invoice-bulk', [
            'invoices' => $invoices,
        ]);
    }
}
