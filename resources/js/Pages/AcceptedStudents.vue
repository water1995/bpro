<template>
  <div class="container">
    <div class="row">
        <div class="col-lg-6 px-0 mb-2 mt-3">
        <vSelect v-model="detail" @input="mode" :options="details"></vSelect>
        </div>
    </div>
    <div class="row justify-content-center mt-5 h4 mb-5">{{this.detail}}</div>
     <div class="chart-container mt-5 ml-5 pt-5">
     <CGPICHART  :data.sync = data></CGPICHART>
     </div>
  </div>
</template>

<script>
import vSelect from 'vue-select';
import CGPICHART from '../components/CgpiChart';
export default {
  props:['app'],
  components:{CGPICHART,vSelect},
  data(){
        return{
            details:['Colleges accepting students','Colleges accepting students based on GRE',
            'Students opting for which courses','Students getting accepted into which courses'],
            detail:'',data:'',show:false,
        }
  },
  methods:{
        mode:function(){
            console.log(1);
            if(this.detail == 'Colleges accepting students'){
             //this.show = true;
             this.app.req.get('auth/getCollege').then((response) => {
          // console.log(response.data);
         
           this.data = response.data;
             });
             }
             else if(this.detail == 'Colleges accepting students based on GRE'){
             //this.show = true;
             this.app.req.get('auth/acptGre').then((response) => {
          // console.log(response.data);
         
           this.data = response.data;
             });
             }
             else if(this.detail == 'Students opting for which courses'){
             //this.show = true;
             this.app.req.get('auth/optCourse').then((response) => {
          // console.log(response.data);
         
           this.data = response.data;
             });
             }
             else if(this.detail == 'Students getting accepted into which courses'){
             //this.show = true;
             this.app.req.get('auth/accptUni').then((response) => {
          // console.log(response.data);
         
           this.data = response.data;
             });
             }
        }
  }
}
</script>

<style>
.chart-container {
    width: 1000px;
    height:800px
}
</style>