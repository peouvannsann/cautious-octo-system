<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;


class VisitedPlaceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $country_list = [
            "siemReap.json", "kampot.json"
        ];
        $all_countries = [];
        foreach ($country_list as $key => $value) {
            $jsonData = File::get(resource_path("country_json/".$value));
            $jsonData = json_decode($jsonData, true);

            foreach ($jsonData as $country) {

                DB::table('vistited_places')->insert([
                    "name"                => $country['name'],
                    "country"             => $country['country'],
                    "location"            => $country['location'],
                    "rate_star"           => $country['rate_star'],
                    "grade"               => floatval($country['grade']),
                    "evaluation"          => $country['evaluation'],
                    "reviewer_population" => $country['reviewer_population'],
                    "btn_show_price"      => $country['btn_show_price'],
                    "categories"          => json_encode($country['categories']),
                    // "categories"          => $country['categories'],
                    "openingTime"         => $country['openingTime'],
                    "closingTime"         => $country['closingTime'],
                    "description"         => $country['description'],
                    "googleMapsLink"      => $country['googleMapsLink'],
                    "show_on_map"         => json_encode($country['show_on_map']),
                    "images"              => json_encode($country['images']),
                ]);
            }
        }
        
    }
}
