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

    public function getLatest($time)
    {
        if (empty($time)) {
            $changed = false;
        } else {
            $changed = Infrared::where('time', '>', $time)->exists();
        }

        return response()->json([
            'changed' => $changed ? '1' : '0',
            'time' => time(),
        ]);
    }
}
