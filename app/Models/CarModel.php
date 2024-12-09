<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CarModel extends Model
{
    use HasFactory;

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'car_models';

    /**NOTE: 
    * A car model belong to a car
    */
    public function car()
    {
        return $this->belongsTo(Car::class);
    }    
}
