@component('mail::message')
Dear Genevieve Xalxo,

Your request for transcripts has been received and the transcripts will be ready in 2 weeks for pickup.

@component('mail::button', ['url' => '/feedback'])
{{$url}}
@endcomponent

Regards,<br>
{{ config('app.name') }}
@endcomponent
