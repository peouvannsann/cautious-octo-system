<?php


use Illuminate\Http\Request;
use App\Http\Controllers\dummyAPI;
use Illuminate\Support\Facades\Route;
use Spatie\WebhookServer\WebhookCall;
use App\Http\Middleware\VerifyCsrfToken;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\CardController;
use App\Http\Controllers\Api\CartController;
use App\Http\Controllers\Api\PostController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\WebhooksController;
use App\Http\Controllers\Api\BrandController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\PassportAuthController;
use App\Http\Controllers\Api\PersonalCVController;
use App\Http\Controllers\Api\VisitPlaceController;
use App\Http\Controllers\Api\PlanVisitPlaceController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

// Route::post('register', [PassportAuthController::class, 'register']);
// Route::post('login', PassportAuthController::class, 'login');

// Route::middleware('auth:api')->group(function () {
//     Route::get('get-user', PassportAuthController::class, 'userInfo');

//     Route::resource('products', ProductController::class);

// });

Route::post("register", [PassportAuthController::class, "register"]);
Route::post("login", [PassportAuthController::class, "login"]);
// Route::middleware('auth')->group(function(){
//     Route::get("userInfo", [PassportAuthController::class, "userInfo"]);
// });

// Route::get("get-product", [ProductController::class, "index"]);
// Route::get("show", [ProductController::class, "show"]);
// Route::post("store", [ProductController::class, "store"]);
// Route::middleware('auth')->group(function(){
//     Route::resource('products', ProductController::class);
// });
Route::resource('products', ProductController::class);
Route::get("data", [dummyAPI::class, "index"]);



// LEARN
Route::get('users/{name}', function ($name) {
    return "Hi " . $name;
});

Route::get('product1s/{id}', function ($id) {
    return "Product id is " . $id;
})->where('id', '[0-9]+');

// Route::match(['get', 'post'], '/getpost', function (Request $request) {
//     return 'Requested method is ' . $request->method();
// });

Route::any('/any', function (Request $request) {
    return "Requested method is " . $request->method();
});

Route::post('/hooks/strip', [WebhooksController::class, 'store'])
    ->withoutMiddleware(VerifyCsrfToken::class);

/* Sanctum  */
Route::post('/auth/register', [AuthController::class, 'createUser']);
Route::post('/auth/login', [AuthController::class, 'loginUser']);
Route::get('posts', [PostController::class, 'index'])->middleware('auth:sanctum');
Route::resource('product',ProductController::class);
// Route::get('posts', [PostController::class, 'index']);
// Reference : https://dev.to/shanisingh03/laravel-api-authentication-using-laravel-sanctum-edg

//Mark: Telegram send
// https://medium.com/in-laravel/sending-a-message-using-telegram-api-in-3-steps-894dbfecfdcc

Route::post('testing1', function () {
    
    // Guideline instruction : https://dev.to/nasrulhazim/webhook-part-ii-1b3
    // Noted: php artisan queue
    WebhookCall::create()
    ->url('https://webhook.site/9fb24dd0-b4e5-4a8a-a4de-10c438d4e6dc')
    ->payload(['key' => 'value'])
    ->useSecret('sign-using-this-secret')
    ->dispatch();
});


Route::middleware(['auth:sanctum'])->group(function (){
    Route::post("addUserRole", [UserController::class, "addUserRole"] );
    Route::get("getUserRole/{id}", [UserController::class, "getUserRole"] );
    Route::get("getUser", [UserController::class, "getUser"] );
    Route::get("getVisitPlaceByProvince", [VisitPlaceController::class, "getVisitPlaceByProvince"] );
    Route::get("filterVisitPlace", [VisitPlaceController::class, "filterVisitPlace"] );
    Route::get("getPlanVisitPlace", [PlanVisitPlaceController::class, "getPlanVisitPlace"] );
    Route::post("addPlanVisitPlace", [PlanVisitPlaceController::class, "addPlanVisitPlace"]);
    Route::get("getCategory", [CategoryController::class, "getCategory"]);
    Route::get("getPopularFilter", [CategoryController::class, "getPopularFilter"]);
    Route::get("getProduct", [ProductController::class, "getProduct"]);
    
    Route::get("getbrand", [BrandController::class, "getBrand"]);
    Route::get("getCategory", [CategoryController::class, "getCategory"]);
    
    Route::post("addOrder", [OrderController::class, "addOrder"]);
    Route::post("addCart", [CartController::class, "addCart"]);
    Route::get("sendOtpPhone", [AuthController::class, "sendOtpPhone"]);
    Route::post("addCard", [CardController::class, "addCard"]);
    Route::get("getCard", [CardController::class, "getCard"]);

});



Route::get("getVisitPlace", [VisitPlaceController::class, "getVisitPlace"] );
Route::post("addUserRoleXml", [UserController::class, "addUserRoleXml"] );

Route::get('/user/phonenumbers', [UserController::class, '']);
Route::get('personalcv', [PersonalCVController::class, 'index'] );



Route::delete("removePhoneByUser/{id}", [UserController::class, "removePhoneByUser"] );
Route::patch("updatePhoneByUser/{id}", [UserController::class, "updatePhoneByUser"] );
Route::post("addRole", [UserController::class, "addRole"] );

// Route::middleware(['permission_role:admin'])->group(function(){
//     Route::post("addUserRole", [UserController::class, "addUserRole"] );
// });
// Route::match(['GET', 'POST'],"{company}/{service}/{method}", function($company, $service, $method, Request $request){
//     $class_name = "App\Http\Controllers\Api\\".ucfirst($company)."Controller" ?? "";
//     return call_user_func([new $class_name(new BaseService()), $method], $request);
// });