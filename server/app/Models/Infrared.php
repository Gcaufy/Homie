<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Infrared extends Model
{
    protected $table = 'tbl_infrared';

    public $timestamps = false;

    protected $fillable = ['time'];
}
