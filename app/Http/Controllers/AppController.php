<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;

use File;

use App\User;
use App\Student;
use App\lor_dmark;
use App\lor_mark;
use App\sgpa_6;
use App\sgpa_7;
use App\sgpa_8;
use App\DSgpi;

class AppController extends Controller
{
    public function init()
    {

        $user = Auth::user();
        
        //echo $user;
        //echo Auth::user();
       if(Auth::user() == null){
            return response(null,200);
        }
        else{
            $role = DB::table("users")->where('id', $user->id)->value('role_id');
            if($role == 1){
            $student = DB::table("students")->where('user_id', $user->id)->get();
            //echo $student;
            if(DB::table("lor_requests")->where('stud_id', $student[0]->id)->exists()){
                $req = true;
            }
            else{
                $req = false;
            }
        //echo $student;
        //echo '   ';
        return response()->json([$user,$student,$req],200);
        }
        else{
            //return response()->json([Auth::user()],200);
            return response()->json($user,200); 
        }
    }
}

    


    public function login(Request $request)
    {
         
        if(Auth::attempt(['email'=>$request->email,'password'=>$request->password],true))
        {
            $user = Auth::user();
            $role = DB::table("users")->where('id', $user->id)->value('role_id');
            if($role == 1){
            $student = DB::table("students")->where('user_id', $user->id)->get();
            /*if(DB::table("lor_requests")->where('stud_id', $student[0]->id)
            ->where('status',1)->exists()){
                $areq = true;
            }
            else{
                $areq = false;
            }*/
            if(DB::table("lor_requests")->where('stud_id', $student[0]->id)->exists()){
                $req = true;
            }
            else{
                $req = false;
            }
        }
            //echo $student;
            if($role == 1){
            return response()->json([$user,$student,$req],200);
           }
            else{
                return response()->json([Auth::user()],200); 
            }
        }
        else
        {
            return response()->json(['error' => 'Could not log you in'],401);
        }

    }

    public function register(Request $request)
    {
       if(isset($user->id))
        {
            return response()->json(['error'=> 'User already exists'],401);
        }
        $user = new User();
        $user->profile_image = $request->pimage;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->role_id = 1;
       
        $user->save();
        
       $file = $request->pic;
       //echo $file;echo "  ";
        $exploded = explode(',',$file);
        //echo $exploded;echo "  ";
        if(str_contains($exploded[0],'png')){
            $ext = 'png';
        }else if(str_contains($exploded[0],'jpg')){
            $ext = 'jpg';
        }else{
            $ext = 'jpeg';
        }
        $file_name = $user->profile_image;
        //echo $file_name;echo "  ";
        $path = public_path().'/files/profile_image/'.$file_name;
        //echo $path;echo "  ";
        $decode = base64_decode($exploded[1]);
       // echo $decode;
        file_put_contents($path,$decode);

        $student = new Student();
        $student->user_id = $user->id;
        $student->role_id = $user->role_id;
        $student->name = $request->name;
        $student->branch = $request->branch;
        $student->studID = $request->studID;
        $student->yoa = $request->yoa;
        $student->yog = $request->yog;
        $student->gre = $request->gre;
        if($request->gmat != null){
        $student->gmat = $request->gmat;
        }
        else{
            $student->gmat = 0;
        }
        $student->dob = $request->dob;
        $student->sem = $request->sem;
        $student->diploma = $request->diploma;
        $student->mobile = $request->mobile;
        $student->save();
        
         //echo $request->dsem1;
         
        if(Arr::exists($request, 'dsem1')){
           // echo 'key exists';
        $DSgpi = new DSgpi();
        $DSgpi->stud_id = $student->id;
        $DSgpi->Sem_1 = $request->dsem1;
        $DSgpi->Sem_2 = $request->dsem2;
        $DSgpi->Sem_3 = $request->dsem3;
        $DSgpi->Sem_4 = $request->dsem4;
        $DSgpi->Sem_5 = $request->dsem5;
        $DSgpi->Sem_6 = $request->dsem6;
        $DSgpi->save();
        }

       if($student->sem == 6){
           //echo 6;
            $sgpa6 = new sgpa_6;
            $sgpa6->stud_id = $student->id;
            $sgpa6->Sem_1 = $request->Sem_1;
            $sgpa6->Sem_2 = $request->Sem_2;
            $sgpa6->Sem_3 = $request->Sem_3;
            $sgpa6->Sem_4 = $request->Sem_4;
            $sgpa6->Sem_5 = $request->Sem_5;
            $sgpa6->Sem_6 = $request->Sem_6;
            $sgpa6->save();
            
        }
        else if($student->sem == 7){
            //echo 7;
            $sgpa7 = new sgpa_7;
            $sgpa7->stud_id = $student->id;
            $sgpa7->Sem_1 = $request->Sem_1;
            $sgpa7->Sem_2 = $request->Sem_2;
            $sgpa7->Sem_3 = $request->Sem_3;
            $sgpa7->Sem_4 = $request->Sem_4;
            $sgpa7->Sem_5 = $request->Sem_5;
            $sgpa7->Sem_6 = $request->Sem_6;
            $sgpa7->Sem_7 = $request->Sem_7;
            $sgpa7->save();
            
        }
        else{
            //echo 8;
            $sgpa8 = new sgpa_8;
            $sgpa8->stud_id = $student->id;
            $sgpa8->Sem_1 = $request->Sem_1;
            $sgpa8->Sem_2 = $request->Sem_2;
            $sgpa8->Sem_3 = $request->Sem_3;
            $sgpa8->Sem_4 = $request->Sem_4;
            $sgpa8->Sem_5 = $request->Sem_5;
            $sgpa8->Sem_6 = $request->Sem_6;
            $sgpa8->Sem_7 = $request->Sem_7;
            $sgpa8->Sem_8 = $request->Sem_8;
            $sgpa8->save();
            
        }

        $exploded1 = explode(',',$request->mark);
        if(str_contains($exploded1[0],'pdf')){
            $ext = 'pdf';
        }
        $file_name = "user-".$user->id.".marksheet.".$ext;
        $lor_mark = new lor_mark;
        $lor_mark->stud_id = $student->id;
        $lor_mark->file_name = $file_name;
        $lor_mark->save();
        $path1 = public_path().'/files/lor_mark/'.$file_name;
            $decode1 = base64_decode($exploded1[1]);
            file_put_contents($path1,$decode1);
        
            if(Arr::exists($request, 'dmark')){
            $exploded2 = explode(',',$request->dmark);
            if(str_contains($exploded2[0],'pdf')){
                $ext = 'pdf';
            }
            $file_name = "user-".$user->id.".dmarksheet.".$ext;
            $lor_dmark = new lor_dmark;
            $lor_dmark->stud_id = $student->id;
            $lor_dmark->file_name = $file_name;
            $lor_dmark->save();
            $path2 = public_path().'/files/lor_dmark/'.$file_name;
                $decode2 = base64_decode($exploded2[1]);
                file_put_contents($path2,$decode2);
        }
         
          
        Auth::login($user,$student);

        return response()->json([$user,$student],200);

    }

   

    public function logout()
    {
        Auth::logout();

    }
}

