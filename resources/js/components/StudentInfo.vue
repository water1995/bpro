<template>
<div class="container">
  <!--<a href="/#Student-info" @click.prevent="show">Student-info</a>-->
  <modal name="hello-world" height="auto" width="800" :scrollable='true' resizable:true >
    <!--<div class="ActivityGraphWrapper">-->
       
      <div class="card">
        
        <div class="card-header">
          <div class="float-right"><button @click="hide">❌</button></div>
          <div class="text-center ml-5">Student Info</div>
          
          </div>
        <div class="card-body">

           <div class="row mt-2 mb-2 justify-content-center">
              
            <img class="img-fluid"   :src="'files\\profile_image\\'+data[0]" alt="your image" />
              <!--height="200" min-width="200"-->
          </div>

          <div class="row h3 mt-3 justify-content-center">
            {{data[1]}}
          </div>

          <div class="row mt-4 mb-2 justify-content-center ">
            <div class="col-lg-4 text text-center  ">YEAR OF GRADUATION</div>
            <div class="text-center col-lg-4 text ">{{data[2]}}</div> 
          </div>

          <div class="row mt-4 mb-2 h5 justify-content-center">
              <table>
                  <thead> <tr> <th style="width:600px">COURSE</th> <th style="width:200px">UNIVERSITY</th> 
                               <th   style="width:150px">DEADLINE</th> 
                         </tr> 
                  </thead>
                  <tbody> <tr style="height:50px" v-for='data in data[8]' :key="data"> 
                    <td  >{{data.course}}</td> 
                               <td >{{data.university}}</td> 
                               <td >{{data.deadline}}</td>
                          </tr>
                  </tbody>
              </table>
          </div>

          <div class="row mt-4 mb-2 h5 justify-content-center">
              <table>
                  <thead> <tr> <th style="width:600px">ACTIVITY</th> <th   style="width:400px">MARKS/CERTIFICATE</th> </tr>
                         
                  </thead>
                  <tbody> <tr style="height:50px" v-for="a in data[3]" :key="a"> 
                               <td  >{{a.activity}}</td> 
                               <td v-show="a.marks!= 0">{{a.marks}}</td> 
                               <td v-show="a.file_name!= null"><a href='#' @click.prevent="dp(4,ac.file_name)">{{a.file_name}}</a></td>
                          </tr>
                  </tbody>
              </table>
          </div>

          <div class="row mt-4 mb-2 h5 justify-content-center">
              <table>
                  <thead> <tr> <th style="width:600px">ACADEMIC ACHIEVEMENTS</th> <th   style="width:400px">FILE</th> 
                         </tr> 
                  </thead>
                  <tbody> <tr style="height:50px" v-for="ac in data[4]" :key="ac"> 
                               <td  >{{ac.achievement}}</td> 
                               <td><a href='#' @click.prevent="dp(1,ac.file_name)">{{ac.file_name}}</a></td>
                          </tr>
                  </tbody>
              </table>
          </div>

          <div class="row mt-4 mb-2 h5 justify-content-center">
              <table>
                  <thead> <tr> <th style="width:600px">CO-CURRICULAR ACTIVITIES</th> <th   style="width:400px">FILE</th> 
                         </tr> 
                  </thead>
                  <tbody> <tr style="height:50px" v-for="ca in data[5]" :key="ca"> 
                               <td  >{{ca.activity}}</td> 
                               <td><a href='#' @click.prevent="dp(2,ca.file_name)">{{ca.file_name}}</a></td>
                          </tr>
                  </tbody>
              </table>
          </div>

          <div class="row mt-4 mb-2 h5 justify-content-center">
              <table>
                  <thead> <tr> <th style="width:600px">EXTRA-CURRICULAR ACTIVITIES</th> <th   style="width:400px">FILE</th> 
                         </tr> 
                  </thead>
                  <tbody> <tr style="height:50px" v-for="ea in data[6]" :key="ea"> 
                               <td  >{{ea.extra_curricular_activity}}</td> 
                               <td><a href='#' @click.prevent="dp(3,ea.file_name)">{{ea.file_name}}</a></td>
                          </tr>
                  </tbody>
              </table>
          </div>

          <div class="row mt-4 mb-2 h5 justify-content-center">
              <table>
                  <thead> <tr> <th style="width:600px">NSS</th> <th   style="width:400px">FILE</th> 
                         </tr> 
                  </thead>
                  <tbody> <tr style="height:50px" v-for="ns in data[7]" :key="ns"> 
                               <td  >{{ns.nss_activity}}</td> 
                               <td><a href='#' @click.prevent="dp(4,ns.file_name)">{{ns.file_name}}</a></td>
                          </tr>
                  </tbody>
              </table>
          </div>

          
        </div>
        </div>
        <ModFile v-show='showm' ref="info" :src="src"></ModFile>
        
  
</modal>
  </div>
</template>

<script>
import ModFile from "./ModFile";
import  CgpiChart  from "./CgpiChart";
export default {
  name:'StudentInfo',
  props:['app','sgpi','rdip','data'],
  data(){
    return{
        cgpi:[],showm:false,src:'',
    }
  },
    components:{
        CgpiChart,ModFile
    },
    
methods: {
  dp(n,name){
    if(n==1){
      this.src = "files\\lor_achievements\\"+name;
      this.showm=true;
      this.$refs.info.show();
    }
    else if(n==2){
      this.src = "files\\lor_activities\\"+name;
      this.showm=true;
      this.$refs.info.show();
    }
    else if(n==3){
      this.src = "files\\lor_extra\\"+name;
      this.showm=true;
      this.$refs.info.show();
    }
    else if(n==4){
      this.src = "files\\lor_nss\\"+name;
      this.showm=true;
      this.$refs.info.show();
    }
  },
  show () {
    
    this.$modal.show('hello-world');
  },
  hide () {
    this.$modal.hide('hello-world');
  }
}
}
</script>

<style>
.text{
  font-size:20px;
}

</style>