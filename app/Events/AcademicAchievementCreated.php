<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Http\Request;

class AcademicAchievementCreated extends ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;
    public $request,$pid;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(Request $request,$pid)
    {
        $this->data =[
        $this->Achievement = $request,
        $this->pid = $pid
        ];
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new PrivateChannel('AAC.'.$this->data);
        //return [];
        //return new PrivateChannel('channel-name');
    }
}
