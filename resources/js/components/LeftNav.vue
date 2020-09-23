<template>
<div class="container-fixed float-left px-0">
  <div  class="list-group float-left ">
    <router-link  to="/AdmHome" class=" rtext text-center font-weight-bold list-group-item list-group-item-action" >
    <span class="h5">TRANSCRIPT REQUESTS</span></router-link> 
   <router-link  to="/AcceptedStudents" class=" rtext text-center font-weight-bold list-group-item list-group-item-action" >
   <span class="h5">ACCEPTED STUDENTS</span></router-link>

</div>

</div>
</template>

<script>
export default {
  props:['app']

}
</script>

<style>
.rtext{
  font-size: 16px;
}
</style>