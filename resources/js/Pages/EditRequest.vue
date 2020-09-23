<template>
  <div class="container mt-3">
    <h3>REQUESTS</h3>
    <div class="card mt-3">
    <table>
      <thead class="card-header"> <tr> <th width="20%" class=" text-center px-3">PROFESSOR</th> <th width="20%" class=" text-center px-3">STATUS</th> </tr> </thead>
      <tbody class="card-body"> 
        <tr v-for="req in requests" :key='req.id'> 
              <td width="20%"  class="pt-2 text-center px-3 h5 font-weight-bold" style="color:#152266">{{req.professor}}</td> 
              <td v-show="req.status  == 0 " width="20%" class="pt-2 text-center px-3 text-warning font-weight-bold">PENDING</td>
              <td  v-show="req.status == 1 " width="20%" class="pt-2   text-center  text-success font-weight-bold">
               <div class="row  justify-content-center">
                 <div class="col-lg-4 h4 mt-1">ACCEPTED</div>
               <div v-show="req.Done == '0000-00-00' " class="col-lg-3 " > 
                 <button @click='edit(req.id,req.professor)' v-show="req.status == 1 " class=" btn btn-danger btn-md">Edit</button>
                 </div></div>
                    
              <td v-show="req.status == 2 " width="30%" class="pt-3 text-center px-3 text-danger font-weight-bold"> DECLINED</td> 
              </tr>
      </tbody>
    </table>
    </div>
    </div>
</template>

<script>
export default { 
props:['app'],
data(){
  return{
    requests:[],prof:'',
  }
},
  created(){

    this.app.req.get('auth/req/'+this.app.student.id)
    .then((response) => {
      console.log(response.data);
        this.requests = response.data;
        this.prof = response.data[0].professor;
         console.log(this.requests)} );
      
  },
  methods:{
    edit(id,prof){
      this.app.reqID = id;
      this.app.prof = prof;
      this.$router.push('/EditRequestData');
    }
  }
      

  }


</script>

<style>

</style>