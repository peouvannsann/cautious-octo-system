<?php

namespace Database\Seeders;

use App\Models\SubCategory;
use Illuminate\Support\Facades\File;
use Illuminate\Database\Seeder;

class SubCategorySeeder extends Seeder
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
        
        $jsonData = File::get(resource_path("mock_json/sub_categroy.json"));
        $jsonData = json_decode($jsonData, true);

        foreach ($jsonData as $sub_category) {

            SubCategory::create([
                "name"        => $sub_category['name'],
                "category_id" => $sub_category['category_id'],
            ]);
        }
    }
}
