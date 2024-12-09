<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    use HasFactory;

    /**
     * The relationships that should be touched on save.
     *
     * @var array
     */
    protected $touches = ["Post"];

    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = [];

    // public function post()
    // {
    //     return $this->belongsTo(Post::class)->withDefault(function ($post, $comment) {
    //         $post->title = 'Guest Author';
    //     });
    // }

    protected $attributes = [
        "commentable_type" => "App\Models\Post",
        "commentable_id"   => 1,
        "user_id"          => 1,
        "approved"         => 0,
        "active"           => 0,
    ];

    public function post()
    {
        return $this->belongsTo(Post::class);
    }

    public function users()
    {
        return $this->belongsTo(User::class, 'user_id', 'id')->withDefault([
            'name' => 'Guest Author'
        ]);
    }

    public function commentable()
    {
        //Mark: 1 comment belongto post
        return $this->morphTo();
    }
    
}
