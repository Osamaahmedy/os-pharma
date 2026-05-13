{{-- resources/views/print/invoice.blade.php --}}
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>فاتورة رقم {{ $record->invoice_no }}</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@300;400;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    :root {
      --c-primary:      #0a7c82;
      --c-primary-dark: #065a5f;
      --c-primary-dim:  #e0f2f3;
      --c-accent:       #f0a500;
      --c-text:         #1c1c1e;
      --c-text-2:       #4a4a52;
      --c-text-3:       #8e8e96;
      --c-bg:           #e8ecef;
      --c-white:        #ffffff;
      --c-border:       #e2e5ea;
      --c-success-bg:   #d1fae5;
      --c-success-text: #065f46;
      --c-warn-bg:      #fef9c3;
      --c-warn-text:    #854d0e;
      --c-danger-bg:    #fee2e2;
      --c-danger-text:  #991b1b;
      --font: 'Cairo', 'Tahoma', sans-serif;
      --radius: 8px;
    }

    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      font-family: var(--font);
      font-size: 11px;
      color: var(--c-text);
      background: var(--c-bg);
      direction: rtl;
      -webkit-print-color-adjust: exact;
      print-color-adjust: exact;
    }

    /* ── Print Button ── */
    .print-bar {
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 14px;
      gap: 10px;
    }
    .btn-print {
      display: inline-flex;
      align-items: center;
      gap: 7px;
      padding: 9px 24px;
      background: var(--c-primary);
      color: #fff;
      border: none;
      border-radius: var(--radius);
      font-family: var(--font);
      font-size: 13px;
      font-weight: 700;
      cursor: pointer;
      transition: background .2s;
      box-shadow: 0 4px 14px rgba(10,124,130,.25);
    }
    .btn-print:hover { background: var(--c-primary-dark); }

    /* ── Page — half A4 ── */
    .page {
      width: 210mm;
      min-height: 148.5mm;
      background: var(--c-white);
      margin: 0 auto 24px;
      display: flex;
      flex-direction: column;
      overflow: hidden;
      box-shadow: 0 6px 30px rgba(0,0,0,.13);
      border-radius: 4px;
    }

    /* ── Hero ── */
    .hero {
      background: var(--c-primary);
      padding: 13px 20px 11px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
      position: relative;
      overflow: hidden;
    }
    .hero::before {
      content: '';
      position: absolute;
      inset: 0;
      background: radial-gradient(circle at 8% 50%, rgba(255,255,255,.07) 0%, transparent 55%);
      pointer-events: none;
    }
    .hero-circle {
      position: absolute;
      width: 110px; height: 110px;
      border-radius: 50%;
      border: 22px solid rgba(255,255,255,.06);
      top: -45px; left: -28px;
    }

    .hero-left  { position: relative; z-index: 1; display: flex; align-items: center; gap: 10px; }
    .hero-right { position: relative; z-index: 1; }

    .logo-box {
      width: 40px; height: 40px;
      background: rgba(255,255,255,.15);
      border-radius: 9px;
      display: flex; align-items: center; justify-content: center;
      flex-shrink: 0;
      border: 1.5px solid rgba(255,255,255,.2);
    }
    .logo-box svg { width: 24px; height: 24px; }
    .store-name    { font-size: 16px; font-weight: 900; color: #fff; line-height: 1.1; }
    .store-tagline { font-size: 9.5px; color: rgba(255,255,255,.7); margin-top: 1px; }
    .store-meta    { font-size: 9.5px; color: rgba(255,255,255,.72); line-height: 1.8; margin-top: 2px; }

    .inv-label-box {
      background: rgba(255,255,255,.13);
      border: 1px solid rgba(255,255,255,.22);
      border-radius: var(--radius);
      padding: 7px 13px;
      text-align: center;
      min-width: 110px;
    }
    .inv-label  { font-size: 8.5px; color: rgba(255,255,255,.7); text-transform: uppercase; letter-spacing: 1px; margin-bottom: 3px; }
    .inv-number { font-size: 17px; font-weight: 900; color: #fff; line-height: 1; }
    .inv-date   { font-size: 9px; color: rgba(255,255,255,.65); margin-top: 4px; }

    /* ── Accent Stripe ── */
    .accent-stripe {
      height: 3px;
      background: linear-gradient(90deg, var(--c-accent) 0%, #ffcd57 50%, var(--c-primary-dim) 100%);
    }

    /* ── Body ── */
    .body-content {
      padding: 12px 18px;
      flex: 1;
      display: flex;
      flex-direction: column;
      gap: 10px;
    }

    /* ── Info Cards ── */
    .info-row {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 10px;
    }
    .info-card {
      border: 1px solid var(--c-border);
      border-radius: var(--radius);
      overflow: hidden;
    }
    .info-card-header {
      background: var(--c-primary);
      padding: 4px 11px;
      font-size: 9px;
      font-weight: 700;
      color: #fff;
      text-transform: uppercase;
      letter-spacing: .7px;
      display: flex;
      align-items: center;
      gap: 5px;
    }
    .info-card-body { padding: 7px 11px; background: var(--c-white); }
    .info-row-item {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 3.5px 0;
      border-bottom: 1px solid var(--c-border);
      gap: 6px;
    }
    .info-row-item:last-child { border-bottom: none; }
    .info-lbl { color: var(--c-text-3); font-size: 10px; white-space: nowrap; }
    .info-val  { font-weight: 700; color: var(--c-text); text-align: left; font-size: 10.5px; }

    /* ── Items Table ── */
    .table-wrap {
      border: 1px solid var(--c-border);
      border-radius: var(--radius);
      overflow: hidden;
    }
    .items-table { width: 100%; border-collapse: collapse; font-size: 10.5px; }
    .items-table thead tr { background: var(--c-primary); }
    .items-table thead th {
      padding: 6px 10px; text-align: right;
      font-size: 9.5px; font-weight: 700; color: #fff; white-space: nowrap;
    }
    .items-table tbody tr:nth-child(odd)  { background: #fafbfc; }
    .items-table tbody tr:nth-child(even) { background: var(--c-white); }
    .items-table tbody td {
      padding: 5px 10px;
      border-bottom: 1px solid #f0f0f0;
      vertical-align: middle;
    }
    .items-table tbody tr:last-child td { border-bottom: none; }
    .td-index   { text-align: center; color: var(--c-text-3); font-size: 10px; width: 26px; }
    .td-product { font-weight: 600; }
    .td-center  { text-align: center; }
    .td-left    { text-align: left; }
    .td-amount  { text-align: left; font-weight: 700; color: var(--c-primary-dark); font-size: 11px; }
    .unit-pill  {
      display: inline-block;
      background: var(--c-primary-dim);
      color: var(--c-primary-dark);
      padding: 1px 6px; border-radius: 20px;
      font-size: 9.5px; font-weight: 600;
    }

    /* ── Bottom Row ── */
    .bottom-row {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      gap: 12px;
    }

    /* Notes */
    .notes-card {
      flex: 1;
      border: 1px dashed var(--c-border);
      border-radius: var(--radius);
      padding: 8px 11px;
      min-height: 60px;
      background: #fafbfc;
    }
    .notes-label {
      font-size: 8.5px; font-weight: 700; color: var(--c-primary);
      text-transform: uppercase; letter-spacing: .7px; margin-bottom: 4px;
      display: flex; align-items: center; gap: 4px;
    }
    .notes-text { font-size: 10.5px; color: var(--c-text-2); line-height: 1.65; }

    /* Totals */
    .totals-card {
      width: 200px; flex-shrink: 0;
      border: 1px solid var(--c-border);
      border-radius: var(--radius);
      overflow: hidden;
    }
    .totals-header {
      background: var(--c-primary-dim);
      padding: 5px 11px;
      font-size: 8.5px; font-weight: 700;
      color: var(--c-primary-dark);
      text-transform: uppercase; letter-spacing: .7px;
    }
    .totals-row {
      display: flex; justify-content: space-between; align-items: center;
      padding: 5px 11px; border-bottom: 1px solid var(--c-border);
      font-size: 10.5px; background: var(--c-white);
    }
    .totals-row:last-child  { border-bottom: none; }
    .totals-row .t-lbl      { color: var(--c-text-3); font-size: 10px; }
    .totals-row .t-val      { font-weight: 700; color: var(--c-text); }
    .totals-row.row-discount .t-val { color: var(--c-danger-text); }
    .totals-grand {
      display: flex; justify-content: space-between; align-items: center;
      padding: 7px 11px;
      background: var(--c-primary);
    }
    .totals-grand .g-lbl { font-size: 10px; font-weight: 700; color: rgba(255,255,255,.85); }
    .totals-grand .g-val { font-size: 13px; font-weight: 900; color: #fff; }

    /* ── Footer ── */
    .page-footer {
      background: var(--c-primary-dim);
      border-top: 2px solid var(--c-primary);
      padding: 6px 18px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 10px;
    }
    .footer-brand  { font-size: 10px; font-weight: 800; color: var(--c-primary-dark); }
    .footer-meta   { font-size: 8.5px; color: var(--c-text-3); text-align: center; line-height: 1.6; }
    .footer-thanks { font-size: 9.5px; color: var(--c-primary); font-weight: 700; }

    /* ── Print ── */
    @media print {
      body { background: #fff; }
      .print-bar { display: none; }
      .page {
        width: 210mm;
        min-height: 0;
        max-height: 148.5mm;
        margin: 0;
        box-shadow: none;
        border-radius: 0;
      }
      .body-content { padding: 10px 16px; gap: 8px; }
      .hero { padding: 11px 16px 10px; }
      .page-footer { padding: 5px 16px; }
      @page {
        size: A4 portrait;
        margin: 0;
      }
    }
  </style>
</head>
<body>

<div class="print-bar">
  <button class="btn-print" onclick="window.print()">
    <svg width="14" height="14" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
      <path d="M6 9V2h12v7M6 18H4a2 2 0 01-2-2v-5a2 2 0 012-2h16a2 2 0 012 2v5a2 2 0 01-2 2h-2"/>
      <rect x="6" y="14" width="12" height="8" rx="1"/>
    </svg>
    طباعة الفاتورة
  </button>
</div>

<div class="page">

  {{-- ══ HERO ══ --}}
  <div class="hero">
    <div class="hero-circle"></div>

    <div class="hero-left">
      <div class="logo-box">
        {{--
          لتغيير الشعار بصورة:
          <img src="{{ asset('storage/logo.png') }}"
               style="width:28px;height:28px;object-fit:contain;border-radius:5px">
        --}}
        <svg viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M4 26V14L16 5l12 9v12" stroke="#fff" stroke-width="2" stroke-linejoin="round"/>
          <rect x="11" y="18" width="10" height="8" rx="1" stroke="#fff" stroke-width="1.8"/>
          <path d="M2 14l14-10 14 10" stroke="rgba(255,255,255,.5)" stroke-width="1.5" stroke-linecap="round"/>
          <circle cx="24" cy="10" r="5" fill="rgba(240,165,0,.9)"/>
          <path d="M24 8v4M22 10h4" stroke="#fff" stroke-width="1.5" stroke-linecap="round"/>
        </svg>
      </div>
      <div>
        <div class="store-name">{{ config('store.name') }}</div>
        @if(config('store.tagline'))
          <div class="store-tagline">{{ config('store.tagline') }}</div>
        @endif
        <div class="store-meta">
          @if(config('store.phone')) <span>📞 {{ config('store.phone') }}</span> @endif
          @if(config('store.address')) &nbsp;·&nbsp; <span>📍 {{ config('store.address') }}</span> @endif
        </div>
      </div>
    </div>

    <div class="hero-right">
      <div class="inv-label-box">
        <div class="inv-label">فاتورة مبيعات</div>
        <div class="inv-number"># {{ $record->invoice_no }}</div>
        <div class="inv-date">{{ \Carbon\Carbon::parse($record->invoice_date)->format('d M Y') }}</div>
      </div>
    </div>
  </div>

  {{-- Accent Stripe --}}
  <div class="accent-stripe"></div>

  {{-- ══ BODY ══ --}}
  <div class="body-content">

    {{-- ── INFO CARDS ── --}}
    <div class="info-row">

      {{-- بيانات الفاتورة --}}
      <div class="info-card">
        <div class="info-card-header">
          <svg width="10" height="10" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
            <rect x="3" y="4" width="18" height="18" rx="2"/>
            <path d="M16 2v4M8 2v4M3 10h18"/>
          </svg>
          بيانات الفاتورة
        </div>
        <div class="info-card-body">
          <div class="info-row-item">
            <span class="info-lbl">رقم الفاتورة</span>
            <span class="info-val"># {{ $record->invoice_no }}</span>
          </div>
          <div class="info-row-item">
            <span class="info-lbl">تاريخ الفاتورة</span>
            <span class="info-val">{{ \Carbon\Carbon::parse($record->invoice_date)->format('d M Y') }}</span>
          </div>
          <div class="info-row-item">
            <span class="info-lbl">أنشئ بواسطة</span>
            <span class="info-val">{{ $record->createdBy->name ?? '—' }}</span>
          </div>
        </div>
      </div>

      {{-- بيانات العميل --}}
      <div class="info-card">
        <div class="info-card-header">
          <svg width="10" height="10" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
            <circle cx="12" cy="8" r="4"/>
            <path d="M4 20c0-4 3.6-7 8-7s8 3 8 7"/>
          </svg>
          بيانات العميل
        </div>
        <div class="info-card-body">
          @if($record->customer ?? null)
            <div class="info-row-item">
              <span class="info-lbl">الاسم</span>
              <span class="info-val">{{ $record->customer->name ?? '—' }}</span>
            </div>
            <div class="info-row-item">
              <span class="info-lbl">الهاتف</span>
              <span class="info-val">{{ $record->customer->phone ?? '—' }}</span>
            </div>
            @if($record->customer->address ?? null)
            <div class="info-row-item">
              <span class="info-lbl">العنوان</span>
              <span class="info-val">{{ $record->customer->address }}</span>
            </div>
            @endif
          @else
            <div class="info-row-item">
              <span class="info-lbl">اسم العميل</span>
              <span class="info-val">{{ $record->customer_name ?? '—' }}</span>
            </div>
          @endif
        </div>
      </div>

    </div>

    {{-- ── ITEMS TABLE ── --}}
    <div class="table-wrap">
      <table class="items-table">
        <thead>
          <tr>
            <th class="td-index">#</th>
            <th>المنتج / البيان</th>
            <th style="width:58px" class="td-center">الكمية</th>
            <th style="width:68px" class="td-center">الوحدة</th>
            <th style="width:88px" class="td-left">سعر الوحدة</th>
            <th style="width:96px" class="td-left">الإجمالي</th>
          </tr>
        </thead>
        <tbody>
          @forelse($record->items as $i => $item)
            <tr>
              <td class="td-index">{{ $i + 1 }}</td>
              <td class="td-product">{{ $item->product->name ?? '—' }}</td>
              <td class="td-center">{{ $item->quantity }}</td>
              <td class="td-center">
                <span class="unit-pill">{{ $item->unit->unit->name ?? '—' }}</span>
              </td>
              <td class="td-left">
                {{ number_format($item->unit_price, 2) }}
                <small style="font-size:9px">{{ config('store.currency') }}</small>
              </td>
              <td class="td-amount">
                {{ number_format($item->total_price, 2) }}
                <small style="font-weight:400; font-size:9px">{{ config('store.currency') }}</small>
              </td>
            </tr>
          @empty
            <tr>
              <td colspan="6" style="text-align:center; color:#aaa; padding:20px; font-size:11px">
                لا توجد أصناف في هذه الفاتورة
              </td>
            </tr>
          @endforelse
        </tbody>
      </table>
    </div>

    {{-- ── BOTTOM ROW ── --}}
    @php
      $totalAmount = $record->total_amount ?? 0;
      $discount    = $record->discount     ?? 0;
      $net         = $totalAmount - $discount;
    @endphp

    <div class="bottom-row">

      {{-- Notes --}}
      <div class="notes-card">
        <div class="notes-label">
          <svg width="9" height="9" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
            <path d="M11 4H4a2 2 0 00-2 2v14a2 2 0 002 2h14a2 2 0 002-2v-7"/>
            <path d="M18.5 2.5a2.121 2.121 0 013 3L12 15l-4 1 1-4 9.5-9.5z"/>
          </svg>
          ملاحظات
        </div>
        @if(!empty($record->notes))
          <div class="notes-text">{{ $record->notes }}</div>
        @else
          <div class="notes-text" style="color:#ccc">لا توجد ملاحظات</div>
        @endif
      </div>

      {{-- Totals --}}
      <div class="totals-card">
        <div class="totals-header">ملخص الفاتورة</div>

        <div class="totals-row">
          <span class="t-lbl">إجمالي الأصناف</span>
          <span class="t-val">{{ number_format($totalAmount, 2) }} {{ config('store.currency') }}</span>
        </div>

        @if($discount > 0)
        <div class="totals-row row-discount">
          <span class="t-lbl">الخصم</span>
          <span class="t-val">- {{ number_format($discount, 2) }} {{ config('store.currency') }}</span>
        </div>
        @endif

        <div class="totals-grand">
          <span class="g-lbl">الإجمالي النهائي</span>
          <span class="g-val">{{ number_format($net, 2) }} {{ config('store.currency') }}</span>
        </div>
      </div>

    </div>

  </div>{{-- .body-content --}}

  {{-- ══ FOOTER ══ --}}
  <div class="page-footer">
    <div class="footer-brand">{{ config('store.name') }}</div>
    <div class="footer-meta">
      طُبع في {{ now()->format('d M Y') }} الساعة {{ now()->format('H:i') }}
      @if(config('store.website')) &nbsp;|&nbsp; {{ config('store.website') }} @endif
    </div>
    <div class="footer-thanks">شكراً لتعاملكم معنا 🤝</div>
  </div>

</div>{{-- .page --}}
</body>
</html>
