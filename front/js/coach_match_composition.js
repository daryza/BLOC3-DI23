console.log("JS: coach_match_composition.js");

const playerSelect = document.getElementById("player_select");
const playerPosition = document.getElementById("player_position");
const addPlayerBtn = document.getElementById("add_player_btn");

const playerDeleteSelect = document.getElementById("player_delete_select");
const deletePlayerBtn = document.getElementById("delete_player_btn");

const captainSelect = document.getElementById("captain_select");
const addCaptainBtn = document.getElementById("add_captain_btn");

const subCaptainSelect = document.getElementById("sub_captain_select");
const addSubCaptainBtn = document.getElementById("add_sub_captain_btn");

let players = [];

addPlayerBtn.addEventListener("click", () => {
    // Player name
    const player = playerSelect.options[playerSelect.selectedIndex].text;
    //console.log(player);

    // Player id
    const playerId = playerSelect.value;
    //console.log(playerId);

    // Player position
    const position = playerPosition.options[playerPosition.selectedIndex].text;
    console.log(position);

    // Player poistion id
    const positionId = playerPosition.value;
    console.log(positionId);

    // Add player to the list
    if (playerId != "" && positionId != "") {
        players.push({
            id: playerId,
            //name: player,
            //position: position,
            position_id: positionId,
            captain: false,
            sub_captain: false,
        });
        // Disable the player in the select
        playerSelect.querySelector(`option[value="${playerId}"]`).disabled = true;

        // Reset the player select
        playerSelect.value = "";
        playerPosition.value = "";

        // Add the player to the delete select
        addPlayerToDelSelect(playerId, player);

        // Add the player to the captain select
        addCaptainToSelect(playerId, player);

        // Add the player to the sub captain select
        addSubCaptainToSelect(playerId, player);

        // Add the player in the soccer field
        addPlayerInSoccerField(player, playerId, positionId);
    } else {
        alert("Veuillez sélectionner un joueur et une position");
    }

    // Display the players
    console.log(players);
});

deletePlayerBtn.addEventListener("click", () => {
    const playerId = playerDeleteSelect.value;
    console.log(playerId);

    if (playerId != "") {
        // Remove the player from the list
        players = players.filter((player) => player.id != playerId);

        // Enable the player in the select
        playerSelect.querySelector(`option[value="${playerId}"]`).removeAttribute("disabled");

        // Remove the player from the delete select
        playerDeleteSelect.remove(playerDeleteSelect.selectedIndex);

        // Reset the player delete select
        playerDeleteSelect.value = "";

        // Remove the player from the captain select
        captainSelect.querySelector(`option[value="${playerId}"]`).remove();

        // Remove the player from the sub captain select
        subCaptainSelect.querySelector(`option[value="${playerId}"]`).remove();

        // Display the players
        console.log(players);

        // Remove the player from the soccer field
        document.getElementById("soccer_field_players_" + playerId).remove();
    } else {
        alert("Veuillez sélectionner un joueur à retirer");
    }
});

function addPlayerToDelSelect(playerId, playerName) {
    const option = document.createElement("option");
    option.value = playerId;
    option.text = playerName;
    playerDeleteSelect.add(option);
}

addCaptainBtn.addEventListener("click", () => {
    const captainId = captainSelect.value;
    console.log("captainId : " + captainId);

    if (captainId != "") {
        players.forEach((player) => {
            if (player.id == captainId) {
                player.captain = true;
                // Disable the player in the captain select
                captainSelect.querySelector(`option[value="${captainId}"]`).disabled = true;

                const selectedOption = playerSelect.querySelector(`option[value="${player.id}"]`);

                if (selectedOption) {
                    // Récupérer le texte de l'option
                    const selectedOptionText = selectedOption.text;
                    addPlayerInContainerName(selectedOptionText, player.id, "captain_li");
                }

                if (player.sub_captain) {
                    player.sub_captain = false;
                    // Enable the player in the sub captain select
                    subCaptainSelect.querySelector(`option[value="${captainId}"]`).removeAttribute("disabled");

                    // Remove the player from the sub captain container
                    document.getElementById("sub_captain_li_" + player.id).remove();
                }
            } else {
                if (player.captain) {
                    player.captain = false;
                    // Enable the player in the captain select
                    captainSelect.querySelector(`option[value="${player.id}"]`).removeAttribute("disabled");
                }
            }
        });
        console.log(players);
        // Reset the captain select
        captainSelect.value = "";
    } else {
        alert("Veuillez sélectionner un capitaine");
    }
});

function addCaptainToSelect(playerId, playerName) {
    const option = document.createElement("option");
    option.value = playerId;
    option.text = playerName;
    captainSelect.add(option);
}

