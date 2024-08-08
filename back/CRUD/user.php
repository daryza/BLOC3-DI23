<?php
require_once dirname(__DIR__) . '/connexion.php';

/*
Create = 12 -> 28
Read = 31 -> 45
Update = 48 -> 114
Delete = 117 -> 131
*/

####################### CREATE #######################
function addUser($userPseudo, $userPassword, $userFavoriteClub) {
    $db = connexionDB();
    try {
        $sql = "INSERT INTO user (user_pseudo, user_password, user_role, user_favorite_club_id) VALUES (:user_pseudo, :user_password, :user_role, :user_favorite_club_id)";
        $req = $db->prepare($sql);
        $req->bindValue(':user_pseudo', $userPseudo, PDO::PARAM_STR);
        $req->bindValue(':user_password', $userPassword, PDO::PARAM_STR);
        $req->bindValue(':user_role', 'supporter', PDO::PARAM_STR);
        $req->bindValue(':user_favorite_club_id', $userFavoriteClub, PDO::PARAM_INT);
        $req->execute();

        // Retrun the ID of the new user created
        return $db->lastInsertId();
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return null;
    } finally {
        $db = null;
    }
}

####################### READ #######################
function getUserByPseudo($userPseudo) {
    $db = connexionDB();
    try {
        $sql = "SELECT * FROM user WHERE user_pseudo = :user_pseudo";
        $req = $db->prepare($sql);
        $req->bindValue(':user_pseudo', $userPseudo, PDO::PARAM_STR);
        $req->execute();
        return $req->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return null;
    } finally {
        $db = null;
    }
}

function getUserById($userId) {
    $db = connexionDB();
    try {
        $sql = "SELECT * FROM user WHERE id = :id";
        $req = $db->prepare($sql);
        $req->bindValue(':id', $userId, PDO::PARAM_INT);
        $req->execute();
        return $req->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return null;
    } finally {
        $db = null;
    }
}
####################### UPDATE #######################
function setUserPseudo($userId, $userNewPseudo){
    $db = connexionDB();
    try {
        $sql = "UPDATE user SET user_pseudo = :user_pseudo WHERE id = :id";
        $req = $db->prepare($sql);
        $req->bindValue(':user_pseudo', $userNewPseudo, PDO::PARAM_STR);
        $req->bindValue(':id', $userId, PDO::PARAM_INT);
        $req->execute();
        return $req->fetch(PDO::FETCH_ASSOC);
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
        return $req->fetch(PDO::FETCH_ASSOC);
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
        return $req->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return null;
    } finally {
        $db = null;
    }
}

####################### DELETE #######################
function deleteUser($userId){
    $db = connexionDB();
    try {
        $sql = "DELETE FROM user WHERE id = :id";
        $req = $db->prepare($sql);
        $req->bindValue(':id', $userId, PDO::PARAM_INT);
        $req->execute();
        return true;
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return false;
    } finally {
        $db = null;
    }
}