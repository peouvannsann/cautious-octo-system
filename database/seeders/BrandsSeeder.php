<?php

namespace Database\Seeders;

use App\Models\Brand;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\File;


class BrandsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {   
        $jsonData = File::get(resource_path("mock_json/brand.json"));
        $jsonData = json_decode($jsonData, true);

        foreach ($jsonData as $brand) {

            Brand::create([
                "name"        => $brand['name'],
                "category_id" => $brand['category_id'],
                "vat" => $brand['vat'],
                "image" => $brand['image'],
            ]);
        }
        
    }
}
