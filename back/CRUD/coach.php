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