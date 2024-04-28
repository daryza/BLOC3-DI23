-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: bloc3
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_lineup_player_selected_id` int(11) NOT NULL,
  `card_type_id` int(11) NOT NULL,
  `card_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_lineup_player_selected_id` (`team_lineup_player_selected_id`),
  KEY `card_type_id` (`card_type_id`),
  CONSTRAINT `card_ibfk_1` FOREIGN KEY (`team_lineup_player_selected_id`) REFERENCES `team_lineup_player_selected` (`id`),
  CONSTRAINT `card_ibfk_2` FOREIGN KEY (`card_type_id`) REFERENCES `card_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_type`
--

DROP TABLE IF EXISTS `card_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_type`
--

LOCK TABLES `card_type` WRITE;
/*!40000 ALTER TABLE `card_type` DISABLE KEYS */;
INSERT INTO `card_type` VALUES (1,'jaune'),(2,'rouge');
/*!40000 ALTER TABLE `card_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `club` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stadium_id` int(11) NOT NULL,
  `club_name` varchar(255) NOT NULL,
  `club_logo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stadium_id` (`stadium_id`),
  CONSTRAINT `club_ibfk_1` FOREIGN KEY (`stadium_id`) REFERENCES `stadium` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES (1,1,'paris saint-germain','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Clubs/2023-2024/13.png'),(2,2,'as monaco','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Clubs/2023-2024/9.png'),(3,3,'stade brestois 29','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Clubs/2023-2024/44.png'),(4,4,'losc lille','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Clubs/2023-2024/158.png'),(5,5,'ogc nice','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Clubs/2023-2024/30.png'),(6,6,'rc lens','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Clubs/2023-2024/6.png'),(7,7,'stade rennais fc','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Clubs/2023-2024/14.png'),(8,8,'olympique de marseille','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Clubs/2023-2024/1.png'),(9,9,'olympique lyonnais','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Clubs/2023-2024/159.png'),(10,10,'stade de reims','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Clubs/2023-2024/41.png'),(11,11,'toulouse fc','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Clubs/2023-2024/16.png'),(12,12,'montpellier hérault sc','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Clubs/2023-2024/10.png'),(13,13,'rc strasbourg alsace','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Clubs/2023-2024/15.png'),(14,14,'fc nantes','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Clubs/2023-2024/12.png'),(15,15,'fc metz','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Clubs/2023-2024/8.png'),(16,16,'havre athletic club','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Clubs/2023-2024/5.png'),(17,17,'fc lorient','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Clubs/2023-2024/7.png'),(18,18,'clermont foot 63','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Clubs/2023-2024/40.png');
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coach_job_name_id` int(11) NOT NULL,
  `club_id` int(11) NOT NULL,
  `coach_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `club_id` (`club_id`),
  KEY `coach_job_name_id` (`coach_job_name_id`),
  CONSTRAINT `coach_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`),
  CONSTRAINT `coach_ibfk_2` FOREIGN KEY (`coach_job_name_id`) REFERENCES `coach_job` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (1,1,1,'luis enrique'),(2,1,2,'adi hütter'),(3,1,3,'eric roy'),(4,1,4,'paulo fonseca'),(5,1,5,'francesco farioli'),(6,1,6,'franck haise'),(7,1,7,'julien stephan'),(8,1,8,'jean-louis gasset'),(9,1,9,'pierre sage'),(10,1,10,'will still'),(11,1,11,'carles martinez novell'),(12,1,12,'michel der zakarian'),(13,1,13,'patrick vieira'),(14,1,14,'jocelyn gourvennec'),(15,1,15,'lászló bölöni'),(16,1,16,'luka elsner'),(17,1,17,'régis le bris'),(18,1,18,'pascal gastien');
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach_job`
--

DROP TABLE IF EXISTS `coach_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coach_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coach_job_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach_job`
--

