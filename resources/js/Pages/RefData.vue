<template>
  <div class="container">
      <div class="card mt-2">
          <div class="card-header h4 text-center">Rating Of Applicant</div>
         <div class="card-body h3">

        <div class="row justify-content-center mt-3 ">
        <div class="col-lg-6    px-0 ">How Long have you known the applicant?</div>
        <div class="col-lg-10 mt-1   text-center font-weight-normal ">
          <span v-show="this.data[0].years > 1">{{this.data[0].years}} years</span>
          <span v-show="this.data[0].years == 1">{{this.data[0].years}} year</span>
          </div>
        </div>

        <div class="row justify-content-center mt-4">
        <div class="col-lg-3 text-center    px-0 ">In what capacity?</div>
        <div class="col-lg-12  mt-1  text-center font-weight-normal">{{this.data[0].capacity}}</div>
      </div>

      <div class="row justify-content-center mt-4 ">
        <div class="col-lg-10 px-0 text-center   ">Please indicate the category in which you are rating the applicant:</div>
        <div class="col-lg-12 mt-2    text-center font-weight-normal">{{this.data[0].category}}
          <div class="col-lg-12    text-center font-weight-normal mt-2 ">{{'nvbhjb jadsbjdb jhhbshjsb jazbhsb jbdbfdjfbs jjbdchbds djhbhfb'}}</div>
        </div>
      </div>

        <div class="row justify-content-center mt-4 ">
        <div class="col-lg-7 text-center px-0 ">The applicant’s strengths and interests are in:</div>
        <div class="col-lg-12 text-center font-weight-normal mt-1">{{this.data[0].interests}}</div>
      </div>

       <div class="row mt-5 h4">
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
      
                  <td><span v-show="this.data[0].Intellectual_Level == '1%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Intellectual_Level == '5%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Intellectual_Level == '10%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Intellectual_Level == 'T50%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Intellectual_Level == 'L50%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Intellectual_Level == 'none'">✔️ </span></td>
                  </tr>

                  <tr><td class="  font-weight-bold">Written Communication</td>
                  <td><span v-show="this.data[0].Written_Communication == '1%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Written_Communication == '5%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Written_Communication == '10%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Written_Communication == 'T50%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Written_Communication == 'L50%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Written_Communication == 'none'">✔️ </span></td>
                  </tr>

                  <tr><td class="  font-weight-bold">Oral Communication</td>
                  <td><span v-show="this.data[0].Oral_Communication == '1%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Oral_Communication == '5%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Oral_Communication == '10%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Oral_Communication == 'T50%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Oral_Communication == 'L50%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Oral_Communication == 'none'">✔️ </span></td>
                  </tr>

                  <tr><td class="  font-weight-bold">Imagination & Creativity</td>
                  <td><span v-show="this.data[0].Imagination_Creativity == '1%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Imagination_Creativity == '5%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Imagination_Creativity == '10%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Imagination_Creativity == 'T50%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Imagination_Creativity == 'L50%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Imagination_Creativity == 'none'">✔️ </span></td>
                  </tr>

                  <tr><td class="  font-weight-bold">Work ethic</td>
                  <td><span v-show="this.data[0].Work_Ethic == '1%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Work_Ethic == '5%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Work_Ethic == '10%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Work_Ethic == 'T50%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Work_Ethic == 'L50%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Work_Ethic == 'none'">✔️ </span></td>
                  </tr>

                  <tr><td class="  font-weight-bold">Character</td>
                  <td><span v-show="this.data[0].Character == '1%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Character == '5%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Character == '10%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Character == 'T50%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Character == 'L50%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Character == 'none'">✔️ </span></td>
                  </tr>

                  <tr><td class="  font-weight-bold">Class Rank</td>
                  <td><span v-show="this.data[0].Class_Rank == '1%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Class_Rank == '5%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Class_Rank == '10%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Class_Rank == 'T50%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Class_Rank == 'L50%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Class_Rank == 'none'">✔️ </span></td>
                  </tr>

                  <tr><td class="  font-weight-bold">Teaching Ability</td>
                  <td><span v-show="this.data[0].Teaching_Ability == '1%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Teaching_Ability == '5%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Teaching_Ability == '10%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Teaching_Ability == 'T50%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Teaching_Ability == 'L50%'">✔️ </span></td>
                  <td><span v-show="this.data[0].Teaching_Ability == 'none'">✔️ </span></td>
                  </tr>
                </tbody>
              </table>
            </div>

            <div class="row mt-5 justify-content-center h4">
              <table>
                <thead><tr> <th width='20%'>RECOMMENDATION</th>
                            <th width='10%'>MASTER’S PROGRAM </th> 
                            <th width='10%'>DOCTORAL PROGRAM </th>
                            <th width='9%'>OTHER (SPECIFY)</th>
                        </tr>
                </thead>
                <tbody>
                  <tr><td class=" font-weight-bold">I recommend highly for</td>
                    
                  <td><span v-show="this.data[0].recommend_highly == 'MASTER’S PROGRAM'">✔️ </span></td>
                  <td><span v-show="this.data[0].recommend_highly == 'DOCTORAL PROGRAM'">✔️ </span></td>
                  <td><span v-show="this.data[0].recommend_highly == 'OTHER (SPECIFY)'">✔️ </span></td>
                  </tr>

                  <tr><td class="  font-weight-bold">I recommend for</td>
                  <td><span v-show="this.data[0].recommend == 'MASTER’S PROGRAM'">✔️ </span></td>
                  <td><span v-show="this.data[0].recommend == 'DOCTORAL PROGRAM'">✔️ </span></td>
                  <td><span v-show="this.data[0].recommend == 'OTHER (SPECIFY)'">✔️ </span></td>
                  </tr>

                  <tr><td class="  font-weight-bold">I recommend with reservations for</td>
                  <td><span v-show="this.data[0].reservations == 'MASTER’S PROGRAM'">✔️ </span></td>
                  <td><span v-show="this.data[0].reservations == 'DOCTORAL PROGRAM'">✔️ </span></td>
                  <td><span v-show="this.data[0].reservations == 'OTHER (SPECIFY)'">✔️ </span></td>
                  </tr>

                  <tr><td class="  font-weight-bold">I do not recommend for</td>
                    
                  <td><span v-show="this.data[0].not_recommend == 'MASTER’S PROGRAM'">✔️ </span></td>
                  <td><span v-show="this.data[0].not_recommend == 'DOCTORAL PROGRAM'">✔️ </span></td>
                  <td><span v-show="this.data[0].not_recommend == 'OTHER (SPECIFY)'">✔️ </span></td>
                  </tr>
                </tbody>
              </table>
            </div>

            <div class="row mt-4">
              <div class="col-lg-12 px-0 mt-1">Please include a statement below, or as an attachment, about the applicant’s strengths and weaknesses and potential for success in graduate school:</div>
            <div class="col-lg-12 px-0 font-weight-normal mt-1">
              {{this.data[0].statement}}
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
      data:{}
    }
  
},
  created(){

    this.app.req.get('auth/refdata/'+this.app.reqID).then((response) => {
           console.log(response.data);
           this.data = response.data;
           });
             }
  
  }
</script>

<style>
tr{
  height:50px
}
</style>