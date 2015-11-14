<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTemparatureAndHumidityTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_temparature_humidity', function (Blueprint $table) {
            $table->increments('id');
            $table->string('temp');
            $table->string('hum');
            $table->string('time');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('tbl_temparature_humidity');
    }
}
