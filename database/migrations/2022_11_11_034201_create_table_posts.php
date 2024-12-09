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
        Schema::create('posts', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title');
            $table->text('body');
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->integer('approved')->nullable()->default(0);
            $table->integer('active')->nullable()->default(0);
            $table->timestamps();
            // $table->timestamp('created_at')->useCurrent();
            // $table->timestamp('updated_at')->nullable()->useCurrentOnUpdate();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('table_posts');
    }
};
