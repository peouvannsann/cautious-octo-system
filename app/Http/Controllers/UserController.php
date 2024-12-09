<?php

namespace App\Http\Controllers;

use stdClass;
use App\Models\Role;
use App\Models\User;
use App\Models\Phone;
use App\Models\Comment;
use App\Models\Product;
use App\Imports\UsersImport;
// require 'vendor/autoload.php';

use Illuminate\Http\Request;
use App\Charts\MonthlyUsersChart;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\File;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Contracts\Cache\Store;
use PhpParser\Node\Expr\Cast\String_;
use Illuminate\Support\Facades\Storage;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

// enum CsvTable: int
// {
//     case title = 1;
//     case header = 2;
// }

// enum CsvColumn: String
// {
//     case number            = "A";
//     case name              = "B";
//     case email             = "C";
//     case email_verified_at = "D";
//     case password          = "E";
// }

class UserController extends Controller
{

    public $file_name;
    public $path;

    public function __construct()
    {
        $this->middleware('ageCheck');
        $this->middleware('ageCheck')->only('testUserController');
        $this->middleware('ageCheck')->except('import');
    }

    public function import()
    {
        Excel::import(
            new UsersImport,
            storage_path('MOCK_DATA.csv')
        );

        return redirect('/')->with('success', 'Users Import Successfully!');
    }

    public function readFromCSV(){

        $users = [];

        if (($open = fopen(storage_path() . "/Products.xlsx", "r")) !== FALSE) {

            while (($data = fgetcsv($open, 1000, ",")) !== FALSE) {
                $users[] = $data;
            }

            fclose($open);
        }

        echo "<pre>";
        print_r($users);

    }

    public function readFromXlsx(Request $request)
    {
        $path_directory = storage_path()."/app/import_csv";
        $filee = $this->prepareFile($path_directory, '/import_csv/', $request->file('import_csv'));

        $spreadsheet = IOFactory::load(storage_path("app".$filee));
        $sheet = $spreadsheet->getActiveSheet();
        // Store data from the activeSheet to the varibale in the form of Array
        $data = array(1, $sheet->toArray(null, true, true, true));

        if (Storage::disk('local')->exists($filee)){
            // return data content from file
            $retrieve_file = Storage::get($filee);
        }

        $this->fileURL($this->path);
        // Store data from xlsx to DataBase
        foreach ($data[1] as $key => $value) {

            // if ($key != CsvTable::title->value && $key != CsvTable::header->value) {
            //     DB::beginTransaction();
            //     try {

            //         $user = User::create([
            //             'name' => $value[CsvColumn::name->value],
            //             'email' => $value[CsvColumn::email->value],
            //             'email_verified_at' => $value[CsvColumn::email_verified_at->value],
            //             'password' => $value[CsvColumn::password->value]
            //         ]);
            //         if ($user) {
            //             print($user);
            //             DB::commit();
            //             Storage::disk('local')->delete('/import_csv/' . $request->file('import_csv')->getClientOriginalName());
            //             // return redirect()->back();
            //         }
            //     } catch (\Throwable $th) {
            //         print($th);
            //         DB::rollBack();
            //         Storage::disk('local')->delete('/import_csv/' . $request->file('import_csv')->getClientOriginalName());
            //     }
            // }

        }

    }

    public function decodeBase64($base64)
    {
        //data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/
        $image = $base64;
        $imageInfo = explode(";base64,", $image);
        $imgExt = str_replace('data:image/', '', $imageInfo[0]);
        $image = str_replace(' ', '+', $imageInfo[1]);
        $imageName = "post-" . time() . "." . $imgExt;
        $file = storage_path('app')."/{$imageName}";
        Storage::disk('local')->put($imageName, base64_decode($image));
    }

    public function ajaxExcell(Request $request){
        $data = Excel::toArray(new stdClass(), $request->file('import_csv'));
        $input = $request->all();

        Log::info($input);
        return response()->json([
            'data'=> $data
        ]);


    }

