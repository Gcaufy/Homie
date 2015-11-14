<?php namespace App\Http\Controllers;

use App\Models\Device;
use Illuminate\Http\Request;

class DeviceController extends Controller
{
    public function getDevice($dev_key)
    {
        $model = Device::where('dev_key', '=', $dev_key)->first();

        return response()->json($model);
    }

    public function updateDevice(Request $request, $dev_key)
    {
        $model = Device::where('dev_key', '=', $dev_key)->first();
        $status = $request->input('status');
        if ($status !== null) {
            $model->status = $request->input('status');
            $model->save();
        }
        return response()->json($model);
    }
}
