<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Notification;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class NotificationsController extends Controller
{
    public function get(){
        
        /*$user = Auth::user();
        if(Auth::user() != null){
        echo $user;
        }*/
        //if(Auth::user() != null){
       $notification = Auth::user()->unreadNotifications;
      
        return $notification;
   /* }
        else{
            return 0;
        }*/
        //return Notification::all();

    }

    public function read(Request $request){
        //echo $request->data;
        $user = Auth::user();
        foreach($request->data as $data){
            //echo $data."  ";
        Auth::user()->unreadNotifications()->find($data)->markAsRead();
        }

        $read = DB::table('notifications')->where('read_at','!=','NULL')->where('notifiable_id','=',$user->id)->orderBy('read_at','DESC')->get();
        //echo $read."  ";
        /*foreach($read as $r){
            echo $r." ";
        }*/

        return $read;

    }
}
