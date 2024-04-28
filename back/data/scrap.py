import json
import re
import requests
from bs4 import BeautifulSoup
from unidecode import unidecode

urlLigue1Club = "https://www.ligue1.fr/clubs/effectif?id="
urlLigue1Accueil = "https://www.ligue1.fr"
urlStadium = "https://www.deux-zero.com/ligue-1/stades/edition/2023-2024"


responseClassement = requests.get(urlLigue1Accueil + "/classement")
soupClassement = BeautifulSoup(responseClassement.text, "html.parser")

responseStadium = requests.get(urlStadium)
soupStadium = BeautifulSoup(responseStadium.text, "html.parser")


def getClubNameOnClassementPage():
    clubs = soupClassement.find_all("div", class_="GeneralStats-item--club")
    clubList = []
    for club in clubs:
        clubList.append(
            unidecode(
                club.find("span", class_="desktop-item").text.lower().replace(" ", "-")
            )
        )
    return clubList


def getStadiumName(clubName):
    return (
        BeautifulSoup(
            requests.get(urlLigue1Accueil + "/clubs?id=" + clubName).text, "html.parser"
        )
        .find("h2", class_="CompetitionClubStadium-title")
        .text.lower()
    )


def getStadiumImage(clubName):
    return (
        BeautifulSoup(
            requests.get(urlLigue1Accueil + "/clubs?id=" + clubName).text, "html.parser"
        )
        .find("img", class_="CompetitionClubStadium-image")
        .get("src")
    )


def getStadiumCapacity(stadiumName):
    if stadiumName == "stade de la mosson et du mondial 98":
        stadiumName = "stade de la mosson - mondial 98"
    if (
        stadiumName != "stade bollaert-delelis"
        and stadiumName != "stade saint-symphorien"
    ):
        stadiumName = re.sub(r"(?<=\w)-(?=\w)", " ", stadiumName)
        stadiumName = stadiumName.replace("–", "-")
    if stadiumName == "stade de la beaujoire louis fonteneau":
        stadiumName = "stade de la beaujoire - louis fonteneau"
    elif stadiumName == "stade yves allainmat":
        stadiumName = "stade yves allainmat - le moustoir"
    tr_elements = soupStadium.find_all("tr", class_="classement")
    for tr in tr_elements:
        td_stade = tr.find("td", class_="t-ville sousligne padding-gauche-10")
        if td_stade and td_stade.get_text(strip=True).lower() == stadiumName.lower():
            td_affluence = tr.find("td", class_="t-affluence").get_text(strip=True)
            td_ville = tr.find("td", class_="t-ville padding-gauche-5").get_text(
                strip=True
            )
            td_affluence = re.sub(r"\D", "", td_affluence)
            return td_affluence, td_ville


def getStadium(clubName):
    stadiumName = getStadiumName(clubName)
    affluence, ville = getStadiumCapacity(stadiumName)
    stadium = {
        "name": stadiumName,
        "capacity": int(affluence),
        "city": ville.lower(),
        "image": urlLigue1Accueil + getStadiumImage(clubName),
    }
    return stadium


def getClubName():
    return soup.find("h1", id="ClubPageNameClub").text.lower()


def getClubLogo() -> str:
    return urlLigue1Accueil + soup.find("img", class_="HeadBanner-thumbImg--club").get(
        "src"
    )


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
                "nationalityFlag": urlLigue1Accueil
                + player.find("img", class_="SquadTeamTable-nationalityImg").get("src"),
                "photo": urlLigue1Accueil
                + player.find("img", class_="SquadTeamTable-player-picture").get("src"),
            }
        )
    return playerList


club_names = getClubNameOnClassementPage()
print("liste des clubs: ", club_names)
with open("data.json", "w", encoding="utf-8") as file:
    data = []
    for club_name in club_names:
        print("club_name: ", club_name)
        if club_name == "havre-athletic-club":
            club_name = "havre-ac"
        response = requests.get(urlLigue1Club + club_name)
        soup = BeautifulSoup(response.text, "html.parser")
        club_data = {
            "name": getClubName(),
            "logo": getClubLogo(),
            "stadium": getStadium(club_name),
            "coach": getCoachName(),
            "players": getPlayers(),
        }
        print("club_data: ", club_data)
        print("====================================")
        print("====================================")
        data.append(club_data)
    file.write(
        json.dumps(
            data,
            ensure_ascii=False,
            indent=4,
        )
    )


def getArbitre():
    arbitre_paragraph = (
        BeautifulSoup(
            requests.get(
                urlLigue1Accueil
                + "/Articles/Actu/2023/06/14/arbitres-l1-saison-2023-2024"
            ).text,
            "html.parser",
        )
        .find("div", class_="field-article field-article")
        .find_all("p")[4]
    )
    arbitre_text = arbitre_paragraph.get_text().splitlines()[1:]
    arbitresArray = []
    for arbitre in arbitre_text[0].split(","):
        arbitresArray.append(arbitre.strip())
    return arbitresArray


with open("data_arbitre.json", "w", encoding="utf-8") as file:
    data_arbitre = []
    for arbitre in getArbitre():
        data_arbitre.append({
            "name": arbitre,
        })
    file.write(
        json.dumps(
            data_arbitre,
            ensure_ascii=False,
            indent=4,
        )
    )
