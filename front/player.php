<?php
require_once '../back/CRUD/player.php';

session_start(); // Démarrer la session pour le menu

// Récupération de l'ID du joueur à partir de l'URL
$player_id = isset($_GET['player_id']) ? (int)$_GET['player_id'] : null;

if (!$player_id) {
    echo "Aucun joueur spécifié.";
    exit();
}

$player = getPlayerById($player_id);

if (!$player) {
    echo "Le joueur demandé n'existe pas.";
    exit();
}

$player_name = htmlspecialchars($player['player_name']);
$club_name = htmlspecialchars($player['club_name']);
$position = htmlspecialchars($player['player_position_name']);
$nationality = htmlspecialchars($player['nationality_name']);
$nationality_flag = htmlspecialchars($player['nationality_flag']);
$player_picture = htmlspecialchars($player['player_picture']);

$matchs_joues = getMatchsJoues($player_id);
$buts_marques = getButsMarques($player_id);
$buts_tete = getButsParType($player_id, 3);
$buts_coups_francs = getButsParType($player_id, 2);
$buts_penalty = getButsParType($player_id, 1);
$cartons_jaunes = getCartons($player_id, 1);
$cartons_rouges = getCartons($player_id, 2);
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profil du joueur - <?php echo $player_name; ?></title>
    <link rel="stylesheet" type="text/css" href="./css/player.css">
</head>
<body>
<header>
    <?php include 'menu.php'; ?>
</header>

<section class="player-banner">
    <div class="club-logo-container">
        <img src="/BLOC3-DI23/front/assets/club_logo/1.png" alt="<?php echo $club_name; ?> Logo" class="club-logo">
    </div>
    <div class="player-info">
        <div class="player-name">
            <h2><?php echo $player_name; ?></h2>
        </div>
        <div class="player-number">
            <h2>N°<?php echo htmlspecialchars($player['player_number']); ?></h2>
        </div>
    </div>
</section>

<section class="player-details">
    <div class="player-photo">
        <img src="<?php echo $player_picture; ?>" alt="<?php echo $player_name; ?>" onerror="this.onerror=null; this.src='/BLOC3-DI23/front/assets/player_picture_default.png';">
    </div>
    <div class="player-stats">
        <p><strong>Nom :</strong> <?php echo $player_name; ?></p>
        <p><strong>Club :</strong> <a href="#"><?php echo $club_name; ?></a></p>
        <p><strong>Poste :</strong> <?php echo $position; ?></p>
        <p><strong>Nationalité :</strong> <?php echo $nationality; ?><img src="<?php echo $nationality_flag; ?>" alt="Drapeau" width="30" height="auto"></p>
        <p><strong>Matchs joués :</strong> <?php echo $matchs_joues; ?></p>
        <p><strong>Buts Marqués :</strong> <?php echo $buts_marques; ?> buts</p>
        <p><strong>Buts de la tête :</strong> <?php echo $buts_tete; ?> buts</p>
        <p><strong>Buts sur coups francs :</strong> <?php echo $buts_coups_francs; ?> but</p>
        <p><strong>Buts sur penalty :</strong> <?php echo $buts_penalty; ?> buts</p>
        <p><strong>Cartons Jaunes :</strong> <?php echo $cartons_jaunes; ?></p>
        <p><strong>Cartons Rouges :</strong> <?php echo $cartons_rouges; ?></p>
    </div>
</section>
</body>
</html>