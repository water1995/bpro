<template>
  <div class="container">
    <modal  name="editProfActivity" height="auto" width='700' :draggable="true">

    <!--<div class="row  justify-content-center">-->
        <div class="card" style="width:800">
        
        <div class="card-header">
          <div class="float-right"><button @click="hide">❌</button></div>
          <div v-show='aap' class="text-center ml-5">ADD</div>
          <div v-show='ap' class="text-center ml-5">EDIT</div>
          <div v-show='save == false' class="text-center ml-5">ADD</div>
          <div v-show='save' class="text-center ml-5">EDIT</div>
          
          </div>
        <div class="card-body">
    <form class="row"> 
      <div v-show="ap" class="font-weight-bold col-lg-12 px-4 pt-4 pb-1 jumbotron mb-0">
        <input type="text" class="form-control" placeholder="Title" v-model="title">
        <textarea  class="mt-1 form-control" placeholder="Desc" v-model="desc"/>
        <input  type="text"  class="form-control" placeholder="Title" v-model="app.prof" readonly>
        <div class="row justify-content-center">
              <div  class="col-lg-12 px-0">
        <input v-show="smark || ap" type="text" class="form-control" placeholder="Marks" v-model="marks" >
        <input v-show='sfile' type="text" class="form-control" placeholder="Marks" v-model="name" >
        <input ref="file" type="file" style="width:610px" @change="onFileChange" class="bg-white border border-dark">
              </div>
              <div class="col-lg-3">
        <button  @click="editdata" class="text-center mt-1 btn btn-primary pt-1 pb-1 ">Save</button>
        
              </div>
      </div>  
      </div>

      <div v-show="aap" class="font-weight-bold col-lg-12 px-4 pt-4 pb-1 jumbotron mb-0">
        <input type="text" class="form-control" placeholder="Title" v-model="title">
        <textarea  class="mt-1 form-control" placeholder="Desc" v-model="desc"/>
        <input  type="text"  class="form-control" placeholder="Title" v-model="app.prof" readonly>
        <div class="row justify-content-center">
              <div  class="col-lg-12 px-0">
        <input v-show="smark || ap" type="text" class="form-control" placeholder="Marks" v-model="marks" >
        <input v-show='sfile' type="text" class="form-control" placeholder="Marks" v-model="name" >
        <input ref="file" type="file" style="width:610px" @change="onFileChange" class="bg-white border border-dark">
              </div>
              <div class="col-lg-3">
        <button  @click="editdata" class=" mt-1 btn btn-primary pt-1 pb-1 ">ADD</button>
        
      </div>  
      </div>
      </div>

      <div v-show="cud" class="font-weight-bold col-lg-12 px-4 pt-4 pb-1 jumbotron mb-0">
        <input type="text" class="form-control" placeholder="Course" v-model="coursen">
        <input type="text" class="form-control" placeholder="University" v-model="uni"/>
        <input v-show="save " type="text"  class="form-control" placeholder="Professor" v-model="app.prof" readonly>
        <input v-show="save == false" type="text"  class="form-control" placeholder="Professor" v-model="app.prof" readonly>
         <input  type="text" class="form-control" placeholder="Dept" v-model="dept">
        <div class="row justify-content-center">
              <div  class="col-lg-6 border border-dark mt-1">
        <DatePicker class='date'
                  autocomplete="on"
                  placeholder="DD-MM-YYYY"
                  v-model="deadline"
                  lang="en"
                  type="date"
                  format="DD-MM-YYYY"
                ></DatePicker>
              </div>
              <div class="col-lg-3">
        <button v-show="save " @click="editdata" class="text-center mt-1 btn btn-primary pt-1 pb-1 ">Save</button>
        <button v-show="save == false ||addd" @click="editdata" class=" mt-1 btn btn-primary pt-1 pb-1 ">ADD</button>
        <button v-show="addd" @click="editdata" class=" mt-1 btn btn-primary pt-1 pb-1 ">ADD</button>
              </div>
      </div>  
      </div>
      </form>
        
        </div>
      </div>
  
    </modal>
    </div>
</template>

