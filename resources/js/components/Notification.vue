<template>
<div class="container text-center   " :style="{ minWidth: '22rem' }">
  <li :style="{ minWidth: '22rem' }" v-show="this.$route.path === '/StudentInfo' && app.student == null" class="nav-item dropdown text-center   " ><!--:style="{ minWidth: '18rem' }"-->
        <a  @click="markAsRead(app.snotifications)" class="nav-link dropdown-toggle" href="#"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Notifications<span v-show="app.snotifications != null ? app.snotifications.length > 0 : '' " class="badge badge-danger mt-2 ml-1">{{app.snotifications != null ? app.snotifications.length : '   '}}</span>
        </a>
        <div   v-click-outside="hide" class="border border-danger dropdown-menu text-center " aria-labelledby="navbarDropdown">
          <li v-for="notification in app.snotifications" :key='notification.id' class="border border-danger mt-3" :style="{ height: '3rem' }">


            <div v-show="notification.type == 'App\\Notifications\\notifyachievement' " class="h5" >
               {{notification.data.achievement}} Achievement created
            </div>

            <div v-show="notification.type == 'App\\Notifications\\NotifyAchievementEdited' " class="h5" >
               {{notification.data.achievement}} Achievement edited
            </div>

            <div v-show="notification.type == 'App\\Notifications\\NotifyAchievementDeleted' " class="h5" >
               {{notification.data.achievement}} Achievement deleted
            </div>

            <div v-show="notification.type == 'App\\Notifications\\NotifyCurricularCreated' " class="h5" >
               {{notification.data.activity}} Co-curricular edited
            </div>

            <div v-show="notification.type == 'App\\Notifications\\NotifyCurricularEdited' " class="h5" >
               {{notification.data.activity}} Co-curricular edited
            </div>

            <div v-show="notification.type == 'App\\Notifications\\NotifyCurricularDeleted' " class="h5" >
               {{notification.data.activity}} Co-curricular deleted
            </div>

            <div v-show="notification.type == 'App\\Notifications\\NotifyExtraCreated' " class="h5" >
               {{notification.data.extra}} extra-curricular created
            </div>

            <div v-show="notification.type == 'App\\Notifications\\NotifyExtraEdited' " class="h5" >
               {{notification.data.extra}} extra-curricular edited
            </div>

            <div v-show="notification.type == 'App\\Notifications\\NotifyExtraDeleted' " class="h5" >
               {{notification.data.extra}} extra-curricular deleted
            </div>

            <div v-show="notification.type == 'App\\Notifications\\NotifyNSSCreated' " class="h5" >
               {{notification.data.nss}} NSS activity created
            </div>

            <div v-show="notification.type == 'App\\Notifications\\NotifyNSSEdited' " class="h5" >
               {{notification.data.nss}} NSS activity edited
            </div>

            <div v-show="notification.type == 'App\\Notifications\\NotifyNSSDeleted' " class="h5" >
               {{notification.data.nss}} NSS activity deleted
            </div>

            <div v-show="notification.type == 'App\\Notifications\\NotifyAWPCreated' " class="h5" >
               {{notification.data.activity}} Activity with Prof created
            </div>

            <div v-show="notification.type == 'App\\Notifications\\NotifyAWPEdited' " class="h5" >
               {{notification.data.activity}} Activity with Prof edited
            </div>

            <div v-show="notification.type == 'App\\Notifications\\NotifyAWPDeleted' " class="h5" >
               {{notification.data.activity}} Activity with Prof deleted
            </div>

            <div v-show="notification.type == 'App\\Notifications\\NotifyCourseCreated' " class="h5" >
               {{notification.data.course}} course created
            </div>

            <div v-show="notification.type == 'App\\Notifications\\NotifyCourseEdited' " class="h5" >
               {{notification.data.course}} course edited
            </div>

            <div v-show="notification.type == 'App\\Notifications\\NotifyCourseDeleted' " class="h5" >
               {{notification.data.course}} course deleted
            </div>

            </li>

            <li v-for="reade in this.read" :key='reade.id' class="border border-warn mt-3" :style="{ height: '3rem' }">
            <div v-show="reade.type == 'App\\Notifications\\notifyachievement' " class="h5"  >
              {{JSON.parse(reade.data).achievement }} Achievement created
            </div>
            <div v-show="reade.type == 'App\\Notifications\\NotifyAchievementEdited' " class="h5"  >
              {{JSON.parse(reade.data).achievement }} Achievement edited
            </div>
            <div v-show="reade.type == 'App\\Notifications\\NotifyAchievementDeleted' " class="h5"  >
              {{JSON.parse(reade.data).achievement }} Achievement deleted
            </div>
            <div v-show="reade.type == 'App\\Notifications\\NotifyCurricularCreated' " class="h5"  >
              {{JSON.parse(reade.data).activity }} Co-curricular Activity created
            </div>
            <div v-show="reade.type == 'App\\Notifications\\NotifyCurricularEdited' " class="h5"  >
              {{JSON.parse(reade.data).activity }} Co-curricular Activity edited
            </div>
            <div v-show="reade.type == 'App\\Notifications\\NotifyCurricularDeleted' " class="h5"  >
              {{JSON.parse(reade.data).activity }} Co-curricular Activity deleted
            </div>
            <div v-show="reade.type == 'App\\Notifications\\NotifyExtraCreated' " class="h5"  >
              {{JSON.parse(reade.data).extra }} Extra-curricular Activity created
            </div>
            <div v-show="reade.type == 'App\\Notifications\\NotifyExtraEdited' " class="h5"  >
              {{JSON.parse(reade.data).extra }} Extra-curricular Activity edited
            </div>
            <div v-show="reade.type == 'App\\Notifications\\NotifyExtraDeleted' " class="h5"  >
              {{JSON.parse(reade.data).extra }} Extra-curricular Activity deleted
            </div>
            <div v-show="reade.type == 'App\\Notifications\\NotifyNSSCreated' " class="h5"  >
              {{JSON.parse(reade.data).achievement }} NSS Activity created
            </div>
            <div v-show="reade.type == 'App\\Notifications\\NotifyNSSEdited' " class="h5"  >
              {{JSON.parse(reade.data).achievement }} NSS Activity edited
            </div>
            <div v-show="reade.type == 'App\\Notifications\\NotifyNSSDeleted' " class="h5"  >
              Activity with prof {{JSON.parse(reade.data).achievement }} NSS Activity deleted
            </div>
            <div v-show="reade.type == 'App\\Notifications\\NotifyAWPCreated' " class="h5"  >
              Activity with prof {{JSON.parse(reade.data).activity }}  created
            </div>
            <div v-show="reade.type == 'App\\Notifications\\NotifyAWPEdited' " class="h5"  >
              Activity with prof {{JSON.parse(reade.data).activity }}  edited
            </div>
            <div v-show="reade.type == 'App\\Notifications\\NotifyAWPDeleted' " class="h5"  >
              Activity with prof {{JSON.parse(reade.data).activity }}  deleted
            </div>
            <div v-show="reade.type == 'App\\Notifications\\NotifyCourseCreated' " class="h5" >
               {{JSON.parse(reade.data).course}} course created
            </div>

            <div v-show="reade.type == 'App\\Notifications\\NotifyCourseEdited' " class="h5" >
               {{JSON.parse(reade.data).course}} course edited
            </div>

            <div v-show="reade.type == 'App\\Notifications\\NotifyCourseDeleted' " class="h5" >
               {{JSON.parse(reade.data).course}} course deleted
            </div>
            </li>
        </div>
      </li>

      <li :style="{ minWidth: '22rem' }" v-show="app.student != null" class="nav-item dropdown text-center   " ><!--:style="{ minWidth: '18rem' }"-->
        <a @click="markAsRead(app.notifications)" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Notifications<span v-show="app.notifications != null ? app.notifications.length > 0 : '' " class="badge badge-danger mt-2 ml-1">{{app.notifications != null ? app.notifications.length : '   '}}</span>
        </a>
        <div class="dropdown-menu text-center         " aria-labelledby="navbarDropdown">
          <!--{{app.notifications.data.length}}-->
          <li v-for="notification in app.notifications" :key='notification.id' class="mt-3        " :style="{ height: '3rem' }">
            <div v-show="notification.type == 'App\\Notifications\\NotifyStudentAccepted' "  >
               {{notification.data.prof }} accepted your LOR request
            </div>
            <div v-show="notification.type == 'App\\Notifications\\NotifyStudentDeclined' "  >
               {{notification.data.prof }} declined your LOR request
            </div>
            <!--<div v-show="notification.type == 'App\\Notifications\\NotifyStudLorSubmitted' "  >
               {{notification.data.prof}}  has submitted 
            </div>-->
            </li>
            <li v-for="reade in this.read" :key='reade.id' class="mt-3" :style="{ height: '3rem' }">
            <div v-show="reade.type == 'App\\Notifications\\NotifyStudentAccepted' " class="h5"  >
              {{JSON.parse(reade.data).prof }} accepted your LOR request
            </div>
            <div v-show="reade.type == 'App\\Notifications\\NotifyStudentDeclined' " class="h5"  >
              {{JSON.parse(reade.data).prof }} declined your LOR request
            </div>
            </li>
            
        </div>
         
            </li>

     
