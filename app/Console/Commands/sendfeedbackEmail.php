<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\User;
use App\Student;
use App\feedback;
use App\Notifications\feedbackEmail;
use Illuminate\Support\Facades\Log;

class sendfeedbackEmail extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'feedback:send';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
       
        $this->info('1');
        $deadline = DB::table('lor_universities')
        ->groupBy('req_id')->get(['req_id',DB::raw('MAX(Done) as Done')]);

        $this->info($deadline);
            foreach ($deadline as $dead) {
                $this->info(print_r($dead, true));

                //Log::info($dead);
                $done = $dead->Done;
                $this->info('done '.$done);
                $interval =date('Y-m-d', strtotime($done.' + 152 days'));
                $this->info($interval);
                $this->info('interval '.$interval);
                $currDate =Carbon::now()->toDateString();
                $this->info('curr '.$currDate);
                if($interval == $currDate )
                {
                    $student = DB::table('lor_requests')
                    ->join('students','lor_requests.stud_id','=','students.id')
                    ->join('users','students.user_id','=','users.id')
                    ->select('students.user_id','users.name','users.email','students.id')
                    ->where('lor_requests.id','=',$dead->req_id)->get();

                    $feedback = new feedback();
                    $feedback->stud_id = $student[0]->id;
                    $feedback->req_id = $dead->req_id;
                    $feedback->token = str_random();
                    $feedback->save();
                   
                    $this->info($student);
                    $req_id = $dead->req_id;
                    $user = User::findorfail($student[0]->user_id);
                    $feed = DB::table("feedback")
                    ->where('feedback.req_id','=',$req_id)
                    ->select('feedback.token')
                    ->get();
                    $this->info($feed[0]->token);
                    $tk = $feed[0]->token;
                    //$user = 'c0da91026c-db6cc0@inbox.mailtrap.io';
                    $user->notify(new feedbackEmail($tk,$student[0]->name));


                }
            }
    }
}
