<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\roa_data;
use App\roa_criteria;
use App\roa_recommend;

class roa extends Controller
{
    public function show($rid){

        $roa = array();
        $data = DB::table("roa_datas")
        ->join('roa_criterias','roa_criterias.req_id','=','roa_datas.req_id')
        ->join('roa_recommends','roa_recommends.req_id','=','roa_criterias.req_id')
        ->where('roa_datas.req_id','=',$rid)
        ->select('roa_datas.years','roa_datas.capacity','roa_datas.category',
        'roa_datas.other_category','roa_datas.interests',
        'roa_criterias.Intellectual_Level','roa_criterias.Written_Communication',
        'roa_criterias.Oral_Communication',
        'roa_criterias.Imagination_Creativity',
        'roa_criterias.Work_Ethic',
        'roa_criterias.Character',
        'roa_criterias.Class_Rank',
        'roa_criterias.Teaching_Ability',
        'roa_recommends.recommend_highly',
        'roa_recommends.recommend',
        'roa_recommends.reservations',
        'roa_recommends.not_recommend',
        'roa_datas.statement')
        ->get();

        return response($data,200);

    }

    public function StoreData(Request $request){

        $data = new roa_data;
        $data->req_id =  $request->id;
        $data->years =  $request->years;
        $data->capacity =  $request->capacity;
        $data->category =  $request->category;
        $data->other_category =  $request->OtherCategory;
        $data->interests =  $request->interests;
        $data->statement =  $request->statement;
        if($data->save()){
            DB::update('update lor_requests set roa= ? where id = ?',[true,$request->id]);
            echo "Record updated successfully.";
        }
    }

    public function StoreCriteria(Request $request){

        $data = new roa_criteria;
        $data->req_id =  $request->id;
        $data->Intellectual_Level =  $request->intellectual;
        $data->Written_Communication =  $request->written;
        $data->Oral_Communication =  $request->oral;
        $data->Imagination_Creativity =  $request->imagination;
        $data->Work_Ethic =  $request->ethic;
        $data->Character =  $request->character;
        $data->Class_Rank =  $request->rank;
        $data->Teaching_Ability =  $request->ability;
        $data->save();
    }

    public function StoreRecommend(Request $request){

        $data = new roa_recommend;
        $data->req_id =  $request->id;
        $data->recommend_highly =  $request->RecommendHighly;
        $data->recommend =  $request->Recommend;
        $data->reservations =  $request->Reservation;
        $data->not_recommend =  $request->NotRecommend;
        $data->save();
    }

    
}
