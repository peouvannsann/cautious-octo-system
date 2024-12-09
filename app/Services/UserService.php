<?php

namespace App\Services;

use App\Models\Post;
use App\Models\Phone;
use App\Enums\RoleEnum;
use App\Models\Comment;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Interfaces\UserRepositoryInterface;

class UserService 
{
    private UserRepositoryInterface $userRepository;
    public $user;
    public $validated_user;
    public ResponseService $responses;

    public function __construct(UserRepositoryInterface $userRepository, ResponseService $responses)
    {
        $this->userRepository = $userRepository;
        $this->responses = $responses;
    }
    // public function __construct(UserRepositoryInterface $userRepository)
    // {
    //     $this->userRepository = $userRepository;
    // }

    public function validateUser($request)
    {
        $this->responses->debugLog("invoke userservice.php");
        $user_validator = Validator::make( $request->all()['user'], [
            'name'     => 'required|string',
            'email'    => 'required|email',
            'password' => 'required',
            'phone'    => 'required'
        ]);
        if ( $user_validator->fails() ) return $user_validator->messages();

        $this->validated_user = $user_validator->validated();
    }
    
    public function userCreateOrNot()
    {
        $this->responses->debugLog("invoke method userCreateOrNot userservice.php");

        $is_user_fields_exists = [
            'name' => $this->validated_user['name'],
            'email' => $this->validated_user['email']
        ];
        $is_user_fields_not_exists = [
            'password' => Hash::make($this->validated_user['password']),
            'isAdmin' => 1,
            'enum_role' => RoleEnum::ADMIN->value
        ];

        $this->user = $this->userRepository->firstOrCreate(
            $is_user_fields_exists,
            $is_user_fields_not_exists
        );

        return $this->user;
    }

    public function userCreatePhone()
    {
        $this->responses->debugLog("invoke method userCreatePhone userservice.php");
        $phone_obj_ls = [];
        foreach ($this->validated_user['phone'] as $key => $phones) {
            $phone_obj          = new Phone;
            $phone_obj->phone   = $phones;
            $phone_obj_ls[$key] = $phone_obj;
        }
        // return $this->user->phones()->saveMany( $phone_obj_ls );
        return $this->userRepository->saveMultiplePhone($this->user, $phone_obj_ls);
    }

    public function addRole($role)
    {
        /* Mark ManyToMany Attach() or Sync() method */
        /* Noted: Attach for many to many and add new always */
        // $user->roles()->attach($roleids);
        /* Noted: Sync add new if now exists and update if exists */
        $this->responses->debugLog("invoke method addRole userservice.php");
        $this->userRepository->saveMultipleRole($this->user, $role);
    }

    public function addPostComment(array $post)
    {
        $this->responses->debugLog("invoke method addPostComment userservice.php");
        $posts_obj_ls = [];
        $comment_obj_ls = [];
        foreach ($post as $pkey => $posts) {
            
            $posts_obj        = new Post;
            $posts_obj->title = $posts['title'];
            $posts_obj->body  = $posts['body'];

            if ( count( $posts['comments'] ) > 1 )
            {
                foreach ($posts['comments'] as $ckey => $comments) {
                    
                    $comments_obj                   = new Comment;
                    $comments_obj->body             = $comments['body'];
                    // $comments_obj->commentable_id   = 1;
                    // $comments_obj->commentable_type = "App\models\Post";
                    $comments_obj->approved         = 1;
                    $comments_obj->active           = 1;
                    $comments_obj->user_id          = $this->user->id;

                    $comment_obj_ls[$pkey][$ckey] = $comments_obj;
                }
            }
            $posts_obj_ls[$pkey] = $posts_obj;
            
        }

        /* Mark: Save post builk */
        $post_arr = $this->userRepository->saveMultiplePost($this->user, $posts_obj_ls);

        $post_arr = collect($post_arr);
        $user = $this->user;
        $post_arr->map( function ($post_id, $key) use($comment_obj_ls, $user) {
            // return $post_id;
            if ( $post_id->id ){
                /* Mark: Save comment bulk */
                // $post = Post::find($post_id->id);
                $post = $this->userRepository->findPostByID($post_id->id);
                $this->userRepository->saveMultipleComment($post, $comment_obj_ls[$key] );

            }
        });
    }

    public function getUserByIDSelectedFields()
    {
        $this->responses->debugLog("invoke method getUserByIDSelectedFields userservice.php");
        return $this->userRepository->getUserByIDSelectedFields($this->user->id);
    }

    public function userJsonResponse()
    {
        $this->responses->debugLog("invoke method userJsonResponse userservice.php");
        $this->responses->noticeLog("Successfully Created User", $this->getUserByIDSelectedFields()->toArray());
        return response()->json([
            "message" => "Success",
            "code"    => 200,
            "data"    => $this->getUserByIDSelectedFields()
        ]);
    }

    public function errorLog($message, array $list)
    {
        return $this->responses->criticalErrorLog($message, $list);
    }
}