<?php

namespace App\Http\Controllers;

use Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;

class LoginController extends Controller
{
    public function login(Request $request)
    {

        $credentials = $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required']
        ]);

        // if (Auth::attempt($request->only('email', 'password'))){
        if (Auth::attempt($credentials)){
            // return redirect()->route('home');
            $request->session()->regenerate();
            return redirect()->intended('home');
            // return Redirect::intended('home');
        }

        // return back()->with('error', 'Your credentials are incorrect');
        return back()->withErrors([
            'email' => 'The provided credentials do not match our records',
        ])->onlyInput('email');
    }

    public function logout(Request $request)
    {
        return redirect()->route('login');
    }
}
