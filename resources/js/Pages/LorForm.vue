<template>
  <div class="container ">
   <div class="card ">
      <div class="card-header text-center">LOR FORM</div>
      <div class="card-body px-0">
        <div class="col-md-12 px-0">
          <form v-on:submit.prevent="onSubmit">
            <div class="container-fixed" style="padding-top:10px">

              <div class=" form-group row  justify-content-center ">
                <div class="px-0 col-xs-8 col-sm-6 col-lg-12">
                  <ReqProf  v-on:req="ireq($event)"></ReqProf>
                 </div>
             </div>


              <!--<div class="form-group row justify-content-center ">
                <label class="col-sm-4 col-lg-2 col-form-label mt-5 font-weight-bold">Marksheet</label>
                <div class="col-lg-7  px-0">
                <MarksheetFile :app='this' v-on:mark="upmark($event)" v-on:dmark="updmark($event)" :isShowing6="isShowing6" :clicked6 = "clicked6" :isShowing7="isShowing7" :clicked7 = "clicked7" :isShowing8="isShowing8" :clicked8 = "clicked8" ></MarksheetFile>
                </div>
              </div>-->

              <div v-show="app.lreq != true" class="ml-5 form-group row mt-5 justify-content-center " >
                  <label class="ml-4 col-sm-4 col-lg-3 col-form-label font-weight-bold">Academic Achievements:</label>
                  <div class="ml-3 px-0 col-xs-8 col-sm-6 col-lg-8">
                    <TextArea v-on:file="achieve(1,$event)"></TextArea>
                      
                 </div>
             </div>

             <div v-show="app.lreq != true" class="ml-5 form-group row mt-5 justify-content-center" >
               <label class="ml-4 col-sm-4 col-lg-3 col-form-label font-weight-bold">Co-curricular activities:</label>
               <div class="ml-3 px-0 col-xs-8 col-sm-6 col-lg-8">
                 <TextArea v-on:file="achieve(2,$event)"></TextArea>
                 
               </div>
             </div>

             <div v-show="app.lreq != true" class="ml-5 form-group row mt-5 justify-content-center" >
               <label class="ml-4 col-sm-4 col-lg-3 col-form-label font-weight-bold">Extra-curricular activities:</label>
               <div class="ml-3 px-0 col-xs-8 col-sm-6 col-lg-8">
                 <TextArea v-on:file="achieve(3,$event)"></TextArea>
                 
               </div>
             </div>

             <div v-show="app.lreq != true" class="ml-5 form-group row mt-5 justify-content-center" >
               <label class="ml-4 col-sm-4 col-lg-3 col-form-label font-weight-bold">National Service Scheme(NSS):</label>
               <div class="ml-3 px-0 col-xs-8 col-sm-6 col-lg-8">
                   <TextArea v-on:file="achieve(4,$event)"></TextArea>
               </div>
             </div>

             <div class="form-group row mt-5 justify-content-center">
               <Course v-on:course="icourse($event)"></Course>
             </div>

             

             <div class="form-group row mt-5 pt-5 justify-content-center">
               <label class=" col-sm-4 col-lg-2  col-form-label font-weight-bold">LOR Draft:</label>
               <div class="m px-0 col-xs-8 col-sm-6 col-lg-4 ">
                   <input type="file" class="border border-dark" @change="onFileChange"/>
               </div>
             </div>
             
             

             <!--<div class="form-group row mt-5 mb-5 justify-content-center ">
                 <label for="gre" class="col-form-label font-weight-bold">LOR Submission Date</label>
                 <div class="col-xs-8 col-sm-6 col-lg-2">
                   <date-picker
                  autocomplete="on"
                  placeholder="DD-MM-YYYY"
                  v-model="dob"
                  lang="en"
                  type="date"
                  format="DD-MM-YYYY"
                  confirm
                ></date-picker>
                   </div>
                   </div>-->
                   <div class="form-group row justify-content-center mt-5">
                     <button type="submit" name="submit" class="btn btn-primary" >Submit</button>
                     </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import ReqProf from '../components/ReqProf';
import TextArea from '../components/TextArea';
import Course from '../components/Course';
import Radiosgpi from "../components/Radiosgpi";
import MarksheetFile from "../components/MarksheetFile";
import DatePicker from 'vue2-datepicker';
import Multiselect from 'vue-multiselect';
import {minLength,maxLength,between,sameAs,  } from 'vuelidate/lib/validators';
import {testText,testCourse,testName} from "../validator";
import 'vue2-datepicker/index.css';
var moment = require('moment');

