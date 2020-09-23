<template>
  <div class="container">

    <div class="card mt-3">
      <div class="card ">
      <div class="card-header text-center">ACCEPTED REQUESTS</div>
      <div class="card-body">
        <div v-for="req in data" :key='req.id' class="row border rounded  justify-content-center mb-2" style="height:110px">
                  
                  <div class="col-lg-1 text-center px-0 mx-0 mt-1 ">
                      <img class="img" :src="'files\\profile_image\\'+req.profile_image" alt="your image" />
                      </div> 
                  <div class="col-lg-2 ml-4 mx-0 px-0  ">
                      <div class="row justify-content-center mt-4  ">
                          <div class="col-lg-12 text-center     h5 px-0 mx-0">{{req.name}}</div>
                          <div class="col-lg-12 text-center     h5 px-0 mx-0">{{req.yog}}</div>
                      </div>
                  </div>
                  <div class="col-lg-3 px-0 ">
                    <div class="row mt-4 justify-content-center px-0">
                          <div class="col-lg-12 text-center px-0     h5">{{req.course}}</div>
                          <div class="col-lg-12 text-center px-0     h5">{{req.university}}</div>
                      </div>
                  </div>
                  <!--<div class="col-lg-2 px-0          ">
                    <div class="row justify-content-center mt-4 pt-1           ">
                      <div class="col-lg-12 text-center px-0     h5">{{req.deadline}}</div>
                          <div class="col-lg-12 text-center px-0  mt-1   h5"><countdown :date="req.deadline"></countdown></div>
                          <countdown :date="req.deadline"></countdown>
                      </div>
                  </div>-->
                    <div class="col-lg-2 px-0           ">
                    <div class="row justify-content-centerx ">
                      <div class="col-lg-12 px-0 text-center mt-2"><a class="h5 text-secondary" href='#' @click.prevent="refq()">REFERENCE QUESTIONS</a></div>
                          <div class="col-lg-12 text-center mt-2 px-0"><a class="h5" href='#' @click.prevent="studInfo(req.req_id,req.university,req.course)">STUDENT-INFO</a></div>
                          <!--<RefQuestions ref="refq"></RefQuestions>-->
                          </div>
                    </div>
                    
                  <div class="col-lg-1 mt-3 ml-2 pt-2 pl-2">
                    <button v-show='req.Done == "0000-00-00"' @click="completed(req.id)" class="mt-2 btn btn-danger btn-sm" style="width:70px">DONE</button>
                    <i v-show='req.Done != "0000-00-00"' style="font-size: 50px;color:green" class="fas fa-check-circle"></i>
                      </div>
                  
              </div>
        </div>
      </div>
      </div>
    
    </div>
</template>

<script>
import countdown from '../components/countdown';
/*import RefQuestions from '../components/RefQuestions';*/
export default {
props:['app'],
components:{ countdown},
  data(){
    return{
      data:[],course:[],info:[],roa:'',done:false
    }

  },
  watch:{

  },

  created(){

    this.app.req.get('auth/completedLor/'+this.app.reqID).then((response) => {
           console.log(response.data);
           this.data = response.data;
           this.data.forEach(element => {
              this.roa = element.roa;
           });
           
             });
   
  },
  methods:{
    refq(){
      if(this.roa != 1){
      this.$router.push('/RefQuestions');
      }
      else{
        this.$router.push('/RefData');
      }
    
    },
    studInfo(id,uni,course){
      this.app.req.get('auth/cgpi/'+id).then((response) => {
            console.log(response.data);
            response.data[8].forEach(element => {
              if(element.university == uni && element.course == course){
                response.data[8] = element;
              }
              
            });
            this.app.info = response.data;
      this.$router.push('/StudentInfo');
    });
    },
}
}
</script>

<style>

</style>