    public function prepareFile($directory, $folder, $request_file){
        // check file exists
        if (!File::exists($directory)){
            File::makeDirectory($directory, $mode = 0777, true, true);
        }
        // add file
        $current_date = date("Y_m_d_h:i:sa");
        $client_original_filename= $request_file->getClientOriginalName();
        $path = $folder.$current_date."_".$client_original_filename;
        // storage/app/import_csv
        $content = file_get_contents($request_file);

        Storage::disk('local')->put($path, $content);

        return $path;
    }

    public function excellListPrepare($header, $content){

    }

    public function readFromExcell(Request $request){

        $data = Excel::toArray(new stdClass(), $request->file('import_csv'));
        dd($data);

    }

    public function downloadFile($path){

        $path_directory = storage_path().'/app'.$path;
        if (Storage::disk('local')->exists($path)){
            echo $path;
            echo $path_directory;
            return Storage::download($path_directory);
        }
    }

    public function fileURL($path){
        echo Storage::disk('local')->url($path);
    }


    public function javascriptObject()
    {
        return view('feature/javascriptObject');
    }

    public function jqueryDomTraversal()
    {
        return view('feature/jqueryDomTraversal');
    }

    public function phpArrayFunction()
    {
        $fruits = ["Banana", "Apple", "Orange", "Banana"];
        $fruits[] = "Peach";
        array_pop($fruits);
        array_unshift($fruits, 'Apple'); // add in the begining
        array_shift($fruits); // remove add the begining
        $string = "Banana,Apple,Peach";
        echo "Explode";dump(explode(",", $string));//split string into array
        echo "Implode";dump(implode("&", $fruits));//combin into string
        echo "In_Array";dump(in_array("Apple", $fruits));
        echo "Array_Search";dump(array_search("Apple", $fruits));

        $vegetable = ["Potato", "Cucumber"];
        echo "Array_Merge";dump(array_merge($fruits,$vegetable)); //OR
        // echo "Merage Array";dump([...$fruits, ...$vegetable]);

        $numbers = [1,2,3,4,5,6,7,8,9];
        // $even = array_filter($numbers, function($n){ //OR
        $even = array_filter($numbers, fn($n) => $n % 2 == 0);
        echo "Array_Filter"; dump($even);

        $squares = array_map(fn($n) => $n * $n, $numbers);
        echo "Array_Map"; dump($squares);

        $person = [
            'name' => "Brad",
            'surname' => 'Traversy',
            'age' => 30,
            'hobbies' => ['Tennis', 'Video Games']
        ];

        echo "Array_Key"; dump(array_keys($person));
        echo "Array_Value"; dump(array_values($person));
        echo "Array_Chunk"; dump(array_chunk($person, 2));
        $array_column = [
            [
              'id' => 5698,
              'first_name' => 'Peter',
              'last_name' => 'Griffin',
            ],
            [
              'id' => 4767,
              'first_name' => 'Ben',
              'last_name' => 'Smith',
            ],
            [
              'id' => 3809,
              'first_name' => 'Joe',
              'last_name' => 'Doe',
            ]
        ];
        echo "Array_Column"; dump(array_column($array_column,'first_name', 'id'));
        echo "Array_Count_Values"; dump(array_count_values($fruits));

        $a1=array("a"=>"red","b"=>"green","c"=>"blue","d"=>"yellow");
        $a2=array("e"=>"red","f"=>"green","g"=>"blue");
        $resulta1a2 = array_diff($a1, $a2);
        echo "Array_Diff"; dump($resulta1a2);

        #Continuous on => https://www.w3schools.com/php/func_array_diff_assoc.asp

        return view('feature/phpArrayFunction', compact("fruits"));
    }

    // Learn Eloquent

    public function insertUserRecord()
    {
        /* Mark: Insert 1 to 1 relationship table */
        $phone          = new Phone();
        $phone->phone   = "123456789";
        $user           = new User();
        $user->name     = "Jennifer";
        $user->email    = "Jennifer@gmail.com";
        $user->password = encrypt('secret');
        $user->save();
        $user->phone()->save($phone);

        // $user = User::create([
        //     "name" => "vannsann",
        //     "email" => "vannsann@gamil.com",
        //     "password" => encrypt('123456')
        // ]);

        /* Mark: Associate */
        $phone = new Phone();
        $phone->phone = "0967152222";
        $user = new User();
        $user->name     = "sannthu10oct1146";
        $user->email    = "sannthu10oct1146@gmail.com";
        $user->password = encrypt('secret');
        $user->save();
        $phone->user()->associate($user)->save();
        dump($phone);

        return "Record has been created successfully";

    }

