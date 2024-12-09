<?php

use App\Models\User;
use App\Mail\MyTestMail;
use App\Mail\WelcomeMail;
use App\Widgets\RecentNews;
use App\Mail\AttachmentMail;
use App\PaymentGateway\Payment;
use App\Notifications\NotifyUser;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Route;
use Spatie\WebhookServer\WebhookCall;
use App\Http\Controllers\CarsController;
use App\Http\Controllers\MailController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use Spatie\Permission\Models\Permission;
use App\Http\Controllers\FrontController;
use App\Http\Controllers\ImageController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\SalesController;
use App\Http\Controllers\ClientController;
use App\Http\Controllers\EditorController;
use App\Http\Controllers\EmailsController;
use App\Http\Controllers\MasterController;
use App\Http\Controllers\UploadController;
use App\Http\Controllers\FeatureController;
use App\Http\Controllers\GalleryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\SessionController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\DropzoneController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\NewsLetterController;
use App\Http\Controllers\PaginationController;
use App\Http\Controllers\TestsEnrollmentController;
use Illuminate\Contracts\Cache\LockTimeoutException;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/{locale}', function ($locale) {
//     if (! in_array($locale, ['en', 'es', 'fr'])) {
//         // abort(400);
//     }

//     App::setLocale($locale);
//     return view('welcome');
// });
Route::get('/', function () {
    return view('welcome');
});

// Route::get('/newsletter', [NewsLetterController::class, "index"]);
// Route::post("/subscribe", [NewsLetterController::class, "subscribe"]);

Route::prefix('/user')->controller(UserController::class)->group(function () {
    Route::get('/import-users', 'import');
    Route::get('/javascriptObject', 'javascriptObject');
    Route::get('/jqueryDomTraversal', 'jqueryDomTraversal');
    Route::get('/phpArrayFunction', 'phpArrayFunction');
    Route::post('/users_xlsx', 'readFromXlsx');
    Route::post('/users_excel_xlsx', 'readFromExcell');
    Route::post('/ajax_excell', 'ajaxExcell')->name('ajax_excell.csv');
    Route::get('/chunk', 'userChunk')->name('ajax_excell.csv');
    Route::get('/get_col_user', 'collectionReject');
    Route::get('/tooltiptest', 'tooltiptest');
});
Route::get('/users', [UserController::class, 'index'])->name('users.index');


Route::post('/downloadFile', [UserController::class, 'downloadFile']);
Route::get('/front', [FrontController::class, 'index']);
Route::get('/master', [MasterController::class, 'index']);

// Auth::routes();

// Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

// Auth::routes();

Route::get('/feature/updateFile', [FeatureController::class, 'downloadFileuploadFile']);


// Authenticate
Route::get('/login', function () {
    return view('auth.login');
});

Route::get('/register', function () {
    return view('auth.register');
});

Route::post('/register', [RegisterController::class, 'register'])->name('register');
Route::post('/login', [LoginController::class, 'login'])->name('login');
Route::post('/logout', [LoginController::class, 'logout'])->name('logout');

Route::get('home', function () {
    return view('home');
})->name('home');

Route::middleware(['auth'])->group(function () {
    Route::get('home', function () {
        return view('home');
    })->name('home');
});

// End Authenticate

/**NOTE:
 * *Middleware
**/


// Route::get('/profile', function () {
//     return view('profile');
// })->middleware('auth');

// Route::get('/profile', function () {
//     return view('profile');
// })->middleware(['auth', 'ageCheck']);

// Route::middleware(["auth"])->group(function () {
//     Route::get('/auth/home', function () {
//         return "Hello From Auth home";
//     });

//     Route::get('/auth/profile', function () {
//         return "auth profile";
//     })->withoutMiddleware("auth");

// });

// Route::withoutMiddleware([EnsureTokenIsValid::class])->group(function () {
//     Route::get('/profile', function () {
//         return 'profile without middlware';
//     });
// });

