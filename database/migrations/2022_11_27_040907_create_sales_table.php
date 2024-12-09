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
        Schema::create('sales', function (Blueprint $table) {
            $table->id();
            $table->string('Region')->nullable();
            $table->string('Country')->nullable();
            $table->string('Item Type')->nullable();
            $table->string('Sales Channel')->nullable();
            $table->string('Order Priority')->nullable();
            $table->string('Order Date')->nullable();
            $table->string('Order ID')->nullable();
            $table->string('Ship Date')->nullable();
            $table->string('Units Sold')->nullable();
            $table->string('Unit Price')->nullable();
            $table->string('Unit Cost')->nullable();
            $table->string('Total Revenue')->nullable();
            $table->string('Total Cost')->nullable();
            $table->string('Total Profit')->nullable();
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
        Schema::dropIfExists('sales');
    }
};
