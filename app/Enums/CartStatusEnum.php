<?php

namespace App\Enums;

enum CartStatusEnum: string
{
    case PENDING = 'pending';
    case PURCHASED = 'purchased';
    case REMOVED = 'removed';
}