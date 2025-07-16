<?php
require 'connection.PHP';

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="CSS/index.css">
    <link rel="stylesheet" href="fontawesome-free-6.5.1-web/css/all.css">
</head>

<body>
    <section class="dashboard-section">
        <div class="side-nav">
            <div class="nav-div">
                <div class="heading">
                    <div class="sm">SA</div>
                    <span class="header">Smart Agriculture</span>
                </div>
                <nav>
                    <a href="" class="Dashboard">
                        <i class="fa-solid fa-home"></i>
                        <span>Dashboard</span>
                    </a>
                    <a href="">
                        <i class="fa-solid fa-user"></i>
                        <span>Profile</span>
                    </a>
                    <a href="">
                        <i class="fa-solid fa-shop"></i>
                        <span>Products</span>
                    </a>
                    <a href="">
                        <i class="fa-solid fa-gear"></i>
                        <span>Settings</span>
                    </a>
                    <a href="" class="logout">
                        <i class="fa-solid fa-sign-out"></i>
                        <span>Logout</span>
                    </a>
                </nav>
            </div>
        </div>
        <div class="content">
            <div class="top-bar" style="display: flex; align-items: center; gap: 10px;">
                <div class="search-container">
                    <i class="fa fa-search search-icon"></i>
                    <input type="text" placeholder="Search..." class="search-input">
                </div>
            </div>

            <div style="padding: 8px 20px;">
                <h3 style="color: green;">Dashboard</h3>
                <span>welcome to Smart Agriculture</span>
            </div>
            <?php

            $sql = "SELECT * FROM config";
            $query =mysqli_query($conn,$sql);
            if($query){
                while($row= mysqli_fetch_assoc($query)){
                    $data = $row['temp_threshold']; 
                }
                }
            $TEMP_THRESHOLD = $data;
            $sql = "SELECT * FROM dataset WHERE datetime='2025-06-23'";
            $result = mysqli_query($conn, $sql);
            if ($result) {
                while ($row = mysqli_fetch_assoc($result)) {
                    $temp = $row['temp'];
                    $humidity = $row['humidity'];
                    $wind = $row['windspeed'];
                    $water = $row['dew'];
                    echo "
                    <section class='top'>
                        <div class='container' id='temp'>
                            <div class='right'>
                               <i class='fa-solid fa-temperature-three-quarters'></i>
                            </div>
                            <div class='left'>
                            <span>Temperature (°C)</span>
                                <h1 id='tempValue'>$temp</h1>
                            </div>
                       </div>
                        <div class='container' id='water'>
                            <div class='right'>
                               <i class='fa-solid fa-water'></i>
                            </div>
                            <div class='left'>
                            <span>Dew</span>
                                <h1>$water</h1>
                            </div>
                       </div>
                        <div class='container' id='humidity'>
                            <div class='right'>
                               <i class='fa-solid fa-droplet'></i>
                            </div>
                            <div class='left'>
                            <span>Humidity (%)</span>
                                <h1>$humidity</h1>
                            </div>
                       </div>
                        <div class='container' id='wind'>
                            <div class='right'>
                               <i class='fa-solid fa-wind'></i>
                            </div>
                            <div class='left'>
                                <span>Wind (m/s)</span>
                                <h1>$wind</h1>
                            </div>
                       </div>
                    </section> 
                     <script>
      const CURRENT_TEMP   = $temp;
      const TEMP_THRESHOLD = $TEMP_THRESHOLD;
    </script>";
                }
            }
            ?>
            <div class="chart">
                <canvas id="myChart"></canvas>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        </div>
    </section>
    <script src="index.js"></script>
    <script>
document.addEventListener('DOMContentLoaded', () => {
  if (typeof CURRENT_TEMP === 'undefined') return;

  if (CURRENT_TEMP > TEMP_THRESHOLD) {
      const modal     = document.getElementById('tempModal');
      const closeBtn  = document.querySelector('.close-modal');
      const txtHolder = document.getElementById('modalText');

      txtHolder.textContent =
        `Current temperature is ${CURRENT_TEMP} °C, which exceeds the safe limit of ${TEMP_THRESHOLD} °C. ` +
        `Please take corrective action immediately.`;

      modal.style.display = 'flex';      

      closeBtn.onclick = () => modal.style.display = 'none';
      modal.onclick = e => { if (e.target === modal) modal.style.display = 'none'; };
  }
});
</script>

<div id="tempModal" class="modal">
  <div class="modal-content">
     <span class="close-modal">&times;</span>
     <h2>⚠️ High Temperature</h2>
     <p id="modalText"></p>
  </div>
</div>

</body>

</html>