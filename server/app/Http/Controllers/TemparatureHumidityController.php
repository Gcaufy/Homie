<?php namespace App\Http\Controllers;

use App\Models\TemparatureHumidity;
use Illuminate\Http\Request;

class TemparatureHumidityController extends Controller
{
    public function createTemparatureHumidity(Request $request)
    {
        $model = TemparatureHumidity::create($request->all());

        return response()->json($model);
    }

    public function getLatest($time)
    {
        $model = TemparatureHumidity::where('time', '>', $time)->orderBy('time', 'desc')->first();

        return response()->json($model);
    }
}
