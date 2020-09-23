<template>
  <div class=" container form-group justify-content-center    row mb-2 mt-3 px-0 ">
  <!--{{app.app.student.sem}}-->
    <div class=" mx-0 px-0  form-group     col-sm-12 col-md-12 col-lg-12">
      <div class=" row justify-content-center ">
        <div class=" col-xs-1 col-lg-2 text-center pb-3  font-weight-bold">Marksheet:</div>
        <div class="  col-lg-5 mb-3" v-if="this.diploma == true">
          <label class="font-weight-bold pr-1">Diploma:</label><input  class="border border-dark mb-1" @change="onDipChange" type="file" :="clicked6"/> Insert a PDF file
        </div>
        <div class="   col-lg-5 ">
          <label class=" font-weight-bold pr-2 mr-1">Degree:</label><input class="border border-dark mb-1" @change="onFileChange" type="file" :="clicked6"/> Insert a PDF file
        </div>
          </div>
    </div>


  </div>
</template>

<script>
export default {
  props: ['app',"isShowing6","isShowing7","isShowing8","clicked6","clicked7","clicked8","diploma"],
  data() {
    return {
    };
  },
  methods: {

    onFileChange(e) {
        const file = e.target.files[0];
         const sizeMB = file.size / 1024 / 1024;
         console.log(sizeMB);
         const sizeKB = file.size/1024;
          console.log(file);
         if(file.type !=='application/pdf'){
            e.preventDefault();
          alert("File should be a PDF");
           e.target.value='';
         }
        /*else if(Math.round(sizeKB) < 500) {
          e.preventDefault();
          alert("File size should be greater than 500 KB");
           e.target.value='';
        }*/
        else if(Math.round(sizeMB) >1){
          e.preventDefault();
           alert("File size should be less than 1MB");
           e.target.value='';
        }
        else {
          
            this.$emit("mark", file);
          }
          
        },
    

    onDipChange(e) {
        const file = e.target.files[0];
         const sizeMB = file.size / 1024 / 1024;
         console.log(sizeMB);
         const sizeKB = file.size/1024;
          console.log(file);
         if(file.type !=='application/pdf'){
            e.preventDefault();
          alert("File should be a PDF");
           e.target.value='';
         }
        /*else if(Math.round(sizeKB) < 500) {
          e.preventDefault();
          alert("File size should be greater than 500 KB");
           e.target.value='';
        }*/
        else if(Math.round(sizeMB) >1){
          e.preventDefault();
           alert("File size should be less than 1MB");
           e.target.value='';
        }
        else {
         
            this.$emit("dmark", file);
          }
          
        }
    }
  
};
</script>

<style>
</style>