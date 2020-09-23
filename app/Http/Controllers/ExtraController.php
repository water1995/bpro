<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\lor_extra;
use App\User;
use App\Http\Resources\extra as ExtraResource;
use App\Notifications\NotifyExtraCreated;
use App\Notifications\NotifyExtraEdited;
use App\Notifications\NotifyExtraDeleted;
use Notification;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class ExtraController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($sid)
    {
        $Extra = lor_extra::where('stud_id', $sid)->latest()->paginate(3);
        return ExtraResource::collection($Extra);
    }

    

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request,$id)
    {    
            $Extra = $request ->isMethod('put') ? lor_extra::findOrFail($request->id) : new lor_extra;
            $Extra->id = $request->id;
            
            $Extra->stud_id = $id;
            $Extra->title = $request->title;
            $Extra->extra_curricular_activity = $request->achievement;
            if($request['file'] == null){
                $Extra->file_name = $request->name;
            }
            else{
                if($request->name != null){
                    if(\File::exists(public_path('/files/lor_extra/'.$request->name))){
                        \File::delete(public_path('/files/lor_extra/'.$request->name));
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
            $file_name1 = "user-".$id.".extra.".rand(1,20);
            //echo  "file1 ".$file_name1."  ";
            
            if(\File::exists(public_path('/files/lor_extra/'.$file_name1))){
                $file_name2 = "user-".$id.".extra.".rand(1,20);
                //echo  "file2 ".$file_name2."  ";
                //echo "exists: ".\File::exists(public_path('/files/lor_extra/'.$file_name1))."  ";
                if($file_name2 != $file_name1 && (\File::exists(public_path('/files/lor_extra/'.$file_name1)) != 1) ){
                    //echo "1  ";
                    $path = public_path().'/files/lor_extra/'.$file_name1;
                    $decode = base64_decode($exploded[1]);
                    file_put_contents($path,$decode); 
                    $Extra->file_name = $file_name1;
                }
                else if(\File::exists(public_path('/files/lor_extra/'.$file_name2)) != 1){
                    //echo "2  ";
                    $path = public_path().'/files/lor_extra/'.$file_name2;
                    $decode = base64_decode($exploded[1]);
                    file_put_contents($path,$decode); 
                    $Extra->file_name = $file_name2;
                }
                else{
                    return $this->store($request,$id);
                }
            }
            else{
                $path = public_path().'/files/lor_extra/'.$file_name1;
                    $decode = base64_decode($exploded[1]);
                    file_put_contents($path,$decode);
                    $Extra->file_name = $file_name1;
            }
        }
        $pid = DB::table('lor_requests')
        ->join('users','lor_requests.professor','=','users.name')
        ->where('lor_requests.stud_id','=',$id)->select('users.id')->get();

            if($Extra->save()){
                $Extra = lor_extra::find($Extra->id);
                if($request -> isMethod('post')){
                   
                    foreach($pid as $id){
                    User::find($id->id)->notify(new NotifyExtraCreated($Extra));
                    }
                }
                else{
                    foreach($pid as $id){
                        User::find($id->id)->notify(new NotifyExtraEdited($Extra));
                        }
    
                }
            return new ExtraResource($Extra);
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
        $Extra= lor_extra::findOrFail($id);
        //Return single detail as a resource
        return new ExtraResource($Extra);
    }

    

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $Extra = lor_extra::findOrFail($id);
        $pid = DB::table('lor_requests')
        ->join('users','lor_requests.professor','=','users.name')
        ->where('lor_requests.stud_id','=',$Extra->stud_id)->select('users.id')->get();
        //Return single detail as a resource
        if(\File::exists(public_path('/files/lor_extra/'.$Extra->file_name))){
            \File::delete(public_path('/files/lor_extra/'.$Extra->file_name));
            if($Extra->delete()){
                foreach($pid as $id){
                    //echo "id:".$id->id." ";
                    User::find($id->id)->notify(new NotifyExtraDeleted($Extra));
                    }
                return new ExtraResource($Extra);
                }
        }
        else{
            echo 'File does not exist';
        }
        
    }
}
