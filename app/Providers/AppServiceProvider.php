<?php

namespace App\Providers;

use App\Models\Setting;
use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\View;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Paginator::useBootstrap();
        
        // Kiểm tra xem có dữ liệu trong bảng 'settings' trước khi truy vấn
        $websiteSetting = Setting::first();
        if ($websiteSetting) {
            // Chia sẻ biến $appSetting với giá trị của $websiteSetting đến tất cả các view
            View::share('appSetting', $websiteSetting);
        }
    }
}
