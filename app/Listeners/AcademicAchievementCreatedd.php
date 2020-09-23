<?php

namespace App\Listeners;

use App\Events\AcademicAchievementCreated;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use App\User;

class AcademicAchievementCreatedd
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  AcademicAchievementCreated  $event
     * @return void
     */
    public function handle(AcademicAchievementCreated $event)
    {
        /*foreach($event->pid as $id){
        User::find($id->id)->notify(new notifyachievement($event->Achievement));
        }*/
    }
}
