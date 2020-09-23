<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\lor_prof_activity;
use App\User;
use App\Http\Resources\ProfActivity as ProfActivityResource;
use App\Notifications\notifyAWPCreated;
use App\Notifications\NotifyAWPEdited;
use App\Notifications\NotifyAWPDeleted;
use Notification;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class ProfActivityController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($rid)
    {
        $ProfActivity = lor_prof_activity::where('req_id', $rid)->latest()->paginate(3);
        return ProfActivityResource::collection($ProfActivity);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request,$id,$rid)
    {
        
                
            $ProfActivity = $request ->isMethod('put') ? lor_prof_activity::findOrFail($request->id) : new lor_prof_activity;
            $ProfActivity->id = $request->id;
            
            $ProfActivity->stud_id = $id;
            $ProfActivity->req_id = $rid;
            $ProfActivity->title = $request->title;
            $ProfActivity->activity = $request->activity;
            $ProfActivity->professor = $request->professor;
            if($request->marks == null){
                $ProfActivity->marks = 0;
            }
            else{
            $ProfActivity->marks = $request->marks;
            }
            if($request['file'] == null){
                $ProfActivity->file_name = $request->file_name;
            }
            else{
            if($request->file_name != null){
                //echo $request->file_name."  ";echo $ProfActivity->file_name."  ";
                if(\File::exists(public_path('/files/prof_activity/'.$request->file_name))){
                    \File::delete(public_path('/files/prof_activity/'.$request->file_name));
                    //echo 'deleted ';
                }
                else if(\File::exists(public_path('/files/prof_activity/'.$ProfActivity->file_name))){
                    \File::delete(public_path('/files/prof_activity/'.$ProfActivity->file_name));
                    //echo 'deleted ';
                }
            }
    
                $exploded = explode(',',$request['file']);
                $ext="";
                    if(str_contains($exploded[0],'pdf')){
                       // echo 1;
                        $ext = 'pdf';
                    }
    
                    //name($id);
    
                //function name($id){
                $file_name1 = "user-".$id.".prof_activity.".rand(1,20);
                //echo  "file1 ".$file_name1."  ";
                
                if(\File::exists(public_path('/files/prof_activity/'.$file_name1))){
                    $file_name2 = "user-".$id.".prof_activity.".rand(1,20);
                    //echo  "file2 ".$file_name2."  ";
                    //echo "exists: ".\File::exists(public_path('/files/prof_activity/'.$file_name1))."  ";
                    if($file_name2 != $file_name1 && (\File::exists(public_path('/files/prof_activity/'.$file_name1)) != 1) ){
                        //echo "1  ";
                        $path = public_path().'/files/prof_activity/'.$file_name1;
                        $decode = base64_decode($exploded[1]);
                        file_put_contents($path,$decode); 
                        $ProfActivity->file_name = $file_name1;
                    }
                    else if(\File::exists(public_path('/files/prof_activity/'.$file_name2)) != 1){
                        //echo "2  ";
                        $path = public_path().'/files/prof_activity/'.$file_name2;
                        $decode = base64_decode($exploded[1]);
                        file_put_contents($path,$decode); 
                        $ProfActivity->file_name = $file_name2;
                    }
                    else{
                        return $this->store($request,$id,$rid);
                    }
                }
                else{
                    $path = public_path().'/files/prof_activity/'.$file_name1;
                        $decode = base64_decode($exploded[1]);
                        file_put_contents($path,$decode);
                        $ProfActivity->file_name = $file_name1;
                }
            }
            $pid = DB::table('lor_requests')
            ->join('users','lor_requests.professor','=','users.name')
            ->where('lor_requests.stud_id','=',$id)->select('users.id')->get();
            if($ProfActivity->save()){
                $ProfActivity = lor_prof_activity::find($ProfActivity->id);
                if($request -> isMethod('post')){
                   
                    foreach($pid as $id){
                    User::find($id->id)->notify(new NotifyAWPCreated($ProfActivity));
                    }
                }
                else{
                    foreach($pid as $id){
                        User::find($id->id)->notify(new NotifyAWPEdited($ProfActivity));
                        }
    
                }
                //echo $ProfActivity." ";
            return new ProfActivityResource($ProfActivity);
           }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $ProfActivity = lor_prof_activity::findOrFail($id);
        //Return single detail as a resource
            
        return new ProfActivityResource($ProfActivity);
        
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //echo $id." ";
        $ProfActivity = lor_prof_activity::findOrFail($id);
        //Return single detail as a resource
        //echo $ProfActivity." ";
        $pid = DB::table('lor_requests')
        ->join('users','lor_requests.professor','=','users.name')
        ->where('lor_requests.stud_id','=',$ProfActivity->stud_id)->select('users.id')->get();
        
        if(\File::exists(public_path('/files/prof_activity/'.$ProfActivity->file_name))){
            \File::delete(public_path('/files/prof_activity/'.$ProfActivity->file_name));
            if($ProfActivity->delete()){
                foreach($pid as $id){
                    //echo "id:".$id->id." ";
                    User::find($id->id)->notify(new NotifyAWPDeleted($ProfActivity));
                    }
                return new ProfActivityResource($ProfActivity);
                }
        }
        else{
            echo 'File does not exist';
        }
        
    }
}
