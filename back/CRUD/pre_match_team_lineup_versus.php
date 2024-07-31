<?php
require_once dirname(__DIR__) . '/connexion.php';

/*
Create = /
Read =  -> 
Update =  -> 
Delete = /
*/

###################### CREATE ######################
function addPreMatchTeamLineupVersus() {
    $db = connexionDB();
    try {
        $sql = "INSERT INTO pre_match_team_lineup_versus () VALUES ()";
        $req = $db->prepare($sql);
        $req->execute();
        
        // Retrun the ID of the new line created
        return $db->lastInsertId();
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    } finally {
        $db = null;
    }
}

?>