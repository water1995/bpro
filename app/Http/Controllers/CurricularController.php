<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\lor_activity;
use App\User;
use App\Http\Resources\curricular as CurricularResource;
use App\Notifications\NotifyCurricularCreated;
use App\Notifications\NotifyCurricularEdited;
use App\Notifications\NotifyCurricularDeleted;
use Notification;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class CurricularController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($sid)
    {
        $Curricular = lor_activity::where('stud_id', $sid)->latest()->paginate(3);
        return CurricularResource::collection($Curricular);
    }

    

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request,$id)
    {      
            $Curricular = $request ->isMethod('put') ? lor_activity::findOrFail($request->id) : new lor_activity;
            $Curricular->id = $request->id;
            
            $Curricular->stud_id = $id;
            $Curricular->title = $request->title;
            $Curricular->activity = $request->achievement;
            if($request['file'] == null){
                $Curricular->file_name = $request->name;
            }
            else{
                if($request->name != null){
                    if(\File::exists(public_path('/files/lor_activities/'.$request->name))){
                        \File::delete(public_path('/files/lor_activities/'.$request->name));
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
            $file_name1 = "user-".$id.".activity.".rand(1,20);
            //echo  "file1 ".$file_name1."  ";
            
            if(\File::exists(public_path('/files/lor_activities/'.$file_name1))){
                $file_name2 = "user-".$id.".activity.".rand(1,20);
                //echo  "file2 ".$file_name2."  ";
                //echo "exists: ".\File::exists(public_path('/files/lor_activities/'.$file_name1))."  ";
                if($file_name2 != $file_name1 && (\File::exists(public_path('/files/lor_activities/'.$file_name1)) != 1) ){
                    //echo "1  ";
                    $path = public_path().'/files/lor_activities/'.$file_name1;
                    $decode = base64_decode($exploded[1]);
                    file_put_contents($path,$decode); 
                    $Curricular->file_name = $file_name1;
                }
                else if(\File::exists(public_path('/files/lor_activities/'.$file_name2)) != 1){
                    //echo "2  ";
                    $path = public_path().'/files/lor_activities/'.$file_name2;
                    $decode = base64_decode($exploded[1]);
                    file_put_contents($path,$decode); 
                    $Curricular->file_name = $file_name2;
                }
                else{
                    return $this->store($request,$id);
                }
            }
            else{
                $path = public_path().'/files/lor_activities/'.$file_name1;
                    $decode = base64_decode($exploded[1]);
                    file_put_contents($path,$decode);
                    $Curricular->file_name = $file_name1;
            }
        }
    
        $pid = DB::table('lor_requests')
        ->join('users','lor_requests.professor','=','users.name')
        ->where('lor_requests.stud_id','=',$id)->select('users.id')->get();

           
            if($Curricular->save()){
                $Curricular = lor_activity::find($Curricular->id);
                if($request -> isMethod('post')){
                   
                    foreach($pid as $id){
                    User::find($id->id)->notify(new NotifyCurricularCreated($Curricular));
                    }
                }
                else{
                    foreach($pid as $id){
                        User::find($id->id)->notify(new NotifyCurricularEdited($Curricular));
                        }
    
                }
            return new CurricularResource($Curricular);
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
        //Get Detail
        $Curricular = lor_activity::findOrFail($id);
        //Return single detail as a resource
        return new CurricularResource($Curricular);
    }

    

   

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $Curricular = lor_activity::findOrFail($id);
        //Return single detail as a resource
        $pid = DB::table('lor_requests')
        ->join('users','lor_requests.professor','=','users.name')
        ->where('lor_requests.stud_id','=',$Curricular->stud_id)->select('users.id')->get();
        
        if(\File::exists(public_path('/files/lor_activities/'.$Curricular->file_name))){
            \File::delete(public_path('/files/lor_activities/'.$Curricular->file_name));
            if($Curricular->delete()){
                foreach($pid as $id){
                    //echo "id:".$id->id." ";
                    User::find($id->id)->notify(new NotifyCurricularDeleted($Curricular));
                    }
                return new CurricularResource($Curricular);
                }
        }
        else{
            echo 'File does not exist';
        }
        
    }
}
