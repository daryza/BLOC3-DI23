<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once '../back/CRUD/club.php';
require_once '../back/CRUD/coach.php';
require_once '../back/CRUD/player.php';
require_once '../back/CRUD/team_lineup.php';
require_once '../back/CRUD/user.php';

session_start(); // Pour récupérer l'ID de l'utilisateur connecté

// Récupération de l'ID du club à partir de l'URL
$club_id = isset($_GET['club_id']) ? (int)$_GET['club_id'] : 1;

$club_name = getClubNameById($club_id);                         // Nom du club
$stadium = getStadiumByClubName($club_name);                    // Stade
$stadium_name = $stadium['stadium_name'] ?? 'Stade inconnu';    // Nom du stade
$matchs_gagnes = getMatchsGagnes($club_id);                     // Nombre matchs gagnés
$matchs_perdus = getMatchsPerdus($club_id);                     // Nombre matchs perdus
$club_buts_marques = getClubButsMarques($club_id);              // Nombre de buts marqués/club
$club_buts_encaisses = getClubButsEncaisses($club_id);          // Nombre de buts encaissés/club
$difference_buts = getDifferenceButs($club_id);                 // Différence de buts
$dernier_match_score = getDernierMatchScore($club_id);          // Score du dernier match
$cartons_rouges = getCartonsRouges($club_id);                   // Nombre de cartons rouges
$cartons_jaunes = getCartonsJaunes($club_id);                   // Nombre de cartons jaunes

// Connexion à la base de données
$db = connexionDB();

try {
    // Requête image du stade
    $sql = "SELECT stadium_image FROM stadium WHERE stadium_name = :stadium_name";
    $req = $db->prepare($sql);
    $req->bindValue(':stadium_name', $stadium_name, PDO::PARAM_STR);
    $req->execute();
    $result = $req->fetch(PDO::FETCH_ASSOC);
    $stadium_image = $result['stadium_image'] ?? '/BLOC3-DI23/front/assets/stadiums/default_stadium.jpg';
} catch (Exception $e) {
    echo 'Erreur : ' . $e->getMessage();
    $stadium_image = '/BLOC3-DI23/front/assets/stadiums/default_stadium.jpg';
}

$head_coach = getCoachByClubIdAndRole($club_id, 1);             // Entraîneur principal
$assistant_coach = getCoachByClubIdAndRole($club_id, 2);        // Entraîneur adjoint
$top_scorers = getTopScorersByClubId($club_id);                 // Meilleurs buteurs
$team_lineup = getLastTeamLineupWithDetails($club_id);          // Dernière composition d'équipe

if (!$club_name) {
    echo "Le club demandé n'existe pas.";
    exit();
}

$club_logo = "/BLOC3-DI23/front/assets/club_logo/{$club_id}.png";

// Récupération de l'ID du club favori de l'utilisateur connecté
$user_id = $_SESSION['user_id'] ?? null;
$favorite_club_id = $user_id ? getFavoriteClubId($user_id) : null;

?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($club_name); ?></title>
    <link rel="stylesheet" type="text/css" href="./css/club.css">
</head>

<body>
<header>
    <?php include '/var/www/html/BLOC3-DI23/front/menu.php'; ?>
</header>

<section class="club-banner">
    <div class="stadium-photo">
        <img src="<?php echo htmlspecialchars($stadium_image); ?>" alt="<?php echo htmlspecialchars($stadium_name); ?>">
        <div class="stadium-name">
            <p>Stade : <?php echo htmlspecialchars($stadium_name); ?></p>
        </div>
        <div class="club-logo-banner">
            <img src="<?php echo htmlspecialchars($club_logo); ?>" alt="Logo de <?php echo htmlspecialchars($club_name); ?>">
        </div>
    </div>
</section>

<section class="club-name">
    <h2 style="font-weight: bold; text-decoration: underline; font-style: italic;">
        <?php echo htmlspecialchars($club_name); ?>
    </h2>
</section>

