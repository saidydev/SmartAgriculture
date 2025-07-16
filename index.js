const ctx = document.getElementById('myChart').getContext('2d');

fetch("script.php")
 .then((Response)=> {
    return Response.json();
 })
 .then((data)=>{
  createChart(data,'bar')
 });

function createChart(chartData,type){
new Chart(ctx, {
  type: type,
  data: {
    labels: chartData.map(row => row.datetime),
    datasets: [
      {
        label: 'Temperature',
        data: chartData.map(row => row.temp),
        backgroundColor: 'green',
        borderWidth: 1
      },
      {
        label: 'Humidity',
        data: chartData.map(row => row.humidity),
        backgroundColor: 'blue',
        borderWidth: 1
      },
      {
        label: 'Wind speed',
        data: chartData.map(row => row.winddir),
        backgroundColor: 'red',
        borderWidth: 1
      },
    ]
  },
  options: { scales: { y: { beginAtZero: true } } }
});
}
