<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sensor extends Model
{
    protected $table = 'tbl_sensor';

    protected $fillable = ['temp', 'hum', 'time'];
}
