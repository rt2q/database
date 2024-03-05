<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$servername = "localhost";
$username = "root"; 
$password = ""; 
$dbname = "researchers"; 

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $grantsName = mysqli_real_escape_string($conn, $_POST['grants-name'] ?? '');
    $grantsDescription = mysqli_real_escape_string($conn, $_POST['grants-description'] ?? '');
    $grantsDuration = mysqli_real_escape_string($conn, $_POST['grants-duration'] ?? '');
    $grantsProject = mysqli_real_escape_string($conn, $_POST['grants-project'] ?? '');
    $grantsResearchArea = mysqli_real_escape_string($conn, $_POST['grants-researcharea'] ?? '');

    $sql = "INSERT INTO grants (name, description, duration, project, researcharea) 
            VALUES ('$grantsName', '$grantsDescription', '$grantsDuration', '$grantsProject', '$grantsResearchArea')";

    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>
