<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\transcript;

class transcripts extends Controller
{
    public function get(){

        $requests = DB::table('transcripts')
        ->join('users','transcripts.user_id','=','users.id')
        ->join('students','users.id','=','students.user_id')
        ->join('lor_marks','students.id','=','lor_marks.stud_id')
        ->select('users.profile_image','users.name','students.studID','students.branch',
        'users.email','students.dob','students.mobile','students.yoa','students.yog','transcripts.RPE',
        'transcripts.address','transcripts.transcript_for','transcripts.copies',
        'transcripts.I_agree','transcripts.Letter','lor_marks.file_name')
        ->get();

        return response($requests,200);
    }

    public function store(Request $request){
          
        $user = Auth::user();
        $transcript = new transcript();
        $transcript->user_id = $user->id;
        $transcript->RPE = $request->rpe;
        $transcript->address = $request->address;
        $transcript->transcript_for = $request->tfor;
        $transcript->copies = $request->cot;
        $transcript->I_agree = $request->pay;
        $transcript->Letter = $request->moi;
        $transcript->save();

        return response('success',200);
        

    }
}
