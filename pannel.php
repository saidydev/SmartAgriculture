<?php
require 'connection.PHP';

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="CSS/pannel.css">
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
                    <a href="" class="logout">
                        <i class="fa-solid fa-sign-out"></i>
                        <span>Logout</span>
                    </a>
                </nav>
            </div>
        </div>
        <div class="content">
            <?php
            require 'connection.php';     

           
            $msg = '';
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                $temp      = floatval($_POST['temp_threshold']);
                $humidity  = intval($_POST['humidity_threshold']);
                $wind      = floatval($_POST['wind_threshold']);
                $dew       = floatval($_POST['dew_threshold']);
                $interval  = intval($_POST['refresh_interval_secs']);

                $sql = "
        UPDATE config SET
            temp_threshold        = ?,
            humidity_threshold    = ?,
            wind_threshold        = ?,
            dew_threshold         = ?,
            refresh_interval_secs = ?
        WHERE id = 1
        LIMIT 1;
    ";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("diddi", $temp, $humidity, $wind, $dew, $interval);
                if ($stmt->execute()) {
                    $msg = "Settings saved!";
                } else {
                    $msg = "Error: " . $stmt->error;
                }
                $stmt->close();
            }

            // ---------- fetch current config ----------
            $result = $conn->query("SELECT * FROM config WHERE id = 1 LIMIT 1");
            $config = $result->fetch_assoc();
            ?>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Control Panel – Smart Agriculture</title>
                <link rel="stylesheet" href="assets/control.css">
                <link rel="stylesheet" href="fontawesome-free-6.5.1-web/css/all.css">
            </head>

            <body>
                <section class="panel">
                    <h1><i class="fa-solid fa-sliders"></i> Control Panel</h1>

                    <?php if ($msg): ?>
                        <div class="flash"><?= htmlspecialchars($msg) ?></div>
                    <?php endif; ?>

                    <form method="post" class="grid">
                        <label>
                            <span>Temperature threshold (°C)</span>
                            <input type="number" step="0.1" name="temp_threshold"
                                value="<?= $config['temp_threshold'] ?>" required>
                        </label>

                        <label>
                            <span>Humidity threshold (%)</span>
                            <input type="number" name="humidity_threshold" min="0" max="100"
                                value="<?= $config['humidity_threshold'] ?>" required>
                        </label>

                        <label>
                            <span>Wind-speed threshold (m/s)</span>
                            <input type="number" step="0.1" name="wind_threshold"
                                value="<?= $config['wind_threshold'] ?>" required>
                        </label>

                        <label>
                            <span>Dew-point threshold (°C)</span>
                            <input type="number" step="0.1" name="dew_threshold"
                                value="<?= $config['dew_threshold'] ?>" required>
                        </label>

                        <label>
                            <span>Dashboard refresh interval (seconds)</span>
                            <input type="number" name="refresh_interval_secs" min="5" max="300"
                                value="<?= $config['refresh_interval_secs'] ?>" required>
                        </label>
                        <lebel>
                            <button type="submit" class="save">
                                <i class="fa-solid fa-floppy-disk"></i> Save settings
                            </button>
                        </lebel>

                    </form>
                </section>
            </body>

            </html>

        </div>
    </section>
    <script src="index.js"></script>
</body>

</html>