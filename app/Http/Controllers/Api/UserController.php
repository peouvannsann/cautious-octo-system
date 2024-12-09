<?php

namespace App\Http\Controllers\Api;

use App\Enums\RoleEnum;
use App\Models\Post;
use App\Models\Role;
use App\Models\User;
use App\Models\Phone;
use SimpleXMLElement;
use App\Models\Comment;
use Illuminate\Http\Request;
use App\Services\UserService;
use Illuminate\Routing\Route;
use App\Services\RestAPIService;
use Spatie\ArrayToXml\ArrayToXml;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Validator;
use App\Interfaces\UserRepositoryInterface;

class UserController extends Controller
{
    private UserService $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

    public function addUserRole( Request $request )
    {
        // Route::post("addUserRole", [UserController::class, "addUserRole"] );
        try {
            $user_service = $this->userService;
            $user_service->validateUser($request);
            $user_service->userCreateOrNot();

            DB::beginTransaction();
            $user_service->userCreatePhone();
            $user_service->addRole([1]);
            $user_service->addPostComment($request->all()['posts']);
            DB::commit();

            return $user_service->userJsonResponse();
            
        } catch (\Throwable $th) {
            $user_service->responses->criticalErrorLog($th->getMessage(), $th);
            DB::rollback();
            return $th->getMessage().$th->getLine();
        }
    }

    public function addUserRoleXml(Request $request)
    {
        $string_xml = $request->getContent();
        $xml        = simplexml_load_string($string_xml);
        $result     = $xml->asXML();
        log_info("request".$string_xml);
        log_info("request".$xml);
        return Response::make($result, '200')->header('Content-Type', 'text/xml');

        /*  <?xml version="1.0" encoding="ascii"?>
            <ns0:Envelope xmlns:ns0="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns1="http://chargeur.tracking.geopost.com/">
                <ns0:Header/>
                <ns0:Body>
                    <ns1:track>
                        <user>
                            <name>John333</name>
                            <email>john333@example.com</email>
                            <password>123456</password>
                            <phone>099 123 123</phone>
                            <phone>099 123 213</phone>
                            <phone>099 123 312</phone>
                            <phone>099 123 231</phone>
                        </user>
                        <role>1</role>
                        <posts>
                            <title>title 1</title>
                            <body>body testing</body>
                            <comments>
                                <body>comment post 1</body>
                            </comments>
                            <comments>
                                <body>comment post 2</body>
                            </comments>
                        </posts>
                        <posts>
                            <title>title 2</title>
                            <body>body testing</body>
                            <comments>
                                <body>comment post 1</body>
                            </comments>
                            <comments>
                                <body>comment post 2</body>
                            </comments>
                        </posts>
                    </ns1:track>
                </ns0:Body>
            </ns0:Envelope> 
        */

        // $restapi = new RestAPIService();
        // $restapi->arrayToXmlAndReturnXml($request);

        $json_to_array = $request->all();
        $result = ArrayToXml::convert(
            [
                'ns0:Header' => [
                    '_attributes' => [
                        'xmlns:wsse' => 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd',
                    ],
                    'wsse:Security' => [
                        'wsse:UsernameToken' => [
                            "username" => "sann",
                            "password" => "123456",
                        ]
                    ]
                ],
                'ns0:Body' => [
                    "ns1:track" => $json_to_array
                ],
            ], 
            [
                'rootElementName' => 'ns0:Envelope',
                '_attributes' => [
                    'xmlns:ns0' => 'http://schemas.xmlsoap.org/soap/envelope/',
                    'xmlns:ns1' => 'http://chargeur.tracking.geopost.com/',
                ],
            ], 
            true, '
            ascii'
        );
        return Response::make($result, '200')->header('Content-Type', 'text/xml');
    }

    public function addUserRoleVersion1( Request $request )
    {
        try {
            $user_validator = Validator::make( $request->all()['user'], [
                'name'     => 'required|string',
                'email'    => 'required|email',
                'password' => 'required',
                'phone'    => 'required'
            ]);

            if ( $user_validator->fails() ) return $user_validator->messages();
            $validated_user = $user_validator->validated();

            DB::beginTransaction();
            
            $is_user_fields_exists = [
                'name' => $validated_user['name'],
                'email' => $validated_user['email']
            ];
            $is_user_fields_not_exists = [
                'password' => Hash::make($validated_user['password']),
                'isAdmin' => 1,
                'enum_role' => RoleEnum::ADMIN->value
            ];
            
            $user = User::firstOrCreate(
                $is_user_fields_exists,
                $is_user_fields_not_exists
            ); 
           
            return response()->json([
                "message" => "Success",
                "code" => 200,
                "data" => $user
            ]);

            // $phone = new Phone;
            // $phone->phone = $validated_user['phone'];
            // $user->phones()->save( $phone );

            /* Mark: HasMany SaveMany() method */
            $phone_obj_ls = [];
            foreach ($validated_user['phone'] as $key => $phones) {
                $phone_obj          = new Phone;
                $phone_obj->phone   = $phones;
                $phone_obj_ls[$key] = $phone_obj;
            }
            $user->phones()->saveMany( $phone_obj_ls );

            /* Mark ManyToMany Attach() or Sync() method */
            $roleids = [2,4];
            /* Noted: Attach for many to many and add new always */
            // $user->roles()->attach($roleids);
            /* Noted: Sync add new if now exists and update if exists */
            $user->roles()->sync([2,4]);

            $posts_obj_ls = [];
            $comment_obj_ls = [];
            foreach ($request->all()['posts'] as $pkey => $posts) {
                
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
                        $comments_obj->user_id          = $user->id;

                        $comment_obj_ls[$pkey][$ckey] = $comments_obj;
                    }
                }
                $posts_obj_ls[$pkey] = $posts_obj;
                
            }

