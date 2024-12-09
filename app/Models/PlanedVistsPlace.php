<?php

namespace App\Models;

use App\Models\VisitedPlace;
use App\Models\PlanedVistsPlaceDetail;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class PlanedVistsPlace extends Model
{
    use HasFactory;

    protected $table = 'planed_visit_places';

    public function details()
    {
        return $this->hasMany(PlanedVistsPlaceDetail::class, 'plan_visit_place_id', 'id');
        // return $this->belongsToMany(VisitedPlace::class, 'planed_vists_place_details', 'plan_visit_place_id', 'visit_place_id');
    }
    public function adddDetails()
    {
        return $this->belongsToMany(VisitedPlace::class, 'planed_vists_place_details', 'plan_visit_place_id', 'visit_place_id');
    }

    

}
