<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDSgpisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('d_sgpis', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('stud_id')->unsigned();
            $table->foreign('stud_id')->references('id')->on('students');
            $table->double('Sem_1');
            $table->double('Sem_2');
            $table->double('Sem_3');
            $table->double('Sem_4');
            $table->double('Sem_5');
            $table->double('Sem_6');
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
        Schema::dropIfExists('d_sgpis');
    }
}
