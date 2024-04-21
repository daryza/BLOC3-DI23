import json
import requests
from bs4 import BeautifulSoup

url = "https://www.ligue1.fr/clubs/effectif?id=paris-saint-germain"
domain = "https://www.ligue1.fr"
response = requests.get(url)
soup = BeautifulSoup(response.text, "html.parser")


def getClubName():
    return soup.find("h1", id="ClubPageNameClub").text.lower()


def getClubLogo():
    return domain + soup.find("img", class_="HeadBanner-thumbImg--club").get("src")


def getCoachName():
    return {"name": soup.find("span", class_="StaffTeam-name").text.lower()}


def getPlayers():
    players = soup.find_all("div", class_="SquadTeamTable-flip-card")
    playerList = []
    for player in players:
        number_text = (
            player.find("div", class_="SquadTeamTable-detail--number")
            .text.strip()
            .replace("\n", "")
        )
        playerList.append(
            {
                "name": player.find(
                    "span", class_="SquadTeamTable-playerName"
                ).text.lower(),
                "position": player.find("span", class_="SquadTeamTable-position").text,
                "number": int(number_text) if number_text != "-" else None,
                "nationality": player.find(
                    "span", class_="SquadTeamTable-nationalityName"
                ).text,
                "nationalityFlag": domain
                + player.find("img", class_="SquadTeamTable-nationalityImg").get("src"),
                "photo": domain
                + player.find("img", class_="SquadTeamTable-player-picture").get("src"),
            }
        )
    return playerList


def setJsonFile():
    return {
        "name": getClubName(),
        "logo": getClubLogo(),
        "coach": getCoachName(),
        "players": [getPlayers()],
    }


with open("data.json", "w", encoding="utf-8") as file:
    file.write(json.dumps(setJsonFile(), ensure_ascii=False, indent=4))
    file.close()
