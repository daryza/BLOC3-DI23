<?php
//$json = file_get_contents('data/data.json');
//$data = json_decode($json, true);

// echo "<pre>";
// print_r($data);
//$stadiumName = $data[2]['stadium']['name'];
//echo $stadiumName;

function addData($db, $dbName){
    $json = file_get_contents(__DIR__ . '/data/data.json');
    $data = json_decode($json, true);
    addStadium($data, $db, $dbName);
    addClub($data, $db, $dbName);
    addCoachJob($db, $dbName);
    addCoach($data, $db, $dbName);
    addPlayerPosition($data, $db, $dbName);
    addPlayer($data, $db, $dbName);
}

function addStadium($data, $db, $dbName) {
    //echo $data[2]['stadium']['name'];
    #Recuperation des données du stade
    foreach ($data as $key => $value) {
        $sql = "INSERT INTO stade (nom, capacite, ville, image) VALUES (:name, :capacite, :ville, :image)";
        $req = $db->prepare($sql);
        $req->bindValue(':name', $value['stadium']['name'], PDO::PARAM_STR);
        $req->bindValue(':capacite', $value['stadium']['capacity'], PDO::PARAM_INT);
        $req->bindValue(':ville', $value['stadium']['city'], PDO::PARAM_STR);
        $req->bindValue(':image', $value['stadium']['image'], PDO::PARAM_STR);
        $req->execute();
    }
}

function addClub($data, $db, $dbName) {
    #Recuperation des données du club
    foreach ($data as $key => $value) {
        $stade_id = $db->query("SELECT id FROM stade WHERE nom = '".$value['stadium']['name']."'")->fetch();
        $sql = "INSERT INTO club (stade_id, nom, logo) VALUES (:stade_id, :nom, :logo)";
        $req = $db->prepare($sql);
        $req->bindValue(':stade_id', $stade_id['id'], PDO::PARAM_INT);
        $req->bindValue(':nom', $value['name'], PDO::PARAM_STR);
        $req->bindValue(':logo', $value['logo'], PDO::PARAM_STR);
        $req->execute();
    }
}

function addCoachJob($db, $dbName) {
    #Recuperation des données du poste de l'entraineur
    $sql = "INSERT INTO entraineur_poste (poste) VALUES (:poste1), (:poste2)";
    $req = $db->prepare($sql);
    $req->bindValue(':poste1', "entraineur", PDO::PARAM_STR);
    $req->bindValue(':poste2', "adjoint", PDO::PARAM_STR);
    $req->execute();
}

function addCoach($data, $db, $dbName) {
    #Recuperation des données de l'entraineur
    $coach_job_id = $db->query("SELECT id FROM entraineur_poste WHERE poste = 'entraineur'")->fetch();
    foreach ($data as $key => $value) {
        $club_id = $db->query("SELECT id FROM club WHERE nom = '".$value['name']."'")->fetch();
        $sql = "INSERT INTO entraineur (nom, entraineur_poste_id, club_id) VALUES (:nom, :entraineur_poste_id, :club_id)";
        $req = $db->prepare($sql);
        $req->bindValue(':nom', $value['coach']['name'], PDO::PARAM_STR);
        $req->bindValue(':entraineur_poste_id', $coach_job_id['id'], PDO::PARAM_INT);
        $req->bindValue(':club_id', $club_id['id'], PDO::PARAM_INT);
        $req->execute();
    }
}

function addPlayerPosition($data, $db, $dbName) {
    #Recuperation des données du poste du joueur
    $plyerPosition = [];
    foreach ($data as $key => $club) {
        foreach ($club['players'] as $key => $player) {
            if (!in_array($player['position'], $plyerPosition)) {
                $plyerPosition[] = $player['position'];
             }
        }
    }
    foreach ($plyerPosition as $key => $value) {
        $sql = "INSERT INTO joueur_poste (poste) VALUES (:poste)";
        $req = $db->prepare($sql);
        $req->bindValue(':poste', $value, PDO::PARAM_STR);
        $req->execute();
    }
}

function addPlayer($data, $db, $dbName) {
    #Recuperation des données du joueur
    foreach ($data as $key => $club) {
        $club_id = $db->query("SELECT id FROM club WHERE nom = '".$club['name']."'")->fetch();
        foreach ($club['players'] as $key => $player) {
            $playerPosition_id = $db->query("SELECT id FROM joueur_poste WHERE poste = '".$player['position']."'")->fetch();
            $sql = "INSERT INTO joueur (club_id, joueur_poste_id, nom,numero) VALUES (:club_id, :joueur_poste_id, :nom, :numero)";
            $req = $db->prepare($sql);
            $req->bindValue(':club_id', $club_id['id'], PDO::PARAM_INT);
            $req->bindValue(':joueur_poste_id', $playerPosition_id['id'], PDO::PARAM_INT);
            $req->bindValue(':nom', $player['name'], PDO::PARAM_STR);
            $req->bindValue(':numero', $player['number'], PDO::PARAM_INT);
            $req->execute();
        }
    }
}