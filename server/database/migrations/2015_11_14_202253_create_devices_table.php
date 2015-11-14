<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDevicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_devices', function (Blueprint $table) {
            $table->increments('id');
            $table->string('dev_key');
            $table->string('name');
            $table->string('desc');
            $table->string('pin');
            $table->string('status');
        });

        DB::table('tbl_devices')->insert([
            [
                'dev_key' => 'gSkx2IVxmcb1vrRdxLzFNla8',
                'name'    => 'DinningRoom-Light',
                'desc'    => 'DinningRoom-Light',
                'pin'     => '10',
                'status'  => '0',
            ],
            [
                'dev_key' => 'IaNHSxlHOCQi8j4Yn9jVp0Id',
                'name'    => 'BedRoom-Light',
                'desc'    => 'BedRoom-Light',
                'pin'     => '9',
                'status'  => '0',
            ],
            [
                'dev_key' => 'hoArgJtbDZhobWLExqO2OLcY',
                'name'    => 'KitchenRoom-Light',
                'desc'    => 'KitchenRoom-Light',
                'pin'     => '11',
                'status'  => '0',
            ],
            [
                'dev_key' => 'XB5d5fZehHbSfPwtg55YxiBb',
                'name'    => 'BathRoom-Light',
                'desc'    => 'BathRoom-Light',
                'pin'     => '0',
                'status'  => '0',
            ],
            [
                'dev_key' => 'yDSyUtmkeyaCaxnRoeNsJp6l',
                'name'    => 'DinningRoom-Fan',
                'desc'    => 'DinningRoom-Fan',
                'pin'     => '18',
                'status'  => '0',
            ],
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('tbl_devices');
    }
}