<script>
import DatePicker from 'vue2-datepicker';
import 'vue2-datepicker/index.css';
var moment = require('moment');
export default {
  props:['app','add','cud','cosedit','edit','achievement','apedit','coedit','ap','activities','course','aap'],
components:{ DatePicker},
data(){
    return{
      title:'',desc:'',file:'',name:'',cedit:false,save:false,marks:'',professor:'',aptedit:false,coudit:false,
      coursen:'',uni:'',dept:'',deadline:'',smark:false,sfile:false,addd:false,
    }
  },
  watch:{
    apedit:{deep:true,
     handler:function(newVal, oldVal) { 
       
     console.log(oldVal);
     console.log(newVal);
   		if (newVal == true || oldVal == true){
         this.aptedit =true;
         this.save = true;
         this.title = this.achievement.title;
      this.desc = this.achievement.activity;
      this.professor =this.achievement.professor;
      if(this.marks != 0){
        this.smark = true;
      this.marks = this.achievement.marks;
      }
      else{
        
        this.sfile = true;
        this.name = this.achievement.file_name;
        
        //this.aptedit =false;
      }
      //this.edit = false;
      //this.oldVal = false;
     }
     
   }
    }
   ,
   cosedit(newVal, oldVal) { 
     console.log(oldVal);
     console.log(newVal);
   		if (newVal == true  ){
         this.coudit =true;
         this.save = true;
         this.coursen = this.course.course;
      this.uni = this.course.uni;
      this.dept =this.course.dept;
      //this.deadline = moment(this.course.deadline).format('DD-MM-YYYY');
      //moment(this.course.dead, moment.defaultFormat).toDate();
      //this.deadline = moment(this.course.dead, moment.defaultFormat).toDate();
      console.log(this.course.deadline)
      console.log(this.deadline)
      this.professor = this.app.prof;
      //this.edit = false;
      
     }
     else{
       this.coursen = '';
      this.uni = '';
      this.dept ='';
      //this.deadline = moment(this.course.deadline).format('DD-MM-YYYY');
      //moment(this.course.dead, moment.defaultFormat).toDate();
      //this.deadline = moment(this.course.dead, moment.defaultFormat).toDate();
      console.log(this.course.deadline)
      console.log(this.deadline)
      this.professor = ''
     }
   },
   achievement:{
     deep:true,
     handler:function(newVal){
     //console.log('achieve old'.oldVal);
     //this.save = false;
     console.log('achieve new'+newVal.id);
     if(this.cedit == false){
     this.title = this.achievement.title;
      if(this.achievement.achievement != null){
           this.desc = this.achievement.achievement;
         }
         else{
      this.desc = this.achievement.activity;
         }
      this.professor =this.achievement.professor;
      if(this.achievement.marks == 0){
      this.name = this.achievement.file_name;
      }
      else{
         this.marks = this.achievement.marks;

      }
     }
     }
   },
   /*course:{
     deep:true,
     handler:function(newVal){
       console.log('achieve new'+newVal.id);
       this.coursen = this.course.course;
      this.uni = this.course.uni;
      this.dept =this.course.dept;
      //this.deadline = moment(this.course.dead, moment.defaultFormat).toDate();
      //console.log(this.course.deadline)
      //console.log(this.deadline)
      this.professor = this.app.prof;
     }
   }*/
     
},
methods:{
    show(){
    
    this.$modal.show('editProfActivity');
  },
  hide(){
    console.log('hide');
    this.achievement.title='';
     this.achievement.achievement='';
     this.achievement.name='';
     this.achievement.file = null;
     this.title = '';
     this.desc = '';
     this.save = false;
     this.name = '';
     this.file = '';
     this.sfile =false;
     this.smark =false;
     this.cedit =false;
     this.apedit = false;
     this.aap = false;
     this.ap = false;
     this.$emit('detail',false);
     
    this.$modal.hide('editProfActivity');
  },
    onFileChange(e){
         
         const file = e.target.files[0];
         this.name = file.name;
         console.log(this.name);
         const sizeMB = file.size / 1024 / 1024;
         console.log(sizeMB);
         const sizeKB = file.size/1024;
          console.log(file);

          let reader = new FileReader();
      //let vm = this;
                reader.onload = (e) => {
                    this.file = e.target.result;
                };
      reader.readAsDataURL(file);
  },
  editdata(){
    
    if(this.aptedit == true || this.ap == true || this.aap == true){
      console.log('edit');
    const data = {title:this.title,desc:this.desc,professor:this.app.prof,marks:this.marks,file:this.file,name:this.name};
     this.save =false;
    this.$emit('detail',data);
    this.title = '';
    this.desc = '';
    this.marks = ' ';
    this.name = ' ';
    this.$refs.file.value = '';
    /*this.aptedit = false;*/
   
    }
    else if(this.coudit == true || this.coedit == true){
      const data = {course:this.coursen,uni:this.uni,dept:this.dept,dead:moment(this.deadline).format('YYYY-MM-DD'),};
      this.$emit('detail',data);
      this.coursen = '';
      this.uni = '';
      this.dept ='';
      this.deadline = '';
      this.professor = this.app.prof;
      /*this.coedit =false;
      this.save = false;*/
    }

  },
  
  },
}
</script>

<style>
DatePicker{
  height:500px;
  width:1000px
}
</style>