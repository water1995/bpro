<template>
  <div class="container">
      <modal name="file" height="auto"  width="1000"   >
          <div class="card-header">
          <div class="float-right"><button @click="hide">❌</button></div>
          <div class="text-center ml-5">FILE</div>
          
          </div>
      <embed :src='this.src' frameborder="0" width="100%" height="600px">
      </modal>
      </div>
</template>

<script>
export default {
    props:['src'],
    methods:{
        show () {
    
    this.$modal.show('file');
  },
  hide () {
    this.$modal.hide('file');
  }
    }

}
</script>

<style>

</style>