<?php
require_once __DIR__ . '/../vendor/autoload.php';

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
        $db = new PDO('mysql:host='.$dbHost.';dbname='.$dbName.';charset=utf8', ''.$dbUser.'', ''.$dbPass.'');
        return $db;
    } catch (PDOException $e) {
        echo 'Erreur : ' . $e->getMessage();
        die();
    }
}