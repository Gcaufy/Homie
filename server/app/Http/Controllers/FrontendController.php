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
        $models = $models->toArray();
        usort($models, [$this, 'compareTimeOfModels']);

        return view('temparature', [
            'models' => $models,
        ]);
    }

    public function humidity()
    {
        $models = TemparatureHumidity::orderBy('time', 'desc')->limit(12)->get();
        $models = $models->toArray();
        usort($models, [$this, 'compareTimeOfModels']);

        return view('humidity', [
            'models' => $models,
        ]);
    }

    public function compareTimeOfModels($a, $b)
    {
        if ($a['time'] < $b['time']) {
            return -1;
        } elseif ($a['time'] > $b['time']) {
            return 1;
        }
        return 0;
    }
}
