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

####################### READ #######################

function getPreMatchTeamLineupVersusById($preMatchTeamLineupVersusId) {
    $db = connexionDB();
    try {
        $sql = "SELECT * FROM pre_match_team_lineup_versus WHERE id = :preMatchTeamLineupVersusId";
        $req = $db->prepare($sql);
        $req->bindParam(':preMatchTeamLineupVersusId', $preMatchTeamLineupVersusId, PDO::PARAM_INT);
        $req->execute();
        return $req->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

####################### UPDATE #######################
function updatePreMatchTeamLineupVersus($preMatchTeamLineupVersusId, $columnName, $teamLineupId) {
    $db = connexionDB();
    try {
        $sql = "UPDATE pre_match_team_lineup_versus SET $columnName = :teamLineupId WHERE id = :preMatchTeamLineupVersusId";
        $req = $db->prepare($sql);
        $req->bindParam(':teamLineupId', $teamLineupId, PDO::PARAM_INT);
        $req->bindParam(':preMatchTeamLineupVersusId', $preMatchTeamLineupVersusId, PDO::PARAM_INT);
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