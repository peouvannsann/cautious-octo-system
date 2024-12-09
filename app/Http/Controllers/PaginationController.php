<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class PaginationController extends Controller
{
    public function allUsers()
    {
        $users = User::paginate(10);
        return view('homePage.users', compact('users'));
    }
}
