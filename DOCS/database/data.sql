-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: apiexam
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'professors');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,21),(2,1,22),(3,1,23),(4,1,24),(5,1,25),(6,1,26),(7,1,27),(8,1,28),(31,1,36),(9,1,45),(10,1,46),(11,1,47),(12,1,48),(13,1,52),(14,1,56),(15,1,61),(16,1,62),(17,1,63),(18,1,64),(19,1,65),(20,1,66),(21,1,68),(22,1,73),(23,1,74),(24,1,75),(25,1,76),(26,1,80),(27,1,93),(28,1,94),(29,1,95),(30,1,96);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `core_user`
--

DROP TABLE IF EXISTS `core_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `profile_type` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user`
--

LOCK TABLES `core_user` WRITE;
/*!40000 ALTER TABLE `core_user` DISABLE KEYS */;
INSERT INTO `core_user` VALUES (2,'pbkdf2_sha256$320000$XMd7ykKZBpyqGp4T7sobAS$S8JMCr6ivKHPK4RsWkHLOlLVt9oYNM6NKaL68CtJI5k=','2022-05-24 14:08:15.662864',1,'admin','','',1,1,'2022-04-13 09:04:53.508358','admin@mail.com',NULL),(3,'pbkdf2_sha256$320000$wWMwAUcfcxyJkgWQascQYS$tbzr8J0llhql5KoOgydavtamD5GQLfNz/JuruOZMitw=',NULL,0,'newuser','new2','user1',0,1,'2022-04-14 03:53:13.704205','newus11er@mail.com',NULL),(4,'pbkdf2_sha256$320000$WE5Jbj9JoXClKGZd3ohYRw$csZOReZU6tBp8XXFJYxCYFCcI4iTE/GMPKuNGPM2Z34=','2022-04-21 13:59:12.844348',0,'prof1','professor','math',1,1,'2022-04-21 13:52:17.000000','prof@mail.com',NULL),(6,'pbkdf2_sha256$320000$4fQkniOvBSiHhIXizbkVHk$TsHCjSc4L9EwTPDTxnTn479XlRgz2evgFfYRgB/Vv1M=',NULL,0,'newestuser','newest','user',0,1,'2022-04-25 11:44:48.463282','newestuser@mail.com',NULL),(21,'pbkdf2_sha256$320000$Anm1aRawEzXYN5wT4eOocA$R8ofTnu3OtlL2toORaJLiTr5vFuhg/sF9FY75uDH/sA=',NULL,0,'newuser2','new','user2',0,1,'2022-04-28 09:41:20.231084','newuser2@mail.com','STD'),(33,'pbkdf2_sha256$320000$xhJlhF5b3LSXexDOH2FApy$R5+78QsxF4gTpMMRs/pMYfcpcje/Y0n4fvbVTK1pOzc=',NULL,0,'m1','m1','m1',0,1,'2022-05-06 22:05:58.266485','m1@mail.com','STD'),(35,'pbkdf2_sha256$320000$Fhp7vbQNj6iWF2EwQomCjq$FO3SkNahZpaYZKmwLe5qDseAE4JjyTR6uyWjtrdTRaY=',NULL,0,'m2','m2','m3',0,1,'2022-05-06 22:11:09.146566','m2@mail.com','STD'),(38,'pbkdf2_sha256$320000$pYvbJOkKOmmp2OTWUUbf41$Qto5s+hXFl/wLViYgCmBP3OMdd254wpwnwZQAq+p5xI=','2022-05-21 07:40:24.365731',0,'moibrahem','Mohamed','Ibrahem',0,1,'2022-05-07 03:42:36.327630','mh18399@gmail.com','STD'),(39,'pbkdf2_sha256$320000$iWgv9ae0poLwqDAqGfksUe$KByw+LBwI2d3He031+vrRcDMZ306UOwDDDkE5k2WMu0=',NULL,0,'moibrahem1','Mohamed','Ibrahem',0,1,'2022-05-07 03:49:26.083289','mh1839901@gmail.com','STD'),(40,'pbkdf2_sha256$320000$Iddu0zLVdEmxS0X1GizIeZ$XHuwQ+Phw8Eeg//efSxYbzdFK4hmfDPqj/M0RfWJgE4=',NULL,0,'mo2','momo','toto',0,1,'2022-05-07 05:43:19.480779','mail@mail.com','STD'),(41,'pbkdf2_sha256$320000$NnjzuDqpO0NAI6UhBtWVap$cDgJMgAVM9YR9Yz+LpS83i6UWp+k1vx2Hys33MrI9hU=',NULL,0,'username1','firstname','lastname',0,1,'2022-05-09 18:00:24.177846','mai522222l@mail.com','STD'),(42,'pbkdf2_sha256$320000$9W8sk9m9Auylrh4wHP6Hom$dNQAAeJ8HHHU0nohs/15qtTWpyaqXFzyXWxxxmx17O8=',NULL,0,'m455','m4','m5',0,1,'2022-05-09 18:09:27.482269','m4545@mail.com','STD'),(43,'pbkdf2_sha256$320000$1xhtnUljwY5s6TxeA2A33I$ekYwRCXZiLYEzfDOZktaQBJ1YC1kTVDKc9PRQTGyDNE=',NULL,0,'newuser123222','memo','meme',0,1,'2022-05-10 03:17:31.072305','mail1225533@mail.com','STD'),(44,'pbkdf2_sha256$320000$AXPgRg3KhrAwfUJr4xkZCy$kVqEtg9HJDHMlOoF0yzkbSiBEqgy3pcdw2pYfdrL8ks=',NULL,0,'newestaaaaaa','vbnm,.','asda',0,1,'2022-05-16 00:20:16.146016','mdasmdasdma@mail.com','STD'),(45,'pbkdf2_sha256$320000$6A0Ew7XfFCI5yPSs1icDIe$w/tmXDjrvOBQ2g95cTCA7bYHchhMQ52m3wXqjMSCk5E=',NULL,0,'asdsadada','agdahshds','dadadsd',0,1,'2022-05-16 00:33:35.675851','dasdada@mail.com','STD'),(46,'pbkdf2_sha256$320000$YvpKINjHWcV3nRV9KoSJ8R$zEoek5QrWEPr86R1J8GCMEag8Qx3tySC7eKuiRGAO28=',NULL,0,'dghhhjbbnm','adsdasd','sddad',0,1,'2022-05-16 00:50:37.814802','sadsad@mail.com','STD'),(47,'pbkdf2_sha256$320000$wI1nU49fdSdqntMEjOzzwG$pb584glTQLC+pfUzqhCuhi66Tf3J67Fjf6/J4fMsibg=',NULL,0,'adsadadwq555','dsadkkk','sda',0,1,'2022-05-16 00:59:36.468262','weqnfmenf@mail.co','STD'),(48,'pbkdf2_sha256$320000$pJki7V8mzvaFlEgkp2n9td$2pYbRrAG2cEwHv3Us7Ns326R8TcErtdIrQFfjXUgkFo=',NULL,0,'trialaaaal','sadadaq','dsadasdad',0,1,'2022-05-16 01:11:20.764582','asndnasdn@mail.com','STD'),(49,'pbkdf2_sha256$320000$GRsOhKlj9nxa1a9QwXstHF$XL8h01ZFx5aOfTm69JTBLV9lCbUhQBJfwW9ES6/+sz0=',NULL,0,'dasdnasnmdnm','asdada','asdada',0,1,'2022-05-16 01:26:04.848349','sadaas@mail.comss','STD'),(50,'pbkdf2_sha256$320000$QQ2Mxm2eaLwyNLPgEQuPmj$7zL1+h6hFlHx/tHp7H/K7TWVAJWgwkg+m14ObJf3bD0=',NULL,0,'dadadasduuue','adadfdsf','asdada',0,1,'2022-05-16 01:54:59.824472','asdsda@kk.com','STD'),(51,'pbkdf2_sha256$320000$rFLt6nf0DwnyonEYET43oE$W9joPa46VjbPDt7pxEoaMd//YM4R2KvcQsVsRpF+nY4=',NULL,0,'momomo222','momomo','moooa',0,1,'2022-05-16 02:04:55.957032','momomo@momo.comm','STD'),(52,'pbkdf2_sha256$320000$SWbSH1S6IXTSqhryl5wJTj$u0wt3sLd8q/gMKYZdb+77a2n6+EcspzL8v1Ow76yRbc=',NULL,0,'trioooo','trioo','trioo',0,1,'2022-05-16 02:15:00.946851','triooo@trioo.com','STD'),(53,'pbkdf2_sha256$320000$sC3uTILtpdBpqRndwxY0uX$vfdoInPb3IiNb2BxWF8CaF76ZOh0w2ehSOkQ3unbocg=',NULL,0,'ttottotoot','sad','ad',0,1,'2022-05-16 02:41:26.165651','toooo@rer.com','STD'),(54,'pbkdf2_sha256$320000$MhUr4vRZZ5ic5earjWgAre$7swFJPwoTwUw24gr4YmiGvWSjrW3k1Bwnl+26rgpF2Y=',NULL,0,'newesttrial55','adas','ada',0,1,'2022-05-16 02:44:54.753521','nnnnn@sss.com','STD'),(55,'pbkdf2_sha256$320000$t7rBdkR30JTlc9P9mOM9Uj$6cneZGrYd4x2Cj2AgzSklTFWdCsvCyMb50W3QKyI43U=',NULL,0,'trialaaaal4549444','adsd','adad',0,1,'2022-05-16 02:46:45.854941','nnnn@maadsadasil.com','STD'),(56,'pbkdf2_sha256$320000$5acSprexrYuE5joKtcoGLP$oCPM7+GOgFt60BEoAMwHIyZzU9UFFbDbrycMR8B8Mk4=',NULL,0,'trialaaaal22220','ads','adas',0,1,'2022-05-16 02:52:30.474395','sdasd@afad.df','STD'),(57,'pbkdf2_sha256$320000$jseI5qXyYUF5g2jcrVhXdq$E/xQFbcC0NLNxcqigmJcz4jCOlL/m0/MAZj6X0hIa5Y=',NULL,0,'trioooo22200','assaasww','sad',0,1,'2022-05-16 02:54:54.330922','rtrr@ddd.ff','STD'),(58,'pbkdf2_sha256$320000$qINhRnneFHi6CmMIsVdLx5$7mfU3TaxAQICeLKDAkvfKkx8b5w5py9M5OUjgC8yhEI=',NULL,0,'jbklnj','cvgbhj','cvbnm,',0,1,'2022-05-16 03:14:19.112464','wertyuio@mm.ll','STD'),(59,'pbkdf2_sha256$320000$PAyBRlm3HGZYA9fcxT3gUT$dCmPmFamQHEhOTDqEnc7SJnYUJdOOrOGY6TQ5hD1ZCo=',NULL,0,'dddddddddaa','fsf','adadw',0,1,'2022-05-16 03:17:11.536869','add@kk.dd','STD'),(60,'pbkdf2_sha256$320000$PYwmZlOpvHiQuTiZyHwFbm$aJxIjNMGhOcrbRniiiZbqJaCgOB42zeXVVGnmlO+u2M=',NULL,0,'cassdihdj','aa','ww',0,1,'2022-05-16 03:22:10.470479','sdas@dd.com','STD'),(61,'pbkdf2_sha256$320000$9Jhvl03ZSIcSDoAxLLJPqq$yO02S9QyRQGocivRm7cKGMMNzaJv32QkcF+YHjIYjok=',NULL,0,'newestentry1101','das','qre',0,1,'2022-05-16 03:33:14.260791','das@dds.fdsa','STD'),(62,'pbkdf2_sha256$320000$u7abRsA9aO0NL8cGCPndJH$uR/AvLhdjbUChTwAsonZsDBMd9jTAV7yLBbMt8QlpG0=',NULL,0,'newestuser123','asdd','www',0,1,'2022-05-16 04:16:55.371314','asd@sda.sa','STD'),(63,'pbkdf2_sha256$320000$5dQi07BRuefVQ1nIe9Mgob$goPzFGzzLfuyCdk06jJCYAK9Yr9Qa6OK0Yq/n5JtgVQ=',NULL,0,'asdad122','sdad','asdd',0,1,'2022-05-16 04:19:06.609274','sadad@rtyuio.ghjkl','STD'),(64,'pbkdf2_sha256$320000$XMwPeNxKnhPnFmvYRQu2hn$gXDUXAACGDbNc8/5Igsphoh3aJTFh36NxuGqcQUXjrQ=',NULL,0,'adsfasd','adda','wdq',0,1,'2022-05-16 04:22:34.954801','adsadsda@maa.ss','STD'),(65,'pbkdf2_sha256$320000$0zXTRbeXgMuYTQeFZna5oh$xUN0L4vBa0leZbnToiRZUYB0XSb+pM76A6Wmp3ltHeY=',NULL,0,'adaasdq','dsaqwd','dad',0,1,'2022-05-16 04:25:32.020449','cxcxcsawq@dsa.caa','STD'),(66,'pbkdf2_sha256$320000$Q8otUet8njdbunaEAMME1w$SvkVxv8FQu3s5HgckObHdyWFaqaPGDnzoFts09TQIb0=',NULL,0,'adsadasd','adsd','gfg',0,1,'2022-05-16 04:27:47.324100','sdad@afsf.fds','STD'),(67,'pbkdf2_sha256$320000$snUyvYqmnmYiHinrx07nmU$MJw7OjL9IfZu82h+s/PMJqrpr+lxo7auYfNQAqDfvBk=',NULL,0,'sdasdaaaa','adadw','adsdw',0,1,'2022-05-16 04:33:16.436610','adsad@dasdsa.cssa','STD'),(68,'pbkdf2_sha256$320000$cH62DqVkObKAxQvctWTcpH$M+SMTf9snBX9lJpM4IQrhQZklK/Z/RfL/7pgXpBOG5k=',NULL,0,'adsadaadsww','ads','kjnio',0,1,'2022-05-16 04:34:46.908616','adsada@dadsadw.com','STD'),(69,'pbkdf2_sha256$320000$UKmOwl79hhP2FP2Hzw5176$rj8VbiiCx4EQFgnb+nWU2q/Ilc+tGLFJtMa4d337VgI=',NULL,0,'adqwdmm','adwj','kljjh',0,1,'2022-05-16 04:36:17.870445','dadsdw@sdda.hjkl','STD'),(70,'pbkdf2_sha256$320000$noXpD26oClJYVfJQgxuGdY$3/U1N4apN7FMRp6MTTRVuqY02Brfkx62zqVtSnpuCi8=',NULL,0,'dadashui','yuio','tyuio',0,1,'2022-05-16 04:38:33.997889','hjgjk@dew.iop','STD'),(71,'pbkdf2_sha256$320000$nrWyETfD3FXKlGo1ZwvT51$aZDrH+j9e5JeByTuQOYxpo5kllbFiMkotnMOxnOsE6g=',NULL,0,'jjhkjkh','sadih','iiuoui',0,1,'2022-05-16 04:40:06.825519','jkljkljl@jkjf.ouio','STD'),(72,'pbkdf2_sha256$320000$hTYapxTTC2EsYjuG86VydU$uEfov6P1w9AnkAEEjaVCAJdNtcE4THv9HUFoqAES4yc=',NULL,0,'prof5','prof','5s',1,1,'2022-05-21 03:08:55.000000','prof5@nn.ddd','PRF'),(73,'pbkdf2_sha256$320000$eNZXeUSX2bAu5dVELjTjwb$mYud3zNiGWhuVXSzOpyC2NJqVk2wtxLBdCpW6zcE5vM=',NULL,0,'prof6','prof','6s',0,1,'2022-05-21 06:54:45.274982','ad@sads.com','PRF'),(74,'pbkdf2_sha256$320000$yWSjlArCleqTqjHiA154nn$fuxDLBzUeS7OtfhGgqVfJepC3yPKMWYi7+wFpaolIss=',NULL,0,'prof7','prof','7',0,1,'2022-05-21 06:57:18.176997','czcxz@dfs.fdsfdf','PRF'),(75,'pbkdf2_sha256$320000$9LbwyU27lJG6XLV1E9zUIo$+egciV31wE/JmQTYwtEJ0GWcv0BTXfXdN27n8WzhDjQ=','2022-05-24 14:09:46.529681',0,'prof10','prof','10',1,1,'2022-05-24 01:59:24.000000','prof100000@mail.com','PRF'),(76,'!6Sg5MtoJIlTT98OvrGO0DJwHD8OAwT6RNnDayAlw',NULL,0,'AnonymousUser','','',0,1,'2022-05-24 03:09:50.238708','',NULL);
/*!40000 ALTER TABLE `core_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_groups`
--

DROP TABLE IF EXISTS `core_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_user_groups_user_id_group_id_c82fcad1_uniq` (`user_id`,`group_id`),
  KEY `core_user_groups_group_id_fe8c697f_fk_auth_group_id` (`group_id`),
  CONSTRAINT `core_user_groups_group_id_fe8c697f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `core_user_groups_user_id_70b4d9b8_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_groups`
--

LOCK TABLES `core_user_groups` WRITE;
/*!40000 ALTER TABLE `core_user_groups` DISABLE KEYS */;
INSERT INTO `core_user_groups` VALUES (1,75,1);
/*!40000 ALTER TABLE `core_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_user_permissions`
--

DROP TABLE IF EXISTS `core_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_user_user_permissions_user_id_permission_id_73ea0daa_uniq` (`user_id`,`permission_id`),
  KEY `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` (`permission_id`),
  CONSTRAINT `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `core_user_user_permissions_user_id_085123d3_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_user_permissions`
--

LOCK TABLES `core_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `core_user_user_permissions` DISABLE KEYS */;
INSERT INTO `core_user_user_permissions` VALUES (5,4,21),(16,4,24),(6,4,25),(2,4,33),(4,4,45),(14,4,46),(15,4,48),(7,4,61),(1,4,65),(8,4,66),(9,4,67),(10,4,68),(3,4,73),(11,4,74),(12,4,75),(13,4,76);
/*!40000 ALTER TABLE `core_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_core_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-04-13 09:14:27.874031','1','one',1,'[{\"added\": {}}]',10,2),(2,'2022-04-13 09:14:44.897975','1','SE',1,'[{\"added\": {}}]',8,2),(3,'2022-04-13 09:14:48.237727','1','math1',1,'[{\"added\": {}}]',15,2),(4,'2022-04-14 04:51:53.863236','1','new user',1,'[{\"added\": {}}]',14,2),(5,'2022-04-14 21:48:03.717227','2','database',1,'[{\"added\": {}}]',15,2),(6,'2022-04-14 21:48:37.658851','2','two',1,'[{\"added\": {}}]',10,2),(7,'2022-04-14 21:48:43.383926','3','data structire',1,'[{\"added\": {}}]',15,2),(8,'2022-04-14 21:49:31.613144','2','CS',1,'[{\"added\": {}}]',8,2),(9,'2022-04-14 21:49:42.824915','4','C#',1,'[{\"added\": {}}]',15,2),(10,'2022-04-14 21:50:35.428826','1','ONE',1,'[{\"added\": {}}]',7,2),(11,'2022-04-14 21:50:42.752538','1','M',1,'[{\"added\": {}}]',9,2),(12,'2022-04-14 21:50:50.803714','1','TOF',1,'[{\"added\": {}}]',13,2),(13,'2022-04-14 21:51:14.606701','1','EXAM1',1,'[{\"added\": {}}, {\"added\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (1)\"}}]',17,2),(14,'2022-04-14 21:51:49.625476','2','EXAM2',1,'[{\"added\": {}}, {\"added\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (2)\"}}]',17,2),(15,'2022-04-14 21:52:39.042901','3','exam3',1,'[{\"added\": {}}, {\"added\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (3)\"}}]',17,2),(16,'2022-04-14 21:53:33.993858','4','Exam4',1,'[{\"added\": {}}, {\"added\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (4)\"}}]',17,2),(17,'2022-04-14 21:54:18.228210','5','EXAM5',1,'[{\"added\": {}}, {\"added\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (5)\"}}]',17,2),(18,'2022-04-15 11:29:55.291240','1','True',1,'[{\"added\": {}}]',6,2),(19,'2022-04-15 11:30:04.713239','2','False',1,'[{\"added\": {}}]',6,2),(20,'2022-04-15 11:30:20.909270','1','question1',1,'[{\"added\": {}}, {\"added\": {\"name\": \"right answer\", \"object\": \"RightAnswer object (1)\"}}]',12,2),(21,'2022-04-15 11:30:52.215505','2','Question2',1,'[{\"added\": {}}, {\"added\": {\"name\": \"right answer\", \"object\": \"RightAnswer object (2)\"}}]',12,2),(22,'2022-04-15 11:31:07.182566','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (1)\", \"fields\": [\"Quantity\"]}}]',17,2),(23,'2022-04-15 11:47:46.889381','2','two',1,'[{\"added\": {}}]',7,2),(24,'2022-04-15 11:47:56.670443','2','H',1,'[{\"added\": {}}]',9,2),(25,'2022-04-15 11:48:04.757417','2','MCQ',1,'[{\"added\": {}}]',13,2),(26,'2022-04-15 11:48:13.176607','1','EXAM1',2,'[{\"added\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (6)\"}}]',17,2),(27,'2022-04-15 11:49:09.585641','3','choice1',1,'[{\"added\": {}}]',6,2),(28,'2022-04-15 11:49:19.459605','4','choice2',1,'[{\"added\": {}}]',6,2),(29,'2022-04-15 11:49:36.509606','5','choice3',1,'[{\"added\": {}}]',6,2),(30,'2022-04-15 11:49:46.435614','6','choice4',1,'[{\"added\": {}}]',6,2),(31,'2022-04-15 11:49:59.590608','3','question3',1,'[{\"added\": {}}, {\"added\": {\"name\": \"right answer\", \"object\": \"RightAnswer object (3)\"}}]',12,2),(32,'2022-04-15 11:50:37.358786','4','question4',1,'[{\"added\": {}}, {\"added\": {\"name\": \"right answer\", \"object\": \"RightAnswer object (4)\"}}]',12,2),(33,'2022-04-16 10:01:38.513748','1','question1 M',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',12,2),(34,'2022-04-16 10:01:49.856294','2','Question2 M',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',12,2),(35,'2022-04-16 10:02:06.276502','3','question3 H',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',12,2),(36,'2022-04-16 10:02:40.072633','4','question4 H CH2 MCQ',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',12,2),(37,'2022-04-16 10:03:06.137969','3','question3 H CH2 MCQ',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',12,2),(38,'2022-04-16 10:03:56.624814','2','Question2 M CH1 TOF',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',12,2),(39,'2022-04-16 10:04:20.035814','1','question1 M CH1 TOF',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',12,2),(40,'2022-04-16 10:04:20.430849','1','question1 M CH1 TOF',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',12,2),(41,'2022-04-16 10:07:21.391857','5','QUESTION5 M CH2 MCQ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"right answer\", \"object\": \"RightAnswer object (5)\"}}]',12,2),(42,'2022-04-16 10:10:57.776804','6','QUESTION6 M CH2 MCQ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"right answer\", \"object\": \"RightAnswer object (6)\"}}]',12,2),(43,'2022-04-16 10:26:10.125908','7','questin 7 H CH2 MCQ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"right answer\", \"object\": \"RightAnswer object (7)\"}}]',12,2),(44,'2022-04-16 10:29:18.195593','8','QUESTION8 M CH1 TOF',1,'[{\"added\": {}}, {\"added\": {\"name\": \"right answer\", \"object\": \"RightAnswer object (8)\"}}]',12,2),(45,'2022-04-20 12:34:22.846298','1','EXAM1',2,'[{\"changed\": {\"fields\": [\"Ends at\"]}}]',17,2),(46,'2022-04-20 12:37:18.177386','1','EXAM1',2,'[{\"changed\": {\"fields\": [\"Starts at\", \"Ends at\"]}}]',17,2),(47,'2022-04-20 12:44:39.787947','1','EXAM1',2,'[{\"changed\": {\"fields\": [\"Starts at\"]}}]',17,2),(48,'2022-04-20 13:04:47.925616','1','EXAM1',2,'[{\"changed\": {\"fields\": [\"Starts at\"]}}]',17,2),(49,'2022-04-21 02:21:54.886514','6','exam6',1,'[{\"added\": {}}, {\"added\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (7)\"}}]',17,2),(50,'2022-04-21 02:22:57.740512','9','quesion test',1,'[{\"added\": {}}, {\"added\": {\"name\": \"right answer\", \"object\": \"RightAnswer object (9)\"}}]',12,2),(51,'2022-04-21 13:45:11.163955','1','EXAM1',2,'[{\"changed\": {\"fields\": [\"Ends at\"]}}]',17,2),(52,'2022-04-21 13:45:28.302069','1','EXAM1',2,'[{\"changed\": {\"fields\": [\"Ends at\"]}}]',17,2),(53,'2022-04-21 13:52:17.639958','4','prof1',1,'[{\"added\": {}}]',23,2),(54,'2022-04-21 13:53:20.985581','2','professor math',1,'[{\"added\": {}}]',18,2),(55,'2022-04-21 13:55:29.240974','4','prof1',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"User permissions\"]}}]',23,2),(56,'2022-04-21 13:58:44.786857','4','prof1',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',23,2),(57,'2022-04-23 02:47:04.621542','3','question3 H CH2 MCQ',2,'[{\"changed\": {\"name\": \"right answer\", \"object\": \"RightAnswer object (3)\", \"fields\": [\"Answers\"]}}]',12,2),(58,'2022-04-23 04:24:21.668927','1','EXAM1',2,'[{\"changed\": {\"fields\": [\"Ends at\"]}}]',17,2),(59,'2022-04-24 14:07:18.700038','2','EXAM2',2,'[{\"changed\": {\"fields\": [\"Ends at\"]}}]',17,2),(60,'2022-04-25 11:47:25.846425','7','trydoc',1,'[{\"added\": {}}]',23,2),(61,'2022-04-25 12:52:55.206300','8','Person object (8)',3,'',11,2),(62,'2022-04-25 12:53:30.577059','11','trysig',3,'',23,2),(63,'2022-04-25 13:25:17.819168','8','studenttry',3,'',23,2),(64,'2022-04-25 13:25:17.851168','7','trydoc',3,'',23,2),(65,'2022-04-25 13:25:17.879106','12','trysig',3,'',23,2),(66,'2022-04-25 13:25:17.904877','13','trysig2',3,'',23,2),(67,'2022-04-25 13:25:17.932861','14','trysig22',3,'',23,2),(68,'2022-04-25 13:25:17.959278','15','trysig222',3,'',23,2),(69,'2022-04-25 13:25:17.987241','16','trysig2222',3,'',23,2),(70,'2022-04-25 13:25:18.015277','17','trysig22222',3,'',23,2),(71,'2022-04-25 13:25:18.041272','18','trysig222225',3,'',23,2),(72,'2022-04-25 13:25:18.069304','19','trysig22222555',3,'',23,2),(73,'2022-04-25 13:25:18.095242','9','trysignals',3,'',23,2),(74,'2022-04-25 13:25:18.123279','10','trysignals1',3,'',23,2),(75,'2022-04-25 13:25:18.151277','5','userone',3,'',23,2),(76,'2022-04-25 13:59:57.393047','20','moibrahem',1,'[{\"added\": {}}]',23,2),(77,'2022-04-25 14:00:07.872521','11','Mohamed Ibrahem',1,'[{\"added\": {}}]',14,2),(78,'2022-04-26 08:48:59.865763','1','EXAM1',2,'[{\"changed\": {\"fields\": [\"Ends at\"]}}]',17,2),(79,'2022-04-26 12:07:19.279672','8','QUESTION8 M CH1 TOF',2,'[{\"added\": {\"name\": \"image\", \"object\": \"Image object (13)\"}}]',12,2),(80,'2022-04-26 12:08:43.966611','8','QUESTION8 M CH1 TOF',2,'[{\"added\": {\"name\": \"image\", \"object\": \"Image object (14)\"}}]',12,2),(81,'2022-04-26 12:21:00.294089','8','QUESTION8 M CH1 TOF',2,'[{\"deleted\": {\"name\": \"image\", \"object\": \"Image object (None)\"}}]',12,2),(82,'2022-04-26 12:21:29.114818','8','QUESTION8 M CH1 TOF',2,'[{\"added\": {\"name\": \"image\", \"object\": \"Image object (15)\"}}]',12,2),(83,'2022-04-26 12:23:14.987405','8','QUESTION8 M CH1 TOF',2,'[{\"deleted\": {\"name\": \"image\", \"object\": \"Image object (None)\"}}]',12,2),(84,'2022-04-26 12:24:16.354528','8','QUESTION8 M CH1 TOF',2,'[{\"added\": {\"name\": \"image\", \"object\": \"Image object (16)\"}}]',12,2),(85,'2022-04-26 12:25:51.100834','8','QUESTION8 M CH1 TOF',2,'[{\"deleted\": {\"name\": \"image\", \"object\": \"Image object (None)\"}}, {\"deleted\": {\"name\": \"image\", \"object\": \"Image object (None)\"}}]',12,2),(86,'2022-04-28 09:08:39.730733','4','Result object (4)',3,'',20,2),(87,'2022-04-28 09:08:39.772764','2','Result object (2)',3,'',20,2),(88,'2022-04-28 12:18:49.614459','6','Result object (6)',3,'',20,2),(89,'2022-04-28 12:18:49.646458','5','Result object (5)',3,'',20,2),(90,'2022-05-01 16:17:19.140716','1','EXAM1',2,'[{\"changed\": {\"fields\": [\"Ends at\"]}}]',17,2),(91,'2022-05-05 04:33:36.758866','1','ONE',2,'[{\"changed\": {\"fields\": [\"Subject\"]}}]',7,2),(92,'2022-05-05 04:33:47.312996','2','two',2,'[{\"changed\": {\"fields\": [\"Subject\"]}}]',7,2),(93,'2022-05-05 05:10:07.149421','1','math1',2,'[{\"changed\": {\"fields\": [\"Chapters\"]}}]',15,2),(94,'2022-05-05 05:14:37.875553','8','Result object (8)',3,'',20,2),(95,'2022-05-05 06:31:42.253967','10','Result object (10)',3,'',20,2),(96,'2022-05-05 06:32:15.931621','11','Result object (11)',3,'',20,2),(97,'2022-05-05 06:35:35.964826','2','EXAM2',2,'[{\"changed\": {\"fields\": [\"Ends at\"]}}]',17,2),(98,'2022-05-05 06:39:53.883472','3','exam3',2,'[{\"changed\": {\"fields\": [\"Ends at\"]}}]',17,2),(99,'2022-05-05 06:40:32.781350','3','exam3',2,'[{\"changed\": {\"fields\": [\"Ends at\"]}}]',17,2),(100,'2022-05-05 06:43:44.143162','14','Result object (14)',3,'',20,2),(101,'2022-05-06 21:10:44.280012','3','E',1,'[{\"added\": {}}]',9,2),(102,'2022-05-06 21:11:07.400926','1','EXAM1',2,'[]',17,2),(103,'2022-05-06 21:33:00.447523','20','moibrahem',3,'',23,2),(104,'2022-05-06 22:05:58.802486','33','m1',1,'[{\"added\": {}}]',23,2),(105,'2022-05-06 22:37:20.157538','1','question1 M CH1 TOF',2,'[{\"added\": {\"name\": \"image\", \"object\": \"Image object (17)\"}}]',12,2),(106,'2022-05-06 22:38:17.477763','16','Result object (16)',3,'',20,2),(107,'2022-05-07 03:39:02.540044','36','mo2',3,'',23,2),(108,'2022-05-07 03:39:02.793043','34','moibrahem',3,'',23,2),(109,'2022-05-07 03:42:29.623950','37','moibrahem',3,'',23,2),(110,'2022-05-11 21:25:03.681457','2','EXAM2',2,'[{\"changed\": {\"fields\": [\"Ends at\"]}}]',17,2),(111,'2022-05-11 21:25:32.610237','3','exam3',2,'[{\"changed\": {\"fields\": [\"Ends at\"]}}]',17,2),(112,'2022-05-11 21:26:05.586861','6','exam6',2,'[{\"changed\": {\"fields\": [\"Ends at\"]}}]',17,2),(113,'2022-05-11 21:26:50.707614','6','exam6',2,'[]',17,2),(114,'2022-05-11 21:29:38.590641','4','Exam4',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (4)\", \"fields\": [\"Quantity\"]}}]',17,2),(115,'2022-05-11 21:29:50.425417','4','Exam4',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (4)\", \"fields\": [\"Difficulty\"]}}]',17,2),(116,'2022-05-11 21:30:14.907845','4','Exam4',2,'[{\"changed\": {\"fields\": [\"Ends at\"]}}]',17,2),(117,'2022-05-11 21:30:40.286272','4','Exam4',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (4)\", \"fields\": [\"Difficulty\"]}}]',17,2),(118,'2022-05-11 21:31:08.457175','17','Result object (17)',3,'',20,2),(119,'2022-05-11 21:31:43.794506','12','Result object (12)',3,'',20,2),(120,'2022-05-11 21:32:44.157136','1','EXAM1',2,'[{\"deleted\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (None)\"}}]',17,2),(121,'2022-05-11 21:33:29.128211','6','exam6',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (7)\", \"fields\": [\"Difficulty\"]}}]',17,2),(122,'2022-05-11 21:33:44.455319','6','exam6',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (7)\", \"fields\": [\"Difficulty\"]}}]',17,2),(123,'2022-05-11 21:34:08.496159','6','exam6',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (7)\", \"fields\": [\"Difficulty\"]}}]',17,2),(124,'2022-05-11 21:34:26.470201','6','exam6',2,'[]',17,2),(125,'2022-05-11 21:34:36.549621','6','exam6',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (7)\", \"fields\": [\"Difficulty\"]}}]',17,2),(126,'2022-05-11 21:34:53.072297','6','exam6',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (7)\", \"fields\": [\"Quantity\"]}}]',17,2),(127,'2022-05-11 21:35:23.243058','2','database',2,'[{\"changed\": {\"fields\": [\"Chapters\"]}}]',15,2),(128,'2022-05-11 21:36:23.176182','6','exam6',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (7)\", \"fields\": [\"Type\", \"Quantity\"]}}]',17,2),(129,'2022-05-11 21:37:38.437716','6','exam6',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (7)\", \"fields\": [\"Difficulty\"]}}]',17,2),(130,'2022-05-11 21:37:55.256196','6','exam6',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (7)\", \"fields\": [\"Difficulty\"]}}]',17,2),(131,'2022-05-11 21:44:08.308051','6','exam6',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (7)\", \"fields\": [\"Type\"]}}]',17,2),(132,'2022-05-11 21:46:52.553946','7','exam7',1,'[{\"added\": {}}]',17,2),(133,'2022-05-11 22:05:41.235974','1','EXAM1',2,'[{\"added\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (8)\"}}]',17,2),(134,'2022-05-11 22:08:45.413262','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (1)\", \"fields\": [\"Quantity\"]}}, {\"deleted\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (None)\"}}]',17,2),(135,'2022-05-11 22:09:36.819935','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (1)\", \"fields\": [\"Quantity\"]}}]',17,2),(136,'2022-05-11 22:12:57.533077','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (1)\", \"fields\": [\"Quantity\"]}}]',17,2),(137,'2022-05-11 22:13:54.476324','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (1)\", \"fields\": [\"Quantity\"]}}]',17,2),(138,'2022-05-11 22:36:11.755209','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (1)\", \"fields\": [\"Quantity\"]}}]',17,2),(139,'2022-05-11 22:38:59.666143','1','EXAM1',2,'[{\"added\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (9)\"}}]',17,2),(140,'2022-05-11 22:42:14.925128','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (1)\", \"fields\": [\"Quantity\"]}}]',17,2),(141,'2022-05-11 22:45:03.262393','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (1)\", \"fields\": [\"Quantity\"]}}, {\"deleted\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (None)\"}}]',17,2),(142,'2022-05-11 22:46:31.437837','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (1)\", \"fields\": [\"Quantity\"]}}]',17,2),(143,'2022-05-11 22:56:28.418562','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (1)\", \"fields\": [\"Quantity\"]}}]',17,2),(144,'2022-05-11 22:57:15.033492','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (1)\", \"fields\": [\"Quantity\"]}}]',17,2),(145,'2022-05-11 23:04:07.906093','1','EXAM1',2,'[{\"added\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (10)\"}}, {\"deleted\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (None)\"}}]',17,2),(146,'2022-05-11 23:12:16.655622','10','ANother1',1,'[{\"added\": {}}, {\"added\": {\"name\": \"right answer\", \"object\": \"RightAnswer object (10)\"}}]',12,2),(147,'2022-05-11 23:12:26.072547','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (10)\", \"fields\": [\"Quantity\"]}}]',17,2),(148,'2022-05-11 23:19:39.275255','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (10)\", \"fields\": [\"Quantity\"]}}]',17,2),(149,'2022-05-11 23:20:40.075240','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (10)\", \"fields\": [\"Quantity\"]}}]',17,2),(150,'2022-05-11 23:21:23.450769','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (10)\", \"fields\": [\"Quantity\"]}}]',17,2),(151,'2022-05-11 23:26:44.747631','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (10)\", \"fields\": [\"Quantity\"]}}]',17,2),(152,'2022-05-11 23:28:43.503030','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (10)\", \"fields\": [\"Quantity\"]}}]',17,2),(153,'2022-05-11 23:30:16.279400','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (10)\", \"fields\": [\"Quantity\"]}}]',17,2),(154,'2022-05-12 00:29:52.830206','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (10)\", \"fields\": [\"Quantity\"]}}]',17,2),(155,'2022-05-12 00:45:17.284505','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (10)\", \"fields\": [\"Quantity\"]}}]',17,2),(156,'2022-05-20 03:57:17.433126','1','EXAM1',2,'[{\"added\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (11)\"}}, {\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (10)\", \"fields\": [\"Quantity\"]}}]',17,2),(157,'2022-05-20 08:14:04.239023','2','MCQ',2,'[{\"changed\": {\"fields\": [\"InputType\"]}}]',13,2),(158,'2022-05-20 08:14:21.375747','1','TOF',2,'[]',13,2),(159,'2022-05-20 08:37:20.860905','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (10)\", \"fields\": [\"Quantity\"]}}]',17,2),(160,'2022-05-20 08:42:33.529020','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (10)\", \"fields\": [\"Quantity\"]}}, {\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (11)\", \"fields\": [\"Quantity\"]}}]',17,2),(161,'2022-05-20 09:09:58.363687','1','EXAM1',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (10)\", \"fields\": [\"Quantity\"]}}, {\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (11)\", \"fields\": [\"Quantity\"]}}]',17,2),(162,'2022-05-20 12:26:04.292035','18','Result object (18)',3,'',20,2),(163,'2022-05-21 03:08:56.210127','72','prof5',1,'[{\"added\": {}}]',23,2),(164,'2022-05-21 03:09:45.392553','72','prof5',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',23,2),(165,'2022-05-22 04:55:38.577014','19','Result object (19)',3,'',20,2),(166,'2022-05-22 04:58:53.559274','20','Result object (20)',3,'',20,2),(167,'2022-05-22 05:09:51.772335','7','Result object (7)',3,'',20,2),(168,'2022-05-22 05:10:44.328552','9','Result object (9)',3,'',20,2),(169,'2022-05-22 05:10:44.458589','21','Result object (21)',3,'',20,2),(170,'2022-05-22 05:14:37.572327','1','new2 user1',2,'[{\"changed\": {\"fields\": [\"Score\"]}}]',14,2),(171,'2022-05-22 05:15:09.608109','51','aa ww',3,'',14,2),(172,'2022-05-22 05:15:09.644104','41','adadfdsf asdada',3,'',14,2),(173,'2022-05-22 05:15:09.672139','58','adadw adsdw',3,'',14,2),(174,'2022-05-22 05:15:09.699138','45','adas ada',3,'',14,2),(175,'2022-05-22 05:15:09.727107','55','adda wdq',3,'',14,2),(176,'2022-05-22 05:15:09.755104','47','ads adas',3,'',14,2),(177,'2022-05-22 05:16:16.344546','59','ads kjnio',3,'',14,2),(178,'2022-05-22 05:16:16.375547','46','adsd adad',3,'',14,2),(179,'2022-05-22 05:16:16.401549','57','adsd gfg',3,'',14,2),(180,'2022-05-22 05:16:16.429551','37','adsdasd sddad',3,'',14,2),(181,'2022-05-22 05:16:16.457551','60','adwj kljjh',3,'',14,2),(182,'2022-05-22 05:16:16.485547','36','agdahshds dadadsd',3,'',14,2),(183,'2022-05-22 05:16:16.951597','40','asdada asdada',3,'',14,2),(184,'2022-05-22 05:16:16.980598','53','asdd www',3,'',14,2),(185,'2022-05-22 05:16:17.012597','48','assaasww sad',3,'',14,2),(186,'2022-05-22 05:16:17.037636','49','cvgbhj cvbnm,',3,'',14,2),(187,'2022-05-22 05:16:17.064609','52','das qre',3,'',14,2),(188,'2022-05-22 05:16:17.091598','38','dsadkkk sda',3,'',14,2),(189,'2022-05-22 05:16:17.118598','56','dsaqwd dad',3,'',14,2),(190,'2022-05-22 05:16:17.145639','32','firstname lastname',3,'',14,2),(191,'2022-05-22 05:16:17.175607','50','fsf adadw',3,'',14,2),(192,'2022-05-22 05:16:17.203612','24','m1 m1',3,'',14,2),(193,'2022-05-22 05:16:17.229637','33','m4 m5',3,'',14,2),(194,'2022-05-22 05:16:17.255644','34','memo meme',3,'',14,2),(195,'2022-05-22 05:16:17.281639','30','Mohamed Ibrahem',3,'',14,2),(196,'2022-05-22 05:16:17.308600','29','Mohamed Ibrahem',3,'',14,2),(197,'2022-05-22 05:16:17.365609','31','momo toto',3,'',14,2),(198,'2022-05-22 05:16:17.392607','42','momomo moooa',3,'',14,2),(199,'2022-05-22 05:16:17.419598','44','sad ad',3,'',14,2),(200,'2022-05-22 05:16:17.445640','39','sadadaq dsadasdad',3,'',14,2),(201,'2022-05-22 05:16:17.472597','62','sadih iiuoui',3,'',14,2),(202,'2022-05-22 05:16:17.498640','54','sdad asdd',3,'',14,2),(203,'2022-05-22 05:16:17.525602','43','trioo trioo',3,'',14,2),(204,'2022-05-22 05:16:17.552609','35','vbnm,. asda',3,'',14,2),(205,'2022-05-22 05:16:17.630610','61','yuio tyuio',3,'',14,2),(206,'2022-05-22 05:16:49.848200','13','Result object (13)',3,'',20,2),(207,'2022-05-22 05:16:49.950200','15','Result object (15)',3,'',20,2),(208,'2022-05-22 05:20:42.714757','3','exam3',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (3)\", \"fields\": [\"Difficulty\"]}}]',17,2),(209,'2022-05-22 05:21:47.672630','3','exam3',2,'[{\"changed\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (3)\", \"fields\": [\"Difficulty\", \"Type\", \"Quantity\"]}}]',17,2),(210,'2022-05-23 22:57:16.456813','22','Result object (22)',3,'',20,2),(211,'2022-05-24 01:15:18.182498','25','Result object (25)',3,'',20,2),(212,'2022-05-24 01:59:24.937246','75','prof10',1,'[{\"added\": {}}]',23,2),(213,'2022-05-24 01:59:35.851862','75','prof10',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',23,2),(214,'2022-05-24 02:05:14.582063','66','prof 10',2,'[{\"changed\": {\"fields\": [\"Phone\", \"Subjects\"]}}]',18,2),(215,'2022-05-24 02:06:25.718722','1','question1 M CH1 TOF',2,'[{\"added\": {\"name\": \"image\", \"object\": \"Image object (18)\"}}]',12,2),(216,'2022-05-24 02:22:28.911842','66','prof 10',2,'[{\"changed\": {\"fields\": [\"Birth date\"]}}]',18,2),(217,'2022-05-24 03:09:32.166551','1','AnonymousUser',3,'',23,2),(218,'2022-05-24 13:14:50.330475','1','professors',1,'[{\"added\": {}}]',3,2),(219,'2022-05-24 13:15:01.172047','1','professors',2,'[]',3,2),(220,'2022-05-24 13:15:23.362519','75','prof10',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',23,2),(221,'2022-05-24 14:03:03.376780','3','three',1,'[{\"added\": {}}]',7,75),(222,'2022-05-24 14:05:09.596067','1','professors',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,2),(223,'2022-05-24 14:06:20.074050','11','trial',1,'[{\"added\": {}}, {\"added\": {\"name\": \"right answer\", \"object\": \"RightAnswer object (11)\"}}]',12,75),(224,'2022-05-24 14:07:03.630007','8','trial exam',1,'[{\"added\": {}}, {\"added\": {\"name\": \"exam question\", \"object\": \"ExamQuestion object (12)\"}}]',17,75);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(23,'core','user'),(6,'exam','answer'),(7,'exam','chapter'),(8,'exam','department'),(9,'exam','difficulty'),(17,'exam','exam'),(19,'exam','examquestion'),(24,'exam','image'),(10,'exam','level'),(11,'exam','person'),(18,'exam','professor'),(12,'exam','question'),(20,'exam','result'),(16,'exam','rightanswer'),(14,'exam','student'),(15,'exam','subject'),(13,'exam','type'),(21,'guardian','groupobjectpermission'),(22,'guardian','userobjectpermission'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-04-13 09:03:59.532746'),(2,'contenttypes','0002_remove_content_type_name','2022-04-13 09:03:59.802086'),(3,'auth','0001_initial','2022-04-13 09:04:00.351668'),(4,'auth','0002_alter_permission_name_max_length','2022-04-13 09:04:00.458775'),(5,'auth','0003_alter_user_email_max_length','2022-04-13 09:04:00.471801'),(6,'auth','0004_alter_user_username_opts','2022-04-13 09:04:00.482775'),(7,'auth','0005_alter_user_last_login_null','2022-04-13 09:04:00.494774'),(8,'auth','0006_require_contenttypes_0002','2022-04-13 09:04:00.502775'),(9,'auth','0007_alter_validators_add_error_messages','2022-04-13 09:04:00.515777'),(10,'auth','0008_alter_user_username_max_length','2022-04-13 09:04:00.528778'),(11,'auth','0009_alter_user_last_name_max_length','2022-04-13 09:04:00.542774'),(12,'auth','0010_alter_group_name_max_length','2022-04-13 09:04:00.571806'),(13,'auth','0011_update_proxy_permissions','2022-04-13 09:04:00.582776'),(14,'auth','0012_alter_user_first_name_max_length','2022-04-13 09:04:00.594776'),(15,'core','0001_initial','2022-04-13 09:04:01.364131'),(16,'admin','0001_initial','2022-04-13 09:04:01.615354'),(17,'admin','0002_logentry_remove_auto_add','2022-04-13 09:04:01.629357'),(18,'admin','0003_logentry_add_action_flag_choices','2022-04-13 09:04:01.644385'),(19,'exam','0001_initial','2022-04-13 09:04:07.109567'),(20,'exam','0002_level_placed_at_alter_department_levels','2022-04-13 09:04:07.297699'),(21,'exam','0003_alter_examquestion_unique_together','2022-04-13 09:04:07.425571'),(22,'exam','0004_chapter_subject','2022-04-13 09:04:07.546147'),(23,'exam','0005_student_department_student_level','2022-04-13 09:04:07.937572'),(24,'exam','0006_alter_result_student','2022-04-13 09:04:07.964569'),(25,'exam','0007_remove_student_department_student_department_and_more','2022-04-13 09:04:08.170569'),(26,'exam','0008_alter_student_department','2022-04-13 09:04:08.360778'),(27,'exam','0009_alter_professor_subjects','2022-04-13 09:04:08.402770'),(28,'exam','0010_alter_professor_subjects','2022-04-13 09:04:08.443776'),(29,'exam','0011_remove_professor_subjects','2022-04-13 09:04:08.544770'),(30,'exam','0012_professor_subjects','2022-04-13 09:04:08.823855'),(31,'exam','0013_delete_user','2022-04-13 09:04:08.924877'),(32,'guardian','0001_initial','2022-04-13 09:04:10.017296'),(33,'guardian','0002_generic_permissions_index','2022-04-13 09:04:10.107984'),(34,'sessions','0001_initial','2022-04-13 09:04:10.181984'),(35,'exam','0014_alter_examquestion_exam','2022-04-15 03:35:16.259572'),(36,'exam','0015_alter_rightanswer_options','2022-04-23 05:20:53.535377'),(37,'exam','0016_alter_rightanswer_options','2022-04-23 13:42:54.701784'),(38,'core','0002_user_profile_type','2022-04-25 12:43:10.551137'),(39,'exam','0017_image','2022-04-26 09:26:03.543265'),(40,'exam','0018_remove_image_person_image_student','2022-04-26 09:41:02.898398'),(41,'exam','0019_alter_image_question','2022-04-26 10:16:56.082453'),(42,'exam','0020_alter_image_image','2022-04-26 10:28:10.758330'),(43,'exam','0021_remove_image_student','2022-04-26 12:02:33.253360'),(44,'exam','0022_result_score_result_total','2022-04-28 09:10:20.019761'),(45,'exam','0023_student_score','2022-04-28 11:41:35.694418'),(46,'exam','0024_remove_student_score','2022-04-28 11:56:30.956301'),(47,'exam','0025_student_score','2022-04-28 12:01:44.187589'),(48,'exam','0026_alter_student_score','2022-04-28 12:31:19.480676'),(49,'exam','0027_remove_chapter_subject_chapter_subject','2022-05-05 04:14:22.625972'),(50,'exam','0028_alter_chapter_subject','2022-05-05 04:14:22.666953'),(51,'exam','0029_remove_chapter_subject_subject_chapters','2022-05-05 04:18:43.020897'),(52,'exam','0030_remove_subject_chapters_chapter_subject','2022-05-05 04:22:22.063992'),(53,'exam','0031_remove_chapter_subject_chapter_subject','2022-05-05 04:23:56.050133'),(54,'exam','0032_remove_chapter_subject_chapter_subject','2022-05-05 04:32:15.416018'),(55,'exam','0033_alter_chapter_subject','2022-05-05 04:48:18.143725'),(56,'exam','0034_remove_chapter_subject_subject_chapters','2022-05-05 04:53:58.121815'),(57,'exam','0035_alter_student_score','2022-05-06 22:05:30.226031'),(58,'exam','0036_alter_student_score','2022-05-06 22:29:05.135495'),(59,'exam','0037_type_inputtype','2022-05-20 08:11:10.603056'),(60,'exam','0038_alter_answer_title_alter_chapter_title_and_more','2022-05-24 02:20:34.239101');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('a86f4cqauzn1y38mewn7lukiy51it0of','.eJxVjEEOwiAQRe_C2hAGqIBL956BDMxUqgaS0q6Md7dNutDtf-_9t4i4LiWunec4kbgILU6_W8L85LoDemC9N5lbXeYpyV2RB-3y1ohf18P9OyjYy1YnQLDodfZOAfpRM-SUnfZnS8GwVWEwI1jmgT0YJs0cFDE5g25jJD5f4kg4Aw:1nn5Cz:XRL2PPUFV68H514Se68mFAQK4s8_URdUZlndpq2HJJ8','2022-05-20 21:09:53.742654'),('jo2mm1bvi5weunpvktmnmnjwxa372az1','.eJxVjEEOwiAQRe_C2hAGqIBL956BDMxUqgaS0q6Md7dNutDtf-_9t4i4LiWunec4kbgILU6_W8L85LoDemC9N5lbXeYpyV2RB-3y1ohf18P9OyjYy1YnQLDodfZOAfpRM-SUnfZnS8GwVWEwI1jmgT0YJs0cFDE5g25jJD5f4kg4Aw:1neYxi:PboBfPKVQoBpbvPLaHYEovccAe0-Ti9405NGBLCdZPU','2022-04-27 09:06:54.414710'),('n0aahek573b3alebn4t4qiz2qpklsfgz','.eJxVjDsOwjAQBe_iGln-RY4p6TmDtV7v4gCypTipIu5OIqWA9s3M20SEdSlx7TTHKYur8IO4_I4J8EX1IPkJ9dEktrrMU5KHIk_a5b1let9O9--gQC97HbxyFkPQljxkVMZ6NKNxLmRnAJEHy-y0SqR3y3oIOBLn4FghsGLx-QL8izh2:1ntVEI:12W7t3uzrCLwuTGd_U3RvMxMpJyCZ5aL5G7zd_ecAiE','2022-06-07 14:09:46.559682');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_answer`
--

DROP TABLE IF EXISTS `exam_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_answer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_answer`
--

LOCK TABLES `exam_answer` WRITE;
/*!40000 ALTER TABLE `exam_answer` DISABLE KEYS */;
INSERT INTO `exam_answer` VALUES (1,'True'),(2,'False'),(3,'choice1'),(4,'choice2'),(5,'choice3'),(6,'choice4');
/*!40000 ALTER TABLE `exam_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_chapter`
--

DROP TABLE IF EXISTS `exam_chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_chapter` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_chapter`
--

LOCK TABLES `exam_chapter` WRITE;
/*!40000 ALTER TABLE `exam_chapter` DISABLE KEYS */;
INSERT INTO `exam_chapter` VALUES (1,'ONE'),(2,'two'),(3,'three');
/*!40000 ALTER TABLE `exam_chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_department`
--

DROP TABLE IF EXISTS `exam_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_department` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_department`
--

LOCK TABLES `exam_department` WRITE;
/*!40000 ALTER TABLE `exam_department` DISABLE KEYS */;
INSERT INTO `exam_department` VALUES (1,'SE'),(2,'CS');
/*!40000 ALTER TABLE `exam_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_department_levels`
--

DROP TABLE IF EXISTS `exam_department_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_department_levels` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `department_id` bigint NOT NULL,
  `level_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_department_levels_department_id_level_id_5c85c0de_uniq` (`department_id`,`level_id`),
  KEY `exam_department_levels_level_id_6bfe17d4_fk_exam_level_id` (`level_id`),
  CONSTRAINT `exam_department_leve_department_id_ac23f49f_fk_exam_depa` FOREIGN KEY (`department_id`) REFERENCES `exam_department` (`id`),
  CONSTRAINT `exam_department_levels_level_id_6bfe17d4_fk_exam_level_id` FOREIGN KEY (`level_id`) REFERENCES `exam_level` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_department_levels`
--

LOCK TABLES `exam_department_levels` WRITE;
/*!40000 ALTER TABLE `exam_department_levels` DISABLE KEYS */;
INSERT INTO `exam_department_levels` VALUES (1,1,1),(2,2,1),(3,2,2);
/*!40000 ALTER TABLE `exam_department_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_difficulty`
--

DROP TABLE IF EXISTS `exam_difficulty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_difficulty` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_difficulty`
--

LOCK TABLES `exam_difficulty` WRITE;
/*!40000 ALTER TABLE `exam_difficulty` DISABLE KEYS */;
INSERT INTO `exam_difficulty` VALUES (1,'M'),(2,'H'),(3,'E');
/*!40000 ALTER TABLE `exam_difficulty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_exam`
--

DROP TABLE IF EXISTS `exam_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_exam` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `starts_at` datetime(6) NOT NULL,
  `ends_at` datetime(6) NOT NULL,
  `subject_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_exam_subject_id_f59472e2_fk_exam_subject_id` (`subject_id`),
  CONSTRAINT `exam_exam_subject_id_f59472e2_fk_exam_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `exam_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_exam`
--

LOCK TABLES `exam_exam` WRITE;
/*!40000 ALTER TABLE `exam_exam` DISABLE KEYS */;
INSERT INTO `exam_exam` VALUES (1,'EXAM1','2022-04-14 21:51:14.545730','2022-04-20 16:44:34.000000','2022-05-30 16:17:10.000000',1),(2,'EXAM2','2022-04-14 21:51:49.575442','2022-04-14 21:51:33.000000','2022-05-22 16:00:00.000000',1),(3,'exam3','2022-04-14 21:52:38.992864','2022-04-14 21:52:06.000000','2022-05-31 16:00:00.000000',2),(4,'Exam4','2022-04-14 21:53:33.940860','2022-04-14 21:53:15.000000','2022-05-30 16:00:00.000000',2),(5,'EXAM5','2022-04-14 21:54:18.169210','2022-04-14 21:53:47.000000','2022-04-23 21:54:14.000000',3),(6,'exam6','2022-04-21 02:21:54.703508','2022-04-21 02:21:28.000000','2022-05-31 02:21:38.000000',2),(7,'exam7','2022-05-11 21:46:52.525911','2022-05-11 21:46:44.000000','2022-05-30 21:46:46.000000',2),(8,'trial exam','2022-05-24 14:07:03.522036','2022-05-24 14:06:43.000000','2022-05-31 14:06:48.000000',1);
/*!40000 ALTER TABLE `exam_exam` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_examquestion`
--

LOCK TABLES `exam_examquestion` WRITE;
/*!40000 ALTER TABLE `exam_examquestion` DISABLE KEYS */;
INSERT INTO `exam_examquestion` VALUES (2,10,1,1,2,1),(3,1,1,1,3,2),(4,2,1,3,4,1),(5,11,1,1,5,1),(7,5,1,1,6,1),(10,5,2,2,1,2),(11,5,1,1,1,1),(12,5,1,2,8,2);
/*!40000 ALTER TABLE `exam_examquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_image`
--

DROP TABLE IF EXISTS `exam_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `question_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_image_question_id_38643ba2_fk_exam_question_id` (`question_id`),
  CONSTRAINT `exam_image_question_id_38643ba2_fk_exam_question_id` FOREIGN KEY (`question_id`) REFERENCES `exam_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_image`
--

LOCK TABLES `exam_image` WRITE;
/*!40000 ALTER TABLE `exam_image` DISABLE KEYS */;
INSERT INTO `exam_image` VALUES (1,'store/images/BgJFPW0_1_1TIakn8.png',NULL),(3,'exam/images/239992532_264831055476071_4443103430919684138_n.jpg',NULL),(4,'exam/images/BgJFPW0.png',NULL),(5,'exam/images/hqdefault.jpg',NULL),(17,'exam/images/BgJFPW0_1.png',1),(18,'exam/images/33.PNG',1);
/*!40000 ALTER TABLE `exam_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_level`
--

DROP TABLE IF EXISTS `exam_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_level` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `placed_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_level`
--

LOCK TABLES `exam_level` WRITE;
/*!40000 ALTER TABLE `exam_level` DISABLE KEYS */;
INSERT INTO `exam_level` VALUES (1,'one','2022-04-13 09:14:27.844027'),(2,'two','2022-04-14 21:48:37.623853');
/*!40000 ALTER TABLE `exam_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_person`
--

DROP TABLE IF EXISTS `exam_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_person` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `exam_person_user_id_ee0514bc_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_person`
--

LOCK TABLES `exam_person` WRITE;
/*!40000 ALTER TABLE `exam_person` DISABLE KEYS */;
INSERT INTO `exam_person` VALUES (1,'0123465555','2022-05-14',3),(2,'01111111111','2022-04-21',4),(3,'0111111111111','1998-04-28',6),(12,'01111111111','1999-03-03',21),(26,'01111111111111','2022-05-07',35),(63,'',NULL,72),(64,'',NULL,73),(65,'',NULL,74),(66,'011111111111','2022-05-24',75);
/*!40000 ALTER TABLE `exam_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_professor`
--

DROP TABLE IF EXISTS `exam_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_professor` (
  `person_ptr_id` bigint NOT NULL,
  PRIMARY KEY (`person_ptr_id`),
  CONSTRAINT `exam_professor_person_ptr_id_22a9960e_fk_exam_person_id` FOREIGN KEY (`person_ptr_id`) REFERENCES `exam_person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_professor`
--

LOCK TABLES `exam_professor` WRITE;
/*!40000 ALTER TABLE `exam_professor` DISABLE KEYS */;
INSERT INTO `exam_professor` VALUES (2),(63),(64),(65),(66);
/*!40000 ALTER TABLE `exam_professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_professor_subjects`
--

DROP TABLE IF EXISTS `exam_professor_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_professor_subjects` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `professor_id` bigint NOT NULL,
  `subject_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_professor_subjects_professor_id_subject_id_93ac342e_uniq` (`professor_id`,`subject_id`),
  KEY `exam_professor_subjects_subject_id_519c692e_fk_exam_subject_id` (`subject_id`),
  CONSTRAINT `exam_professor_subje_professor_id_39fa18f1_fk_exam_prof` FOREIGN KEY (`professor_id`) REFERENCES `exam_professor` (`person_ptr_id`),
  CONSTRAINT `exam_professor_subjects_subject_id_519c692e_fk_exam_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `exam_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_professor_subjects`
--

LOCK TABLES `exam_professor_subjects` WRITE;
/*!40000 ALTER TABLE `exam_professor_subjects` DISABLE KEYS */;
INSERT INTO `exam_professor_subjects` VALUES (1,2,1),(2,66,1);
/*!40000 ALTER TABLE `exam_professor_subjects` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question`
--

LOCK TABLES `exam_question` WRITE;
/*!40000 ALTER TABLE `exam_question` DISABLE KEYS */;
INSERT INTO `exam_question` VALUES (1,'question1 M CH1 TOF',1,1,1,1),(2,'Question2 M CH1 TOF',1,1,1,1),(3,'question3 H CH2 MCQ',2,2,1,2),(4,'question4 H CH2 MCQ',2,2,1,2),(5,'QUESTION5 M CH2 MCQ',2,1,1,2),(6,'QUESTION6 M CH2 MCQ',2,1,1,2),(7,'questin 7 H CH2 MCQ',2,2,1,2),(8,'QUESTION8 M CH1 TOF',1,1,1,1),(9,'quesion test',1,1,2,2),(10,'ANother1',2,2,1,2),(11,'trial',2,2,1,1);
/*!40000 ALTER TABLE `exam_question` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question_answer`
--

LOCK TABLES `exam_question_answer` WRITE;
/*!40000 ALTER TABLE `exam_question_answer` DISABLE KEYS */;
INSERT INTO `exam_question_answer` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,2),(5,3,3),(6,3,4),(7,3,5),(8,3,6),(9,4,3),(10,4,4),(11,4,5),(12,4,6),(13,5,3),(14,5,4),(15,5,5),(16,5,6),(17,6,3),(18,6,4),(19,6,5),(20,6,6),(21,7,3),(22,7,4),(23,7,5),(24,7,6),(25,8,1),(26,8,2),(27,9,3),(28,9,4),(29,9,5),(30,9,6),(31,10,3),(32,10,4),(33,10,5),(34,10,6),(35,11,1),(36,11,2);
/*!40000 ALTER TABLE `exam_question_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_result`
--

DROP TABLE IF EXISTS `exam_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_result` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `degree` int NOT NULL,
  `exam_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  `score` int NOT NULL,
  `total` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_result_exam_id_student_id_52acafec_uniq` (`exam_id`,`student_id`),
  KEY `exam_result_student_id_babc7762_fk_exam_student_person_ptr_id` (`student_id`),
  CONSTRAINT `exam_result_exam_id_6eb9dbc7_fk_exam_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam_exam` (`id`),
  CONSTRAINT `exam_result_student_id_babc7762_fk_exam_student_person_ptr_id` FOREIGN KEY (`student_id`) REFERENCES `exam_student` (`person_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_result`
--

LOCK TABLES `exam_result` WRITE;
/*!40000 ALTER TABLE `exam_result` DISABLE KEYS */;
INSERT INTO `exam_result` VALUES (23,6,2,1,60,10),(24,0,3,1,0,1);
/*!40000 ALTER TABLE `exam_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_rightanswer`
--

DROP TABLE IF EXISTS `exam_rightanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_rightanswer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questions_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_rightanswer_questions_id_a583a3b4_fk_exam_question_id` (`questions_id`),
  CONSTRAINT `exam_rightanswer_questions_id_a583a3b4_fk_exam_question_id` FOREIGN KEY (`questions_id`) REFERENCES `exam_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_rightanswer`
--

LOCK TABLES `exam_rightanswer` WRITE;
/*!40000 ALTER TABLE `exam_rightanswer` DISABLE KEYS */;
INSERT INTO `exam_rightanswer` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11);
/*!40000 ALTER TABLE `exam_rightanswer` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_rightanswer_answers`
--

LOCK TABLES `exam_rightanswer_answers` WRITE;
/*!40000 ALTER TABLE `exam_rightanswer_answers` DISABLE KEYS */;
INSERT INTO `exam_rightanswer_answers` VALUES (1,1,1),(2,2,2),(3,3,3),(10,3,4),(11,3,5),(4,4,5),(5,5,3),(6,6,3),(7,7,3),(8,8,1),(9,9,3),(12,10,3),(13,10,4),(14,11,1);
/*!40000 ALTER TABLE `exam_rightanswer_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_student`
--

DROP TABLE IF EXISTS `exam_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_student` (
  `person_ptr_id` bigint NOT NULL,
  `level_id` bigint DEFAULT NULL,
  `department_id` bigint DEFAULT NULL,
  `score` int NOT NULL,
  PRIMARY KEY (`person_ptr_id`),
  KEY `exam_student_level_id_8819d122_fk_exam_level_id` (`level_id`),
  KEY `exam_student_department_id_284d48cd_fk_exam_department_id` (`department_id`),
  CONSTRAINT `exam_student_department_id_284d48cd_fk_exam_department_id` FOREIGN KEY (`department_id`) REFERENCES `exam_department` (`id`),
  CONSTRAINT `exam_student_level_id_8819d122_fk_exam_level_id` FOREIGN KEY (`level_id`) REFERENCES `exam_level` (`id`),
  CONSTRAINT `exam_student_person_ptr_id_f806251e_fk_exam_person_id` FOREIGN KEY (`person_ptr_id`) REFERENCES `exam_person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_student`
--

LOCK TABLES `exam_student` WRITE;
/*!40000 ALTER TABLE `exam_student` DISABLE KEYS */;
INSERT INTO `exam_student` VALUES (1,1,1,80),(3,1,1,88),(12,1,1,100),(26,1,1,200);
/*!40000 ALTER TABLE `exam_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_subject`
--

DROP TABLE IF EXISTS `exam_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext,
  `hours` int NOT NULL,
  `level_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_subject_level_id_ddd1ba76_fk_exam_level_id` (`level_id`),
  KEY `exam_subject_slug_70361c70` (`slug`),
  CONSTRAINT `exam_subject_level_id_ddd1ba76_fk_exam_level_id` FOREIGN KEY (`level_id`) REFERENCES `exam_level` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_subject`
--

LOCK TABLES `exam_subject` WRITE;
/*!40000 ALTER TABLE `exam_subject` DISABLE KEYS */;
INSERT INTO `exam_subject` VALUES (1,'math1','math1','gnm,.',3,1),(2,'database','database101','cvbnm,.',2,1),(3,'data structire','data-structire','fghjkl;',2,2),(4,'C#','c101','FGHJKL;',2,1);
/*!40000 ALTER TABLE `exam_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_subject_chapters`
--

DROP TABLE IF EXISTS `exam_subject_chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_subject_chapters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject_id` bigint NOT NULL,
  `chapter_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_subject_chapters_subject_id_chapter_id_cc8dd3e2_uniq` (`subject_id`,`chapter_id`),
  KEY `exam_subject_chapters_chapter_id_0832fe6f_fk_exam_chapter_id` (`chapter_id`),
  CONSTRAINT `exam_subject_chapters_chapter_id_0832fe6f_fk_exam_chapter_id` FOREIGN KEY (`chapter_id`) REFERENCES `exam_chapter` (`id`),
  CONSTRAINT `exam_subject_chapters_subject_id_4a5cf03e_fk_exam_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `exam_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_subject_chapters`
--

LOCK TABLES `exam_subject_chapters` WRITE;
/*!40000 ALTER TABLE `exam_subject_chapters` DISABLE KEYS */;
INSERT INTO `exam_subject_chapters` VALUES (1,1,1),(2,1,2),(3,2,1);
/*!40000 ALTER TABLE `exam_subject_chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_subject_departments`
--

DROP TABLE IF EXISTS `exam_subject_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_subject_departments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject_id` bigint NOT NULL,
  `department_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_subject_departments_subject_id_department_id_e90ce9f3_uniq` (`subject_id`,`department_id`),
  KEY `exam_subject_departm_department_id_1acd66a0_fk_exam_depa` (`department_id`),
  CONSTRAINT `exam_subject_departm_department_id_1acd66a0_fk_exam_depa` FOREIGN KEY (`department_id`) REFERENCES `exam_department` (`id`),
  CONSTRAINT `exam_subject_departments_subject_id_7bb563f4_fk_exam_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `exam_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_subject_departments`
--

LOCK TABLES `exam_subject_departments` WRITE;
/*!40000 ALTER TABLE `exam_subject_departments` DISABLE KEYS */;
INSERT INTO `exam_subject_departments` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,2);
/*!40000 ALTER TABLE `exam_subject_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_type`
--

DROP TABLE IF EXISTS `exam_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(3) NOT NULL,
  `inputType` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_type`
--

LOCK TABLES `exam_type` WRITE;
/*!40000 ALTER TABLE `exam_type` DISABLE KEYS */;
INSERT INTO `exam_type` VALUES (1,'TOF','radio'),(2,'MCQ','checkbox');
/*!40000 ALTER TABLE `exam_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardian_groupobjectpermission`
--

DROP TABLE IF EXISTS `guardian_groupobjectpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guardian_groupobjectpermission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_pk` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guardian_groupobjectperm_group_id_permission_id_o_3f189f7c_uniq` (`group_id`,`permission_id`,`object_pk`),
  KEY `guardian_groupobject_permission_id_36572738_fk_auth_perm` (`permission_id`),
  KEY `guardian_gr_content_ae6aec_idx` (`content_type_id`,`object_pk`),
  CONSTRAINT `guardian_groupobject_content_type_id_7ade36b8_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `guardian_groupobject_group_id_4bbbfb62_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `guardian_groupobject_permission_id_36572738_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardian_groupobjectpermission`
--

LOCK TABLES `guardian_groupobjectpermission` WRITE;
/*!40000 ALTER TABLE `guardian_groupobjectpermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `guardian_groupobjectpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardian_userobjectpermission`
--

DROP TABLE IF EXISTS `guardian_userobjectpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guardian_userobjectpermission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_pk` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guardian_userobjectpermi_user_id_permission_id_ob_b0b3d2fc_uniq` (`user_id`,`permission_id`,`object_pk`),
  KEY `guardian_userobjectp_permission_id_71807bfc_fk_auth_perm` (`permission_id`),
  KEY `guardian_us_content_179ed2_idx` (`content_type_id`,`object_pk`),
  CONSTRAINT `guardian_userobjectp_content_type_id_2e892405_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `guardian_userobjectp_permission_id_71807bfc_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `guardian_userobjectpermission_user_id_d5c1e964_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardian_userobjectpermission`
--

LOCK TABLES `guardian_userobjectpermission` WRITE;
/*!40000 ALTER TABLE `guardian_userobjectpermission` DISABLE KEYS */;
INSERT INTO `guardian_userobjectpermission` VALUES (6,'1',15,60,75);
/*!40000 ALTER TABLE `guardian_userobjectpermission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-24 16:16:56
