<template>
  <div class="container row ml-5">
       <div class="row file-field justify-content-center">
                <div class="col-xs-1 col-sm-4 col-md-4 col-lg-4  text-center mb-4 mt-4">
                  <img id="blah" :src="url" alt="your image" />
                </div>
                <div class=" mx-3 col-lg-2 align-self-center">
               Add photo
              </div>
              <div class="ml-3 col-lg-5 align-self-center ">
                  <input type="file" accept="image/png,image/jpg,image/jpeg" class="mt-3" v-on:change="onFileChange" id="pic" required />
              </div>
              </div>
      </div>
</template>

<script>
export default {
     data() {
    return {
      url:"http://placehold.it/200",image:''
    }
     },

methods:{
    onFileChange(e) {
      const file = e.target.files[0];
      
      console.log(file);
      const sizeMB = file.size / 1024 / 1024;
         console.log(sizeMB);
         const sizeKB = file.size/1024;

         /*if(Math.round(sizeKB) < 220) {
          e.preventDefault();
          alert("Image size should be greater than 220 KB");
           e.target.value='';
        }
         
        else*/ if(Math.round(sizeMB) >2){
          e.preventDefault();
           alert("Image size should be less than 2MB");
           e.target.value='';
        }
        else {
        this.url = URL.createObjectURL(file);
        //this.createImage(file);
        this.$emit('pic',file);
        
      
        }
      
    },
    createImage(file){
      let reader = new FileReader();
      let vm = this;
                reader.onload = (e) => {
                    vm.image = e.target.result;
                };
      reader.readAsDataURL(file);
      //this.$emit('pic',reader.readAsDataURL(file));
      
    }
}
}
</script>

<style>
img {
  width: 200px;
  height: 200px;
}
</style>