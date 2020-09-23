<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\lor_nss;
use App\User;
use App\Http\Resources\nss as NssResource;
use App\Notifications\NotifyNSSCreated;
use App\Notifications\NotifyNSSEdited;
use App\Notifications\NotifyNSSDeleted;
use Notification;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class NssController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($sid)
    {
        $NSS = lor_nss::where('stud_id', $sid)->latest()->paginate(3);
        return NssResource::collection($NSS);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request,$id)
    {
                
            $NSS = $request ->isMethod('put') ? lor_nss::findOrFail($request->id) : new lor_nss;
            $NSS->id = $request->id;
            
            $NSS->stud_id = $id;
            $NSS->title = $request->title;
            $NSS->nss_activity = $request->achievement;
            if($request['file'] == null){
                $NSS->file_name = $request->name;
            }
            else{
               
                if($request->name != null){
                    if(\File::exists(public_path('/files/lor_nss/'.$request->name))){
                        \File::delete(public_path('/files/lor_nss/'.$request->name));
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
                    $file_name1 = "user-".$id.".nss.".rand(1,20);
                    //echo  "file1 ".$file_name1."  ";
                    
                    if(\File::exists(public_path('/files/lor_nss/'.$file_name1))){
                        $file_name2 = "user-".$id.".nss.".rand(1,20);
                        //echo  "file2 ".$file_name2."  ";
                        //echo "exists: ".\File::exists(public_path('/files/lor_nss/'.$file_name1))."  ";
                        if($file_name2 != $file_name1 && (\File::exists(public_path('/files/lor_nss/'.$file_name1)) != 1) ){
                            //echo "1  ";
                            $path = public_path().'/files/lor_nss/'.$file_name1;
                            $decode = base64_decode($exploded[1]);
                            file_put_contents($path,$decode); 
                            $NSS->file_name = $file_name1;
                        }
                        else if(\File::exists(public_path('/files/lor_nss/'.$file_name2)) != 1){
                            //echo "2  ";
                            $path = public_path().'/files/lor_nss/'.$file_name2;
                            $decode = base64_decode($exploded[1]);
                            file_put_contents($path,$decode); 
                            $NSS->file_name = $file_name2;
                        }
                        else{
                            return $this->store($request,$id);
                        }
                    }
                    else{
                        $path = public_path().'/files/lor_nss/'.$file_name1;
                            $decode = base64_decode($exploded[1]);
                            file_put_contents($path,$decode);
                            $NSS->file_name = $file_name1;
                    }
            }
            $pid = DB::table('lor_requests')
            ->join('users','lor_requests.professor','=','users.name')
            ->where('lor_requests.stud_id','=',$id)->select('users.id')->get();
            if($NSS->save()){
                $NSS = lor_nss::find($NSS->id);
                if($request -> isMethod('post')){
                   
                    foreach($pid as $id){
                    User::find($id->id)->notify(new NotifyNSSCreated($NSS));
                    }
                }
                else{
                    foreach($pid as $id){
                        User::find($id->id)->notify(new NotifyNSSEdited($NSS));
                        }
    
                }
            return new NssResource($NSS);
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
        $NSS = lor_nss::findOrFail($id);
        //Return single detail as a resource
        return new NssResource($NSS);
    }

    

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $NSS = lor_nss::findOrFail($id);
        $pid = DB::table('lor_requests')
        ->join('users','lor_requests.professor','=','users.name')
        ->where('lor_requests.stud_id','=',$NSS->stud_id)->select('users.id')->get();
        //Return single detail as a resource
        if(\File::exists(public_path('/files/lor_nss/'.$NSS->file_name))){
            \File::delete(public_path('/files/lor_nss/'.$NSS->file_name));
            if($NSS->delete()){
                foreach($pid as $id){
                    //echo "id:".$id->id." ";
                    User::find($id->id)->notify(new NotifyNSSDeleted($NSS));
                    }
                return new NssResource($NSS);
                }
        }
        else{
            echo 'File does not exist';
        }
        
    }
}
