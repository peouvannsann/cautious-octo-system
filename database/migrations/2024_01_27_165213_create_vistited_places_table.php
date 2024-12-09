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
        Schema::create('visited_places', function (Blueprint $table) {
            $table->id();
            $table->string("name");
            $table->string("country");
            $table->string("location");
            $table->string("rate_star");
            $table->decimal("grade", 4,2);
            $table->string("evaluation");
            $table->string("reviewer_population")->nullable();
            $table->string("btn_show_price");
            $table->json("categories")->nullable();
            $table->string("openingTime");
            $table->string("closingTime");
            $table->string("description");
            $table->string("googleMapsLink");
            $table->json("show_on_map")->nullable();
            $table->json("images")->nullable();
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
        Schema::dropIfExists('visited_places');
    }
};
