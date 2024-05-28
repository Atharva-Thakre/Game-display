-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: stp
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `devs`
--

DROP TABLE IF EXISTS `devs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devs` (
  `DevId` int NOT NULL AUTO_INCREMENT,
  `Devname` varchar(255) NOT NULL,
  PRIMARY KEY (`DevId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devs`
--

LOCK TABLES `devs` WRITE;
/*!40000 ALTER TABLE `devs` DISABLE KEYS */;
INSERT INTO `devs` VALUES (1,'landmass studios'),(2,'shatterbone studios'),(3,'TAP studios'),(4,'HJH studios');
/*!40000 ALTER TABLE `devs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g_lib`
--

DROP TABLE IF EXISTS `g_lib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `g_lib` (
  `Uid` double DEFAULT NULL,
  `Gid` double DEFAULT NULL,
  KEY `Uid` (`Uid`),
  KEY `Gid` (`Gid`),
  CONSTRAINT `g_lib_ibfk_1` FOREIGN KEY (`Uid`) REFERENCES `user` (`Uid`),
  CONSTRAINT `g_lib_ibfk_2` FOREIGN KEY (`Gid`) REFERENCES `games` (`Gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g_lib`
--

LOCK TABLES `g_lib` WRITE;
/*!40000 ALTER TABLE `g_lib` DISABLE KEYS */;
INSERT INTO `g_lib` VALUES (197,282),(197,423),(197,472),(197,680),(197,522),(197,910),(197,193),(197,552),(197,401),(197,720),(790,282),(790,423),(790,472),(790,680),(790,522),(790,910),(790,193),(790,552),(790,401),(790,720),(613,282),(613,423),(613,472),(613,680),(613,522),(613,910),(613,193),(613,552),(613,401),(613,720),(197,282),(197,423),(197,472),(197,680),(197,522),(197,910),(197,193),(197,552),(197,401),(197,720),(790,282),(790,423),(790,472),(790,680),(790,522),(790,910),(790,193),(790,552),(790,401),(790,720),(613,282),(613,423),(613,472),(613,680),(613,522),(613,910),(613,193),(613,552),(613,401),(613,720);
/*!40000 ALTER TABLE `g_lib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `Gid` double NOT NULL,
  `Gname` varchar(255) NOT NULL,
  `pubId` int DEFAULT NULL,
  `DevId` int DEFAULT NULL,
  `platform` enum('Windows','Linux','PS','Xbox') NOT NULL,
  PRIMARY KEY (`Gid`),
  KEY `pubId` (`pubId`),
  KEY `DevId` (`DevId`),
  KEY `platform` (`platform`),
  CONSTRAINT `games_ibfk_1` FOREIGN KEY (`pubId`) REFERENCES `pubs` (`pubId`),
  CONSTRAINT `games_ibfk_2` FOREIGN KEY (`DevId`) REFERENCES `devs` (`DevId`),
  CONSTRAINT `games_ibfk_3` FOREIGN KEY (`platform`) REFERENCES `pla` (`platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (193,'Lamb of peace',1,2,'PS'),(282,'park Sim',2,4,'Windows'),(401,'Lamb of peace',1,2,'Xbox'),(423,'Hyper F',3,3,'Windows'),(472,'Lamb of peace',1,2,'Windows'),(522,'Lamb of peace',1,2,'Linux'),(552,'R9',4,1,'PS'),(680,'R9',4,1,'Windows'),(720,'R9',4,1,'Xbox'),(910,'park Sim',2,4,'Linux');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pla`
--

DROP TABLE IF EXISTS `pla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pla` (
  `platform` enum('Windows','Linux','PS','Xbox') NOT NULL,
  PRIMARY KEY (`platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pla`
--

LOCK TABLES `pla` WRITE;
/*!40000 ALTER TABLE `pla` DISABLE KEYS */;
INSERT INTO `pla` VALUES ('Windows'),('Linux'),('PS'),('Xbox');
/*!40000 ALTER TABLE `pla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pubs`
--

DROP TABLE IF EXISTS `pubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pubs` (
  `pubId` int NOT NULL AUTO_INCREMENT,
  `Pubname` varchar(255) NOT NULL,
  PRIMARY KEY (`pubId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pubs`
--

LOCK TABLES `pubs` WRITE;
/*!40000 ALTER TABLE `pubs` DISABLE KEYS */;
INSERT INTO `pubs` VALUES (1,'CZInter'),(2,'AEGIS'),(3,'TAP'),(4,'Legenda');
/*!40000 ALTER TABLE `pubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `Uid` double NOT NULL,
  `Uname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `U_pawd` varchar(255) NOT NULL,
  PRIMARY KEY (`Uid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (197,'Finks','finkss@mail.mail','admIN223'),(613,'Doc','spwnpeek@mail.mail','spwnpeek123'),(790,'Mozzy','Mozz@mail.mail','Mo_11');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'stp'
--
/*!50003 DROP PROCEDURE IF EXISTS `Populate_Gid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Populate_Gid`(IN uid_val DOUBLE)
BEGIN
    DECLARE gid_val DOUBLE;
    DECLARE done INT DEFAULT FALSE;
    DECLARE inner_cur CURSOR FOR SELECT Gid FROM Games; 
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN inner_cur;
    read_gid_loop: LOOP
        FETCH inner_cur INTO gid_val;
        IF done THEN
            LEAVE read_gid_loop;
        END IF;
        INSERT INTO G_lib (Uid, Gid) VALUES (uid_val, gid_val);
    END LOOP read_gid_loop;
    CLOSE inner_cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Populate_Uid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Populate_Uid`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE uid_val DOUBLE;
    DECLARE cur CURSOR FOR SELECT DISTINCT Uid FROM user; -- Select distinct Uids
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_uid_loop: LOOP
        FETCH cur INTO uid_val;
        IF done THEN
            LEAVE read_uid_loop;
        END IF;

        -- Call the Gid procedure for the current Uid
        CALL Populate_Gid(uid_val);
    END LOOP read_uid_loop;
    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pop_G_lib` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pop_G_lib`()
begin
	declare done int default false;
    declare Uid_val , Gid_val double;
    declare cur cursor for select Uid,Gid from user join Games;
    declare continue handler for not found set done = true;
    
    open cur;
    read_loop: loop
		fetch cur into Uid_val , Gid_val;
        if done then 
			leave read_loop;
		end if;
			Insert into G_lib(Uid,Gid) Values (Uid_val,Gid_val);
	end loop;
    close cur;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-28 13:22:18
