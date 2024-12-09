<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Receiver\Facades\Receiver;

class WebhooksController extends Controller
{
    public function store(Request $request)
    {
        return Receiver::driver('stripe')
            ->receive($request)
            ->ok();
    }
}
