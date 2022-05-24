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
-- Table structure for table `exam_question`
--

DROP TABLE IF EXISTS `exam_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_question` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `chapter_id` bigint NOT NULL,
  `difficulty_id` bigint NOT NULL,
  `subject_id` bigint NOT NULL,
  `type_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_question_subject_id_fca2fbc9_fk_exam_subject_id` (`subject_id`),
  KEY `exam_question_type_id_26c8613c_fk_exam_type_id` (`type_id`),
  KEY `exam_question_chapter_id_527b99a8_fk_exam_chapter_id` (`chapter_id`),
  KEY `exam_question_difficulty_id_8f3141d9_fk_exam_difficulty_id` (`difficulty_id`),
  CONSTRAINT `exam_question_chapter_id_527b99a8_fk_exam_chapter_id` FOREIGN KEY (`chapter_id`) REFERENCES `exam_chapter` (`id`),
  CONSTRAINT `exam_question_difficulty_id_8f3141d9_fk_exam_difficulty_id` FOREIGN KEY (`difficulty_id`) REFERENCES `exam_difficulty` (`id`),
  CONSTRAINT `exam_question_subject_id_fca2fbc9_fk_exam_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `exam_subject` (`id`),
  CONSTRAINT `exam_question_type_id_26c8613c_fk_exam_type_id` FOREIGN KEY (`type_id`) REFERENCES `exam_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question`
--

LOCK TABLES `exam_question` WRITE;
/*!40000 ALTER TABLE `exam_question` DISABLE KEYS */;
INSERT INTO `exam_question` VALUES (1,'question1 M CH1 TOF',1,1,1,1),(2,'Question2 M CH1 TOF',1,1,1,1),(3,'question3 H CH2 MCQ',2,2,1,2),(4,'question4 H CH2 MCQ',2,2,1,2),(5,'QUESTION5 M CH2 MCQ',2,1,1,2),(6,'QUESTION6 M CH2 MCQ',2,1,1,2),(7,'questin 7 H CH2 MCQ',2,2,1,2),(8,'QUESTION8 M CH1 TOF',1,1,1,1),(9,'quesion test',1,1,2,2),(10,'ANother1',2,2,1,2),(11,'trial',2,2,1,1),(12,'Software is defined as ___________',1,3,5,2),(13,'What is Software Engineering?',1,3,5,2),(14,'Who is the father of Software Engineering?',1,1,5,2),(15,'What are the features of Software Code?',1,1,5,2),(16,'____________ is a software development activity that is not a part of software processes.',1,2,5,2),(17,'Define Agile scrum methodology.',1,2,5,2),(18,'Faster delivery is possible with CBSE.',1,3,5,1),(19,'Software is a product and can be manufactured using the same technologies used for other engineering artifacts.',1,3,5,1),(20,'WebApps are a mixture of print publishing and software development, making their development outside the realm of software engineering practice.',1,1,5,1),(21,'There are no real differences between creating WebApps and Mobile-Apps.',1,1,5,1),(22,'In its simplest form an external computing device may access cloud data services using a web browser.',1,2,5,1),(23,'Product line software development depends the reuse of existing software components to provide software engineering leverage.',1,2,5,1),(24,'When the user participation isn\'t involved, which of the following models will not result in the desired output?',2,3,5,2),(25,'Which of the following falls under the category of software products?',2,3,5,2),(26,'Which one of the following activities is not recommended for software processes in software engineering?',2,1,5,2),(27,'The major drawback of RAD model is __________.',2,1,5,2),(28,'Which of the following models doesn\'t necessitate defining requirements at the earliest in the lifecycle?',2,2,5,2),(29,'Which of the following model will be preferred by a company that is planning to deploy an advanced version of the existing software in the market?',2,2,5,2),(30,'Software engineering umbrella activities are only applied during the initial phases of software development projects.',2,3,5,1),(31,'Planning ahead for software reuse reduces the cost and increases the value of the systems into which they are incorporated.',2,3,5,1),(32,'The essence of software engineering practice might be described as understand the problem, plan a solution, carry out the plan, and examine the result for accuracy.',2,1,5,1),(33,'In agile process models the only deliverable work product is the working program.',2,2,5,1),(34,'A most software development projects are initiated to try to meet some business need',2,1,5,1),(35,'In general software only succeeds if its behavior is consistent with the objectives of its designers.',2,2,5,1),(36,'The following image does not represent waterfall methodology.',3,3,5,1),(37,'The following image represents _________________ methodology.',3,3,5,2);
/*!40000 ALTER TABLE `exam_question` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-24 22:08:28
