<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    public function register(Request $request)
    {
        // dump($request->all());
        $validateData = $request->validate([
            'email' => 'required|email',
            'password' => 'required|min:6|max:12'
        ]);

        User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ]);

        return back()->with('success', 'User has been created successfully');
    }
}
