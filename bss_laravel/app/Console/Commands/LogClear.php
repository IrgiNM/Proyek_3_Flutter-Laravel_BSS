<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;

class LogClear extends Command
{
    protected $signature = 'log:clear';
    protected $description = 'Clear Laravel log files';

    public function handle()
    {
        File::delete(storage_path('logs/laravel.log'));

        $this->info('Log has been cleared!');
    }
}
