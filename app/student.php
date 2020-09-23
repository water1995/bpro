<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\Student as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Student extends Model
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
         'user_id','name','branch','studID','dob','sem','mobile',
    ];

    public function role() {
        return $this->belongsTo(role::class, 'role_id');
    }

    public function user() {
        return $this->belongsTo('App\User');
    }

}
