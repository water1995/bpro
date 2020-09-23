<template>
  <div class="container">

    <div class="card mt-3">
      <div class="card ">
      <div class="card-header text-center">LORs Issued</div>
      <div class="card-body">
   
        <div  class="row  justify-content-center mb-2" style="height:110px">
                  <div class="col-lg-5 border rounded px-0 mr-2" v-for="req in data" :key='req.id'>
                   <a href="javascript:void()" @click="nav(req.id,req.stud_id)"><div class="row  justify-content-center">
                  <div class="col-lg-3 mb-1  text-center px-0 mx-0 mt-1 ">
                      <img class="img" :src="'files\\profile_image\\'+req.profile_image" alt="your image" />
                      </div> 
                  <div class="col-lg-6  ml-4 mx-0 px-0  ">
                      <div class="row  justify-content-center mt-3 ">
                          <div class="col-lg-12  text-center h5 px-0 mx-0">{{req.name}}</div>
                          <div class="col-lg-12  text-center h5 px-0 mx-0">Done: {{req.Done}}</div>
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
      data:[]
    }

  },

  mounted(){

    this.app.req.get('auth/completed').then((response) => {
           console.log(response.data);
           /*response.data.forEach(element => {
             element.created_at = moment(element.created_at).format('DD-MM-YYYY'); 
           });*/
           this.data = response.data;
           this.data.forEach(courses =>{
             this.course.push(courses.courses);
           });
           
             });
},
/*watch:{
    "app.notifications.data":function(oldVal, newVal){
      if(newVal){
    this.app.req.get('auth/req').then((response) => {
           console.log(response.data);
           response.data.forEach(element => {
             element.created_at = moment(element.created_at).format('DD-MM-YYYY'); 
           });
           this.data = response.data;
           this.data.forEach(courses =>{
             this.course.push(courses.courses);
           });
             });
    }
  }
},
updated(){

    this.app.req.get('auth/req').then((response) => {
           console.log(response.data);
           response.data.forEach(element => {
             element.created_at = moment(element.created_at).format('DD-MM-YYYY'); 
           });
           this.data = response.data;
           this.data.forEach(courses =>{
             this.course.push(courses.courses);
           });
             });
},*/
methods:{
  nav(id,sid){
    this.app.reqID = id;
    this.app.studID = sid; 
    this.$router.push('/LorsIssued')
  }
}

}
</script>
</script>

<style>

</style>