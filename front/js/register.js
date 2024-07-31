const pseudo = document.getElementById("pseudo");
const password = document.getElementById("password");
const confirmPassword = document.getElementById("confirm_password");
const favoriteTeam = document.getElementById("favorite_club");

const form = document.getElementById("sign_in");

function validatePassword(password, confirmPassword) {
    if (password.value != confirmPassword.value) {
        confirmPassword.classList.add("invalid");
    } else {
        confirmPassword.classList.remove("invalid");
    }
    return password.value == confirmPassword.value;
}

confirmPassword.addEventListener("input", function () {
    validatePassword(password, confirmPassword);
});

/*
if (favoriteTeam.value != "") {
    console.log("favorite team is not empty");
} else {
    console.log("favorite team is empty");
}
*/

form.addEventListener("submit", function (event) {
    //event.preventDefault();
    // Je vérifie que les mots de passe correspondent, je n'ai pas besoin de vérifier si les autres inputs sont vide car ils sont obligatoires
    if (!validatePassword(password, confirmPassword)) {
        alert("Les mots de passe ne correspondent pas");
        event.preventDefault();
    }
});