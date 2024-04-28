<?php
function createDB($db, $dbName) {
    $tables = [
        "entraineur_poste" => "CREATE TABLE IF NOT EXISTS entraineur_poste (
            id INT AUTO_INCREMENT PRIMARY KEY,
            poste VARCHAR(255) NOT NULL
        )",
        "stade" => "CREATE TABLE IF NOT EXISTS stade (
            id INT AUTO_INCREMENT PRIMARY KEY,
            nom VARCHAR(255) NOT NULL,
            capacite INT NOT NULL,
            ville VARCHAR(255) NOT NULL,
            image VARCHAR(255) NOT NULL
        )",
        "club" => "CREATE TABLE IF NOT EXISTS club (
            id INT AUTO_INCREMENT PRIMARY KEY,
            stade_id INT NOT NULL,
            nom VARCHAR(255) NOT NULL,
            logo VARCHAR(255) NOT NULL,
            FOREIGN KEY (stade_id) REFERENCES stade(id)
        )",
        "entraineur" => "CREATE TABLE IF NOT EXISTS entraineur (
            id INT AUTO_INCREMENT PRIMARY KEY,
            entraineur_poste_id INT NOT NULL,
            club_id INT NOT NULL,
            nom VARCHAR(255) NOT NULL,
            FOREIGN KEY (club_id) REFERENCES club(id),
            FOREIGN KEY (entraineur_poste_id) REFERENCES entraineur_poste(id)
                )",
        "joueur_poste" => "CREATE TABLE IF NOT EXISTS joueur_poste (
            id INT AUTO_INCREMENT PRIMARY KEY,
            poste VARCHAR(255) NOT NULL
        )",
        "joueur" => "CREATE TABLE IF NOT EXISTS joueur (
            id INT AUTO_INCREMENT PRIMARY KEY,
            club_id INT NOT NULL,
            joueur_poste_id INT NOT NULL,
            nom VARCHAR(255) NOT NULL,
            numero INT,
            FOREIGN KEY (club_id) REFERENCES club(id),
            FOREIGN KEY (joueur_poste_id) REFERENCES joueur_poste(id)
        )",
        "joueur_selection" => "CREATE TABLE IF NOT EXISTS joueur_selection (
            id INT AUTO_INCREMENT PRIMARY KEY,
            joueur_id INT NOT NULL,
            joueur_selection_poste_id INT NOT NULL,
            titulaire BOOLEAN NOT NULL,
            capitaine BOOLEAN NOT NULL,
            suppleant BOOLEAN NOT NULL,
            joueur_selection_numero INT NOT NULL,
            FOREIGN KEY (joueur_id) REFERENCES joueur(id),
            FOREIGN KEY (joueur_selection_poste_id) REFERENCES joueur_poste(id)
        )",
        "composition_equipe" => "CREATE TABLE IF NOT EXISTS composition_equipe (
            id INT AUTO_INCREMENT PRIMARY KEY,
            club_id INT NOT NULL,
            FOREIGN KEY (club_id) REFERENCES club(id)
        )",
        "composition_equipe_joueur_selection" => "CREATE TABLE IF NOT EXISTS composition_equipe_joueur_selection (
            id INT AUTO_INCREMENT PRIMARY KEY,
            composition_equipe_id INT NOT NULL,
            joueur_selection_id INT NOT NULL,
            FOREIGN KEY (composition_equipe_id) REFERENCES composition_equipe(id),
            FOREIGN KEY (joueur_selection_id) REFERENCES joueur_selection(id)
        )",
        "preparation_match_composition_equipe" => "CREATE TABLE IF NOT EXISTS preparation_match_composition_equipe (
            id INT AUTO_INCREMENT PRIMARY KEY,
            domicile_composition_equipe_id INT NOT NULL,
            exterieur_composition_equipe_id INT NOT NULL,
            FOREIGN KEY (domicile_composition_equipe_id) REFERENCES composition_equipe(id),
            FOREIGN KEY (exterieur_composition_equipe_id) REFERENCES composition_equipe(id)
        )",
        "arbitre" => "CREATE TABLE IF NOT EXISTS arbitre (
            id INT AUTO_INCREMENT PRIMARY KEY,
            nom VARCHAR(255) NOT NULL
        )",
        "preparation_match_arbitre" => "CREATE TABLE IF NOT EXISTS preparation_match_arbitre (
            id INT AUTO_INCREMENT PRIMARY KEY,
            arbitre_central_id INT NOT NULL,
            arbitre_gauche_id INT NOT NULL,
            arbitre_droit_id INT NOT NULL
        )",
        "preparation_match" => "CREATE TABLE IF NOT EXISTS preparation_match (
            id INT AUTO_INCREMENT PRIMARY KEY,
            preparation_match_composition_equipe_id INT NOT NULL,
            preparation_match_arbitre_id INT NOT NULL,
            date DATETIME NOT NULL,
            FOREIGN KEY (preparation_match_composition_equipe_id) REFERENCES preparation_match_composition_equipe(id),
            FOREIGN KEY (preparation_match_arbitre_id) REFERENCES preparation_match_arbitre(id)
        )",
        "resultat_match" => "CREATE TABLE IF NOT EXISTS resultat_match (
            id INT AUTO_INCREMENT PRIMARY KEY,
            preparation_match_id INT NOT NULL,
            gagant_club_id INT NOT NULL,
            FOREIGN KEY (gagant_club_id) REFERENCES club(id),
            FOREIGN KEY (preparation_match_id) REFERENCES preparation_match(id)
        )",
        "remplacement" => "CREATE TABLE IF NOT EXISTS remplacement (
            id INT AUTO_INCREMENT PRIMARY KEY,
            joueur_sortant_id INT NOT NULL,
            joueur_entrant_id INT NOT NULL,
            minutes_sortie INT NOT NULL,
            FOREIGN KEY (joueur_sortant_id) REFERENCES joueur_selection(id),
            FOREIGN KEY (joueur_entrant_id) REFERENCES joueur_selection(id)
        )",
        "resultat_match_remplacement" => "CREATE TABLE IF NOT EXISTS resultat_match_remplacement (
            id INT AUTO_INCREMENT PRIMARY KEY,
            resultat_match_id INT NOT NULL,
            remplacement_id INT NOT NULL,
            FOREIGN KEY (resultat_match_id) REFERENCES resultat_match(id),
            FOREIGN KEY (remplacement_id) REFERENCES remplacement(id)
        )",
        "but_type" => "CREATE TABLE IF NOT EXISTS but_type (
            id INT AUTO_INCREMENT PRIMARY KEY,
            but_type VARCHAR(255) NOT NULL
        )",
        "but" => "CREATE TABLE IF NOT EXISTS but (
            id INT AUTO_INCREMENT PRIMARY KEY,
            joueur_id INT NOT NULL,
            but_type_id INT NOT NULL,
            minutes_but INT NOT NULL,
            FOREIGN KEY (joueur_id) REFERENCES joueur_selection(id),
            FOREIGN KEY (but_type_id) REFERENCES but_type(id)
        )",
        "resultat_match_but" => "CREATE TABLE IF NOT EXISTS resultat_match_but (
            id INT AUTO_INCREMENT PRIMARY KEY,
            resultat_match_id INT NOT NULL,
            but_id INT NOT NULL,
            FOREIGN KEY (resultat_match_id) REFERENCES resultat_match(id),
            FOREIGN KEY (but_id) REFERENCES but(id)
        )",
        "carton_type" => "CREATE TABLE IF NOT EXISTS carton_type (
            id INT AUTO_INCREMENT PRIMARY KEY,
            carton_type VARCHAR(255) NOT NULL
        )",
        "carton" => "CREATE TABLE IF NOT EXISTS carton (
            id INT AUTO_INCREMENT PRIMARY KEY,
            joueur_id INT NOT NULL,
            carton_type_id INT NOT NULL,
            minutes_carton INT NOT NULL,
            FOREIGN KEY (joueur_id) REFERENCES joueur_selection(id),
            FOREIGN KEY (carton_type_id) REFERENCES carton_type(id)
        )",
        "resultat_match_carton" => "CREATE TABLE IF NOT EXISTS resultat_match_carton (
            id INT AUTO_INCREMENT PRIMARY KEY,
            resultat_match_id INT NOT NULL,
            carton_id INT NOT NULL,
            FOREIGN KEY (resultat_match_id) REFERENCES resultat_match(id),
            FOREIGN KEY (carton_id) REFERENCES carton(id)
        )",
        "utilisateur" => "CREATE TABLE IF NOT EXISTS utilisateur (
            id INT AUTO_INCREMENT PRIMARY KEY,
            pseudo VARCHAR(255) NOT NULL,
            email VARCHAR(255) NOT NULL,
            mot_de_passe VARCHAR(255) NOT NULL,
            role VARCHAR(255) NOT NULL,
            equipe_favorite_id INT,
            UNIQUE (pseudo),
            UNIQUE (email),
            FOREIGN KEY (equipe_favorite_id) REFERENCES club(id)
        )",
    ];
    $db->exec("CREATE DATABASE ".$dbName);
    $db->exec("USE ".$dbName);
    foreach ($tables as $table_name => $tableQuery) {
        createTable($db, $tableQuery, $table_name);
    }
    return $db;
}

function createTable($db, $tableQuery, $table_name) {
    $db->exec("DROP TABLE IF EXISTS {$table_name}");
    $db->exec($tableQuery);
    return $db;
}