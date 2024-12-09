<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('car_product', function (Blueprint $table) {
            $table->integer('car_id')->unsigned();
            $table->integer('product_car_id')->unsigned();
            $table->foreign('car_id')->references("id")->on('cars')->onDelete("cascade");
            $table->foreign('product_car_id')->references("id")->on('product_car')->onDelete("cascade");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('car_products');
    }
};
