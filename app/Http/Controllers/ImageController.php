<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;


class ImageController extends Controller
{
    public function resizeImage()
    {
        return view("CRUD.resize_image");
    }

    public function resizeImageSubmit(Request $request)
    {
        $image = $request->file;
        $filename = $image->getClientOriginalName();
        $image_resize = Image::make($image->getRealPath());
        $image_resize->resize(300,300);
        $image_resize->save(public_path('images/'.$filename));
        return "Image has been resized successfully!";

    }
}
