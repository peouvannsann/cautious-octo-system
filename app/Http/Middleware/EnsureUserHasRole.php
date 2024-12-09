<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class EnsureUserHasRole
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next, $role)
    {
        // dd($request->user());
        if (is_null($request->user())){
            return redirect('noaccess');
        }
        // \DB::enableQueryLog();
        $users = User::where("id", $request->user()->id)
        ->with(['roles' => function($query) use ($role) {
            $query->where("role_id", $role);
        }])->get()->toArray();
        // dd(\DB::getQueryLog());
        // dd($users);


        // dd(empty($users[0]['roles']));
        if (!empty($users[0]['roles'])){
            if ($users[0]['roles'][0]['id'] != $role) {
                return redirect('noaccess');
            }
        }else{
            return redirect('noaccess');
        }
        $id   = $users[0]['id'];
        $name = $users[0]['roles'][0]['name'];

        echo "<h1> Role name's {$name}</h1>";
        return $next($request);
    }
}
