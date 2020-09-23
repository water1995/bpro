<template>
  <div class="container">
  <!--<a href="/#Student-info" @click.prevent="show">Student-info</a>-->
  <!--<modal name="hello-world" height="auto" width="800" scrollable='true' resizable:true >-->
    <!--<div class="ActivityGraphWrapper">-->
       
      <div class="card">
        <div class="card-header">
          <div class="text-center">Rating Of Applicant</div>
          </div>
        <div class="card-body">
          <div class="row justify-content center    mt-2">

            <div class="col-lg-12 px-0">

              <div class="row ">
            <div class="col-lg-4 mt-1 font-weight-bold">How Long have you known the applicant?</div>
            <div class="col-lg-1 px-0">
              <input type="text" placeholder="years" v-model="years" class="form-control border-primary"/>
              </div>
            <div class="col-lg-2 mt-1 font-weight-bold">In what capacity?</div>
            <div class="col-lg-5 px-0">
              <input type="text" v-model='capacity' class="form-control border-primary"/></div>
            </div>

            <div class="row mt-5">
            <div class="col-lg-12 font-weight-bold px-0 ">Please indicate the category in which you are rating the applicant:</div>
            <div class="col-lg-12    mt-2 px-0">
              <div class="row mt-1">
              <input class=" mr-2 mt-2 checkbox-lg" v-model="category" type="radio" value="College Seniors"><label class="mt-2 checkbox-inline mr-3  h6">College Seniors</label>
              <input class=" mr-2 mt-2 checkbox-lg" v-model="category" type="radio" value="Graduate Students"><label class="mt-2 checkbox-inline mr-3  h6">Graduate Students</label>
              <input class=" mr-2 mt-2 checkbox-lg" v-model="category" type="radio" value="Employees"><label class="mt-2 checkbox-inline mr-3  h6">Employees</label>
              <input class=" mr-2 mt-2 checkbox-lg" v-model="category" type="radio" value="Other(identify):"><label class="mt-2 checkbox-inline mr-2 h6">Other(identify):</label>
                
                
              <div class="col-lg-5 px-0"><input type="text" v-model="OtherCategory" class="form-control   border-primary"/></div>
                </div>
                </div>
              </div>
            </div>
            </div>

            <div class="row justify-content-center mt-5 ">
            <div class="col-lg-4 px-0   mt-1 font-weight-bold">The applicant’s strengths and interests are in:</div><div class="col-lg-8 px-0"><input type="text" v-model='interests' class="form-control   border-primary"/></div>
            </div>

            <div class="row mt-5">
              <table>
                <thead><tr> <th width='20%'>CRITERION</th>
                            <th width='10%'>TOP 1% (EXCEPTIONAL)</th> 
                            <th width='10%'>TOP 5% (OUTSTANDING)</th>
                            <th width='9%'>TOP 10%  (VERY GOOD)</th>
                            <th width='10%'>TOP 50% (GOOD)</th>
                            <th width='10%'>LOWER 50% (FAIR/POOR)</th> 
                            <th width='10%'>NO BASIS FOR EVALUATION</th> 
                        </tr>
                </thead>
                <tbody>
                  <tr><td class=" font-weight-bold">Intellectual Level</td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='intellectual' type="radio" value="1%"></td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='intellectual' type="radio" value="5%"></td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='intellectual' type="radio" value="10%"></td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='intellectual' type="radio" value="T50%"></td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='intellectual' type="radio" value="L50%"></td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='intellectual' type="radio" value="none"></td>
                  </tr>

                  <tr><td class="  font-weight-bold">Written Communication</td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='written' type="radio" value="1%"></td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='written' type="radio" value="5%"></td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='written' type="radio" value="10%"></td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='written' type="radio" value="T50%"></td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='written' type="radio" value="L50%"></td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='written' type="radio" value="none"></td>
                  </tr>

                  <tr><td class="  font-weight-bold">Oral Communication</td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='oral' type="radio" value="1%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='oral' type="radio" value="5%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='oral' type="radio" value="10%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='oral' type="radio" value="T50%"></td>
                  <td> <input class="mt-2 mr-2 checkbox-lg" v-model='oral' type="radio" value="L50%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='oral' type="radio" value="none"></td>
                  </tr>

                  <tr><td class="  font-weight-bold">Imagination & Creativity</td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='imagination' type="radio" value="1%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='imagination' type="radio" value="5%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='imagination' type="radio" value="10%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='imagination' type="radio" value="T50%"></td>
                  <td> <input class="mt-2 mr-2 checkbox-lg" v-model='imagination' type="radio" value="L50%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='imagination' type="radio" value="none"></td>
                  </tr>

                  <tr><td class="  font-weight-bold">Work ethic</td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='ethic' type="radio" value="1%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='ethic' type="radio" value="5%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='ethic' type="radio" value="10%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='ethic' type="radio" value="T50%"></td>
                  <td> <input class="mt-2 mr-2 checkbox-lg" v-model='ethic' type="radio" value="L50%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='ethic' type="radio" value="none"></td>
                  </tr>

                  <tr><td class="  font-weight-bold">Character</td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='character' type="radio" value="1%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='character' type="radio" value="5%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='character' type="radio" value="10%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='character' type="radio" value="T50%"></td>
                  <td> <input class="mt-2 mr-2 checkbox-lg" v-model='character' type="radio" value="L50%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='character' type="radio" value="none"></td>
                  </tr>

                  <tr><td class="  font-weight-bold">Class Rank</td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='rank' type="radio" value="1%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='rank' type="radio" value="5%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='rank' type="radio" value="10%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='rank' type="radio" value="T50%"></td>
                  <td> <input class="mt-2 mr-2 checkbox-lg" v-model='rank' type="radio" value="L50%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='rank' type="radio" value="none"></td>
                  </tr>

                  <tr><td class="  font-weight-bold">Teaching Ability</td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='ability' type="radio" value="1%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='ability' type="radio" value="5%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='ability' type="radio" value="10%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='ability' type="radio" value="T50%"></td>
                  <td> <input class="mt-2 mr-2 checkbox-lg" v-model='ability' type="radio" value="L50%"></td>
                  <td ><input class="mt-2 mr-2 checkbox-lg" v-model='ability' type="radio" value="none"></td>
                  </tr>
                </tbody>
              </table>
            </div>

            <div class="row mt-5 justify-content-center">
              <table>
                <thead><tr> <th width='20%'>RECOMMENDATION</th>
                            <th width='10%'>MASTER’S PROGRAM </th> 
                            <th width='10%'>DOCToral PROGRAM </th>
                            <th width='9%'>OTHER (SPECIFY)</th>
                        </tr>
                </thead>
                <tbody>
                  <tr><td class=" font-weight-bold">I recommend highly for</td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='RecommendHighly' type="radio" value="MASTER’S PROGRAM"></td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='RecommendHighly' type="radio" value="DOCToral PROGRAM"></td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='RecommendHighly' type="radio" value="OTHER (SPECIFY)"></td>
                  
                  </tr>

                  <tr><td class="  font-weight-bold">I recommend for</td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='Recommend' type="radio" value="MASTER’S PROGRAM"></td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='Recommend' type="radio" value="DOCToral PROGRAM"></td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='Recommend' type="radio" value="OTHER (SPECIFY)"></td>
                  
                  </tr>

                  <tr><td class="  font-weight-bold">I recommend with reservations for</td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='Reservation' type="radio" value="MASTER’S PROGRAM"></td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='Reservation' type="radio" value="DOCToral PROGRAM"></td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='Reservation' type="radio" value="OTHER (SPECIFY)"></td>
                  
                  </tr>

                  <tr><td class="  font-weight-bold">I do not recommend for</td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='NotRecommend' type="radio" value="MASTER’S PROGRAM"></td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='NotRecommend' type="radio" value="DOCToral PROGRAM"></td>
                  <td><input class="mt-2 mr-2 checkbox-lg" v-model='NotRecommend' type="radio" value="OTHER (SPECIFY)"></td>
                  
                  </tr>
                </tbody>
              </table>
            </div>
