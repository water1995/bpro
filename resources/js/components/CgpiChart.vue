

<script>
import { Bar } from 'vue-chartjs'
  //Exporting this so it can be used in other components
  export default {
    props:['data'],
    extends: Bar,
    data () {
      return {
        set:'',
        datacollection: {
          //Data to be represented on x-axis
          //labels: ['NEU,Boston', 'SIT,New Jersey', 'UM,Ann Arbor', 'USF,San Francisco'],
          labels:[],
          datasets: [
            {
              label: 'Data One',
              backgroundColor: '#c97b0e',
              pointBackgroundColor: 'white',
              borderWidth: 1,
              pointBorderColor: '#249EBF',
              //Data to be represented on y-axis
              //data: [5,4,3,2],
              data:[]
            }
          ]
        },
        //Chart.js options that controls the appearance of the chart
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true,
                fontSize: 30
              },
              gridLines: {
                display: true,
                lineWidth:10,
              }
            }],
            xAxes: [ {
                ticks: {
                fontSize: 20
              },
              gridLines: {
                display: false
              }
            }]
          },
          legend: {
            display: true
          },
          responsive: true,
          maintainAspectRatio: false
        }
      }
    },
    mounted() {
      //this.set = JSON.parse(this.data);
      console.log((this.data));
      console.log(typeof(this.data));
      /*this.data.forEach(element => {
        console.log(element);
        this.datacollection.labels.push(element.university);
        this.datacollection.datasets.data.push(element.total);
      });*/

      //renderChart function renders the chart with the datacollection and options object.
      this.renderChart(this.datacollection, this.options)
    },
      watch: {
    data: function() {
      //this._chart.destroy();
      //this.data = JSON.parse(this.data);
       console.log((this.data));
      console.log(typeof(this.data));
      this.datacollection.labels =[];
        this.datacollection.datasets[0].data =[];
      this.data.forEach(element => {
        console.log(element);
        console.log(this.datacollection.labels);
        this.datacollection.datasets[0].label = 'Students';

        if(element.university != null && element.course!= null &&  element.GRE!= null){
          this.datacollection.labels.push([element.course ,element.university,element.GRE]);
        }
        else if(element.university != null && element.course!= null){
          this.datacollection.labels.push([element.course ,element.university]);
        }
        else if(element.university != null){
        this.datacollection.labels.push(element.university);
        }
        else if(element.course!= null){
          this.datacollection.labels.push(element.course);
        }
        this.datacollection.datasets[0].data.push(element.total);
      });
      //this.renderChart(this.data, this.options);
      this.renderChart(this.datacollection, this.options);
    }
  }
    
  }
</script>

