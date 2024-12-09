<?php

namespace App\Repositories;

use App\Models\Post;
use App\Models\User;
use App\Interfaces\UserRepositoryInterface;

class UserRepository implements UserRepositoryInterface
{
    public function getUser()
    {
        return User::all();
    }

    public function firstOrCreate(array $cd_user_exists, array $cd_user_not_exists)
    {
        return User::firstOrCreate($cd_user_exists, $cd_user_not_exists);
    }

    public function saveMultiplePhone($user, $phone_obj)
    {
        return $user->phones()->saveMany($phone_obj);
    }

    public function saveMultipleRole($user, array $role){
        return $user->roles()->sync($role);
    }

    public function saveMultiplePost($user, $post_obj){
        return $user->posts()->saveMany($post_obj);
    }

    public function saveMultipleComment($post, $comment_obj){
        return $post->comments()->saveMany( $comment_obj );
    }

    public function findPostByID($post_id){
        return Post::find($post_id);
    }

    public function getUserByIDSelectedFields($user_id){
        return User::where("id", $user_id)->with(
            [
                "selectedRoles",
                "selectedPhones",
                "posts",
                "selectedPosts.selectedComments"
            ]
        )->get()->map( function (User $user) {
            return $user;
        });
    }
}