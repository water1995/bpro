<template>
<div class="container  px-0" >
    <div class="form-group b px-0  mx-0 row " >
        <div class="col-lg-5">
            <div class="row mx-0"><input type ="text" v-model="title" placeholder="Title" class="form-control border-primary">
            <div class="col-lg-12 mt-1 px-0">
                <textarea v-model="text" placeholder="Desc" rows='4' cols='35' />
            </div>
           </div>
        </div>
        
           <div class=" col-lg-5 px-0">
               <div class="row border border-dark">
           <input class="    " type="file" ref="file" @change="onFileChange"/>
               </div>
           </div>
           <div class="ml-2 col-lg-1 mt-1 px-0 "><i @click.prevent="add" style="color:green" class="fa fa-plus-circle"></i>
           </div>
        </div>
       <div class="mt-1 form-group mx-0 row" v-for="(row,key) in rows" :key="key">
           <div class="col-lg-5 ">
           <div class="row mx-0"><input  v-model="row.title" class="form-control border-primary" readonly>
            <div class="col-lg-12 mt-1 px-0">
                <textarea readonly v-model="row.text" rows='4' cols='35' />
            </div>
            
           </div>
           </div>
           <div class="ml-1 col-lg-5 px-0">
           <input type="text" size='36' v-model='row.name' readonly/>
           </div>
           <div class="mt-1 px-0 col-lg-1">
               <i @click.prevent="remove(key)" style="color:red" class="fa fa-minus-circle"></i>
           </div>
           
        </div>
       <!--<textarea rows="5" cols="60" v-model='$v.textArea.$model' :class="{'is-invalid':$v.textArea.$error}" placeholder="type something..."></textarea>
       <div class="invalid-feedback">
           <span v-if="!$v.textArea.testText">You can only input letters,numbers,-,/,.</span>
           </div>
       <input type="file" ref="activity" accept="application/pdf" class="     mr-1"  v-on:change="AddActivities" multiple>Add multiple files-->
   </div>
</template>

<script>
import {minLength,maxLength,between,sameAs} from 'vuelidate/lib/validators';
import {testText} from "../validator";
export default {
    data(){
        return{
            text:'',file:'',rows:[],name:'',title:''
        }
    },
    validations:{
        textArea:{
            testText
        }
    },
    methods:{
        onFileChange(e){
         const file = e.target.files[0];
         this.name = file.name;
         const sizeMB = file.size / 1024 / 1024;
         console.log(sizeMB);
         const sizeKB = file.size/1024;
          console.log(file);

          let reader = new FileReader();
      let vm = this;
                reader.onload = (e) => {
                    vm.file = e.target.result;
                };
      reader.readAsDataURL(file);
         /*if(file.type !=='application/pdf'){
            e.preventDefault();
          alert("File should be a PDF");
           e.target.value='';
         }
        else if(Math.round(sizeKB) < 10) {
          e.preventDefault();
          alert("File size should be greater than 100 KB");
           e.target.value='';
        }
        else if(Math.round(sizeMB) >60){
          e.preventDefault();
           alert("File size should be less than 1MB");
           e.target.value='';
        }
        else*/ 
        //this.file = file;
        
        
        },
        add(index){
           
           const data ={title:this.title,text:this.text,file:this.file,name:this.name};
           this.rows.push({title:this.title,text:this.text,file:this.file,name:this.name});
           this.title='',this.text = '';
           this.$refs.file.value= '';
           this.$emit('file',data);
            
        },
        remove(index){
        this.rows.splice(index,2);
        this.$emit('file',index);
        }
        
    }

}
</script>

<style>

</style>