<?php namespace App\Http\Controllers;

use App\Models\Infrared;
use Illuminate\Http\Request;

class InfraredController extends Controller
{
    public function createInfrared(Request $request)
    {
        $model = Infrared::create($request->all());

        return response()->json($model);
    }

    public function getLatest()
    {
        $model = Infrared::orderBy('time', 'desc')->first();

        return response()->json($model);
    }
}
