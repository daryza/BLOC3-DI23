<?php
require_once dirname(__DIR__) . '/connexion.php';

/*
Create = /
Read =  -> 
Update =  -> 
Delete = /
*/

###################### CREATE ######################
function addOfficialLineUp($referee_official_id, $linesmen_left_official_id, $linesmen_right_official_id) {
    $db = connexionDB();
    try {
        $sql = "INSERT INTO pre_match_official_lineup (referee_official_id, linesmen_left_official_id, linesmen_right_official_id) VALUES (:referee_official_id, :linesmen_left_official_id, :linesmen_right_official_id)";
        $req = $db->prepare($sql);
        $req->bindParam(':referee_official_id', $referee_official_id);
        $req->bindParam(':linesmen_left_official_id', $linesmen_left_official_id);
        $req->bindParam(':linesmen_right_official_id', $linesmen_right_official_id);
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

// Check if official line up is in pre_match_official_lineup table
function getOfficialLineUp($referee_official_id, $linesmen_left_official_id, $linesmen_right_official_id) {
    $db = connexionDB();
    try {
        $sql = "SELECT id FROM pre_match_official_lineup WHERE referee_official_id = :referee_official_id AND linesmen_left_official_id = :linesmen_left_official_id AND linesmen_right_official_id = :linesmen_right_official_id";
        $req = $db->prepare($sql);
        $req->bindParam(':referee_official_id', $referee_official_id);
        $req->bindParam(':linesmen_left_official_id', $linesmen_left_official_id);
        $req->bindParam(':linesmen_right_official_id', $linesmen_right_official_id);
        $req->execute();
        $result = $req->fetch(PDO::FETCH_ASSOC);

        // If the line up is in the table, return the id else return null
        if ($result) {
            return $result['id'];
        } else {
            return null;
        }
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

?>