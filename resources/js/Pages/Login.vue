<template>
  <div class="container row justify-content-center">
    <div class="card mt-5" style="width:520px">
      <div class="card-header text-center">LOGIN</div>
      <div class="card-body">
        <!--<div class="col-md-12">-->
          <form class=" px-0">
            
            <div class="form-group row mt-5 justify-content-center ">
              <label
                for="email"
                class="col-sm-4 col-lg-2 text-center  col-form-label font-weight-bold "
              >Email</label>
              <div class="col-xs-8 col-sm-6 col-lg-8">
                <input
                  id="email"
                  v-model="$v.user.email.$model"
                  :class="{'is-invalid':$v.user.email.$error}"
                  type="email"
                  class="form-control border-primary"
                  name="email"
                  required
                />
                <div class="invalid-feedback">
                     <span v-if="!$v.user.email.testEmail">"Enter a valid email"</span>
                    
              </div>
              </div>
             
            </div>
            <div class="form-group row mt-5 justify-content-center  ">
              <label
                for="password"
                class="col-sm-4 col-lg-2 px-0  col-form-label font-weight-bold"
              >Password</label>
              <div class="col-xs-8 col-sm-6 col-lg-8 ">
                <input
                  id="password"
                  v-model="$v.user.password.$model"
                  :class="{'is-invalid':$v.user.password.$error}"
                  type="password"
                  class="form-control border-primary"
                  name="password"
                  required
                />
                <div class="invalid-feedback">
                     <span v-if="!$v.user.password.testPass">"Min. 8 characters with at least one capital letter, a number and a special character."</span>
                    
              </div>
              </div>
            
            </div>
            <div class="form-group row justify-content-center ml-4 mt-5">
              <button @click.prevent="onSubmit" type="submit" name="submit" class="btn btn-primary">Login</button><!--v-on:click="onSubmit()"-->
            </div>
            
          </form>
        <!--</div>-->
      </div>
    </div>
  </div>
</template>

<script>
 import {minLength,maxLength,between,sameAs} from 'vuelidate/lib/validators';
 import {testEmail,testPass} from "../validator";
export default {
 name:'login',
    props:['app'],
   
  data() {
    return {
         
      user: { email: "", password: "" }
     
    }
  },
  validations:{
      user:{

          email:{
            testEmail
            
          },
          password:{
                testPass
            },
            
            },  
  },
 
  methods: {
     
    onSubmit(){
      const data ={
        email:this.user.email,
        password:this.user.password,
        }
        console.log(data);
        this.app.req.post("auth/login",data).then(response => {
          this.app.user = response.data[0];
          
          console.log(this.app.user.role_id);

          if(this.app.user.role_id == 1){
            console.log(2);
            this.app.student = response.data[1][0];
          this.app.areq = response.data[3];
          this.app.lreq = response.data[2];
          this.app.req.post('auth/notification/get').then(response =>{
        this.app.notifications = response.data;});
          this.$router.push("/");
          }
          else if(this.app.user.role_id == 2){
                this.app.req.post('auth/notification/get').then(response =>{
        this.app.notifications = response.data;
      });
            this.$router.push("/PHome");
          }
          else{
            this.$router.push("/AdmHome");
          }
          }).catch(error => {
            this.errors.push(error.response.data.error);
            });
            }
            }
}
    
</script>

<style>

</style>