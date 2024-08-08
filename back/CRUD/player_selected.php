<?php
require_once dirname(__DIR__) . '/connexion.php';

/*
Create = /
Read = 12 -> 102
Update = 107 -> 118
Delete = /
*/

###################### CREATE ######################

function addPlayerSelected($player_id, $player_selected_position_name_id, $player_selected_captain, $player_selected_captain_substitute, $player_selected_number) {
    $db = connexionDB();
    try {
        $sql = "INSERT INTO player_selected (player_id, player_selected_position_name_id, player_selected_captain, player_selected_captain_substitute, player_selected_number) VALUES (:player_id, :player_selected_position_name_id, :player_selected_captain, :player_selected_captain_substitute, :player_selected_number)";
        $req = $db->prepare($sql);
        $req->bindParam(':player_id', $player_id, PDO::PARAM_INT);
        $req->bindParam(':player_selected_position_name_id', $player_selected_position_name_id, PDO::PARAM_INT);
        $req->bindParam(':player_selected_captain', $player_selected_captain, PDO::PARAM_BOOL);
        $req->bindParam(':player_selected_captain_substitute', $player_selected_captain_substitute, PDO::PARAM_BOOL);
        $req->bindParam(':player_selected_number', $player_selected_number, PDO::PARAM_INT);
        $req->execute();

        // Retrun the ID of the new player_selected created
        return $db->lastInsertId();
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return null;
    } finally {
        $db = null;
    }
}

####################### READ #######################
function getPlayerSelected($player_id, $player_selected_position_name_id, $player_selected_captain, $player_selected_captain_substitute) { 
    $db = connexionDB();
    try {
        $sql = "SELECT id FROM player_selected WHERE player_id = :player_id AND player_selected_position_name_id = :player_selected_position_name_id AND player_selected_captain = :player_selected_captain AND player_selected_captain_substitute = :player_selected_captain_substitute";
        $req = $db->prepare($sql);
        $req->bindParam(':player_id', $player_id, PDO::PARAM_INT);
        $req->bindParam(':player_selected_position_name_id', $player_selected_position_name_id, PDO::PARAM_INT);
        $req->bindParam(':player_selected_captain', $player_selected_captain, PDO::PARAM_BOOL);
        $req->bindParam(':player_selected_captain_substitute', $player_selected_captain_substitute, PDO::PARAM_BOOL);
        $req->execute();
        $result = $req->fetch(PDO::FETCH_ASSOC);
        return $result ? $result['id'] : null;
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return null;
    }
}