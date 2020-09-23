<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;

use Illuminate\Http\Request;

class graphs extends Controller
{
    public function colacceptstud(){

        $college = DB::table('acceptedunis')
        ->select('acceptedunis.university', DB::raw('count(*) as total'))
        ->groupBy('acceptedunis.university')
        ->having('total','>','1')
        ->orderBy('total','DESC')
        ->get();

        return response($college);
    }

    public function optCourse(){

        $course = DB::table('lor_universities')
        ->select('lor_universities.course', DB::raw('count(*) as total'))
        ->groupBy('lor_universities.course')
        ->having('total','>','1')
        ->orderBy('total','DESC')
        ->get();

        return response($course);
    }

    public function accptUni(){

        $college = DB::table('acceptedunis')
        ->select('acceptedunis.course','acceptedunis.university', DB::raw('count(*) as total'))
        ->groupBy('acceptedunis.university')
        ->having('total','>','1')
        ->orderBy('total','DESC')
        ->get();

        return response($college);
    }

    public function acptGre(){

        $college = DB::table('acceptedunis')
        ->join('lor_requests','acceptedunis.req_id','=','lor_requests.id')
        ->join('students','lor_requests.stud_id','=','students.id')
        ->select('acceptedunis.course','acceptedunis.university','students.GRE', DB::raw('count(*) as total'))
        ->groupBy('students.GRE')
        ->having('total','>','1')
        ->orderBy('total','DESC')
        ->get();

        return response($college);
    }

    
}
