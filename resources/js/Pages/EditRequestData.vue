 
<template>
<div class="container">
  <div class="container ml-3">
    
    <div class="row">
        <div class="col-lg-3 px-0 mb-2">
        <vSelect v-model="detail" @input="mode" :options="details"></vSelect>
        </div>
    </div>

    <div v-show="showa" class="row">
        <div class="col-lg-3 px-0">
          <button @click="daaad" class="btn btn-success btn-md">ADD</button>
        </div>
    </div>
    
    
    <EditProfActivity ref='epa' :cud='this.cud' :app='this.app' 
    :cosedit.sync='cosedit' :course.sync='course' :activities.sync='activities' 
    :aap.sync='aap' :ap.sync='ap' :apedit.sync='apedit'  
     :detail="detail" :achievement.sync="achievement" 
    v-on:detail="AddData($event)"></EditProfActivity>

   <nav class=" pb-0    " aria-label="...">
  <ul class="mt-4 mb-0     pagination pagination-sm">
    <li v-bind:class="[{disabled: !pagination.prev_page_url}]" class="page-item">
      <a @click="fetchdata(pagination.prev_page_url)" class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
    </li>

     <li class="page-item disabled"><a class="page-link text-dark" href="#">Page {{pagination.current_page}} of {{pagination.last_page}}</a></li>
    
    <li v-bind:class="[{disabled: !pagination.next_page_url}]" class="page-item">
      <a @click="fetchdata(pagination.next_page_url)" class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>
<div class="row justify-content-center mt-1">
    <div  class="card border-secondary mt-2 col-lg-5 px-0 mr-3" style="width: 18rem;" v-for="data in activities" :key="data.id">
       
        <h5 class="card-header h5 pl-1">{{data.title}}</h5>
        <h6 class="ml-1 mt-1">{{data.professor}}</h6>
        <h6 class="ml-1 mt-1   ">{{data.activity}}</h6>
        <h6 v-show="data.marks!=0" class="ml-1 mt-1 mt-auto float-bottom   ">Marks : {{data.marks}}</h6>
        <h6 v-show="data.file_name!= null" class="ml-1 mt-1 mt-auto float-bottom   ">File : <a href='#' @click.prevent="dp(data.file_name)">{{data.file_name}}</a></h6>
        
        <div class="row ml-1 mt-1 mb-1 mt-auto    ">
        <div class="col-lg-3"><button @click="editData(data)" class=" btn btn-primary btn-sm" style="width:70px">Edit</button></div>
        <div class="col-lg-3 ml-4 "><button @click="deleted(data.id)" class=" btn btn-danger btn-sm" style="width:70px">Delete</button></div>
        </div>
        
    </div>
    <div  class="card border-secondary mt-2 col-lg-5 px-0 mr-3" style="width: 18rem;" v-for="cud in courses" :key="cud.id">
       
        <h5 class="card-header h5 pl-1">{{cud.course}}</h5>
        <h6 class="ml-1 mt-1">University: {{cud.university}}</h6>
        <h6 class="ml-1 mt-1   ">Dept: {{cud.dept}}</h6>
        <h6 class="ml-1 mt-1 mt-auto float-bottom   ">Deadline: {{cud.deadline}}</h6>
        
        <div class="row ml-1 mt-1 mb-1 mt-auto    ">
        <div class="col-lg-3"><button @click="editData(cud)" class=" btn btn-primary btn-sm" style="width:70px">Edit</button></div>
        <div class="col-lg-3 ml-4 "><button @click="deleted(cud.id)" class=" btn btn-danger btn-sm" style="width:70px">Delete</button></div>
        </div>
        
    </div>
</div>


    <ModFile v-show='showm' ref="info" :src="src"></ModFile>

   
</div>
  </div>
</template>

