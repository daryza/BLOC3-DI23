<?php
require_once dirname(__DIR__) . '/connexion.php';

/*
Create = 12 -> 28
Read = 31 -> 45
Update = 48 -> 114
Delete = 117 -> 131
*/

####################### CREATE #######################
function addNewTeamLineup($clubId) {
    $db = connexionDB();
    try {
        $sql = "INSERT INTO team_lineup (club_id) VALUES (:club_id)";
        $req = $db->prepare($sql);
        $req->bindParam(':club_id', $clubId, PDO::PARAM_INT);
        $req->execute();

        // Retrun the ID of the new user created
        return $db->lastInsertId();
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return null;
    } finally {
        $db = null;
    }
}

####################### READ #######################

function getAllTeamLineupByClubId($clubId) {
    $db = connexionDB();
    try {
        $sql = "SELECT id FROM team_lineup WHERE club_id = :club_id";
        $req = $db->prepare($sql);
        $req->bindParam(':club_id', $clubId, PDO::PARAM_INT);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

?>