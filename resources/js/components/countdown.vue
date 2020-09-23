<template>
  <div class="container        text-center">
    <span v-show="this.days > 10" class="h5 ml-1 text-success">{{days}} Days LEFT </span>
    <span v-show="this.days < 10 && this.days > 5" class="h5 ml-1 text-warning">{{days}} Days LEFT </span>
    <span v-show="this.days < 5" class="h5 ml-1 text-danger">{{days}} Days LEFT </span>
    </div>
</template>

<script>
export default {
  props:['date'],
  data(){
    return{
      days:0
    }
  },
  created(){
    //console.log(Date.now());

  },
  mounted(){
    //console.log(Date.now());
    this.updateDiffs();
  },
  methods:{
    updateDiffs() {
      //console.log(Date.now());
      var date = new Date(this.date);
      var today = new Date();
      var msPerDay = 24 * 60 * 60 * 1000 ;
      var timeLeft = (date.getTime() - today.getTime());
      this.days = Math.floor(timeLeft / msPerDay);
  }

}
}
</script>

<style>

</style>