<script>
import ModFile from '../components/ModFile';
import EditProfActivity from '../components/EditProfActivity';
import vSelect from 'vue-select';
export default {
  props:['app'],
    data(){
        return{
        details:['Edit Activity with Professor','Edit Course'],detail:'',showa:false,courses:[],
        activities:[],ap:false,aap:false,apedit:false,
        
        cosedit:false,pagination:{},
        cud:false,showm:false,src:'',
        achievement:{
            id:'',
            title:'',
            activity:'',
            professor:'',
            marks:'',
            file:'',
            file_name:''},
           
        course:{
            id:'',
            rid:'',
            course:'',
            uni:'',
            dept:'',
            dead:''}
            
        }
    },
    components:{
        vSelect,EditProfActivity,ModFile
    },
    methods:{
      mode:function(){
           
            let vm = this;
            this.showa = true;
            if(this.detail == 'Edit Activity with Professor'){
               
               fetch('api/prof_activity/details/'+this.app.reqID)
               .then(res => res.json())
               .then(res => {
                   console.log(res.data);
                   this.courses = null;
                   this.activities = res.data;
                   vm.makePagination(res.meta,res.links);
                   
                   this.cud = false;
                   
               }).catch(err => console.log(err));
            }
            else if(this.detail == 'Edit Course'){
               
               fetch('api/course/details/'+this.app.reqID)
               .then(res => res.json())
               .then(res => {
                   console.log(res.data);
                   this.activities = null;
                   this.courses = res.data;
                
                   vm.makePagination(res.meta,res.links);
                   
                   this.ap = false;
                   
               }).catch(err => console.log(err));
            }
    },
    makePagination(meta,links){
            let pagination = {
                current_page: meta.current_page,
                last_page: meta.last_page,
                next_page_url: links.next,
                prev_page_url: links.prev
            }
            this.pagination = pagination;
        },
    editData(data){
            console.log(JSON.stringify(data));
            if(this.detail == 'Edit Activity with Professor'){
                
            this.apedit = true;
            this.ap =true;
            this.achievement.id = data.id;
            this.achievement.title = data.title;
            this.achievement.achievement = data.activity;
            this.achievement.activity = data.activity;
            this.achievement.professor = data.professor;
            if(data.marks != 0){
            this.achievement.marks = data.marks;
            }
            else{
                this.achievement.marks = 'none';
            }
            
                this.achievement.file_name = data.file_name;
            
            this.$refs.epa.show();
            
            
            }
            else if(this.detail == 'Edit Course'){
                this.cosedit = true;
                this.cud =true;
            this.course.id = data.id;
            console.log(this.course.id);
            this.course.rid = data.req_id;
            this.course.course = data.course;
            this.course.uni = data.university;
            this.course.dept = data.dept;
            this.course.dead = data.deadline;
            this.$refs.epa.show();
            }
            
        },
        fetchdata(page_url){
            console.log(page_url);
            let vm = this;
            
               fetch(page_url)
               .then(res => res.json())
               .then(res => {
                   console.log(res.data);
                   if(this.detail == 'Edit Activity with Professor'){
                   this.activities = res.data;
                   }else{
                       this.courses = res.data;
                   }
                   vm.makePagination(res.meta,res.links);
               }).catch(err => console.log(err));
        },
        AddData(data){
        
             if(this.detail == 'Edit Activity with Professor'){
             this.achievement.title = data.title;
             this.achievement.activity = data.desc;
             this.achievement.professor = data.professor;
             this.achievement.marks = data.marks;
             this.achievement.file_name = data.name;
             this.achievement.file = data.file;
             if(this.apedit == false){
                 if(typeof(data) == 'boolean'){
                     console.log('in');
                 this.apedit = false;
                 this.ap = false;
                     this.aap = false;
                 this.mode();
             }
             else{
                 //Add
                 console.log('out');
                 this.achievement.id = '';
                 fetch(`api/prof_activity/detail/${this.app.student.id}/${this.app.reqID}`,{
                     method:'POST',
                     body: JSON.stringify(this.achievement),
                     headers:{
                         'content-type' : 'application/json'
                     }
                 }).then(res => res.json())
                 .then(data => {
                     alert('Activity Added');
                     this.achievement.title='';
                     this.achievement.activity='';
                     this.achievement.professor='';
                     this.achievement.marks ='';
                     this.achievement.file = null;
                     this.ap = false;
                    
                 });
             }
             }else{
                    if(typeof(data) == 'boolean'){
                     console.log('in');
                 this.apedit = false;
                 this.mode();
             }else{
                 fetch(`api/prof_activity/detail/${this.app.student.id}/${this.app.reqID}`,{
                     method:'put',
                     body: JSON.stringify(this.achievement),
                     headers:{
                         'content-type' : 'application/json'
                     }
                 }).then(res => res.json())
                 .then(data => {
                     this.achievement.title='';
                     this.achievement.activity='';
                     this.achievement.professor='';
                     this.achievement.marks ='';
                     this.achievement.file = null;
                     alert('Activity Edited');
                    
                 });
             }
             
             }
             }
             else{
             this.course.course = data.course;
             this.course.uni = data.uni;
             this.course.dept = data.dept;
             this.course.dead = data.dead;
                if(typeof(data) == 'boolean'){
                 this.cosedit = false;
                 this.mode();
             }
             else{
             if(this.cosedit == false){
                 //Add
                 this.course.id = '';
                 console.log("add"+this.course);
                 fetch(`api/course/detail/${this.app.student.id}/${this.app.reqID}`,{
                     method:'POST',
                     body: JSON.stringify(this.course),
                     headers:{
                         'content-type' : 'application/json'
                     }
                 }).then(res => res)
                 .then(data => {
                     alert('Added');
                     this.course.course = '';
                     this.course.uni = '';
                     this.course.dept = '';
                     this.course.dead = '';
                     this.$refs.epa.hide();
                     this.mode();
                 });
             }else{
                 console.log("edit");
                 console.log("course:"+this.course.course);
                 console.log("uni:"+this.course.uni);
                 console.log("dept:"+this.course.dept);
                 console.log("dead:"+this.course.dead);
                 fetch(`api/course/detail/edit/${this.app.student.id}/${this.app.reqID}`,{
                     method:'put',
                     body: JSON.stringify(this.course),
                     headers:{
                         'content-type' : 'application/json'
                     }
                 }).then(res => res)
                 .then(data => {
                     this.course.course = '';
                     this.course.uni = '';
                     this.course.dept = '';
                     this.course.dead = '';
                     alert('Edited');
                     this.$refs.epa.hide();
                     
                 });
             }
             }
             
                 
             }
             }
        ,
         deleted(id){
            const did = id;
            if(this.detail == 'Edit Activity with Professor'){
                
              if(confirm('Are you sure?')){
                   console.log(id);
                  fetch(`api/prof_activity/detail/${id}`,{
                      method: 'delete'
                  }).then(res => res.json())
                  .then(data => {
                      alert("Activity Removed");
                      this.mode();
                  })
                  .catch(err => console.log(err));
              }
            }
            else{
                
              if(confirm('Are you sure?')){
                   console.log(id);
                  fetch(`api/course/detail/${id}`,{
                      method: 'delete'
                  }).then(res => res.json())
                  .then(data => {
                      alert("Removed");
                      this.mode();
                  })
                  .catch(err => console.log(err));
              }
            }
         },
         dp(name){
            console.log(name);
            if(this.detail == 'Edit Activity with Professor'){
            this.src = "files\\prof_activity\\"+name;
            }
            
            console.log(this.src);
            this.showm=true;
            this.$refs.info.show();
        },
        daaad:function(){
            if(this.detail == 'Edit Activity with Professor'){
                this.ap = false;
            this.aap = true;
            }
            else{
                this.cud = true;
                this.course.course = '';
             this.course.uni = '';
             this.course.dept = '';
             this.course.dead = '';
                
            }
            this.$refs.epa.show();
            
            
            }
        }
    }
</script>

<style>
</style>

