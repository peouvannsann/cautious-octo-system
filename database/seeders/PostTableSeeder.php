<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class PostTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        $faker = Faker::create();
        foreach (range(1, 100) as $index) {
            DB::table('order_details')->insert([
                'order_id' => $faker->numberBetween(1,4),
                'product_id' => $faker->numberBetween(1,9),
                'unit_price' => $faker->randomDigit,
                'quantity' => $faker->numberBetween(1,5)
            ]);
        }
        // foreach (range(1, 100) as $index) {
        //     DB::table('orders')->insert([
        //         'customer_id' => $faker->numberBetween(1,4),
        //         'role_id' => $faker->numberBetween(1,5),
        //         'promotion_id' => $faker->numberBetween(1,3),
        //     ]);
        // }
        // $faker = Faker::create();
        // foreach (range(1, 1000) as $index) {
        //     DB::table('users')->insert([
        //         'name' => $faker->name,
        //         'email' => $faker->email,
        //         'password' => bcrypt('secret'),
        //     ]);
        // }

        // $faker = Faker::create();
        // foreach (range(1,100) as $value) {

        //     DB::table('table_posts')->insert([
        //         'title' => $faker->sentence(),
        //         'body' => $faker->paragraph(),
        //         'user_id' => 22
        //     ]);
        // }

    }
}
