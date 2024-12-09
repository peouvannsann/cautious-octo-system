<?php

namespace App\Models;

use App\Models\ProductC;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Car extends Model
{
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'cars';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = true;

    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = [];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = ['id'];

    /**
     * The attributes that should be visible in arrays.
     *
     * @var array
     */
    protected $visible = ['name',"founded", "description"];

    public function carmodels()
    {
        return $this->hasMany(CarModel::class);
    }

    public function headquarter()
    {
        /**NOTE: 
        * withDefault will return default value instead of null
        */
        return $this->hasOne(Headquarter::class)->withDefault(function ($headquarter) {
            $headquarter->headquarters = "default";
        });
    }

    public function engines()
    {
        /**NOTE: 
         * *cars relate to car_models via cars.id = car_models.car_id 
         * !car_models(intermediate model)  relate to engines via car_models.id = car_production_date.model_id
         * ! 1 car_models have many engines <=> engines belongsTo car_models
         * *the first arguemnt is where you wish to access
         * *in the code below I want to access Engine via CarModel
        **/
        return $this->hasManyThrough(
            Engine::class,
            CarModel::class,
            'car_id', //Mark: Foregin key on CarModel table
            'model_id' //Mark: Foreign key on Engine table
        );
    }
    public function productionDate()
    {
        /**NOTE: 
         * *cars relate to car_models via cars.id = car_models.car_id 
         * !car_models relate to car_production_date via car_models.id = car_production_date.model_id
         * *the first arguemnt is where you wish to access
         * *in the code below I want to access CarProductionDate via CarModel
         * 
        **/
        
        return $this->hasOneThrough(
            CarProductionDate::class,
            CarModel::class,
            'car_id',
            'model_id'
        );
    }

    public function productCar()
    {
        return $this->belongsToMany(ProductCar::class, 'car_product');
    }
    

}
