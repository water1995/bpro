<template>
  <div class="container  ">
      <div class="form-group row justify-content-center  mx-0 px-0 mb-2 mt-3">
          <div class="col-xs-8 col-sm-4 col-lg-3 mt-1 mx-0 px-0 text-center  mr-2" >
              <span class="col-lg-12 px-2 mx-0  col-form-label font-weight-bold">
                  <label class="">Course</label>
                  </span>
                  <div class="row">
                      <input  type="text"  class="form-control border-primary" v-model="$v.course.$model" :class="{'is-invalid':$v.course.$error}"   >
                     <div class="invalid-feedback">
                   <span v-if="!$v.course.testCourse">You can only cap and small letters, space , -, and fullstop.</span>
                   </div>
                     <div class="col">
                         <div class="row mt-1">
                     <a href="#" @click.prevent="addCourse"  style="color:#191566" >Add Course</a>
                         </div>
                     </div>
                 </div>
             </div>
             
             <div class="col-xs-8 col-sm-4 col-lg-2 mt-1 text-center px-0   mr-2" >
                 <span class="col-lg-12 px-2 ml-1 col-form-label font-weight-bold"><label class="  ">Universitiy</label></span>
                     <div class="row">
                     <input  type="text"  class="form-control border-primary" v-model="$v.uni.$model" :class="{'is-invalid':$v.uni.$error}"   >
                 <div class="invalid-feedback">
                   <span v-if="!$v.uni.testText">You can only input letters and space.</span>
                   </div>
                 </div>
             </div>

             <div class="col-xs-8 col-sm-4 col-lg-3 mt-1 text-center px-0   mr-2" >
                 <span class="col-lg-12 px-2 ml-1 col-form-label font-weight-bold"><label class="  ">Dept</label></span>
                     <div class="row">
                     <input  type="text"  class="form-control border-primary" v-model="$v.dept.$model" :class="{'is-invalid':$v.uni.$error}"   >
                 <div class="invalid-feedback">
                   <span v-if="!$v.dept.testText">You can only input letters and space.</span>
                   </div>
                 </div>
             </div>
             
             <div class="col-xs-8 px-0 col-sm-4 col-lg-3 text-center ">
                 <label class=" ml-1  col-lg-12 col-form-label font-weight-bold ">LOR deadline</label>
                 <div class="col-lg-12 px-0">
                 <date-picker class='date'
                  autocomplete="on"
                  placeholder="DD-MM-YYYY"
                  v-model="deadline"
                  lang="en"
                  type="date"
                  format="DD-MM-YYYY"
                  confirm
                ></date-picker>
                 </div>
                 </div>
      </div>
      <div class="row mt-5  justify-content-center">LIST OF COURSES</div>
      <div class="form-group mx-0 row mt-2  justify-content-center" v-for="(row,key) in rows" :key="key">
          <div class="col-xs-8 col-sm-4 col-lg-3 mr-2 px-0 text-center " >
              <span class="col-lg-12 px-2 mx-0  col-form-label font-weight-bold">
                  <label class="">Course</label>
                  </span>
                  <div class="row">
                      <input  type="text"  class="form-control border-primary" v-model="row.course" :class="{'is-invalid':$v.course.$error}"   >
                     
                     <div class="col">
                         <div class="row mt-1">
                     <a href="javascript:void();" @click="removeCourse(key)" style="color:red" >Remove course</a>
                         </div>
                     </div>
                 </div>
             </div>
          <!--<span class=" px-2 col-lg-12 col-form-label font-weight-bold">
              <label class=" mt-3 ">Course:</label>
              </span>
                 <div class="col-xs-8 col-sm-4 col-lg-3 mt-3 " >
                     <div class="row">
                     <input  type="text"  class="form-control border-primary" v-model="row.course"   >
                     <div class="col">
                         <div class="row">
                     <a href="#" @click.prevent="removeCourse(key)" style="color:red" >Remove course</a>
                     
                         </div>
                     </div>
                 </div>
             </div>
             <label class="ml-2 mt-3 col-form-label font-weight-bold ">Universities:</label>-->
             <div class="text-center col-xs-8 col-sm-6 col-lg-2 px-0 ml-1 mr-2 " >
                 <span class="col-lg-12 px-2 mx-0  col-form-label font-weight-bold">
                  <label class="">Universities</label>
                  </span>

                     <input  type="text"  class="form-control border-primary" v-model="row.uniInput"   >
                     <div class="col-lg-12 px-0">
                         <div class="row justify-content-center ">
                             <a class="atext" href="javascript:void();" @click="addUniversity(key,row.uniInput)" style="color:#152266"> Insert another University</a>
                             </div>
                             <div class="row mt-4" v-for="(uni,k) in row.universities" :key="k">
                                 
                               <div class="col">{{uni.uni}}</div>
                               <!--<div class="col"><button class="btn-danger" type="button" @click.prevent="removeUniversity(key,k)">X</button></div>-->
                             </div>
                     </div>
                 </div>

                 <div class="col-xs-8 col-sm-4 col-lg-3  text-center px-0   " >
                 <span class="col-lg-12 px-2 ml-1 col-form-label font-weight-bold"><label class="  ">Dept</label></span>
                     <div class="row">
                     <input  type="text"  class="form-control border-primary" v-model="row.dept" :class="{'is-invalid':$v.uni.$error}"   >
                 <div class="col-lg-12 px-0 mt-4">
                         
                             <div class="row mt-4" v-for="(uni,k) in row.universities" :key="k">
                                 
                               <div class="col-lg-12 px-0">{{uni.dept}}</div>
                               <!--<div class="col"><button class="btn-danger" type="button" @click.prevent="removeUniversity(key,k)">X</button></div>-->
                             </div>
                     </div>
                 </div>
             </div>

                 <div class="text-center col-xs-8 col-sm-6 col-lg-3 px-0 ml-2  " >
                 <span class="col-lg-12 px-2 mx-0  col-form-label font-weight-bold">
                  <label class="">LOR deadline</label>
                  </span>
                  <date-picker class='date mt-1'
                  autocomplete="on"
                  placeholder="DD-MM-YYYY"
                  v-model="row.deadline"
                  lang="en"
                  type="date"
                  format="DD-MM-YYYY"
                  confirm
                ></date-picker>
                     <div class="col mt-5">
                         <!--<div class="row">
                             <a href="#" @click="addUniversity(key,row.uniInput)" style="color:#152266"> Insert another University</a>
                             </div>-->
                             <div class="row mt-3" v-for="(uni,k) in row.universities" :key="k">
                                 
                               <div class="col-lg-8">{{uni.deadline}}</div>
                               <div class="col"><button class="btn-danger" type="button" @click.prevent="removeUniversity(key,k)">X</button></div>
                             </div>
                     </div>
                 </div>
             <!--<label class="col-sm-4 col-lg-1 mt-3 col-form-label font-weight-bold ">Deadline</label>
            
             </div>-->
      </div>
      </div>
