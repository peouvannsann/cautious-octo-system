<?php

namespace Database\Factories;

use App\Models\OrderDetail;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class OrderDetailFactory extends Factory
{
    protected $model = OrderDetail::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            "name" => fake()->name(),
            "sku" => fake()->ean13,
            "quantity" => fake()->numberBetween($min = 1, $max = 100),
            "detail" => fake()->text(),
        ];
    }

}
