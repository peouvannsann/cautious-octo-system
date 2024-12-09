<?php

namespace App\Services;

use Illuminate\Support\Facades\Log;
use App\Interfaces\ResponseRepositoryInterface;

class ResponseService 
{
    public ResponseRepositoryInterface $responseRepository;

    public function __construct()
    {

    }

    public function debugLog($message, array $list=[])
    {
        Log::channel('api_user')->debug($message, $list);
    }

    public function criticalErrorLog($message, $list)
    {
        Log::channel('api_user')->critical($message, [
			"line" => $list->getLine(),
			"file" => $list->getFile(),
			"code" => $list->getCode()
		]);
    }

    public function noticeLog($message, $list)
    {
        Log::channel('api_user')->notice($message, $list);
    }
}