// Route::get('/', function () {
//     //
// })->middleware('web');

// Route::middleware(['web'])->group(function () {
//     //
// });

Route::get('/post/{id}', function ($id) {
    return "user id's = ".$id;
})->middleware('role:3');

// endMiddleware


// Gate

// Route::get('/private', function () {
//     // dd(auth()->user()->all());
//     // if (Gate::allows('admin-only', auth()->user())){
//     if (Gate::denies('admin-only', auth()->user())){
//         return view("private");
//     }else{
//         abort(403);
//     }
// });
//

/** Send Emails
 * DC : https://mailtrap.io/inboxes/1967562/messages/3126869010/html
 * https://www.youtube.com/watch?v=10755StTiCo&list=PLFHz2csJcgk9Clvtb5PXS_YQJayooFpjl&index=3
 * php artisan make:mail WelcomeMail -m emails.welcome
 * MAIL_MAILER=log
 *  MAIL_HOST=smtp.mailtrap.io
 *  MAIL_PORT=2525
 *  MAIL_USERNAME=2370b351a5b9a5
 *  MAIL_PASSWORD=5d3226a4e6aedc
 *  MAIL_ENCRYPTION=tls
 *
 */
// Route::get('/email', function () {
//     Mail::to("peouvannsann2222@gmail.com")->send(new WelcomeMail());
//    return new WelcomeMail();
// });

// Route::get('/email', [EmailsController::class, 'email']);

// Notification
Route::get('/send-testenrollment', [TestsEnrollmentController::class, 'sendTestNotification']);
//https://www.youtube.com/watch?v=XxV9kUyne_w&list=PLFHz2csJcgk9Clvtb5PXS_YQJayooFpjl&index=7

// End Send Email

// LEARN
// Route::view('user', 'user');
// Route::view('home', 'home');
// Route::view('noaccess', 'noaccess');

// Route::get('/posts', [ClientController::class, 'getAllPost'])->name('posts.getallpost');
// Route::get('/posts/{id}', [ClientController::class, 'getPostById'])->name('posts.getpostbyid');
Route::get('/add-post',         [ClientController::class, 'addPost'])->name('posts.addpost');
Route::get('/update-post/{id}', [ClientController::class, 'updatePost'])->name('posts.update');
Route::get('/delete-post/{id}', [ClientController::class, 'deletePost'])->name('posts.delete');

Route::prefix('/session/')->group(function () {
    Route::get('get',    [SessionController::class, 'getSessionData'])->name('session.get');
    Route::get('set',    [SessionController::class, 'storeSessionData'])->name('session.store');
    Route::get('remove', [SessionController::class, 'deleteSessionData'])->name('session.delete');
});

Route::get('/post-crud',      [PostController::class, 'getAllPost'])->name('post.getallpost');
Route::get('/add-post-crud',  [PostController::class, 'addPost'])->name('post.add');
Route::post('/add-post-crud', [PostController::class, 'addPostSubmit'])->name('post.addsubmit');

Route::get('/post-crud/{id}',        [PostController::class, 'getPostById'])->name('post.getbyid');
Route::get('/delete-post-crud/{id}', [PostController::class, 'deletePost'])->name('post.delete');
Route::get('/edit-post-crud/{id}',   [PostController::class, 'editPost'])->name('post.delete');
Route::post('/update-post-crud',     [PostController::class, 'updatePost'])->name('post.update');

Route::get('/inner-join', [PostController::class, 'innerJoinClause'])->name('post.innerjoin');
Route::get('left-join',   [PostController::class, 'leftJoinClause'])->name('post.leftjoin');
Route::get('right-join',  [PostController::class, 'rightJoinClause'])->name('post.rightjoin');
Route::get('/all-posts',  [PostController::class, 'getAllPostUsingModel'])->name('post.getallpostusingmodel');

// Route::get('/home', function () {
//     return view('homePage.index');
// });

