<?php

/* 
    How to setup Helper 
    1. create app/Helpers/helpers.php
    2. in composer.json in autoload object add 
    "files": [
        "app/Helpers/helpers.php"
    ]
    3. run command composer dump-autoload
    ref: https://laravel-news.com/creating-helpers

*/

if (! function_exists('createSuccess')) {
    function createSuccess($saved, $message_data) {
        if ( $saved ){
            return response()->json(['message'=>$message_data['message'],'data'=>$message_data['data']],200);
        }else{
            return response()->json(['message'=>$message_data['message'],'data'=>$message_data['data']],400);
        }
    }
}
if (! function_exists('log_warning')) {
    function log_warning($msg, $context=[])
    {
        Log::channel('wrapper')->warning($msg, $context);
    }
}
if (! function_exists('log_debug')) {

    function log_debug($msg, $context=[])
    {
        Log::channel('wrapper')->debug($msg, $context);
    }
}
if (! function_exists('log_emergency')) {

    function log_emergency($msg, $context=[])
    {
        Log::channel('wrapper')->emergency($msg, $context);
    }
}
if (! function_exists('log_error')) {

    function log_error($msg, $context=[])
    {
        Log::channel('wrapper')->error($msg, $context);
    }
}
if (! function_exists('log_info')) {

    function log_info($msg, $context=[])
    {
        Log::channel('wrapper')->info("===== ".$msg." =====", $context);
    }
}
if (! function_exists('log_infos')) {

    function log_infos($msg, $context=[])
    {
        Log::channel('wrapper')->info($msg, $context);
    }
}