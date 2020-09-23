<template>
  <div class="container-fixed px-0">
    <div class="container-fixed border" style="padding-top:10px">
    <h1 class="text-center font-weight-bold display-4" style="color:#CD4124;">DBIT</h1>
	</div>
      <nav class="navbar navbar-expand-lg navbar-dark pt-0 pb-0" style="padding-top:10px;background-color:#152266;">
  <!--background-color:#152266;-->

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav  mr-0" >
    <ul v-show="app.user ? app.user.role_id == 2 :app.user != null " class="navbar-nav ml-auto  mr-0 float-left">
  
  <li class="nav-item text-center text-white mr-5 mt-1 "><router-link  to="/PHome" class="text-white" >DEADLINES</router-link></li><!--class="rtext text-center font-weight-bold list-group-item list-group-item-action"-->
  
  <li class="nav-item  text-center  text-white mr-5 mt-1" > <router-link  to="/LorRequests" class="text-white" >LOR Requests</router-link><span v-show=" app.rnoti != null ? app.noti.length > 0 && !(this.$route.path === '/StudentInfo'): false" class="badge badge-danger mt-2">{{app.rnoti != null ? app.rnoti.length : '   '}}</span></li>
  <li class="nav-item  text-center  text-white mr-5 mt-1 " > <router-link  to="/AcceptedReq1" class="text-white" >Accepted Requests</router-link> <span v-show=" app.notifications != null ? app.notifications.length > 0 && !(this.$route.path === '/StudentInfo'): false" class="badge badge-danger mt-2">{{app.notifications != null ? app.notifications.length : '   '}}</span></li>
  <li class="nav-item  text-center  text-white mr-5 mt-1" > <router-link  to="/LorsIssued1" class="text-white" >LORs Issued</router-link></li>
  

</ul>
    </ul>
    <ul class="navbar-nav  mr-0" >
    <ul v-show="app.user ? app.user.role_id == 1 : app.user != null " class="navbar-nav ml-auto  mr-0 float-left">
  <li class="nav-item  text-center mr-5  " ><router-link class="text-white" to="/"  >HOME</router-link></li>
  <li v-show="app.lreq == true" class="nav-item text-center mr-5"><router-link class="text-white" to="/Details"  >Edit Details</router-link></li><!--class="rtext text-center font-weight-bold list-group-item list-group-item-action"-->
    <li v-show="app.lreq == true" class="nav-item text-center mr-5"><router-link class="text-white" to="/EditRequest"  >Edit Your Requests</router-link></li>

  <li class="nav-item  text-center mr-5  " ><router-link class="text-white" to="/lorform"  >Request For LOR</router-link></li>
  <li class="nav-item  text-center mr-5 " ><router-link class="text-white" to="/transcriptform"  >Request For Transcript</router-link></li>
  
</ul>
    </ul>

    <ul class="navbar-nav  mr-0" >
    <ul v-show="app.user ? app.user.role_id == 3 : app.user != null " class="navbar-nav ml-auto  mr-0 float-left">
  <li class="nav-item  text-center mr-5  " >
    <router-link  to="/AdmHome" class="text-white rtext text-center font-weight-bold " >
    TRANSCRIPT REQUESTS</router-link></li>
    <li class="nav-item  text-center mr-5  "><router-link  to="/CompletedTranscripts" class="text-white rtext text-center font-weight-bold " >
   COMPLETED TRANSCRIPTS</router-link></li>
  <li><router-link  to="/AcceptedStudents" class="text-white rtext text-center font-weight-bold " >
   DATA ANALYSIS</router-link></li>

</ul>
    </ul>


   <ul class="navbar-nav ml-auto border border-dark mr-0" >
      <Notification v-show='app.user' class="ml-auto" :app='app' :style="{ minWidth: '25rem' }"></Notification>
       <li class="nav-item dropdown text-center " :style="{ minWidth: '18rem' }">
        <a  class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          {{ app.user ? app.user.name: 'Account'}}
        </a>
        <div class="dropdown-menu text-center  border border-dark" aria-labelledby="navbarDropdown">
          <div v-if="!app.user">
          <router-link to="/login" class="dropdown-item" >LOGIN</router-link>
           <router-link to="/register" class="dropdown-item" >REGISTER</router-link>
          </div>
          <div v-else>
          <a  @click.prevent="logout" href="javascript:;" class="dropdown-item">LOGOUT</a>
          </div>
          
        </div>
      </li>
     
       </ul>
  </div>
</nav>

 
</div>
</template>

<script>
import LeftNav from '../components/LeftNav';
import Notification from '../components/Notification';
export default {
    name:'navbar',
    props: ['app'],
    components:{
        LeftNav,Notification
    },
    data(){
        return{
          userId:''
        }
        
    },
    /*updated(){
       if(this.app.user.id != null){
    this.userId = this.app.user.id;
    console.log('echou');
    
    Echo.private('App.User.' + this.app.user.id)
    .notification((notification) => {
      console.log('notiu');
        console.log(notification);
    });
    
      }
    },
    /*mounted(){
       if(this.app.user.id != null){
    this.userId = this.app.user.id;
    console.log('echom');
    Echo.private('App.User.' + this.app.user.id)
    .notification((notification) => {
      console.log('notim');
        console.log(notification);
    });
      }
    },*/
    

    methods: {
        logout()
        {
            this.app.req.get('auth/logout').then(() =>{
              //this.app.user.role_id = 0;
                this.app.user = null;
                this.app.snotifications =[];
                this.app.student = null;
                this.app.lreq = null;
                this.$router.push('/login');
            });

        }
    }

};
</script>

<style>
a{
  font-size: 20px;
}
router-link{
  font-size: 10px;
}
.navbar .dropdown-menu.show {
    min-width: inherit;
    display: inline-block;
}
</style>