<?php

namespace App\Http\Controllers;

use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;

class RoleController extends Controller
{
    public function addRole()
    {
        $roles = [
            ["name" => "Administrator"],
            ["name" => "Editor"],
            ["name" => "Author"],
            ["name" => "Contributor"],
            ["name" => "Subscribers"]
        ];

        Role::insert($roles);
        return "Roles are created successfully";
    }

    public function addUserRole()
    {
        $user = new User();
        $user->name = "john";
        $user->email = "johnoct1145@gmail.com";
        $user->password = encrypt('secret');
        $user->save();

        $roleids = [2,4];
        $user->roles()->attach($roleids);
        return "Record has been created successfully!";
    }

    public function addUserRoleByID($user_id){
        // $is_user = User::findOrFail($user_id);
        // $is_user = User::findOrFail($user_id);
        
        $is_user = User::findOrFail(493);
        $is_user->roles()->sync([2,4]);
        dump($is_user->roles->toArray());
        // $is_role = Role::find(3);
        // dump($is_role->users->toArray());
        
    }

    public function getAllRolesByUser($id)
    {
        $user = User::find($id);
        $roles = $user->roles;
        return $roles;
    }

    public function getAllUserByRole($id)
    {
        $role = Role::find($id);
        $users = $role->users;
        return $users;
    }
}
