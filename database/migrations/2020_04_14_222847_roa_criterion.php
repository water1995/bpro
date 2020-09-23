<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RoaCriterion extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('roa_criterion', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('req_id')->unsigned();
            $table->foreign('req_id')->references('id')->on('lor_requests');
            $table->string('Intellectual_Level');
            $table->string('Written_Communication');
            $table->string('Oral_Communication');
            $table->string('Imagination_Creativity')->nullable();
            $table->string('Work_Ethic');
            $table->string('Character');
            $table->string('Class_Rank');
            $table->string('Teaching_Ability');
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
        //
    }
}
