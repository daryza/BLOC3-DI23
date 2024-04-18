<?php
require_once '../connexion.php';

/*
table joueur = id, club_id, joueur_post_id, nom, prenom, numero_prefere
*/

function putClubOfJoueur($joueur_id, $new_club_id) {
    $db = connexionDB();
    try {
        $sql = "UPDATE joueur SET club_id = :club_id WHERE id = :id";
        $req = $db->prepare($sql);
        $req->bindValue(':club_id', $new_club_id, PDO::PARAM_INT);
        $req->bindValue(':id', $joueur_id, PDO::PARAM_INT);
        $req->execute();
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}



//putClubOfJoueur(1, 1);