@component('mail::message')
Dear {{$student}},<br>
We would like to know which universities you got accepted into and your choice.<br>
 Would greatly appreciate it.<br>




<a href="{{$url}}">{{$url}}</a><br>
<br>
Regards,<br>
{{ config('app.name') }}
@endcomponent
