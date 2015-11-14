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
}
