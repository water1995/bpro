<template>
<div class="container   px-0">
<div class="card">
<div class="card-header text-center">TRANSCRIPT FORM</div>
<div class="card-body px-0">
<div class="col-md-12 px-0">

<form v-on:submit.prevent="onSubmit" class="h5">
    
<div class="container-fixed" style="padding-top:10px">
    
<!--<Uppic v-on:pic="upPic($event)"></Uppic>-->

<div class="form-group row justify-content-center  mt-4 pt-4">
<label  for="name" class="col-sm-4 col-lg-1  col-form-label font-weight-bold ">Name</label>
<div class="col-xs-8 col-sm-6 col-lg-6">
    <input required v-model='$v.name.$model' :class="{'is-invalid':$v.name.$error}"  type="text" class="form-control text-center border-primary"  placeholder="Name as per MARKSHEET in CAPS">
<div class="invalid-feedback">
    <span v-if="!$v.name.testTName">Enter name as per MARKSHEET in CAPS</span>
    </div>
</div>
</div>
<!--
<div class="form-group row justify-content-center mt-5 pt-3">
<label  class="col-sm-4 col-lg-2  col-form-label font-weight-bold ">Student ID</label>
<div class="col-xs-8 col-sm-6 col-lg-3 ">
    <input type="text" v-model="$v.studID.$model" :class="{'is-invalid':$v.studID.$error}" class="form-control border-primary" required>
<div class="invalid-feedback">
    <span v-if="!$v.studID.testStudID">Student ID is invalid</span>
    </div>
</div>

<label  class="col-sm-4 col-lg-2 ml-5 col-form-label font-weight-bold">Date Of Birth</label>
<div class="col-xs-8 col-sm-6 col-lg-3 ">
    <date-picker autocomplete="on" placeholder="DD-MM-YYYY" v-model="dob" lang="en" type="date" format="DD-MM-YYYY" confirm></date-picker>
</div>
</div>-->

<div class="form-group row justify-content-center mt-5 pt-5  " >

<!--<label for="branch" class="col-sm-4 col-lg-2  col-form-label font-weight-bold ">Branch</label>
<div class="col-xs-8 col-sm-6 col-lg-3 ">
    <input v-model="$v.branch.$model" :class="{'is-invalid':$v.branch.$error}" type="text"  class="form-control border-primary" required>
<div class="invalid-feedback">
    <span v-if="!$v.branch.testBranch">Student ID is invalid</span>
    </div>
</div>-->

<label for="cot" class="col-sm-4 col-lg-3 px-0 col-form-label font-weight-bold ">Copies Of Transcript</label>
<div class="col-xs-8 col-sm-6 col-lg-2 mr-2 ">
    <input v-model='cot' :class="{'is-invalid':$v.cot.$error}" type="number"  class="form-control border-primary" name="cot" required>
<!--<div class="invalid-feedback">
    <span v-if="!$v.cot.testYear">You can only input numbers.</span>
</div>-->
</div>

<label for="rpe" class="ml-5 pl-3 col-sm-4 col-lg-3 px-0 col-form-label font-weight-bold " >Recently Passed Exam</label>
<div class="col-xs-8 col-sm-6 col-lg-3 px-0">
    <input v-model="$v.rpe.$model" :class="{'is-invalid':$v.rpe.$error}" type="text" class="form-control border-primary" name="rpe" placeholder="(TE/BE)-SEM-(MAY/DEC)-YEAR" required>
<div class="invalid-feedback">
    <span v-if="!$v.rpe.testRPE">Invalid</span>
    </div>
</div>

</div>

<div class="form-group row justify-content-center mt-5 mb-5  ">
    <div class="col-sm-6 col-lg-10 mt-2">
        <Radiosgpi v-on:insem="insem($event)"></Radiosgpi>
    </div>
</div>

