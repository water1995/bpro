
<template>
  <div class="container">
    <div class="card">
      <div class="card-header text-center">REGISTER</div>
      <div class="card-body justify-content-center">
        <div class="col-md-12">
          <form v-on:submit.prevent="onSubmit" enctype="multipart/form-data">

             <div class="form-group row mt-4">
               <Uppic v-on:pic="upPic($event)"></Uppic>
             </div>

            <div class="form-group row mt-4">
              <label class="col-sm-4 col-lg-2  col-form-label font-weight-bold">Full Name</label>
              <div class="col-xs-8 col-sm-6 col-lg-4">
                <input
                  v-model.trim="$v.student.name.$model"
                  :class="{'is-invalid':$v.student.name.$error}"
                  autocomplete="on"
                  type="text"
                  class="form-control text-center border-primary"
                  
                />
                <div class="invalid-feedback">
                    <span v-if="!$v.student.name.testName">Name is invalid</span>
                    </div>
              </div>
              <label
                for="branch"
                class="col-sm-4 col-lg-2 ml-4 col-form-label font-weight-bold"
              >Branch</label>
              <div class="col-xs-8 col-sm-6 col-lg-3">
                <input
                  v-model="$v.student.branch.$model"
                  placeholder="IT/COMPS/EXTC/MECH"
                  :class="{'is-invalid':$v.student.branch.$error}"
                  type="text"
                  class="form-control border-primary"
                      
                />
                <div class="invalid-feedback">
                    <span v-if="!$v.student.branch.testBranch">Branch is invalid</span>
                    </div>
              </div>
            </div>
            <div class="form-group row mt-5">
              <label
                for="studID"
                class="col-sm-4 col-lg-2   col-form-label font-weight-bold"
              >Student ID</label>
              <div class="col-xs-8 col-sm-6 col-lg-4">
                <input
                  type="text"
                  autocomplete="on"
                  v-model="$v.student.studID.$model"
                  :class="{'is-invalid':$v.student.studID.$error}"
                  class="form-control border-primary"
                      
                />
                <div class="invalid-feedback">
                    <span v-if="!$v.student.studID.testStudID">Student ID is invalid</span>
                    </div>
              </div>
            
              <label
                for="dob"
                class="col-sm-4 col-lg-2 ml-lg-4 ml-sm-5 col-form-label font-weight-bold"
              >Date Of Birth</label>
              <div class="col-xs-8 col-sm-6 col-lg-3">
                <DatePicker
                  autocomplete="on"
                  placeholder="DD-MM-YYYY"
                  v-model="student.dob"
                  lang="en"
                  type="date"
                  format="DD-MM-YYYY"
                  
                ></DatePicker>
               
              </div>
            </div>

            <div class="form-group row mt-5  ">
              <label
                class="mb-sm-3 col-xs-8 col-sm-6 col-lg-2   col-form-label font-weight-bold"
              >GRE</label>
              <div class="mb-sm-3 px-0 ml-lg-3 mr-lg-3   col-xs-8 col-sm-6 col-lg-3 ">
                <input
                  v-model="student.gre"
                  :class="{'is-invalid':$v.student.yoa.$error}"
                  type="text"
                  class="form-control border-primary"
                />
                <div class="invalid-feedback">
                    <span v-if="!$v.student.yoa.testYear">Year of Admission is invalid</span>
                    </div>
              </div> <!--col-sm-4 col-lg-2 ml-lg-3 ml-sm-5-->
              <label
                for="mobile"
                class="col-xs-8 col-sm-6 col-lg-2 ml-lg-5 mr-lg-5 pl-lg-5 col-form-label font-weight-bold  "
              >GMAT</label>
              <div class="px-0 col-xs-8 col-sm-6 col-lg-3   ">
                <input
                  v-model="student.gmat"
                  :class="{'is-invalid':$v.student.yog.$error}"
                  type="text"
                  class="form-control border-primary"
                />
                <div class="invalid-feedback">
                    <span v-if="!$v.student.yog.testYear">Year of graduation is invalid</span>
                    </div>
              </div>
            </div>

            <div class="form-group row justify-content-center mt-5 ">
              
              <Sgpi  v-on:dip='dipy($event)' v-on:gen="gen($event)" v-on:sem='sem($event)'></Sgpi>
              
            </div>

            <div v-show="diploma" class="form-group row justify-content-center mt-5 mb-5">
             
                  <div class="col-xs-1 font-weight-bold">Diploma:</div>
                  <div class="col-xs-1 ml-md-2 ml-lg-3">
                    <input
                      v-model="dip.sem1"
                      name="sem16"
                      style="width:90px;text-align:center"
                      type="number"
                      step="0.01"
                      placeholder="SEM 1"
                      :="clicked6"
                    />
                  </div>
                  <div class="col-xs-1 ml-md-2 ml-lg-3">
                    <input
                      v-model="dip.sem2"
                      name="sem26"
                      type="number"
                      step="0.01"
                      style="width:90px;text-align:center"
                      placeholder="SEM 2"
                      :    ="clicked6"
                    />
                  </div>
                  <div class="col-xs-1 ml-md-2 ml-lg-3">
                    <input
                      v-model="dip.sem3"
                      name="sem36"
                      type="number"
                      step="0.01"
                      style="width:90px;text-align:center"
                      placeholder="SEM 3"
                      :    ="clicked6"
                    />
                  </div>
                  <div class="col-xs-1 ml-md-2 ml-lg-3">
                    <input
                      v-model="dip.sem4"
                      name="sem46"
                      type="number"
                      step="0.01"
                      style="width:90px;text-align:center"
                      placeholder="SEM 4"
                      :    ="clicked6"
                    />
                  </div>
                  <div class="col-xs-1 ml-md-2 ml-lg-3">
                    <input
                      v-model="dip.sem5"
                      name="sem56"
                      type="number"
                      step="0.01"
                      style="width:90px;text-align:center"
                      placeholder="SEM 5"
                      :    ="clicked6"
                    />
                  </div>
                  <div class="col-xs-1 ml-md-2 ml-lg-3">
                    <input
                      v-model="dip.sem6"
                      name="sem66"
                      type="number"
                      step="0.01"
                      style="width:90px;text-align:center"
                      placeholder="SEM 6"
                      :    ="clicked6"
                    />
                  </div>
                </div>
              

            <div class=" form-group row justify-content-center mb-3 mt-5 mb-5">
              <div v-show="isShowing6"  class=" form-group col-xs-12 col-sm-12 col-md-10 col-lg-11">
                <div class=" row justify-content-center">
                  <div v-show="diploma" class=" col-xs-3 font-weight-bold">Degree:</div>
                  <div class="col-xs-1 ml-md-2 ml-lg-3">
                    <input
                      v-model="sem1"
                      name="sem16"
                      style="width:90px;text-align:center"
                      type="number"
                      step="0.01"
                      placeholder="SEM 1"
                      :    ="clicked6"
                    />
                  </div>
                  <div class="col-xs-1 ml-md-2 ml-lg-3">
                    <input
                      v-model="sem2"
                      name="sem26"
                      type="number"
                      step="0.01"
                      style="width:90px;text-align:center"
                      placeholder="SEM 2"
                      :    ="clicked6"
                    />
                  </div>
                  <div class="col-xs-1 ml-md-2 ml-lg-3">
                    <input
                      v-model="sem3"
                      name="sem36"
                      type="number"
                      step="0.01"
                      style="width:90px;text-align:center"
                      placeholder="SEM 3"
                      :    ="clicked6"
                    />
                  </div>
                  <div class="col-xs-1 ml-md-2 ml-lg-3">
                    <input
                      v-model="sem4"
                      name="sem46"
                      type="number"
                      step="0.01"
                      style="width:90px;text-align:center"
                      placeholder="SEM 4"
                      :    ="clicked6"
                    />
                  </div>
                  <div class="col-xs-1 ml-md-2 ml-lg-3">
                    <input
                      v-model="sem5"
                      name="sem56"
                      type="number"
                      step="0.01"
                      style="width:90px;text-align:center"
                      placeholder="SEM 5"
                      :    ="clicked6"
                    />
                  </div>
                  <div class="col-xs-1 ml-md-2 ml-lg-3">
                    <input
                      v-model="sem6"
                      name="sem66"
                      type="number"
                      step="0.01"
                      style="width:90px;text-align:center"
                      placeholder="SEM 6"
                      :    ="clicked6"
                    />
                  </div>
                  <div v-show="isShowing7" class="col-xs-1 ml-md-2 ml-lg-3">
                    <input
                      v-model="sem7"
                      type="number"
                      step="0.01"
                      style="width:90px;text-align:center"
                      placeholder="SEM 7"
                      :    ="clicked7"
                    />
                  </div>
                  <div v-show="isShowing8" class="col-xs-1 ml-md-2 ml-lg-3">
                    <input
                      v-model="sem8"
                      type="number"
                      step="0.01"
                      style="width:90px;text-align:center"
                      placeholder="SEM 8"
                      :    ="clicked8"
                    />
                  </div>
                </div>
              </div>

            </div>

            <div class=" form-group row justify-content-center ">
              
              <div class="col-lg-12 px-0     ">
              <MarksheetFile v-on:mark="upmark($event)" v-on:dmark="updmark($event)" :diploma="diploma"></MarksheetFile>
              </div>
            </div>

            <div class="form-group row mt-5">
              <label
                class="mb-sm-3 col-xs-8 col-sm-6 col-lg-3  col-form-label font-weight-bold"
              >Year of Admission</label>
              <div class="mb-sm-3 px-0   col-xs-8 col-sm-6 col-lg-3 ">
                <input
                  v-model="student.yoa"
                  :class="{'is-invalid':$v.student.yoa.$error}"
                  type="text"
                  class="form-control border-primary"
                  
                />
                <div class="invalid-feedback">
                    <span v-if="!$v.student.yoa.testYear">Year of Admission is invalid</span>
                    </div>
              </div> <!--col-sm-4 col-lg-2 ml-lg-3 ml-sm-5-->
              <label
                for="mobile"
                class="col-xs-8 col-sm-6 col-lg-3 col-form-label font-weight-bold  "
              >Year of Graduation</label>
              <div class="px-0 col-xs-8 col-sm-6 col-lg-3   ">
                <input
                  v-model="$v.student.yog.$model"
                  :class="{'is-invalid':$v.student.yog.$error}"
                  type="text"
                  class="form-control border-primary"
                  
                />
                <div class="invalid-feedback">
                    <span v-if="!$v.student.yog.testYear">Year of graduation is invalid</span>
                    </div>
              </div>
            </div>

            <div class="form-group row mt-5 ">
              <label
                for="email"
                class="mb-sm-3 col-sm-6 col-lg-2 col-form-label font-weight-bold"
              >Email</label>
              <div class="mb-sm-3 px-0 col-xs-8 col-sm-6 col-lg-4">
                <input
                  v-model="user.email"
                  type="email"
                  class="form-control border-primary"
                  
                />
              </div>
              <label
                for="mobile"
                class="col-sm-6 col-lg-3 col-form-label font-weight-bold"
              >Mobile</label>
              <div class=" col-xs-8 col-sm-6 col-lg-3 px-0">
                <input
                  id="mobile"
                  v-model="$v.student.mobile.$model"
                  :class="{'is-invalid':$v.student.mobile.$error}"
                  type="text"
                  class="form-control border-primary"
                  name="mobile"
                      
                />
                <div class="invalid-feedback">
                    <span v-if="!$v.student.mobile.testStudID">Mobile no. is invalid</span>
                    </div>
              </div>
            </div>
            <div class="form-group row mt-5 justify-content-center">
              <label
                for="password"
                class="mb-sm-3 col-xs-8 col-sm-6 col-lg-3 border  col-form-label font-weight-bold"
              >Password</label>
              <div class="mb-sm-3 col-xs-8 col-sm-6 col-lg-3 px-0 ">
                <input
                  id="password"
                  v-model="$v.user.password.$model"
                  :class="{'is-invalid':$v.user.password.$error}"
                  type="password"
                  class="form-control border-primary"
                  name="password"
                    
                />
                <div class="invalid-feedback">
                     <span v-if="!$v.user.password.testPass">"Min. 8 characters with at least one capital letter, a number and a special character."</span>
                    
              </div>
              </div>
              <label
                for="cpass"
                class="col-xs-8 col-sm-6 col-lg-3 col-form-label font-weight-bold  "
              >Confirm Password</label>
              <div class="col-xs-8 col-sm-6 col-lg-3 px-0  ">
                <input
                  id="cpass"
                  v-model="$v.user.cpass.$model"
                  :class="{'is-invalid':$v.user.cpass.$error}"
                  type="password"
                  class="form-control border-primary"
                  name="cpass"
                      
                />
                
                 <div class="invalid-feedback">
                    <span v-if="!$v.user.cpass.samePass">Passwords should match</span>
                    </div>
              </div>
            </div>
            <div class="form-group row justify-content-center mt-5">
              <button
                type="submit"
                name="submit"
                class="btn btn-primary"
              >Submit</button>
            </div>
            
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import MarksheetFile from '../components/MarksheetFile';
import DatePicker from 'vue2-datepicker';
import Uppic from '../components/Uppic';
import Sgpi from '../components/Sgpi';
import Radiosgpi from '../components/Radiosgpi';
 import 'vue2-datepicker/index.css';
 import {minLength,maxLength,between,sameAs} from 'vuelidate/lib/validators';
 import {testName,testBranch,testStudID,testPass,testYear} from "../validator";
 var moment = require('moment');

 
