<?php
// Establecer conexión con la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "words_db";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Procesar el formulario cuando se envía
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $word = $_POST['word'];

    // Preparar y ejecutar la consulta SQL
    $sql = "SELECT * FROM words WHERE word = '$word'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        echo "Inicio de sesión exitoso.";
    } else {
        echo "La palabra no coincide con ninguna palabra guardada.";
    }
}

// Cerrar la conexión
$conn->close();

