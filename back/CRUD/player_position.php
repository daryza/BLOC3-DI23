<?php
require_once dirname(__DIR__) . '/connexion.php';

/*
Create = /
Read = 12 -> 102
Update = 107 -> 118
Delete = /
*/

####################### READ #######################
function getAllPlayerPositions() {
    $db = connexionDB();
    try {
        $sql = "SELECT * FROM player_position ORDER BY id ASC";
        $req = $db->prepare($sql);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}