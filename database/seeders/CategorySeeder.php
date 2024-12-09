<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;


class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {   
        $jsonData = File::get(resource_path("mock_json/categories.json"));
        $jsonData = json_decode($jsonData, true);

        foreach ($jsonData as $category) {

            Category::create([
                "name" => $category['name']
            ]);
        }
        
    }
}
