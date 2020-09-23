<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLorExtrasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lor_extras', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('stud_id')->unsigned();
            $table->foreign('stud_id')->references('id')->on('students');
            $table->string('title');
            $table->string('extra_curricular_activity')->nullable();
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
        Schema::dropIfExists('lor_extras');
    }
}
