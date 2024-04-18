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
-- Table structure for table `apres_mach_remplacement`
--

DROP TABLE IF EXISTS `apres_mach_remplacement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apres_mach_remplacement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apres_match_id` int(11) NOT NULL,
  `remplacement_pendant_match_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `remplacement_pendant_match_id` (`remplacement_pendant_match_id`),
  KEY `apres_match_id` (`apres_match_id`),
  CONSTRAINT `apres_mach_remplacement_ibfk_1` FOREIGN KEY (`remplacement_pendant_match_id`) REFERENCES `remplacement_pendant_match` (`id`),
  CONSTRAINT `apres_mach_remplacement_ibfk_2` FOREIGN KEY (`apres_match_id`) REFERENCES `apres_match` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apres_mach_remplacement`
--

LOCK TABLES `apres_mach_remplacement` WRITE;
/*!40000 ALTER TABLE `apres_mach_remplacement` DISABLE KEYS */;
/*!40000 ALTER TABLE `apres_mach_remplacement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apres_match`
--

DROP TABLE IF EXISTS `apres_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apres_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `preparation_match_id` int(11) NOT NULL,
  `temps_match` int(11) NOT NULL,
  `gagnant` int(11) DEFAULT NULL COMMENT 'Id du club gagnant, null si match nul',
  PRIMARY KEY (`id`),
  KEY `preparation_match_id` (`preparation_match_id`),
  KEY `gagnant` (`gagnant`),
  CONSTRAINT `apres_match_ibfk_1` FOREIGN KEY (`preparation_match_id`) REFERENCES `preparation_match` (`id`),
  CONSTRAINT `apres_match_ibfk_2` FOREIGN KEY (`gagnant`) REFERENCES `club` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apres_match`
--

LOCK TABLES `apres_match` WRITE;
/*!40000 ALTER TABLE `apres_match` DISABLE KEYS */;
INSERT INTO `apres_match` VALUES (1,1,92,1);
/*!40000 ALTER TABLE `apres_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apres_match_but`
--

DROP TABLE IF EXISTS `apres_match_but`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apres_match_but` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apres_match_id` int(11) NOT NULL,
  `but_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `but_id` (`but_id`),
  KEY `apres_match_id` (`apres_match_id`),
  CONSTRAINT `apres_match_but_ibfk_1` FOREIGN KEY (`but_id`) REFERENCES `but` (`id`),
  CONSTRAINT `apres_match_but_ibfk_2` FOREIGN KEY (`apres_match_id`) REFERENCES `apres_match` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apres_match_but`
--

LOCK TABLES `apres_match_but` WRITE;
/*!40000 ALTER TABLE `apres_match_but` DISABLE KEYS */;
/*!40000 ALTER TABLE `apres_match_but` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apres_match_carton_pendant_match`
--

DROP TABLE IF EXISTS `apres_match_carton_pendant_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apres_match_carton_pendant_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apres_match_id` int(11) NOT NULL,
  `carton_pendant_match_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carton_pendant_match_id` (`carton_pendant_match_id`),
  KEY `apres_match_id` (`apres_match_id`),
  CONSTRAINT `apres_match_carton_pendant_match_ibfk_1` FOREIGN KEY (`carton_pendant_match_id`) REFERENCES `carton_pendant_match` (`id`),
  CONSTRAINT `apres_match_carton_pendant_match_ibfk_2` FOREIGN KEY (`apres_match_id`) REFERENCES `apres_match` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apres_match_carton_pendant_match`
--

LOCK TABLES `apres_match_carton_pendant_match` WRITE;
/*!40000 ALTER TABLE `apres_match_carton_pendant_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `apres_match_carton_pendant_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arbitre`
--

DROP TABLE IF EXISTS `arbitre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arbitre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `nationalite` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbitre`
--

LOCK TABLES `arbitre` WRITE;
/*!40000 ALTER TABLE `arbitre` DISABLE KEYS */;
INSERT INTO `arbitre` VALUES (1,'Davignon','Roch','Français'),(2,'Séguin','Thiery',NULL),(3,'Lévesque','Dorothée',NULL);
/*!40000 ALTER TABLE `arbitre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `but`
--

DROP TABLE IF EXISTS `but`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `but` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joueur_id` int(11) NOT NULL,
  `type_but_id` int(11) NOT NULL,
  `minutes_match` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `joueur_id` (`joueur_id`),
  KEY `type_but_id` (`type_but_id`),
  CONSTRAINT `but_ibfk_1` FOREIGN KEY (`joueur_id`) REFERENCES `joueur` (`id`),
  CONSTRAINT `but_ibfk_2` FOREIGN KEY (`type_but_id`) REFERENCES `type_but` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `but`
--

LOCK TABLES `but` WRITE;
/*!40000 ALTER TABLE `but` DISABLE KEYS */;
/*!40000 ALTER TABLE `but` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carton`
--

DROP TABLE IF EXISTS `carton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carton` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carton_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carton`
--

LOCK TABLES `carton` WRITE;
/*!40000 ALTER TABLE `carton` DISABLE KEYS */;
INSERT INTO `carton` VALUES (1,'jaune'),(2,'rouge');
/*!40000 ALTER TABLE `carton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carton_pendant_match`
--

DROP TABLE IF EXISTS `carton_pendant_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carton_pendant_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joueur_id` int(11) NOT NULL,
  `carton_id` int(11) NOT NULL,
  `minutes_match` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `joueur_id` (`joueur_id`),
  KEY `carton_id` (`carton_id`),
  CONSTRAINT `carton_pendant_match_ibfk_1` FOREIGN KEY (`joueur_id`) REFERENCES `joueur` (`id`),
  CONSTRAINT `carton_pendant_match_ibfk_2` FOREIGN KEY (`carton_id`) REFERENCES `carton` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carton_pendant_match`
--

LOCK TABLES `carton_pendant_match` WRITE;
/*!40000 ALTER TABLE `carton_pendant_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `carton_pendant_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `club` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stade_id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stade_id` (`stade_id`),
  CONSTRAINT `club_ibfk_1` FOREIGN KEY (`stade_id`) REFERENCES `stade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES (1,1,'Paris Saint-Germain'),(2,2,'Olympique de Marseille'),(3,3,'Olympique Lyonnais'),(4,4,'Lille OSC'),(5,5,'AS Saint-Étienne'),(6,6,'FC Girondins de Bordeaux'),(7,7,'RC Strasbourg Alsace'),(8,8,'Montpellier HSC'),(9,9,'AS Monaco FC'),(10,10,'OGC Nice');
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composition_equipe`
--

DROP TABLE IF EXISTS `composition_equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composition_equipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `club_id` int(11) NOT NULL,
  `entraineur_club_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `club_id` (`club_id`),
  KEY `entraineur_club_id` (`entraineur_club_id`),
  CONSTRAINT `composition_equipe_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`),
  CONSTRAINT `composition_equipe_ibfk_3` FOREIGN KEY (`entraineur_club_id`) REFERENCES `entraineur_club` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composition_equipe`
--

LOCK TABLES `composition_equipe` WRITE;
/*!40000 ALTER TABLE `composition_equipe` DISABLE KEYS */;
INSERT INTO `composition_equipe` VALUES (1,1,1),(2,6,11);
/*!40000 ALTER TABLE `composition_equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composition_equipe_joueur_selection`
--

DROP TABLE IF EXISTS `composition_equipe_joueur_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composition_equipe_joueur_selection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joueur_selection_id` int(11) NOT NULL,
  `composition_equipe_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `composition_equipe_id` (`composition_equipe_id`),
  KEY `joueur_selection_id` (`joueur_selection_id`),
  CONSTRAINT `composition_equipe_joueur_selection_ibfk_1` FOREIGN KEY (`composition_equipe_id`) REFERENCES `composition_equipe` (`id`),
  CONSTRAINT `composition_equipe_joueur_selection_ibfk_2` FOREIGN KEY (`joueur_selection_id`) REFERENCES `joueur_selection` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composition_equipe_joueur_selection`
--

LOCK TABLES `composition_equipe_joueur_selection` WRITE;
/*!40000 ALTER TABLE `composition_equipe_joueur_selection` DISABLE KEYS */;
INSERT INTO `composition_equipe_joueur_selection` VALUES (1,1,1),(2,3,2),(3,2,1);
/*!40000 ALTER TABLE `composition_equipe_joueur_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entraineur`
--

DROP TABLE IF EXISTS `entraineur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entraineur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entraineur`
--

LOCK TABLES `entraineur` WRITE;
/*!40000 ALTER TABLE `entraineur` DISABLE KEYS */;
INSERT INTO `entraineur` VALUES (1,'Dupont','Jean'),(2,'Martin','Marie'),(3,'Bernard','Julien'),(4,'Petit','Claire'),(5,'Robert','Nicolas'),(6,'Richard','Sophie'),(7,'Durand','Lucas'),(8,'Leroy','Emma'),(9,'Moreau','Chloé'),(10,'Simon','Hugo'),(11,'Lefebvre','Stéphane'),(12,'Perrin','Mathilde'),(13,'Mercier','Félix'),(14,'Blanc','Virginie'),(15,'Guerin','Rose'),(16,'Muller','Alexandre'),(17,'Henry','Catherine'),(18,'Roussel','David'),(19,'Nicolas','Elodie'),(20,'Morel','Adrien'),(21,'Clement','Alice'),(22,'Fontaine','Juliette'),(23,'Robin','Maxime'),(24,'Thomas','Morgane'),(25,'Lemoine','Edouard'),(26,'Garnier','Louise'),(27,'Faure','Lucie'),(28,'Rousseau','Gabriel'),(29,'Morin','Anaïs'),(30,'Bertrand','Rémi'),(31,'Marchand','Benoît'),(32,'Dufour','Camille'),(33,'Blanchard','Dominique'),(34,'Marie','Emmanuelle'),(35,'Barbier','François');
/*!40000 ALTER TABLE `entraineur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entraineur_club`
--

DROP TABLE IF EXISTS `entraineur_club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entraineur_club` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entraineur_id` int(11) NOT NULL,
  `entraineur_poste_id` int(11) NOT NULL,
  `club_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `club_id` (`club_id`),
  KEY `entraineur_id` (`entraineur_id`),
  KEY `entraineur_poste_id` (`entraineur_poste_id`),
  CONSTRAINT `entraineur_club_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`),
  CONSTRAINT `entraineur_club_ibfk_2` FOREIGN KEY (`entraineur_id`) REFERENCES `entraineur` (`id`),
  CONSTRAINT `entraineur_club_ibfk_3` FOREIGN KEY (`entraineur_poste_id`) REFERENCES `entraineur_poste` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entraineur_club`
--

LOCK TABLES `entraineur_club` WRITE;
/*!40000 ALTER TABLE `entraineur_club` DISABLE KEYS */;
INSERT INTO `entraineur_club` VALUES (1,1,1,1),(2,2,2,1),(3,3,1,2),(4,4,2,2),(5,5,1,3),(6,6,2,3),(7,7,1,4),(8,8,2,4),(9,9,1,5),(10,10,2,5),(11,11,1,6),(12,12,2,6),(13,13,1,7),(14,14,2,7),(15,15,1,8),(16,16,2,8),(17,17,1,9),(18,18,2,9),(19,19,1,10),(20,20,2,10);
/*!40000 ALTER TABLE `entraineur_club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entraineur_poste`
--

DROP TABLE IF EXISTS `entraineur_poste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entraineur_poste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poste` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entraineur_poste`
--

LOCK TABLES `entraineur_poste` WRITE;
/*!40000 ALTER TABLE `entraineur_poste` DISABLE KEYS */;
INSERT INTO `entraineur_poste` VALUES (1,'Entraineur'),(2,'Entraineur adjoint');
/*!40000 ALTER TABLE `entraineur_poste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joueur`
--

DROP TABLE IF EXISTS `joueur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `joueur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `club_id` int(11) NOT NULL,
  `joueur_poste_id` int(11) NOT NULL COMMENT 'Poste préféré du joueur',
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `numero_prefere` int(11) DEFAULT NULL COMMENT 'Numéro préféré du joueur',
  PRIMARY KEY (`id`),
  KEY `club_id` (`club_id`),
  KEY `joueur_poste_id` (`joueur_poste_id`),
  CONSTRAINT `joueur_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`),
  CONSTRAINT `joueur_ibfk_2` FOREIGN KEY (`joueur_poste_id`) REFERENCES `joueur_poste` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joueur`
--

LOCK TABLES `joueur` WRITE;
/*!40000 ALTER TABLE `joueur` DISABLE KEYS */;
INSERT INTO `joueur` VALUES (1,1,1,'Rousseau','Axel',39),(2,1,1,'Steward','Maxime',28),(3,1,2,'Robert','Maxime',71),(4,1,2,'Brown','Enzo',12),(5,1,3,'Leroy','Arthur',16),(6,1,3,'Durand','Étienne',75),(7,1,4,'Moreau','Axel',90),(8,1,4,'Roux','Vincent',47),(9,1,5,'Bernard','Vincent',50),(10,1,5,'Fontaine','Étienne',94),(11,1,6,'Richard','Lucas',18),(12,1,6,'Laurent','Louis',9),(13,1,7,'Garnier','Jules',71),(14,1,7,'Michel','Louis',58),(15,1,8,'Simard','Louis',39),(16,1,8,'Fournier','Maxime',16),(17,1,9,'Kinney','Étienne',62),(18,1,9,'Lambert','Gabriel',25),(19,1,10,'Landers','Étienne',9),(20,1,10,'Jones','Louis',73),(21,1,11,'Bonnet','Étienne',64),(22,1,11,'Simon','Théo',8),(23,1,1,'Dupont','Vincent',72),(24,1,11,'Martin','Jules',6),(25,1,6,'Lambert','Hugo',57),(26,2,1,'Clement','Maxime',36),(27,2,1,'Lefevre','Valentin',44),(28,2,2,'Morel','Jules',14),(29,2,2,'Duval','Thomas',84),(30,2,3,'Marié','Maxime',38),(31,2,3,'Roussel','Maxime',15),(32,2,4,'Gautier','Lucas',50),(33,2,4,'Marchand','Clément',98),(34,2,5,'Mercier','Jules',50),(35,2,5,'Boucher','Jules',50),(36,2,6,'Legrand','Jules',20),(37,2,6,'Blanc','Vincent',58),(38,2,7,'Chevalier','Léo',74),(39,2,7,'Lemaire','Valentin',73),(40,2,8,'Mathieu','Antoine',73),(41,2,8,'Morin','Alexandre',65),(42,2,9,'Perrin','Clément',70),(43,2,9,'Robin','Arthur',29),(44,2,10,'Francois','Florent',46),(45,2,10,'Henry','Jules',77),(46,2,11,'Garnier','Maxime',97),(47,2,11,'Garcia','Maxime',53),(48,2,11,'Fleury','Axel',63),(49,2,1,'Thomas','Léo',36),(50,2,1,'Léger','Alexandre',59),(51,3,1,'Gonzalez','Elijah',67),(52,3,1,'Moore','Matthieu',66),(53,3,2,'Morel','William',13),(54,3,2,'Taylor','Étienne',2),(55,3,3,'Parker','Léo',27),(56,3,3,'Brown','Thomas',71),(57,3,4,'Bertrand','Florent',22),(58,3,4,'Carter','Jules',53),(59,3,5,'Lopez','Mateo',5),(60,3,5,'Perez','Asher',9),(61,3,6,'Williams','Ivan',97),(62,3,6,'Scott','Clément',56),(63,3,7,'Green','Miguel',55),(64,3,7,'Evans','Étienne',83),(65,3,8,'Edwards','Matthew',50),(66,3,8,'Lewis','Axel',38),(67,3,9,'White','Noah',23),(68,3,9,'Johnson','Lincoln',17),(69,3,10,'Thomas','Arthur',35),(70,3,10,'Walker','Lucas',75),(71,3,11,'Wright','Jack',67),(72,3,11,'Dubois','James',60),(73,3,8,'Mousseau','Audric',42),(74,3,10,'D\'Aoust','Maurice',43),(75,3,6,'Bergeron','Laurent',58),(76,4,1,'Ramirez','Maxime',94),(77,4,1,'Nakamura','Mateo',67),(78,4,2,'Lynch','David',34),(79,4,2,'Harris','Leo',77),(80,4,3,'Nicolas','Theo',1),(81,4,3,'Gutierrez','Min-Jun',53),(82,4,4,'Matsui','Jackson',11),(83,4,4,'Saito','Ivan',77),(84,4,5,'Allen','William',88),(85,4,5,'Drake','Vincent',64),(86,4,6,'Watanabe','Wyatt',32),(87,4,6,'Kato','Oliver',3),(88,4,7,'Hill','Hassan',23),(89,4,7,'Cho','Jules',56),(90,4,8,'Lefebvre','Jose',93),(91,4,8,'Suzuki','Sanjay',1),(92,4,9,'Lee','Nathan',61),(93,4,9,'Garcia','Léo',39),(94,4,10,'Nguyen','Asher',75),(95,4,10,'Takahashi','Valentin',98),(96,4,11,'Davis','Aiden',76),(97,4,11,'Ming','Julien',28),(98,4,8,'Martinez','Lucas',25),(99,4,11,'Wu','Mateo',2),(100,4,7,'Miller','Liam',9),(101,5,1,'Vingran','Louis',80),(102,5,1,'Tervin','Maxime',79),(103,5,2,'Novterfier','Gabriel',84),(104,5,2,'Marnov','Maxime',34),(105,5,3,'Malgen','Étienne',76),(106,5,3,'Tertonfier','Étienne',48),(107,5,4,'Gengran','Jules',36),(108,5,4,'Bruvin','Arthur',35),(109,5,5,'Vinver','Étienne',33),(110,5,5,'Novgranbel','Jules',23),(111,5,6,'Bruverton','Alex',99),(112,5,6,'Belmalgran','Théo',44),(113,5,7,'Terfiermal','Jules',96),(114,5,7,'Vergen','Alex',20),(115,5,8,'Ronmal','Théo',55),(116,5,8,'Verfier','Étienne',31),(117,5,9,'Gengranton','Étienne',45),(118,5,9,'Maltongen','Théo',4),(119,5,10,'Fierter','Louis',97),(120,5,10,'Malgran','Gabriel',53),(121,5,11,'Marter','Louis',49),(122,5,11,'Lalonde','Sennet',42),(123,5,1,'Leblanc','Auguste',5),(124,5,8,'Bazinet','Gabriel',5),(125,5,4,'Belmar','Étienne',61),(126,6,1,'Denlanbel','Vincent',99),(127,6,1,'Tondenlan','Jules',79),(128,6,2,'Tonbelter','Maxime',95),(129,6,2,'Dennov','Vincent',38),(130,6,3,'Fiermar','Étienne',71),(131,6,3,'Lanmalnov','Arthur',72),(132,6,4,'Rondenbru','Théo',48),(133,6,4,'Novtergen','Lucas',55),(134,6,5,'Novronton','Louis',58),(135,6,5,'Langran','Théo',97),(136,6,6,'Brutongran','Théo',37),(137,6,6,'Malnovlan','Enzo',72),(138,6,7,'Vinmar','Jules',52),(139,6,7,'Novronbru','Enzo',95),(140,6,8,'Granvinron','Maxime',23),(141,6,8,'Fiermal','Louis',9),(142,6,9,'Landennov','Jules',92),(143,6,9,'Tonmal','Louis',38),(144,6,10,'Malden','Étienne',92),(145,6,10,'Marvin','Théo',8),(146,6,11,'Vernovron','Théo',49),(147,6,11,'Bruter','Lucas',65),(148,6,4,'Genmar','Vincent',18),(149,6,9,'Lanrongen','Étienne',50),(150,6,3,'Ronlanbru','Maxime',73),(151,7,1,'Verdenlan','Alex',8),(152,7,1,'Verlangran','Théo',39),(153,7,2,'Terbel','Jules',34),(154,7,2,'Marterron','Lucas',11),(155,7,3,'Novbelron','Maxime',4),(156,7,3,'Terbellan','Vincent',9),(157,7,4,'Ronfierbru','Louis',18),(158,7,4,'Marbelmal','Arthur',39),(159,7,5,'Genfier','Maxime',73),(160,7,5,'Novgen','Arthur',90),(161,7,6,'Bruterlan','Arthur',17),(162,7,6,'Granter','Théo',95),(163,7,7,'Tonlangran','Enzo',71),(164,7,7,'Ronbru','Maxime',31),(165,7,8,'Brunov','Enzo',71),(166,7,8,'Denter','Lucas',9),(167,7,9,'Fierbru','Lucas',23),(168,7,9,'Verlan','Vincent',12),(169,7,10,'Genver','Lucas',36),(170,7,10,'Termal','Jules',99),(171,7,11,'Brufier','Alex',76),(172,7,11,'Tonbru','Théo',35),(173,7,11,'Vinmarnov','Maxime',88),(174,7,2,'Verden','Théo',63),(175,7,11,'Mallan','Jules',87),(176,8,1,'Genron','Arthur',76),(177,8,1,'Vergran','Enzo',36),(178,8,2,'Tonnovter','Vincent',71),(179,8,2,'Malvinron','Théo',11),(180,8,3,'Granfier','Alex',6),(181,8,3,'Tonbel','Étienne',14),(182,8,4,'Lanbrugen','Enzo',35),(183,8,4,'Vingen','Arthur',20),(184,8,5,'Fiermarden','Théo',32),(185,8,5,'Vernovmar','Lucas',49),(186,8,6,'Denvinbel','Maxime',31),(187,8,6,'Brutonfier','Alex',12),(188,8,7,'Lanbrufier','Jules',91),(189,8,7,'Tergennov','Enzo',4),(190,8,8,'Maldenron','Théo',21),(191,8,8,'Terron','Gabriel',43),(192,8,9,'Ronnovmal','Jules',75),(193,8,9,'Granbel','Alex',62),(194,8,10,'Tonvergen','Étienne',45),(195,8,10,'Vinmalmar','Vincent',21),(196,8,11,'Vindengen','Louis',52),(197,8,11,'Tergen','Enzo',26),(198,8,6,'Marbel','Jules',34),(199,8,8,'Tergengran','Louis',21),(200,8,7,'Lanmal','Arthur',99),(201,9,1,'Margenlan','Enzo',16),(202,9,1,'Tonmalnov','Théo',18),(203,9,2,'Brugran','Louis',76),(204,9,2,'Maltonden','Arthur',14),(205,9,3,'Genfierver','Maxime',13),(206,9,3,'Novgenden','Arthur',36),(207,9,4,'Genmal','Maxime',48),(208,9,4,'Beltergran','Jules',17),(209,9,5,'Malvin','Gabriel',47),(210,9,5,'Landenton','Arthur',79),(211,9,6,'Terverfier','Théo',33),(212,9,6,'Granbru','Jules',61),(213,9,7,'Novlanver','Jules',21),(214,9,7,'Malbrugen','Théo',25),(215,9,8,'Tondenter','Louis',48),(216,9,8,'Belver','Vincent',80),(217,9,9,'Langen','Gabriel',77),(218,9,9,'Vermarnov','Jules',35),(219,9,10,'Lanmarnov','Vincent',61),(220,9,10,'Granton','Louis',87),(221,9,11,'Novton','Étienne',37),(222,9,11,'Belnov','Jules',34),(223,9,3,'Termarbel','Arthur',96),(224,9,6,'Bruron','Arthur',45),(225,9,6,'Langranvin','Lucas',61),(226,10,1,'Ronmalver','Gabriel',51),(227,10,1,'Rontergen','Théo',34),(228,10,2,'Tonnov','Enzo',53),(229,10,2,'Verdengran','Maxime',53),(230,10,3,'Belgenlan','Gabriel',86),(231,10,3,'Tergran','Gabriel',28),(232,10,4,'Genlan','Théo',71),(233,10,4,'Denterlan','Étienne',16),(234,10,5,'Marronfier','Enzo',37),(235,10,5,'Beldenmal','Jules',88),(236,10,6,'Genfierden','Jules',37),(237,10,6,'Denverfier','Étienne',50),(238,10,7,'Bruterver','Lucas',33),(239,10,7,'Denbelfier','Vincent',65),(240,10,8,'Vermar','Louis',75),(241,10,8,'Fierronter','Maxime',96),(242,10,9,'Belronnov','Louis',31),(243,10,9,'Granmal','Vincent',91),(244,10,10,'Lanron','Maxime',52),(245,10,10,'Vinnovton','Maxime',95),(246,10,11,'Brubel','Jules',84),(247,10,11,'Genlanver','Arthur',49),(248,10,1,'Granvinbel','Vincent',49),(249,10,2,'Granver','Gabriel',99),(250,10,9,'Ronbelton','Étienne',71);
/*!40000 ALTER TABLE `joueur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joueur_poste`
--

DROP TABLE IF EXISTS `joueur_poste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `joueur_poste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poste` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joueur_poste`
--

LOCK TABLES `joueur_poste` WRITE;
/*!40000 ALTER TABLE `joueur_poste` DISABLE KEYS */;
INSERT INTO `joueur_poste` VALUES (1,'Gardien de but'),(2,'Défenseur central'),(3,'Arrière gauche'),(4,'Arrière droit'),(5,'Milieu défensif'),(6,'Milieu central'),(7,'Milieu offensif'),(8,'Ailier gauche'),(9,'Ailier droit'),(10,'Attaquant de pointe'),(11,'Second attaquant');
/*!40000 ALTER TABLE `joueur_poste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joueur_selection`
--

DROP TABLE IF EXISTS `joueur_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `joueur_selection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joueur_id` int(11) NOT NULL,
  `joueur_poste_id` int(11) NOT NULL COMMENT 'Poste du joueur pour le match',
  `titulaire` tinyint(1) NOT NULL COMMENT 'false = remplaçant',
  `capitaine` tinyint(1) NOT NULL,
  `suppléant` tinyint(1) NOT NULL COMMENT 'Suppléant du capitaine',
  `numero_joueur_match` int(11) NOT NULL COMMENT 'Numéro du joueur pour le match',
  PRIMARY KEY (`id`),
  KEY `joueur_id` (`joueur_id`),
  KEY `joueur_poste_id` (`joueur_poste_id`),
  CONSTRAINT `joueur_selection_ibfk_2` FOREIGN KEY (`joueur_id`) REFERENCES `joueur` (`id`),
  CONSTRAINT `joueur_selection_ibfk_3` FOREIGN KEY (`joueur_poste_id`) REFERENCES `joueur_poste` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joueur_selection`
--

LOCK TABLES `joueur_selection` WRITE;
/*!40000 ALTER TABLE `joueur_selection` DISABLE KEYS */;
INSERT INTO `joueur_selection` VALUES (1,1,1,0,0,0,39),(2,2,8,1,0,0,42),(3,126,1,1,0,0,24);
/*!40000 ALTER TABLE `joueur_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peparation_match_composition_equipe`
--

DROP TABLE IF EXISTS `peparation_match_composition_equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peparation_match_composition_equipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `composition_equipe_id_domicile` int(11) NOT NULL,
  `composition_equipe_id_exterieur` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `composition_equipe_id_domicile` (`composition_equipe_id_domicile`),
  KEY `composition_equipe_id_exterieur` (`composition_equipe_id_exterieur`),
  CONSTRAINT `peparation_match_composition_equipe_ibfk_1` FOREIGN KEY (`composition_equipe_id_domicile`) REFERENCES `composition_equipe` (`id`),
  CONSTRAINT `peparation_match_composition_equipe_ibfk_2` FOREIGN KEY (`composition_equipe_id_exterieur`) REFERENCES `composition_equipe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peparation_match_composition_equipe`
--

LOCK TABLES `peparation_match_composition_equipe` WRITE;
/*!40000 ALTER TABLE `peparation_match_composition_equipe` DISABLE KEYS */;
INSERT INTO `peparation_match_composition_equipe` VALUES (1,1,2);
/*!40000 ALTER TABLE `peparation_match_composition_equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preparation_match`
--

DROP TABLE IF EXISTS `preparation_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preparation_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peparation_match_composition_equipe_id` int(11) NOT NULL,
  `preparation_match_arbitre_id` int(11) NOT NULL,
  `stade_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `preparation_match_arbitre_id` (`preparation_match_arbitre_id`),
  KEY `stade_id` (`stade_id`),
  KEY `peparation_match_composition_equipe_id` (`peparation_match_composition_equipe_id`),
  CONSTRAINT `preparation_match_ibfk_1` FOREIGN KEY (`preparation_match_arbitre_id`) REFERENCES `preparation_match_arbitre` (`id`),
  CONSTRAINT `preparation_match_ibfk_4` FOREIGN KEY (`stade_id`) REFERENCES `stade` (`id`),
  CONSTRAINT `preparation_match_ibfk_5` FOREIGN KEY (`peparation_match_composition_equipe_id`) REFERENCES `peparation_match_composition_equipe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preparation_match`
--

LOCK TABLES `preparation_match` WRITE;
/*!40000 ALTER TABLE `preparation_match` DISABLE KEYS */;
INSERT INTO `preparation_match` VALUES (1,1,1,1,'2024-04-11 23:47:13');
/*!40000 ALTER TABLE `preparation_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preparation_match_arbitre`
--

DROP TABLE IF EXISTS `preparation_match_arbitre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preparation_match_arbitre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `arbitre_principal` int(11) NOT NULL,
  `arbitre_gauche` int(11) NOT NULL,
  `arbitre_droit` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `arbitre_principal` (`arbitre_principal`),
  KEY `arbitre_gauche` (`arbitre_gauche`),
  KEY `arbitre_droit` (`arbitre_droit`),
  CONSTRAINT `preparation_match_arbitre_ibfk_1` FOREIGN KEY (`arbitre_principal`) REFERENCES `arbitre` (`id`),
  CONSTRAINT `preparation_match_arbitre_ibfk_2` FOREIGN KEY (`arbitre_gauche`) REFERENCES `arbitre` (`id`),
  CONSTRAINT `preparation_match_arbitre_ibfk_3` FOREIGN KEY (`arbitre_droit`) REFERENCES `arbitre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preparation_match_arbitre`
--

LOCK TABLES `preparation_match_arbitre` WRITE;
/*!40000 ALTER TABLE `preparation_match_arbitre` DISABLE KEYS */;
INSERT INTO `preparation_match_arbitre` VALUES (1,1,2,3),(2,3,1,2);
/*!40000 ALTER TABLE `preparation_match_arbitre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remplacement_pendant_match`
--

DROP TABLE IF EXISTS `remplacement_pendant_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remplacement_pendant_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entrant_joueur_id` int(11) NOT NULL,
  `sortant_joueur_id` int(11) NOT NULL,
  `minutes_match` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entrant_joueur_id` (`entrant_joueur_id`),
  KEY `sortant_joueur_id` (`sortant_joueur_id`),
  CONSTRAINT `remplacement_pendant_match_ibfk_1` FOREIGN KEY (`entrant_joueur_id`) REFERENCES `joueur` (`id`),
  CONSTRAINT `remplacement_pendant_match_ibfk_2` FOREIGN KEY (`sortant_joueur_id`) REFERENCES `joueur` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remplacement_pendant_match`
--

LOCK TABLES `remplacement_pendant_match` WRITE;
/*!40000 ALTER TABLE `remplacement_pendant_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `remplacement_pendant_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stade`
--

DROP TABLE IF EXISTS `stade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `pays` varchar(100) NOT NULL,
  `capacite` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stade`
--

LOCK TABLES `stade` WRITE;
/*!40000 ALTER TABLE `stade` DISABLE KEYS */;
INSERT INTO `stade` VALUES (1,'Parc des Princes','24 Rue du Commandant Guilbaud','Paris','France',47929),(2,'Stade Vélodrome','3 Boulevard Michelet','Marseille','France',67394),(3,'Groupama Stadium','10 Avenue Simone Veil','Lyon','France',59186),(4,'Stade Pierre-Mauroy','261 Boulevard de Tournai','Villeneuve-d\'Ascq','France',50186),(5,'Stade Geoffroy-Guichard','14 Rue Paul et Pierre Guichard','Saint-Étienne','France',41965),(6,'Matmut Atlantique','Cours Jules Ladoumegue','Bordeaux','France',42115),(7,'Stade de la Meinau','12 Rue de l\'Extenwoerth','Strasbourg','France',26109),(8,'Stade de la Mosson','345 Avenue de Heidelberg','Montpellier','France',32939),(9,'Stade Louis II','7 Avenue des Castelans','Monaco','France',18523),(10,'Allianz Riviera','Boulevard des Jardiniers','Nice','France',35624);
/*!40000 ALTER TABLE `stade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_but`
--

DROP TABLE IF EXISTS `type_but`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_but` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_but`
--

LOCK TABLES `type_but` WRITE;
/*!40000 ALTER TABLE `type_but` DISABLE KEYS */;
INSERT INTO `type_but` VALUES (1,'standard'),(2,'tête'),(3,'coup-franc'),(4,'penalties');
/*!40000 ALTER TABLE `type_but` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-18 23:29:54
