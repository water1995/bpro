<template>
  <div class="container">
    <modal ref='etd' name="editdetails" height="auto" width='700' :draggable="true">

    <!--<div class="row  justify-content-center">-->
        <div class="card" style="width:800">
        
        <div class="card-header">
          <div class="float-right"><button @click="hide">❌</button></div>
          <div v-show='save ==false' class="text-center ml-5">ADD</div>
          <div v-show='save' class="text-center ml-5">EDIT</div>
          
          </div>
        <div class="card-body">
    <form class="row"> 
      <div v-show='add' class="font-weight-bold col-lg-12 px-4 pt-4 pb-1 jumbotron mb-0">
        <input type="text" class="form-control" placeholder="Title" v-model="title">
        <textarea  class="mt-1 form-control" placeholder="Desc" v-model="desc" rows='4' cols="200"/>
        <input v-show="cedit" type="text"  class="form-control" placeholder="Title" v-model="name">
        
        <div class="row justify-content-center">
          <input style="width:600px" type="file" @change="onFileChange" ref="file" class="bg-white mt-1 border border-dark" />
        <button v-show="save == false" @click="editdata" class="text-center my-3 btn btn-md btn-primary py-1 ">ADD</button>
        <button v-show="save" @click="editdata" class="text-center my-3 btn btn-primary py-1 ">Save</button>
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
  name:'EditDetail',
  props:['app','add','cud','cosedit','edit','achievement','apedit','coedit','ap','activities','course'],
  components:{ DatePicker},
  data(){
    return{
      title:'',desc:'',file:'',name:'',cedit:false,save:false,marks:'',professor:'',aptedit:false,coudit:false,
      coursen:'',uni:'',dept:'',deadline:''
    }
  },
  watch:{
   edit(newVal, oldVal) { 
     console.log(oldVal);
     console.log(newVal);
   		if (newVal == true ){
         this.cedit = true;
         this.save = true;
         this.title = this.achievement.title;
         if(this.achievement.achievement != null){
           this.desc = this.achievement.achievement;
         }
         else{
      this.desc = this.achievement.activity;
         }
      this.name = this.achievement.name;
      //this.edit = false;
     }
   },
   apedit(newVal, oldVal) { 
     console.log(oldVal);
     console.log(newVal);
   		if (newVal == true || oldVal == true){
         this.aptedit =true;
         this.save = true;
         this.title = this.achievement.title;
      this.desc = this.achievement.activity;
      this.professor =this.achievement.professor;
      this.marks = this.achievement.marks;
      //this.edit = false;
      //this.oldVal = false;
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
      this.deadline = moment(this.course.dead, moment.defaultFormat).toDate();
      console.log(this.course.deadline)
      console.log(this.deadline)
      this.professor = this.app.prof;
      //this.edit = false;
      
     }
   },
   achievement:{
     deep:true,
     handler:function(newVal){
     //console.log('achieve old'.oldVal);
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
      this.marks = this.achievement.marks;
      this.$emit('detail',false);
     }
     }
   },
   course:{
     deep:true,
     handler:function(newVal){
       console.log('achieve new'+newVal.id);
       this.coursen = this.course.course;
      this.uni = this.course.uni;
      this.dept =this.course.dept;
      this.deadline = moment(this.course.dead, moment.defaultFormat).toDate();
      console.log(this.course.deadline)
      console.log(this.deadline)
      this.professor = this.app.prof;
     }
   }
     
  
  },
  
  methods:{
    show(){
    
    this.$modal.show('editdetails');
  },
  hide(){
    this.achievement.title='';
     this.achievement.achievement='';
     this.achievement.name='';
     this.achievement.file = null;
     this.title = '';
     this.desc = '';
     this.name = '';
     this.file = '';
     this.cedit = false;
     this.save = false;
     this.$emit('detail',false);
     
    this.$modal.hide('editdetails');
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
    if(this.cedit == true || this.add == true){
    const data = {title:this.title,desc:this.desc,file:this.file,file_name:this.name};
    this.$emit('detail',data);
    this.title = '';
    this.desc = '';
    this.name = ' ';
    this.$refs.file.value= '';
    //this.cedit = false;
    //this.save =false;
    }
    else if(this.apedit == true || this.ap == true){
    const data = {title:this.title,desc:this.desc,professor:(this.professor ),marks:this.marks};
    this.$emit('detail',data);
    this.title = '';
    this.desc = '';
    this.marks = ' ';
    this.aptedit = false;
    this.save =false;
    }
    else if(this.coudit == true || this.coedit == true){
      const data = {course:this.coursen,uni:this.uni,dept:this.dept,dead:moment(this.deadline).format('YYYY-MM-DD'),};
      this.$emit('detail',data);
      this.coursen = '';
      this.uni = '';
      this.dept ='';
      this.deadline = '';
      this.professor = this.app.prof;
      this.coedit =false;
      this.save = false;
    }

  },
  
  },
  

}
</script>

<style>

</style>