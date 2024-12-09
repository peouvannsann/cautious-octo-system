<?php

namespace App\Models;

use App\Models\VisitedPlace;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class PlanedVistsPlaceDetail extends Model
{
    use HasFactory;

    protected $table = 'planed_vists_place_details';

    public function visitePlace()
    {
        return $this->hasOne(VisitedPlace::class, 'id', 'visit_place_id');
    }
}
