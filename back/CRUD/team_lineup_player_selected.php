<?php
require_once dirname(__DIR__) . '/connexion.php';

/*
Create = /
Read = 12 -> 102
Update = 107 -> 118
Delete = /
*/

####################### CREATE #######################
function addPlayerSelectedToTeamLineup($teamLineupId, $playerSelectedId) {
    $db = connexionDB();
    try {
        $sql = "INSERT INTO team_lineup_player_selected (team_lineup_id, player_selected_id) VALUES (:teamLineupId, :playerSelectedId)";
        $req = $db->prepare($sql);
        $req->bindParam(':teamLineupId', $teamLineupId, PDO::PARAM_INT);
        $req->bindParam(':playerSelectedId', $playerSelectedId, PDO::PARAM_INT);
        $req->execute();

        // Return true if the player has been added to the team lineup
        return true;
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return false;
    } finally {
        $db = null;
    }
}

####################### READ #######################
function getAllTeamLineupPlayerSelectedById($teamLineupId) {
    $db = connexionDB();
    try {
        $sql = "SELECT * FROM team_lineup_player_selected INNER JOIN player_selected ON team_lineup_player_selected.player_selected_id = player_selected.id WHERE team_lineup_player_selected.team_lineup_id = :teamLineupId";
        $req = $db->prepare($sql);
        $req->bindParam(':teamLineupId', $teamLineupId, PDO::PARAM_INT);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

?>