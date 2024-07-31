<?php
require_once dirname(__DIR__) . '/connexion.php';

/*
Create = /
Read =  -> 
Update =  -> 
Delete = /
*/

###################### CREATE ######################
function addPreMatch(
    $home_team_id, 
    $visitor_team_id, 
    $pre_match_team_lineup_versus_id,
    $pre_match_official_lineup_id,
    $date ){
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


?>