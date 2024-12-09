<?php

namespace Database\Seeders;

use App\Models\PlanedVistsPlaceDetail;
use Illuminate\Support\Facades\File;
use Illuminate\Database\Seeder;

class PlanedVisitPlaceDetailSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        
        $jsonData = File::get(resource_path("mock_json/planed_visit_places_detail.json"));
        $jsonData = json_decode($jsonData, true);

        foreach ($jsonData as $planed_visit_places_detail) {

            PlanedVistsPlaceDetail::create([
                "day"      => $planed_visit_places_detail['day'],
                "visit_place_id"      => $planed_visit_places_detail['visit_place_id'],
                "plan_visit_place_id" => $planed_visit_places_detail['plan_visit_place_id'],
            ]);
        }
    }
}
