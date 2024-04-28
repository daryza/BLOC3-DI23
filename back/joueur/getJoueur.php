<?php
require_once '../connexion.php';

function getJoueurs() {
    $db = connexionDB();
    try {
        $sql = "SELECT * FROM joueur ORDER BY id ASC";
        $req = $db->prepare($sql);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

function getJoueurById($id) {
    $db = connexionDB();
    try {
        $sql = "SELECT * FROM player WHERE id = :id";
        $req = $db->prepare($sql);
        $req->bindValue(':id', $id, PDO::PARAM_INT);
        $req->execute();
        return $req->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

function getJoueurByLastName($lastName) {
    $db = connexionDB();
    try {
        $sql = "SELECT * FROM joueur WHERE nom = :nom";
        $req = $db->prepare($sql);
        $req->bindValue(':nom', $lastName, PDO::PARAM_STR);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

function getJoueurByFirstNameAndLastName($firstName, $lastName) {
    $db = connexionDB();
    try {
        $sql = "SELECT * FROM joueur WHERE prenom = :prenom AND nom = :nom";
        $req = $db->prepare($sql);
        $req->bindValue(':prenom', $firstName, PDO::PARAM_STR);
        $req->bindValue(':nom', $lastName, PDO::PARAM_STR);
        $req->execute();
        return $req->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

function getJoueurByClub($club) {
    $db = connexionDB();
    try {
        $sql = "SELECT joueur.* FROM joueur INNER JOIN club ON joueur.club_id = club.id WHERE club.nom = :club";
        $req = $db->prepare($sql);
        $req->bindValue(':club', $club, PDO::PARAM_STR);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}   



$joueurs = getJoueurById(25);
var_dump($joueurs);