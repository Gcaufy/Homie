<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TemparatureHumidity extends Model
{
    protected $table = 'tbl_temparature_humidity';

    public $timestamps = false;

    protected $fillable = ['temp', 'hum', 'time'];
}
