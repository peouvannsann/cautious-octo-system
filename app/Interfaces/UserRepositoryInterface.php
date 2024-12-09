<?php

namespace App\Interfaces;

interface UserRepositoryInterface
{
    public function getUser();

    public function firstOrCreate(array $cd_user_exists, array $cd_user_not_exists);

    public function saveMultiplePhone($user, $phone_obj);

    public function saveMultipleRole($user, array $role);

    public function saveMultiplePost($user, $post_obj);

    public function saveMultipleComment($post, $comment_obj);

    public function findPostByID($post_id);

    public function getUserByIDSelectedFields($user_id);
}