Route::get('/about', function () {
    return view('homePage.about');
});

Route::get('/contact', function () {
    return view('homePage.contact');
});

Route::get('/home/users',   [PaginationController::class, 'allUsers'])->name('home.users');
Route::get('/home/upload',  [UploadController::class,     'uploadForm'])->name('home.uploadForm');
Route::post('/home/upload', [UploadController::class,     'uploadFile'])->name('upload-uploadFile');
Route::get('/uploadFile',   [UploadController::class,     'uploadFileTest']);

Route::get('/{locale}/payment', function ($locale) {
    App::setLocale($locale);
    return Payment::process();
});

Route::get('/send-email', [MailController::class, 'sendEmail']);


// Eloquent

Route:: get('/students',            [StudentController::class, 'fetchStudents']);
Route:: get('/add_post_eq',         [PostController::class,    'addPostEq']);
Route:: post('/add_post_eq',        [PostController::class,    'createPostEq'])->name('post.create.eq');
Route:: get('/all_posts_eq',        [PostController::class,    'getPostEq']);
Route:: get('/all_posts_eq/{id}',   [PostController::class,    'getPostEqById']);
Route:: get('/delete_post_eq/{id}', [PostController::class,    'deletePostEq']);
Route:: get('/edit_post_eq/{id}',   [PostController::class,    'editPostEq']);
Route:: get('/update_post_eq',      [PostController::class,    'updatePost'])->name('post.update.eq');

// One to One
Route::get('/add_user',           [UserController::class, 'insertUserRecord']);
Route::get('/get_phone/{id}',     [UserController::class, 'fetchPhoneByUser']);
Route::get('/get_all_phone/{id}', [UserController::class, 'fetAllPhoneByUser']);
//
// One to Many
Route::get('/add_comment/{id}',      [PostController::class, 'addComment']);
Route::get('/get_comments/{id}',     [PostController::class, 'getCommentByPost']);
Route::get('/add-comments/multiple', [PostController::class, 'insertingRelateModel'])->name('user.index');
Route::get('/update-comments',       [PostController::class, 'upadingBelongsTo']);
Route::get("/bulk-insert-post",      [PostController::class, 'addPostComent']);
Route::get("/eagerloadingWhere",     [PostController::class, 'eagerLoadingWhere']);

//
Route::get('/userInfo', [UserController::class, 'userInfo']);
Route::get('/testUser', [UserController::class, 'testUser']);

// Many to Many Relationship
Route::get('/add_roles',        [RoleController::class, 'addRole']);
Route::get('/add_user_role',    [RoleController::class, 'addUserRole']);
Route::get('/add_user_role_by_id/{user_id}',    [RoleController::class, 'addUserRoleByID']);
Route::get('/rolesbyuser/{id}', [RoleController::class, 'getAllRolesByUser']);
Route::get('/usersbyrole/{id}', [RoleController::class, 'getAllUserByRole']);
//Mark: RelateModel
Route::prefix('relateModel')->group(function () {
    Route::get('/insertingRelateMany/{user_id}',        [UserController::class, 'insertingRelateMany']);
    Route::get('/detachRelateMany/{user_id}/{role_id}', [UserController::class, 'detachRelateMany']);
    Route::get('/synRelateMany/{user_id}/{role_id}',    [UserController::class, 'synRelateMany']);
});
Route::get('touchParentTimestamps', [UserController::class, 'touchParentTimestamps']);
Route::get('pivotetable',           [UserController::class, 'pivotetable']); //Mark: Pivote table
//

