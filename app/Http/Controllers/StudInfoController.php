<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\user;
use App\student;
use App\lor_prof_activties;
use App\lor_activities;
use App\lor_extra;
use App\lor_nss;
use App\lor_course;
use App\lor_university;
use App\lor_request;
use App\Notifications\NotifyStudentAccepted;


class StudInfoController extends Controller
{
    public function show($id){
        //echo $id;
        //echo '\n';
        $cgpis=array();
        $data=array();
        $user = Auth::user();
        $prof = DB::table("users")->whereIn('id',explode(",",$user->id))->value("name");
        $activity =array();
        $studID =DB::table("lor_requests")->whereIn('id',explode(',', $id))->value("stud_id");
        $userID =DB::table("students")->whereIn('id',explode(',', $studID))->value("user_id");
        $image = DB::table("users")->whereIn('id',explode(",",$userID))->value("profile_image");
        array_push($data,$image);
        $name =DB::table("students")->whereIn('id',explode(',',$studID))->value("name");
        array_push($data,$name);
        $yog =DB::table("students")->whereIn('id',explode(',',$studID))->value("yog");
        array_push($data,$yog);
        $profActivity = DB::table("lor_requests")
                 ->join('lor_prof_activities','lor_requests.id','=','lor_prof_activities.req_id')
                 ->where('lor_prof_activities.professor',$prof)
                 ->where('lor_requests.id','=',$id)
                 ->select('lor_prof_activities.activity','lor_prof_activities.marks','lor_prof_activities.file_name')
                 ->get();
                 array_push($data,$profActivity);
        $achievements = DB::table("lor_achievements")->where('stud_id',$studID)
                        ->select('lor_achievements.achievement','lor_achievements.file_name')
                        ->get();
        array_push($data,$achievements);
        $activities = DB::table("lor_activities")->where('stud_id',$studID)
                        ->select('lor_activities.activity','lor_activities.file_name')
                        ->get();
        array_push($data,$activities);
        $extras = DB::table("lor_extras")->where('stud_id',$studID)
                        ->select('lor_extras.extra_curricular_activity','lor_extras.file_name')
                        ->get();
        array_push($data,$extras);
        $nss = DB::table("lor_nsses")->where('stud_id',$studID)
                        ->select('lor_nsses.nss_activity','lor_nsses.file_name')
                        ->get();
        array_push($data,$nss);
        $course = DB::table("lor_requests")
                        ->join('lor_universities','lor_requests.id','=','lor_universities.req_id')
                        ->where('lor_requests.id','=',$id)
                        ->where('lor_universities.req_id','=',$id)
                        ->select('lor_universities.course','lor_universities.university','lor_universities.deadline')
                        ->get();
        array_push($data,$course);
         
        return response($data,200);

    }

    public function showRequest($sid){

        //$data = array();
        $requests = lor_request::where('stud_id',$sid)->get();
        //array_push($data)
        return response($requests,200);

    }

    public function deadlines(){
        $user = Auth::user();
        $prof = DB::table("users")->whereIn('id',explode(",",$user->id))->value("name");
        $requests =DB::table("lor_universities")
        ->join('lor_requests','lor_universities.req_id','=','lor_requests.id')
        ->join('students','lor_requests.stud_id','=','students.id')
        ->join('users','students.user_id','=','users.id')
        ->where('lor_requests.professor','=',$prof)->where('lor_requests.status','=','1')
        ->where('lor_universities.Done','=','0000-00-00')
        ->select('lor_requests.id','users.profile_image','students.yog','students.name','lor_universities.course','lor_universities.university','lor_universities.deadline')
        ->orderBy('lor_universities.deadline','asc')
        ->get();

        $result = json_decode(json_encode($requests),true);
        return response($result,200);
    }

    public function acceptedRequest($rid){
        
        $data = array();
        $user = Auth::user();
        $prof = DB::table("users")->whereIn('id',explode(",",$user->id))->value("name");

        $requests =DB::table("lor_universities")
        ->join('lor_requests','lor_universities.req_id','=','lor_requests.id')
        ->join('students','lor_requests.stud_id','=','students.id')
        ->join('users','students.user_id','=','users.id')
        ->where('lor_requests.professor','=',$prof)->where('lor_requests.id','=',$rid)
        ->where('lor_universities.Done','=','0000-00-00')
        ->select('lor_universities.id as uid','lor_requests.id','lor_requests.roa','lor_requests.Done','users.profile_image','students.yog','students.name','lor_universities.course','lor_universities.university','lor_universities.deadline')
        ->orderBy('lor_universities.deadline','asc')
        ->get();

        $result = json_decode(json_encode($requests),true);
        return response($result,200);

    }

    public function showAcceptedReq(){
        $user = Auth::user();
        //echo "user name: ".$user->name."  ";
        $prof = DB::table("users")->whereIn('id',explode(",",$user->id))->value("name");
        //echo "prof: ".$prof."  ";
        $requests = DB::table("lor_requests")
        ->join('students','lor_requests.stud_id','=','students.id')
        ->join('users','students.user_id','=','users.id')
        ->where('lor_requests.professor','=',$prof)->where('lor_requests.status','=','1')
        ->where('lor_requests.Done','=','0000-00-00')
        ->select('lor_requests.id','lor_requests.stud_id','users.profile_image','lor_requests.created_at','students.name')
        ->get();
        //echo "requests: ".$requests."  ";
        return response($requests,200);
    }

    public function update($rid){
        //echo $rid;
        DB::update('update lor_universities set done= ? where id = ?',[Carbon::today()->toDateString(),$rid]);
            //echo "Record updated successfully.";
        /*$data = DB::table('lor_universities')
            ->where('lor_universities.req_id','=',$rid)
            ->select('lor_universities.id','lor_universities.done')->get();*/

            
            /*$uid =DB::table("lor_universities")
            ->join('students','lor_universities.stud_id','=','students.id')
            ->join('lor_requests','lor_requests.stud_id','=','students.id')
            ->where('lor_universities.id','=',$rid)
            ->select('students.user_id','lor_requests.professor')->get();
            //echo $uid;
            //$stud_id = $uid[0]->stud_id;
            User::find($uid[0]->user_id)->notify(new NotifyStudentAccepted($uid[0]->professor));*/

        return response($rid,200);
    }

    public function completedRequest($rid){
        
        $data = array();
        $user = Auth::user();
        $prof = DB::table("users")->whereIn('id',explode(",",$user->id))->value("name");
        $requests =DB::table("lor_universities")
        ->join('lor_requests','lor_universities.req_id','=','lor_requests.id')
        ->join('students','lor_requests.stud_id','=','students.id')
        ->join('users','students.user_id','=','users.id')
        ->where('lor_requests.professor','=',$prof)
        ->where('lor_requests.Done','<>','0000-00-00')
        ->where('lor_requests.id','=',$rid)
        ->select('lor_universities.req_id','lor_universities.id','lor_requests.roa','lor_requests.Done','users.profile_image','students.yog','students.name','lor_universities.course','lor_universities.university','lor_universities.deadline')
        ->orderBy('lor_universities.deadline','asc')
        ->get();

        $result = json_decode(json_encode($requests),true);
        return response($result,200);

    }

}
