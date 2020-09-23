<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\lor_achievement;
use App\Http\Resources\lor_achievements as AchievementResource;
use App\User;
use App\Notifications\notifyachievement;
use App\Notifications\NotifyAchievementEdited;
use App\Notifications\NotifyAchievementDeleted;
use Notification;
use Illuminate\Support\Facades\DB;
use App\Events\AcademicAchievementCreated;
use Illuminate\Support\Facades\Auth;

class EditDetailsController extends Controller
{
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($sid)
    {
       
        $Achievements = lor_achievement::where('stud_id', $sid)->latest()->paginate(3);
        return AchievementResource::collection($Achievements);
       
    }

    

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request,$id)
    {   
        
        $Achievements = $request ->isMethod('put') ? lor_achievement::findOrFail($request->id) : new lor_achievement;
        $Achievements->id = $request->id;
        
        $Achievements->stud_id = $id;
        $Achievements->title = $request->title;
        $Achievements->achievement = $request->achievement;
        if($request['file'] == null){
            $Achievements->file_name = $request->name;
        }
        else{
            if($request->name != null){
            if(\File::exists(public_path('/files/lor_achievements/'.$request->name))){
                \File::delete(public_path('/files/lor_achievements/'.$request->name));
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
            $file_name1 = "user-".$id.".achievement.".rand(1,20);
            //echo  "file1 ".$file_name1."  ";
            
            if(\File::exists(public_path('/files/lor_achievements/'.$file_name1))){
                $file_name2 = "user-".$id.".achievement.".rand(1,20);
                //echo  "file2 ".$file_name2."  ";
                //echo "exists: ".\File::exists(public_path('/files/lor_achievements/'.$file_name1))."  ";
                if($file_name2 != $file_name1 && (\File::exists(public_path('/files/lor_achievements/'.$file_name1)) != 1) ){
                    //echo "1  ";
                    $path = public_path().'/files/lor_achievements/'.$file_name1;
                    $decode = base64_decode($exploded[1]);
                    file_put_contents($path,$decode); 
                    $Achievements->file_name = $file_name1;
                }
                else if(\File::exists(public_path('/files/lor_achievements/'.$file_name2)) != 1){
                    //echo "2  ";
                    $path = public_path().'/files/lor_achievements/'.$file_name2;
                    $decode = base64_decode($exploded[1]);
                    file_put_contents($path,$decode); 
                    $Achievements->file_name = $file_name2;
                }
                else{
                    return $this->store($request,$id);
                }
            }
            else{
                $path = public_path().'/files/lor_achievements/'.$file_name1;
                    $decode = base64_decode($exploded[1]);
                    file_put_contents($path,$decode);
                    $Achievements->file_name = $file_name1;
            }
        }

        $pid = DB::table('lor_requests')
        ->join('users','lor_requests.professor','=','users.name')
        ->where('lor_requests.stud_id','=',$id)->select('users.id')->get();

         //echo $pid."  ";
        
         //if($Achievements->save()){ 
            
           
        
       
        if($Achievements->save()){
            $Achievement = lor_achievement::find($Achievements->id);
            if($request -> isMethod('post')){
               
                foreach($pid as $id){
                User::find($id->id)->notify(new notifyachievement($Achievement));
                }
            }
            else{
                foreach($pid as $id){
                    User::find($id->id)->notify(new NotifyAchievementEdited($Achievement));
                    }

            }
            return new AchievementResource($Achievements);

            

            
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
        $Achievements = lor_achievement::findOrFail($id);
        //Return single detail as a resource
        return new AchievementResource($Achievements);
    }

    

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
       $Achievements = lor_achievement::findOrFail($id);
        //Return single detail as a resource
        //$user = Auth::user();
        //$uid = $user->id;
        $pid = DB::table('lor_requests')
        ->join('users','lor_requests.professor','=','users.name')
        ->where('lor_requests.stud_id','=',$Achievements->stud_id)->select('users.id')->get();
        //echo "pid:".$pid." ";

        if(\File::exists(public_path('/files/lor_achievements/'.$Achievements->file_name))){
            \File::delete(public_path('/files/lor_achievements/'.$Achievements->file_name));
            if($Achievements->delete()){
                foreach($pid as $id){
                    //echo "id:".$id->id." ";
                    User::find($id->id)->notify(new NotifyAchievementDeleted($Achievements));
                    }
                return new AchievementResource($Achievements);
                }
        }
        else{
            echo 'File does not exist';
        }
        

        
    }
    
}
