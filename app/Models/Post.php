<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\AsArrayObject;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

    protected $casts = [
        'metadata' => AsArrayObject::class
    ];

    
    protected $table = "posts";

    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = [];
    
    public function user()
    {
        return $this->belongsTo(User::class)->withDefault(function ( User $user, Post $post ){
            $user->name = "Guest Author";
            // $post->title = "Post testing";
        });
    }
    public function author()
    {
        return $this->belongsTo(User::class, 'user_id')->withDefault(function ( User $user, Post $post ){
            $user->name = "Guest Author";
            // $post->title = "Post testing";
        });
    }

    public function comments()
    {
        return $this->hasMany(Comment::class, 'post_id', 'id');
    }

    public function selectedComments()
    {
        return $this->hasMany(Comment::class, 'post_id', 'id')->select(['id', 'body', 'approved', 'post_id']);
    }

    public function image()
    {
        /**NOTE: 
         * *imageable belong to post id
         * 1 post 1 image
         * Ex: when insert imageable => post_id
        **/
        return $this->morphOne(Image::class,"imageable");
    }

    public function commentsMorph()
    {
        /**NOTE: 
         * *commentable belong to post id
         * 1 post has many comment
         * Ex: when insert imageable => post_id
        **/
        // return $this->morphMany(Comment::class, "commentable");
        return $this->morphMany(Comment::class, "commentable");
    }

    public function tags()
    {
        /**NOTE: 
         * *taggable belong to post id
         * 1 post or many post has 1 or many tags
         * Ex: when insert imageable => post_id
        **/
        return $this->morphToMany(Tag::class, "taggable");
    }
}
