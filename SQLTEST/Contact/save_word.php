<?php
$servername = "localhost";
$username = "root"; 
$password = ""; 
$dbname = "proepson"; 


$conn = new mysqli($servername, $username, $password, $dbname);


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $word = $_POST['word'];

    
    $sql = "INSERT INTO words (word) VALUES ('$word')";

    if ($conn->query($sql) === TRUE) {
        echo "Word saved successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}


$conn->close();

