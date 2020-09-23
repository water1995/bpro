<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Arr;
use App\Notifications\NotifyStudentAccepted;
use App\Notifications\NotifyStudentDeclined;
use App\user;
use App\student;
use App\lor_course;
use App\lor_university;
use App\lor_request;
use App\lor_dmark;
use App\lor_mark;
use App\lor_prof_activity;
use App\lor_achievement;
use App\lor_activity;
use App\lor_extra;
use App\lor_nss;

class lor extends Controller
{
    public function index(){
        $request=array();
        $user = Auth::user();
        $lor_requests = DB::table('lor_requests')
                    ->join('students','lor_requests.stud_id','=','students.id')
                    ->join('users','students.user_id','=','users.id')
                    ->where('lor_requests.status','=','0')
                    ->select('users.profile_image','students.name','students.yog','lor_requests.professor','lor_requests.id','students.user_id')
                    ->get();
                    //echo $lor_requests."  ";
                    $result = json_decode($lor_requests, true);
                    //echo $result."  ";
       foreach($result as $r){
        //echo $r['professor']."  ";
           //echo ($r['professor'] == $user->name)."  ";
            if($r['professor'] == $user->name){
                array_push($request,$r);
            }
        }
        return $request;
    }

    public function register(request $request){
        
        $user = Auth::user();
        //echo $user;
        $studID = DB::table("students")->where('user_id','=', $user->id)->value("id");
        //echo $studID;
        if($request['lreq'] != true || $request['lreq'] == null){
        foreach($request['achievements'] as $achievement){
            //echo $achievement['file'];
            $exploded = explode(',',$achievement['file']);
      
        if(str_contains($exploded[0],'pdf')){
            $ext = 'pdf';
        }
          
            $lor_achievements = new lor_achievement;
            $lor_achievements->stud_id = $studID;
            $lor_achievements->title = $achievement['title'];
            $lor_achievements->achievement = $achievement['text'];
         
            $file_name = "user-".$user->id.".achievement";
            $lor_achievements->file_name = $file_name;
            $lor_achievements->save();
            DB::update('update lor_achievements set file_name= ? where id = ?',["user-".$user->id.".achievement-".$lor_achievements->id,$lor_achievements->id]);
            
            $file_name = "user-".$user->id.".achievement-".$lor_achievements->id;
            $path = public_path().'/files/lor_achievements/'.$file_name;
            $decode = base64_decode($exploded[1]);
            file_put_contents($path,$decode);
           
        }
     
        foreach($request['activities'] as $achievement){
           
            $exploded = explode(',',$achievement['file']);
        
        if(str_contains($exploded[0],'pdf')){
            $ext = 'pdf';
        }
            
            
            $lor_activities = new lor_activity;
            $lor_activities->stud_id = $studID;
            $lor_activities->title = $achievement['title'];
            $lor_activities->activity = $achievement['text'];
            $file_name = "user-".$user->id.".activity.".$ext;
            $lor_activities->file_name = $file_name;
            $lor_activities->save();
            DB::update('update lor_activities set file_name= ? where id = ?',["user-".$user->id.".activity-".$lor_activities->id,$lor_activities->id]);
            
            $file_name = "user-".$user->id.".activity-".$lor_activities->id;
            $path = public_path().'/files/lor_activities/'.$file_name;
            $decode = base64_decode($exploded[1]);
            file_put_contents($path,$decode);
           
        }
     
        foreach($request['extra'] as $achievement){
          
            $exploded = explode(',',$achievement['file']);
        
        if(str_contains($exploded[0],'pdf')){
            $ext = 'pdf';
        }
            
            
            $lor_extra = new lor_extra;
            $lor_extra->stud_id = $studID;
            $file_name = "user-".$user->id.".extra.".$ext;
            $lor_extra->title = $achievement['title'];
            $lor_extra->extra_curricular_activity = $achievement['text'];
            $lor_extra->file_name = $file_name;
            $lor_extra->save();
            DB::update('update lor_extras set file_name= ? where id = ?',["user-".$user->id.".extra-".$lor_extra->id,$lor_extra->id]);
           
            $file_name = "user-".$user->id.".extra-".$lor_extra->id;
            $path = public_path().'/files/lor_extra/'.$file_name;
            $decode = base64_decode($exploded[1]);
            file_put_contents($path,$decode);
            
        }

        foreach($request['nss'] as $achievement){
           
             $exploded = explode(',',$achievement['file']);
         
         if(str_contains($exploded[0],'pdf')){
             $ext = 'pdf';
         }
             
             
            
             $lor_nss = new lor_nss;
             $lor_nss->stud_id = $studID;
             $file_name = "user-".$user->id.".nss_activity.".$ext;
             $lor_nss->title = $achievement['title'];
             $lor_nss->nss_activity = $achievement['text'];
             $lor_nss->file_name = $file_name;
             $lor_nss->save();
             DB::update('update lor_nsses set file_name= ? where id = ?',["user-".$user->id.".activity-".$lor_nss->id,$lor_nss->id]);
            
            $file_name = "user-".$user->id.".nss-".$lor_nss->id;
             $path = public_path().'/files/lor_nss/'.$file_name;
             $decode = base64_decode($exploded[1]);
             file_put_contents($path,$decode);
            
         }
        }
    
        $prev="";

        foreach($request['req'] as $result){
            $exploded = explode(',',$request['dfile']);
            $ext="";
                if(str_contains($exploded[0],'pdf')){
                    //echo 1;
                    $ext = 'pdf';
                }

            //echo " ";echo "prev=".$prev;echo "    ";
            if(!($prev == $result['prof']) || $prev == null){
                $lor_requests = new lor_request;
            $lor_requests->stud_id = $studID;
            $lor_requests->professor = $result['prof'];
            $lor_requests->status = 0;
            $file_name = "user-".$user->id.".lor_draft.".$ext;
            $lor_requests->lor_draft = $file_name;
            $lor_requests->roa = false;
            $lor_requests->save();
           
             $path = public_path().'/files/lor_draft/'.$file_name;
             $decode = base64_decode($exploded[1]);
             file_put_contents($path,$decode);
             $profID = DB::table("users")->where('name','=', $result['prof'])->value("id");
            User::find($profID)->notify(new NotifyProfReq($profID));
             $prev = $result['prof'];
             //echo $prev;
            }

            if($result['pfile'] != null){
                
            $exploded = explode(',',$result['pfile']);
         
            if(str_contains($exploded[0],'pdf')){
                $ext = 'pdf';
            }
            $file_name = "user-".$user->id.".prof_activity.".rand(10,30);
            $path = public_path().'/files/prof_activity/'.$file_name;
             $decode = base64_decode($exploded[1]);
             file_put_contents($path,$decode);
            //echo $file_name."   ";

            
            $lor_prof_activity = new lor_prof_activity;
            $lor_prof_activity->stud_id = $studID;
            $lor_prof_activity->req_id = $lor_requests->id;
            $lor_prof_activity->title = $result['title'];
            $lor_prof_activity->activity = $result['activity'];
            $lor_prof_activity->professor = $result['prof'];
            if($result['marks'] == null){
                $lor_prof_activity->marks = 0;
            }
            else{
            $lor_prof_activity->marks = $result['marks'];
            }

            $lor_prof_activity->file_name = $file_name;
            if($lor_prof_activity->save()){
            //echo "Success ".$lor_prof_activity;
            }

        }
        

        foreach($request['deadline'] as $result) {
            //echo 'deadline:';echo ' '; echo $result['course'];echo ' ';
            foreach($result['universities'] as $uni){
             //echo 'uni:';echo ' '; echo $uni['uni'];echo ' ';
             //echo 'deadline:';echo ' '; echo $uni['deadline'];echo ' ';
             
                 $lor_university = new lor_university;
                 $lor_university->stud_id = $studID;
                 $lor_university->req_id = $lor_requests->id;
                 $lor_university->course = $result['course'];
                 $lor_university->university= $uni['uni'];
                 $lor_university->dept= $uni['dept'];
                 $lor_university->deadline = $uni['deadline'];
                 $lor_university->save();
            }
        }
    }
    
    //$userr = json_encode(Auth::user());
    return response()->json([$user],200);
    }
          
             
        

    public function update(request $request){
        
        if($request->accept == 1){
            DB::update('update lor_requests set status= ? where id = ?',[1,$request->id]);
            //echo "Record updated successfully.";
            $requests = DB::table('lor_requests')->where('id','=',$request->id)->
            select('id','stud_id','professor')->get();
            //echo  $requests."   ";
            User::find($request->uid)->notify(new NotifyStudentAccepted($requests));
          
        }
        else if($request->accept == 2){
            DB::update('update lor_requests set status= ? where id = ?',[2,$request->id]);
            //echo "Record updated successfully.";
            $requests = DB::table('lor_requests')->where('id','=',$request->id)->
            select('id','stud_id','professor')->get();
            //echo  $requests."   ";
            User::find($request->uid)->notify(new NotifyStudentDeclined($requests));
          
        }
    }
}

