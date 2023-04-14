-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: django_inscripciones
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add tutor',7,'add_tutor'),(26,'Can change tutor',7,'change_tutor'),(27,'Can delete tutor',7,'delete_tutor'),(28,'Can view tutor',7,'view_tutor'),(29,'Can add inscripto',8,'add_inscripto'),(30,'Can change inscripto',8,'change_inscripto'),(31,'Can delete inscripto',8,'delete_inscripto'),(32,'Can view inscripto',8,'view_inscripto'),(33,'Can add ingreso persona',9,'add_ingresopersona'),(34,'Can change ingreso persona',9,'change_ingresopersona'),(35,'Can delete ingreso persona',9,'delete_ingresopersona'),(36,'Can view ingreso persona',9,'view_ingresopersona'),(37,'Can add docente',10,'add_docente'),(38,'Can change docente',10,'change_docente'),(39,'Can delete docente',10,'delete_docente'),(40,'Can view docente',10,'view_docente'),(41,'Can add alumno',11,'add_alumno'),(42,'Can change alumno',11,'change_alumno'),(43,'Can delete alumno',11,'delete_alumno'),(44,'Can view alumno',11,'view_alumno'),(45,'Can add categoria',12,'add_categoria'),(46,'Can change categoria',12,'change_categoria'),(47,'Can delete categoria',12,'delete_categoria'),(48,'Can view categoria',12,'view_categoria'),(49,'Can add curso',13,'add_curso'),(50,'Can change curso',13,'change_curso'),(51,'Can delete curso',13,'delete_curso'),(52,'Can view curso',13,'view_curso'),(53,'Can add proyecto',14,'add_proyecto'),(54,'Can change proyecto',14,'change_proyecto'),(55,'Can delete proyecto',14,'delete_proyecto'),(56,'Can view proyecto',14,'view_proyecto'),(57,'Can add inscripcion',15,'add_inscripcion'),(58,'Can change inscripcion',15,'change_inscripcion'),(59,'Can delete inscripcion',15,'delete_inscripcion'),(60,'Can view inscripcion',15,'view_inscripcion');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$Mq156qbi6Gstb3QTmcUEzh$0+ACHKxop9j+UeWd5fzbog8FVCK9EREjafn2gjjImDI=','2023-04-14 03:09:51.529494',1,'admin','','','admin@caba.gov.ar',1,1,'2023-04-10 14:54:39.694175'),(9,'pbkdf2_sha256$390000$JJ3bKUxqBPsFZYZazzj17h$6kQUQgTTpa+Z1B8xgLSzk8MdV9Kk6FNrcDKVbZgzPGQ=','2023-04-14 01:49:04.240339',0,'DocenteUno','Docente','Uno','DocenteUno@caba.gob.ar',0,1,'2023-04-10 15:41:43.000000'),(10,'pbkdf2_sha256$390000$PmF23Pbm3kZWz1mGuSO7t5$ojovqxhFf1q8W2pHjfkwS6nB8YoPO2BczcytuhX1xWw=','2023-04-14 01:47:49.340538',0,'DocenteDos','','','DocenteDos@caba.gob.ar',0,1,'2023-04-10 16:18:19.162642'),(11,'pbkdf2_sha256$390000$JRHZojEjo34pzS17be7TOm$iPa1fJIdGbJiGwCruDAdNPIbSZmdg2RqsfMshW010ms=','2023-04-10 16:19:04.919912',0,'DocenteTres','','','DocenteTres@caba.gov.ar',0,1,'2023-04-10 16:19:04.107012'),(18,'pbkdf2_sha256$390000$LGfkXNQ5jkWMYOkIkbkQYP$d0pbHYTGNIA8/wjGqEKnu5nPd2H9NVMHEGSgtJ76GtM=','2023-04-13 22:27:57.802100',0,'IngresanteUno','Ingresante','Uno','IngresanteUno@caba.gov.ar',0,1,'2023-04-11 13:08:07.000000'),(19,'pbkdf2_sha256$390000$k9r9FQuQNDyrLs4csHM7sU$fCeJsKaaPJFYjGluNydmr203z8NPVh2EwcEwb9LMfRM=','2023-04-13 21:42:05.032566',0,'IngresanteDos','','','IngresanteDos@caba.gov.ar',0,1,'2023-04-11 22:09:58.821637'),(20,'pbkdf2_sha256$390000$FXbxuxDA2526cRvtuHyh33$UFj4cGYkCYFFdx8q2LEUdciiCN2rwGu8XYT8/1aW0ek=','2023-04-13 17:25:38.277147',0,'IngresanteTres','','','IngresanteTres@caba.gov.ar',0,1,'2023-04-12 00:51:28.105809'),(21,'pbkdf2_sha256$390000$cS0egUNUILbJsb399ibgEA$bSEluGVCgj2YIH2hYE5rKwZf75NXbKXkBDHMoV4EZdA=','2023-04-13 17:39:18.263014',0,'IngresanteCuatro','','','IngresanteCuatro@caba.gov.ar',0,1,'2023-04-12 00:58:01.700995'),(22,'pbkdf2_sha256$390000$XaS5WGvBVuX6AsFzQ7qC2f$ipohhLkrS3lceoXP+tY+UBTw6AKKHSZ8lRLhkFYFggw=','2023-04-13 17:42:47.549257',0,'IngresanteCinco','','','IngresanteCinco@caba',0,1,'2023-04-13 17:42:11.876866'),(23,'pbkdf2_sha256$390000$232tlxI46BsCP3dXKC2Fzw$Ogy5Uj0l2BmUKV0lg8/b0RMg2D0h7qHb6IGnQpkWHo0=','2023-04-13 17:45:52.238133',0,'IngresanteSeis','','','IngresanteSeis@caba.gov.ar',0,1,'2023-04-13 17:45:51.401440'),(24,'pbkdf2_sha256$390000$uZwMfkRxDA5dsynAkXYffB$VA211INXcesmdwAOpsetrvL0NnIWi2l2udysyrKGX5o=','2023-04-13 17:47:33.245524',0,'IngresanteSiete','','','IngresanteSiete@caba.gov.ar',0,1,'2023-04-13 17:47:32.337292'),(25,'pbkdf2_sha256$390000$YBox3QcMvnJqW4STG13HJs$E0sgS6LOphagrbWf8PO6topVECIlnYie2SfSf/fFeuE=','2023-04-14 01:39:13.612543',0,'IngresanteOcho','','','IngresanteOcho@caba',0,1,'2023-04-13 18:17:50.321229'),(30,'pbkdf2_sha256$390000$rKVDVtx1MKWHoyhBPoYy2J$Q//Y3pQriKcdqxbGSrb4v80jmxBntU7OnlboQUR3c0M=','2023-04-14 01:46:20.477152',0,'IngresanteDiez','','','IngresanteDiez',0,1,'2023-04-14 01:46:18.008586');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-04-10 14:59:13.177739','1','Full Stack Desarrollo Web',1,'[{\"added\": {}}]',12,1),(2,'2023-04-10 15:00:10.293894','2','Testing Automatizado',1,'[{\"added\": {}}]',12,1),(3,'2023-04-10 15:00:45.506612','3','Diseño UX/UI',1,'[{\"added\": {}}]',12,1),(4,'2023-04-10 15:01:22.103469','4','Big Data / Análisis de Datos',1,'[{\"added\": {}}]',12,1),(5,'2023-04-10 15:01:37.921383','2','Testing Automatizado',2,'[{\"changed\": {\"fields\": [\"Descripcion\"]}}]',12,1),(6,'2023-04-10 15:09:24.848189','2','DocenteUno',3,'',4,1),(7,'2023-04-10 15:33:08.603143','3','AlumnoUno',3,'',4,1),(8,'2023-04-10 15:42:29.762525','1','Docente @DocenteUno',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',10,1),(9,'2023-04-10 16:16:42.080696','1','Codo a Codo - Inicial',1,'[{\"added\": {}}]',13,1),(10,'2023-04-10 16:20:04.045961','2','Python',1,'[{\"added\": {}}]',13,1),(11,'2023-04-10 16:20:47.164790','3','JAVA',1,'[{\"added\": {}}]',13,1),(12,'2023-04-10 16:21:54.113397','4','Desarrollo Web',1,'[{\"added\": {}}]',13,1),(13,'2023-04-10 16:22:34.536523','5','PHP',1,'[{\"added\": {}}]',13,1),(14,'2023-04-10 16:23:19.687782','6','Testing Automatizado',1,'[{\"added\": {}}]',13,1),(15,'2023-04-10 16:24:15.895912','7','Diseño UX/UI',1,'[{\"added\": {}}]',13,1),(16,'2023-04-10 16:24:55.019945','8','Big Data / Análisis de Datos',1,'[{\"added\": {}}]',13,1),(17,'2023-04-10 16:25:49.031814','8','Big Data / Análisis de Datos',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',13,1),(18,'2023-04-10 16:26:12.177982','7','Diseño UX/UI',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',13,1),(19,'2023-04-10 16:26:21.842499','6','Testing Automatizado',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',13,1),(20,'2023-04-10 16:27:34.815538','5','PHP',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',13,1),(21,'2023-04-10 16:28:34.893384','4','Desarrollo Web',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',13,1),(22,'2023-04-10 16:29:14.734394','3','JAVA',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',13,1),(23,'2023-04-10 16:29:49.028489','2','Python',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',13,1),(24,'2023-04-10 16:31:10.563815','2','Docente @DocenteDos',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',10,1),(25,'2023-04-10 16:31:18.549280','3','Docente @DocenteTres',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',10,1),(26,'2023-04-10 17:53:41.657539','9','DocenteUno',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(27,'2023-04-11 18:22:26.573597','1','Alumno @AlumnoUno',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',11,1),(28,'2023-04-11 19:16:08.996543','8','AlumnoUno',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(29,'2023-04-11 19:16:47.712026','18','IngresanteUno',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(30,'2023-04-11 21:59:49.471090','1','Alumno @AlumnoUno',3,'',11,1),(31,'2023-04-12 00:54:25.045647','2','Ingreso @IngresanteDos',3,'',9,1),(32,'2023-04-12 00:54:32.913009','1','Ingreso @IngresanteUno',3,'',9,1),(33,'2023-04-12 00:56:27.556169','8','AlumnoUno',3,'',4,1),(34,'2023-04-13 13:30:34.095510','1','Alumno @IngresanteUno - Codo a Codo - Inicial',1,'[{\"added\": {}}]',15,1),(35,'2023-04-13 13:30:43.834519','2','Alumno @IngresanteDos - Codo a Codo - Inicial',1,'[{\"added\": {}}]',15,1),(36,'2023-04-13 16:45:34.017709','4','Alumno @IngresanteTres',1,'[{\"added\": {}}]',11,1),(37,'2023-04-13 16:46:46.628707','5','Alumno @IngresanteCuatro',1,'[{\"added\": {}}]',11,1),(38,'2023-04-13 16:48:42.853671','3','Alumno @IngresanteTres - Testing Automatizado',1,'[{\"added\": {}}]',15,1),(39,'2023-04-13 16:49:00.685769','4','Alumno @IngresanteCuatro - Big Data / Análisis de Datos',1,'[{\"added\": {}}]',15,1),(40,'2023-04-13 16:49:45.600751','5','Alumno @IngresanteCuatro - Desarrollo Web',1,'[{\"added\": {}}]',15,1),(41,'2023-04-13 18:31:17.221152','2','Alumno @IngresanteUno',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',11,1),(42,'2023-04-13 18:40:51.581631','26','Sole',3,'',4,1),(43,'2023-04-13 18:44:13.870998','27','Sole',3,'',4,1),(44,'2023-04-13 18:46:24.681965','28','Sole',3,'',4,1),(45,'2023-04-13 18:46:35.060357','29','Valen',3,'',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(12,'gestion_cursos','categoria'),(13,'gestion_cursos','curso'),(15,'gestion_cursos','inscripcion'),(14,'gestion_cursos','proyecto'),(11,'gestion_personas','alumno'),(10,'gestion_personas','docente'),(9,'gestion_personas','ingresopersona'),(8,'gestion_personas','inscripto'),(7,'gestion_personas','tutor'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-04-10 14:50:03.414595'),(2,'auth','0001_initial','2023-04-10 14:50:11.389055'),(3,'admin','0001_initial','2023-04-10 14:50:12.986243'),(4,'admin','0002_logentry_remove_auto_add','2023-04-10 14:50:13.038852'),(5,'admin','0003_logentry_add_action_flag_choices','2023-04-10 14:50:13.094857'),(6,'contenttypes','0002_remove_content_type_name','2023-04-10 14:50:13.926079'),(7,'auth','0002_alter_permission_name_max_length','2023-04-10 14:50:14.899969'),(8,'auth','0003_alter_user_email_max_length','2023-04-10 14:50:15.068002'),(9,'auth','0004_alter_user_username_opts','2023-04-10 14:50:15.141642'),(10,'auth','0005_alter_user_last_login_null','2023-04-10 14:50:15.636580'),(11,'auth','0006_require_contenttypes_0002','2023-04-10 14:50:15.706985'),(12,'auth','0007_alter_validators_add_error_messages','2023-04-10 14:50:15.781111'),(13,'auth','0008_alter_user_username_max_length','2023-04-10 14:50:15.948428'),(14,'auth','0009_alter_user_last_name_max_length','2023-04-10 14:50:16.081115'),(15,'auth','0010_alter_group_name_max_length','2023-04-10 14:50:16.216529'),(16,'auth','0011_update_proxy_permissions','2023-04-10 14:50:16.308243'),(17,'auth','0012_alter_user_first_name_max_length','2023-04-10 14:50:16.414237'),(18,'gestion_personas','0001_initial','2023-04-10 14:50:22.347903'),(19,'gestion_cursos','0001_initial','2023-04-10 14:50:31.216888'),(20,'sessions','0001_initial','2023-04-10 14:50:32.119663'),(21,'gestion_personas','0002_alumno_rol_docente_rol_ingresopersona_rol_and_more','2023-04-10 15:30:30.293179'),(22,'gestion_personas','0003_alumno_facebook_alumno_about_alumno_address_and_more','2023-04-11 21:54:53.588398'),(23,'gestion_personas','0004_rename_firstname_alumno_apellido_and_more','2023-04-11 22:05:07.219556'),(24,'gestion_personas','0005_rename_facebook_alumno_facebook','2023-04-11 22:06:22.584486');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('46dankt01mhqaogyq7bj7itmtvgmnga1','e30:1pmEin:SWp66FV8_sWas_9KBtmnR7Cv-iwgH273GKP0-3zB-Kc','2023-04-25 14:11:45.054339'),('5ezlvglyfr80ih3z0te7u0lyouv207am','e30:1pmDyZ:A-P4xBR5giZN7Bh4nx2TSg2XRL6Myh7QYyLd-QA90io','2023-04-25 13:23:59.184346'),('5nvltdri44w5skqz0yvws3kmoqk3ei6o','e30:1pn0aa:aRehx5YbPemd3fIC_dgNczhYchUVb9fOEuj0R1QpLKc','2023-04-27 17:18:28.311622'),('6k2byxq16oekbvy8ep7qpgk3fxy8pxru','e30:1pmHIK:sRefFA6NqUA0EbqnaAC9W71hfbqsdK2BgydkI0nZQnk','2023-04-25 16:56:36.698919'),('71gsrfgv4hvthxmv33an671wm5p6kuyh','e30:1pmEEI:RMgJEJEAJGAdJKp0-Lv1SYR_wgba6YKvt08X5oxDOw4','2023-04-25 13:40:14.651774'),('730c9ynvvvbjdt06bwbps1etgg4renif','e30:1pmE8q:H-Xye2ctuh7-LvdPjVoIMVtkTFY5FTPn6tFKfRC9MNc','2023-04-25 13:34:36.642995'),('9jkfrrcagfghxxb9qlodqhfinvmsnctn','.eJxVjEEOwiAQRe_C2pAiyIBL956BDMOMVA1NSrsy3l2bdKHb_977L5VwXWpaO89pLOqsjDr8bhnpwW0D5Y7tNmma2jKPWW-K3mnX16nw87K7fwcVe_3WwYVIwRJFNgHFQj46GmJAAmE_iGMU8FA8BmtRTPGMDgTh5J1ES-r9AfSGOIY:1pmIbn:l2yynD2zvzJRd9I77AXwmbba-omz7oMgDfrm2UOHDZk','2023-04-25 18:20:47.749308'),('bltnhno3amp5jysu6jbl1g0hj1d7xh6v','e30:1plvOb:ZQRNDQa1xBh2-1hxFXsTLmMWivj8KLD1gQN1KHaY3xo','2023-04-24 17:33:37.250015'),('bsdwcwx6amfog9r9qh8ni6ld9u4wyo1e','e30:1pmGzY:D4mRt4Cn8PmA4zaARf_PnUS827_Z3rgG7RZwPEqyr44','2023-04-25 16:37:12.756527'),('cd7dec4mzghxhxi3hx5to3hj0zolnpu6','e30:1pn0MT:_bxMxh8zPgwJd8tyfKEK4uqcp_Vrk-ixEatsWN3EPgU','2023-04-27 17:03:53.573220'),('dtwex3p8204jzxmir7fvxs68v056nn5v','e30:1pmGvL:ODaAwQBdbfgSgfK_JcXVUJM6s-JVAh8py24GN46LbTI','2023-04-25 16:32:51.038355'),('dz6yvb8vk8dm4a7iwro0s30bvq5089l8','e30:1pmElJ:tlG-iId5JsQyzgxe1jLDYBKYbUJq3L9WVFoEL3NVNMY','2023-04-25 14:14:21.885695'),('eutmqfzoohsh3boe604wcs59k22fj5mu','e30:1pmEC1:36PQcafPzFZ66FdCbInfFIVCV3Gko0x_l6NIoI3frRE','2023-04-25 13:37:53.441375'),('fovqxe952a5bkhbduv4h9wqtxjag55r1','e30:1pmEoV:kcbd2bxf7A6bN5vfO56ANZLEGbHAKxsGPnE2D8h_J8E','2023-04-25 14:17:39.149097'),('gqb2kqcmhjmia3kgo3ulbos3hqk2iaor','e30:1pmHHy:3IDKYGw7YqWEglqMefauce8L85YT9mGHb8AyD2pqRAs','2023-04-25 16:56:14.461753'),('h21a646cmt3dt3w93mwxj4dy2ajfntf2','.eJxVjEEOwiAQRe_C2pAiyIBL956BDMOMVA1NSrsy3l2bdKHb_977L5VwXWpaO89pLOqsjDr8bhnpwW0D5Y7tNmma2jKPWW-K3mnX16nw87K7fwcVe_3WwYVIwRJFNgHFQj46GmJAAmE_iGMU8FA8BmtRTPGMDgTh5J1ES-r9AfSGOIY:1pmwqZ:KRyRZqJbIIU8JNJoKvy0SyC_-QbrUJ6XYNT17VMda5M','2023-04-27 13:18:43.870281'),('hucu62yjl3nwn7bgs4utdi2frimqxibu','e30:1pmEro:xMDN2cJO01AoiJ4SuWJg76vDwa5fMkQhnKMn532ZSYk','2023-04-25 14:21:04.042921'),('idvujfjpswbxb6lnl5g62gngx9qwiu1q','e30:1pmEbX:Eb2WjTl19LQP_fYLz6jP2Rl5h6EpMkcpznvp_ywAimM','2023-04-25 14:04:15.355924'),('idyzqw6m4jsdzrqaykry3owa5ef8pa2s','e30:1pmJe9:Iuj7u2tdP49TRLABZwccin0i_tAM27jzO1kMBoxyah0','2023-04-25 19:27:17.702199'),('k3w672k9w7kkcm7s73gxr2tarr0uhq7y','e30:1pmDtA:vtYIrWvQPQRC50geKNt-K9_2F83u1MvRPAPm-ADL4YE','2023-04-25 13:18:24.430234'),('kfhc2102aqobab5cv33mvw7sdxq6vr1i','e30:1pmEMR:98U7hlC8XAsRhEQ9-Oh-0FmKAO4IRBZ2AUpE2BgVItc','2023-04-25 13:48:39.960547'),('kxmdafzphv0n0c14i5acz0yzdeah6mbi','e30:1pmFnl:LtkTueHLadEfoUWfoodslq3Ezz3NOf26YWGGiEZNnNg','2023-04-25 15:20:57.123969'),('m62kqolwx1cjt09df0czw610fuqxsnha','e30:1pmJev:eoxm2gYVb-fEyiceaRecyyAKGbiEQfX6jKIpMxukBoc','2023-04-25 19:28:05.282974'),('pjyhfyjqhzohbyo8m6l8vg0fz2wuvycl','e30:1pmDtM:h7CqhZ1FY-TQAwwgeG8Ca2FLrWcTNH-aa7Kj0xfEiXc','2023-04-25 13:18:36.682979'),('qnzefzw9rqgdjetvtszbturnnuxjm685','.eJxVjEEOwiAQRe_C2pAiyIBL956BDMOMVA1NSrsy3l2bdKHb_977L5VwXWpaO89pLOqsjDr8bhnpwW0D5Y7tNmma2jKPWW-K3mnX16nw87K7fwcVe_3WwYVIwRJFNgHFQj46GmJAAmE_iGMU8FA8BmtRTPGMDgTh5J1ES-r9AfSGOIY:1pn8Uk:vJZHnD7bbusjZeZCOW60w9re6rHHvN0Heu8f2uX-BgU','2023-04-28 01:44:58.892303'),('qvvxnbhdrj2x232it5kwhczrr7oqzcte','e30:1pmEJN:odIpqir_bKEzj1PVP03THPl7eidT0IMSiAqpta4Ayb0','2023-04-25 13:45:29.043285'),('r3ikxp2btye6fl9frpmr4ugqsu0ewl8s','e30:1pmETx:19vdZUDJ8beXQosrjvq4uQbkxx1uWRY-pFAdpPG0Dng','2023-04-25 13:56:25.694098'),('rv2e423v5jmhygpyddgbtfdig4s3evso','e30:1pmEsh:GidYCbeH8Z_8wJUbYGD7nWsHh5za-JLbRM1qiAj48UU','2023-04-25 14:21:59.209237'),('t4ssrjopxc7gsg3v4votcszhvmwkeyu4','e30:1pmy91:pjSvqNCw2MbESVJp1xcgobEE7DUibVbXEPxi57vz4GY','2023-04-27 14:41:51.687457'),('tfuv45mkxpt7rorm2sysr3v9l1xr4xfs','e30:1pmEY9:oD-l0ZDbO8wBeNx9PNDClfqVM2G8WRXqGotqCOEF47Q','2023-04-25 14:00:45.315837'),('ugr9a0yga63mftilndk86ubfwnzhy6le','e30:1pmDrw:IpRq0VIg7wjqhZ1YAMvtCmNjH8PoDfkVlSmwOzKZ7k4','2023-04-25 13:17:08.471121'),('y6l6rjom9r8yslgenvxg1vp5h44pmkyt','e30:1pmEXM:6ZNFO8hZ4FfaQhlcHyfs5zysaTbi80OWCe2HhpjWKnI','2023-04-25 13:59:56.964595'),('yx0l0mflcbz2jnjpykrfhuhu7rhpw6bw','e30:1pmJca:N-EgieJhopd2Oqzo-uQVPmsi3U57X8oPhuQcpcG87lc','2023-04-25 19:25:40.215847'),('zrz8alv4u3s4m63v1ltb9kdjhiex3xsw','e30:1pmGyl:CSxZvaeQ07aDV6Cv_zTRazvcLjw_9PS80Z-iXf82wdE','2023-04-25 16:36:23.673599'),('ztktpwl53iwwzhksgl6x7fqe5ah1mspr','e30:1pmDsU:j9RV2j0FRyWJkaUFFjoWbrZ-M4KPYkecP48zW-ff4Ts','2023-04-25 13:17:42.985128');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion_cursos_categoria`
--

DROP TABLE IF EXISTS `gestion_cursos_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestion_cursos_categoria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_cursos_categoria`
--

LOCK TABLES `gestion_cursos_categoria` WRITE;
/*!40000 ALTER TABLE `gestion_cursos_categoria` DISABLE KEYS */;
INSERT INTO `gestion_cursos_categoria` VALUES (1,'Full Stack Desarrollo Web','Para quienes quieran iniciarse en la programación o deseen profundizar en las nociones centrales de uno de los lenguajes más populares en la actualidad. Aprenderás conocimientos claves del lenguaje, los beneficios del paradigma de la programación orientada a objetos y a trabajar con bases de datos relacionales. Crearás una base de datos relacional desde cero, iniciando con la generación de la estructura hasta la inserción de datos. Implementarás consultas SQL avanzadas para poder generar informes para la toma de decisiones.','categorias/course-details-tab-2.png'),(2,'Testing Automatizado','Para quienes tienen manejo de tecnologías digitales y deseen desempeñarse en un rol de evaluador/a de proyectos informáticos.','categorias/course-details-tab-1.png'),(3,'Diseño UX/UI','Para quienes que deseen aprender los fundamentos básicos del diseño orientado a la web. Poder comprender el proceso y las distintas etapas del diseño digital y adentrarse en el mundo de la experiencia centrada en el usuario.','categorias/course-details-tab-4.png'),(4,'Big Data / Análisis de Datos','Para quienes quieran aprender a extraer información de los datos. Conocerás conceptos teóricos de Big Data, tendrás prácticas en técnicas para la extracción, depuración, análisis y visualización de datos. Aprenderás a utilizar planillas de cálculo, SQL, Python, librerías especializadas para manejo de estructuras de datos, visualizaciones en informes y dashboards en diferentes plataformas (planillas de cálculo, Looker Studio y Deepnote).','categorias/course-details-tab-5.png');
/*!40000 ALTER TABLE `gestion_cursos_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion_cursos_curso`
--

DROP TABLE IF EXISTS `gestion_cursos_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestion_cursos_curso` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `photo` varchar(100) NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_cierre` date NOT NULL,
  `cupo` int(10) unsigned NOT NULL CHECK (`cupo` >= 0),
  `categoria_id` bigint(20) NOT NULL,
  `docente_titular_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gestion_cursos_curso_categoria_id_7d61ee1d_fk_gestion_c` (`categoria_id`),
  KEY `gestion_cursos_curso_docente_titular_id_ce6fdc7c_fk_gestion_p` (`docente_titular_id`),
  CONSTRAINT `gestion_cursos_curso_categoria_id_7d61ee1d_fk_gestion_c` FOREIGN KEY (`categoria_id`) REFERENCES `gestion_cursos_categoria` (`id`),
  CONSTRAINT `gestion_cursos_curso_docente_titular_id_ce6fdc7c_fk_gestion_p` FOREIGN KEY (`docente_titular_id`) REFERENCES `gestion_personas_docente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_cursos_curso`
--

LOCK TABLES `gestion_cursos_curso` WRITE;
/*!40000 ALTER TABLE `gestion_cursos_curso` DISABLE KEYS */;
INSERT INTO `gestion_cursos_curso` VALUES (1,'Codo a Codo - Inicial','Para quienes quieran iniciarse en la programación o deseen profundizar en las nociones centrales de uno de los lenguajes más populares en la actualidad. Aprenderás conocimientos claves del lenguaje, los beneficios del paradigma de la programación orientada a objetos y a trabajar con bases de datos relacionales. Crearás una base de datos relacional desde cero, iniciando con la generación de la estructura hasta la inserción de datos. Implementarás consultas SQL avanzadas para poder generar informes para la toma de decisiones.','cursos/course-1.jpg','2023-04-10 16:15:51.000000',1,'2023-05-05','2023-06-30',150,1,1),(2,'Python','Para quienes tienen una base en programación y deseen aprender unos de los lenguajes más requeridos del mercado. Aprenderás a crear un sitio web, sumergiéndote en las mejores prácticas del diseño web responsive; trabajar con HTML, CSS y Javascript. Asimismo, aprenderás a trabajar con bases de datos y podrás diseñar aplicaciones web robustas, dinámicas y escalables. Al finalizar el curso, contarás con los conocimientos para desempeñarte como Full Stack Developer en Python','cursos/python.jpg','2023-04-10 16:19:15.000000',1,'2023-06-02','2023-08-22',160,1,2),(3,'JAVA','Para quienes quieran introducirse en el mundo del desarrollo con la tecnología Java, uno de los lenguajes más requeridos por el mercado laboral. Aprenderás el desarrollo orientado a objetos con integración de base de datos. Además de crear sitios web dinámicos con HTML, CSS y JavaScript, y a trabajar con base de datos para luego integrar Front-end y Back-end mediante la tecnología Java.','cursos/java.png','2023-04-10 16:20:04.000000',1,'2023-06-23','2023-06-30',119,1,3),(4,'Desarrollo Web','Para quienes tienen algún conocimiento o experiencia en desarrollo de páginas web, y deseen complementarlo con el detrás de escena de un sitio.','cursos/desarrollo.jpg','2023-04-10 16:20:47.000000',1,'2023-04-04','2023-07-20',119,1,1),(5,'PHP','Para quienes quieran introducirse en el mundo del desarrollo con la tecnología PHP, uno de los lenguajes más versátil y flexible relacionado con Back-end, presente en el 80% de los sitios web. Aprenderás a crear páginas dinámicas con HTML, CSS y JavaScript y a trabajar con base de datos, para luego integrar Front-end y Back-end mediante la tecnología PHP.','cursos/php.png','2023-04-10 16:21:54.000000',1,'2023-04-10','2023-04-28',90,1,3),(6,'Testing Automatizado','Para quienes tienen manejo de tecnologías digitales y deseen desempeñarse en un rol de evaluador/a de proyectos informáticos.','cursos/course-3.jpg','2023-04-10 16:22:34.000000',1,'2023-04-21','2023-04-20',60,2,1),(7,'Diseño UX/UI','Para quienes que deseen aprender los fundamentos básicos del diseño orientado a la web. Poder comprender el proceso y las distintas etapas del diseño digital y adentrarse en el mundo de la experiencia centrada en el usuario.','cursos/events-1.jpg','2023-04-10 16:23:19.000000',1,'2023-04-10','2023-07-21',45,3,2),(8,'Big Data / Análisis de Datos','Para quienes quieran aprender a extraer información de los datos. Conocerás conceptos teóricos de Big Data, tendrás prácticas en técnicas para la extracción, depuración, análisis y visualización de datos. Aprenderás a utilizar planillas de cálculo, SQL, Python, librerías especializadas para manejo de estructuras de datos, visualizaciones en informes y dashboards en diferentes plataformas (planillas de cálculo, Looker Studio y Deepnote).','cursos/course-2.jpg','2023-04-10 16:24:16.000000',1,'2023-04-10','2023-07-22',160,4,3);
/*!40000 ALTER TABLE `gestion_cursos_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion_cursos_inscripcion`
--

DROP TABLE IF EXISTS `gestion_cursos_inscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestion_cursos_inscripcion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_inscripcion` datetime(6) NOT NULL,
  `aceptado` tinyint(1) NOT NULL,
  `alumno_id` bigint(20) NOT NULL,
  `curso_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gestion_cursos_inscr_alumno_id_c240dcca_fk_gestion_p` (`alumno_id`),
  KEY `gestion_cursos_inscr_curso_id_bd34f94c_fk_gestion_c` (`curso_id`),
  CONSTRAINT `gestion_cursos_inscr_alumno_id_c240dcca_fk_gestion_p` FOREIGN KEY (`alumno_id`) REFERENCES `gestion_personas_alumno` (`id`),
  CONSTRAINT `gestion_cursos_inscr_curso_id_bd34f94c_fk_gestion_c` FOREIGN KEY (`curso_id`) REFERENCES `gestion_cursos_curso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_cursos_inscripcion`
--

LOCK TABLES `gestion_cursos_inscripcion` WRITE;
/*!40000 ALTER TABLE `gestion_cursos_inscripcion` DISABLE KEYS */;
INSERT INTO `gestion_cursos_inscripcion` VALUES (1,'2023-04-13 13:30:34.052535',0,2,1),(2,'2023-04-13 13:30:43.834519',0,3,1),(3,'2023-04-13 16:48:42.833447',0,4,6),(4,'2023-04-13 16:49:00.661254',0,5,8),(5,'2023-04-13 16:49:45.558216',0,5,4);
/*!40000 ALTER TABLE `gestion_cursos_inscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion_cursos_proyecto`
--

DROP TABLE IF EXISTS `gestion_cursos_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestion_cursos_proyecto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `alumno_id` bigint(20) NOT NULL,
  `categoria_id` bigint(20) NOT NULL,
  `curso_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gestion_cursos_proye_alumno_id_585d50e9_fk_gestion_p` (`alumno_id`),
  KEY `gestion_cursos_proye_categoria_id_2e2e34ee_fk_gestion_c` (`categoria_id`),
  KEY `gestion_cursos_proye_curso_id_d4998e09_fk_gestion_c` (`curso_id`),
  CONSTRAINT `gestion_cursos_proye_alumno_id_585d50e9_fk_gestion_p` FOREIGN KEY (`alumno_id`) REFERENCES `gestion_personas_alumno` (`id`),
  CONSTRAINT `gestion_cursos_proye_categoria_id_2e2e34ee_fk_gestion_c` FOREIGN KEY (`categoria_id`) REFERENCES `gestion_cursos_categoria` (`id`),
  CONSTRAINT `gestion_cursos_proye_curso_id_d4998e09_fk_gestion_c` FOREIGN KEY (`curso_id`) REFERENCES `gestion_cursos_curso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_cursos_proyecto`
--

LOCK TABLES `gestion_cursos_proyecto` WRITE;
/*!40000 ALTER TABLE `gestion_cursos_proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestion_cursos_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion_personas_alumno`
--

DROP TABLE IF EXISTS `gestion_personas_alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestion_personas_alumno` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `photo` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `about` longtext DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `donde` varchar(100) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) NOT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `que` varchar(100) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `linkedin` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `gestion_personas_alumno_user_id_671929b7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_personas_alumno`
--

LOCK TABLES `gestion_personas_alumno` WRITE;
/*!40000 ALTER TABLE `gestion_personas_alumno` DISABLE KEYS */;
INSERT INTO `gestion_personas_alumno` VALUES (2,'alumno/testimonials-1_XgJN3OJ.jpg',18,'alumno',NULL,'Nos intersa tu historia.','1234','desde','Argentina','Uno','https://instagram.com/#','Trabajo, estudio, en casa','Ingresante','https://linkedin.com/#','(011) 486-3538 x2907','https://twitter.com/#'),(3,'defaul.jpg',19,'alumno',NULL,'Nos intersa tu historia.','222222','bbbbb','Argentina','Dos','https://instagram.com/#','Trabajo, estudio, en casa','Ingresante','https://linkedin.com/#','(011) 486-3538 x2907','https://twitter.com/#'),(4,'alumno/testimonials-2.jpg',20,'alumno','FalumnoTres','','Caba','Casa','Argentina','Tres','Ialumnotres','Trabajo','alumno','LalumnoTres','11 4251.2365','@AlumnoTres'),(5,'defaul.jpg',21,'alumno','FalumnoCuatro','','Caba','UBA','Argentina','Cuatro','IalumnoCuatro','Estudio','alumno','LalumnoCuatro','11 325 2365','@alumnoCuatro');
/*!40000 ALTER TABLE `gestion_personas_alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion_personas_docente`
--

DROP TABLE IF EXISTS `gestion_personas_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestion_personas_docente` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `photo` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `gestion_personas_docente_user_id_28a47314_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_personas_docente`
--

LOCK TABLES `gestion_personas_docente` WRITE;
/*!40000 ALTER TABLE `gestion_personas_docente` DISABLE KEYS */;
INSERT INTO `gestion_personas_docente` VALUES (1,'docentes/trainer-1.jpg',9,'docente'),(2,'docentes/trainer-2.jpg',10,'docente'),(3,'docentes/trainer-3.jpg',11,'docente');
/*!40000 ALTER TABLE `gestion_personas_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion_personas_ingresopersona`
--

DROP TABLE IF EXISTS `gestion_personas_ingresopersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestion_personas_ingresopersona` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `gestion_personas_ingresopersona_user_id_73f0b33d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_personas_ingresopersona`
--

LOCK TABLES `gestion_personas_ingresopersona` WRITE;
/*!40000 ALTER TABLE `gestion_personas_ingresopersona` DISABLE KEYS */;
INSERT INTO `gestion_personas_ingresopersona` VALUES (3,20,'ingresoPersona'),(4,21,'ingresoPersona'),(5,22,'ingresoPersona'),(6,23,'ingresoPersona'),(7,24,'ingresoPersona'),(8,25,'ingresoPersona'),(13,30,'ingresoPersona');
/*!40000 ALTER TABLE `gestion_personas_ingresopersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion_personas_inscripto`
--

DROP TABLE IF EXISTS `gestion_personas_inscripto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestion_personas_inscripto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `photo` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `gestion_personas_inscripto_user_id_762b5499_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_personas_inscripto`
--

LOCK TABLES `gestion_personas_inscripto` WRITE;
/*!40000 ALTER TABLE `gestion_personas_inscripto` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestion_personas_inscripto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion_personas_tutor`
--

DROP TABLE IF EXISTS `gestion_personas_tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestion_personas_tutor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `photo` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `gestion_personas_tutor_user_id_af0afc0a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_personas_tutor`
--

LOCK TABLES `gestion_personas_tutor` WRITE;
/*!40000 ALTER TABLE `gestion_personas_tutor` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestion_personas_tutor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-14  8:44:12
