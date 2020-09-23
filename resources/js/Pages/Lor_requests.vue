<template>
  <div class="container">
      <div class="card ml-5">
      <div class="card-header text-center">LOR REQUESTS</div>
      <div class="card-body">
          <div v-for="(req,k) in requests" :key='req.id'>
              <div class="row justify-content-center">
                  
                  <div class="col-lg-2 mt-2 h4">
                      <img class="img" :src="'files\\profile_image\\'+req.profile_image" alt="your image" />
                      </div> 
                  <div class="col-lg-5 h4 mt-4">
                      <div class="row justify-content-center ">
                          <div class="col-lg-12 text-center">{{req.name}}</div>
                          <div class="col-lg-12 text-center"><a href='#' @click.prevent="send(req.id,k)">Student-info</a></div>
                          <StudentInfo v-show='showm' ref="info" :rdip="req.diploma" :data="data" ></StudentInfo></div>
                  </div>
                  <div class="col-lg-2 mt-4 float-right"><button @click.prevent="accept(1,req.id,req.user_id,k)" class="btn btn-success" type='submit'>ACCEPT</button></div>
                  <div class="col-lg-2 mt-4 float-right mx-0"><button @click.prevent="accept(2,req.id,req.user_id,k)" class="btn btn-danger" type='button'>DECLINE</button></div>
              </div>
          </div>
      </div>
      </div>
      
     
          
       
   
      
  </div>
</template>

<script>
import StudentInfo from '../components/StudentInfo';

export default {
    name:'LorRequests',
    props:['app'],
    components:{
        StudentInfo
    },
    data(){
        return{
            requests:[],sgpi:[],showm:false,fin:false,dcgpi:[],data:[]
        }
    },
  
    mounted(){
       this.app.req.get('auth/freq').then((response) => 
       {
           console.log(response.data);
           this.requests = response.data
           });
    },
    methods:{
        nav(){
            this.$router.push("/StudentInfo");
        },
        send(id,k) {
            console.log(id);
            console.log('k:'+k);
            const cid = id;
            this.app.req.get('auth/cgpi/'+cid).then((response) => {
            console.log(response.data);
            this.data = response.data;
            console.log(this.data);
               this.data.forEach(element => {
               console.log(element);
               });
            
            this.showm = true;
            console.log(this.requests.length);
           this.$refs.info[k].show();
        })
            
        },
        

      accept(d,id,uid,index){
          const data={
              accept:d,
              id:id,
              uid:uid
          } 
          console.log(data);
          
          
          this.app.req.post('auth/upd',data).then(response => {
              this.requests.splice(index,1);
          }).catch(error => {
            this.errors.push(error.response.data.error);
            });

      }
    },

}
</script>

<style>
.img{
  width: 100px;
  height: 100px;
}
</style>