<!--<div class="form-group row justify-content-center mt-5 py-3">
    <div class="col-lg-8">
    <MarksheetFile v-on:mark="upmark($event)" :isShowing6="isShowing6" :clicked6 = "clicked6" :isShowing7="isShowing7" :clicked7 = "clicked7" :isShowing8="isShowing8" :clicked8 = "clicked8" ></MarksheetFile>
    </div>
</div>-->

<!--<div class=" form-group row justify-content-center mt-5">

<label for="yoa" class="col-sm-4 col-lg-2 col-form-label font-weight-bold ">Year of admission</label>
<div class="col-xs-8 col-sm-6 col-lg-3 ">
<input v-model="$v.yoa.$model" :class="{'is-invalid':$v.yoa.$error}" type="text"  class="form-control border-primary" required>
<div class="invalid-feedback">
    <span v-if="!$v.yoa.testYear">Invalid</span>
</div>
</div>

<label for="yoc" class="col-sm-4 col-lg-2 ml-5 col-form-label  font-weight-bold " >Year of graduation</label>
<div class=" col-xs-8 col-sm-6 col-lg-3 ">
<input v-model="$v.yog.$model" :class="{'is-invalid':$v.yog.$error}" type="text" class="form-control border-primary" name="yoc" required>
<div class="invalid-feedback">
    <span v-if="!$v.yog.testYear">Invalid</span>
</div>
</div>

</div>

<div class=" form-group row justify-content-center mt-5 ">

<label for="email" class="col-sm-4 col-lg-1  col-form-label font-weight-bold ">Email</label>
<div class="col-xs-8 col-sm-6 col-lg-3">
    <input v-model="$v.email.$model" :class="{'is-invalid':$v.email.$error}"  type="email"  class="form-control border-primary"  required>
<div class="invalid-feedback">
    <span v-if="!$v.email.testEmail">Invalid</span>
</div>
</div>

<label class="col-sm-4 col-lg-2  ml-sm-5 col-form-label font-weight-bold ">Mobile</label>
<div class=" col-xs-8 col-sm-6 col-lg-3">
    <input v-model="$v.mob.$model" :class="{'is-invalid':$v.mob.$error}" type="text" class="form-control border-primary" required>
    <div class="invalid-feedback">
    <span v-if="!$v.mob.testStudID">Invalid</span>
</div>
</div>

</div>-->

<div class="form-group row mt-5 justify-content-center  pt-4  ">
<span class="text-center px-0 col-lg-2    mx-0 col-form-label font-weight-bold"><label>Address For Communication:</label></span>
 <div class="col-xs-8 col-sm-6 col-lg-4   px-0">
     <textarea rows="4" cols="35" v-model='$v.address.$model' :class="{'is-invalid':$v.address.$error}" placeholder="type something..."></textarea>
<div class="invalid-feedback">
    <span v-if="!$v.address.testText">You can only input letters ,numbers ,space , , , -, / and fullstop.</span>
</div>
</div>

<div class="col-lg-2   px-0 col-form-label  font-weight-bold"><label>Transcript for:</label></div>
 <div class="col-xs-8 col-sm-6 col-lg-4 px-0  ">
     <textarea rows="4" cols="35" v-model='$v.tfor.$model' :class="{'is-invalid':$v.tfor.$error}" placeholder="type something..."></textarea>
<div class="invalid-feedback">
    <span v-if="!$v.tfor.testText">You can only input letters ,numbers ,space , , , -, / and fullstop.</span>
</div>
</div>
</div>

<div class="form-group row mt-5">

<!--<label for="cot" class="col-sm-4 col-lg-2 ml-4 col-form-label font-weight-bold ">Copies Of Transcript</label>
<div class="col-xs-8 col-sm-6 col-lg-3 ml-4">
    <input v-model='$v.cot.$model' :class="{'is-invalid':$v.cot.$error}" type="number"  class="form-control border-primary" name="cot" required>
<div class="invalid-feedback">
    <span v-if="!$v.cot.testYear">You can only input numbers.</span>
</div>
</div>
style="margin-left:400px"-->

