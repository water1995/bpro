<template>
<div class="container mb-2">
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

    <EditDetail  ref='etd' :add='add' :edit.sync="edit" :achievement.sync="achievement" v-on:detail="AddData($event)"></EditDetail>

    <nav v-show='showa' class=" pb-0    " aria-label="...">
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
    <div class="card border-secondary mt-2 col-lg-5 px-0 mr-3" style="width: 18rem;" v-for="data in achievements" :key="data.id">
       
        <h5 class="card-header h5 pl-1">{{data.title}}</h5>
        <h6 class="ml-1 mt-1 h5">{{data.achievement}}</h6>
        <h6 class="ml-1">File:<a class="mb-3 h5" href='#' @click.prevent="dp(data.file)"> {{data.file}}</a></h6>
        <div class="row ml-1 mb-1 mt-2">
        <div class="col-lg-3"><button @click="editData(data)" class=" btn btn-primary btn-sm" style="width:70px">Edit</button></div>
        <div class="col-lg-3 ml-4"><button @click="deleted(data.id)" class=" btn btn-danger btn-sm" style="width:70px">Delete</button></div>
        </div>
        
    </div>
</div>
   
</div>
    <ModFile v-show='showm' ref="info" :src="src"></ModFile>
</div>

  
</template>

<script>
import EditDetail from '../components/EditDetail';
import vSelect from 'vue-select';
import ModFile from "../components/ModFile";
 
