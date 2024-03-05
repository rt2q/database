<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
// Database configuration
$servername = "localhost";
$username = "root"; 
$password = ""; 
$dbname = "researchers"; 

// Create database connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch form submissions
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['save'])) {
    $projectName = mysqli_real_escape_string($conn, $_POST['projects-name']);
    $projectDuration = mysqli_real_escape_string($conn, $_POST['projects-duration']);
    $projectNature = mysqli_real_escape_string($conn, $_POST['projects-nature']);
    $projectPurpose = mysqli_real_escape_string($conn, $_POST['projects-purpose']);

    // Insert data into database
    $sql = "INSERT INTO project (name, duration, nature, purpose) 
            VALUES ('$projectName', '$projectDuration', '$projectNature', '$projectPurpose')";

    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
 
// Close database connection
$conn->close();
?>php

