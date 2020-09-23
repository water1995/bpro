<template>
<div class="container row  justify-content-center">
    <div class="col-lg-12 px-0 ">
        
        <div class="row mt-2    ">
        <div class="ml-4 col-lg-4 mx-0 px-0 ">
            <div class="row    ">
                <div class="col-lg-12 px-0 mx-0 text-center">
                    <label class="font-weight-bold">Activity</label>
                </div>
                <div class="col-lg-12 mx-0 mt-4 text-center">
                    <div class="row">
                  <input type="text" v-model="title" placeholder="Title" class="text-center form-control border-primary">
                </div>
                </div>
                <div class="col-lg-12 mx-0 px-0 text-center mt-1">
                  <textarea v-model="activity" placeholder="Desc" rows='4' cols='44'/>
                </div>
                <div class="col-lg-12 mx-0 px-0 text-center mt-1">
                <input style="width: 340px" @change="onFileChange" ref="file" class="text-center border border-dark" type="file">
                </div>
            </div>
        </div>
        
        <div class="col-lg-2 px-0 ">
            <div class="row">
                <div class="col-lg-12 px-0 text-center">
                    <label class="font-weight-bold">Dept</label>
                </div>
                <div class="col-lg-12 mt-4 px-0 text-center">
                  <vSelect v-model="dept" @input="sdept" :options="depts"></vSelect>
                </div>
            </div>
        </div>

        <div class="col-lg-3">
            <div class="row">
                <div class="col-lg-12 px-0 text-center">
                    <label class="font-weight-bold">Professor</label>
                </div>
                <div class="col-lg-12 mt-4 px-0 text-center">
                  <vSelect v-model="sprof" :options="prof"></vSelect>
                </div>
            </div>
        </div>

        <div class="col-lg-2">
            <div class="row">
                <div class="col-lg-12 px-0 text-center">
                    <label class="font-weight-bold">Marks</label>
                </div>
                <div class="col-lg-12 mt-4 px-0 text-center">
                  <input v-model="marks" class="text-center" type="text" placeholder="Marks / Out of"/>
                </div>
            </div>
        </div>

        

        

        <span class="ml-4 mt-5"><i @click.prevent="add" style="color:green" class="fa fa-plus-circle mt-3"></i></span>

        </div>
        <div class="row mt-3" v-for="(row,key) in rows" :key="key">
        <div class="ml-4 col-lg-4 mx-0 px-0 ">
            <div class="row  justify-content-center">

                <div class="col-lg-12 px-0 mx-0 text-center">
                    <label class="font-weight-bold">Activity</label>
                </div>

                <div class="col-lg-12 mx-0 mt-4 text-center">
                    <div class="row">
                  <input type="text" v-model="row.title"  class="text-center form-control border-primary" readonly>
                </div>
                </div>

                <div class="col-lg-12 mx-0 px-0 mt-1 text-center">
                  <textarea v-model='row.activity' rows='4' cols='44' readonly/>
                </div>

                <div class=" col-lg-12 ">
                    <div class="row justify-content-center">
                    <input type="text" style="width: 330px"  v-model='row.name' readonly/>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-lg-2 px-0 ">
            <div class="row">
                <div class="col-lg-12 px-0 text-center">
                    <label class="font-weight-bold">Dept</label>
                </div>
                <div class="col-lg-12 mt-4 px-0 text-center ">
                  <input type="text" v-model="row.dept" readonly/>
                </div>
            </div>
        </div>

        <div class="col-lg-3">
            <div class="row">
                <div class="col-lg-12 px-0 text-center">
                    <label class="font-weight-bold">Professor</label>
                </div>
                <div class="col-lg-12 mt-4 px-0 text-center ">
                  <input type="text" size="27" v-model="row.prof" readonly />
                </div>
            </div>
        </div>

        <div class="col-lg-2">
            <div class="row">
                <div class="col-lg-12 px-0 text-center">
                    <label class="font-weight-bold">Marks</label>
                </div>
                <div class="col-lg-12 mt-4 px-0 text-center">
                  <input type="text" v-model="row.marks" readonly/>
                </div>
            </div>
        </div>

         <span class="ml-4 mt-5 pt-2">
               <i @click.prevent="remove(key)" style="color:red" class="fa fa-minus-circle"></i>
           </span>

        </div>
        

  </div>
      </div>

</template>

<script>
import vSelect from 'vue-select';
export default {
    data(){
        return{
            depts:['IT','COMPS','EXTC','MECH'],dept:'',prof:[],activity:'',sprof:'',marks:'',rows:[],title:'',file:'',name:''
        }
    },
    components:{
        vSelect
    },
    methods:{
        sdept:function(){
            console.log(1);
            if(this.dept == 'IT'){
                this.prof=['Prof.Sushree Satapathy','Prof.Nilesh Ghavate','Prof.Uday Naik','Prof.Aruna Khubalkar','Prof.Sunanta Krishnan']
            }
        },
        add:function(){
            const data ={title:this.title,activity:this.activity,prof:this.sprof,marks:this.marks,pfile:this.file};
           this.rows.push({title:this.title,activity:this.activity,dept:this.dept,prof:this.sprof,
                           marks:this.marks,file:this.file,name:this.name}),
           this.title="",this.activity='',this.dept='',this.sprof='',this.marks='';this.$refs.file.value= '';
           this.$emit('req',data);
          
        },
        remove(index){
        this.rows.splice(index,2);
        this.$emit('req',index);
        },
        onFileChange(e){
         const file = e.target.files[0];
         this.name = file.name;
         const sizeMB = file.size / 1024 / 1024;
         console.log(sizeMB);
         const sizeKB = file.size/1024;
          console.log(file);

          let reader = new FileReader();
      let vm = this;
                reader.onload = (e) => {
                    vm.file = e.target.result;
                };
      reader.readAsDataURL(file);
    }
    }

}
</script>
<style src="vue-select/dist/vue-select.css"></style>
<style>

</style>