    public function fetchPhoneByUser($id)
    {
        $phone = User::find($id)->phone;
        $phone = User::where('id',$id)->with('phone')->get()->toArray();
        dd($phone);

        //Mark: Dynamic Properties : https://laravel.com/docs/4.2/eloquent#dynamic-properties
        // $phone = Phone::find($id);
        // $phone->user;

        return $phone;
    }

    public function fetAllPhoneByUser($id)
    {
        $phones = User::find($id)->phones;
        return $phones;
    }

    public function insertUserImage($id)
    {
        //Mark: User
        $user = User::find($id);
        $user->image()->create([
            "url" => "image/vannsann.jpeg"
        ]);
        return User::find($id)->image()->get();
    }

    public function userInfo()
    {
        // $user = DB::table('users')
        // ->join('phones', 'users.id', '=' ,'phones.user_id')
        // ->join('role_users', 'users.id', '=' ,'role_users.user_id')
        // ->select('users.id', 'phones.phone', 'role_users.role_id')
        // ->get();

        // Advance Join
        // $user = DB::table('users')
        // ->join('phones', function($join) {
        //     $join->on('users.id', '=','phones.user_id')
        //     ->where('phones.user_id' , '=', 1084);
        // })
        // ->get(['users.id','users.name','users.email']);

        //Advance Wheres
        // \DB::enableQueryLog();
        // $user = DB::table('users')
        // ->where('name', 'John')
        // ->orWhere(function($query) {
        //     $query->where('email_verified_at', '<>', '@');
        // })->get();
        // dd(\DB::getQueryLog());

        // \DB::enableQueryLog();
        // $user = DB::table('users')
        // ->whereExists(function($query){
        //     $query->select(DB::raw(1))
        //     ->from('phones')
        //     ->whereRaw('phones.user_id = users.id');
        // })
        // ->get();
        // dd(\DB::getQueryLog());

        //
        return User::email()->Id(1)->get();

        // return $user;
    }

    public function insertingRelateMany($user_id)
    {
        /**NOTE:
         * * Attach method attach a certain entity record to other entity record in pivot table
         * * mean save record in intermediate table
         * * Example : the code below attach Model User => Role and create record in RoleUser model
        **/
        $user = User::find($user_id);
        $role = [1,2,3];
        $user->roles()->attach($role);
        //Mark: Or Assing pivot attribute  $user->roles()->attach($role, ['status' => 0]);
        //Mark: Or insert multiple record $user->roles()->attach([[1 => ""],2,3]);

        // !OR add and attach in single command.
        // $role = new Role(['name' => 'Editor']);
        // User::find(1)->roles()->save($role);
        return $user->roles;
    }

    public function detachRelateMany($user_id, $role_id)
    {
        /**NOTE:
         * *Detach method remove a certain entity relationship from the pivot table
         * * remove saved record in intermediate table
         * * Example : The code below detach User id and Role id from RoleUser (Pivote table)
        **/
        $user = User::find(100); //Mark: select * from `users` where `users`.`id` = ? limit 1
        // $user->roles()->detach(3);//Mark: delete from `role_users` where `role_users`.`user_id` = ?[user_id] and `role_users`.`role_id` in (?) [role_id]
        $user->roles()->detach([1,2,3]);//Mark: delete from `role_users` where `role_users`.`user_id` = ?[user_id] and `role_users`.`role_id` in (?) [role_id]
        //Mark: Remove all $user->roles()->detach();//Mark: delete from `role_users` where `role_users`.`user_id` = ?[user_id] and `role_users`.`role_id` in (?) [role_id]

    }

    public function synRelateMany()
    {
        /**NOTE:
         * * sync method is like intersection of attach and detach method.
         * * Basically what this method can be used to establish many to many association
         * * That is it will only keep the association which are passed to it as an array.
         * * Example: RoleUser Model will keep only record value passed in sync() method else will remove it
        **/
        $user = User::find(1);
        $user->roles()->sync([2,3]);
    }

