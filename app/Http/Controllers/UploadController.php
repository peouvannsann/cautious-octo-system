<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UploadController extends Controller
{
    public function uploadForm()
    {
        return view('homePage.upload');
    }

    public function uploadFile(Request $request)
    {
        $request->file->store('public');
        return "File has been uploaded successfully";
    }

    public function uploadFileTest()
    {
        return view("feature.uploadFile");
    }
}