export default {
    name:'register',
    props:['app'],
   components:{
      DatePicker,Uppic,Sgpi,MarksheetFile
    },
  data() {
    return {
        diploma:false,general:false,clicked:false,clicked6:false,clicked7:false,clicked8:false,
            isShowing6:false,isShowing7:false,isShowing8:false,dmark:'',mark:'',
            sem1:'',sem2:'',sem3:'',sem4:'',sem5:'',sem6:'',sem7:'',sem8:'',
            dip:{sem1:'',sem2:'',sem3:'',sem4:'',sem5:'',sem6:''},errors:[],
         
      student: {
        gre:'',
        gmat:'',
        image:'',
        purl:'',
        name: "",
        branch: "",
        studID: "",
        dob:'',
        sem: "",
        mobile: "",
        yoa:"",
        yog:""
      },
      user: { email: "", password: "",cpass:'' },
    }
  },
  validations:{
      user:{
          password:{
                testPass
            },
            cpass:{
                samePass: sameAs('password')
            }
            },
        student:{
            name:{
                testName
            },
            branch:{
                testBranch
            },
            studID:{
                 testStudID
            },
            mobile:{
                testStudID
            },
            yoa:{
              testYear
            },
            yog:{
              testYear
            }
            
        },
        
  },
  
  methods: {
    upmark:function(file){
      console.log(file);
      //this.mark.push(file);
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
      //this.dmark.push(file);
        //if(this.isShowing6 == true){
         let reader = new FileReader();
      let vm = this;
                reader.onload = (e) => {
                    vm.dmark = e.target.result;
                };
      reader.readAsDataURL(file); 
    },
    dipy:function(){
      this.diploma = true;
      this.isShowing = true;
    },
    gen:function(){
      this.general = true;
    },
    sem:function(sem){
      console.log(sem);
      this.student.sem = sem;
      if(sem == 6){
        console.log(6);
        this.isShowing6 = true;
      }
      else if(sem == 7){
        console.log(7);
        this.isShowing6 = true;
        this.isShowing7 = true;
      }
      else{
        this.isShowing6 = true;
        this.isShowing7 = true;
        this.isShowing8 = true;
      }
    },
    gpi:function(gpi){
      if(this.student.sem == 6)
        console.log(gpi);
    },
    upPic:function(file){
      
      let reader = new FileReader();
      let vm = this;
                reader.onload = (e) => {
                    vm.student.image = e.target.result;
                };
      reader.readAsDataURL(file);
      this.student.purl = file.name;   
      console.log(this.student.image);
    },
     
    onSubmit(){
      this.student.dob = moment(this.student.dob).format('YYYY-MM-DD');
      //console.log(this.student.dob);
      if(this.student.sem == 6){
        if(this.diploma == true){
          const data ={
            gre:this.student.gre,gmat:this.student.gmat,
            diploma:this.diploma,pic:this.student.image, pimage:this.student.purl,
            email:this.user.email,password:this.user.password,name: this.student.name,
            branch: this.student.branch,studID: this.student.studID,dob: this.student.dob,
            sem: this.student.sem,mobile: this.student.mobile,mark:this.mark,dmark:this.dmark,
            dsem1:this.dip.sem1,dsem2:this.dip.sem2,dsem3:this.dip.sem3,dsem4:this.dip.sem4,
            dsem5:this.dip.sem5,dsem6:this.dip.sem6,
            Sem_1: this.sem1,Sem_2: this.sem2,Sem_3: this.sem3,Sem_4: this.sem4,
            Sem_5: this.sem5,Sem_6: this.sem6,yoa:this.student.yoa,yog:this.student.yog
            }
                   console.log(data);
                this.app.req
        .post("auth/register",data)
        .then(response => {
          console.log(response.data);
          this.app.user = response.data[0];
          this.app.student = response.data[1];
          this.$router.push("/");
        })
        .catch(error => {
            this.errors.push(error.response.data.error);
        });
        }
        else
        {
          const data ={ gre:this.student.gre,gmat:this.student.gmat,
            diploma:this.diploma,pic:this.student.image,pimage:this.student.purl,
            email:this.user.email,password:this.user.password,name: this.student.name,
            branch: this.student.branch,studID: this.student.studID,dob: this.student.dob,
            sem: this.student.sem,mobile: this.student.mobile,mark:this.mark,
            Sem_1: this.sem1,Sem_2: this.sem2,Sem_3: this.sem3,Sem_4: this.sem4,
            Sem_5: this.sem5,Sem_6: this.sem6,yoa:this.student.yoa,yog:this.student.yog
          }
                 console.log(data);
                this.app.req
        .post("auth/register",data)
        .then(response => {
          console.log(response.data);
          this.app.user = response.data[0];
          this.app.student = response.data[1];
          this.$router.push("/");
        })
        .catch(error => {
            this.errors.push(error.response.data.error);
        });
        }
        }
        else
        if(this.student.sem == 7){
          if(this.diploma == true){
            const data ={
              gre:this.student.gre,gmat:this.student.gmat,
                diploma:this.diploma,
                 pic:this.student.image,
                 pimage:this.student.purl,
                 email:this.user.email,
                 password:this.user.password,
                 name: this.student.name,
                 branch: this.student.branch,
                 studID: this.student.studID,
                 dob: this.student.dob,
                 sem: this.student.sem,
                 mobile: this.student.mobile,
                 mark:this.mark,dmark:this.dmark,
                 dsem1:this.dip.sem1,
                 dsem2:this.dip.sem2,
                 dsem3:this.dip.sem3,
                 dsem4:this.dip.sem4,
                 dsem5:this.dip.sem5,
                 dsem6:this.dip.sem6,
                 Sem_1: this.sem1,
                 Sem_2: this.sem2,
                 Sem_3: this.sem3,
                 Sem_4: this.sem4,
                 Sem_5: this.sem5,
                 Sem_6: this.sem6,
                 Sem_7: this.sem7,
                 yoa:this.student.yoa,yog:this.student.yog
               }
                      console.log(data);
                this.app.req
        .post("auth/register",data)
        .then(response => {
          console.log(response.data);
          this.app.user = response.data[0];
          this.app.student = response.data[1];
          this.$router.push("/");
        })
        .catch(error => {
            this.errors.push(error.response.data.error);
        });
             
            }else{
                 const  data ={
                   gre:this.student.gre,gmat:this.student.gmat,
                   diploma:this.diploma,
                   pic:this.student.image,
                   pimage:this.student.purl,
                 email:this.user.email,
                  password:this.user.password,
                 name: this.student.name,
                 branch: this.student.branch,
                 studID: this.student.studID,
                 dob: this.student.dob,
                 sem: this.student.sem,
                 mobile: this.student.mobile,
                 mark:this.mark,
                 Sem_1: this.sem1,
                 Sem_2: this.sem2,
                 Sem_3: this.sem3,
                 Sem_4: this.sem4,
                 Sem_5: this.sem5,
                 Sem_6: this.sem6,
                 Sem_7: this.sem7,
                 yoa:this.student.yoa,yog:this.student.yog
                 }
                        console.log(data);
                this.app.req
        .post("auth/register",data)
        .then(response => {
          console.log(response.data);
          this.app.user = response.data[0];
          this.app.student = response.data[1];
          this.$router.push("/");
        })
        .catch(error => {
            this.errors.push(error.response.data.error);
        });
            
                 }
               }
               else{
                 if(this.diploma == true){
              const data ={
                gre:this.student.gre,gmat:this.student.gmat,
                diploma:this.diploma,
                 pic:this.student.image,
                 pimage:this.student.purl,
                 email:this.user.email,
                 password:this.user.password,
                 name: this.student.name,
                 branch: this.student.branch,
                 studID: this.student.studID,
                 dob: this.student.dob,
                 sem: this.student.sem,
                 mobile: this.student.mobile,
                 mark:this.mark,dmark:this.dmark,
                 dsem1:this.dip.sem1,
                 dsem2:this.dip.sem2,
                 dsem3:this.dip.sem3,
                 dsem4:this.dip.sem4,
                 dsem5:this.dip.sem5,
                 dsem6:this.dip.sem6,
                 Sem_1: this.sem1,
                 Sem_2: this.sem2,
                 Sem_3: this.sem3,
                 Sem_4: this.sem4,
                 Sem_5: this.sem5,
                 Sem_6: this.sem6,
                 Sem_7: this.sem7,
                 Sem_8: this.sem8,
                 yoa:this.student.yoa,yog:this.student.yog
               }
                      console.log(data);
                this.app.req
        .post("auth/register",data)
        .then(response => {
          console.log(response.data);
          this.app.user = response.data[0];
          this.app.student = response.data[1];
          this.$router.push("/");
        })
        .catch(error => {
            this.errors.push(error.response.data.error);
        });
         
            }else{
                 const  data ={
                   gre:this.student.gre,gmat:this.student.gmat,
                   diploma:this.diploma,
                   pic:this.student.image,
                   pimage:this.student.purl,
                 email:this.user.email,
                  password:this.user.password,
                 name: this.student.name,
                 branch: this.student.branch,
                 studID: this.student.studID,
                 dob: this.student.dob,
                 sem: this.student.sem,
                 mobile: this.student.mobile,
                 mark:this.mark,
                 Sem_1: this.sem1,
                 Sem_2: this.sem2,
                 Sem_3: this.sem3,
                 Sem_4: this.sem4,
                 Sem_5: this.sem5,
                 Sem_6: this.sem6,
                 Sem_7: this.sem7,
                 Sem_8: this.sem8,
                 yoa:this.student.yoa,yog:this.student.yog
                    }
                           console.log(data);
                this.app.req
        .post("auth/register",data)
        .then(response => {
          console.log(response.data);
          this.app.user = response.data[0];
          this.app.student = response.data[1];
          this.$router.push("/");
        })
        .catch(error => {
            this.errors.push(error.response.data.error);
        });
                  }
               }
         
            }
  }
}
</script>

<style scoped>
DatePicker{
  height:300px;
  width:15000px
}
</style>