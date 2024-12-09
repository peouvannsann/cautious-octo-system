<?php

namespace App\Models;

use App\Casts\AsArrayObject;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class VisitedPlace extends Model
{
    use HasFactory;

    protected $table = "visited_places";

    protected $casts = [
        'categories'  => 'array',
        'show_on_map' => 'array',
        'images'      => 'json',
    ];

    public function planVisitPlace()
    {
        return $this->belongsToMany(PlanedVistsPlace::class, 'planed_vists_place_details', 'plan_visit_place_id', 'visit_place_id');
    }

}
