<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Settings
    |--------------------------------------------------------------------------
    |
    | Default values for DOMPDF. You can also override the entire config file.
    |
    */
    'show_warnings' => false,
    'public_path' => null,
    'convert_entities' => true,

    'options' => [

        // مكان ملفات الخطوط
        'font_dir' => storage_path('fonts/'),
        'font_cache' => storage_path('fonts'),

        'temp_dir' => sys_get_temp_dir(),
        'chroot' => realpath(base_path()),

        'allowed_protocols' => [
            'data://' => ['rules' => []],
            'file://' => ['rules' => []],
            'http://' => ['rules' => []],
            'https://' => ['rules' => []],
        ],

        'artifactPathValidation' => null,
        'log_output_file' => null,
        'enable_font_subsetting' => false,
        'pdf_backend' => 'CPDF',
        'default_media_type' => 'screen',
        'default_paper_size' => 'a4',
        'default_paper_orientation' => 'portrait',
        'dpi' => 96,

        'enable_php' => false,
        'enable_javascript' => true,
        'enable_remote' => false,
        'allowed_remote_hosts' => null,
        'font_height_ratio' => 1.1,
        'enable_html5_parser' => true,

        // الخط الافتراضي
        'default_font' => 'amiri',

        // تعريف الخطوط
        'fonts' => [
            'amiri' => [
                'normal' => storage_path('fonts/Amiri-Regular.ttf'),
                'bold' => storage_path('fonts/Amiri-Bold.ttf'),
                'italic' => storage_path('fonts/Amiri-Italic.ttf'),
                'bold_italic' => storage_path('fonts/Amiri-BoldItalic.ttf'),
            ],
        ],
    ],

];
