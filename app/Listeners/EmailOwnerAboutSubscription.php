<?php

namespace App\Listeners;

use App\Events\UsersSubscribe;
use App\Events\UserSubscribed;
use App\Mail\UserSubscribeMessage;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class EmailOwnerAboutSubscription
{

    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
    }

    /**
     * Handle the event.
     *
     * @param  object  $event
     * @return void
     */
    public function handle(UserSubscribed $event)
    {
        DB::table("new_letters")->insert([
            'email' => $event->email
        ]);
        Mail::to($event->email)->send(new UserSubscribeMessage());
        
    }
}
