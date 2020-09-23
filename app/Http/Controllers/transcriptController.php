<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\transcript;

class transcriptController extends Controller
{
    public function get(){

        $requests = DB::table('transcripts')
        ->join('users','transcripts.user_id','=','users.id')
        ->join('students','users.id','=','students.user_id')
        ->join('lor_marks','students.id','=','lor_marks.stud_id')
        ->where('transcripts.Done','=','0')
        ->select('transcripts.id','users.profile_image','users.name','students.studID','students.branch','students.sem','lor_marks.file_name',
        'users.email','students.dob','students.mobile','students.yoa','students.yog','transcripts.RPE',
        'transcripts.address','transcripts.transcript_for','transcripts.copies',
        'transcripts.I_agree','transcripts.Letter')
        ->get();

        return response($requests,200);
    }

    public function store(Request $request){
          
        $user = Auth::user();
        $transcript = new transcript();
        $transcript->user_id = $user->id;
        $transcript->RPE = $request->rpe;
        $transcript->sem = $request->sem;
        $transcript->address = $request->address;
        $transcript->transcript_for = $request->tfor;
        $transcript->copies = $request->cot;
        $transcript->I_agree = $request->pay;
        $transcript->Letter = $request->moi;
        $transcript->Done = 0;
        $transcript->save();

        return response('success',200);
    }

    public function update(request $request){
        
        if($request->done == 1){
            DB::update('update transcripts set Done= ? where id = ?',[1,$request->tid]);
            echo "Record updated successfully.";
            /*$requests = DB::table('lor_requests')->where('id','=',$request->id)->
            select('id','stud_id','professor')->get();
            echo  $requests."   ";
            User::find($request->uid)->notify(new NotifyStudentAccepted($requests));*/
          
        }
    }

    public function getCompleted(){

            $user = Auth::user();
            //echo "user name: ".$user->name."  ";
            //$prof = DB::table("users")->whereIn('id',explode(",",$user->id))->value("name");
            //echo "prof: ".$prof."  ";

            $requests = DB::table('transcripts')
            ->join('users','transcripts.user_id','=','users.id')
            ->join('students','users.id','=','students.user_id')
            ->join('lor_marks','students.id','=','lor_marks.stud_id')
            ->where('transcripts.Done','<>','0')
            ->select('transcripts.id','users.profile_image','users.name','students.studID','students.branch','students.sem','lor_marks.file_name',
            'users.email','students.dob','students.mobile','students.yoa','students.yog','transcripts.RPE',
            'transcripts.address','transcripts.transcript_for','transcripts.copies',
            'transcripts.I_agree','transcripts.Letter','lor_marks.file_name')
            ->get();

            //->select('lor_requests.id','users.profile_image','lor_requests.Done','students.name')
            /*->get(['lor_requests.id','lor_requests.stud_id','users.profile_image',
            'lor_requests.Done','students.name']);*/
            //echo "requests: ".$requests."  ";//DB::raw('MAX(lor_requests.Done) as Done')

            if($requests != null){
            return response($requests,200);
            }
        
    }
}
