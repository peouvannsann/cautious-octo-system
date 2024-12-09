<?php

namespace App\Interfaces;

interface ResponseRepositoryInterface
{
    public function debugLog($message, array $list=[]);
    
    public function criticalErrorLog($message, $list);

    public function alertLog($message, $list);

    public function warningLog($message, $list);

    public function noticeLog($message, $list);

    public function infoLog($message, $list);
}