            /* Mark: Save post builk */
            $post_arr = $user->posts()->saveMany($posts_obj_ls);

            $post_arr = collect($post_arr);
            $post_arr->map( function ($post_id, $key) use($comment_obj_ls, $user) {
                // return $post_id;
                if ( $post_id->id ){
                    /* Mark: Save comment bulk */
                    $post = Post::find($post_id->id);
                    $post->comments()->saveMany( $comment_obj_ls[$key] );

                }
            });

            DB::commit();
            $user = User::where("id", $user->id)->with(
                [
                    "selectedRoles",
                    "selectedPhones",
                    "posts",
                    "selectedPosts.selectedComments"
                ]
            )->get()->map( function (User $user) {
                return $user;
            });

            return response()->json([
                "message" => "Success",
                "code" => 200,
                "data" => $user
            ]);
            
        } catch (\Throwable $th) {
            DB::rollback();
            return $th->getMessage().$th->getLine();
        }
    }

    /**
        * @OA\Get(
        *     path="/getUserRole/{id}",
        *     operationId="User",
        *     tags={"User"},
        *     summary="Get user by ID",
        *     @OA\Parameter(
        *         name="id",
        *         in="path",
        *         description="User's ID ",
        *         required=false,
        *         @OA\Schema(type="int")
        *     ),
        *     @OA\Response(response="201", description="successfully"),
        *     @OA\Response(response="422", description="errors"),
        *     security={{"bearerAuth":{}}}
        * )
    */
    public function getUserRole( Request $request, $user_id) 
    {

        try {
            
            // $user = User::where("id", $user_id)->with(
            //     [
            //         "roles" => function ($query) {
            //             $query->select("user_id", "name");
            //         },
            //         "selectedPhones" => function ($query) {
            //             $query->select("phone", "user_id");
            //         }
            //     ]
            // )->get()->toArray();

            $user = User::where("id", $user_id)->with(
                [
                    "selectedRoles",
                    "selectedPhones",
                    "posts"
                ]
            )->get()->map( function (User $user) {
                return $user;
            });

            // $resource = YourModel::find($id);

            return response()->json($user)
                ->header('Cache-Control', 'max-age=3600')
                ->header('ETag', md5(json_encode($user)))
                ->header('Last-Modified', $user[0]['updated_at']);
            
            // return $user[0]['updated_at'];
            
        } catch (\Throwable $th) {
            return $th;
        }

    }

    public function removePhoneByUser(Request $request, $user_id) 
    {
        /* Mark: Delete HasMany 
            Delete all phones for specific user
        */
        $user = User::findOrFail($user_id);
        // $user->phones()->delete();
        $user->activatePhone(1)->delete();

        dd($user);
    }

    public function updatePhoneByUser(Request $request, $user_id)
    {
        $user = User::findOrFail($user_id);
        $user->activatePhone(0)->update([
            "phone" => "123 123 123"
        ]);
    }

    public function index(Request $request)
    {
        
    }

    public function addRole(Request $request)
    {
        try {
            $request_role = $request->all();
            $append_role = [];
            foreach ($request_role['role'] as $key => $value) {
                $append_role[]['name'] = $value;
            }
    
            Role::insert($append_role);
            return $append_role;
        } catch (\Throwable $th) {
            
        }
    }
    /**
        * @OA\Get(
        *     path="/getUser",
        *     operationId="get user",
        *     tags={"User"},
        *     summary="Get user",
        *     @OA\Response(response="201", description="successfully"),
        *     @OA\Response(response="422", description="errors"),
        *     security={{"bearerAuth":{}}}
        * )
    */
    public function getUser(Request $request)
    {
        $user_id = $request->user()->id;
        $user = User::findOrFail($user_id);
        return response()->json([
            'status' => true,
            'message' => 'Successfully',
            'data' => $user
        ], 200);
    }
}