//Mark: Polymorphic relation
Route::prefix('post/')->group(function () {
    Route::get('add-image/{id}',          [PostController::class, 'insertImage']);
    Route::get('add-comment/{id}',        [PostController::class, 'addComments']);
    Route::get('add-tag/{post_id}',       [PostController::class, 'addtag']);
    Route::get('add-tag/video/{post_id}', [PostController::class, 'addtagVideo']);
    //Mark: Query relation
    Route::get('has-comment',          [PostController::class, 'getComment']);
    Route::get('has-comment-count',    [PostController::class, 'getCommentByCount']);
    Route::get('has-comment-whereHas', [PostController::class, 'getCommentByWhereHas']);
});
Route::get('user/add-image/{id}', [PostController::class, 'insertImage']);
//
// Eager Loading with() to avoid N + 1
Route::get('/posts',            [PostController::class, 'index']);
Route::get('/posts-constraint', [PostController::class, 'eagerConstraint']);

Route::get('/add_employee', [EmployeeController::class, 'addEmployee']);

/** Export csv, xlsx file
 * Document :  https://docs.laravel-excel.com/3.1/exports/exportables.html
 * tutorial : https://www.youtube.com/watch?v=KKOMJQBkPLE&list=PLz_YkiqIHesvWMGfavV8JFDQRJycfHUvD&index=33
 */
Route::get('/export_excel', [EmployeeController::class, 'exportIntoExcel']);
Route::get('/export_csv',   [EmployeeController::class, 'exportIntoCSV']);

/** Export PDF
 * Document : https://github.com/barryvdh/laravel-dompdf
 * composer require barryvdh/laravel-dompdf
 * php artisan vendor:publish --provider="Barryvdh\DomPDF\ServiceProvider"
 *
 * tutorial : https://www.youtube.com/watch?v=ILaPHDERLYQ&list=PLz_YkiqIHesvWMGfavV8JFDQRJycfHUvD&index=35
 */
Route::get('/get_all_employee', [EmployeeController::class, 'getAllEmployees']);
Route::get('/download_pdf',     [EmployeeController::class, 'downloadPDF']);

/** Import File
 * Document : https://github.com/barryvdh/laravel-dompdf
 * php artisan make:import EmployeeImport --model=Employee
 *
 */
Route::get('/import_form',  [EmployeeController::class, 'importForm']);
Route::post('/import_form', [EmployeeController::class, 'import'])->name('employee.import');

/** Import Image
 * Document : https://image.intervention.io/v2/introduction/installation
 * Document : https://www.positronx.io/laravel-image-resize-upload-with-intervention-image-package/
 * More Info : https://www.positronx.io/laravel-image-resize-upload-with-intervention-image-package/
 * composer require intervention/image
 */
Route::get('/resize_image',  [ImageController::class, 'resizeImage']);
Route::post('/resize_image', [ImageController::class, 'resizeImageSubmit'])->name('image.resize');

/** DropZone
 * Document : https://cdnjs.com/libraries/dropzone
 * <script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.9.3/dropzone.min.js" integrity="sha512-U2WE1ktpMTuRBPoCFDzomoIorbOyUv0sP8B+INA3EzNAhehbzED1rOJg6bCqPf/Tuposxb5ja/MAUnC8THSbLQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 * <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.9.3/dropzone.min.css" integrity="sha512-jU/7UFiaW5UBGODEopEqnbIAHOI8fO6T99m7Tsmqs2gkdujByJfkCbbfPSN4Wlqlb9TGnsuC0YgUgWkRBK7B9A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 *
 */
Route::get('/dropzone',        [DropzoneController::class, 'dropzone']);
Route::post('/dropzone_store', [DropzoneController::class, 'dropzoneStore'])->name('dropzone.store');

/** Lazy Loading
 *  Document : https://cdnjs.com/libraries/jquery.lazyload
 * <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.lazyload/1.9.1/jquery.lazyload.min.js" integrity="sha512-jNDtFf7qgU0eH/+Z42FG4fw3w7DM/9zbgNPe3wfJlCylVDTT3IgKW5r92Vy9IHa6U50vyMz5gRByIu4YIXFtaQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 * <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.lazyload/1.9.1/jquery.lazyload.js" integrity="sha512-FwqNPb8ENFXApJKNgRgYq5ok7VoOf5ImaOdzyF/xe/T5jdd/S0xq0CXBLDhpzaemxpQ61X3nLVln6KaczwhKgA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 */
