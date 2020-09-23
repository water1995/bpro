<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class LorReqCompleted extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'Request:completed';

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
        $deadline = DB::table('lor_universities')
        ->groupBy('req_id')->get(['req_id',DB::raw('MAX(Done) as Done')]);

        $this->info($deadline);
            foreach ($deadline as $dead) {
                $this->info(print_r($dead, true));

                //Log::info($dead);
                $done = $dead->Done;
                $this->info('done '.$done);
                $interval =date('Y-m-d', strtotime($done.' + 10 days'));
                $this->info($interval);
                $this->info('interval '.$interval);
                $currDate =Carbon::now()->toDateString();
                $this->info('curr '.$currDate);
                if($interval == $currDate)
                {
                    DB::update('update lor_requests set Done= ? where id = ?',[$dead->Done,$dead->req_id]);
                }
            }
    }
}
