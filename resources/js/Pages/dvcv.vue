<?php

use Illuminate\Support\Facades\Route;
use App\Mail\feedbackMail;
use resources\js\pages\Feedback;
use Illuminate\Support\Facades\URL;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

/*Route::get('/{reqID}', function () {
    //return view('welcome');
});

Route::get('/feedback', function () {
    return view('Feedback');
});*/

Route::get('/email',function(){
    return new feedbackMail();
});

Route::get('/emailfeed', function() {
				$status = Artisan::call('feedback:send');
				echo URL::current();
				return '<h1>Email sent</h1>';
			});

Route::get('/feedback/rid={reqID}', 'feedback@feedback')->name('feedback');

Route::prefix('auth')->group(function (){
    
    Route::get('init','AppController@init');
    Route::post('login','AppController@login');
    Route::post('register','AppController@register');
    Route::get('logout','AppController@logout');
    Route::post('reqLor','lor@register');
    Route::get('freq','lor@index');
    Route::post('upd','lor@update');
    Route::get('cgpi/{id}','StudInfoController@show');
    Route::get('req/{sid}','StudInfoController@showRequest');
    Route::get('areq/{rid}','StudInfoController@acceptedRequest');
    Route::get('dead','StudInfoController@deadlines');
    //List course,uni,deadline for a particaular request id
    Route::get('req','StudInfoController@showAcceptedReq');
    Route::post('notification/get','NotificationsController@get');
    Route::post('notification/read','NotificationsController@read');
    Route::post('refdata','roa@StoreData');
    Route::post('refcriteria','roa@StoreCriteria');
    Route::post('refrecommend','roa@StoreRecommend');
    Route::get('refdata/{rid}','roa@show');
    Route::post('done/{rid}','StudInfoController@update');
    Route::get('feed1','feedback@getreq');
    Route::get('feed/{rid}','feedback@getuni');
    Route::post('reqt','transcriptController@store');
    Route::get('transcript','transcriptController@get');
    Route::post('done','transcriptController@update');
    Route::get('completed','transcriptController@getCompleted');
    Route::get('completedLor','StudInfoController@completedRequest');

});


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
