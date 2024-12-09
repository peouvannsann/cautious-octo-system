<?php

namespace Database\Factories;

use App\Models\VisitedPlace;
use Illuminate\Support\Facades\File;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\VisitedPlace>
 */
class VisitedPlaceFactory extends Factory
{
    protected $model = VisitedPlace::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        $country_list = [

        ];
        $all_countries = [];
        foreach ($country_list as $key => $value) {
            $jsonData = File::get();
            $jsonData = json_decode($jsonData, true);
            $all_countries[] = $jsonData;
        }

        return [
            "name"                => "",
            "country"             => "",
            "location"            => "",
            "rate_star"           => "",
            "grade"               => "",
            "evaluation"          => "",
            "reviewer_population" => "",
            "btn_show_price"      => "",
            "categories"          => "",
            "openingTime"         => "",
            "closingTime"         => "",
            "description"         => "",
            "googleMapsLink"      => "",
            "show_on_map"         => "",
            "images"              => "",
        ];
    }
}
