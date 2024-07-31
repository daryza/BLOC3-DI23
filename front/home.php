<?php
    session_start();

    $user_role = null;

    if(isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true) {
        $user_role = $_SESSION['user_role'];
        echo "You are logged in as " . $user_role . ".";
        echo "<br>";
    }

    if (isset($_SESSION['message'])) {
        // addslashes() allows to escape special characters
        $message = addslashes($_SESSION['message']);
        echo "<script>alert('$message');</script>";
        // Unset the message after displaying it
        unset($_SESSION['message']);
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil</title>
</head>
<body>
    <?php if ($user_role === 'admin') { ?>
        <a href="./create_match.php">Créer un match</a>
    <?php } ?>
    <div>
        <a href="./register.php">S'inscrire</a>
    </div>
</body>
</html>