<?php

$config = require __DIR__ . '/config.php';

$conn = new mysqli(
    $config['servername'],
    $config['username'],
    $config['password'],
    $config['dbname']
);

if ($conn->connect_error) {
    die("DB Connect failed: " . $conn->connect_error);
}
?>