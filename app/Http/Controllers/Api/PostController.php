<?php

namespace App\Http\Controllers\Api;

use App\Models\Post;
use Illuminate\Http\Request;
use App\Notifications\InvoicePaid;
use App\Http\Controllers\Controller;
use Vonage\Voice\NCCO\Action\Notify;
use App\Notifications\TelegramRegister;
use Illuminate\Support\Facades\Notification;
use NotificationChannels\Telegram\TelegramMessage;
use NotificationChannels\Telegram\TelegramUpdates;

class PostController extends Controller
{
    function index(){
        return Post::get()->toArray();
        // return "hello world";

        // $updates = TelegramUpdates::create()
        //     // (Optional). Get's the latest update. NOTE: All previous updates will be forgotten using this method.
        //     // ->latest()
            
        //     // (Optional). Limit to 2 updates (By default, updates starting with the earliest unconfirmed update are returned).
        //     ->limit(2)
            
        //     // (Optional). Add more params to the request.
        //     ->options([
        //         'timeout' => 0,
        //     ])
        //     ->get();
            
        // // return $updates['ok'];
        // if($updates['ok']) {
        //     // Chat ID
        //     return $updates;
        //     // $chatId = $updates['result'][0]['message']['chat']['id'];
        // }

    }
}
