<?php

namespace App\Providers;

use App\Http\Receivers\CustomerReceive;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\ServiceProvider;
use App\Http\Handlers\Stripe\CustomerCreated;

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
        Model::preventSilentlyDiscardingAttributes(true);


        $receiver = app('receiver');
        $receiver->extend('aftership' , function($app) {
           return new CustomerReceive(config('services.strip.webhook_secret'));
        });
    }
}
