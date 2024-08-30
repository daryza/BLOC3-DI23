<?php
// Assurez-vous que la session est démarrée
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

$user_role = $_SESSION['user_role'] ?? null;
$user_favorite_club_id = $_SESSION['user_favorite_club_id'] ?? null;
?>

<div class="menu-bar">
    <div class="logo">
        <a href="/BLOC3-DI23/front/home.php">
            <img src="/BLOC3-DI23/front/assets/LogoBloc3.png" alt="Logo du site">
        </a>
    </div>
    <ul class="nav-links">
        <?php if ($user_role === 'admin') { ?>
            <li><a href="/BLOC3-DI23/front/create_match.php">Programmer un match</a></li>
            <li><a href="/BLOC3-DI23/front/enter_result.php">Renseigner résultat</a></li>
        <?php } elseif ($user_role === 'coach') { ?>
            <li><a href="/BLOC3-DI23/front/club.php?club_id=<?php echo htmlspecialchars($_SESSION['club_id']); ?>">Mon équipe</a></li>
            <li><a href="/BLOC3-DI23/front/coach_match_composition.php">Gérer mon équipe</a></li>
        <?php } elseif ($user_role) { ?>
            <li><a href="<?php echo $user_favorite_club_id ? "/BLOC3-DI23/front/club.php?club_id={$user_favorite_club_id}" : '/BLOC3-DI23/front/all_clubs.php'; ?>">Mon équipe</a></li>
        <?php } ?>
        <li><a href="/BLOC3-DI23/front/all_clubs.php">Les équipes</a></li>
        <?php if (!$user_role) { ?>
            <li><a href="/BLOC3-DI23/front/login.php">Se connecter</a></li>
            <li><a href="/BLOC3-DI23/front/register.php">S'inscrire</a></li>
        <?php } else { ?>
            <li><a href="/BLOC3-DI23/front/account_management.php">Mon compte</a></li>
        <?php } ?>
    </ul>
</div>