    public function touchParentTimestamps()
    {
        $comment = Comment::find(1);
        $comment->body = "Edit to this comment!";
        $comment->save();
    }

    public function pivotetable()
    {
        /**NOTE:
         * * Many to many relationship requires the presence of an intermediate table(pivoteable)
         * * Example code below get attribute from pivotable or intermediate table ()
        **/

        $user = User::find(1);
        return $user->rolesWithAttribute;
        //Mark: Deletign Record User::find(1)->roles()->detach();
        //Mark: Updating User::find(1)->roles()->updateExistingPivot($roleId, $attributes);
    }

    public function ajax_remote_data()
    {
        return view("CRUD.select2");
    }

    public function filterUser(Request $request)
    {
        $str_name = $request->query->all()['query'];
        return User::where("name", "like", '%'.$str_name.'%')->get(['name']);
    }

    public function userChunk()
    {
        // return User::chunkById( 20, function ( $users ) {
        //     foreach ( $users as $user ) {
        //         echo $user->id.''.$user->name; echo "<br />";
        //     }
        // }, $column = 'id' );

        // User::chunk( 200, function ( $users ) {
        //     foreach( $users as $user ) {
        //         echo $user->id.''.$user->name; echo "<br />";
        //     }
        // } );

        // foreach( User::lazyById( 200, $column = "id" ) as $user ) {
        //     echo $user->id.' => '.$user->name; echo "<br />";
        // }

        // return User::firstWhere('isAdmin', 1);

        // return User::findOr( 0, fn() => "Not Found" );
        // return User::findOrFail(0);
        return User::findOr( 0, ['name', 'isAdmin'], fn() => abort(404) );
    }

    public function collectionReject()
    {
        $user = User::all();
        // Check if a give model instance is contained by the collection.
        // return $user->contains(User::find(1));

        // diff method returns all of the models that are not present in the given collection.
        // return $user->diff(User::whereIn('id', [1,2,3])->get());

        // returns all of the models that do not have the given primary keys.
        // return $user->except([1,2,3]);

        // return all of the models that are also present in the given collection
        // return $user->intersect(User::whereIn('id', [1, 2, 3])->get());

        // return $user->load(['roles', 'posts', 'posts.comments']);
        // return $user->load(['roles', 'posts' => fn ( $query ) => $query->where('user_id', 4)]);

        // return $user->only([1,2,3]);

        // return $user->reject( function ($user) {
        //     return $user->isAdmin === 0;
        // })->map( function ($user) {
        //     return $user->name;
        // });

        // return array_map( function ($user) {
        //     if ($user['id'] > 10) return  $user['id'].' => '.$user['name'];
        // }, $user->toArray());

        //Mark: Create collection
        // $collection = collect([1, 2, 3, 4, 5, 6, 7]);
        // return $collection->chunk(4)->all();

        // return $collection->all();
        // $collection_str = collect(str_split('AABBCCCD'));
        // $fn1 = fn($value, $key, $chunk) => $value == $chunk->last();
        // return $collection_str->chunkWhile($fn1);

        $collection = collect([
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        ]);
        return $collection->collapse()->all();
    }

    public function tooltiptest()
    {
        return view('feature/tooltiptest');
    }

    public function testUser(){
        #shirt+option+a comment multiple lines

        /* $user = User::chunk(200, function ($users){
            foreach ($users as $user){
                echo $user->id.' '.$user->name; echo "<br />";
            }
        });
        print($user); */

        /* $user = User::chunkById( 20, function ( $users ) {
            foreach ( $users as $user ) {
                echo $user->id.''.$user->name; echo "<br />";
            }
         }, $column = 'id' );
        print($user); */
    }

    public function testUserController(Request $request){
        return "$request->id, $request->name";
    }

    public function testWidget(Request $request) {
        
        return view("user.index");
    }

    public function index(MonthlyUsersChart $chart)
    {
        return view('user.index', ['chart' => $chart->build()]);
    }
}
