<?php

namespace App\Services;

use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\Log;
use SimpleSoftwareIO\QrCode\Facades\QrCode;

class PrintService
{
    public static function printPrescription($data)
    {
        try {
            Log::info("Prescription Created: " . json_encode($data, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));

            // معالجة المفاتيح المفقودة
            $pharmacy_name = $data['pharmacy_name'] ?? 'Pharmacy';
            $reference_id  = $data['id'] ?? 'N/A';
            $invoice_id    = $data['id'] ?? 'N/A';

            // إنشاء QR يحتوي رقم الفاتورة

         $html = '
<html lang="ar" dir="rtl">
<head>
<meta charset="utf-8">
<style>

    body {
        font-family: "amiri", sans-serif;
        direction: rtl;
        text-align: right;
        font-size: 14px;
        margin: 25px;
        color: #333;
    }
        body {
    font-family: "amiri", serif;
    direction: rtl;
    text-align: right;
}


    .header {
        padding: 15px;
        border-bottom: 3px solid #1572C0;
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: #F0F8FF;
        border-radius: 6px;
        margin-bottom: 20px;
    }

    .header .title {
        font-size: 24px;
        color: #0C4A6E;
        font-weight: bold;
    }

    .meta-line {
        font-size: 15px;
        margin: 3px 0;
    }

    .qr-box {
        background: #fff;
        padding: 5px;
        border: 1px solid #1572C0;
        border-radius: 8px;
    }

    .section-title {
        background: #1572C0;
        color: #fff;
        padding: 8px;
        font-size: 16px;
        border-radius: 5px;
        margin-top: 15px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 8px;
    }

    th {
        background: #0C4A6E;
        color: white;
        padding: 7px;
        font-size: 13px;
        border: 1px solid #fff;
    }

    td {
        padding: 7px;
        border: 1px solid #1572C0;
        font-size: 13px;
    }

    .footer {
        position: fixed;
        bottom: 10px;
        left: 0;
        right: 0;
        text-align: center;
        font-size: 13px;
        color: #444;
        border-top: 1px solid #1572C0;
        padding-top: 5px;
    }

</style>
</head>

<body>

    <div class="header">
        <div>
            <div class="title">' . $pharmacy_name . '</div>
            <div class="meta-line">المرجع: <strong>' . $reference_id . '</strong></div>
            <div class="meta-line">رقم الفاتورة: <strong>' . $invoice_id . '</strong></div>
        </div>
    </div>

    <div class="section-title">بيانات المريض</div>
    <p><strong>اسم المريض:</strong> ' . $data["patient_name"] . '</p>
    <p><strong>العمر:</strong> ' . $data["age"] . ' — <strong>النوع:</strong> ' . ucfirst($data["gender"]) . '</p>

    <div class="section-title">العناصر</div>

    <table>
        <thead>
            <tr>
                <th>العنصر</th>
                <th>القيمة الطبيعية</th>
                <th>الوحدة</th>
                <th>القسم</th>
                <th>قيمة المريض</th>
            </tr>
        </thead>
        <tbody>
';

foreach ($data['items'] as $item) {
    $html .= '
        <tr>
            <td>' . $item['name'] . '</td>
            <td>' . $item['normal_ratio'] . '</td>
            <td>' . $item['unit'] . '</td>
            <td>' . $item['department'] . '</td>
            <td>' . $item['patient_ratio'] . '</td>
        </tr>
    ';
}

$html .= '
        </tbody>
    </table>

    <div class="footer">
        صيدلية ' . $pharmacy_name . ' — جميع الحقوق محفوظة
    </div>

</body>
</html>
';


            // A4 PDF
            $pdf = Pdf::loadHTML($html)->setPaper('A4', 'portrait');

            $filename = 'invoice_' . now()->format('Ymd_His') . '.pdf';
            $pdf->save(storage_path("app/public/{$filename}"));

            return $filename;

        } catch (\Exception $e) {
            Log::error("PDF Print Error: " . $e->getMessage());
            return false;
        }
    }
}
