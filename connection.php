<?php

$server = 'localhost';
$username = 'root';
$password = '';
$database = 'smartagriculture';

// create connection

$conn = mysqli_connect($server,$username,$password,$database);

//check connection

if(!$conn){
    echo "Connection Failed ";
}
else{
    // echo "Connection Successifully";
}

?>