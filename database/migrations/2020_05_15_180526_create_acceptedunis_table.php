<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAcceptedunisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('acceptedunis', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('req_id')->unsigned();
            $table->foreign('req_id')->references('id')->on('lor_requests');
            $table->string('course');
            $table->string('university');
            $table->boolean('chose');
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
        Schema::dropIfExists('acceptedunis');
    }
}
