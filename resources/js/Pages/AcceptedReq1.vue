<template>
  <div class="container">

    <div class="card mt-3">
      <div class="card ">
      <div class="card-header text-center">ACCEPTED REQUESTS</div>
      <div class="card-body">
   
        <div  class="row  justify-content-center mb-2" >
                  <div class="col-lg-5 border rounded px-0 mt-2 mr-2" v-for="req in data" :key='req.id'>
                    
                   <a href="javascript:void(0)" @click="nav(req.id,req.stud_id)">

                     <div class="row  justify-content-center">
                       <span v-show="req.noti != null ? req.noti.length > 0 : '' " class="badge badge-danger mt-2 ml-1" style="height:25px">
            {{req.noti != null ? req.noti.length : '   '}}</span>
                  <div class="col-lg-3 mb-1  text-center px-0 mx-0 mt-1 ">
                      <img class="img" :src="'files\\profile_image\\'+req.profile_image" alt="your image" />
                      </div> 
                  <div class="col-lg-6  ml-4 mx-0 px-0  ">
                      <div class="row  justify-content-center mt-3 ">
                          <div class="col-lg-12  text-center h5 px-0 mx-0">{{req.name}}</div>
                          <div class="col-lg-12  text-center h5 px-0 mx-0">Created: {{req.created_at}}</div>
                      </div>
                  </div>
                    </div></a>
                  </div>
        </div>
      </div>
      </div>
    </div>
  </div>
</template>

<script>
var moment = require('moment');
export default {
props:['app'],
data(){
    return{
      data:[],noti:[]
    }

  },

  mounted(){

    this.app.req.get('auth/req').then((response) => {
           console.log(response.data);
           response.data.forEach(element => {
             element.created_at = moment(element.created_at).format('DD-MM-YYYY'); 
           });
           this.data = response.data;
           this.count();
          
           
             });
},

methods:{
  count(){
    this.data.forEach(uni => {
               console.log(JSON.stringify(uni));
             this.app.notifications.forEach(element => {
               
                   if(element.data.reqID == uni.id || element.data.stud_id == uni.studID){
                   console.log('id '+JSON.stringify(element));
                   this.noti.push(element.id);
          }
          });
          if(this.noti.length != 0){
                     Object.assign(uni,{noti : this.noti});
                     //console.log(JSON.stringify(uni));
                   }
                   this.noti=[];
                   });

  },
  nav(id,sid){
    this.app.reqID = id;
    this.app.studID = sid;
    if(this.app.notifications!= null){
    this.app.notifications.forEach(element => {
      console.log(element.data);
      if(element.data.studID == this.app.studID || element.data.reqID == this.app.reqID){
        
        this.app.snotifications.push(element);
      }
    });
  }

    this.$router.push('/AcceptedReq');
  }
}

}
</script>

<style>

</style>