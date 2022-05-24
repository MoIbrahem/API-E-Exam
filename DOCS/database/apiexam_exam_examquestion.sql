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
-- Table structure for table `exam_examquestion`
--

DROP TABLE IF EXISTS `exam_examquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_examquestion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `chapter_id` bigint NOT NULL,
  `difficulty_id` bigint NOT NULL,
  `exam_id` bigint NOT NULL,
  `type_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_examquestion_exam_id_chapter_id_diffi_40412abf_uniq` (`exam_id`,`chapter_id`,`difficulty_id`,`type_id`),
  KEY `exam_examquestion_chapter_id_90f6367d_fk_exam_chapter_id` (`chapter_id`),
  KEY `exam_examquestion_difficulty_id_fd29d3f9_fk_exam_difficulty_id` (`difficulty_id`),
  KEY `exam_examquestion_type_id_2b56f272_fk_exam_type_id` (`type_id`),
  KEY `exam_examquestion_exam_id_ed3d9b47` (`exam_id`),
  CONSTRAINT `exam_examquestion_chapter_id_90f6367d_fk_exam_chapter_id` FOREIGN KEY (`chapter_id`) REFERENCES `exam_chapter` (`id`),
  CONSTRAINT `exam_examquestion_difficulty_id_fd29d3f9_fk_exam_difficulty_id` FOREIGN KEY (`difficulty_id`) REFERENCES `exam_difficulty` (`id`),
  CONSTRAINT `exam_examquestion_exam_id_ed3d9b47_fk_exam_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam_exam` (`id`),
  CONSTRAINT `exam_examquestion_type_id_2b56f272_fk_exam_type_id` FOREIGN KEY (`type_id`) REFERENCES `exam_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_examquestion`
--

LOCK TABLES `exam_examquestion` WRITE;
/*!40000 ALTER TABLE `exam_examquestion` DISABLE KEYS */;
INSERT INTO `exam_examquestion` VALUES (2,10,1,1,2,1),(3,1,1,1,3,2),(4,2,1,3,4,1),(5,11,1,1,5,1),(7,5,1,1,6,1),(10,5,2,2,1,2),(11,5,1,1,1,1),(12,5,1,2,8,2),(13,1,1,3,9,2),(14,1,1,2,9,2),(15,1,1,1,9,2),(16,1,1,3,9,1),(17,1,1,2,9,1),(18,1,1,1,9,1),(19,1,2,3,9,2),(20,1,2,2,9,2),(21,1,3,3,9,2),(22,1,3,3,9,1);
/*!40000 ALTER TABLE `exam_examquestion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-24 22:08:25
