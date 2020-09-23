<template>
  <div class="container">
    
    <div class="card mt-3">
      <div class="card ">
      <div class="card-header text-center">REQUESTS</div>
      <div class="card-body">
   
        <div  class="row  justify-content-center mb-2" style="height:60px">
                  <div class="col-lg-10    px-0 mr-2" v-for="req in data" :key='req.id'>
                   <a href="javascript:void()" @click="nav(req.id)"><div class="row  justify-content-center">
                  
                  <div class="col-lg-4 border rounded    ml-4 mx-0 px-0  ">
                      <div class="row  justify-content-center mt-3 ">
                          <div class="col-lg-12  text-center h5 px-0 mx-0">{{req.professor}}</div>
                      </div>
                  </div>
                    </div></a>
                  </div>
        </div>
      </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props:['app'],
  data(){
    return{
      data:''
    }
  },
  created(){
    this.app.req.get('auth/feed1').then(res =>{
       this.data = res.data;
    });
  },
  methods:{

    nav(id){
       this.app.reqID = id;
       this.$router.push('/feedback2');
    }
  }

}
</script>

<style>

</style>