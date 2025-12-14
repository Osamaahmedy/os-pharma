<x-filament-panels::page>
    <button onclick="window.print();" class="px-4 py-2 bg-blue-600 text-white rounded">
        طباعة الوصفة
    </button>

    <div id="printArea">
        {!! $data['prescription_html'] !!}
    </div>
</x-filament-panels::page>
