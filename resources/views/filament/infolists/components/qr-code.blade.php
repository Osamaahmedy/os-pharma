<x-dynamic-component
    :component="$getEntryWrapperView()"
    :entry="$entry"
>
    <div {{ $getExtraAttributeBag() }}>
        {{ $getState() }}
        <br>
        @if ($getState())
            <div class="inline-block border border-gray-200 p-2 rounded-lg bg-white dark:bg-gray-800 dark:border-gray-700">
                {{ 
                    QrCode::size(128)
                        ->generate($getState()) 
                }}
            </div>
        @else
            <span class="text-xs text-gray-500 dark:text-gray-400">-</span>
        @endif
    </div>
</x-dynamic-component>