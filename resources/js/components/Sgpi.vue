<template>
  <div class="container">

      <div class="row justify-content-center">
          <div class="col-sm-3 col-lg-2">
              <label class="font-weight-bold">SGPI:</label>
          </div>
          <div class="col-sm-2 col-lg-3">
              <input type="radio"  @change="diploma=true,general=false" @click="dip" :disabled='general' required/>
              <label class="font-weight-bold ml-2">DIPLOMA</label>
          </div>
          <div class="col-sm-2 col-lg-3">
              <input type="radio"  @change="diploma=false,general=true" @click='gen' :disabled='diploma' required/>
              <label class="font-weight-bold ml-2">GENERAL</label>
          </div>
     </div>

     

     <div v-show='general || diploma' class="row  justify-content-center mt-5">
         <div  class="col-sm-6 col-lg-2">
             <label class="font-weight-bold mt-2">Current Sem:</label>
         </div>

         <div  class="col-sm-6 col-lg-2">
             <input
             v-model="student.sem"  class="mt-3" type="radio" value="6" required @click='sem(6)'
              />
                    <label class="ml-2 radio-inline font-weight-bold">SEM 6</label>
                    <!--:disabled="clicked" @change="isShowing6 = true,clicked=true,clicked6=true,clicked7=false,clicked8=false"-->
        </div>
        <div class="col-sm-4 col-lg-2">
            <input  v-model="student.sem" class="mt-3" type="radio" value="7" required @click='sem(7)'
                   />
                    <label class="ml-2 radio-inline font-weight-bold mt-1">SEM 7</label>
                    <!--:disabled="clicked"@change="isShowing7 = true,clicked=true,clicked7=true,clicked6=false,clicked8=false"-->
        </div>
        <div class="col-sm-4 col-lg-2">
            <input   v-model="student.sem" class="mt-3"  type="radio" value="8" required @click='sem(8)'
                    />
                    <label class="ml-2 radio-inline font-weight-bold mt-1">SEM 8</label>
                    <!--:disabled="clicked"@change="isShowing8 = true,clicked=true,clicked8=true,clicked6=false,clicked7=false"-->
        </div>
    </div>
</div>
</template>

<script>
export default {
    data(){
        return{
            diploma:false,general:false,student:{sem:''},
        }
    },
    methods:{
        dip:function(){
            this.$emit('dip',true);
        },
        gen:function(){
            this.$emit('gen',true);
        },

        sem:function(n){
            this.$emit('sem',n);
        },
    }

        }
    
</script>

<style>

</style>