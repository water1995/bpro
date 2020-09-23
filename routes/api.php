<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::prefix('achievement')->group(function (){
    //List Deatails
    Route::get('details/{sid}','EditDetailsController@index');
    //List Single Detail
    Route::get('detail/g/{id}','EditDetailsController@show');
    //Create New Detail
    Route::post('detail/{id}','EditDetailsController@store');
    //Update Detail
    Route::put('detail/{id}','EditDetailsController@store');
    //Delete Detail
    Route::delete('detail/{id}','EditDetailsController@destroy');
});

Route::prefix('curricular')->group(function (){
    //List Deatails
    Route::get('details/{sid}','CurricularController@index');
    //List Single Detail
    Route::get('detail/g/{id}','CurricularController@show');
    //Create New Detail
    Route::post('detail/{id}','CurricularController@store');
    //Update Detail
    Route::put('detail/{id}','CurricularController@store');
    //Delete Detail
    Route::delete('detail/{id}','CurricularController@destroy');
});

Route::prefix('extra')->group(function (){
    //List Deatails
    Route::get('details/{sid}','ExtraController@index');
    //List Single Detail
    Route::get('detail/g/{id}','ExtraController@show');
    //Create New Detail
    Route::post('detail/{id}','ExtraController@store');
    //Update Detail
    Route::put('detail/{id}','ExtraController@store');
    //Delete Detail
    Route::delete('detail/{id}','ExtraController@destroy');
});

Route::prefix('nss')->group(function (){
    //List Deatails
    Route::get('details/{sid}','NssController@index');
    //List Single Detail
    Route::get('detail/g/{id}','NssController@show');
    //Create New Detail
    Route::post('detail/{id}','NssController@store');
    //Update Detail
    Route::put('detail/{id}','NssController@store');
    //Delete Detail
    Route::delete('detail/{id}','NssController@destroy');
});

Route::prefix('prof_activity')->group(function (){
    //List Deatails
    Route::get('details/{rid}','ProfActivityController@index');
    //List Single Detail
    Route::get('detail/g/{id}','ProfActivityController@show');
    //Create New Detail
    Route::post('detail/{id}/{rid}','ProfActivityController@store');
    //Update Detail
    Route::put('detail/{id}/{rid}','ProfActivityController@store');
    //Delete Detail
    Route::delete('detail/{id}','ProfActivityController@destroy');
});

Route::prefix('course')->group(function (){
    //List Deatails
    Route::get('details/{rid}','CourseController@index');
    //List Single Detail
    Route::get('detail/g/{id}','CourseController@show');
    //Create New Detail
    Route::post('detail/{id}/{rid}','CourseController@store');
    //Update Detail
    Route::put('detail/edit/{id}/{rid}','CourseController@store');
    //Delete Detail
    Route::delete('detail/{id}','CourseController@destroy');
});




