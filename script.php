<?php
$conn = mysqli_connect("localhost", "root", "", "smartagriculture");

if (!$conn) {
    die("Database connection failed: " . mysqli_connect_error());
}

$sql    = "SELECT * FROM dataset LIMIT 6";
$result = mysqli_query($conn, $sql);

$data = [];
if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = $row;        
    }
    mysqli_free_result($result); 
}

mysqli_close($conn);

header('Content-Type: application/json');
echo json_encode($data);
?>
