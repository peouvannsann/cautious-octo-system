<?php

namespace Database\Seeders;

use App\Models\PlanedVistsPlace;
use Illuminate\Support\Facades\File;
use Illuminate\Database\Seeder;

class PlanedVisitPlaceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Product::factory()->count(20)->create();
        // collect($products_list)->each(function($product){
        //     dump($product);
        // });
        
        $jsonData = File::get(resource_path("mock_json/planed_visit_places.json"));
        $jsonData = json_decode($jsonData, true);

        foreach ($jsonData as $placed_visit_place) {

            PlanedVistsPlace::create([
                "title"          => $placed_visit_place['title'],
                "start_date"     => $placed_visit_place['start_date'],
                "end_date"       => $placed_visit_place['end_date'],
                "user_id"        => $placed_visit_place['user_id'],
            ]);
        }
    }
}
