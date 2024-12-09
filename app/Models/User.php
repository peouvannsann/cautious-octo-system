<?php

namespace App\Models;


use Ramsey\Uuid\Uuid;
use App\Enums\RoleEnum;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
    // HasRoles;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    // protected $fillable = [
    //     'name',
    //     'email',
    //     'password',
    // ];

    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = [];

    protected $casts = [
        'enum_role' => RoleEnum::class,
    ];

    protected $appends = ['post'];
    // https://stackoverflow.com/questions/35701538/how-to-always-append-attributes-to-laravel-eloquent-model

    public function phone()
    {
        return $this->hasOne(Phone::class, 'user_id', 'id');
    }

    public function phones()
    {
        return $this->hasMany(Phone::class, 'user_id', 'id');
    }
    public function selectedPhones()
    {
        return $this->hasMany(Phone::class, 'user_id', 'id')->select(['id','phone', 'user_id']);
        // return $this->hasMany(Phone::class, 'user_id', 'id')->distinct();
    }
    public function activatePhone($activate_id)
    {
        return $this->hasMany(Phone::class, 'user_id', 'id')->where("activate", $activate_id);
    }

    /**
     * The roles that belong to the User
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function roles()
    {
        /**NOTE:
         * *users relate to role_users via users.id = role_users.user_id
         * !role_users(intermediate model)  relate to roles via role_users.role_id = role.id
         * ! 1 users have many role <=> role belongsToMany user
         * *the first arguemnt is where you wish to access
         * *in the code below I want to access Role via role_users
        **/
        return $this->belongsToMany(Role::class, 'role_users', 'user_id', 'role_id')->withPivot("created_at", "id", "status");
    }
    public function selectedRoles()
    {
        return $this->belongsToMany(Role::class, 'role_users', 'user_id', 'role_id')->select("user_id", "name")->withPivot("created_at", "id", "status");
    }

    public function rolesWithAttribute()
    {
        return $this->belongsToMany(Role::class, 'role_users', 'user_id', 'role_id')->withPivot('status',"created_at");
    }

    public function posts()
    {
        return $this->hasMany(Post::class, 'user_id', 'id');

    }

    public function selectedPosts()
    {
        return $this->hasMany(Post::class, 'user_id', 'id')->select(['id', 'title', 'body', 'user_id']);

    }

    public function scopeEmail($query)
    {
        return $query->where('email','like', '%'."jennie".'%');
    }
    public function scopeId($query, $type)
    {
        return $query->where('id',$type);
    }
    public function image()
    {
        /**NOTE:
         * *imageable belong to user id
         * 1 user 1 image
         * Ex: when insert imageable => post_id
        **/
        return $this->morphOne(Image::class,"imageable");
    }

    public function hasRole($role)
    {
        return Role::where("role", $role)->get();
    }

    /**
     * Generate a new UUID for the model.
     */
    
    public static function boot()
    {
        parent::boot();
        self::creating(function ($model){
            $model->uuid = (string) Uuid::uuid4();
        });
    }

    public function permission_roles()
    {
        return $this->belongsToMany(Role::class);
    }

    public function permissions()
    {
        return $this->belongsToMany(Permission::class);
    }

    public function plans()
    {
        return $this->hasMany(PlanedVistsPlace::class, 'user_id', 'id');
    }

    public function resolvePost($root, array $args)
    {
        return $root->post; // Or your logic to fetch the post
    }

    public function getPostAttribute()
    {
        // Your logic here
        return $this->posts();
    }

}