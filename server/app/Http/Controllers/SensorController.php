<?php namespace App\Http\Controllers;

use App\Models\Sensor;
use Illuminate\Http\Request;

class SensorController extends Controller
{
    public function createSensor(Request $request)
    {
        $model = Sensor::create($request->all());

        return response()->json($model);
    }
}
