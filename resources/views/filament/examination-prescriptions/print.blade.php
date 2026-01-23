<!doctype html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>طباعة روشتة فحص #{{ $record->id }}</title>

    <style>
        body { font-family: Tahoma, Arial, sans-serif; background:#f5f5f5; margin:0; }
        .page { max-width: 900px; margin: 24px auto; background:#fff; border-radius:12px; padding:24px; }
        .header { display:flex; justify-content:space-between; align-items:center; gap:16px; border-bottom:1px solid #eee; padding-bottom:16px; margin-bottom:16px; }
        .title { font-size:20px; font-weight:700; margin:0; }
        .meta { color:#666; font-size:12px; }
        .grid { display:grid; grid-template-columns: 1fr 1fr; gap:12px; margin-top:12px; }
        .box { border:1px solid #eee; border-radius:10px; padding:12px; }
        .label { color:#777; font-size:12px; margin-bottom:6px; }
        .value { font-size:14px; font-weight:600; color:#111; }

        .section-title { margin:18px 0 10px; font-size:14px; font-weight:800; }
        ul { margin:0; padding-right:18px; }
        li { margin:6px 0; }

        .actions { display:flex; gap:8px; justify-content:flex-end; margin-top:16px; }
        .btn { border:1px solid #ddd; padding:10px 14px; border-radius:10px; background:#fff; cursor:pointer; font-weight:700; }
        .btn-primary { background:#111; color:#fff; border-color:#111; }

        @media print {
            body { background:#fff; }
            .page { margin:0; border-radius:0; }
            .actions { display:none !important; }
        }
    </style>
</head>
<body>
    <div class="page">
        <div class="header">
            <div>
                <h1 class="title">روشتة الفحص</h1>
                <div class="meta">
                    رقم: #{{ $record->id }} •
                    التاريخ: {{ optional($record->created_at)->format('Y-m-d H:i') }}
                </div>
            </div>

            <div class="actions">
                <button class="btn" onclick="history.back()">رجوع</button>
                <button class="btn btn-primary" onclick="window.print()">طباعة</button>
            </div>
        </div>

        {{-- ✅ معلومات عامة (عدّل الحقول حسب جدولك) --}}
        <div class="grid">
            <div class="box">
                <div class="label">اسم المريض</div>
                <div class="value">{{ $record->patient_name ?? '—' }}</div>
            </div>

            <div class="box">
                <div class="label">رقم الملف</div>
                <div class="value">{{ $record->file_no ?? '—' }}</div>
            </div>

            <div class="box">
                <div class="label">الطبيب</div>
                <div class="value">{{ $record->doctor_name ?? '—' }}</div>
            </div>

            <div class="box">
                <div class="label">الملاحظات</div>
                <div class="value">{{ $record->notes ?? '—' }}</div>
            </div>
        </div>

        {{-- ✅ قائمة الفحوصات (لو عندك JSON/Relation عدلها) --}}
        <div class="section-title">قائمة الفحوصات</div>

        @php
            // مثال: لو مخزّن الفحوصات في عمود JSON اسمه "tests"
            $tests = is_array($record->tests ?? null) ? $record->tests : (json_decode($record->tests ?? '[]', true) ?: []);
        @endphp

        @if(count($tests))
            <ul>
                @foreach($tests as $t)
                    <li>{{ is_array($t) ? ($t['name'] ?? '-') : $t }}</li>
                @endforeach
            </ul>
        @else
            <div class="meta">لا توجد بيانات فحوصات.</div>
        @endif

    </div>

    <script>
        // اختياري: طباعة تلقائية عند فتح الصفحة
        // window.addEventListener('load', () => window.print());
    </script>
</body>
</html>
