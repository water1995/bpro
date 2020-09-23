<template>
  <div class="container px-0 border border-secondary rounded h5 pb-5">

    <div class="row justify-content-center mt-3  pb-5">
      <img class="img-responsive  mt-5"  :src="'files\\profile_image\\'+app.user.profile_image" alt="your image"/>
      </div>

      <div class="row justify-content-center mt-3">
        <div class="col-lg-3  text-right px-0">NAME:</div>
        <div class="  col-lg-3 ">{{app.user.name}}</div>
        <div class="col-lg-3  text-right px-0">BRANCH:</div>
        <div class=" col-lg-3">{{app.student.branch}}</div>
      </div>

      <div class="row justify-content-center mt-4  ">
        <div class="col-lg-3   px-0 text-right">STUDENT ID:</div>
        <div class=" col-lg-3  ">{{app.student.studID}}</div>
        <div class="col-lg-3  px-0 text-right">DATE OF BIRTH:</div>
        <div class=" col-lg-3 ">{{app.student.dob}}</div>
      </div>

      <div class="row  mt-4  ">
        <div class="col-lg-3 px-0 text-right ">YEAR OF ADMISSION:</div>
        <div class=" col-lg-3  ">{{app.student.yoa}}</div>
        <div class="col-lg-3 px-0 text-right">YEAR OF GRADUATION:</div>
        <div class=" col-lg-3 ">{{app.student.yog}}</div>
      </div>

      <div class="row justify-content-center mt-4 mb-5 ">
        <div class="col-lg-3   px-0 text-right">EMAIL:</div>
        <div class=" col-lg-3  ">{{app.user.email}}</div>
        <div class="col-lg-3  px-0 text-right">MOBILE:</div>
        <div class=" col-lg-3 ">{{app.student.mobile}}</div>
      </div>
      
      </div>
</template>

<script>

export default {
  props:['app'],

}
</script>

<style>
img{
  height: 150px;
  width: 150px;
}
</style>