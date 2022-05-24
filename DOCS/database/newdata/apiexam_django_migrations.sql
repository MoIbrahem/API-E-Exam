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
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-04-13 09:03:59.532746'),(2,'contenttypes','0002_remove_content_type_name','2022-04-13 09:03:59.802086'),(3,'auth','0001_initial','2022-04-13 09:04:00.351668'),(4,'auth','0002_alter_permission_name_max_length','2022-04-13 09:04:00.458775'),(5,'auth','0003_alter_user_email_max_length','2022-04-13 09:04:00.471801'),(6,'auth','0004_alter_user_username_opts','2022-04-13 09:04:00.482775'),(7,'auth','0005_alter_user_last_login_null','2022-04-13 09:04:00.494774'),(8,'auth','0006_require_contenttypes_0002','2022-04-13 09:04:00.502775'),(9,'auth','0007_alter_validators_add_error_messages','2022-04-13 09:04:00.515777'),(10,'auth','0008_alter_user_username_max_length','2022-04-13 09:04:00.528778'),(11,'auth','0009_alter_user_last_name_max_length','2022-04-13 09:04:00.542774'),(12,'auth','0010_alter_group_name_max_length','2022-04-13 09:04:00.571806'),(13,'auth','0011_update_proxy_permissions','2022-04-13 09:04:00.582776'),(14,'auth','0012_alter_user_first_name_max_length','2022-04-13 09:04:00.594776'),(15,'core','0001_initial','2022-04-13 09:04:01.364131'),(16,'admin','0001_initial','2022-04-13 09:04:01.615354'),(17,'admin','0002_logentry_remove_auto_add','2022-04-13 09:04:01.629357'),(18,'admin','0003_logentry_add_action_flag_choices','2022-04-13 09:04:01.644385'),(19,'exam','0001_initial','2022-04-13 09:04:07.109567'),(20,'exam','0002_level_placed_at_alter_department_levels','2022-04-13 09:04:07.297699'),(21,'exam','0003_alter_examquestion_unique_together','2022-04-13 09:04:07.425571'),(22,'exam','0004_chapter_subject','2022-04-13 09:04:07.546147'),(23,'exam','0005_student_department_student_level','2022-04-13 09:04:07.937572'),(24,'exam','0006_alter_result_student','2022-04-13 09:04:07.964569'),(25,'exam','0007_remove_student_department_student_department_and_more','2022-04-13 09:04:08.170569'),(26,'exam','0008_alter_student_department','2022-04-13 09:04:08.360778'),(27,'exam','0009_alter_professor_subjects','2022-04-13 09:04:08.402770'),(28,'exam','0010_alter_professor_subjects','2022-04-13 09:04:08.443776'),(29,'exam','0011_remove_professor_subjects','2022-04-13 09:04:08.544770'),(30,'exam','0012_professor_subjects','2022-04-13 09:04:08.823855'),(31,'exam','0013_delete_user','2022-04-13 09:04:08.924877'),(32,'guardian','0001_initial','2022-04-13 09:04:10.017296'),(33,'guardian','0002_generic_permissions_index','2022-04-13 09:04:10.107984'),(34,'sessions','0001_initial','2022-04-13 09:04:10.181984'),(35,'exam','0014_alter_examquestion_exam','2022-04-15 03:35:16.259572'),(36,'exam','0015_alter_rightanswer_options','2022-04-23 05:20:53.535377'),(37,'exam','0016_alter_rightanswer_options','2022-04-23 13:42:54.701784'),(38,'core','0002_user_profile_type','2022-04-25 12:43:10.551137'),(39,'exam','0017_image','2022-04-26 09:26:03.543265'),(40,'exam','0018_remove_image_person_image_student','2022-04-26 09:41:02.898398'),(41,'exam','0019_alter_image_question','2022-04-26 10:16:56.082453'),(42,'exam','0020_alter_image_image','2022-04-26 10:28:10.758330'),(43,'exam','0021_remove_image_student','2022-04-26 12:02:33.253360'),(44,'exam','0022_result_score_result_total','2022-04-28 09:10:20.019761'),(45,'exam','0023_student_score','2022-04-28 11:41:35.694418'),(46,'exam','0024_remove_student_score','2022-04-28 11:56:30.956301'),(47,'exam','0025_student_score','2022-04-28 12:01:44.187589'),(48,'exam','0026_alter_student_score','2022-04-28 12:31:19.480676'),(49,'exam','0027_remove_chapter_subject_chapter_subject','2022-05-05 04:14:22.625972'),(50,'exam','0028_alter_chapter_subject','2022-05-05 04:14:22.666953'),(51,'exam','0029_remove_chapter_subject_subject_chapters','2022-05-05 04:18:43.020897'),(52,'exam','0030_remove_subject_chapters_chapter_subject','2022-05-05 04:22:22.063992'),(53,'exam','0031_remove_chapter_subject_chapter_subject','2022-05-05 04:23:56.050133'),(54,'exam','0032_remove_chapter_subject_chapter_subject','2022-05-05 04:32:15.416018'),(55,'exam','0033_alter_chapter_subject','2022-05-05 04:48:18.143725'),(56,'exam','0034_remove_chapter_subject_subject_chapters','2022-05-05 04:53:58.121815'),(57,'exam','0035_alter_student_score','2022-05-06 22:05:30.226031'),(58,'exam','0036_alter_student_score','2022-05-06 22:29:05.135495'),(59,'exam','0037_type_inputtype','2022-05-20 08:11:10.603056'),(60,'exam','0038_alter_answer_title_alter_chapter_title_and_more','2022-05-24 02:20:34.239101'),(61,'exam','0039_alter_answer_title','2022-05-24 19:39:45.138200'),(62,'exam','0040_alter_rightanswer_questions','2022-05-24 19:39:45.466416');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-24 22:11:46
