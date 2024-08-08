<?php
require_once dirname(__DIR__) . '/connexion.php';

/*
Create = /
Read =  -> 
Update =  -> 
Delete = /
*/

####################### READ #######################

function getAllClubs() {
    $db = connexionDB();
    try {
        $sql = "SELECT * FROM club ORDER BY club_name ASC";
        $req = $db->prepare($sql);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

function getAllClubsName() {
    $db = connexionDB();
    try {
        $sql = "SELECT club_name FROM club ORDER BY club_name ASC";
        $req = $db->prepare($sql);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}
//echo "<pre>";
//var_dump(getAllClubs());

function getClubNameById($clubId) {
    $db = connexionDB();
    try {
        $sql = "SELECT club_name FROM club WHERE id = :clubId";
        $req = $db->prepare($sql);
        $req->bindValue(':clubId', $clubId, PDO::PARAM_INT);
        $req->execute();
        $result = $req->fetch(PDO::FETCH_ASSOC);
        return $result['club_name'];
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

function getClubIdByName($clubName) {
    $db = connexionDB();
    try {
        $sql = "SELECT id FROM club WHERE club_name = :clubName";
        $req = $db->prepare($sql);
        $req->bindValue(':clubName', $clubName, PDO::PARAM_STR);
        $req->execute();
        $result = $req->fetch(PDO::FETCH_ASSOC);
        return $result['id'];
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

function getStadiumByClubName($clubName) {
    $db = connexionDB();
    try {
        $sql = "SELECT stadium_name FROM club INNER JOIN stadium ON club.stadium_id = stadium.id WHERE club_name = :clubName";
        $req = $db->prepare($sql);
        $req->bindValue(':clubName', $clubName, PDO::PARAM_STR);
        $req->execute();
        return $req->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

function getAllclubsWithStadium() {
    $db = connexionDB();
    try {
        $sql = "SELECT club_name, stadium_name FROM club INNER JOIN stadium ON club.stadium_id = stadium.id ORDER BY club_name ASC";
        $req = $db->prepare($sql);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}