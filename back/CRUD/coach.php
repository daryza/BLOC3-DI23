<?php
require_once dirname(__DIR__) . '/connexion.php';

/*
Create = /
Read =  -> 
Update =  -> 
Delete = /
*/

####################### READ #######################

function getCoachNameByClubId($clubId) {
    $db = connexionDB();
    try {
        $sql = "SELECT coach_name FROM coach INNER JOIN coach_job ON coach.coach_job_name_id = coach_job.id WHERE club_id = :clubId AND coach_job_name = 'entraineur'";
        $req = $db->prepare($sql);
        $req->bindValue(':clubId', $clubId, PDO::PARAM_INT);
        $req->execute();
        $result = $req->fetch(PDO::FETCH_ASSOC);
        return $result['coach_name'];
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

function getCoachByClubIdAndRole($club_id, $role_id) {
    $db = connexionDB();
    try {
        $sql = "SELECT coach_name FROM coach WHERE club_id = :club_id AND coach_job_name_id = :role_id";
        $req = $db->prepare($sql);
        $req->bindParam(':club_id', $club_id, PDO::PARAM_INT);
        $req->bindParam(':role_id', $role_id, PDO::PARAM_INT);
        $req->execute();
        $result = $req->fetch(PDO::FETCH_ASSOC);
        return $result ? $result['coach_name'] : null;
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return null;
    }
}