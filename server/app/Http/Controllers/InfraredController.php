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
        $data = ['changed' => '0', 'time' => '0'];
        if (!empty($time)) {
            $model = Infrared::where('time', '>', $time)->orderBy('time', 'desc')->first();
            if ($model !== null) {
                $data['changed'] = '1';
                $data['time'] = $model->time;
            } else {
                $data['time'] = $time;
            }
        }
        return response()->json($data);
    }
}
