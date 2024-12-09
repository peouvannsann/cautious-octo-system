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
        Schema::create('planed_vists_place_details', function (Blueprint $table) {
            $table->id();
            $table->integer('day');
            $table->foreignId('plan_visit_place_id')->constrained('planed_visit_places')->onDelete('cascade');
            $table->foreignId('visit_place_id')->constrained('visited_places')->onDelete('cascade');
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
        Schema::dropIfExists('planed_vists_place_details');
    }
};
