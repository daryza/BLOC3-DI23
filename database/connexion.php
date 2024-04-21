<?php
require_once __DIR__ . '/../vendor/autoload.php';
require_once "create.php";

// Load .env file
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/..');
// Load environment variables
$dotenv->load();

function connexionDB() {
    $dbHost = $_ENV['DB_HOST'];
    $dbName = $_ENV['DB_NAME'];
    $dbUser = $_ENV['DB_USER'];
    $dbPass = $_ENV['DB_PASS'];
    try {
        // Connect to the MySQL server without selecting a database
        $db = new PDO('mysql:host='.$dbHost.';charset=utf8', ''.$dbUser.'', ''.$dbPass.'');

        // Check if the database exists
        checkExist($db, $dbName);

        return $db;
    } catch (PDOException $e) {
        echo 'Erreur : ' . $e->getMessage();
        die();
    }
}

function checkExist($db, $dbName) {
    $result = $db->query("SHOW DATABASES LIKE '".$dbName."'");
    if ($result->rowCount() == 0) {
        // Database does not exist, create it
        echo "Database does not exist, creating it...";
        createDB($db, $dbName);
    } else {
        $db->exec("USE ".$dbName);
    }
    return $db;
}