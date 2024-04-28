<?php
require_once './connexion.php';

function insertUser($userPseudo, $userPassword, $userEmail, $userFavoriteClub) {
    $db = connexionDB();
    try {
        $sql = "INSERT INTO user (pseudo, password, mot_de_passe, role, equipe_favorite_id) VALUES (:pseudo, :password, :mot_de_passe, :role, :equipe_favorite_id)";
        $req = $db->prepare($sql);
        $req->bindValue(':pseudo', $userPseudo, PDO::PARAM_STR);
        $req->bindValue(':mot_de_passe', $userPassword, PDO::PARAM_STR);
        $req->bindValue(':email', $userEmail, PDO::PARAM_STR);
        $req->bindValue(':role', 'supporter', PDO::PARAM_STR);
        $req->bindValue(':equipe_favorite_id', $userFavoriteClub, PDO::PARAM_INT);
        $req->execute();
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

function getUserByPseudo($userPseudo) {
    $db = connexionDB();
    try {
        $sql = "SELECT * FROM user WHERE pseudo = :pseudo";
        $req = $db->prepare($sql);
        $req->bindValue(':pseudo', $userPseudo, PDO::PARAM_STR);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}