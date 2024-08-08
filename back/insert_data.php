<?php
function addData($db){
    $json = file_get_contents(__DIR__ . '/data/data.json');
    $data = json_decode($json, true);
    addNationality($data, $db);
    addStadium($data, $db);
    addClub($data, $db);
    addCoachJob($db);
    addCoach($data, $db);
    addPlayerPosition($data, $db);
    addPlayer($data, $db);
    addOfficial($db);
    addCardType($db);
    addGoalType($db);
}

function addStadium($data, $db) {
    //echo $data[2]['stadium']['name'];
    #Recuperation des données du stade
    foreach ($data as $key => $value) {
        $sql = "INSERT INTO stadium (stadium_name, stadium_capacity, stadium_city, stadium_image) VALUES (:stadium_name, :stadium_capacity, :stadium_city, :stadium_image)";
        $req = $db->prepare($sql);
        $req->bindValue(':stadium_name', $value['stadium']['name'], PDO::PARAM_STR);
        $req->bindValue(':stadium_capacity', $value['stadium']['capacity'], PDO::PARAM_INT);
        $req->bindValue(':stadium_city', $value['stadium']['city'], PDO::PARAM_STR);
        $req->bindValue(':stadium_image', $value['stadium']['image'], PDO::PARAM_STR);
        $req->execute();
    }
}

function addClub($data, $db) {
    #Recuperation des données du club
    foreach ($data as $key => $value) {
        $stadium_id = $db->query("SELECT id FROM stadium WHERE stadium_name = '".$value['stadium']['name']."'")->fetch();
        $sql = "INSERT INTO club (stadium_id, club_name, club_logo) VALUES (:stadium_id, :club_name, :club_logo)";
        $req = $db->prepare($sql);
        $req->bindValue(':stadium_id', $stadium_id['id'], PDO::PARAM_INT);
        $req->bindValue(':club_name', $value['name'], PDO::PARAM_STR);
        $req->bindValue(':club_logo', $value['logo'], PDO::PARAM_STR);
        $req->execute();
    }
}

function addCoachJob($db) {
    #Recuperation des données du poste de l'entraineur
    $sql = "INSERT INTO coach_job (coach_job_name) VALUES (:coach_job_name1), (:coach_job_name2)";
    $req = $db->prepare($sql);
    $req->bindValue(':coach_job_name1', "entraineur", PDO::PARAM_STR);
    $req->bindValue(':coach_job_name2', "adjoint", PDO::PARAM_STR);
    $req->execute();
}

function addCoach($data, $db) {
    #Recuperation des données de l'entraineur
    $coach_job_id = $db->query("SELECT id FROM coach_job WHERE coach_job_name = 'entraineur'")->fetch();
    foreach ($data as $key => $value) {
        $club_id = $db->query("SELECT id FROM club WHERE club_name = '".$value['name']."'")->fetch();
        $sql = "INSERT INTO coach (coach_name, coach_job_name_id, club_id) VALUES (:coach_name, :coach_job_name_id, :club_id)";
        $req = $db->prepare($sql);
        $req->bindValue(':coach_name', $value['coach']['name'], PDO::PARAM_STR);
        $req->bindValue(':coach_job_name_id', $coach_job_id['id'], PDO::PARAM_INT);
        $req->bindValue(':club_id', $club_id['id'], PDO::PARAM_INT);
        $req->execute();
    }
}

function addPlayerPosition($data, $db) {
    #Recuperation des données du poste du joueur
    $plyerPosition = [];
    // J'ajoute le poste de ramplaçant avavnt les autres postes
    $plyerPosition[] = "Remplaçant";
    foreach ($data as $key => $club) {
        foreach ($club['players'] as $key => $player) {
            if (!in_array($player['position'], $plyerPosition)) {
                $plyerPosition[] = $player['position'];
             }
        }
    }
    foreach ($plyerPosition as $key => $value) {
        $sql = "INSERT INTO player_position (player_position_name) VALUES (:player_position_name)";
        $req = $db->prepare($sql);
        $req->bindValue(':player_position_name', $value, PDO::PARAM_STR);
        $req->execute();
    }
}

function addNationality($data, $db) {
    #Recuperation des données de la nationalité
    $nationality = [];
    foreach ($data as $key => $club) {
        foreach ($club['players'] as $key => $player) {
            if (!array_key_exists($player['nationality'], $nationality)) {
            $nationality[$player['nationality']] = $player['nationalityFlag'];
            }
        }
    }
    foreach ($nationality as $key => $value) {
        $sql = "INSERT INTO nationality (nationality_name, nationality_flag) VALUES (:nationality_name, :nationality_flag)";
        $req = $db->prepare($sql);
        $req -> bindValue (':nationality_name', $key, PDO::PARAM_STR);
        $req -> bindValue (':nationality_flag', $value, PDO::PARAM_STR);
        $req->execute();
    }
}

function addPlayer($data, $db) {
    #Recuperation des données du joueur
    foreach ($data as $key => $club) {
        $club_id = $db->query("SELECT id FROM club WHERE club_name = '".$club['name']."'")->fetch();
        foreach ($club['players'] as $key => $player) {
            $playerPosition_id = $db->query("SELECT id FROM player_position WHERE player_position_name = '".$player['position']."'")->fetch();

            $stmt = $db->prepare("SELECT id FROM nationality WHERE nationality_name = :nationality_name");
            $stmt->bindParam(':nationality_name', $player['nationality']);
            $stmt->execute();
            $playerNationality = $stmt->fetch();

            $sql = "INSERT INTO player (club_id, player_position_name_id, nationality_id, player_name, player_number, player_picture) VALUES (:club_id, :player_position_name_id, :nationality_id,:player_name, :player_number, :player_picture)";
            $req = $db->prepare($sql);
            $req->bindValue(':club_id', $club_id['id'], PDO::PARAM_INT);
            $req->bindValue(':player_position_name_id', $playerPosition_id['id'], PDO::PARAM_INT);
            $req->bindValue(':nationality_id', $playerNationality['id'], PDO::PARAM_INT);
            $req->bindValue(':player_name', $player['name'], PDO::PARAM_STR);
            $req->bindValue(':player_number', $player['number'], PDO::PARAM_INT);
            $req->bindValue(':player_picture', $player['photo'], PDO::PARAM_STR);
            $req->execute();
        }
    }
}

function addOfficial($db) {
    #Recuperation des données de l'arbitre
    $jsonArbitre = file_get_contents(__DIR__ . '/data/data_arbitre.json');
    $dataArbitre = json_decode($jsonArbitre, true);
    foreach ($dataArbitre as $key => $value) {
        $sql = "INSERT INTO official (official_name) VALUES (:official_name)";
        $req = $db->prepare($sql);
        $req->bindValue(':official_name', $value['name'], PDO::PARAM_STR);
        $req->execute();
    }
}

function addCardType($db) {
    #Recuperation des données du type de carton
    $cartonType = ["jaune", "rouge"];
    foreach ($cartonType as $key => $value) {
        $sql = "INSERT INTO card_type (card_type_name) VALUES (:card_type_name)";
        $req = $db->prepare($sql);
        $req->bindValue(':card_type_name', $value, PDO::PARAM_STR);
        $req->execute();
    }
}

function addGoalType($db) {
    #Recuperation des données du type de but
    $goalType = ["penalty", "coup franc", "tête", "pied"];
    foreach ($goalType as $key => $value) {
        $sql = "INSERT INTO goal_type (goal_type_name) VALUES (:goal_type_name)";
        $req = $db->prepare($sql);
        $req->bindValue(':goal_type_name', $value, PDO::PARAM_STR);
        $req->execute();
    }
}