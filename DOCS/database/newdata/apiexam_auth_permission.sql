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
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add answer',6,'add_answer'),(22,'Can change answer',6,'change_answer'),(23,'Can delete answer',6,'delete_answer'),(24,'Can view answer',6,'view_answer'),(25,'Can add chapter',7,'add_chapter'),(26,'Can change chapter',7,'change_chapter'),(27,'Can delete chapter',7,'delete_chapter'),(28,'Can view chapter',7,'view_chapter'),(29,'Can add department',8,'add_department'),(30,'Can change department',8,'change_department'),(31,'Can delete department',8,'delete_department'),(32,'Can view department',8,'view_department'),(33,'Can add difficulty',9,'add_difficulty'),(34,'Can change difficulty',9,'change_difficulty'),(35,'Can delete difficulty',9,'delete_difficulty'),(36,'Can view difficulty',9,'view_difficulty'),(37,'Can add level',10,'add_level'),(38,'Can change level',10,'change_level'),(39,'Can delete level',10,'delete_level'),(40,'Can view level',10,'view_level'),(41,'Can add person',11,'add_person'),(42,'Can change person',11,'change_person'),(43,'Can delete person',11,'delete_person'),(44,'Can view person',11,'view_person'),(45,'Can add question',12,'add_question'),(46,'Can change question',12,'change_question'),(47,'Can delete question',12,'delete_question'),(48,'Can view question',12,'view_question'),(49,'Can add type',13,'add_type'),(50,'Can change type',13,'change_type'),(51,'Can delete type',13,'delete_type'),(52,'Can view type',13,'view_type'),(53,'Can add student',14,'add_student'),(54,'Can change student',14,'change_student'),(55,'Can delete student',14,'delete_student'),(56,'Can view student',14,'view_student'),(57,'Can add subject',15,'add_subject'),(58,'Can change subject',15,'change_subject'),(59,'Can delete subject',15,'delete_subject'),(60,'Can view subject',15,'view_subject'),(61,'Can add right answer',16,'add_rightanswer'),(62,'Can change right answer',16,'change_rightanswer'),(63,'Can delete right answer',16,'delete_rightanswer'),(64,'Can view right answer',16,'view_rightanswer'),(65,'Can add exam',17,'add_exam'),(66,'Can change exam',17,'change_exam'),(67,'Can delete exam',17,'delete_exam'),(68,'Can view exam',17,'view_exam'),(69,'Can add professor',18,'add_professor'),(70,'Can change professor',18,'change_professor'),(71,'Can delete professor',18,'delete_professor'),(72,'Can view professor',18,'view_professor'),(73,'Can add exam question',19,'add_examquestion'),(74,'Can change exam question',19,'change_examquestion'),(75,'Can delete exam question',19,'delete_examquestion'),(76,'Can view exam question',19,'view_examquestion'),(77,'Can add result',20,'add_result'),(78,'Can change result',20,'change_result'),(79,'Can delete result',20,'delete_result'),(80,'Can view result',20,'view_result'),(81,'Can add group object permission',21,'add_groupobjectpermission'),(82,'Can change group object permission',21,'change_groupobjectpermission'),(83,'Can delete group object permission',21,'delete_groupobjectpermission'),(84,'Can view group object permission',21,'view_groupobjectpermission'),(85,'Can add user object permission',22,'add_userobjectpermission'),(86,'Can change user object permission',22,'change_userobjectpermission'),(87,'Can delete user object permission',22,'delete_userobjectpermission'),(88,'Can view user object permission',22,'view_userobjectpermission'),(89,'Can add user',23,'add_user'),(90,'Can change user',23,'change_user'),(91,'Can delete user',23,'delete_user'),(92,'Can view user',23,'view_user'),(93,'Can add image',24,'add_image'),(94,'Can change image',24,'change_image'),(95,'Can delete image',24,'delete_image'),(96,'Can view image',24,'view_image');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-24 22:11:48
