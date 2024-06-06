<?php
header('Content-Type: application/json');

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "proepson";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die(json_encode(['success' => false, 'error' => 'Conexión fallida: ' . $conn->connect_error]));
}

$sql = "SELECT word FROM words";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $words = [];
    while ($row = $result->fetch_assoc()) {
        $words[] = $row['word'];
    }
    echo json_encode(['success' => true, 'words' => $words]);
} else {
    echo json_encode(['success' => false, 'error' => 'No se encontraron palabras.']);
}

$conn->close();