</template>

<script>
import DatePicker from 'vue2-datepicker';
import 'vue2-datepicker/index.css';
import {minLength,maxLength,between,sameAs,  } from 'vuelidate/lib/validators';
import {testText,testCourse,testName} from "../validator";
var moment = require('moment');
export default {
    
    components: {
       DatePicker
        },
    data() {
        return {
                rows:[],universities:[],course:'',uni:'',deadline:'',dept:'',
                professors:['Prof. Sushree Satapathy','Prof.Nilesh Ghavate','Prof. Uday Naik','Prof. Aruna Khubalkar','Prof. Sunanta Krishnan']
                }
            },
    validations:{
        textArea:{
          activities:{testText},achievements:{testText},scholarships:{testText}
        },
        course:{testCourse},uni:{testText},dept:{testName}
    },
    methods:{
         addUniversity(index,input){
        console.log(index);
        console.log(input);
        console.log(this.rows.length);
        let uni = this.rows[index].uniInput;
         let deadline =  moment(this.rows[index].deadline).format('YYYY-MM-DD');
         let dept = this.rows[index].dept;
        if(index < this.rows.length){
            let data = [index,uni,dept,deadline];
            this.$emit('course',data);
            console.log(data);
            //this.$emit('course',this.rows[index].uniInput)

        }
         let data = [this.rows[index].uniInput,this.rows[index].dept,this.rows[index].deadline];
         console.log(data);
         
        this.rows[index].universities.push({uni,dept,deadline});
        //this.$emit('course',this.rows);
        console.log(JSON.stringify(this.rows[index]));
        this.rows[index].uniInput="";
        this.rows[index].dept="";
        this.rows[index].deadline="";

    },
    removeUniversity(rowkey,unikey){
        this.rows[rowkey].universities.splice(unikey,1);
        const data ={rowkey,unikey};
        this.$emit('course',data);
    },  
    addCourse(index){
      let uni =this.uni;
      //this.student.dob = moment(this.student.dob).format('YYYY-MM-DD');
      let deadline = moment(this.deadline).format('YYYY-MM-DD');
      let dept = this.dept;
      const data= {course:this.course,universities:[{uni,dept,deadline}]};
      console.log(JSON.stringify(data));
        this.rows.push({course:this.course,universities:[{uni,dept,deadline}]});
         this.$emit('course',data);
        this.uni = '';
        this.course='';
        this.dept="";
        this.deadline="";
        
        //console.log(this.rows[1].universities);
    },
    removeCourse(index){
        console.log(index);
        this.rows.splice(index,2);
        console.log(1);
        this.$emit('course',index);
    },
    }
}
</script>
<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>
<style>
.date{
    width:250px
}
.atext{
  font-size:16px;
}
</style>