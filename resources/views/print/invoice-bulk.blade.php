<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
  <meta charset="UTF-8">
  <title>طباعة {{ $invoices->count() }} فاتورة</title>
  <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@400;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    body { font-family: 'Cairo', Tahoma, sans-serif; background: #f4f6f8; margin: 0; direction: rtl; -webkit-print-color-adjust: exact; print-color-adjust: exact; }

    .print-bar { display: flex; justify-content: center; gap: 12px; padding: 16px; }
    .btn-print {
      display: inline-flex; align-items: center; gap: 8px;
      padding: 10px 28px; background: #0a7c82; color: #fff;
      border: none; border-radius: 10px; font-family: 'Cairo', sans-serif;
      font-size: 14px; font-weight: 700; cursor: pointer;
    }
    .btn-print:hover { background: #065a5f; }
    .print-count {
      display: inline-flex; align-items: center; padding: 10px 18px;
      background: #e0f2f3; color: #065a5f; border-radius: 10px;
      font-size: 13px; font-weight: 700;
    }

    /* كل فاتورة في صفحة A4 مستقلة */
    .invoice-page {
      width: 210mm;
      min-height: 297mm;
      background: #fff;
      margin: 0 auto 32px;
      display: flex;
      flex-direction: column;
      overflow: hidden;
      box-shadow: 0 8px 40px rgba(0,0,0,.12);
      page-break-after: always;
    }
    .invoice-page:last-child { page-break-after: avoid; margin-bottom: 0; }

    /* نفس تصميم الفاتورة المفردة */
    :root {
      --c-primary: #0a7c82; --c-primary-dark: #065a5f;
      --c-primary-dim: #e0f2f3; --c-accent: #f0a500;
      --c-text: #1c1c1e; --c-text-3: #8e8e96;
      --c-border: #e2e5ea; --c-white: #fff;
      --c-success-bg: #d1fae5; --c-success-text: #065f46;
      --c-warn-bg: #fef9c3; --c-warn-text: #854d0e;
      --c-danger-bg: #fee2e2; --c-danger-text: #991b1b;
    }

    .hero {
      background: var(--c-primary); padding: 20px 26px 16px;
      display: flex; align-items: flex-start; justify-content: space-between;
      gap: 16px; position: relative; overflow: hidden;
    }
    .hero::before {
      content: ''; position: absolute; inset: 0;
      background: radial-gradient(circle at 10% 50%, rgba(255,255,255,.06) 0%, transparent 60%);
      pointer-events: none;
    }
    .hero-circle { position: absolute; width: 130px; height: 130px; border-radius: 50%; border: 24px solid rgba(255,255,255,.06); top: -50px; left: -30px; }
    .logo-row { display: flex; align-items: center; gap: 10px; margin-bottom: 6px; position: relative; z-index: 1; }
    .logo-box { width: 48px; height: 48px; background: rgba(255,255,255,.15); border-radius: 10px; display: flex; align-items: center; justify-content: center; border: 1.5px solid rgba(255,255,255,.2); }
    .store-name { font-size: 18px; font-weight: 900; color: #fff; }
    .store-tagline { font-size: 10.5px; color: rgba(255,255,255,.7); }
    .store-meta { font-size: 10px; color: rgba(255,255,255,.7); line-height: 1.9; position: relative; z-index: 1; }
    .inv-label-box { background: rgba(255,255,255,.12); border: 1px solid rgba(255,255,255,.2); border-radius: 10px; padding: 8px 14px; text-align: center; min-width: 120px; position: relative; z-index: 1; }
    .inv-label  { font-size: 9px; color: rgba(255,255,255,.7); text-transform: uppercase; letter-spacing: 1px; margin-bottom: 3px; }
    .inv-number { font-size: 18px; font-weight: 900; color: #fff; }
    .inv-date   { font-size: 9.5px; color: rgba(255,255,255,.65); margin-top: 4px; }

    .accent-stripe { height: 4px; background: linear-gradient(90deg, var(--c-accent) 0%, #ffcd57 50%, var(--c-primary-dim) 100%); }

    .body-content { padding: 18px 24px; flex: 1; display: flex; flex-direction: column; gap: 14px; }

    .info-row { display: grid; grid-template-columns: 1fr 1fr; gap: 10px; }
    .info-card { border: 1px solid var(--c-border); border-radius: 8px; overflow: hidden; }
    .info-card-header { background: var(--c-primary); padding: 5px 12px; font-size: 9.5px; font-weight: 700; color: #fff; text-transform: uppercase; letter-spacing: .7px; display: flex; align-items: center; gap: 5px; }
    .info-card-body   { padding: 8px 12px; background: var(--c-white); }
    .info-row-item    { display: flex; justify-content: space-between; align-items: center; padding: 4px 0; border-bottom: 1px solid var(--c-border); font-size: 11.5px; gap: 8px; }
    .info-row-item:last-child { border-bottom: none; }
    .info-lbl { color: var(--c-text-3); font-size: 10.5px; white-space: nowrap; }
    .info-val  { font-weight: 700; color: var(--c-text); text-align: left; }

    .badge { display: inline-flex; align-items: center; gap: 4px; padding: 2px 8px; border-radius: 20px; font-size: 10.5px; font-weight: 700; }
    .badge::before { content:''; width:5px; height:5px; border-radius:50%; background:currentColor; opacity:.7; }
    .badge-paid    { background: var(--c-success-bg); color: var(--c-success-text); }
    .badge-partial { background: var(--c-warn-bg);    color: var(--c-warn-text); }
    .badge-unpaid  { background: var(--c-danger-bg);  color: var(--c-danger-text); }
    .badge-default { background: #e0f2fe; color: #0369a1; }

    .table-wrap { border: 1px solid var(--c-border); border-radius: 8px; overflow: hidden; }
    .items-table { width: 100%; border-collapse: collapse; font-size: 11.5px; }
    .items-table thead tr { background: var(--c-primary); }
    .items-table thead th { padding: 8px 10px; text-align: right; font-size: 10.5px; font-weight: 700; color: #fff; white-space: nowrap; }
    .items-table tbody tr:nth-child(odd)  { background: #fafbfc; }
    .items-table tbody tr:nth-child(even) { background: var(--c-white); }
    .items-table tbody td { padding: 7px 10px; border-bottom: 1px solid #f0f0f0; vertical-align: middle; }
    .items-table tbody tr:last-child td { border-bottom: none; }
    .td-index   { text-align: center; color: var(--c-text-3); font-size: 10px; width: 28px; }
    .td-product { font-weight: 600; }
    .td-center  { text-align: center; }
    .td-left    { text-align: left; }
    .td-amount  { text-align: left; font-weight: 700; color: var(--c-primary-dark); }
    .unit-pill  { display: inline-block; background: var(--c-primary-dim); color: var(--c-primary-dark); padding: 1px 7px; border-radius: 20px; font-size: 10px; font-weight: 600; }

    .bottom-row { display: flex; justify-content: space-between; align-items: flex-start; gap: 14px; margin-top: auto; }
    .notes-card { flex: 1; border: 1px dashed var(--c-border); border-radius: 8px; padding: 10px 12px; min-height: 80px; background: #fafbfc; }
    .notes-label { font-size: 9.5px; font-weight: 700; color: var(--c-primary); text-transform: uppercase; letter-spacing: .7px; margin-bottom: 5px; }
    .notes-text { font-size: 11.5px; color: #4a4a52; line-height: 1.6; }

    .totals-card { width: 220px; flex-shrink: 0; border: 1px solid var(--c-border); border-radius: 8px; overflow: hidden; }
    .totals-header { background: var(--c-primary-dim); padding: 6px 12px; font-size: 9.5px; font-weight: 700; color: var(--c-primary-dark); text-transform: uppercase; letter-spacing: .7px; }
    .totals-row { display: flex; justify-content: space-between; align-items: center; padding: 6px 12px; border-bottom: 1px solid var(--c-border); font-size: 11.5px; background: var(--c-white); }
    .totals-row:last-child { border-bottom: none; }
    .totals-row .t-lbl { color: var(--c-text-3); }
    .totals-row .t-val { font-weight: 700; }
    .totals-row.row-discount .t-val { color: var(--c-danger-text); }
    .totals-row.row-paid     .t-val { color: var(--c-success-text); }
    .totals-row.row-remain          { background: #fff8f8; }
    .totals-row.row-remain   .t-val { color: var(--c-danger-text); }
    .totals-grand { display: flex; justify-content: space-between; align-items: center; padding: 9px 12px; background: var(--c-primary); }
    .totals-grand .g-lbl { font-size: 11px; font-weight: 700; color: rgba(255,255,255,.85); }
    .totals-grand .g-val { font-size: 15px; font-weight: 900; color: #fff; }

    .page-footer { background: var(--c-primary-dim); border-top: 2px solid var(--c-primary); padding: 9px 24px; display: flex; justify-content: space-between; align-items: center; gap: 10px; }
    .footer-brand  { font-size: 11px; font-weight: 800; color: var(--c-primary-dark); }
    .footer-meta   { font-size: 9.5px; color: var(--c-text-3); text-align: center; line-height: 1.6; }
    .footer-thanks { font-size: 10.5px; color: var(--c-primary); font-weight: 700; }

    @media print {
      body { background: #fff; }
      .print-bar { display: none; }
      .invoice-page { width: 100%; min-height: 0; margin: 0; box-shadow: none; }
      .body-content { padding: 14px 18px; gap: 12px; }
      @page { size: A4 portrait; margin: 0; }
    }
  </style>
</head>
<body>

{{-- زر الطباعة --}}
<div class="print-bar">
  <div class="print-count">{{ $invoices->count() }} فاتورة محددة</div>
  <button class="btn-print" onclick="window.print()">
    <svg width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
      <path d="M6 9V2h12v7M6 18H4a2 2 0 01-2-2v-5a2 2 0 012-2h16a2 2 0 012 2v5a2 2 0 01-2 2h-2"/>
      <rect x="6" y="14" width="12" height="8" rx="1"/>
    </svg>
    طباعة الكل
  </button>
</div>

{{-- لكل فاتورة صفحة مستقلة --}}
@foreach($invoices as $record)
<div class="invoice-page">

  <div class="hero">
    <div class="hero-circle"></div>
    <div class="logo-row">
      <div class="logo-box">
        <svg viewBox="0 0 32 32" fill="none" width="28" height="28">
          <path d="M4 26V14L16 5l12 9v12" stroke="#fff" stroke-width="2" stroke-linejoin="round"/>
          <rect x="11" y="18" width="10" height="8" rx="1" stroke="#fff" stroke-width="1.8"/>
          <circle cx="24" cy="10" r="5" fill="rgba(240,165,0,.9)"/>
          <path d="M24 8v4M22 10h4" stroke="#fff" stroke-width="1.5" stroke-linecap="round"/>
        </svg>
      </div>
      <div>
        <div class="store-name">{{ config('store.name') }}</div>
        @if(config('store.tagline'))
          <div class="store-tagline">{{ config('store.tagline') }}</div>
        @endif
      </div>
    </div>
    <div class="store-meta">
      @if(config('store.address')) <div>📍 {{ config('store.address') }}</div> @endif
      @if(config('store.phone'))   <div>📞 {{ config('store.phone') }}</div>   @endif
    </div>
    <div class="inv-label-box">
      <div class="inv-label">فاتورة مبيعات</div>
      <div class="inv-number"># {{ $record->invoice_no }}</div>
      <div class="inv-date">{{ \Carbon\Carbon::parse($record->invoice_date)->format('d M Y') }}</div>
    </div>
  </div>

  <div class="accent-stripe"></div>

  <div class="body-content">

    <div class="info-row">
      <div class="info-card">
        <div class="info-card-header">بيانات الفاتورة</div>
        <div class="info-card-body">
          <div class="info-row-item"><span class="info-lbl">رقم الفاتورة</span><span class="info-val"># {{ $record->invoice_no }}</span></div>
          <div class="info-row-item"><span class="info-lbl">التاريخ</span><span class="info-val">{{ \Carbon\Carbon::parse($record->invoice_date)->format('d M Y') }}</span></div>
          <div class="info-row-item"><span class="info-lbl">أنشئ بواسطة</span><span class="info-val">{{ $record->createdBy->name ?? '—' }}</span></div>
          <div class="info-row-item">
            <span class="info-lbl">حالة الدفع</span>
            <span class="info-val">
              @php
                $status = $record->payment_status;
                $badgeClass = match(true) {
                    in_array($status, ['paid','مدفوع','مسدد'])                  => 'badge badge-paid',
                    in_array($status, ['partial','جزئي','مدفوع جزئياً'])       => 'badge badge-partial',
                    in_array($status, ['unpaid','غير مدفوع','معلق','pending']) => 'badge badge-unpaid',
                    default                                                       => 'badge badge-default',
                };
              @endphp
              <span class="{{ $badgeClass }}">{{ $status }}</span>
            </span>
          </div>
        </div>
      </div>
      <div class="info-card">
        <div class="info-card-header">بيانات العميل</div>
        <div class="info-card-body">
          @if($record->customer ?? null)
            <div class="info-row-item"><span class="info-lbl">الاسم</span><span class="info-val">{{ $record->customer->name ?? '—' }}</span></div>
            <div class="info-row-item"><span class="info-lbl">الهاتف</span><span class="info-val">{{ $record->customer->phone ?? '—' }}</span></div>
            <div class="info-row-item"><span class="info-lbl">العنوان</span><span class="info-val">{{ $record->customer->address ?? '—' }}</span></div>
          @else
            <div class="info-row-item"><span class="info-lbl">اسم العميل</span><span class="info-val">{{ $record->customer_name ?? '—' }}</span></div>
          @endif
        </div>
      </div>
    </div>

    <div class="table-wrap">
      <table class="items-table">
        <thead>
          <tr>
            <th class="td-index">#</th>
            <th>المنتج</th>
            <th style="width:65px" class="td-center">الكمية</th>
            <th style="width:72px" class="td-center">الوحدة</th>
            <th style="width:90px" class="td-left">سعر الوحدة</th>
            <th style="width:100px" class="td-left">الإجمالي</th>
          </tr>
        </thead>
        <tbody>
          @forelse($record->items as $i => $item)
            <tr>
              <td class="td-index">{{ $i + 1 }}</td>
              <td class="td-product">{{ $item->product->name ?? '—' }}</td>
              <td class="td-center">{{ $item->quantity }}</td>
              <td class="td-center"><span class="unit-pill">{{ $item->unit->unit->name ?? '—' }}</span></td>
              <td class="td-left">{{ number_format($item->unit_price, 2) }} <small>{{ config('store.currency') }}</small></td>
              <td class="td-amount">{{ number_format($item->total_price, 2) }} <small style="font-weight:400;font-size:9.5px">{{ config('store.currency') }}</small></td>
            </tr>
          @empty
            <tr><td colspan="6" style="text-align:center;color:#aaa;padding:20px">لا توجد أصناف</td></tr>
          @endforelse
        </tbody>
      </table>
    </div>

    @php
      $totalAmount = $record->total_amount ?? 0;
      $discount    = $record->discount     ?? 0;
      $paid        = $record->paid         ?? 0;
      $net         = $totalAmount - $discount;
      $remaining   = $net - $paid;
    @endphp

    <div class="bottom-row">
      <div class="notes-card">
        <div class="notes-label">ملاحظات</div>
        <div class="notes-text">{{ $record->notes ?: 'لا توجد ملاحظات' }}</div>
      </div>
      <div class="totals-card">
        <div class="totals-header">ملخص الفاتورة</div>
        <div class="totals-row"><span class="t-lbl">إجمالي الأصناف</span><span class="t-val">{{ number_format($totalAmount, 2) }} {{ config('store.currency') }}</span></div>
        @if($discount > 0)
        <div class="totals-row row-discount"><span class="t-lbl">الخصم</span><span class="t-val">- {{ number_format($discount, 2) }} {{ config('store.currency') }}</span></div>
        @endif
        <div class="totals-row row-paid"><span class="t-lbl">المدفوع</span><span class="t-val">{{ number_format($paid, 2) }} {{ config('store.currency') }}</span></div>
        @if($remaining > 0)
        <div class="totals-row row-remain"><span class="t-lbl">المتبقي</span><span class="t-val">{{ number_format($remaining, 2) }} {{ config('store.currency') }}</span></div>
        @endif
        <div class="totals-grand"><span class="g-lbl">الإجمالي النهائي</span><span class="g-val">{{ number_format($net, 2) }} {{ config('store.currency') }}</span></div>
      </div>
    </div>

  </div>

  <div class="page-footer">
    <div class="footer-brand">{{ config('store.name') }}</div>
    <div class="footer-meta">
      {{ config('store.address') }} @if(config('store.website')) | {{ config('store.website') }} @endif<br>
      طُبع في {{ now()->format('d M Y') }}
    </div>
    <div class="footer-thanks">شكراً لتعاملكم معنا 🤝</div>
  </div>

</div>
@endforeach

</body>
</html>
