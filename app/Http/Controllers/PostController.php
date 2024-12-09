<?php

namespace App\Http\Controllers;

use Image;
use App\Models\Post;
use App\Models\User;
use App\Models\Video;
use App\Models\Comment;
use Illuminate\Contracts\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class PostController extends Controller
{

    public function index()
    {
        // Eager Loading with() to avoid N + 1
        // $posts = Post::with('user', 'comments')->take(5)->get();
        // dd($posts);
        // return view("CRUD.posts", compact('posts'));
        // return $posts;
        \DB::enableQueryLog();
        // foreach (Comment::all() as $key => $value) {
        //     echo "name = ".$value->post->title; echo "<br>";
        // }
        // run multiple select * from `posts` where `posts`.`id` = ? limit 1
        foreach (Comment::with("post")->get() as $value) {
            echo "name = ".$value->post->title; echo "<br>";
        }
        dd(\DB::getQueryLog());
    }

    public function eagerLoadingWhere()
    {
        // $post = Post::with([
        //     'comments' => function (Builder $query){
        //         $query->where("approved", 0);
        //     }
        // ])->get();
        // OR
        $post = Post::with([
            'comments' => function ($query){
                $query->where("approved", 0);
            }
        ])->get();

        /* Mark: Nested Eager Loading */
        // $user_post = Post::with([
        //     'comments.users'
        // ])->get();
        // return $user_post;
        // dd( Comment::find(53)->users()->where('isAdmin', 1)->get()->toArray() );
        /* Mark: withdefault value */
        // dd( Comment::with(['users' => function($query){
        //     $query->where("isAdmin", 1);
        // }])->get()->toArray() );

        // dd( Post::with([
        //     'user' => function($query){
        //         $query->where("isAdmin", 1);
        //     }
        // ])->get()->toArray() );
        $user = User::find(2);
        dd( Post::whereBelongsTo($user, 'author')->get()->toArray() );
        
    }

    public function eagerConstraint() {
        \DB::enableQueryLog();
        $user = User::with(array("posts" => function ($query) {
            $query->where("title", "like", "est%");
        }))->get();
        dd(\DB::getQueryLog());
        return $user;
    }
    public function getAllPost()
    {
        $posts = DB::table('posts')->get();
        return view('CRUD.posts', compact('posts'));
    }

    public function addPost()
    {
        // return view('CRUD.add-post');
        return view("CRUD.add-post");
    }

    public function addPostSubmit(Request $request)
    {
        DB::table('posts')->insert([
            'title' => $request->title,
            'body' => $request->body
        ]);
        return back()->with('post_created', 'Post has been created successfully!');
    }

    public function getPostById( $id)
    {
        $post = DB::table('posts')->where('id', $id)->first();
        return view('CRUD.single-post', compact('post'));
    }

    public function deletePost( $id)
    {
        DB::table('posts')->where('id', $id)->delete();
        return back()->with('post_deleted', 'Post has been deleted successfully!');
    }

    public function editPost( $id)
    {
        $post = DB::table('posts')->where('id', $id)->first();
        return view('CRUD.edit-post', compact('post'));
    }

    public function updatePost(Request $request)
    {
        DB::table('posts')->where('id', $request->id)->update([
            "title" => $request->title,
            "body" => $request->body
        ]);
        return back()->with('post_updated', 'Post has been update successfully!');
    }

    public function innerJoinClause()
    {
        $request = DB::table('users')
        ->join('posts', 'users.id', '=', 'posts.user_id')
        ->select('users.name', 'posts.title', 'posts.body')
        ->get();
        return $request;
    }

    public function leftJoinClause()
    {
        $result = DB::table('users')
        ->leftJoin('posts', 'users.id', '=', 'posts.user_id')
        ->get();
        return $result;
    }

    public function rightJoinClause()
    {
        $result = DB::table('users')
        ->rightJoin('posts', 'users.id', '=','posts.user_id')->get();
        return $result;
    }

    public function getAllPostUsingModel()
    {
        $posts = Post::all();
        return $posts;
    }

    // Eloquent

    public function addPostEq()
    {
        return view('CRUD.add-post');
    }
    public function createPostEq(Request $request)
    {
        $post = new Post();
        $post->title = $request->title;
        $post->body = $request->body;
        $post->user_id = 22;
        $post->save();
        return back()->with('post_created', "Post has been created successfully!");
    }

    public function getPostEq()
    {
        $posts = Post::orderBy('id', "DESC")->get();
        return view('CRUD.posts', compact('posts'));
    }

    public function getPostEqById($id)
    {
        $post = Post::where('id', $id)->first();
        return view("CRUD.single-post", compact('post'));

    }

    public function deletePostEq( $id)
    {
        Post::where('id',$id)->delete();
        return back()->with('post_deleted', 'Post has been deleted successfully!');
    }

    public function editPostEq($id)
    {
        $post = Post::find($id);
        return view("CRUD.edit-post", compact('post'));
    }

    public function updatePostEq(Request $request)
    {
        $post = Post::find($request->id);
        $post->title = $request->title;
        $post->body = $request->body;
        $post->save();
        return back()->with('post_updated', 'Post has been updated successfully');
    }

    public function addComment($id)
    {
        /* Mark: Insert 1 to Many Relationship table */
        $post = Post::find($id);
        $comment = new Comment();
        $comment->body = "This is first comment";
        $comment->post_id = $id;
        $comment->user_id = 1;
        $post->comments()->save($comment);
        return "Comment has been posted";
    }

    /* 
        1 to many relationship
    */
    public function addPostComent()
    {
        /* Mark: Bulk insert */
        /* $post_data = [
            [
                "title" => "titl1 testing",
                "body" => "body1 testing",
                "user_id" => 1
            ],
            [
                "title" => "titl2 testing",
                "body" => "body2 testing",
                "user_id" => 1
            ],
        ];

        $post = Post::insert($post_data); */

        /* Mark: Insert 1 to many Relationship 
            ref : https://cerwyn.medium.com/laravel-one-to-many-relationship-6474d29cfd87

        */
        $post_data = [
            "title" => "titl1 testing",
            "body" => "body1 testing",
            "user_id" => 1
        ];

        $post_validator = Validator::make( $post_data, [
            'title'   => 'required|string|min: 3|max: 255',
            'body'    => 'required|string|min: 3|max: 25',
            'user_id' => 'required|int|min: 1|max: 20',
        ]);

        if($post_validator->fails()){
            return response()->json(['message'=>$post_validator->messages(),'data'=>null],400);
        }
        
        $post = new Post;
        $post = $post->create($post_validator->validate());
        print( createSuccess( $post, [ "message"=>"Comment Created", "data" => $post_validator->validate() ]));
        
        $solution = 4;

        /* Solution 1 */
        if ( $solution == 1 ){
            $comment = new Comment;
            $comment->body             = "This is first ".$post->id." comment from solution ".$solution;
            $comment->post_id          = $post->id;
            $comment->user_id          = 1;
            $comment->commentable_id   = 1;
            $comment->commentable_type = "App\Models\Post";
            print( createSuccess($post->comments()->save($comment), ["message"=>"Comment Created", "data"=>$comment]));

        }
        
        /* Solution 2 */

        if ( $solution == 2 ){

            $comment_data = [
                "body"             => "This is first ".$post->id." comment".$solution,
                "post_id"          => $post->id,
                "user_id"          => 1,
                "commentable_id"   => 1,
                "commentable_type" => "App\Models\Post",
            ];
            createSuccess( $post->comments()->create($comment_data), ["message"=>"Comment Created", "data"=>$comment_data] );

        }

        /* Solution 3
        ToRemember: Comment Create Record before post save() */

        if ( $solution == 3 ) {

            $comment_data = [
                [
                    "body"             => "This is first ".$post->id." comment".$solution,
                    "post_id"          => $post->id,
                    "user_id"          => 1,
                    "commentable_id"   => 1,
                    "commentable_type" => "App\Models\Post",
                ],
                [
                    "body"             => "This is second ".$post->id." comment".$solution,
                    "post_id"          => $post->id,
                    "user_id"          => 1,
                    "commentable_id"   => 1,
                    "commentable_type" => "App\Models\Post",
                ],
            ];
            createSuccess( $post->comments()->insert($comment_data), ["message"=>"Comment Created", "data"=>$comment_data] );
        }

        /* Mark: Associate */
        if ( $solution == 4 ){
            $comment = new Comment;
            $comment->body             = "This is first associate ".$post->id." comment from solution ".$solution;
            $comment->post_id          = $post->id;
            $comment->user_id          = 1;
            $comment->commentable_id   = 1;
            $comment->commentable_type = "App\Models\Post";
            print( createSuccess($comment->post()->associate($post)->save(), ["message"=>"Comment Created", "data"=>$comment]));

        }

    }


    /**
     *
     */
    public function getCommentByPost($id)
    {
        /**NOTE:
        * return all comment's record where post_id = $id
            return multiple record
        */

        /* Mark: 
            different dynamic relationship and relationship 
        */
        /* $comments = Post::find($id)->comments;
        dd($comments->toArray());
        $comments = Post::find($id)->comments();
        dd($comments); */

        /* Mark:
            Chaining Condition
        */
        $comments = Post::find($id)->comments()->where('body', 'like', '%This is first associate 69 comment from solution%')->first();


        /**NOTE:
        * Inverse Comment belongto Post (1Array)
            return 1 record
        */
        // $comments = Comment::find(1)->latestedComment;
        // dd($comments->toArray());

        return $comments;
    }

    function insertImage($id) {
        /**NOTE:
         * * Polymorphic Relatioinships
        **/
        //Mark: Post
        $post = Post::find($id);
        $post->image()->create([
            "url" => "image/image.jpeg"
        ]);
        return Post::find($id)->image()->get();

    }

    function addComments($post_id) {
        //Mark: Print Sql from eloquent
        // Debug
        // \DB::enableQueryLog();
        $post = Post::find($post_id);
        $post->commentsMorph()->create([
            "body"    => "First cool comment id=".$post_id,
            "user_id" => 1,
            "post_id" => $post_id
        ]);
        // dd(\DB::getQueryLog());
        // return $post->commentsMorph()->get();
    }

    function addtag($post_id) {
        $post = Post::find($post_id);
        $post->tags()->create([
            "name" => "eloquent"
        ]);
        return Post::find(1)->tags()->get();
    }

    function addtagVideo($post_id) {
        $video = Video::find($post_id);
        // $video->tags()->create([
        //     "name" => "php"
        // ]);
        //OR
        $video->tags()->attach($post_id);
        return Video::find(1)->tags()->get();

    }

    function getComment() {
        // \DB::enableQueryLog();
        //Mark: if you wish to pull at least 1 comment from every post use has()
        $post = Post::has('commentsMorph')->get();
        // dd(\DB::getQueryLog());
        return $post;
    }

    function getCommentByCount() {
        // \DB::enableQueryLog();
        $post = Post::has('commentsMorph', "=", 1)->get();
        // dd(\DB::getQueryLog());
        return $post;
    }

    function getCommentByWhereHas() {
        $posts = Post::whereHas('commentsMorph', function($q)
        {
            $q->select("commentable_id", "body")->where('body', 'like', '%id%');
        })->get();
        return $posts;
    }

    public function insertingRelateModel()
    {
        //Mark: inserting related models
        $comment = new Comment([
            'body'             => 'A new comment.',
            'user_id'          => 1,
            'post_id'          => 1,
            'commentable_id'   => 1,
            'commentable_type' => "App\models\Post"
        ]);
        //Mark: inserting multiple related models
        $comments = [
            new Comment([
                'body'             => 'A new comment.1',
                'user_id'          => 1,
                'commentable_id'   => 1,
                'commentable_type' => "App\models\Post"
            ]),
            new Comment([
                'body'             => 'A new comment.2',
                'user_id'          => 1,
                'commentable_id'   => 1,
                'commentable_type' => "App\models\Post"
            ])
        ];

        $post = Post::find(1);

        //Mark: inserting related models
        $comment = $post->comments()->save($comment);
        //Mark: inserting multiple models
        $comment = $post->comments()->saveMany($comments);
    }

    public function upadingBelongsTo()
    {
        //Mark: Not clear
        \DB::enableQueryLog();
        // https://postsrc.com/code-snippets/how-to-associate-and-dissociate-relationship-in-laravel
        // $firstUser = User::first();
        // Post::first()->user()->associate($firstUser)->save();
        // $user = User::create([
        //     "name" => 'vannsann1',
        //     "email" => "vannsann1@gmail.com",
        //     "password" => "$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi",
        // ]);
        $user = User::find(1);

        $post = Post::create([
            "title" => "title 1",
            "body" => "body 1",
            "user_id" => 1,
        ]);
        $post->user()->associate($user)->save();
        dd(\DB::getQueryLog());
    }

    public function addJsonMetadata()
    {
        $post = new Post;
        $post->title = 'Sample Post Title';
        $post->body = 'Sample Post body';
        $post->user_id = '1';
        $post->metadata = ['author' => 'Prevail E.', 'tags' => ['laravel', 'json']];
        $post->save();
    }
    public function updateJsonMetadata()
    {
        /* 
            Error: 
                if you try to access key via $post->metadata directly will cause error because array 
                cast return a primitive type it's not possible to mutate an offset .
            To fix: use Array Object and Collection Casting 
            $post = Post::find(68);
            $post->metadata['key'] = "test";
            $metadata['tags'][] = 'eloquent';
            $post->metadata = $metadata;
            $post->save(); 
        */

        $post = Post::find(68);
        $post->metadata['key'][] = "test";
        $post->metadata['tags'][] = 'eloquent test';
        // $post->metadata = $metadata;
        $post->save(); 

        /* $post = Post::find(68);
        $metadata = $post->metadata;
        $metadata['tags'][] = 'eloquent';
        $post->metadata = $metadata;
        $post->save(); */
    }
    public function getJsonMetadataByPostID($id)
    {
        return Post::where("id", $id)->whereJsonContains('metadata->tags', 'laravel')->get('metadata');
    }

    public function accessJsonMetadataByPostID(int $id, string $str)
    {
        // $str = "author";
        return Post::findOrFail($id)->metadata[$str];
    }

}
