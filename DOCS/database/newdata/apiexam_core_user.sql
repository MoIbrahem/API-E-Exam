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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user`
--

LOCK TABLES `core_user` WRITE;
/*!40000 ALTER TABLE `core_user` DISABLE KEYS */;
INSERT INTO `core_user` VALUES (2,'pbkdf2_sha256$320000$XMd7ykKZBpyqGp4T7sobAS$S8JMCr6ivKHPK4RsWkHLOlLVt9oYNM6NKaL68CtJI5k=','2022-05-24 16:55:26.364866',1,'admin','','',1,1,'2022-04-13 09:04:53.508358','admin@mail.com',NULL),(3,'pbkdf2_sha256$320000$wWMwAUcfcxyJkgWQascQYS$tbzr8J0llhql5KoOgydavtamD5GQLfNz/JuruOZMitw=',NULL,0,'newuser','new2','user1',0,1,'2022-04-14 03:53:13.704205','newus11er@mail.com',NULL),(4,'pbkdf2_sha256$320000$WE5Jbj9JoXClKGZd3ohYRw$csZOReZU6tBp8XXFJYxCYFCcI4iTE/GMPKuNGPM2Z34=','2022-04-21 13:59:12.844348',0,'prof1','professor','math',1,1,'2022-04-21 13:52:17.000000','prof@mail.com',NULL),(6,'pbkdf2_sha256$320000$4fQkniOvBSiHhIXizbkVHk$TsHCjSc4L9EwTPDTxnTn479XlRgz2evgFfYRgB/Vv1M=',NULL,0,'newestuser','newest','user',0,1,'2022-04-25 11:44:48.463282','newestuser@mail.com',NULL),(21,'pbkdf2_sha256$320000$Anm1aRawEzXYN5wT4eOocA$R8ofTnu3OtlL2toORaJLiTr5vFuhg/sF9FY75uDH/sA=',NULL,0,'newuser2','new','user2',0,1,'2022-04-28 09:41:20.231084','newuser2@mail.com','STD'),(33,'pbkdf2_sha256$320000$xhJlhF5b3LSXexDOH2FApy$R5+78QsxF4gTpMMRs/pMYfcpcje/Y0n4fvbVTK1pOzc=',NULL,0,'m1','m1','m1',0,1,'2022-05-06 22:05:58.266485','m1@mail.com','STD'),(35,'pbkdf2_sha256$320000$Fhp7vbQNj6iWF2EwQomCjq$FO3SkNahZpaYZKmwLe5qDseAE4JjyTR6uyWjtrdTRaY=',NULL,0,'m2','m2','m3',0,1,'2022-05-06 22:11:09.146566','m2@mail.com','STD'),(38,'pbkdf2_sha256$320000$pYvbJOkKOmmp2OTWUUbf41$Qto5s+hXFl/wLViYgCmBP3OMdd254wpwnwZQAq+p5xI=','2022-05-21 07:40:24.365731',0,'moibrahem','Mohamed','Ibrahem',0,1,'2022-05-07 03:42:36.327630','mh18399@gmail.com','STD'),(39,'pbkdf2_sha256$320000$iWgv9ae0poLwqDAqGfksUe$KByw+LBwI2d3He031+vrRcDMZ306UOwDDDkE5k2WMu0=',NULL,0,'moibrahem1','Mohamed','Ibrahem',0,1,'2022-05-07 03:49:26.083289','mh1839901@gmail.com','STD'),(40,'pbkdf2_sha256$320000$Iddu0zLVdEmxS0X1GizIeZ$XHuwQ+Phw8Eeg//efSxYbzdFK4hmfDPqj/M0RfWJgE4=',NULL,0,'mo2','momo','toto',0,1,'2022-05-07 05:43:19.480779','mail@mail.com','STD'),(41,'pbkdf2_sha256$320000$NnjzuDqpO0NAI6UhBtWVap$cDgJMgAVM9YR9Yz+LpS83i6UWp+k1vx2Hys33MrI9hU=',NULL,0,'username1','firstname','lastname',0,1,'2022-05-09 18:00:24.177846','mai522222l@mail.com','STD'),(42,'pbkdf2_sha256$320000$9W8sk9m9Auylrh4wHP6Hom$dNQAAeJ8HHHU0nohs/15qtTWpyaqXFzyXWxxxmx17O8=',NULL,0,'m455','m4','m5',0,1,'2022-05-09 18:09:27.482269','m4545@mail.com','STD'),(43,'pbkdf2_sha256$320000$1xhtnUljwY5s6TxeA2A33I$ekYwRCXZiLYEzfDOZktaQBJ1YC1kTVDKc9PRQTGyDNE=',NULL,0,'newuser123222','memo','meme',0,1,'2022-05-10 03:17:31.072305','mail1225533@mail.com','STD'),(44,'pbkdf2_sha256$320000$AXPgRg3KhrAwfUJr4xkZCy$kVqEtg9HJDHMlOoF0yzkbSiBEqgy3pcdw2pYfdrL8ks=',NULL,0,'newestaaaaaa','vbnm,.','asda',0,1,'2022-05-16 00:20:16.146016','mdasmdasdma@mail.com','STD'),(45,'pbkdf2_sha256$320000$6A0Ew7XfFCI5yPSs1icDIe$w/tmXDjrvOBQ2g95cTCA7bYHchhMQ52m3wXqjMSCk5E=',NULL,0,'asdsadada','agdahshds','dadadsd',0,1,'2022-05-16 00:33:35.675851','dasdada@mail.com','STD'),(46,'pbkdf2_sha256$320000$YvpKINjHWcV3nRV9KoSJ8R$zEoek5QrWEPr86R1J8GCMEag8Qx3tySC7eKuiRGAO28=',NULL,0,'dghhhjbbnm','adsdasd','sddad',0,1,'2022-05-16 00:50:37.814802','sadsad@mail.com','STD'),(47,'pbkdf2_sha256$320000$wI1nU49fdSdqntMEjOzzwG$pb584glTQLC+pfUzqhCuhi66Tf3J67Fjf6/J4fMsibg=',NULL,0,'adsadadwq555','dsadkkk','sda',0,1,'2022-05-16 00:59:36.468262','weqnfmenf@mail.co','STD'),(48,'pbkdf2_sha256$320000$pJki7V8mzvaFlEgkp2n9td$2pYbRrAG2cEwHv3Us7Ns326R8TcErtdIrQFfjXUgkFo=',NULL,0,'trialaaaal','sadadaq','dsadasdad',0,1,'2022-05-16 01:11:20.764582','asndnasdn@mail.com','STD'),(49,'pbkdf2_sha256$320000$GRsOhKlj9nxa1a9QwXstHF$XL8h01ZFx5aOfTm69JTBLV9lCbUhQBJfwW9ES6/+sz0=',NULL,0,'dasdnasnmdnm','asdada','asdada',0,1,'2022-05-16 01:26:04.848349','sadaas@mail.comss','STD'),(50,'pbkdf2_sha256$320000$QQ2Mxm2eaLwyNLPgEQuPmj$7zL1+h6hFlHx/tHp7H/K7TWVAJWgwkg+m14ObJf3bD0=',NULL,0,'dadadasduuue','adadfdsf','asdada',0,1,'2022-05-16 01:54:59.824472','asdsda@kk.com','STD'),(51,'pbkdf2_sha256$320000$rFLt6nf0DwnyonEYET43oE$W9joPa46VjbPDt7pxEoaMd//YM4R2KvcQsVsRpF+nY4=',NULL,0,'momomo222','momomo','moooa',0,1,'2022-05-16 02:04:55.957032','momomo@momo.comm','STD'),(52,'pbkdf2_sha256$320000$SWbSH1S6IXTSqhryl5wJTj$u0wt3sLd8q/gMKYZdb+77a2n6+EcspzL8v1Ow76yRbc=',NULL,0,'trioooo','trioo','trioo',0,1,'2022-05-16 02:15:00.946851','triooo@trioo.com','STD'),(53,'pbkdf2_sha256$320000$sC3uTILtpdBpqRndwxY0uX$vfdoInPb3IiNb2BxWF8CaF76ZOh0w2ehSOkQ3unbocg=',NULL,0,'ttottotoot','sad','ad',0,1,'2022-05-16 02:41:26.165651','toooo@rer.com','STD'),(54,'pbkdf2_sha256$320000$MhUr4vRZZ5ic5earjWgAre$7swFJPwoTwUw24gr4YmiGvWSjrW3k1Bwnl+26rgpF2Y=',NULL,0,'newesttrial55','adas','ada',0,1,'2022-05-16 02:44:54.753521','nnnnn@sss.com','STD'),(55,'pbkdf2_sha256$320000$t7rBdkR30JTlc9P9mOM9Uj$6cneZGrYd4x2Cj2AgzSklTFWdCsvCyMb50W3QKyI43U=',NULL,0,'trialaaaal4549444','adsd','adad',0,1,'2022-05-16 02:46:45.854941','nnnn@maadsadasil.com','STD'),(56,'pbkdf2_sha256$320000$5acSprexrYuE5joKtcoGLP$oCPM7+GOgFt60BEoAMwHIyZzU9UFFbDbrycMR8B8Mk4=',NULL,0,'trialaaaal22220','ads','adas',0,1,'2022-05-16 02:52:30.474395','sdasd@afad.df','STD'),(57,'pbkdf2_sha256$320000$jseI5qXyYUF5g2jcrVhXdq$E/xQFbcC0NLNxcqigmJcz4jCOlL/m0/MAZj6X0hIa5Y=',NULL,0,'trioooo22200','assaasww','sad',0,1,'2022-05-16 02:54:54.330922','rtrr@ddd.ff','STD'),(58,'pbkdf2_sha256$320000$qINhRnneFHi6CmMIsVdLx5$7mfU3TaxAQICeLKDAkvfKkx8b5w5py9M5OUjgC8yhEI=',NULL,0,'jbklnj','cvgbhj','cvbnm,',0,1,'2022-05-16 03:14:19.112464','wertyuio@mm.ll','STD'),(59,'pbkdf2_sha256$320000$PAyBRlm3HGZYA9fcxT3gUT$dCmPmFamQHEhOTDqEnc7SJnYUJdOOrOGY6TQ5hD1ZCo=',NULL,0,'dddddddddaa','fsf','adadw',0,1,'2022-05-16 03:17:11.536869','add@kk.dd','STD'),(60,'pbkdf2_sha256$320000$PYwmZlOpvHiQuTiZyHwFbm$aJxIjNMGhOcrbRniiiZbqJaCgOB42zeXVVGnmlO+u2M=',NULL,0,'cassdihdj','aa','ww',0,1,'2022-05-16 03:22:10.470479','sdas@dd.com','STD'),(61,'pbkdf2_sha256$320000$9Jhvl03ZSIcSDoAxLLJPqq$yO02S9QyRQGocivRm7cKGMMNzaJv32QkcF+YHjIYjok=',NULL,0,'newestentry1101','das','qre',0,1,'2022-05-16 03:33:14.260791','das@dds.fdsa','STD'),(62,'pbkdf2_sha256$320000$u7abRsA9aO0NL8cGCPndJH$uR/AvLhdjbUChTwAsonZsDBMd9jTAV7yLBbMt8QlpG0=',NULL,0,'newestuser123','asdd','www',0,1,'2022-05-16 04:16:55.371314','asd@sda.sa','STD'),(63,'pbkdf2_sha256$320000$5dQi07BRuefVQ1nIe9Mgob$goPzFGzzLfuyCdk06jJCYAK9Yr9Qa6OK0Yq/n5JtgVQ=',NULL,0,'asdad122','sdad','asdd',0,1,'2022-05-16 04:19:06.609274','sadad@rtyuio.ghjkl','STD'),(64,'pbkdf2_sha256$320000$XMwPeNxKnhPnFmvYRQu2hn$gXDUXAACGDbNc8/5Igsphoh3aJTFh36NxuGqcQUXjrQ=',NULL,0,'adsfasd','adda','wdq',0,1,'2022-05-16 04:22:34.954801','adsadsda@maa.ss','STD'),(65,'pbkdf2_sha256$320000$0zXTRbeXgMuYTQeFZna5oh$xUN0L4vBa0leZbnToiRZUYB0XSb+pM76A6Wmp3ltHeY=',NULL,0,'adaasdq','dsaqwd','dad',0,1,'2022-05-16 04:25:32.020449','cxcxcsawq@dsa.caa','STD'),(66,'pbkdf2_sha256$320000$Q8otUet8njdbunaEAMME1w$SvkVxv8FQu3s5HgckObHdyWFaqaPGDnzoFts09TQIb0=',NULL,0,'adsadasd','adsd','gfg',0,1,'2022-05-16 04:27:47.324100','sdad@afsf.fds','STD'),(67,'pbkdf2_sha256$320000$snUyvYqmnmYiHinrx07nmU$MJw7OjL9IfZu82h+s/PMJqrpr+lxo7auYfNQAqDfvBk=',NULL,0,'sdasdaaaa','adadw','adsdw',0,1,'2022-05-16 04:33:16.436610','adsad@dasdsa.cssa','STD'),(68,'pbkdf2_sha256$320000$cH62DqVkObKAxQvctWTcpH$M+SMTf9snBX9lJpM4IQrhQZklK/Z/RfL/7pgXpBOG5k=',NULL,0,'adsadaadsww','ads','kjnio',0,1,'2022-05-16 04:34:46.908616','adsada@dadsadw.com','STD'),(69,'pbkdf2_sha256$320000$UKmOwl79hhP2FP2Hzw5176$rj8VbiiCx4EQFgnb+nWU2q/Ilc+tGLFJtMa4d337VgI=',NULL,0,'adqwdmm','adwj','kljjh',0,1,'2022-05-16 04:36:17.870445','dadsdw@sdda.hjkl','STD'),(70,'pbkdf2_sha256$320000$noXpD26oClJYVfJQgxuGdY$3/U1N4apN7FMRp6MTTRVuqY02Brfkx62zqVtSnpuCi8=',NULL,0,'dadashui','yuio','tyuio',0,1,'2022-05-16 04:38:33.997889','hjgjk@dew.iop','STD'),(71,'pbkdf2_sha256$320000$nrWyETfD3FXKlGo1ZwvT51$aZDrH+j9e5JeByTuQOYxpo5kllbFiMkotnMOxnOsE6g=',NULL,0,'jjhkjkh','sadih','iiuoui',0,1,'2022-05-16 04:40:06.825519','jkljkljl@jkjf.ouio','STD'),(72,'pbkdf2_sha256$320000$hTYapxTTC2EsYjuG86VydU$uEfov6P1w9AnkAEEjaVCAJdNtcE4THv9HUFoqAES4yc=',NULL,0,'prof5','prof','5s',1,1,'2022-05-21 03:08:55.000000','prof5@nn.ddd','PRF'),(73,'pbkdf2_sha256$320000$eNZXeUSX2bAu5dVELjTjwb$mYud3zNiGWhuVXSzOpyC2NJqVk2wtxLBdCpW6zcE5vM=',NULL,0,'prof6','prof','6s',0,1,'2022-05-21 06:54:45.274982','ad@sads.com','PRF'),(74,'pbkdf2_sha256$320000$yWSjlArCleqTqjHiA154nn$fuxDLBzUeS7OtfhGgqVfJepC3yPKMWYi7+wFpaolIss=',NULL,0,'prof7','prof','7',0,1,'2022-05-21 06:57:18.176997','czcxz@dfs.fdsfdf','PRF'),(75,'pbkdf2_sha256$320000$9LbwyU27lJG6XLV1E9zUIo$+egciV31wE/JmQTYwtEJ0GWcv0BTXfXdN27n8WzhDjQ=','2022-05-24 14:09:46.529681',0,'prof10','prof','10',1,1,'2022-05-24 01:59:24.000000','prof100000@mail.com','PRF'),(76,'!6Sg5MtoJIlTT98OvrGO0DJwHD8OAwT6RNnDayAlw',NULL,0,'AnonymousUser','','',0,1,'2022-05-24 03:09:50.238708','',NULL),(77,'pbkdf2_sha256$320000$vYO5EF8RZwPdQDD6HwH9K3$Uth5udC+UvnhBeev7M1oZazejrMtkLEcrpg1fABt9Ro=','2022-05-24 15:49:46.031333',0,'dr','Mohammed','Adel',1,1,'2022-05-24 15:44:52.000000','dr@gmail.com','PRF'),(78,'pbkdf2_sha256$320000$lqBBTFy9CmwnYG3Nz36LPw$Ver8pRcJjK8Ecsr0U+OwejoHivYTz/Vm9eT/NCmQPsA=',NULL,0,'mo','Mohammed','Adel',0,1,'2022-05-24 19:32:11.205963','mo@gmail.com','STD');
/*!40000 ALTER TABLE `core_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-24 22:11:50
