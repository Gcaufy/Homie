<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$app->get('/', function () use ($app) {
    return $app->welcome();
});

$app->get('/test', 'TestController@test');
$app->post('/test', 'TestController@test');

$app->group(['prefix' => 'api/v1', 'namespace' => 'App\Http\Controllers'], function ($app) {
    $app->post('temp_hum', 'TemparatureHumidityController@createTemparatureHumidity');
    $app->get('temp_hum/latest/{time}', 'TemparatureHumidityController@getLatest');

    $app->post('infrared', 'InfraredController@createInfrared');
    $app->get('infrared/latest/{time}', 'InfraredController@getLatest');

    $app->get('devices', 'DeviceController@getAllDevices');
    $app->get('device/{dev_key}', 'DeviceController@getDevice');
    $app->post('device/{dev_key}', 'DeviceController@updateDevice');
});

$app->get('/camera', 'FrontendController@camera');
$app->get('/temparature', 'FrontendController@temparature');
$app->get('/humidity', 'FrontendController@humidity');