//const subCaptainSelect = document.getElementById("sub_captain_select");
//const addSubCaptainBtn = document.getElementById("add_sub_captain_btn");

addSubCaptainBtn.addEventListener("click", () => {
    const subCaptainId = subCaptainSelect.value;
    console.log(subCaptainId);

    if (subCaptainId != "") {
        players.forEach((player) => {
            if (player.id == subCaptainId) {
                player.sub_captain = true;
                // Disable the player in the sub captain select
                subCaptainSelect.querySelector(`option[value="${subCaptainId}"]`).disabled = true;

                const selectedOption = playerSelect.querySelector(`option[value="${player.id}"]`);

                if (selectedOption) {
                    const selectedOptionText = selectedOption.text;
                    addPlayerInContainerName(selectedOptionText, player.id, "sub_captain_li");
                }

                if (player.captain) {
                    player.captain = false;
                    // Enable the player in the captain select
                    captainSelect.querySelector(`option[value="${player.id}"]`).removeAttribute("disabled");

                    // Remove the player from the captain container
                    document.getElementById("captain_li_" + player.id).remove();
                }
            } else {
                if (player.sub_captain) {
                    player.sub_captain = false;
                    // Enable the player in the sub captain select
                    subCaptainSelect.querySelector(`option[value="${player.id}"]`).removeAttribute("disabled");
                }
            }
        });
        console.log(players);
        // Reset the sub captain select
        subCaptainSelect.value = "";
    } else {
        alert("Veuillez sélectionner un capitaine remplaçant");
    }
});

function addSubCaptainToSelect(playerId, playerName) {
    const option = document.createElement("option");
    option.value = playerId;
    option.text = playerName;
    subCaptainSelect.add(option);
}

function addPlayerInSoccerField(playerName, playerId, playerPositionId) {
    switch (playerPositionId) {
        case "1":
            addPlayerInSubstitute(playerName, playerId, "sub_player_li");
            break;
        case "2":
            addPlayerInField(playerName, playerId, "guardian_container");
            break;
        case "3":
            addPlayerInField(playerName, playerId, "defender_container");
            break;
        case "4":
            addPlayerInField(playerName, playerId, "midfielder_container");
            break;
        case "5":
            addPlayerInField(playerName, playerId, "attacker_container");
            break;
        default:
            break;
    }
}

function addPlayerInField(playerName, playerId, containerName) {
    const container = document.getElementById(containerName);
    const playerDiv = document.createElement("div");
    playerDiv.classList.add("soccer_field_players");
    playerDiv.id = "soccer_field_players_" + playerId;

    const playerItem = document.createElement("div");
    playerItem.classList.add("soccer_field_items");
    playerDiv.appendChild(playerItem);

    const playerSpanName = document.createElement("span");
    playerSpanName.classList.add("soccer_field_player_name");
    playerSpanName.textContent = playerName;
    playerDiv.appendChild(playerSpanName);

    container.appendChild(playerDiv);
}

function addPlayerInContainerName(playerName, playerId, containerName) {
    const container = document.getElementById(containerName);
    const playerSpan = document.createElement("span");
    playerSpan.id = containerName + "_"+ playerId;

    playerSpan.textContent = playerName;

    container.appendChild(playerSpan);
}

function addPlayerInSubstitute(playerName, playerId, containerName) {
    const container = document.getElementById(containerName);
    const playerSpan = document.createElement("span");
    playerSpan.id = "soccer_field_players_" + playerId;

    // Add a comma before the player name if there are already players in the list
    if (container.children.length > 0) {
        playerSpan.textContent = ", " + playerName;
    } else {
        playerSpan.textContent = playerName;
    }

    container.appendChild(playerSpan);
}

document.getElementById("submit_btn").addEventListener("click", () => {
    
    // Check if the user holder has selected 11 players
    let numberHolderPlayers = 0;
    let captain = false;
    let subCaptain = false;
    for (player of players) {
        if(player.position_id != 1) {
            numberHolderPlayers++;
        }
        if(player.captain) {
            captain = true;
        }
        if(player.sub_captain) {
            subCaptain = true;
        }
    }

    if (numberHolderPlayers !== 11) {
        alert("Veuillez sélectionner 11 titulaires");
    } else { 
        if (!captain) {
            alert("Veuillez sélectionner un capitaine");
        } else {
            if (!subCaptain) {
                alert("Veuillez sélectionner un capitaine remplaçant");
            } else {
                document.getElementById("match_id").value = matchId;
                document.getElementById("coach_club_id").value = coachClubId;
                document.getElementById("players").value = JSON.stringify(players);
        
                // Submit the form
                document.getElementById("team_form").submit();
            }
        }
    }
});