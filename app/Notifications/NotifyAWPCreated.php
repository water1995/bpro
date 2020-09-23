<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\BroadcastMessage;
use App\lor_prof_activity;

class NotifyAWPCreated extends Notification
{
    use Queueable;
    public $activity;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(lor_prof_activity $activity)
    {
        $this->activity = $activity->title;
        $this->reqID = $activity->req_id;
        //$this->rid = $rid;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database','broadcast'];
    }

    public function toBroadcast($notifiable)
    {
        return new BroadcastMessage([
            'activity' => $this->activity,
            'notifiable_id' => $notifiable->id
            //'rid' => $this->rid
        ]);
    }

    public function toDatabase($notifiable)
    {
        return[
            'activity' => $this->activity,
            'reqID' => $this->reqID
            //'rid' => $this->rid
        ];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->line('The introduction to the notification.')
                    ->action('Notification Action', url('/'))
                    ->line('Thank you for using our application!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