Route::get('/gallery', [GalleryController::class, 'gallery']);

/** Typeahead
 *  Document : https://github.com/bassjobsen/Bootstrap-3-Typeahead
 *  Document : https://cdnjs.com/libraries/bootstrap-3-typeahead
 *
 */
Route::get('/add_product',  [ProductController         ::class, 'addProducts']);
Route::get('/search',       [ProductController         ::class, 'search']);
Route::get('/autocomplete', [ProductController::class, 'autocomplete'])->name('autocomplete');

/** TinyNCE WYSIWYG (Editor)
 *  Document : https://www.tiny.cloud/my-account/dashboard/
 */
Route::get('/editor', [EditorController::class, 'editor']);

/** Image CRUD
 *
 *
 */

Route::get('/add_student',         [StudentController::class, 'addStudent']);
Route::post('/add_student',        [StudentController::class, 'storeStudent'])->name('student.store');
Route::get('/all_student',         [StudentController::class, 'all_students']);
Route::post('/update_student',     [StudentController::class, 'updateStudent'])->name('student.update');
Route::get('/edit_student/{id}',   [StudentController::class, 'editStudent']);
Route::get('/delete_student/{id}', [StudentController::class, 'deleteStudent']);


 // Job Batching
 /** Job Batching
  * Document : https://www.youtube.com/watch?v=WI6jenTRizA&list=PLe30vg_FG4OTrILM1C9NvCgujTRKGsAwB&index=9
  *
  */
Route::get('/upload', function () {
   return view("upload-file");
});

Route::get('/upload',[SalesController     ::class, 'index']);
Route::post('/upload',    [SalesController::class, 'upload'])->name('upload.csv');
Route::get('/store-data', [SalesController::class, 'store']);
Route::get('/batch',      [SalesController::class, 'batch']);

// End Job Batching

/**NOTE:
 * * Monitor Redis Queue Jobs
 * * Document : tutorial => https://www.youtube.com/watch?v=DjbQm4IZCYQ
 *  * mailtrap => https://mailtrap.io/inboxes/1967562/settings
 *
**/

Route::get('/notify', function () {
    User::find(22)->notify(new NotifyUser);
    User::all()->each->notify(new NotifyUser);
    return "Done";
});

// * End Monitor Redis Queue Jobs

/**NOTE:
 * * Cache Using Redis
 * Document : tutorial =>
**/
Route::get('/redis/cache', function () {
    // $value = Cache::get("key");

    // $value = Cache::store('file')->get('foo');

    // Cache::store('redis')->put('bar', 'baz', 600); // 10 Minutes //Mark: access multiple attribute and set timer 10 Minutes

    // $value = Cache::get('key'); //Mark: access cache store method

    // $value = Cache::get('key', 'default');//Mark: access cache store method and set default value if it null

    // $value = Cache::get('key', function () {
    //     return DB::table("users")->find(1);
    // }); //Mark: the result of the closure will be returned if the specified item does not exist

    // $value = Cache::remember('users', 600, function () {
    //     return DB::table('users')->get();
    // }); //Mark: store default value if requested does not exist

    // $value = Cache::rememberForever('users', function () {
    //     return DB::table('users')->get();
    // });//Mark: retrieve an item from the cache or store it forever if it does not exist
    // return $value;

    // $value = Cache::pull('key'); //Mark: like get method, null will be returned if the item does not exist in the cache.

    // Cache::put('key', 'value', $seconds = 10);// store in cache

    // Cache::put('key', 'value');//Mark: without time it will be stored indefinitely

    // Cache::put('key', 'value', now()->addMinutes(10)); //Mark:passing DateTime instead of passing the number of seconds as an integers.

    // Cache::add('testingAdd', 'Cache::add', 100);//Mark: add item to the cache if it does not already exist in the cache store. return true if it already exists else false.

    // Cache::forever('key', 'value');//Mark: store forever

    // Cache::forget('testing');//Mark: remove from the cache

    // Cache::put('key', 'value', 0);//Mark: remove item by providing a zero or negative number of expireation seconds.

    // Cache::flush();//Mark: clear the entire cache

    // cache(['key' => 'value'], 600);// Mark: store array of objects, prvide array of key / value pairs and an expiration

    // Cache::tags(['people', 'artists'])->put('John', "John", 600);
    // Cache::tags(['people', 'authors'])->put('Anne', "Anne", 600);

    // $lock = Cache::lock('foo', 10);

    // if ($lock->get()) {
    //     // Lock acquired for 10 seconds...
    //     $lock->release();
    //     return "Done";
    // }

    // $lock = Cache::lock('foo', 10);

    // try {
    //     $lock->block(20);
    //     // if ($lock->get()) {
    //     //     $lock->release();
    //     // }

    //     return "Done after 5 seconds";
    // } catch (LockTimeoutException $e) {
    //     return "cannot be acquired within the specified timeout";
    // }
    // finally {
    //     optional($lock)->release();
    //     return "Finally release";
    // }

});