<section class="club-details">
    <div class="club-info-container">
        <h3>GÉNÉRAL</h3>
        <div class="club-info">
            <p>Matchs Gagnés : <?php echo $matchs_gagnes; ?></p>
            <p>Matchs Perdus : <?php echo $matchs_perdus; ?></p>
            <p>Buts Marqués : <?php echo $club_buts_marques; ?></p>
            <p>Buts Encaissés : <?php echo $club_buts_encaisses; ?></p>
            <p>Différence de Buts : <?php echo $difference_buts; ?></p>
            <p>Cartons Rouges : <?php echo $cartons_rouges; ?></p>
            <p>Cartons Jaunes : <?php echo $cartons_jaunes; ?></p>
            <p>Résultat du dernier match : <?php echo $dernier_match_score; ?></p> 
        </div>
    </div>
    
    <div class="club-top-scorers-container">
    <h3>MEILLEURS BUTEURS</h3>
    <div class="club-top-scorers">
        <?php 
        if (!empty($top_scorers)):
            $top_scorer = $top_scorers[0];
            $top_scorer_name = htmlspecialchars($top_scorer['player_name']);
            $top_scorer_goals = htmlspecialchars($top_scorer['goals']);
            $top_scorer_picture = htmlspecialchars($top_scorer['player_picture'] ?? '/BLOC3-DI23/front/assets/default_player.jpg');

            // Afficher le meilleur buteur avec sa photo
            echo '<div class="top-scorer-highlight">';
            echo '<img src="' . $top_scorer_picture . '" alt="Photo de ' . $top_scorer_name . '">';
            echo '<p class="top-scorer-name">' . $top_scorer_name . ' : ' . $top_scorer_goals . ' buts</p>';
            echo '</div>';

            // Afficher les autres buteurs
            echo '<div class="other-scorers">';
            for ($i = 1; $i < count($top_scorers); $i++):
                $scorer_name = htmlspecialchars($top_scorers[$i]['player_name']);
                $goals = htmlspecialchars($top_scorers[$i]['goals']);
                echo '<p>' . $scorer_name . ' : ' . $goals . ' buts</p>';
            endfor;
            echo '</div>';
        else:
            echo '<p>Aucun buteur trouvé.</p>';
        endif;
        ?>
    </div>
</div>
    
    <div class="club-lineup-container">
    <h3>EQUIPE TYPE</h3>
    <div class="club-lineup">
        <?php
        if (!empty($team_lineup)):
            $positions = ['Gardien' => [], 'Défenseurs' => [], 'Milieux' => [], 'Attaquants' => []];
            foreach ($team_lineup as $player) {
                switch ($player['player_position_name']) {
                    case 'Gardien':
                        $positions['Gardien'][] = $player['player_name'];
                        break;
                    case 'Défenseur':
                        $positions['Défenseurs'][] = $player['player_name'];
                        break;
                    case 'Milieu':
                        $positions['Milieux'][] = $player['player_name'];
                        break;
                    case 'Attaquant':
                        $positions['Attaquants'][] = $player['player_name'];
                        break;
                }
            }

            foreach ($positions as $position => $players) {
                if (!empty($players)) {
                    echo '<p><strong>' . htmlspecialchars($position) . ':</strong> ' . htmlspecialchars(implode(', ', $players)) . '</p>';
                }
            }
        else:
            echo '<p>Aucune équipe type définie pour ce club pour le moment.</p>';
        endif;
        ?>
    </div>
</div>

    <div class="club-coaches-and-match-container">
        <h3>ENTRAINEURS</h3>
        <div class="club-coaches-and-match">
                        <div class="club-coaches">
                <?php 
                if ($head_coach) {
                    echo "<p>Entraîneur principal : " . htmlspecialchars($head_coach) . "</p>";
                } else {
                    echo "<p>Aucun entraîneur principal trouvé.</p>";
                }

                if ($assistant_coach) {
                    echo "<p>Entraîneur adjoint : " . htmlspecialchars($assistant_coach) . "</p>";
                } else {
                    echo "<p>Aucun entraîneur adjoint trouvé.</p>";
                }
                ?>
            </div>
            <div class="club-next-match">
                <h3>PROCHAIN MATCH</h3>
                <?php if (isset($next_match) && is_array($next_match)): ?>
                    <p>Coup d'envoi : <?php echo htmlspecialchars($next_match['date'] ?? 'Non défini'); ?></p>
                    <p>Adversaire : <?php echo htmlspecialchars($next_match['adversaire'] ?? 'Non défini'); ?></p>
                    <p>Lieu : <?php echo htmlspecialchars($next_match['lieu'] ?? 'Non défini'); ?></p>
                <?php else: ?>
                    <p>Aucun match à venir.</p>
                <?php endif; ?>
            </div>
        </div>
    </div>
</section>
</body>
</html>
