<template>
  <div class="container-fluid    pl-0">
    <div class="row justify-content-center mt-4 h4">TRANSCRIPT REQUESTS</div>
    <div class="mt-4 ml-2">
      <div class="row mb-2  h5 justify-content-center">
              <table>
                  <thead> <tr> <th style="width:200px"></th> 
                               <th style="width:120px">NAME</th>
                               <th style="width:120px">Student ID</th>
                               <!--<th style="width:100px">Date Of Birth</th>-->
                               <th style="width:80px">Branch</th> 
                               <!--<th style="width:80px">Recently Passed Exam</th>
                               <th style="width:50px">Year Of Admission</th> 
                               <th style="width:50px">Year Of Graduation</th>-->
                               <th style="width:200px">Email</th> 
                               <th style="width:130px">Mobile</th> 
                               <!--<th style="width:200px">Address</th>
                               <th style="width:100px">Transcript For</th>-->
                               <th style="width:60px">Copies</th> 
                               <th style="width:100px">I agree to pay the prescribed fee of per transcript by cash</th>
                               <th style="width:100px">Letter For English Medium Of Instruction</th>
                               <th style="width:100px">Done</th>
                               <!--<th style="width:100px">Marksheets</th>-->
                          </tr> 
                  </thead>
                  <tbody class="h5"> <tr style="height:50px" v-for="(da, index) in data" :key="da"> 
                               <td><img class="img"   :src="'files\\profile_image\\'+da.profile_image" alt="your image" /></td> 
                               <td><a href="javascript:void()" @click.prevent="sdata(index)">{{da.name}}</a></td> 
                               <td>{{da.studID}}</td> 
                               <!--<td>{{da.dob}}</td>--> 
                               <td>{{da.branch}}</td>
                               <!--<td>{{da.RPE}}</td>
                               <td>{{da.yoa}}</td> 
                               <td>{{da.yog}}</td>--> 
                               <td>{{da.email}}</td> 
                               <td>{{da.mobile}}</td> 
                               <!--<td>{{da.address}}</td> 
                               <td>{{da.transcript_for}}</td>-->
                                <td>{{da.copies}}</td> 
                                <td><span v-show="da.I_agree == 1">✔️</span></td>
                               <td><span v-show="da.Letter == 1">✔️</span></td>
                               <td><button @click='done(index,da.id)'  class="mt-2 btn btn-danger btn-sm" style="width:70px">DONE</button></td>
                               <!--<td><a href='#' @click.prevent="dp(da.file_name)">{{da.file_name}}</a></td>-->
                          </tr>
                  </tbody>
              </table>
          </div>
    </div>
    </div>
</template>

<script>
import LeftNav from '../components/LeftNav';
export default {
  props:['app'],
  data(){
    return{
    data:''
    }
  },
  components:{ LeftNav},
  created(){
    this.app.req.get('auth/transcript').then(res =>{
      this.data =res.data;
    })
  },
  methods:{
    sdata(da){
      console.log(da);
      this.app.info = this.data[da];
      this.$router.push('/TranscriptData');
    },
    done(index,id){
      const data={
        done:1,
        tid:id
      };
      this.app.req.post('auth/done',data).then(response =>{
        this.data.splice(index,1);
      })
    }
  }

}
</script>

<style>
td{
  padding-top:10px;
  padding-bottom:10px
}
</style>