<?php

namespace App\Models;

use App\Models\Category;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Brand extends Model
{
    use HasFactory;
    protected $table = 'brands';
    protected $guarded = [];

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id',"id");
    }

    public function products()
    {
        return $this->hasMany(Product::class, 'brand_id', "id");
    }
}
