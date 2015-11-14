<?php namespace App\Http\Controllers;

use App\Models\TemparatureHumidity;
use Illuminate\Http\Request;

class FrontendController extends Controller
{
    public function camera()
    {
        return view('camera');
    }

    public function temparature()
    {
        $models = TemparatureHumidity::orderBy('time', 'desc')->limit(12)->get();

        return view('temparature', [
            'models' => $models,
        ]);
    }

    public function humidity()
    {
        $models = TemparatureHumidity::orderBy('time', 'desc')->limit(12)->get();

        return view('humidity', [
            'models' => $models,
        ]);
    }
}
