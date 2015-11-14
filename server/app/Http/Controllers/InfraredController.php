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
        $time = empty($time) ? '0' : $time;
        $data = ['changed' => '0', 'time' => $time];

        $model = Infrared::where('time', '>', $time)->orderBy('time', 'desc')->first();
        if ($model !== null) {
            $data['changed'] = '1';
            $data['time'] = $model->time;
        }

        return response()->json($data);
    }
}
