<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\lor_university;
use App\lor_request;
use App\Http\Resources\uni as UniResource;
use App\Notifications\NotifyCourseCreated;
use App\Notifications\NotifyCourseEdited;
use App\Notifications\NotifyCourseDeleted;
use Notification;
use App\User;
use Illuminate\Support\Facades\Auth;

class CourseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($rid)
    {
       // $Course = lor_course::where('req_id', $rid)->latest()->paginate(3);
        $Uni = lor_university::where('req_id',$rid)->latest()->paginate(3);

        //return CourseResource::collection($Course);
        return UniResource::collection($Uni);
    }

    

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request,$id,$rid)
    {
        
                
             $Uni = $request ->isMethod('put') ? lor_university::findOrFail($request->id) : new lor_university;
             $Uni->id = $request->id;
            
             $Uni->stud_id = $id;
             $Uni->req_id = $rid;
             $Uni->course = $request->course;
             $Uni->university = $request->uni;
             $Uni->dept = $request->dept;
             $Uni->deadline = $request->dead;

             $pid = DB::table('lor_requests')
             ->join('users','lor_requests.professor','=','users.name')
             ->where('lor_requests.stud_id','=',$id)->select('users.id')->get();
             //echo "pid:".$pid." ";
            if( $Uni->save()){
                //echo "uni:".$Uni." ";
                $Uni = lor_university::find($Uni->id);
                if($request -> isMethod('post')){
                   
                    foreach($pid as $id){
                    User::find($id->id)->notify(new NotifyCourseCreated($Uni));
                    }
                }
                else{
                    foreach($pid as $id){
                        User::find($id->id)->notify(new NotifyCourseEdited($Uni));
                        }
    
                }
            return new UniResource($Uni);
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
        $Uni = lor_university::findOrFail($id);

        //return CourseResource::collection($Course);
        return new UniResource($Uni);
    }

    

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $Uni = lor_university::findOrFail($id);
        $pid = DB::table('lor_requests')
        ->join('users','lor_requests.professor','=','users.name')
        ->where('lor_requests.stud_id','=',$Uni->stud_id)->select('users.id')->get();
        if( $Uni->delete()){
            foreach($pid as $id){
                //echo "id:".$id->id." ";
                User::find($id->id)->notify(new NotifyCourseDeleted($Uni));
                }
        return new UniResource($Uni);
        }
    }
}
