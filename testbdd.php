<?php
$servername = "localhost";
$username = "root";
$password = "password";
$dbname = "bloc3bdd";

// Créez une connexion
$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifiez la connexion
if ($conn->connect_error) {
    die("Connexion échouée: " . $conn->connect_error);
}
echo "Connexion réussie";
?>