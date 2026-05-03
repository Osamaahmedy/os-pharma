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
      --c-bg:           #f4f6f8;
      --c-white:        #ffffff;
      --c-border:       #e2e5ea;
      --c-success-bg:   #d1fae5;
      --c-success-text: #065f46;
      --c-warn-bg:      #fef9c3;
      --c-warn-text:    #854d0e;
      --c-danger-bg:    #fee2e2;
      --c-danger-text:  #991b1b;
      --font: 'Cairo', 'Tahoma', sans-serif;
      --radius: 10px;
    }

    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      font-family: var(--font);
      font-size: 12.5px;
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
      padding: 16px;
    }
    .btn-print {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 10px 28px;
      background: var(--c-primary);
      color: #fff;
      border: none;
      border-radius: var(--radius);
      font-family: var(--font);
      font-size: 14px;
      font-weight: 700;
      cursor: pointer;
      transition: background .2s;
      box-shadow: 0 4px 14px rgba(10,124,130,.25);
    }
    .btn-print:hover { background: var(--c-primary-dark); }

    /* ── Page ── */
    .page {
      width: 210mm;
      min-height: 297mm;
      background: var(--c-white);
      margin: 0 auto 32px;
      display: flex;
      flex-direction: column;
      overflow: hidden;
      box-shadow: 0 8px 40px rgba(0,0,0,.12);
    }

    /* ── Hero ── */
    .hero {
      background: var(--c-primary);
      padding: 22px 28px 18px;
      display: flex;
      align-items: flex-start;
      justify-content: space-between;
      gap: 16px;
      position: relative;
      overflow: hidden;
    }
    .hero::before {
      content: '';
      position: absolute;
      inset: 0;
      background:
        radial-gradient(circle at 10% 50%, rgba(255,255,255,.06) 0%, transparent 60%),
        radial-gradient(circle at 90% -10%, rgba(255,255,255,.08) 0%, transparent 50%);
      pointer-events: none;
    }
    .hero-circle-1 {
      position: absolute;
      width: 160px; height: 160px;
      border-radius: 50%;
      border: 28px solid rgba(255,255,255,.06);
      top: -60px; left: -40px;
    }
    .hero-circle-2 {
      position: absolute;
      width: 100px; height: 100px;
      border-radius: 50%;
      border: 18px solid rgba(255,255,255,.05);
      bottom: -40px; right: 60px;
    }
    .hero-left  { position: relative; z-index: 1; }
    .hero-right { position: relative; z-index: 1; text-align: left; }

    .logo-row { display: flex; align-items: center; gap: 12px; margin-bottom: 8px; }
    .logo-box {
      width: 54px; height: 54px;
      background: rgba(255,255,255,.15);
      border-radius: 12px;
      display: flex; align-items: center; justify-content: center;
      flex-shrink: 0;
      border: 1.5px solid rgba(255,255,255,.2);
    }
    .logo-box svg { width: 32px; height: 32px; }
    .store-name    { font-size: 20px; font-weight: 900; color: #fff; line-height: 1.1; letter-spacing: -.3px; }
    .store-tagline { font-size: 11px; color: rgba(255,255,255,.7); margin-top: 2px; }
    .store-meta    { font-size: 10.5px; color: rgba(255,255,255,.75); line-height: 1.9; margin-top: 2px; }

    .inv-label-box {
      background: rgba(255,255,255,.12);
      border: 1px solid rgba(255,255,255,.2);
      border-radius: var(--radius);
      padding: 10px 16px;
      text-align: center;
      min-width: 130px;
    }
    .inv-label  { font-size: 10px; color: rgba(255,255,255,.7); text-transform: uppercase; letter-spacing: 1px; margin-bottom: 4px; }
    .inv-number { font-size: 20px; font-weight: 900; color: #fff; line-height: 1; }
    .inv-date   { font-size: 10px; color: rgba(255,255,255,.65); margin-top: 5px; }

    /* ── Accent Stripe ── */
    .accent-stripe {
      height: 4px;
      background: linear-gradient(90deg, var(--c-accent) 0%, #ffcd57 50%, var(--c-primary-dim) 100%);
    }

    /* ── Body ── */
    .body-content {
      padding: 22px 28px;
      flex: 1;
      display: flex;
      flex-direction: column;
      gap: 18px;
    }

    /* ── Info Cards ── */
    .info-row {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 12px;
    }
    .info-card {
      border: 1px solid var(--c-border);
      border-radius: var(--radius);
      overflow: hidden;
    }
    .info-card-header {
      background: var(--c-primary);
      padding: 6px 14px;
      font-size: 10px;
      font-weight: 700;
      color: #fff;
      text-transform: uppercase;
      letter-spacing: .8px;
      display: flex;
      align-items: center;
      gap: 6px;
    }
    .info-card-body { padding: 10px 14px; background: var(--c-white); }
    .info-row-item {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 5px 0;
      border-bottom: 1px solid var(--c-border);
      font-size: 12px;
      gap: 8px;
    }
    .info-row-item:last-child { border-bottom: none; }
    .info-lbl { color: var(--c-text-3); font-size: 11px; white-space: nowrap; }
    .info-val  { font-weight: 700; color: var(--c-text); text-align: left; }

    /* ── Badge ── */
    .badge {
      display: inline-flex; align-items: center; gap: 4px;
      padding: 3px 10px; border-radius: 20px; font-size: 11px; font-weight: 700;
    }
    .badge::before { content:''; width:6px; height:6px; border-radius:50%; background:currentColor; opacity:.7; }
    .badge-paid    { background: var(--c-success-bg); color: var(--c-success-text); }
    .badge-partial { background: var(--c-warn-bg);    color: var(--c-warn-text); }
    .badge-unpaid  { background: var(--c-danger-bg);  color: var(--c-danger-text); }
    .badge-default { background: #e0f2fe; color: #0369a1; }

    /* ── Items Table ── */
    .table-wrap {
      border: 1px solid var(--c-border);
      border-radius: var(--radius);
      overflow: hidden;
    }
    .items-table { width: 100%; border-collapse: collapse; font-size: 12px; }
    .items-table thead tr { background: var(--c-primary); }
    .items-table thead th {
      padding: 9px 12px; text-align: right;
      font-size: 11px; font-weight: 700; color: #fff; white-space: nowrap;
    }
    .items-table tbody tr:nth-child(odd)  { background: #fafbfc; }
    .items-table tbody tr:nth-child(even) { background: var(--c-white); }
    .items-table tbody td {
      padding: 8px 12px;
      border-bottom: 1px solid #f0f0f0;
      vertical-align: middle;
    }
    .items-table tbody tr:last-child td { border-bottom: none; }
    .td-index   { text-align: center; color: var(--c-text-3); font-size: 11px; width: 32px; }
    .td-product { font-weight: 600; }
    .td-center  { text-align: center; }
    .td-left    { text-align: left; }
    .td-amount  { text-align: left; font-weight: 700; color: var(--c-primary-dark); font-size: 12.5px; }
    .unit-pill  {
      display: inline-block;
      background: var(--c-primary-dim);
      color: var(--c-primary-dark);
      padding: 1px 8px; border-radius: 20px;
      font-size: 10.5px; font-weight: 600;
    }

    /* ── Bottom Row ── */
    .bottom-row {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      gap: 16px;
      margin-top: auto;
    }

    /* Notes */
    .notes-card {
      flex: 1;
      border: 1px dashed var(--c-border);
      border-radius: var(--radius);
      padding: 12px 14px;
      min-height: 90px;
      background: #fafbfc;
    }
    .notes-label {
      font-size: 10px; font-weight: 700; color: var(--c-primary);
      text-transform: uppercase; letter-spacing: .8px; margin-bottom: 6px;
      display: flex; align-items: center; gap: 5px;
    }
    .notes-text { font-size: 12px; color: var(--c-text-2); line-height: 1.7; }

    /* Totals */
    .totals-card {
      width: 240px; flex-shrink: 0;
      border: 1px solid var(--c-border);
      border-radius: var(--radius);
      overflow: hidden;
    }
    .totals-header {
      background: var(--c-primary-dim);
      padding: 7px 14px;
      font-size: 10px; font-weight: 700;
      color: var(--c-primary-dark);
      text-transform: uppercase; letter-spacing: .8px;
    }
    .totals-row {
      display: flex; justify-content: space-between; align-items: center;
      padding: 7px 14px; border-bottom: 1px solid var(--c-border);
      font-size: 12px; background: var(--c-white);
    }
    .totals-row:last-child  { border-bottom: none; }
    .totals-row .t-lbl      { color: var(--c-text-3); font-size: 11.5px; }
    .totals-row .t-val      { font-weight: 700; color: var(--c-text); }
    .totals-row.row-discount .t-val { color: var(--c-danger-text); }
    .totals-row.row-paid     .t-val { color: var(--c-success-text); }
    .totals-row.row-remain          { background: #fff8f8; }
    .totals-row.row-remain   .t-val { color: var(--c-danger-text); }
    .totals-grand {
      display: flex; justify-content: space-between; align-items: center;
      padding: 10px 14px;
      background: var(--c-primary);
    }
    .totals-grand .g-lbl { font-size: 12px; font-weight: 700; color: rgba(255,255,255,.85); }
    .totals-grand .g-val { font-size: 16px; font-weight: 900; color: #fff; }

    /* ── Footer ── */
    .page-footer {
      background: var(--c-primary-dim);
      border-top: 2px solid var(--c-primary);
      padding: 11px 28px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 12px;
    }
    .footer-brand  { font-size: 12px; font-weight: 800; color: var(--c-primary-dark); }
    .footer-meta   { font-size: 10px; color: var(--c-text-3); text-align: center; line-height: 1.7; }
    .footer-thanks { font-size: 11px; color: var(--c-primary); font-weight: 700; }

    /* ── Print ── */
    @media print {
      body { background: #fff; }
      .print-bar { display: none; }
      .page { width: 100%; min-height: 0; margin: 0; box-shadow: none; }
      .body-content { padding: 16px 20px; gap: 14px; }
      .hero { padding: 16px 20px 14px; }
      .page-footer { padding: 8px 20px; }
      @page { size: A4 portrait; margin: 0; }
    }
  </style>
</head>
<body>

<div class="print-bar">
  <button class="btn-print" onclick="window.print()">
    <svg width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
      <path d="M6 9V2h12v7M6 18H4a2 2 0 01-2-2v-5a2 2 0 012-2h16a2 2 0 012 2v5a2 2 0 01-2 2h-2"/>
      <rect x="6" y="14" width="12" height="8" rx="1"/>
    </svg>
    طباعة الفاتورة
  </button>
</div>

<div class="page">

  {{-- ══ HERO ══ --}}
  <div class="hero">
    <div class="hero-circle-1"></div>
    <div class="hero-circle-2"></div>

    <div class="hero-left">
      <div class="logo-row">
        <div class="logo-box">
          {{--
            لتغيير الشعار بصورة:
            <img src="{{ asset('storage/logo.png') }}"
                 style="width:36px;height:36px;object-fit:contain;border-radius:6px">
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
        </div>
      </div>
      <div class="store-meta">
        @if(config('store.address')) <div>📍 {{ config('store.address') }}</div> @endif
        @if(config('store.phone'))   <div>📞 {{ config('store.phone') }}</div>   @endif
        @if(config('store.email'))   <div>✉️ {{ config('store.email') }}</div>   @endif
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
          <svg width="12" height="12" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
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
            <span class="info-lbl">تاريخ الإنشاء</span>
            <span class="info-val">{{ $record->created_at?->format('d M Y') ?? '—' }}</span>
          </div>
          <div class="info-row-item">
            <span class="info-lbl">أنشئ بواسطة</span>
            <span class="info-val">{{ $record->createdBy->name ?? '—' }}</span>
          </div>
          <div class="info-row-item">
            <span class="info-lbl">حالة الدفع</span>
            <span class="info-val">
              @php
                $status = $record->payment_status;
                $badgeClass = match(true) {
                    in_array($status, ['paid',    'مدفوع',    'مسدد'])            => 'badge badge-paid',
                    in_array($status, ['partial', 'جزئي',     'مدفوع جزئياً'])   => 'badge badge-partial',
                    in_array($status, ['unpaid',  'غير مدفوع','معلق', 'pending']) => 'badge badge-unpaid',
                    default                                                         => 'badge badge-default',
                };
              @endphp
              <span class="{{ $badgeClass }}">{{ $status }}</span>
            </span>
          </div>
        </div>
      </div>

      {{-- بيانات العميل --}}
      <div class="info-card">
        <div class="info-card-header">
          <svg width="12" height="12" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
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
            <div class="info-row-item">
              <span class="info-lbl">العنوان</span>
              <span class="info-val">{{ $record->customer->address ?? '—' }}</span>
            </div>
          @else
            <div class="info-row-item">
              <span class="info-lbl">اسم العميل</span>
              <span class="info-val">{{ $record->customer_name ?? '—' }}</span>
            </div>
          @endif
          <div class="info-row-item">
            <span class="info-lbl">آخر تحديث</span>
            <span class="info-val">{{ $record->updated_at?->format('d M Y') ?? '—' }}</span>
          </div>
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
            <th style="width:72px" class="td-center">الكمية</th>
            <th style="width:80px" class="td-center">الوحدة</th>
            <th style="width:100px" class="td-left">سعر الوحدة</th>
            <th style="width:110px" class="td-left">الإجمالي</th>
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
                <small>{{ config('store.currency') }}</small>
              </td>
              <td class="td-amount">
                {{ number_format($item->total_price, 2) }}
                <small style="font-weight:400; font-size:10px">{{ config('store.currency') }}</small>
              </td>
            </tr>
          @empty
            <tr>
              <td colspan="6" style="text-align:center; color:#aaa; padding:28px; font-size:13px">
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
      $paid        = $record->paid         ?? 0;
      $net         = $totalAmount - $discount;
      $remaining   = $net - $paid;
    @endphp

    <div class="bottom-row">

      {{-- Notes --}}
      <div class="notes-card">
        <div class="notes-label">
          <svg width="11" height="11" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
            <path d="M11 4H4a2 2 0 00-2 2v14a2 2 0 002 2h14a2 2 0 002-2v-7"/>
            <path d="M18.5 2.5a2.121 2.121 0 013 3L12 15l-4 1 1-4 9.5-9.5z"/>
          </svg>
          ملاحظات
        </div>
        @if(!empty($record->notes))
          <div class="notes-text">{{ $record->notes }}</div>
        @else
          <div class="notes-text" style="color:#bbb">لا توجد ملاحظات</div>
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

        <div class="totals-row row-paid">
          <span class="t-lbl">المدفوع</span>
          <span class="t-val">{{ number_format($paid, 2) }} {{ config('store.currency') }}</span>
        </div>

        @if($remaining > 0)
        <div class="totals-row row-remain">
          <span class="t-lbl">المتبقي</span>
          <span class="t-val">{{ number_format($remaining, 2) }} {{ config('store.currency') }}</span>
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
      @if(config('store.address')) {{ config('store.address') }} @endif
      @if(config('store.website')) &nbsp;|&nbsp; {{ config('store.website') }} @endif
      <br>طُبع في {{ now()->format('d M Y') }} الساعة {{ now()->format('H:i') }}
    </div>
    <div class="footer-thanks">شكراً لتعاملكم معنا 🤝</div>
  </div>

</div>{{-- .page --}}
</body>
</html>
