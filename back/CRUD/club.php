<?php
require_once dirname(__DIR__) . '/connexion.php';

/*
Create = /
Read =  -> 
Update =  -> 
Delete = /
*/

####################### READ #######################

function getAllClubs() {
    $db = connexionDB();
    try {
        $sql = "SELECT * FROM club ORDER BY club_name ASC";
        $req = $db->prepare($sql);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

function getAllClubsName() {
    $db = connexionDB();
    try {
        $sql = "SELECT club_name FROM club ORDER BY club_name ASC";
        $req = $db->prepare($sql);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

function getClubNameById($clubId) {
    $db = connexionDB();
    try {
        $sql = "SELECT club_name FROM club WHERE id = :clubId";
        $req = $db->prepare($sql);
        $req->bindValue(':clubId', $clubId, PDO::PARAM_INT);
        $req->execute();
        $result = $req->fetch(PDO::FETCH_ASSOC);
        return $result['club_name'];
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

function getClubIdByName($clubName) {
    $db = connexionDB();
    try {
        $sql = "SELECT id FROM club WHERE club_name = :clubName";
        $req = $db->prepare($sql);
        $req->bindValue(':clubName', $clubName, PDO::PARAM_STR);
        $req->execute();
        $result = $req->fetch(PDO::FETCH_ASSOC);
        return $result['id'];
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

function getStadiumByClubName($clubName) {
    $db = connexionDB();
    try {
        $sql = "SELECT stadium_name FROM club INNER JOIN stadium ON club.stadium_id = stadium.id WHERE club_name = :clubName";
        $req = $db->prepare($sql);
        $req->bindValue(':clubName', $clubName, PDO::PARAM_STR);
        $req->execute();
        return $req->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

function getAllclubsWithStadium() {
    $db = connexionDB();
    try {
        $sql = "SELECT club_name, stadium_name FROM club INNER JOIN stadium ON club.stadium_id = stadium.id ORDER BY club_name ASC";
        $req = $db->prepare($sql);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

function getCoachByClubIdAndRole($club_id, $role_id) {
    $db = connexionDB();
    try {
        $sql = "SELECT coach_name FROM coach WHERE club_id = :club_id AND coach_job_name_id = :role_id";
        $req = $db->prepare($sql);
        $req->bindParam(':club_id', $club_id, PDO::PARAM_INT);
        $req->bindParam(':role_id', $role_id, PDO::PARAM_INT);
        $req->execute();
        $result = $req->fetch(PDO::FETCH_ASSOC);
        return $result ? $result['coach_name'] : null;
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return null;
    }
}


####################### STATS CLUB #######################

function getClubMatchResults($club_id, $type) {
    $db = connexionDB();
    try {
        $sql = $type === 'gagne' 
            ? "SELECT COUNT(*) AS match_count FROM match_result WHERE winner_club_id = :club_id"
            : "SELECT COUNT(*) AS match_count 
                FROM pre_match 
                WHERE (home_team_id = :club_id OR visitor_team_id = :club_id) 
                AND pre_match.id NOT IN (SELECT pre_match_id FROM match_result WHERE winner_club_id = :club_id)";
        $req = $db->prepare($sql);
        $req->bindParam(':club_id', $club_id, PDO::PARAM_INT);
        $req->execute();
        $result = $req->fetch(PDO::FETCH_ASSOC);
        return $result ? $result['match_count'] : 0;
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return 0;
    }
}

function getMatchsGagnes($club_id) {
    return getClubMatchResults($club_id, 'gagne');
}

function getMatchsPerdus($club_id) {
    return getClubMatchResults($club_id, 'perdu');
}

function getClubButs($club_id, $type = 'marques') {
    $db = connexionDB();
    try {
        if ($type === 'marques') {
            $sql = "SELECT COUNT(*) AS buts 
                    FROM goal 
                    INNER JOIN team_lineup_player_selected ON goal.team_lineup_player_selected_id = team_lineup_player_selected.id 
                    INNER JOIN player_selected ON team_lineup_player_selected.player_selected_id = player_selected.id 
                    INNER JOIN player ON player_selected.player_id = player.id 
                    WHERE player.club_id = :club_id";
        } else {
            $sql = "SELECT COUNT(*) AS buts 
                    FROM goal 
                    INNER JOIN team_lineup_player_selected ON goal.team_lineup_player_selected_id = team_lineup_player_selected.id 
                    INNER JOIN team_lineup ON team_lineup_player_selected.team_lineup_id = team_lineup.id 
                    INNER JOIN club ON team_lineup.club_id = club.id 
                    WHERE club.id != :club_id AND 
                    (team_lineup.id IN 
                    (SELECT home_team_lineup_id FROM pre_match_team_lineup_versus WHERE visitor_team_lineup_id = :club_id) 
                    OR team_lineup.id IN 
                    (SELECT visitor_team_lineup_id FROM pre_match_team_lineup_versus WHERE home_team_lineup_id = :club_id))";
        }
        $req = $db->prepare($sql);
        $req->bindParam(':club_id', $club_id, PDO::PARAM_INT);
        $req->execute();
        $result = $req->fetch(PDO::FETCH_ASSOC);
        return $result ? $result['buts'] : 0;
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return 0;
    }
}

function getClubButsMarques($club_id) {
    return getClubButs($club_id, 'marques');
}

function getClubButsEncaisses($club_id) {
    return getClubButs($club_id, 'encaisses');
}

function getDifferenceButs($club_id) {
    $club_buts_marques = getClubButsMarques($club_id);
    $club_buts_encaisses = getClubButsEncaisses($club_id);
    return $club_buts_marques - $club_buts_encaisses;
}

function getDernierMatchScore($club_id) {
    $db = connexionDB();
    try {
        $sql = "
            SELECT 
                pre_match.id,
                home_team.club_name AS home_team_name,
                visitor_team.club_name AS visitor_team_name,
                COUNT(CASE WHEN team_lineup.club_id = pre_match.home_team_id THEN goal.id END) AS home_goals,
                COUNT(CASE WHEN team_lineup.club_id = pre_match.visitor_team_id THEN goal.id END) AS visitor_goals
            FROM 
                pre_match
            LEFT JOIN 
                club AS home_team ON pre_match.home_team_id = home_team.id
            LEFT JOIN 
                club AS visitor_team ON pre_match.visitor_team_id = visitor_team.id
            LEFT JOIN 
                team_lineup ON (team_lineup.club_id = pre_match.home_team_id OR team_lineup.club_id = pre_match.visitor_team_id)
            LEFT JOIN 
                team_lineup_player_selected ON team_lineup_player_selected.team_lineup_id = team_lineup.id
            LEFT JOIN 
                goal ON goal.team_lineup_player_selected_id = team_lineup_player_selected.id
            WHERE 
                pre_match.home_team_id = :club_id OR pre_match.visitor_team_id = :club_id
            GROUP BY 
                pre_match.id
            ORDER BY 
                pre_match.date DESC
            LIMIT 1";
        
        $req = $db->prepare($sql);
        $req->bindParam(':club_id', $club_id, PDO::PARAM_INT);
        $req->execute();
        $result = $req->fetch(PDO::FETCH_ASSOC);
        
        if ($result) {
            return $result['home_team_name'] . " " . $result['home_goals'] . " - " . $result['visitor_goals'] . " " . $result['visitor_team_name'];
        } else {
            return "Aucun match trouvé pour ce club.";
        }
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return "Erreur lors de la récupération du score.";
    }
}

function getCartonsRouges($club_id) {
    $db = connexionDB();
    try {
        $sql = "SELECT COUNT(*) AS cartons_rouges 
                FROM card 
                INNER JOIN team_lineup_player_selected ON card.team_lineup_player_selected_id = team_lineup_player_selected.id 
                INNER JOIN player_selected ON team_lineup_player_selected.player_selected_id = player_selected.id 
                INNER JOIN player ON player_selected.player_id = player.id 
                WHERE player.club_id = :club_id AND card.card_type_id = 2";
        $req = $db->prepare($sql);
        $req->bindParam(':club_id', $club_id, PDO::PARAM_INT);
        $req->execute();
        $result = $req->fetch(PDO::FETCH_ASSOC);
        return $result ? $result['cartons_rouges'] : 0;
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return 0;
    }
}

function getCartonsJaunes($club_id) {
    $db = connexionDB();
    try {
        $sql = "SELECT COUNT(*) AS cartons_jaunes 
                FROM card 
                INNER JOIN team_lineup_player_selected ON card.team_lineup_player_selected_id = team_lineup_player_selected.id 
                INNER JOIN player_selected ON team_lineup_player_selected.player_selected_id = player_selected.id 
                INNER JOIN player ON player_selected.player_id = player.id 
                WHERE player.club_id = :club_id AND card.card_type_id = 1";
        $req = $db->prepare($sql);
        $req->bindParam(':club_id', $club_id, PDO::PARAM_INT);
        $req->execute();
        $result = $req->fetch(PDO::FETCH_ASSOC);
        return $result ? $result['cartons_jaunes'] : 0;
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return 0;
    }
}

function getTopScorersByClubId($clubId, $limit = 5) {
    $db = connexionDB();
    try {
        $sql = "
            SELECT 
                player.id AS player_id,
                player.player_name, 
                player.player_picture,
                COUNT(goal.id) as goals
            FROM 
                player
            INNER JOIN 
                player_selected ON player.id = player_selected.player_id
            INNER JOIN 
                team_lineup_player_selected ON player_selected.id = team_lineup_player_selected.player_selected_id
            LEFT JOIN 
                goal ON team_lineup_player_selected.id = goal.team_lineup_player_selected_id
            INNER JOIN 
                team_lineup ON team_lineup.id = team_lineup_player_selected.team_lineup_id
            WHERE 
                team_lineup.club_id = :clubId
            GROUP BY 
                player.id
            ORDER BY 
                goals DESC
            LIMIT :limit
        ";
        
        $req = $db->prepare($sql);
        $req->bindValue(':clubId', $clubId, PDO::PARAM_INT);
        $req->bindValue(':limit', $limit, PDO::PARAM_INT);
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return [];
    }
}


function getLastTeamLineupWithDetails($clubId) {
    $db = connexionDB();
    try {
        $sql = "
            SELECT 
                DISTINCT p.player_name, 
                pp.player_position_name,
                pp.id AS position_id
            FROM 
                team_lineup tl
            INNER JOIN 
                team_lineup_player_selected tlps ON tl.id = tlps.team_lineup_id
            INNER JOIN 
                player_selected ps ON tlps.player_selected_id = ps.id
            INNER JOIN 
                player p ON ps.player_id = p.id
            INNER JOIN 
                player_position pp ON ps.player_selected_position_name_id = pp.id
            WHERE 
                tl.club_id = :club_id
                AND pp.id != 6  -- Exclure les remplaçants
            ORDER BY 
                tl.id DESC";
            
        $req = $db->prepare($sql);
        $req->bindValue(':club_id', $clubId, PDO::PARAM_INT);
        $req->execute();
        $players = $req->fetchAll(PDO::FETCH_ASSOC);

        return $players;
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
        return [];
    }
}





?>