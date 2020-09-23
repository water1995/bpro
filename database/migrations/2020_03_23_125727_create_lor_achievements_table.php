<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLorAchievementsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lor_achievements', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('stud_id')->unsigned();
            $table->foreign('stud_id')->references('id')->on('students');
            $table->string('title');
            $table->string('achievement')->nullable();
            $table->string('file_name');
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
        Schema::dropIfExists('lor_achievements');
    }
}
