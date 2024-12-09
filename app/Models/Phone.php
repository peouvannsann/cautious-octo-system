<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Phone extends Model
{
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'phones';

    public function phone()
    {
        return $this->belongsTo(User::class, 'id',"user_id");
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
