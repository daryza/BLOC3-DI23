const confirmPassword = document.getElementById("confirm_password");
const passwordForm = document.getElementById("password_form");

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

passwordForm.addEventListener("submit", function (event) {
    //event.preventDefault();
    // Je vérifie que les mots de passe correspondent, je n'ai pas besoin de vérifier si les autres inputs sont vide car ils sont obligatoires
    if (!validatePassword(password, confirmPassword)) {
        alert("Les mots de passe ne correspondent pas");
        event.preventDefault();
    }
});