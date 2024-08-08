<?php
require_once dirname(__DIR__) . '/connexion.php';

/*
Create = /
Read =  -> 
Update =  -> 
Delete = /
*/

###################### CREATE ######################

function addPreMatch($home_team_id, $visitor_team_id, $pre_match_team_lineup_versus_id, $pre_match_official_lineup_id, $date ){
    $db = connexionDB();
    try {
        $sql = "INSERT INTO pre_match (home_team_id, visitor_team_id, pre_match_team_lineup_versus_id, pre_match_official_lineup_id, date) VALUES (:home_team_id, :visitor_team_id, :pre_match_team_lineup_versus_id, :pre_match_official_lineup_id, :date)";
        $req = $db->prepare($sql);
        $req->bindParam(':home_team_id', $home_team_id);
        $req->bindParam(':visitor_team_id', $visitor_team_id);
        $req->bindParam(':pre_match_team_lineup_versus_id', $pre_match_team_lineup_versus_id);
        $req->bindParam(':pre_match_official_lineup_id', $pre_match_official_lineup_id);
        $req->bindParam(':date', $date);
        $req->execute();
        return true;
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return false;
    } finally {
        $db = null;
    }
}

####################### READ #######################

function getAllPreMatchsOfClubWithStadiumName($clubId) {
    $db = connexionDB();
    try {
        $sql = "SELECT pre_match.id, pre_match.date, pre_match.home_team_id, pre_match.visitor_team_id, pre_match.pre_match_team_lineup_versus_id, stadium.stadium_name FROM pre_match INNER JOIN club ON pre_match.home_team_id = club.id INNER JOIN stadium ON club.stadium_id = stadium.id WHERE home_team_id = :clubId OR visitor_team_id = :clubId ORDER BY date DESC";
        $req = $db->prepare($sql);
        $req->bindParam(':clubId', $clubId);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

function getPreMatchById($preMatchId) {
    $db = connexionDB();
    try {
        $sql = "SELECT pre_match.*, stadium.stadium_name FROM pre_match INNER JOIN club ON pre_match.home_team_id = club.id INNER JOIN stadium ON club.stadium_id = stadium.id WHERE pre_match.id = :preMatchId";
        $req = $db->prepare($sql);
        $req->bindParam(':preMatchId', $preMatchId);
        $req->execute();
        return $req->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

?>