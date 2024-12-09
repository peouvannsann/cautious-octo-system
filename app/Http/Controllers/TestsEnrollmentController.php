<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use App\Notifications\InvoicePaid;
use Illuminate\Support\Facades\Http;
use App\Notifications\TestEnrollment;
use Illuminate\Support\Facades\Notification;

class TestsEnrollmentController extends Controller
{
    public function sendTestNotification()
    {
        $user = User::first();
        
        $enrollmentData = [
            "body" => "You received an new test notification",
            "enrollmentText" => "You are allowed to enroll",
            "url" => url('/'),
            "thankyou" => "You have 14 days to enroll"
        ];

        // $user->notify(new TestEnrollment($enrollmentData));
        // Notification::send("", new TestEnrollment($enrollmentData));
        // Notification::send("", new InvoicePaid());
        $tel_msg = "Your OTP code is 123456. This code is valid for 5 minutes.";
        
        return Http::get('https://api.telegram.org/bot6199210115:AAFw2dFJou5gbzsKBARti_90BXR-OjnjIlg/sendMessage?chat_id=@notimyfirstapp412341&text='.$tel_msg);
        
    }
}
