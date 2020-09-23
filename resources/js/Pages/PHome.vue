<template>
<div class="container row  justify-content-center">
   <div class="card mx-0" style="width: 50rem;">
      <div class="card-header text-center">DEADLINES</div>
      <div class="card-body">
         <div v-for="req in data" :key='req.university' class="row border rounded  justify-content-center mb-2" style="height:110px">
                  
                  <div class="col-lg-2 text-center px-0 mx-0 mt-1          ">
                      <img class="img" :src="'files\\profile_image\\'+req.profile_image" alt="your image" />
                      </div> 
                  <div class="col-lg-3 mx-0 px-0  ">
                      <div class="row justify-content-center mt-4  ">
                          <div class="col-lg-12 text-center     h5 px-0 mx-0">{{req.name}}</div>
                          <div class="col-lg-12 text-center     h5 px-0 mx-0">{{req.yog}}</div>
                      </div>
                  </div>
                  <div class="col-lg-4 px-0  ">
                    <div class="row mt-4 justify-content-center px-0">
                          <div class="col-lg-12 text-center px-0     h5">{{req.course}}</div>
                          <div class="col-lg-12 text-center px-0     h5">{{req.university}}</div>
                      </div>
                  </div>
                  <div class="col-lg-3 px-0   ">
                    <div class="row justify-content-center mt-3 pt-1           ">
                      <div class="col-lg-12 text-center px-0     h5">{{req.deadline}}</div>
                          <div class="col-lg-12 text-center px-0  mt-1   h5"><countdown :date="req.deadline"></countdown></div>
                          <!--<countdown :date="req.deadline"></countdown>-->
                      </div>
                  </div>
         </div>
      </div>
   </div>
   
</div>
  
</template>

<script>
import countdown from '../components/countdown';
export default {
   props:['app'],
components:{ countdown},
  data(){
    return{
      data:[],course:[],info:[],userId:''
    }

  },
 

  mounted(){
  
      this.app.req.get('auth/dead').then((response) => {
           console.log(response.data);
           this.data = response.data;
           this.data.forEach(courses =>{
             this.course.push(courses.courses);
           });
              if(this.app.user.id != null){
    this.userId = this.app.user.id;
    console.log('echou');
    let prevID = '';
    Echo.private('App.User.' + this.app.user.id)
    .notification((notification) => {
      console.log('notiu');
      console.log('prevID:'+prevID);
      console.log('notification.id:'+notification.id);
      if(notification.id != prevID){
        
     let unread = {id:notification.id,type:notification.type,notifiable_id:notification.notifiable_id,data:{achievement:notification.achievement}};
     console.log(unread);
     prevID = notification.id;

     
        this.app.notifications.push(unread);
     }
      
      
      notification.forEach(element => {
        console.log('notification:'+element.id);
      });
      
      
      
        
    });
             }});
       }
    }
  
</script>

<style>
/*:-moz-first-nodepublic function acceptedRequest(){
        
        $data = array();
        $user = Auth::user();
        $prof = DB::table("users")->whereIn('id',explode(",",$user->id))->value("name");
        $requests =DB::table("lor_universities")
        ->join('lor_requests','lor_universities.req_id','=','lor_requests.id')
        ->join('students','lor_requests.stud_id','=','students.id')
        ->join('users','students.user_id','=','users.id')
        ->where('lor_requests.professor','=','Prof.'.$prof)->where('lor_requests.status','=','1')
        ->select('lor_requests.id','users.profile_image','students.yog','students.name','lor_universities.course','lor_universities.university','lor_universities.deadline')
        ->orderBy('lor_universities.deadline','asc')
        ->get();

        $result = json_decode(json_encode($requests),true);
        return response($result,200);

    }*/
</style>