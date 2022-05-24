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
-- Table structure for table `exam_rightanswer_answers`
--

DROP TABLE IF EXISTS `exam_rightanswer_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_rightanswer_answers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rightanswer_id` bigint NOT NULL,
  `answer_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_rightanswer_answers_rightanswer_id_answer_id_faa0da0a_uniq` (`rightanswer_id`,`answer_id`),
  KEY `exam_rightanswer_answers_answer_id_0b61919a_fk_exam_answer_id` (`answer_id`),
  CONSTRAINT `exam_rightanswer_ans_rightanswer_id_dbcbe099_fk_exam_righ` FOREIGN KEY (`rightanswer_id`) REFERENCES `exam_rightanswer` (`id`),
  CONSTRAINT `exam_rightanswer_answers_answer_id_0b61919a_fk_exam_answer_id` FOREIGN KEY (`answer_id`) REFERENCES `exam_answer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_rightanswer_answers`
--

LOCK TABLES `exam_rightanswer_answers` WRITE;
/*!40000 ALTER TABLE `exam_rightanswer_answers` DISABLE KEYS */;
INSERT INTO `exam_rightanswer_answers` VALUES (1,1,1),(2,2,2),(3,3,3),(10,3,4),(11,3,5),(4,4,5),(5,5,3),(6,6,3),(7,7,3),(8,8,1),(9,9,3),(12,10,3),(13,10,4),(14,11,1),(15,12,7),(16,13,13),(17,14,16),(18,15,21),(19,16,26),(20,17,27),(21,18,1),(22,19,2),(23,20,2),(24,21,2),(25,22,1),(26,23,1),(27,24,32),(28,24,34),(29,25,37),(30,25,39),(31,26,40),(32,26,41),(33,27,44),(34,27,46),(35,28,32),(36,28,35),(37,29,34),(38,29,47),(39,30,2),(40,31,1),(41,32,1),(42,33,2),(43,34,1),(44,35,2),(45,36,2),(46,37,48);
/*!40000 ALTER TABLE `exam_rightanswer_answers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-24 22:11:51
