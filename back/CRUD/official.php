<?php
require_once dirname(__DIR__) . '/connexion.php';

/*
Create = /
Read =  -> 
Update =  -> 
Delete = /
*/

####################### READ #######################
function getAllOfficials() {
    $db = connexionDB();
    try {
        $sql = "SELECT * FROM official ORDER BY official_name ASC";
        $req = $db->prepare($sql);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}
//echo "<pre>";
//var_dump(getAllOfficials());

function getOfficialByName($official_name) {
    $db = connexionDB();
    try {
        $sql = "SELECT id FROM official WHERE official_name = :official_name";
        $req = $db->prepare($sql);
        $req->bindParam(':official_name', $official_name);
        $req->execute();
        return $req->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}
//echo "<pre>";
//var_dump(getOfficialByName("Valentin Evrard"));
?>