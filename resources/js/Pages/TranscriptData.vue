<template>
  <div class="container">
    <div class="card">
      <div class="card-header text-center">INFO</div>
          <div class="card-body h4">

            <div class="row mt-2   justify-content-center">
              
            <img class="img-fluid"   :src="'files\\profile_image\\'+app.info.profile_image" alt="your image" />
              <!--height="200" min-width="200"-->
          </div>

          <div class="row justify-content-center   pt-4 h3">
        <div class="col-lg-1 px-0">NAME:</div>
        <div class="  col-lg-3 ">{{app.info.name}}</div>
      </div>

      <div class="row justify-content-center    pt-4 h4">
        <span class="  text-center ">Marksheet:</span>
        <div class="mx-0 col-lg-3  "><a class="h4" href='#' @click.prevent="dp(app.info.file_name)">{{app.info.file_name}}</a></div>
      </div>

          <div class="row justify-content-center   pt-4">
        <div class="col-lg-3  text-right px-0">Copies:</div>
        <div class="  col-lg-3 ">{{app.info.copies}}</div>
        <div class="col-lg-3  text-right px-0">BRANCH:</div>
        <div class=" col-lg-3">{{app.info.branch}}</div>
      </div>

      <div class="row justify-content-center   mt-4">
        <div class="col-lg-3  text-right px-0">Recently passed exam:</div>
        <div class="  col-lg-3 ">{{app.info.RPE}}</div>
        <div class="col-lg-3  text-right px-0">Sem:</div>
        <div class=" col-lg-3">{{app.info.sem}}</div>
      </div>

      <div class="row justify-content-center mt-4  ">
        <div class="col-lg-3   px-0 text-right">Student ID:</div>
        <div class=" col-lg-3  ">{{app.info.studID}}</div>
        <div class="col-lg-3  px-0 text-right">DATE OF BIRTH:</div>
        <div class=" col-lg-3 ">{{app.info.dob}}</div>
      </div>

      <div class="row  mt-4  ">
        <div class="col-lg-3 px-0 text-right ">Address:</div>
        <div class=" col-lg-3  ">{{app.info.address}}</div>
        <div class="col-lg-3 px-0 text-right">Transcript For:</div>
        <div class=" col-lg-3 ">{{app.info.transcript_for}}</div>
      </div>

      <div class="row  mt-4  ">
        <div class="col-lg-3 px-0 text-right ">YEAR OF ADMISSION:</div>
        <div class=" col-lg-3  ">{{app.info.yoa}}</div>
        <div class="col-lg-3 px-0 text-right">YEAR OF GRADUATION:</div>
        <div class=" col-lg-3 ">{{app.info.yog}}</div>
      </div>

      <div class="row justify-content-center mt-4 mb-5 ">
        <div class="col-lg-3   px-0 text-right">EMAIL:</div>
        <div class=" col-lg-3  ">{{app.info.email}}</div>
        <div class="col-lg-3  px-0 text-right">MOBILE:</div>
        <div class=" col-lg-3 ">{{app.info.mobile}}</div>
      </div>

      <div class="row justify-content-center mt-4 mb-5 ">
        <div class="col-lg-5   px-0 text-right">I agree to pay the prescribed fee of per transcript by cash:</div>
        <div class=" col-lg-1  "><span v-show="app.info.I_agree == 1">✔️</span><span v-show="app.info.I_agree == 0">❌</span></div>
        <div class="col-lg-5  px-0 text-right">Letter For English Medium Of Instruction:</div>
        <div class=" col-lg-1 "><span v-show="app.info.Letter == 1">✔️</span><span v-show="app.info.Letter == 0">❌</span></div>
      </div>

            </div>
    </div>
    <ModFile v-show='showm' ref="info" :src="src"></ModFile>
  </div>
</template>

<script>
import ModFile from "../components/ModFile";
export default {
  props:['app'],
  data(){
    return{
        showm:false,src:'',
    }
  },
  components:{
    ModFile
    },
    methods:{
    dp(name){
      
      this.src = "files\\lor_mark\\"+name;
      this.showm=true;
      this.$refs.info.show();
    
    },
}
}
</script>

<style>

</style>