export default {
  name: "lorform",
  props: ["app"],

  components: {
    Radiosgpi,MarksheetFile,DatePicker,Course,TextArea,ReqProf
  },

  data() {
    return {
      diploma:false,clicked6:false,clicked7:false,clicked8:false,isShowing6:false,isShowing7:false,isShowing8:false,
      student: { sem: ""}, textArea:{ activities:'',achievements:'',scholarships:''},
      achievements:[],activities:[],extra:[],dob:'',nss:[],
      arows:[],drows:[],dfile:''
    };
  },
   validations:{
        textArea:{
          activities:{testText},achievements:{testText},scholarships:{testText}
        },
    },
  methods: {
    onFileChange(e){
      console.log(1);
      const file = e.target.files[0];
         //this.ndraft = file.name;
         const sizeMB = file.size / 1024 / 1024;
         console.log(sizeMB);
         const sizeKB = file.size/1024;
          console.log(file);

          let reader = new FileReader();
      let vm = this;
                reader.onload = (e) => {
                    vm.dfile = e.target.result;
                };
      reader.readAsDataURL(file);
    },
    onSubmit(){
      this.dob = moment(this.dob).format('YYYY-MM-DD');
      console.log(this.dob);
        console.log(JSON.stringify(this.rows));
        
        const data={
          req:this.arows,
          achievements:this.achievements,
          activities:this.activities,
          extra:this.extra,
          nss:this.nss,
          deadline:this.drows,
          dfile:this.dfile,
          lreq: this.app.lreq
        }
        console.log(JSON.stringify(data));
          this.app.req
        .post("auth/reqLor",data)
        .then(response => {
            
          this.app.user = response.data[0];
          this.$router.push("/");
        })
        .catch(error => {

          this.errors = [];
    // you can debug it
    console.log(error);
            //this.errors.push(error.response.data.error);
        });
          
         
      },
      ireq:function(data){
        console.log(data);
        if(typeof(data) == 'number'){
        console.log('data int');
        this.arows.splice(data,2);
        }
        else{
           this.arows.push(data);
        }
      },
    achieve:function(n,data){
      console.log(n);
      if(n == 1 ){
        if(typeof(data) == 'number'){
        console.log('data int');
        this.achievements.splice(data,2);
        }
        else
        this.achievements.push(data);
      }
      if(n == 2){
        if(typeof(data) == 'number'){
        console.log('data int');
        this.activities.splice(data,2);
        }
        else
        this.activities.push(data);
      }
      if(n == 3){
        if(typeof(data) == 'number'){
        console.log('data int');
        this.extra.splice(data,2);
        }
        else
        this.extra.push(data);
      }
      if(n == 4){
        if(typeof(data) == 'number'){
        console.log('data int');
        this.nss.splice(data,2);
        }
        else
        this.nss.push(data);
      }
     
    },
    icourse:function(data){
      console.log(1);
      console.log(data);
      console.log(data[0]);
      console.log(data[1]);
      console.log('type= '+typeof(data));
      if(typeof(data) == 'number'){
        console.log('data int');
        this.drows.splice(data,2);

      }
      else if(typeof(data['rowkey'])== 'number'){
        console.log('data[0] int');
          this.drows[data['rowkey']].universities.splice(data['unikey'],1);
      }
      else if(typeof(data[1])== 'string'){
        console.log('data[1] string');
      let uni = data[1];
      let dept = data[2];
      let deadline = data[3];
      if(data[0] < this.drows.length){
        this.drows[data[0]].universities.push({uni,dept,deadline});
      }
      }
      else{
        console.log('this.drows.push(data)');
      this.drows.push(data);
      }
      
      console.log(JSON.stringify(this.drows));
    },
    /*onFileChange(e) {
      const file = e.target.files[0];this.url = URL.createObjectURL(file);
    },*/
    AddAchievements(e){
      var files = e.target.files || e.dataTransfer.files;
                if (!files.length)
                    return;
                for (var i = files.length - 1; i >= 0; i--) {
                    this.achievements.push(files[i]);
                }
                e.target.value='';
    },
    AddActivities(){
       var files = e.target.files || e.dataTransfer.files;
                if (!files.length)
                    return;
                for (var i = files.length - 1; i >= 0; i--) {
                    this.activities.push(files[i]);
                }
    },
    AddScholarships(){
       var files = e.target.files || e.dataTransfer.files;
                if (!files.length)
                    return;
                for (var i = files.length - 1; i >= 0; i--) {
                    this.scholarships.push(files[i]);
                }
    },
    insem:function(sem) {
      this.student.sem = sem;
      if(this.student.sem == 6){ this.isShowing6 = true; this.clicked6 = true, this.clicked7 = false, this.clicked8 = false
      }else if(this.student.sem == 7){this.isShowing7 =true,this.clicked7 =true,this.clicked6 =false,this.clicked8 = false
      }else{this.isShowing8 = true,this.clicked8 = true,this.clicked6 = false,this.clicked7 = false
      }
    },
    upmark:function(file){
      console.log(file);
        //if(this.isShowing6 == true){
          let reader = new FileReader();
      let vm = this;
                reader.onload = (e) => {
                    vm.mark = e.target.result;
               // };
        }
        reader.readAsDataURL(file);

    },
    updmark:function(file){
      this.diploma = true;
        //if(this.isShowing6 == true){
          let reader = new FileReader();
      let vm = this;
                reader.onload = (e) => {
                    vm.dmark = e.target.result;
                };
      reader.readAsDataURL(file); 

    },
    
  }
}

</script>
     
<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>
<style>
img {
  width: 200px;
  height: 200px;
}
.row {
  margin: auto;
}

.invalid-feedback{
  font-size: 15px;
}
</style>