<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\feedback;
use App\accepteduni;

class feedbacks extends Controller
{
    public function getreq(){

        $user =Auth::user();
        $studID = DB::table('students')->where('user_id','=',$user->id)->value('id');
        /*$deadline = DB::table('lor_requests')
        ->('req_id')->get(['req_id',DB::raw('MAX(Done)')]);*/
        //echo $studID."  ";

        $requests = DB::table("lor_requests")
        ->join('students','lor_requests.stud_id','=','students.id')
        ->where('lor_requests.stud_id','=',$studID)->where('lor_requests.status','=','1')
        ->where('lor_requests.done','<>','0000-00-00')
        ->select('lor_requests.id','lor_requests.professor')
        ->get();

        //echo $requests;

        return response($requests,200);
    }

    public function getuni($tk){
       //echo $tk;
        if (feedback::where('token', '=', $tk)->exists()) {
            $rid = DB::table('feedback')->where('token', '=', $tk)->value('req_id');
           // echo $rid;
            $requests =DB::table("lor_universities")
        ->where('lor_universities.req_id','=',$rid)
        ->where('lor_universities.done','<>','0000-00-00')
        ->select('lor_universities.id','lor_universities.req_id','lor_universities.course',
        'lor_universities.university')
        ->orderBy('lor_universities.deadline','asc')
        ->get();

        return response($requests,200);
         }

        /*$requests =DB::table("lor_universities")
        ->where('lor_universities.req_id','=',$rid)
        ->where('lor_universities.done','<>','0000-00-00')
        ->select('lor_universities.id','lor_universities.course',
        'lor_universities.university')
        ->orderBy('lor_universities.deadline','asc')
        ->get();

        return response($requests,200);*/

    }

    public function feedback(Request $request,$rid){
        /*echo 'valid';
        echo $request;*/
        if (!$request->hasValidSignature()) {
            abort(401, 'This link is not valid.');
        }
        //echo $rid;
        /*echo 'valid';$feed = DB::table("feedback")
                    ->where('feedback.req_id','=',$req_id)
                    ->select('feedback.token')
                    ->get();*/
        /*$rid= 'OPh5I0JCLURPg5yS';
        echo $rid;*/
    
        return view('welcome',["pk"=>$rid]);
    }

    public function feedback2($rid){
        /*echo 'valid';
        echo $request;*/
        /*if (!$request->hasValidSignature()) {
            abort(401, 'This link is not valid.');
        }*/
        //echo $rid;
        /*echo 'valid';$feed = DB::table("feedback")
                    ->where('feedback.req_id','=',$req_id)
                    ->select('feedback.token')
                    ->get();*/
        /*$rid= 'OPh5I0JCLURPg5yS';
        echo $rid;*/
    
        return response($rid);
    }

    public function store(Request $request){

        foreach ($request['accepted'] as $accept) {
            //echo $accept['id'];
            if($accept != null){
            $uni = new accepteduni;
            $uni->req_id = $accept['req_id'];
            $uni->course = $accept['course'];
            $uni->university = $accept['university'];
            if($request['chose'] == $accept['id']){
                $uni->chose = true;
            }
            else{
                $uni->chose = false;
            }
            $uni->save();
        }
           
            
           
        }
        return response('success');
    }


}
