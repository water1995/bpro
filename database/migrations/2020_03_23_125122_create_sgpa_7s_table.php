<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSgpa7sTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sgpa_7s', function (Blueprint $table) {
            $table->bigIncrements('id')->unsigned();
            $table->bigInteger('stud_id')->unsigned();
            $table->foreign('stud_id')->references('id')->on('students');
            $table->double('Sem_1');
            $table->double('Sem_2');
            $table->double('Sem_3');
            $table->double('Sem_4');
            $table->double('Sem_5');
            $table->double('Sem_6');
            $table->double('Sem_7');
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
        Schema::dropIfExists('sgpa_7s');
    }
}
