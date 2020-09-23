<template>
  <div class="container">

    <div class="card mt-3">
      <div class="card ">
      <div class="card-header text-center">UNIVERSITIES</div>
      <div class="card-body">
        <div class="row    justify-content-end">
          <div class="col-lg-2 mr-5 font-weight-bold text-center     ">ACCEPTED</div>
          <div class="col-lg-1 mr-5 font-weight-bold     float float-right">CHOSE</div>
        </div>
        <div v-for="(req,k) in data" :key='req.id' class="row align-items-center border rounded  justify-content-center mb-2" style="height:80px">
              
              <!--<div class="col-lg-3 px-0 ">
                    <div class="row mt-4 justify-content-center px-0">
                          <div class="col-lg-12 text-center px-0     h5">{{req.course}}</div>
                          <div class="col-lg-12 text-center px-0     h5">{{req.university}}</div>
                      </div>
                  </div>-->

                  <div class="col-lg-4  ">
                          <div class="   col-lg-12 text-center px-0 h5">{{req.course}}</div>
                  </div>

                  <div class="col-lg-4  ">
                          <div class="   col-lg-12 text-center px-0     h5">{{req.university}}</div>
                  </div>

                  <div class="col-lg-2 text-center    ">
                   <input class="   mt-2 mr-2 check-lg" :true-value="req" false-value="no"
                    v-model='accepted[k]'  type="checkbox" >
                  </div>

                  <div class="col-lg-2 text-center    ">
                   <input class=" mt-2 mr-2 radio-lg" v-model='chosen' name='chosen' type="radio" :value="req.id">
                  </div>

              </div>
              <div class="row justify-content-center mt-4"><button @click="onSubmit" class="btn btn-secondary" >SUBMIT</button></div>
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
      data:[],course:[],info:[],roa:'',done:false,accepted:[],chosen:''
    }

  },
  watch:{

  },

  created(){

    /*this.app.req.get('feed/'+this.token).then((response) => {
           console.log(response.data);
           this.data = response.data;
           });*/

    this.app.req.get('/feed/'+this.token).then((response) => {
           console.log(response.data);
           this.data = response.data;
           });
   
  },
  methods:{
   onSubmit(){
     
     const data = {
       accepted: this.accepted,
       chose:this.chosen
     }

     this.app.req.post('/send',data).then((response) => {
          console.log(response.data);
          if(response.data == 'success'){
            this.token = 0;
            this.$router.push('/login');
          }
     });

     
     
   }
  }
}
    
  
  

  


</script>

<style scoped>
.check-lg {
  width: 30px; 
  height: 30px;
  }
  .radio-lg{
    width: 15px; 
  height: 15px;
  }
</style>