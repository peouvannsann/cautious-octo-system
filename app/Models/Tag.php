<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    use HasFactory;

    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = [];

    public function posts()
    {
        /**NOTE: 
         * * 1 or many post belongtomany tag
         * 
        **/
        return $this->morphedByMany(Post::class, "taggable");
    }

    public function videos()
    {
        return $this->morphedByMany(Video::class, "taggable");
    }
     
}
