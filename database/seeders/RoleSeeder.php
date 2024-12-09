<?php

namespace Database\Seeders;


use App\Models\Permission;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $role_admin_list = ['guard_name' => 'api', 'name' => 'admin'];
        $role_user_list = ['guard_name' => 'api', 'name' => 'user'];
        $adminRole = Role::create($role_admin_list);
        $userRole = Role::create($role_user_list);

        $permission_view   = Permission::create(['guard_name' => 'api','name' => 'view users']);
        $permission_create = Permission::create(['guard_name' => 'api','name' => 'create users']);
        $permission_edit   = Permission::create(['guard_name' => 'api','name' => 'edit users']);
        $permission_delete = Permission::create(['guard_name' => 'api','name' => 'delete users']);

        $adminRole->givePermissionTo($permission_view,$permission_create,$permission_edit,$permission_delete);
        $userRole->givePermissionTo($permission_view,$permission_create,$permission_edit);
        
    }
}
