<template>
  <div>
      <navbar :app="this"  class="mb-2"></navbar><!--:app="this"-->
      <spinner v-if="loading"></spinner>
      <div  v-else-if="initiated">
      <router-view  :app="this"/>
      </div>
  </div>
  </template>
</template>

<script>
import Navbar from './components/Navbar';
export default {
    name:"app",
    components:{
        Navbar,
       // Register
    },
    /*pages:{
        Register
    },*/
    data(){
        return{
            user:null,
            student:null,
            lreq:null,
            areq:null,
            reqID:null,
            studID:null,
            prof:null,
            info:null,
            notifications:null,
            snotifications:[],
            loading:false,
            initiated:false,
            req:axios.create({
                baseUrl: BASE_URL
            }),
            userId:null
        }
    },
    mounted(){ 
        this.init();
       
   
  
    },
    methods:{
        init()
        {
            //this.loading = true;
            console.log(this.$route.rid);

            /*this.req.get('auth/init').then(response =>  {
                console.log(response);
                if(response.data == ""){
                    console.log(1);
                    this.user = null;
                    this.loading =false;
                this.initiated = true;
                this.$router.push('/login')
                    //if (this.$router.path !== '/login') {
    
//}
                }
                else{
                    console.log(2);
                this.user = response.data[0];
                
                //console.log(this.user);
                //console.log(response.data[1][0]);
                this.student = response.data[1][0];
                this.lreq = response.data[2];
            
                //console.log(this.student)
                this.loading =false;
                this.initiated = true;
            }
            });*/
        }

    }

}

</script>

<style>

</style>
