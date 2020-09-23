<template>
  <div class="container ">
      <div class="card">
          <div class="card-header text-center">STUDENT INFO</div>
          <div class="card-body h6">

          <div class="row mt-2 mb-2 justify-content-center">
              
            <img class="img-fluid"   :src="'files\\profile_image\\'+app.info[0]" alt="your image" />
              <!--height="200" min-width="200"-->
          </div>

          <div class="row h3 mt-3 justify-content-center">
            {{app.info[1]}}
          </div>

          <div class="row mt-4 mb-2 justify-content-center ">
            <div class="col-lg-3 text text-center  ">YEAR OF GRADUATION</div>
            <div class="text-center col-lg-3 text ">{{this.app.info[2]}}</div> 
          </div>

          <div class="row mt-4 mb-2 h5 justify-content-center">
              <table>
                  <thead> <tr> <th style="width:600px">COURSE</th> <th   style="width:200px">UNIVERSITY</th> 
                               <th   style="width:150px">DEADLINE</th> <th   style="width:200px">COUNTDOWN</th> 
                         </tr> 
                  </thead>
                  <tbody> <tr style="height:50px"> <td  >{{app.info[8].course}}</td> 
                               <td >{{app.info[8].university}}</td> 
                               <td >{{app.info[8].deadline}}</td>
                               <td ><countdown :date="app.info[8].deadline"></countdown></td>
                          </tr>
                  </tbody>
              </table>
          </div>

          <div class="row mt-4 mb-2 h5 justify-content-center">
              <table>
                  <thead> <tr> <th style="width:600px">ACTIVITY</th> <th   style="width:400px">MARKS/CERTIFICATE</th> 
                   
                         </tr> 
                  </thead>
                  <tbody> <tr style="height:50px" v-for="a in app.info[3]" :key="a"> 
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
                  <tbody> <tr style="height:50px" v-for="ac in app.info[4]" :key="ac"> 
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
                  <tbody> <tr style="height:50px" v-for="ca in app.info[5]" :key="ca"> 
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
                  <tbody> <tr style="height:50px" v-for="ea in app.info[6]" :key="ea"> 
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
                  <tbody> <tr style="height:50px" v-for="ns in app.info[7]" :key="ns"> 
                               <td  >{{ns.nss_activity}}</td> 
                               <td><a href='#' @click.prevent="dp(4,ns.file_name)">{{ns.file_name}}</a></td>
                          </tr>
                  </tbody>
              </table>
          </div>

        <ModFile v-show='showm' ref="info" :src="src"></ModFile>
          </div>
      </div>
      </div>

</template>

<script>
import ModFile from "../components/ModFile";
import countdown from '../components/countdown';
export default {
    props:['app'],
    data(){
        return{
        info:[],showm:false,src:'',
        }

    },
    components:{ModFile,countdown},
    methods:{
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
    else if(n==5){
      this.src = "files\\prof_activity\\"+name;
      this.showm=true;
      this.$refs.info.show();
    }
  },
    }
   

    
}



</script>

<style>
td,tr{
  border-color:black;
  border-style: solid;
  border-width: thin;
  text-align: center;
}

th{
  background-color: maroon;
  color: aliceblue;
  border-color:black;
  border-style: solid;
  border-width: thin;
  text-align: center;
}
</style>