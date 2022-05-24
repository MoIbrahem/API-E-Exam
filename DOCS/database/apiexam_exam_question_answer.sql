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
-- Table structure for table `exam_question_answer`
--

DROP TABLE IF EXISTS `exam_question_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_question_answer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question_id` bigint NOT NULL,
  `answer_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_question_answer_question_id_answer_id_254be9e1_uniq` (`question_id`,`answer_id`),
  KEY `exam_question_answer_answer_id_09b9565c_fk_exam_answer_id` (`answer_id`),
  CONSTRAINT `exam_question_answer_answer_id_09b9565c_fk_exam_answer_id` FOREIGN KEY (`answer_id`) REFERENCES `exam_answer` (`id`),
  CONSTRAINT `exam_question_answer_question_id_438f1997_fk_exam_question_id` FOREIGN KEY (`question_id`) REFERENCES `exam_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question_answer`
--

LOCK TABLES `exam_question_answer` WRITE;
/*!40000 ALTER TABLE `exam_question_answer` DISABLE KEYS */;
INSERT INTO `exam_question_answer` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,2),(5,3,3),(6,3,4),(7,3,5),(8,3,6),(9,4,3),(10,4,4),(11,4,5),(12,4,6),(13,5,3),(14,5,4),(15,5,5),(16,5,6),(17,6,3),(18,6,4),(19,6,5),(20,6,6),(21,7,3),(22,7,4),(23,7,5),(24,7,6),(25,8,1),(26,8,2),(27,9,3),(28,9,4),(29,9,5),(30,9,6),(31,10,3),(32,10,4),(33,10,5),(34,10,6),(35,11,1),(36,11,2),(40,12,7),(37,12,8),(38,12,9),(39,12,10),(41,13,11),(42,13,12),(43,13,13),(44,13,14),(48,14,15),(45,14,16),(46,14,17),(47,14,18),(49,15,19),(50,15,20),(51,15,21),(52,15,22),(56,16,23),(53,16,24),(54,16,25),(55,16,26),(57,17,27),(59,17,30),(60,17,31),(61,18,1),(62,18,2),(63,19,1),(64,19,2),(65,20,1),(66,20,2),(67,21,1),(68,21,2),(69,22,1),(70,22,2),(71,23,1),(72,23,2),(73,24,32),(74,24,33),(75,24,34),(76,24,35),(77,25,36),(78,25,37),(79,25,38),(80,25,39),(81,26,40),(82,26,41),(83,26,42),(84,26,43),(85,27,44),(86,27,45),(87,27,46),(88,28,32),(89,28,33),(90,28,34),(91,28,35),(92,29,33),(93,29,34),(94,29,35),(95,29,47),(96,30,1),(97,30,2),(98,31,1),(99,31,2),(100,32,1),(101,32,2),(102,33,1),(103,33,2),(104,34,1),(105,34,2),(106,35,1),(107,35,2),(108,36,1),(109,36,2),(111,37,33),(110,37,48);
/*!40000 ALTER TABLE `exam_question_answer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-24 22:08:32
