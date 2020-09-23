<template>
  <div class="container-fluid row    px-0 justify-content-center">

      <div class="col-sm-4 col-lg-3 mt-1  ">
        <label class=" radio-inline font-weight-bold">Current Sem:</label>
        </div>
        
        <div class="col-lg-2 form-check form-check-inline">
          <input type="radio" v-on:click="endis6" id="sem6" name="sem" >
          <label class="ml-3 mt-2" for="sem6">SEM 6</label>
        </div>
          
          <div class="col-lg-2 form-check form-check-inline">
            <input type="radio" v-on:click="endis7" id="sem7" name="sem" >
            <label class="ml-3 mt-2" for="sem7">SEM 7</label>
          </div>

          <div class="col-lg-2 form-check form-check-inline">
            <input type="radio" v-on:click="endis8" id="sem8" name="sem" >
            <label class="ml-3 mt-2" for="sem8">SEM 8</label>
          </div>
                  
                  <!--centerBlock custom-control custom-radio custom-control-inline
                  <input type="radio" v-on:click="endis8" id="sem8" name="sem" class="checkbox-lg custom-control-input">
            <label class="custom-control-label" for="sem8">SEM 8</label>
                    <b-form-group label="Radios using sub-components">
                    <b-form-radio-group id="radio-group-2" v-model="selected" name="radio-sub-component">
                      <b-form-radio v-on:click="endis6" value="first">SEM 6</b-form-radio>
                      <b-form-radio v-on:click="endis7" value="second">SEM 7</b-form-radio>
                      <b-form-radio v-on:click="endis8" value="third">SEM 8</b-form-radio>
                      </b-form-radio-group>
                      </b-form-group>-->
     

                  <!--<div class="col-sm-4 col-lg-3 border border-warning">
                    <input
                      :disabled="clicked"
                      v-on:click="endis6"
                      class="mt-3 checkbox-lg border border-primary"
                      type="radio"
                        
                    />
                    <label class="ml-2 radio-inline font-weight-bold border border-danger">SEM 6</label>
                  </div>

                  <div id="7" class="col-sm-4 col-lg-3">
                    <input
                      :disabled="clicked"
                      v-on:click="endis7"
                      class="checkbox-lg"
                      type="radio"
                        
                    />
                    <label class="ml-2 radio-inline font-weight-bold ">SEM 7</label>
                  </div>
                  <div id="8" class="col-sm-4 col-lg-3">
                    <input
                      :disabled='clicked'
                      v-on:click="endis8"
                      class="checkbox-lg"
                      type="radio"
                        
                    />
                    <label class="ml-2 radio-inline font-weight-bold ">SEM 8</label>
                    
                  </div>-->
                </div>

</template>

<script>
export default {
  props:['app'],
data(){
  return{
     clicked:false
  }
},
  methods:{

    endis6:function(){
      this.$emit('insem',6);
      this.clicked=true;
    },
    endis7:function(){
      this.$emit('insem',7);
      this.clicked=true;
  },
  endis8:function(){
    this.$emit('insem',8);
   this.clicked=true;
  }
  }
  

}
</script>

<style>
.checkbox-lg {
  width: 30px; 
  height: 30px;
  }
input[type=radio]{
  transform:scale(2.5);
}
</style>