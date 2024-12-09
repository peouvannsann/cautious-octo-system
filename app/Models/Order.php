<?php

namespace App\Models;

use Illuminate\Auth\Authenticatable;
use Illuminate\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\Access\Authorizable;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Order extends Model
{
    use HasFactory;
    use Authenticatable;
    use Authorizable;
    use MustVerifyEmail;

    protected $table = "orders";

    protected $guarded = [];

    protected $casts = [
        'items'  => 'array',
        'address' => 'json'
    ];
}
