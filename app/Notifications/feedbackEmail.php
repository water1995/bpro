<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Crypt;

class feedbackEmail extends Notification
{
    use Queueable;
    protected $message;
    protected $user;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($feedback,$name)
    {
        /*$this->userID = $student[0]->user_id;
        $this->username = $student[0]->name;
        $this->email = $student[0]->email;
        $this->studID = $student[0]->id;
        $this->reqID = $req_id;
        //$this->user = $user;
        $this->student = $student[0];*/
        $this->token = $feedback;
        $this->student = $name;
       
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        //$this->info($this->token);
        $url = URL::signedRoute('feedback',['rid' => $this->token]);
        //['pk' => $this->token]
        

        return (new MailMessage)->markdown('mails.feedbackEmail',[
            'student' => $this->student,
            'url' => $url
        ]);
        $this->info('tk: '.$this->token);
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
