<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class lor_request extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'stud_id','professor','status','roa','Done'
   ];
}
