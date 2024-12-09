<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class dummyAPI extends Controller
{
    public function index(){
        // dd("hello world");
        return ["name"=> "vannsann"];
    }
}