LOCK TABLES `coach_job` WRITE;
/*!40000 ALTER TABLE `coach_job` DISABLE KEYS */;
INSERT INTO `coach_job` VALUES (1,'entraineur'),(2,'adjoint');
/*!40000 ALTER TABLE `coach_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal`
--

DROP TABLE IF EXISTS `goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_lineup_player_selected_id` int(11) NOT NULL,
  `goal_type_id` int(11) NOT NULL,
  `goal_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_lineup_player_selected_id` (`team_lineup_player_selected_id`),
  KEY `goal_type_id` (`goal_type_id`),
  CONSTRAINT `goal_ibfk_1` FOREIGN KEY (`team_lineup_player_selected_id`) REFERENCES `team_lineup_player_selected` (`id`),
  CONSTRAINT `goal_ibfk_2` FOREIGN KEY (`goal_type_id`) REFERENCES `goal_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal`
--

LOCK TABLES `goal` WRITE;
/*!40000 ALTER TABLE `goal` DISABLE KEYS */;
/*!40000 ALTER TABLE `goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal_type`
--

DROP TABLE IF EXISTS `goal_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goal_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goal_type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_type`
--

LOCK TABLES `goal_type` WRITE;
/*!40000 ALTER TABLE `goal_type` DISABLE KEYS */;
INSERT INTO `goal_type` VALUES (1,'penalty'),(2,'coup franc'),(3,'tête'),(4,'pied');
/*!40000 ALTER TABLE `goal_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_result`
--

DROP TABLE IF EXISTS `match_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pre_match_id` int(11) NOT NULL,
  `winner_club_id` int(11) NOT NULL,
  `total_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `winner_club_id` (`winner_club_id`),
  KEY `pre_match_id` (`pre_match_id`),
  CONSTRAINT `match_result_ibfk_1` FOREIGN KEY (`winner_club_id`) REFERENCES `club` (`id`),
  CONSTRAINT `match_result_ibfk_2` FOREIGN KEY (`pre_match_id`) REFERENCES `pre_match` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_result`
--

LOCK TABLES `match_result` WRITE;
/*!40000 ALTER TABLE `match_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_result_card`
--

DROP TABLE IF EXISTS `match_result_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match_result_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_result_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `match_result_id` (`match_result_id`),
  KEY `card_id` (`card_id`),
  CONSTRAINT `match_result_card_ibfk_1` FOREIGN KEY (`match_result_id`) REFERENCES `match_result` (`id`),
  CONSTRAINT `match_result_card_ibfk_2` FOREIGN KEY (`card_id`) REFERENCES `card` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_result_card`
--

LOCK TABLES `match_result_card` WRITE;
/*!40000 ALTER TABLE `match_result_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_result_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_result_goal`
--

DROP TABLE IF EXISTS `match_result_goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match_result_goal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_result_id` int(11) NOT NULL,
  `goal_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `match_result_id` (`match_result_id`),
  KEY `goal_id` (`goal_id`),
  CONSTRAINT `match_result_goal_ibfk_1` FOREIGN KEY (`match_result_id`) REFERENCES `match_result` (`id`),
  CONSTRAINT `match_result_goal_ibfk_2` FOREIGN KEY (`goal_id`) REFERENCES `goal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_result_goal`
--

LOCK TABLES `match_result_goal` WRITE;
/*!40000 ALTER TABLE `match_result_goal` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_result_goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_result_substitution`
--

DROP TABLE IF EXISTS `match_result_substitution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match_result_substitution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_result_id` int(11) NOT NULL,
  `substitution_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `match_result_id` (`match_result_id`),
  KEY `substitution_id` (`substitution_id`),
  CONSTRAINT `match_result_substitution_ibfk_1` FOREIGN KEY (`match_result_id`) REFERENCES `match_result` (`id`),
  CONSTRAINT `match_result_substitution_ibfk_2` FOREIGN KEY (`substitution_id`) REFERENCES `substitution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_result_substitution`
--

LOCK TABLES `match_result_substitution` WRITE;
/*!40000 ALTER TABLE `match_result_substitution` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_result_substitution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `official`
--

DROP TABLE IF EXISTS `official`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `official` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `official_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `official`
--

LOCK TABLES `official` WRITE;
/*!40000 ALTER TABLE `official` DISABLE KEYS */;
INSERT INTO `official` VALUES (1,'Julien Aube'),(2,'Aurélien Berthomieu'),(3,'Nicolas Danos'),(4,'Aurélien Drouet'),(5,'Erwan Finjean'),(6,'Cyril Mugnier'),(7,'Huseyin Ocak'),(8,'Benjamin Pages'),(9,'Mehdi Rahmouni'),(10,'Hicham Zakrani'),(11,'Alexis Auger'),(12,'Mikael Berchebru'),(13,'Guillaume Debart'),(14,'Valentin Evrard'),(15,'Steven Torregrossa'),(16,'François Boudikian'),(17,'Laurent Coniglio'),(18,'Cédric Favre'),(19,'Julien Haulbert'),(20,'Philippe Jeanne'),(21,'Thomas Luczynski'),(22,'Christophe Mouysset'),(23,'Brice Parinet Le Tellier'),(24,'Gwenaël Pasqualotti'),(25,'Florian Goncalves de Araujo'),(26,'Bastien Courbet'),(27,'Ludovic Reyes'),(28,'Julien Pacelli.');
/*!40000 ALTER TABLE `official` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `club_id` int(11) NOT NULL,
  `player_position_name_id` int(11) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `player_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `club_id` (`club_id`),
  KEY `player_position_name_id` (`player_position_name_id`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`),
  CONSTRAINT `player_ibfk_2` FOREIGN KEY (`player_position_name_id`) REFERENCES `player_position` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=607 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,1,1,'keylor navas',1),(2,1,1,'alexandre letellier',30),(3,1,1,'louis mouquet',70),(4,1,1,'arnau tenas',80),(5,1,1,'gianluigi donnarumma',99),(6,1,1,'sergio rico',NULL),(7,1,2,'achraf hakimi',2),(8,1,2,'presnel kimpembe',3),(9,1,2,'marquinhos',5),(10,1,2,'lucas hernandez',21),(11,1,2,'nuno mendes',25),(12,1,2,'nordi mukiele',26),(13,1,2,'lucas beraldo',35),(14,1,2,'milan škriniar',37),(15,1,2,'layvin kurzawa',97),(16,1,3,'manuel ugarte',4),(17,1,3,'fabian ruiz',8),(18,1,3,'danilo pereira',15),(19,1,3,'vitinha',17),(20,1,3,'lee kang-in',19),(21,1,3,'carlos soler',28),(22,1,3,'warren zaïre-emery',33),(23,1,3,'ander herrera',NULL),(24,1,3,'junior dina ebimbe',NULL),(25,1,4,'kylian mbappe',7),(26,1,4,'gonçalo ramos',9),(27,1,4,'ousmane dembele',10),(28,1,4,'marco asensio',11),(29,1,4,'randal kolo muani',23),(30,1,4,'bradley barcola',29),(31,2,1,'radoslaw majecki',1),(32,2,1,'philipp köhn',16),(33,2,1,'alain zadi',40),(34,2,1,'yann lienard',50),(35,2,1,'jules stawiecki',70),(36,2,2,'vanderson',2),(37,2,2,'guillermo maripan',3),(38,2,2,'thilo kehrer',5),(39,2,2,'caio henrique',12),(40,2,2,'kassoum ouattara',20),(41,2,2,'mohammed salisu',22),(42,2,2,'soungoutou magassa',88),(43,2,2,'wilfried singo',99),(44,2,2,'dan sinate',NULL),(45,2,2,'enzo couto',NULL),(46,2,2,'fouad el maach',NULL),(47,2,2,'samuel kondi nibombe',NULL),(48,2,3,'mohamed camara',4),(49,2,3,'denis zakaria',6),(50,2,3,'ismail jakobs',14),(51,2,3,'aleksandr golovin',17),(52,2,3,'youssouf fofana',19),(53,2,3,'maghnes akliouche',21),(54,2,3,'edan diop',37),(55,2,3,'mamadou coulibaly',42),(56,2,3,'ritchy valme',43),(57,2,3,'saïmon bouabre',45),(58,2,3,'romaric etonde',48),(59,2,3,'aladji bamba',NULL),(60,2,3,'mayssam benama',NULL),(61,2,3,'mohamed bamba',NULL),(62,2,4,'eliesse ben seghir',7),(63,2,4,'wissam ben yedder',10),(64,2,4,'takumi minamino',18),(65,2,4,'krépin diatta',27),(66,2,4,'folarin balogun',29),(67,2,4,'breel embolo',36),(68,2,4,'aurélien platret',46),(69,2,4,'lucas michal',47),(70,2,4,'nazim babai',49),(71,2,4,'enzo baglieri',NULL),(72,2,4,'valentin salatiel decarpentrie',NULL),(73,2,4,'jonathan bakali',NULL),(74,3,1,'yan marillat',16),(75,3,1,'grégoire coudert',30),(76,3,1,'marco bizot',40),(77,3,2,'bradley locko',2),(78,3,2,'lilian brassier',3),(79,3,2,'brendan chardonnet',5),(80,3,2,'luck zogbe',12),(81,3,2,'adrien lebeau',14),(82,3,2,'antonin cartillier',18),(83,3,2,'jordan amavi',19),(84,3,2,'julien le cardinal',25),(85,3,2,'kenny lala',27),(86,3,3,'hugo magnetti',8),(87,3,3,'pierre lees-melou',20),(88,3,3,'billal brahimi',21),(89,3,3,'kamory doumbia',23),(90,3,3,'mathias pereira lage',26),(91,3,3,'jonas martin',28),(92,3,3,'mahdi camara',45),(93,3,4,'martin satriano',7),(94,3,4,'steve mounie',9),(95,3,4,'romain del castillo',10),(96,3,4,'axel camblan',11),(97,3,4,'jérémy le douaron',22),(98,4,1,'vito mannone',1),(99,4,1,'adam jakubech',16),(100,4,1,'lucas chevalier',30),(101,4,1,'tom negrel',40),(102,4,1,'lisandru olmeta',60),(103,4,2,'alexsandro',4),(104,4,2,'gabriel gudmundsson',5),(105,4,2,'samuel umtiti',14),(106,4,2,'leny yoro',15),(107,4,2,'bafodé diakite',18),(108,4,2,'tiago santos',22),(109,4,2,'rafael fernandes',28),(110,4,2,'ismaily',31),(111,4,2,'ousmane touré',36),(112,4,2,'abdoulaye ousmane',NULL),(113,4,2,'adame faïz',NULL),(114,4,2,'isaac cossier',NULL),(115,4,2,'kemryk nagera',NULL),(116,4,2,'vincent burlet',NULL),(117,4,2,'lucas mbamba',NULL),(118,4,3,'nabil bentaleb',6),(119,4,3,'hákon haraldsson',7),(120,4,3,'rémy cabella',10),(121,4,3,'adam ounas',11),(122,4,3,'yusuf yazici',12),(123,4,3,'ivan cavaleiro',17),(124,4,3,'tiago morais',19),(125,4,3,'ignacio miramon',20),(126,4,3,'benjamin andre',21),(127,4,3,'edon zhegrova',23),(128,4,3,'ayyoub bouaddi',32),(129,4,3,'aaron malouda',34),(130,4,3,'valentin vanbaleghem',41),(131,4,3,'joffrey bazie',42),(132,4,3,'alpha diallo',NULL),(133,4,3,'ichem ferrah',NULL),(134,4,3,'yassine khalifi',NULL),(135,4,3,'haukur haraldsson',NULL),(136,4,4,'angel gomes',8),(137,4,4,'jonathan david',9),(138,4,4,'andrej ilic',24),(139,4,4,'trévis dago',43),(140,5,1,'marcin bulka',1),(141,5,1,'maxime dupe',31),(142,5,1,'teddy boulhendi',77),(143,5,2,'valentin rosier',2),(144,5,2,'dante',4),(145,5,2,'jean-clair todibo',6),(146,5,2,'romain perraud',15),(147,5,2,'jordan lotomba',23),(148,5,2,'melvin bard',26),(149,5,2,'antoine mendy',33),(150,5,2,'yannis nahounou',34),(151,5,2,'youssouf ndayishimiye',55),(152,5,3,'pablo rosario',8),(153,5,3,'morgan sanson',11),(154,5,3,'alexis claude-maurice',18),(155,5,3,'khéphren thuram',19),(156,5,3,'alexis beka beka',21),(157,5,3,'hicham boudaoui',28),(158,5,3,'tom louchet',32),(159,5,3,'daouda traore',39),(160,5,3,'amidou doumbouya',44),(161,5,4,'jérémie boga',7),(162,5,4,'terem moffi',9),(163,5,4,'sofiane diop',10),(164,5,4,'gaëtan laborde',24),(165,5,4,'mohamed-ali cho',25),(166,5,4,'aliou balde',27),(167,5,4,'evann guessand',29),(168,5,4,'victor ikechukwu jonathan orakpo',NULL),(169,6,1,'jean-louis leca',16),(170,6,1,'brice samba',30),(171,6,1,'yannick pandor',40),(172,6,2,'ruben aguilar',2),(173,6,2,'deiver machado',3),(174,6,2,'kevin danso',4),(175,6,2,'jhoanner chavez',13),(176,6,2,'facundo medina',14),(177,6,2,'massadio haidara',21),(178,6,2,'jonathan gradit',24),(179,6,2,'abdukodir khusanov',25),(180,6,3,'salis abdul samed',6),(181,6,3,'david pereira da costa',10),(182,6,3,'angelo fulgini',11),(183,6,3,'andy diouf',18),(184,6,3,'neil el aynaoui',23),(185,6,3,'nampalys mendy',26),(186,6,3,'adrien thomasson',28),(187,6,3,'przemyslaw frankowski',29),(188,6,3,'ayanda sishuba',32),(189,6,3,'fodé sylla',33),(190,6,3,'adam abeddou',34),(191,6,3,'jimmy cabot',NULL),(192,6,4,'florian sotoca',7),(193,6,4,'elye wahi',9),(194,6,4,'wesley said',22),(195,6,4,'morgan guilavogui',27),(196,6,4,'ibrahima balde',36),(197,7,1,'gauthier gallon',1),(198,7,1,'steve mandanda',30),(199,7,1,'geoffrey lembet',40),(200,7,2,'adrien truffert',3),(201,7,2,'christopher wooh',4),(202,7,2,'arthur theate',5),(203,7,2,'jeanuël belocian',16),(204,7,2,'guéla doue',17),(205,7,2,'warmed omari',23),(206,7,2,'alidu seidu',36),(207,7,2,'mahamadou nagida',43),(208,7,3,'azor matusiwa',6),(209,7,3,'baptiste santamaria',8),(210,7,3,'ludovic blas',11),(211,7,3,'benjamin bourigeaud',14),(212,7,3,'enzo le fee',28),(213,7,3,'fabian rieder',32),(214,7,3,'désiré doue',33),(215,7,3,'mathis lambourde',39),(216,7,3,'josé capon',49),(217,7,4,'martin terrier',7),(218,7,4,'arnaud kalimuendo',9),(219,7,4,'amine gouiri',10),(220,7,4,'ibrahim salah',34),(221,7,4,'wilson samake',46),(222,7,4,'bertug yildirim',99),(223,8,1,'simon ngapandouentnbu',1),(224,8,1,'pau lopez',16),(225,8,1,'ruben blanco',36),(226,8,1,'ibrahim gomis',NULL),(227,8,1,'jelle van neck',NULL),(228,8,1,'bryan bernard',NULL),(229,8,2,'quentin merlin',3),(230,8,2,'samuel gigot',4),(231,8,2,'leonardo balerdi',5),(232,8,2,'ulisses garcia',6),(233,8,2,'jonathan clauss',7),(234,8,2,'stéphane sparagna',15),(235,8,2,'bamo meite',18),(236,8,2,'léo jousselin',31),(237,8,2,'roggerio nyakossi',32),(238,8,2,'brice negouai',35),(239,8,2,'yakine said mmadi',48),(240,8,2,'amir murillo',62),(241,8,2,'chancel mbemba',99),(242,8,2,'kassim abdallah mfoihaia',NULL),(243,8,2,'rony mimb baheng',NULL),(244,8,2,'thomas da costa',NULL),(245,8,3,'azzedine ounahi',8),(246,8,3,'jean onana',17),(247,8,3,'geoffrey kondogbia',19),(248,8,3,'valentin rongier',21),(249,8,3,'pape gueye',22),(250,8,3,'jordan veretout',27),(251,8,3,'bilal nadir',34),(252,8,3,'emran soglo',37),(253,8,3,'gael lafont',46),(254,8,3,'noam mayoka-tika',66),(255,8,3,'amay caprice',NULL),(256,8,3,'kélian le pironnec',NULL),(257,8,3,'nouhoum kamissoko',NULL),(258,8,3,'paolo sciortino',NULL),(259,8,3,'soumaila traore',NULL),(260,8,4,'pierre-emerick aubameyang',10),(261,8,4,'amine harit',11),(262,8,4,'faris moumbagna',14),(263,8,4,'joaquin correa',20),(264,8,4,'ismaila sarr',23),(265,8,4,'iliman ndiaye',29),(266,8,4,'ange lago',38),(267,8,4,'sofiane sidi ali',41),(268,8,4,'luis henrique',44),(269,8,4,'iùri moreira',47),(270,8,4,'aylan benyahia tani',NULL),(271,8,4,'enzo sternal',NULL),(272,8,4,'latta n\'dabrou',NULL),(273,8,4,'pedro ruiz delgado',NULL),(274,8,4,'rayan hassad',NULL),(275,8,4,'sayha seha',NULL),(276,9,1,'anthony lopes',1),(277,9,1,'lucas perri',23),(278,9,1,'justin bengui',30),(279,9,1,'lassine diarra',NULL),(280,9,2,'sinaly diomande',2),(281,9,2,'nicolás tagliafico',3),(282,9,2,'dejan lovren',5),(283,9,2,'jake o\'brien',12),(284,9,2,'adryelson',14),(285,9,2,'saël kumbedi',20),(286,9,2,'henrique silva',21),(287,9,2,'clinton mata',22),(288,9,2,'duje caleta-car',55),(289,9,2,'philippe boueye',NULL),(290,9,3,'paul akouokou',4),(291,9,3,'maxence caqueret',6),(292,9,3,'corentin tolisso',8),(293,9,3,'johann lepenant',24),(294,9,3,'orel mangala',25),(295,9,3,'chaïm el djebali',26),(296,9,3,'nemanja matic',31),(297,9,3,'mahamadou diawara',34),(298,9,3,'mohamed el-arouch',84),(299,9,3,'ainsley maitland-niles',98),(300,9,3,'celestino iala',NULL),(301,9,3,'moussa kante',NULL),(302,9,3,'samuel bossiwa-bessolo',NULL),(303,9,3,'thibaut ehling',NULL),(304,9,3,'yannis alladoum lagha',NULL),(305,9,4,'mama baldé',7),(306,9,4,'gift orban',9),(307,9,4,'alexandre lacazette',10),(308,9,4,'malick fofana',11),(309,9,4,'saïd benrahma',17),(310,9,4,'rayan cherki',18),(311,9,4,'ernest nuamah',37),(312,9,4,'djibrail dib',NULL),(313,9,4,'ibrahima fall',NULL),(314,9,4,'sekou lega',NULL),(315,10,1,'ludovic butelle',16),(316,10,1,'yehvann diouf',94),(317,10,1,'alexandre olliero',96),(318,10,1,'florent duparchy',NULL),(319,10,2,'joseph okumu',2),(320,10,2,'maxime busi',4),(321,10,2,'yunis abdelhamid',5),(322,10,2,'sergio akieme',18),(323,10,2,'emmanuel agbadou',24),(324,10,2,'thibault de smet',25),(325,10,2,'thomas foket',32),(326,10,2,'kobi henry',44),(327,10,2,'thérence koudou',45),(328,10,2,'fallou fall',46),(329,10,2,'arthur tchaptchet',53),(330,10,2,'nhoa sangui',55),(331,10,3,'valentin atangana edoa',6),(332,10,3,'amir richardson',8),(333,10,3,'teddy teuma',10),(334,10,3,'réda khadra',14),(335,10,3,'marshall munetsi',15),(336,10,3,'benjamin stambouli',26),(337,10,3,'samuel koeberle',48),(338,10,3,'abdoulaye gory',59),(339,10,3,'yirigue sekongo',61),(340,10,3,'kelechi egesionu',62),(341,10,3,'mohamed bamba',63),(342,10,3,'mamadou diakhon',67),(343,10,3,'yaya fofana',71),(344,10,3,'amadou koné',72),(345,10,4,'junya ito',7),(346,10,4,'mohamed daramy',9),(347,10,4,'keito nakamura',17),(348,10,4,'oumar diakite',22),(349,10,4,'adama bojang',27),(350,10,4,'ikechukwu orazi',73),(351,10,4,'niama pape sissoko',74),(352,10,4,'hugo ekitike',NULL),(353,11,1,'thomas himeur',1),(354,11,1,'alex dominguez',30),(355,11,1,'justin lacombe',40),(356,11,1,'guillaume restes',50),(357,11,2,'rasmus nicolaisen',2),(358,11,2,'mikkel desler',3),(359,11,2,'logan costa',6),(360,11,2,'warren kamanzi',12),(361,11,2,'christian mawissa elebi',13),(362,11,2,'gabriel suazo',17),(363,11,2,'moussa diarra',23),(364,11,2,'kévin keben',25),(365,11,2,'ylies aradj',26),(366,11,3,'stijn spierings',4),(367,11,3,'denis genreau',5),(368,11,3,'vincent sierro',8),(369,11,3,'césar gelabert',11),(370,11,3,'aron donnum',15),(371,11,3,'niklas schmidt',20),(372,11,3,'naatan skytta',22),(373,11,3,'cristian casseres jr',24),(374,11,3,'noah lahmadi',34),(375,11,4,'zakaria aboukhlal',7),(376,11,4,'thijs dallinga',9),(377,11,4,'ibrahim cissoko',10),(378,11,4,'frank magri',19),(379,11,4,'yann gboho',37),(380,11,4,'shavy babicka',80),(381,11,4,'bonota traore',NULL),(382,11,4,'noah edjouma',NULL),(383,12,1,'belmin dizdarevic',1),(384,12,1,'dimitry bertaud',16),(385,12,1,'benjamin lecomte',40),(386,12,2,'issiaga sylla',3),(387,12,2,'boubakar kouyate',4),(388,12,2,'modibo sagnan',5),(389,12,2,'christopher jullien',6),(390,12,2,'théo sainte-luce',17),(391,12,2,'becir omeragic',27),(392,12,2,'enzo tchato',29),(393,12,2,'silvan hefti',36),(394,12,2,'falaye sacko',77),(395,12,3,'mousa tamari',9),(396,12,3,'téji savanier',11),(397,12,3,'jordan ferri',12),(398,12,3,'joris chotard',13),(399,12,3,'léo leroy',18),(400,12,3,'sacha delaye',19),(401,12,3,'khalil fayad',22),(402,12,4,'arnaud nordin',7),(403,12,4,'akor adams',8),(404,12,4,'wahbi khazri',10),(405,12,4,'yann karamoh',23),(406,12,4,'tanguy coulibaly',70),(407,12,4,'glenn olivier peh ngosso',NULL),(408,13,1,'matthieu dreyer',1),(409,13,1,'alexandre pierre',30),(410,13,1,'alaa bellaarouch',36),(411,13,1,'walid hasbi',50),(412,13,2,'frédéric guilbert',2),(413,13,2,'thomas delaine',3),(414,13,2,'karol fila',4),(415,13,2,'lucas perrin',5),(416,13,2,'saïdou sow',13),(417,13,2,'abakar sylla',24),(418,13,2,'steven baseya',25),(419,13,2,'marvin senaya',28),(420,13,2,'ismaël doukoure',29),(421,13,2,'clancy valere biten',NULL),(422,13,2,'kanfory drame',NULL),(423,13,3,'jean-eudes aholou',6),(424,13,3,'jessy deminguet',7),(425,13,3,'andrey santos',8),(426,13,3,'junior mwanga',18),(427,13,3,'habib diarra',19),(428,13,3,'ibrahima sissoko',27),(429,13,3,'mohamed soumahoro',NULL),(430,13,3,'tom saettel',NULL),(431,13,4,'kévin gameiro',9),(432,13,4,'emanuel emegha',10),(433,13,4,'moïse sahi dion',11),(434,13,4,'lebo mothiba',12),(435,13,4,'ângelo gabriel',23),(436,13,4,'dilane bakwa',26),(437,13,4,'jérémy sebas',40),(438,13,4,'lorenzo depuidt',NULL),(439,13,4,'oussama lyakoubi',NULL),(440,13,4,'abdoul ouattara',NULL),(441,13,4,'david kaiki',NULL),(442,13,4,'patrick ouotro',NULL),(443,14,1,'alban lafont',1),(444,14,1,'remy descamps',16),(445,14,1,'denis petric',30),(446,14,1,'lucas bonelli',40),(447,14,1,'hugo barbet',50),(448,14,2,'jean-kévin duverne',2),(449,14,2,'nicolas cozza',3),(450,14,2,'nicolas pallois',4),(451,14,2,'jean-charles castelletto',21),(452,14,2,'yannis m\'bemba',22),(453,14,2,'eray cömert',24),(454,14,2,'mathieu acapandie',41),(455,14,2,'moutanabi bodiang',42),(456,14,2,'robin voisine',43),(457,14,2,'nathan zeze',44),(458,14,2,'bastien meupiyou',45),(459,14,2,'cheickné yaffa',65),(460,14,2,'kelvin amian',98),(461,14,3,'pedro chirivella',5),(462,14,3,'douglas augusto',6),(463,14,3,'samuel moutoussamy',8),(464,14,3,'moussa sissoko',17),(465,14,3,'mohamed achi',19),(466,14,3,'florent mollet',25),(467,14,3,'dehmaine assoumani',59),(468,14,3,'hugo boutsingkham',71),(469,14,3,'mathis oger',74),(470,14,3,'sacha ziani',NULL),(471,14,4,'ignatius ganago',7),(472,14,4,'marcus coco',11),(473,14,4,'abdoul-kader bamba',12),(474,14,4,'tino kadewere',15),(475,14,4,'stredair appuah',23),(476,14,4,'moses simon',27),(477,14,4,'mostafa mohamed',31),(478,14,4,'matthis abline',39),(479,14,4,'adel mahamoud',54),(480,14,4,'omar abbas mvungi',56),(481,14,4,'frédéric ndi assoumou',57),(482,14,4,'joe-loïc affamah',61),(483,14,4,'hamissou dangabo',73),(484,14,4,'bénie traoré',77),(485,14,4,'plamedi nsingi mbala',NULL),(486,15,1,'guillaume dietsch',1),(487,15,1,'alexandre oukidja',16),(488,15,1,'marc-aurèle caillard',30),(489,15,2,'maxime colin',2),(490,15,2,'matthieu udol',3),(491,15,2,'fali candé',5),(492,15,2,'ismaël traore',8),(493,15,2,'aboubacar lo',15),(494,15,2,'kevin van den kerkhof',22),(495,15,2,'christophe herelle',29),(496,15,2,'sadibou sane',38),(497,15,2,'koffi kouao',39),(498,15,3,'kévin n\'doram',6),(499,15,3,'warren tchimbembe',12),(500,15,3,'cheikh tidiane sabaly',14),(501,15,3,'lamine camara',18),(502,15,3,'arthur atta',25),(503,15,3,'danley jean jacques',27),(504,15,3,'joseph nduquidi',34),(505,15,3,'ablie jallow',36),(506,15,3,'joel asoro',99),(507,15,4,'papa amadou diallo',7),(508,15,4,'georges mikautadze',10),(509,15,4,'didier lamkel ze',11),(510,15,4,'benjamin tetteh',17),(511,15,4,'malick mbaye',26),(512,15,4,'ibou sane',37),(513,16,1,'mathieu gorgelin',1),(514,16,1,'arthur desmas',30),(515,16,2,'gautier lloris',4),(516,16,2,'etienne youte',6),(517,16,2,'oualid el hajjam',17),(518,16,2,'yoann salmier',22),(519,16,2,'christopher operi',27),(520,16,2,'yoni gomis',35),(521,16,2,'aliou thiare',66),(522,16,2,'arouna sangante',93),(523,16,3,'oussama targhalline',5),(524,16,3,'loïc nego',7),(525,16,3,'yassine kechta',8),(526,16,3,'matheo bodmer',12),(527,16,3,'daler kuziaev',14),(528,16,3,'rassoul ndiaye',19),(529,16,3,'alois confais',25),(530,16,3,'simon ebonog',26),(531,16,3,'mokrane bentoumi',37),(532,16,3,'abdoulaye toure',94),(533,16,4,'mohamed bayo',9),(534,16,4,'emmanuel sabbi',11),(535,16,4,'steve ngoura',13),(536,16,4,'elysee logbo',20),(537,16,4,'antoine joujou',21),(538,16,4,'josue casimir',23),(539,16,4,'cheick doumbia',24),(540,16,4,'andré ayew',28),(541,16,4,'samuel grandsir',29),(542,17,1,'alfred gomis',1),(543,17,1,'yvon mvogo',38),(544,17,1,'dominique youfeigane',94),(545,17,2,'igor silva',2),(546,17,2,'montassar talbi',3),(547,17,2,'loris mouyokolo',4),(548,17,2,'benjamin mendy',5),(549,17,2,'darlin yongwa',12),(550,17,2,'formose mendy',13),(551,17,2,'julien laporte',15),(552,17,2,'gédéon kalulu',24),(553,17,2,'nathaniel adjei',32),(554,17,2,'isaak toure',95),(555,17,2,'isaac james',NULL),(556,17,3,'imran louza',6),(557,17,3,'panos katseris',7),(558,17,3,'bonke innocent',8),(559,17,3,'badredine bouanani',10),(560,17,3,'tiémoué bakayoko',14),(561,17,3,'jean-victor makengo',17),(562,17,3,'laurent abergel',19),(563,17,3,'julien ponceau',21),(564,17,3,'théo le bris',37),(565,17,3,'ayman kari',44),(566,17,3,'quentin boisgard',97),(567,17,3,'arthur avom ebong',NULL),(568,17,3,'exaucé mpembele boula',NULL),(569,17,3,'paul bellon',NULL),(570,17,4,'mohamed bamba',9),(571,17,4,'bamba dieng',11),(572,17,4,'eli junior kroupi',22),(573,17,4,'aiyegun tosin',27),(574,18,1,'massamba n\'diaye',1),(575,18,1,'théo borne',16),(576,18,1,'mory diaw',99),(577,18,2,'mehdi zeffane',2),(578,18,2,'neto borges',3),(579,18,2,'chrislain matsima',4),(580,18,2,'maximiliano caufriez',5),(581,18,2,'cheick oumar konate',15),(582,18,2,'andy pelmard',17),(583,18,2,'florent ogier',21),(584,18,2,'yoël armougom',22),(585,18,2,'sumaila awudu',34),(586,18,2,'jérémy jacquet',97),(587,18,2,'baïla diallo',NULL),(588,18,2,'ivan m\'bahia',NULL),(589,18,2,'matys donavin',NULL),(590,18,3,'habib keita',6),(591,18,3,'yohann magnin',7),(592,18,3,'bilal boutobba',8),(593,18,3,'muhammed cham',10),(594,18,3,'maxime gonalons',12),(595,18,3,'elbasan rashani',18),(596,18,3,'stan berkani',24),(597,18,3,'johan gastien',25),(598,18,3,'adam mabrouk',80),(599,18,4,'komnen andric',9),(600,18,4,'jim allevinah',11),(601,18,4,'mohamed-amine bouchenna',19),(602,18,4,'shamar nicholson',23),(603,18,4,'alan virginius',26),(604,18,4,'jérémie bela',91),(605,18,4,'grejohn kyei',95),(606,18,4,'abdellah baallal',NULL);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_position`
--

DROP TABLE IF EXISTS `player_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_position_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_position`
--

LOCK TABLES `player_position` WRITE;
/*!40000 ALTER TABLE `player_position` DISABLE KEYS */;
INSERT INTO `player_position` VALUES (1,'Gardien'),(2,'Défenseur'),(3,'Milieu'),(4,'Attaquant');
/*!40000 ALTER TABLE `player_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_selected`
--

DROP TABLE IF EXISTS `player_selected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_selected` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `player_selected_position_name_id` int(11) NOT NULL,
  `player_selected_starting` tinyint(1) NOT NULL,
  `player_selected_captain` tinyint(1) NOT NULL,
  `player_selected_captain_substitute` tinyint(1) NOT NULL,
  `player_selected_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `player_selected_position_name_id` (`player_selected_position_name_id`),
  CONSTRAINT `player_selected_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`),
  CONSTRAINT `player_selected_ibfk_2` FOREIGN KEY (`player_selected_position_name_id`) REFERENCES `player_position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_selected`
--

LOCK TABLES `player_selected` WRITE;
/*!40000 ALTER TABLE `player_selected` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_selected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre_match`
--

DROP TABLE IF EXISTS `pre_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pre_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pre_match_team_lineup_versus_id` int(11) NOT NULL,
  `pre_match_official_lineup_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pre_match_team_lineup_versus_id` (`pre_match_team_lineup_versus_id`),
  KEY `pre_match_official_lineup_id` (`pre_match_official_lineup_id`),
  CONSTRAINT `pre_match_ibfk_1` FOREIGN KEY (`pre_match_team_lineup_versus_id`) REFERENCES `pre_match_team_lineup_versus` (`id`),
  CONSTRAINT `pre_match_ibfk_2` FOREIGN KEY (`pre_match_official_lineup_id`) REFERENCES `pre_match_official_lineup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_match`
--

LOCK TABLES `pre_match` WRITE;
/*!40000 ALTER TABLE `pre_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `pre_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre_match_official_lineup`
--

DROP TABLE IF EXISTS `pre_match_official_lineup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pre_match_official_lineup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referee_official_id` int(11) NOT NULL,
  `linesmen_left_official_id` int(11) NOT NULL,
  `linesmen_right_official_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_match_official_lineup`
--

LOCK TABLES `pre_match_official_lineup` WRITE;
/*!40000 ALTER TABLE `pre_match_official_lineup` DISABLE KEYS */;
/*!40000 ALTER TABLE `pre_match_official_lineup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre_match_team_lineup_versus`
--

DROP TABLE IF EXISTS `pre_match_team_lineup_versus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pre_match_team_lineup_versus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `home_team_lineup_id` int(11) NOT NULL,
  `away_team_lineup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_team_lineup_id` (`home_team_lineup_id`),
  KEY `away_team_lineup_id` (`away_team_lineup_id`),
  CONSTRAINT `pre_match_team_lineup_versus_ibfk_1` FOREIGN KEY (`home_team_lineup_id`) REFERENCES `team_lineup` (`id`),
  CONSTRAINT `pre_match_team_lineup_versus_ibfk_2` FOREIGN KEY (`away_team_lineup_id`) REFERENCES `team_lineup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_match_team_lineup_versus`
--

LOCK TABLES `pre_match_team_lineup_versus` WRITE;
/*!40000 ALTER TABLE `pre_match_team_lineup_versus` DISABLE KEYS */;
/*!40000 ALTER TABLE `pre_match_team_lineup_versus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS `stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stadium` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stadium_name` varchar(255) NOT NULL,
  `stadium_capacity` int(11) NOT NULL,
  `stadium_city` varchar(255) NOT NULL,
  `stadium_image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium`
--

LOCK TABLES `stadium` WRITE;
/*!40000 ALTER TABLE `stadium` DISABLE KEYS */;
INSERT INTO `stadium` VALUES (1,'parc des princes',47929,'paris','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Stadiums/2023-2024/13.png'),(2,'stade louis-ii',16500,'monaco','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Stadiums/2023-2024/9.png'),(3,'stade francis-le blé',15150,'brest','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Stadiums/2023-2024/44.png'),(4,'decathlon arena – stade pierre-mauroy',49082,'villeneuve d\'ascq','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Stadiums/2023-2024/158.png'),(5,'allianz riviera',35596,'nice','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Stadiums/2023-2024/30.png'),(6,'stade bollaert-delelis',37705,'lens','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Stadiums/2023-2024/6.png'),(7,'roazhon park',29194,'rennes','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Stadiums/2023-2024/14.png'),(8,'orange vélodrome',66226,'marseille','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Stadiums/2023-2024/1.png'),(9,'groupama stadium',57206,'décines-charpieu','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Stadiums/2023-2024/159.png'),(10,'stade auguste-delaune',20546,'reims','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Stadiums/2023-2024/41.png'),(11,'stadium',29740,'toulouse','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Stadiums/2023-2024/16.png'),(12,'stade de la mosson et du mondial 98',22000,'montpellier','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Stadiums/2023-2024/10.png'),(13,'stade de la meinau',26109,'strasbourg','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Stadiums/2023-2024/15.png'),(14,'stade de la beaujoire-louis fonteneau',35550,'nantes','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Stadiums/2023-2024/12.png'),(15,'stade saint-symphorien',28786,'longeville-lès-metz','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Stadiums/2023-2024/8.png'),(16,'stade océane',25181,'le havre','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Stadiums/2023-2024/5.png'),(17,'stade yves-allainmat',16895,'lorient','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Stadiums/2023-2024/7.png'),(18,'stade gabriel-montpied',12381,'clermont-ferrand','https://www.ligue1.fr/-/media/Project/LFP/shared/Images/Stadiums/2023-2024/40.png');
/*!40000 ALTER TABLE `stadium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `substitution`
--

DROP TABLE IF EXISTS `substitution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `substitution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `out_team_lineup_player_selected_id` int(11) NOT NULL,
  `in_team_lineup_player_selected_id` int(11) NOT NULL,
  `substitution_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `out_team_lineup_player_selected_id` (`out_team_lineup_player_selected_id`),
  KEY `in_team_lineup_player_selected_id` (`in_team_lineup_player_selected_id`),
  CONSTRAINT `substitution_ibfk_1` FOREIGN KEY (`out_team_lineup_player_selected_id`) REFERENCES `team_lineup_player_selected` (`id`),
  CONSTRAINT `substitution_ibfk_2` FOREIGN KEY (`in_team_lineup_player_selected_id`) REFERENCES `team_lineup_player_selected` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `substitution`
--

LOCK TABLES `substitution` WRITE;
/*!40000 ALTER TABLE `substitution` DISABLE KEYS */;
/*!40000 ALTER TABLE `substitution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_lineup`
--

DROP TABLE IF EXISTS `team_lineup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_lineup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `club_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `club_id` (`club_id`),
  CONSTRAINT `team_lineup_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_lineup`
--

LOCK TABLES `team_lineup` WRITE;
/*!40000 ALTER TABLE `team_lineup` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_lineup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_lineup_player_selected`
--

DROP TABLE IF EXISTS `team_lineup_player_selected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_lineup_player_selected` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_lineup_id` int(11) NOT NULL,
  `player_selected_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_lineup_id` (`team_lineup_id`),
  KEY `player_selected_id` (`player_selected_id`),
  CONSTRAINT `team_lineup_player_selected_ibfk_1` FOREIGN KEY (`team_lineup_id`) REFERENCES `team_lineup` (`id`),
  CONSTRAINT `team_lineup_player_selected_ibfk_2` FOREIGN KEY (`player_selected_id`) REFERENCES `player_selected` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_lineup_player_selected`
--

LOCK TABLES `team_lineup_player_selected` WRITE;
/*!40000 ALTER TABLE `team_lineup_player_selected` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_lineup_player_selected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `favorite_club_id` int(11) DEFAULT NULL,
  `pseudo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pseudo` (`pseudo`),
  UNIQUE KEY `email` (`email`),
  KEY `favorite_club_id` (`favorite_club_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`favorite_club_id`) REFERENCES `club` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-28 17:08:01