</div>
</template>

<script>
import ClickOutside from 'vue-click-outside'
export default {
  props:['app'],
  data(){
    return{
      read:[],ids:[],userId:'',nid:false
    }
  },
   
  
  methods:{
    markAsRead:function(notifications){
      
      console.log(JSON.stringify(notifications));
      if(this.app.snotifications != null){
      (this.app.snotifications).forEach(element => {
          
          if(!(this.ids.includes(element['id']))){
            this.nid = true;
          this.ids.push(element['id']);
          }
        });
      }

      if(this.app.notifications != null){

      (this.app.notifications).forEach(element => {
        console.log(JSON.stringify(element));
          if(!(this.ids.includes(element['id']))){
            this.nid = true;
          this.ids.push(element['id']);
          }
        });
      }
      
      var data = {
      data: this.ids
      }
      
      
      this.app.req.post('auth/notification/read',data).then(response => {
        this.read = [];
        //this.read = response;
        console.log(JSON.stringify(response.data));
        response.data.forEach(element => {
         // console.log('element.data.reqID:'+element.data.reqID+'='+'this.app.reqID:'+this.app.reqID+' '+(element.data.reqID == this.app.reqID));
         /*this.read.forEach(elementd =>{
           if(element.id == elementd.id){
             this.dip = true;
           }
         });*/

          
           console.log(true);
          if(element.type == 'App\\Notifications\\NotifyCourseEdited'||
                element.type =='App\\Notifications\\NotifyCourseCreated'||
                 element.type == 'App\\Notifications\\NotifyCourseDeleted'){
           console.log(JSON.stringify(element));
           console.log(JSON.parse(element.data).uni);
          if(JSON.parse(element.data).course == this.app.info[8].course && JSON.parse(element.data).uni == this.app.info[8].university && JSON.parse(element.data).reqID == this.app.reqID){
            
            this.read.push(element);
          }
          }
          else if(JSON.parse(element.data).reqID == this.app.reqID || JSON.parse(element.data).studID == this.app.studID){
            console.log(JSON.stringify(element));
            
            this.read.push(element);
          }
          
         
          
        });
        

      });

     this.app.snotifications.splice(0,this.app.snotifications.length);
     this.app.notifications.splice(0,this.app.notifications.length);
    },

    
  },

  

}
</script>

<style>
.navbar .dropdown-menu.show {
    min-width: inherit;
    display: inline-block;
}
</style>