<div class="row mt-5  ">
<div class=" col-xs-2 col-sm-2 col-lg-1  mt-1  ">
    <input name="check" value="0" type="hidden">
        <input v-model='moi' type="checkbox" value="yes" class="form-control border-primary" name="check" required>
       </div>
       <div class="col-lg-5  ">
      <label for="check" class=" radio-inline font-weight-bold mt-2 ">Letter For English Medium Of Instruction</label>
      
     </div>

     
<div class=" col-xs-2 col-sm-2 col-lg-1 ml-5 mt-1  ">
    <input name="check" value="0" type="hidden">
    <input v-model='pay' type="checkbox" value="yes" class="form-control border-primary" name="check" required>
</div>
<div class="col  ">
<label for="check" class=" radio-inline font-weight-bold mt-2 ">I agree to pay the prescribed fee of per transcript by cash</label>
</div>


    </div>



<!--<div class="row mt-5" style="margin-left:400px">
<div class=" col-xs-2 col-sm-2 col-lg-2  mt-1">
    <input name="check" value="0" type="hidden">
        <input v-model='moi' type="checkbox" value="yes" class="form-control border-primary" name="check" required>
       </div>
       <div class="col-lg-10">
      <label for="check" class=" radio-inline font-weight-bold mt-2 ">Letter For English Medium Of Instruction</label>
      
     </div>
    </div>-->
</div>

<div class="form-group row justify-content-center mt-5">
    <button @click="Submit()" type="submit" name="submit" class="btn btn-primary" >Submit</button>
</div>
</div>
</form>
</div>
</div>
</div>
</div>
</template>

<script>
import Uppic from "../components/Uppic"
import Radiosgpi from "../components/Radiosgpi";
import MarksheetFile from "../components/MarksheetFile";
import DatePicker from 'vue2-datepicker';
import {minLength,maxLength,between,sameAs,required} from 'vuelidate/lib/validators';
import {testTName,testStudID,testBranch,testRPE,testYear,testEmail,testText} from "../validator";
import 'vue2-datepicker/index.css';
var moment = require('moment');
export default {
name: "transcriptform",
  props: ["app"],

  components: {
    Radiosgpi,MarksheetFile,DatePicker,Uppic,
  },

  data() {
    return {
      url:"http://placehold.it/200",pic:'',name:'',studId:'',branch:'',rpe:'',yoa:'',yog:'',email:'',mob:'',
      address:'',tfor:'',cot:'',pay:'',moi:'',clicked6:false,clicked7:false,clicked8:false,isShowing6:false,isShowing7:false,isShowing8:false,
      sem: "",pname:'',
      mark6:[],mark7:[],mark8:[],dob:'', 
    };
  },
  validations:{
      name:{testTName},studID:{testStudID},branch:{testBranch},rpe:{testRPE},yoa:{testYear},yog:{testYear},
      mob:{testStudID},email:{testEmail},address:{testText},tfor:{testText},cot:{testYear}

  },
  methods:{

      Submit(){

          const data = {
              name:this.name,
              rpe:this.rpe,
              address:this.address,
              tfor:this.tfor,
              cot:this.cot,
              pay:this.pay,
              moi:this.moi,
              sem:this.sem
          }

          this.app.req.post('auth/reqt',data).then(response =>{
              console.log(response.data);
              this.$router.push('/');
          });

      },

      upPic:function(file){
      
      let reader = new FileReader();
      let vm = this;
                reader.onload = (e) => {
                    vm.pic = e.target.result;
                };
      reader.readAsDataURL(file);
      this.pname = file.name; 
    },
  
   insem:function(sem) {
      this.sem = sem;
      
    },

    upmark:function(file){
        if(this.isShowing6 == true){
        this.mark6.push(file)
        }
        else if(this.isShowing7 == true){
        this.mark7.push(file)
        }
        else{
        this.mark8.push(file)
        }
    },
  }
}
</script>

<style>

</style>