<div class="row mt-3">
  <div class="col-lg-12 px-0 mt-1 font-weight-bold">Please include a statement below, or as an attachment, about the applicant’s strengths and weaknesses and potential for success in graduate school</div>
            <div class="col-lg-12 px-0">
              <textarea class="form-control border-primary" v-model='statement' rows='10' cols='35'/></div>
</div>
            
<div class="row justify-content-center mt-4"><button @click="onSubmit" class="btn btn-secondary" >SUBMIT</button></div>
            </div>
            </div>
          
          </div>
  
</template>

<script>
export default {
  props:['app'],
  data(){
    return{
      years:'',capacity:'',category:'',OtherCategory:'',interests:'',intellectual:'',written:'',oral:'',
      imagination:'',ethic:'',character:'',rank:'',ability:'',RecommendHighly:'',Recommend:'',Reservation:'',
      NotRecommend:'',statement:''
    }
  },
methods:{

  onSubmit(){
    const data={
         id:this.app.reqID,
         years:this.years,
         capacity:this.capacity,
         category:this.category,
         OtherCategory:this.OtherCategory,
         interests:this.interests,
         statement:this.statement
    }

    this.app.req.post('auth/refdata',data)
    .then(res => res.json());

    const criteria={
         id:this.app.reqID,
         intellectual:this.intellectual,
         written:this.written,
         oral:this.oral,
         imagination:this.imagination,
         ethic:this.ethic,
         character:this.character,
         rank:this.rank,
         ability:this.ability
    }

    this.app.req.post('auth/refcriteria',criteria)
    .then(res => res.json());

    const recommend={
         id:this.app.reqID,
         RecommendHighly:this.RecommendHighly,
         Recommend:this.Recommend,
         Reservation:this.Reservation,
         NotRecommend:this.NotRecommend,
    }

    this.app.req.post('auth/refrecommend',recommend)
    .then(res => res.json()).then(this.$router.push("/AcceptedReq"));
      
      
  }
 
}
}
</script>

<style scoped>

th{
  background:rgb(168, 8, 8);
  color:white;
}

.checkbox-lg {
  width: 10px; 
  height: 20px;
  }
.checkbox-sm {
  width: 20px; 
  height: 20px;
  }

td,tr,th{
  border-color:black;
  border-style: solid;
  border-width: thin;
  text-align: center;
}


</style>
