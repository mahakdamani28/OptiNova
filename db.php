<?php
$servername = "localhost";
$username   = "root";      
$password   = "";        
$dbname     = "optinova_db"; 
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("DB Connect failed: " . $conn->connect_error);
}
?>