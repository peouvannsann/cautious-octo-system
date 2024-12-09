<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class FeatureController extends Controller
{
    public function downloadFileuploadFile()
    {
        // dd("here");
        return view("feature.uploadFile");
    }
}
