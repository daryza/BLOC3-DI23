<?php
require_once dirname(__DIR__) . '/connexion.php';

// Insparation from https://www.youtube.com/watch?v=Y3GWO76xIjQ&ab_channel=Grafikart.fr

/*
Create = /
Read =  -> 
Update =  -> 
Delete = /
*/

####################### READ #######################

/*
function getAll($table, $data){
    $db = connexionDB();
    try {
        $sql = "SELECT * FROM " + $table + "ORDER BY official_name ASC";
        $req = $db->prepare($sql);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}
*/

function getPDOParamType($value) {
    switch (true) {
        case is_int($value):
            return PDO::PARAM_INT;
        case is_bool($value):
            return PDO::PARAM_BOOL;
        case is_null($value):
            return PDO::PARAM_NULL;
        default:
            return PDO::PARAM_STR;
    }
}

function read($table, $fields = [],  $conditions = []) {
    if ($fields) {
        // Separate the array elements with a comma into a string
        $fields = implode(", ", $fields);
    } else {
        $fields = "*";
    }
    $pdo = connexionDB();
    $sql = "SELECT $fields FROM $table";
    
    if (!empty($conditions)) {
        $sql .= " WHERE " . implode(" AND ", array_map(function($key) {
            return "$key = :$key";
        }, array_keys($conditions)));
    }
    echo $sql;
    $stmt = $pdo->prepare($sql);
    
    foreach ($conditions as $key => &$val) {
        $stmt->bindValue(":$key", $val, getPDOParamType($val));
    }

    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}
// $conditions = ['id' => 2];
// $conditions = ['official_name' => 'Julien Aube'];
// $user = read('official', $conditions);
//$user = read('official');
$user = read('player', ["club_id", "player_picture"] ,['club_id' => 2]);
//$user = read('official', ['official_name'], ['id' => 2]);
echo "<pre>";
var_dump($user);