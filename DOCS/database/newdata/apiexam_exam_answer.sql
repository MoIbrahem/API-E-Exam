-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: apiexam
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `exam_answer`
--

DROP TABLE IF EXISTS `exam_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_answer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_answer_title_af65f2a7_uniq` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_answer`
--

LOCK TABLES `exam_answer` WRITE;
/*!40000 ALTER TABLE `exam_answer` DISABLE KEYS */;
INSERT INTO `exam_answer` VALUES (20,'Accessibility'),(48,'Agile'),(17,'Alan Turing'),(22,'All of the above'),(13,'Application of engineering principles to the design a software'),(18,'Boris Beizer'),(38,'CAD'),(3,'choice1'),(4,'choice2'),(5,'choice3'),(6,'choice4'),(37,'Customized'),(26,'Dependence'),(11,'Designing a software'),(25,'Development'),(9,'documentation and configuration of data'),(36,'Embedded'),(2,'False'),(39,'Generic'),(46,'It increases the component reusability.'),(45,'It necessitates customer feedbacks.'),(44,'It requires highly skilled developers/designers.'),(47,'Iterative Enhancement'),(15,'Margaret Hamilton'),(21,'Modularity'),(14,'None of the above'),(10,'None of the mentioned'),(27,'project management that emphasizes incremental progress'),(30,'project management that emphasizes neutral progress'),(31,'project management that emphasizes no progress'),(32,'Prototyping'),(34,'RAD'),(8,'set of programs'),(7,'set of programs, documentation & configuration of data'),(19,'Simplicity'),(42,'Software Evolution'),(40,'Software Testing'),(41,'Software Validation'),(43,'Software Verification'),(24,'Specification'),(35,'Spiral'),(12,'Testing a software'),(1,'True'),(23,'Validation'),(33,'Waterfall'),(16,'Watts S. Humphrey');
/*!40000 ALTER TABLE `exam_answer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-24 22:11:52
