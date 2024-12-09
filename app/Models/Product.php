<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Product extends Model
{
    use HasFactory;

    protected $table = "products";
    protected $guarded = [];

    protected $fillable = [
        'name', 'detail'
    ];

    protected $casts = [
        'size'  => 'array'
    ];

    
}
