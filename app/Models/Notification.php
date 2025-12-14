<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class Notification extends Model
{
    use LogsActivity;

    protected $guarded = [];

    // Spatie activity logger
    protected static $recordEvents = ['updated'];

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['read_at', 'message'])
            ->logOnlyDirty()
            ->useLogName('notification')
            ->setDescriptionForEvent(fn (string $eventName) => 'تم قراءة الإشعار');
    }
}