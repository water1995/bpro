<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLorUniversitiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lor_universities', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('stud_id')->unsigned();
            $table->foreign('stud_id')->references('id')->on('students');
            $table->bigInteger('req_id')->unsigned();
            $table->foreign('req_id')->references('id')->on('lor_requests');
            $table->string('course');
            $table->string('university');
            $table->string('dept');
            $table->date('deadline');
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
        Schema::dropIfExists('lor_universities');
    }
}