Route::get('/redis/getCache', function () {
    // return Cache::get('testing');
    // $john = Cache::tags(['people', 'artists'])->get('John');
    // $anne = Cache::tags(['people', 'authors'])->get('Anne');
    // return [$john, $anne];

    // Cache::tags(['people', 'authors'])->flush();
    // Cache::tags('authors')->flush();

});

/**NOTE:
*
Car CRUD, Eloquent,
*/

Route::resource('/cars', CarsController::class);

/**NOTE:
 * *select2
**/
Route::get('/select2-ajax-remote-data', [UserController::class, 'ajax_remote_data']);
Route::get('/get-response', [UserController::class, 'filterUser'])->name("ajax.get.response");
//end seelct2

/**NOTE:
 * *Events
**/
Route::get('users/index', function () {
    return view("user");
});
Route::post('users/userSubscribe', [NewsletterController::class, 'subscribe'])->name("user.subscribe");
// end event



Route::get('send-mail', function () {
   
    $details = [
        'title' => 'Mail from ItSolutionStuff.com',
        'body' => 'This is for testing email using smtp'
    ];
   
    Mail::to('peouvannsann2222@gmail.com')->send(new MyTestMail($details));
    // dd("Email is Sent.");
});



Route::any('testing1', function () {
    
    WebhookCall::create()
    ->url('https://webhook.site/9fb24dd0-b4e5-4a8a-a4de-10c438d4e6dc')
    ->payload(['key' => 'value'])
    ->useSecret('sign-using-this-secret')
    ->dispatch();
});

Route::get('users/{id}/name/{name}',[UserController::class, 'testUserController'] );


/* Widget */
Route::get("test-widget", [UserController::class, "testWidget"]);

Route::get("dompdf_test", function () {
    $tempFilePath = storage_path('public/temp/temp1.pdf');
    // file_put_contents($tempFilePath, $binaryData);

    // Convert the binary data to a PDF using dompdf
    $pdf = PDF::loadFile($tempFilePath);

});
// Route::get("permission", function () {
    
//     $role = Role::create(['name' => 'writer']);
//     $permission = Permission::create(['name' => 'edit articles']);
//     $role->givePermissionTo($permission);
//     $permission->assignRole($role);

// });

Route::get("addJsonMetadata", [PostController::class, "addJsonMetadata"]);
Route::get("updateJsonMetadata", [PostController::class, "updateJsonMetadata"]);
Route::get("getJsonMetadataByPostID/{id}", [PostController::class, "getJsonMetadataByPostID"]);
Route::get("accessJsonMetadataByPostID/{id}/{str}", [PostController::class, "accessJsonMetadataByPostID"]);