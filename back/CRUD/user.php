<?php
require_once './connexion.php';

function addUser($userPseudo, $userPassword, $userEmail, $userFavoriteClub) {
    $db = connexionDB();
    try {
        $sql = "INSERT INTO user (user_pseudo, user_password, user_email, user_role, user_favorite_club_id) VALUES (:user_pseudo, :user_password, :user_email, :user_role, :user_favorite_club_id)";
        $req = $db->prepare($sql);
        $req->bindValue(':user_pseudo', $userPseudo, PDO::PARAM_STR);
        $req->bindValue(':user_password', $userPassword, PDO::PARAM_STR);
        $req->bindValue(':user_email', $userEmail, PDO::PARAM_STR);
        $req->bindValue(':user_role', 'supporter', PDO::PARAM_STR);
        $req->bindValue(':user_favorite_club_id', $userFavoriteClub, PDO::PARAM_INT);
        $req->execute();
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    } finally {
        $db = null;
    }
}

function getUserByPseudo($userPseudo) {
    $db = connexionDB();
    try {
        $sql = "SELECT * FROM user WHERE user_pseudo = :user_pseudo";
        $req = $db->prepare($sql);
        $req->bindValue(':user_pseudo', $userPseudo, PDO::PARAM_STR);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return null;
    } finally {
        $db = null;
    }
}

function setUserPseudo($userId, $userNewPseudo){
    $db = connexionDB();
    try {
        $sql = "UPDATE user SET user_pseudo = :user_pseudo WHERE id = :id";
        $req = $db->prepare($sql);
        $req->bindValue(':user_pseudo', $userNewPseudo, PDO::PARAM_STR);
        $req->bindValue(':id', $userId, PDO::PARAM_INT);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return null;
    } finally {
        $db = null;
    }
}

function setUserEmail($userId, $userNewEmail){
    $db = connexionDB();
    try {
        $sql = "UPDATE user SET user_email = :user_email WHERE id = :id";
        $req = $db->prepare($sql);
        $req->bindValue(':user_email', $userNewEmail, PDO::PARAM_STR);
        $req->bindValue(':id', $userId, PDO::PARAM_INT);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return null;
    } finally {
        $db = null;
    }
}

function setUserPassword($userId, $userNewPassword){
    $db = connexionDB();
    try {
        $sql = "UPDATE user SET user_password = :user_password WHERE id = :id";
        $req = $db->prepare($sql);
        $req->bindValue(':user_password', $userNewPassword, PDO::PARAM_STR);
        $req->bindValue(':id', $userId, PDO::PARAM_INT);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return null;
    } finally {
        $db = null;
    }
}

function setUserFavoriteClub($userId, $userNewFavoriteClub){
    $db = connexionDB();
    try {
        $sql = "UPDATE user SET user_favorite_club_id = :user_favorite_club_id WHERE id = :id";
        $req = $db->prepare($sql);
        $req->bindValue(':user_favorite_club_id', $userNewFavoriteClub, PDO::PARAM_INT);
        $req->bindValue(':id', $userId, PDO::PARAM_INT);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return null;
    } finally {
        $db = null;
    }
}

function deleteUser($userId){
    $db = connexionDB();
    try {
        $sql = "DELETE FROM user WHERE id = :id";
        $req = $db->prepare($sql);
        $req->bindValue(':id', $userId, PDO::PARAM_INT);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return null;
    } finally {
        $db = null;
    }
}