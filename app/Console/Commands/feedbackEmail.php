<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\User;
//use App\Notifications\feedbackEmail;

class feedbackEmail extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'sfeedback:send';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'This Commandwill send an email to know whether student
                               got accepted into the university or not';

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
        $requests = DB::table('lor_requests')->select('lor_requests.id')->get();
        $deadline = DB::table('lor_universities')
        ->groupBy('req_id')->get(['req_id',DB::raw('MAX(Done)')]);

        
            foreach ($deadline as $dead) {
                $this->info(print_r($dead, true));
                $done = $dead["Done"];
                $interval = strtotime($done ,' + 152 days');
                $currDate =Carbon::now()->toDateString();
                if($interval == $currDate )
                {
                    $student = DB::table('lor_requests')
                    ->join('students','lor_requests.stud_id','=','students.id')
                    ->join('users','students.user_id','=','users.id')
                    ->select('students.user_id','users.name','users.email','students.id')
                    ->where('req_id','=',$dead['req_id'])->get();
            
                    $req_id = $dead['req_id'];
                    $user = User::findorfail($student['id']);
            $user->notify(new feedbackEmail($student,$req_id));


                }
            }
    }


    }