export default {
    props:['app'],
    data(){
        return{
            details:['Academic Achievements','Co-Curricular Activities','Extra-Curricular Activities','NSS'],
            detail:'',showm:false,src:'',showa:false,add:false,
            achievements:[],
            achievement:{
                id:'',
                title:'',
                achievement:'',
                file:'',
                name:'',
            },
            achievement_id:'',
            pagination:{},
            edit:false
        }
    },
    components:{
        vSelect,ModFile,EditDetail
    },
    methods:{
        mode:function(){
            console.log(1);
            if(this.detail == 'Academic Achievements'){
                
                let vm = this;
               fetch('api/achievement/details/'+this.app.student.id)
               .then(res => res.json())
               .then(res => {
                   console.log(res.data);
                   this.achievements = res.data;
                   vm.makePagination(res.meta,res.links);
                   this.showa = true;
               }).catch(err => console.log(err));
            }
            else if(this.detail == 'Co-Curricular Activities'){
                
                let vm = this;
               fetch('api/curricular/details/'+this.app.student.id)
               .then(res => res.json())
               .then(res => {
                   console.log(res.data);
                   this.achievements = res.data;
                   vm.makePagination(res.meta,res.links);
                   this.showa = true;
               }).catch(err => console.log(err));
            }
            else if(this.detail == 'Extra-Curricular Activities'){
                
                let vm = this;
               fetch('api/extra/details/'+this.app.student.id)
               .then(res => res.json())
               .then(res => {
                   console.log(res.data);
                   this.achievements = res.data;
                   vm.makePagination(res.meta,res.links);
                   this.showa = true;
               }).catch(err => console.log(err));
            }
            else{
                
                let vm = this;
                //page_url = page_url || 'det/details/1';
               fetch('api/nss/details/'+this.app.student.id)
               .then(res => res.json())
               .then(res => {
                   console.log(res.data);
                   this.achievements = res.data;
                   vm.makePagination(res.meta,res.links);
                   this.showa = true;
               }).catch(err => console.log(err));
            }
        },
        AddData(data){
             console.log(data);
             if(typeof(data) == 'boolean'){
                 this.edit = false;
                 this.mode();
             }
             this.achievement.title = data.title;
             this.achievement.achievement = data.desc;
             this.achievement.file = data.file;
             if(typeof(data) != 'boolean'){
             if(this.detail == 'Academic Achievements'){
             if(this.edit == false){
                 //Add
                 this.achievement.id = '';
                 fetch(`api/achievement/detail/`+this.app.student.id,{
                     method:'POST',
                     body: JSON.stringify(this.achievement),
                     headers:{
                         'content-type' : 'application/json'
                     }
                 }).then(res => res.json())
                 .then(data => {
                     alert('Achievement Added');
                     
                     this.achievement.title='';
                     this.achievement.achievement='';
                     this.achievement.name='';
                     this.achievement.file = null;
                 });

             }else{
                 fetch(`api/achievement/detail/${this.app.student.id}`,{
                     method:'put',
                     body: JSON.stringify(this.achievement),
                     headers:{
                         'content-type' : 'application/json'
                     }
                 }).then(res => res.json())
                 .then(data => {
                     this.achievement.title='';
                     this.achievement.achievement='';
                     this.achievement.name='';
                     this.achievement.id='';
                     alert('Achievement Edited');
                     this.$refs.etd.hide();
                     this.mode();
                 });

             }
             }
             else if(this.detail == 'Co-Curricular Activities'){
                 if(this.edit == false){
                 //Add
                 this.achievement.id = '';
                 fetch(`api/curricular/detail/${this.app.student.id}`,{
                     method:'POST',
                     body: JSON.stringify(this.achievement),
                     headers:{
                         'content-type' : 'application/json'
                     }
                 }).then(res => res.json())
                 .then(data => {
                     alert('Co-curricular Activity Added');
                     this.achievement.title='';
                     this.achievement.achievement='';
                     this.achievement.name='';
                     this.achievement.file = null;
                 });

             }else{
                 console.log(2);
                 fetch(`api/curricular/detail/${this.app.student.id}`,{
                     method:'put',
                     body: JSON.stringify(this.achievement),
                     headers:{
                         'content-type' : 'application/json'
                     }
                 }).then(res => res.json())
                 .then(data => {
                     this.achievement.title='';
                     this.achievement.achievement='';
                     this.achievement.name='';
                     this.achievement.id='';
                     alert('Co-curricular Activity Edited');
                     this.$refs.etd.hide();
                     this.mode();
                 });
             }
             }
             else if(this.detail == 'Extra-Curricular Activities'){
                 if(this.edit == false){
                 //Add
                 this.achievement.id = '';
                 fetch(`api/extra/detail/${this.app.student.id}`,{
                     method:'POST',
                     body: JSON.stringify(this.achievement),
                     headers:{
                         'content-type' : 'application/json'
                     }
                 }).then(res => res.json())
                 .then(data => {
                     alert('Co-curricular Activity Added');
                     this.achievement.title='';
                     this.achievement.achievement='';
                     this.achievement.name='';
                     this.achievement.file = null;
                 });

             }else{
                 console.log(2);
                 fetch(`api/extra/detail/${this.app.student.id}`,{
                     method:'put',
                     body: JSON.stringify(this.achievement),
                     headers:{
                         'content-type' : 'application/json'
                     }
                 }).then(res => res.json())
                 .then(data => {
                     this.achievement.title='';
                     this.achievement.achievement='';
                     this.achievement.name='';
                     this.achievement.id='';
                     alert('Co-curricular Activity Edited');
                     this.$refs.etd.hide();
                     this.mode();
                 });
             }
             }
             else {
                 if(this.edit == false){
                 //Add
                 this.achievement.id = '';
                 fetch(`api/nss/detail/${this.app.student.id}`,{
                     method:'POST',
                     body: JSON.stringify(this.achievement),
                     headers:{
                         'content-type' : 'application/json'
                     }
                 }).then(res => res.json())
                 .then(data => {
                     
                     alert('NSS Activity Added');
                     this.achievement.title='';
                     this.achievement.achievement='';
                     this.achievement.name='';
                     this.achievement.file = null;
                 });

             }else{
                 console.log(2);
                 fetch(`api/nss/detail/${this.app.student.id}`,{
                     method:'put',
                     body: JSON.stringify(this.achievement),
                     headers:{
                         'content-type' : 'application/json'
                     }
                 }).then(res => res.json())
                 .then(data => {
                     this.achievement.title='';
                     this.achievement.achievement='';
                     this.achievement.name='';
                     this.achievement.id='';
                     alert('NSS Activity Edited');
                     this.$refs.etd.hide();
                     this.mode();
                 });
             }
             }
             }
        },
        editData(data){
            console.log(JSON.stringify(data));
            this.edit = true;
            this.achievement.id = data.id;
            this.achievement.title = data.title;
            this.achievement.achievement = data.achievement;
            this.achievement.name = data.file;
            this.add = true;
            this.$refs.etd.show();

        },
        fetchdata(page_url){
            console.log(page_url);
            let vm = this;
                //page_url = page_url || 'det/details/1';
               fetch(page_url)
               .then(res => res.json())
               .then(res => {
                   console.log(res.data);
                   this.achievements = res.data;
                   vm.makePagination(res.meta,res.links);
               }).catch(err => console.log(err));
        },
        deleted(id){
            const did = id;

            if(this.detail == 'Academic Achievements'){
                
              if(confirm('Are you sure?')){
                   console.log(id);
                  fetch(`api/achievement/detail/${id}`,{
                      method: 'delete'
                  }).then(res => res.json())
                  .then(data => {
                      alert("Achievement Removed");
                      this.mode();
                  })
                  .catch(err => console.log(err));
              }
            }
            else if(this.detail == 'Co-Curricular Activities'){
                
              if(confirm('Are you sure?')){
                   console.log(id);
                  fetch(`api/curricular/detail/${id}`,{
                      method: 'delete'
                  }).then(res => res.json())
                  .then(data => {
                      alert("Co-Curricular Activity Removed");
                      this.mode();
                  })
                  .catch(err => console.log(err));
              }
            }
            else if(this.detail == 'Extra-Curricular Activities'){
                
              if(confirm('Are you sure?')){
                   console.log(id);
                  fetch(`api/extra/detail/${id}`,{
                      method: 'delete'
                  }).then(res => res.json())
                  .then(data => {
                      alert("Extra-Curricular Activity Removed");
                      this.mode();
                  })
                  .catch(err => console.log(err));
              }
            }
            else {
                
              if(confirm('Are you sure?')){
                   console.log(id);
                  fetch(`api/nss/detail/${id}`,{
                      method: 'delete'
                  }).then(res => res.json())
                  .then(data => {
                      alert("NSS Activity Removed");
                      this.mode();
                  })
                  .catch(err => console.log(err));
              }
            }

        },
        makePagination(meta,links){
            let pagination = {
                current_page: meta.current_page,
                last_page:meta.last_page,
                next_page_url: links.next,
                prev_page_url: links.prev
            }
            this.pagination = pagination;
        },
        dp(name){
            console.log(name);
            this.src = "files\\lor_achievements\\"+name;
            console.log(this.src);
            this.showm=true;
            this.$refs.info.show();
        },
        daaad:function(){
            this.add = true;
            this.$refs.etd.show();
        }
    }
}
</script>

<style>

</style>