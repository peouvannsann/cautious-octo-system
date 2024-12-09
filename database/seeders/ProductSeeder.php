<?php

namespace Database\Seeders;

use App\Models\Product;
use Illuminate\Support\Facades\File;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
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
        
        $jsonData = File::get(resource_path("mock_json/product.json"));
        $jsonData = json_decode($jsonData, true);

        foreach ($jsonData as $product) {

            Product::create([
                "name"            => $product['name'],
                "sku"             => $product['sku'],
                "quantity"        => $product['quantity'],
                "detail"          => $product['detail'],
                "price"           => $product['price'],
                "brand_id"        => $product['brand_id'],
                "sub_category_id" => $product['sub_category_id'],
                "description"     => $product['description'],
                "image"           => $product['image'],
                "size"            => json_encode($product['size']),
            ]);
        }
    }
}
