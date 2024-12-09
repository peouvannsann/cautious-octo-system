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

class PersonalCVController extends Controller
{
    function index(){

        $cv_structure = [
            [
                "username"     => "vannsann peou",
                "profile"      => "",
                "profile_icon" => "",
                "picture"      => "",
                "details"      => [
                    "phone_number" => "",
                    "email"        => "peouvannsann2222@gmail.com"
                ],
                "skills" => [
                    [
                        "skill"      => "",
                        "percentage" => ""
                    ],
                ],

                "employment_icon"    => "",
                "employment_history" => [
                    [
                        "title"   => "",
                        "date"    => "",
                        "section" => [
                            "",
                            "",
                            "",
                        ]
                    ],
                ],
                "education_icon" => "",
                "education"      => [
                    [
                        "title"   => "",
                        "date"    => "",
                        "section" => [
                            "",
                            "",
                            "",
                        ]
                    ],
                ],
                "courses" => [
                    "",
                    "",
                    "",
                ],
                "reference" => [
                    "",
                    "",
                    "",
                ]
            ]
        ];

        return $cv_structure;

    }
}
