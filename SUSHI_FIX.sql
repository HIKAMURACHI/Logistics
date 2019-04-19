-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sushi
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `client` (
  `id_client` int(4) NOT NULL AUTO_INCREMENT,
  `name_c` varchar(30) NOT NULL,
  `surname_c` varchar(30) NOT NULL,
  `patronymic_c` varchar(30) NOT NULL,
  `date_birth` date NOT NULL,
  `tel_c` varchar(16) NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Винер','Хатмуллин','Рустамович','2001-07-20','+7(928)284-23-22'),(2,'Павликов','Владислав','Сергеевич','2001-01-20','+7(992)535-35-35'),(3,'Маркелов','Александр','Сергеевич','2000-03-18','+7(918)344-44-44'),(4,'Алексеева','Мария','Алексеевна','1999-11-20','+7(934)434-44-22'),(5,'Самарин','Михаил','Владимирович','2001-09-20','+7(956)455-45-55'),(6,'Маяков','Егор','Алексеевич','2002-12-20','+7(948)434-43-43'),(7,'Искандыров','Владислав','Алексеевич','1998-05-10','+7(918)323-33-22'),(8,'Парыгин','Евгений','Сергеевич','2001-05-20','+7(967)676-43-34'),(9,'Мартынов','Борис','Валерьевич','1986-07-23','+7(949)232-23-33'),(10,'Пивоваров','Игорь','Владимирович','2002-10-21','+7(986)434-21-54'),(11,'Роминов','Анатолий','Владимирович','1996-04-08','+7(982)434-43-67'),(12,'Иванова','Елена','Анатольевна','2002-09-20','+7(978)323-33-23'),(13,'Покатиков','Степан','Михайлович','1998-03-18','+7(967)434-55-55'),(14,'Валиев','Руслан','Марсович','1987-02-09','+7(978)434-34-43'),(15,'Кутявина','Ольга','Сергеевна','1982-11-26','+7(938)233-32-33');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composition`
--

DROP TABLE IF EXISTS `composition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `composition` (
  `id_sushi` int(4) NOT NULL,
  `id_ingr` int(4) NOT NULL,
  KEY `id_sushi` (`id_sushi`),
  KEY `id_ingr` (`id_ingr`),
  CONSTRAINT `composition_ibfk_1` FOREIGN KEY (`id_sushi`) REFERENCES `sushi` (`id_sushi`),
  CONSTRAINT `composition_ibfk_2` FOREIGN KEY (`id_ingr`) REFERENCES `ingredient` (`id_ingredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composition`
--

LOCK TABLES `composition` WRITE;
/*!40000 ALTER TABLE `composition` DISABLE KEYS */;
INSERT INTO `composition` VALUES (1,1),(2,1),(7,1),(10,1),(11,1),(17,1),(22,1),(25,1),(31,1),(33,1),(35,1),(37,1),(42,1),(6,2),(28,3),(20,4),(1,5),(45,5),(4,6),(3,7),(1,8),(2,8),(3,8),(4,8),(5,8),(7,8),(8,8),(14,8),(15,8),(17,8),(18,8),(20,8),(21,8),(24,8),(25,8),(26,8),(30,8),(37,8),(12,9),(26,9),(6,10),(26,10),(5,11),(10,11),(13,11),(14,11),(15,11),(16,11),(17,11),(19,11),(21,11),(23,11),(24,11),(25,11),(27,11),(32,11),(33,11),(36,11),(41,11),(27,12),(5,13),(15,14),(34,14),(3,15),(6,15),(10,15),(11,15),(14,15),(21,15),(28,15),(30,15),(31,15),(32,15),(38,15),(3,16),(17,17),(21,17),(23,17),(2,18),(6,18),(7,18),(9,18),(16,18),(18,18),(19,18),(22,18),(24,18),(27,18),(29,18),(33,18),(34,18),(37,18),(39,18),(43,18),(7,19),(27,19),(36,19),(27,20),(28,21),(1,22),(2,22),(3,22),(4,22),(6,22),(7,22),(8,22),(9,22),(10,22),(12,22),(13,22),(14,22),(15,22),(16,22),(17,22),(18,22),(19,22),(20,22),(21,22),(24,22),(25,22),(26,22),(28,22),(30,22),(33,22),(36,22),(38,22),(40,22),(14,23),(6,24),(14,24),(20,24),(21,24),(26,24),(38,24),(12,25),(23,25),(35,25),(36,25),(12,26),(1,27),(3,28),(4,28),(6,28),(12,28),(32,28),(35,28),(38,28),(1,29),(2,29),(3,29),(4,29),(6,29),(7,29),(8,29),(9,29),(11,29),(12,29),(13,29),(16,29),(18,29),(21,29),(22,29),(23,29),(24,29),(26,29),(27,29),(28,29),(29,29),(30,29),(31,29),(32,29),(33,29),(34,29),(36,29),(37,29),(41,29),(44,29),(3,30),(6,30),(2,31),(6,31),(12,31),(27,31),(32,31),(36,31),(38,31),(43,31),(31,32),(3,33),(12,33),(17,33),(23,33),(4,34),(11,34),(13,34),(27,34),(31,34),(36,34),(38,34),(11,35),(13,35),(28,35),(31,35),(32,35),(38,35),(23,36),(12,37),(8,38),(20,38),(26,38),(30,38),(4,39),(5,39),(10,39),(15,39),(20,39),(25,39),(26,39),(27,39),(32,40),(1,41),(24,41),(35,41);
/*!40000 ALTER TABLE `composition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ingredient` (
  `id_ingredient` int(4) NOT NULL AUTO_INCREMENT,
  `name_ing` varchar(25) NOT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'авокадо'),(2,'амой соус'),(3,'бекон'),(4,'ветчина'),(5,'водоросли чука'),(6,'грибы шиитаке терияки'),(7,'древестные грибы'),(8,'икра масаго'),(9,'картофель пай'),(10,'кинза'),(11,'краб-крем'),(12,'красный перец'),(13,'креветка тигровая'),(14,'креветки'),(15,'кунжут'),(16,'курица'),(17,'лосось терияки'),(18,'лосось'),(19,'лук зеленый'),(20,'манго'),(21,'мидии салатные'),(22,'огурец'),(23,'окунь терияки'),(24,'омлет томаго'),(25,'паприка молотая'),(26,'паприка зелень'),(27,'перец болгарский'),(28,'салат айсберг'),(29,'сливочный сыр'),(30,'соус кимчи'),(31,'спайси соус'),(32,'такуан'),(33,'томат'),(34,'угорь'),(35,'унаги соус'),(36,'фунчоза жаренная'),(37,'цыпленок жареный'),(38,'цыпленок копченный'),(39,'шеф-соус'),(40,'яичный блин'),(41,'яки соус');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_order`
--

DROP TABLE IF EXISTS `list_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `list_order` (
  `id_order` int(4) NOT NULL,
  `id_sushi` int(4) NOT NULL,
  `quantity` int(3) NOT NULL,
  KEY `id_order` (`id_order`),
  KEY `id_sushi` (`id_sushi`),
  CONSTRAINT `list_order_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`),
  CONSTRAINT `list_order_ibfk_2` FOREIGN KEY (`id_sushi`) REFERENCES `sushi` (`id_sushi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_order`
--

LOCK TABLES `list_order` WRITE;
/*!40000 ALTER TABLE `list_order` DISABLE KEYS */;
INSERT INTO `list_order` VALUES (1,2,3),(1,4,1),(1,15,1),(2,23,2),(3,45,1),(4,18,1),(4,4,2),(5,38,1),(6,27,1),(7,38,1),(7,31,2),(7,29,1),(8,2,1),(9,12,2),(10,2,1),(11,35,1),(11,18,1),(12,12,1),(13,24,1),(14,42,2),(15,27,1),(16,23,1),(17,25,1),(18,23,2),(19,22,2),(19,12,1),(20,2,1),(21,12,1),(21,14,1);
/*!40000 ALTER TABLE `list_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `id_order` int(4) NOT NULL AUTO_INCREMENT,
  `date_order` date NOT NULL,
  `delivery_street` varchar(25) NOT NULL,
  `delivery_house` varchar(7) NOT NULL,
  `delivery_flat` varchar(5) DEFAULT NULL,
  `id_worker` int(4) NOT NULL,
  `id_client` int(4) NOT NULL,
  `cost_delivery` int(5) NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `id_worker` (`id_worker`),
  KEY `id_client` (`id_client`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_worker`) REFERENCES `worker` (`id_worker`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2019-02-01','Песочная','89','3',4,8,170),(2,'2019-02-01','Цветочная','13','17',4,12,170),(3,'2019-02-01','Свободы','18','16',4,1,170),(4,'2019-02-02','Революционная','2','',5,8,190),(5,'2019-02-02','Восточная','9','1',5,5,190),(6,'2019-02-02','Ворошилова','234','76',5,12,190),(7,'2019-02-02','Ленина','89','',5,15,190),(8,'2019-02-03','Коммунаров','17','',6,6,210),(9,'2019-02-03','Почтовая','34','38',6,2,210),(10,'2019-02-03','Песочная','9','13',6,4,210),(11,'2019-02-03','Холмогорова','12','',4,8,210),(12,'2019-02-04','Трудовая','112','56',5,3,170),(13,'2019-02-05','Песочная','19','',5,11,170),(14,'2019-02-05','Холмогорова','14','28',5,10,170),(15,'2019-02-05','Союзная','28','19',5,12,170),(16,'2019-02-06','Береговая 43','8','3',6,8,170),(17,'2019-02-06','Пушкинская','43','12',6,6,170),(18,'2019-02-07','Лихвинцева','46','23',4,3,170),(19,'2019-02-07','Удмуртская 366','119','84',4,8,170),(20,'2019-02-07','Песочная','23','2',4,8,170),(21,'2019-02-07','Пушкинская','216','74',4,8,17);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payment` (
  `id_check` int(4) NOT NULL AUTO_INCREMENT,
  `data_check` date NOT NULL,
  `id_order` int(4) NOT NULL,
  `id_worker` int(4) NOT NULL,
  `vid_pay` varchar(11) NOT NULL,
  `ammout` int(5) NOT NULL,
  PRIMARY KEY (`id_check`),
  KEY `id_worker` (`id_worker`),
  KEY `id_order` (`id_order`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`id_worker`) REFERENCES `worker` (`id_worker`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'2019-02-01',1,1,'карта банка',1729),(2,'2019-02-01',2,1,'наличные',558),(3,'2019-02-02',4,2,'наличные',995),(4,'2019-02-02',5,2,'карта банка',535),(6,'2019-02-02',6,2,'наличные',435),(7,'2019-02-03',7,3,'карта банка',1478),(8,'2019-02-03',8,3,'карта банка',555),(9,'2019-02-03',9,3,'наличные',399),(10,'2019-02-04',11,1,'карта банка',586),(11,'2019-02-05',12,2,'наличные',359),(12,'2019-02-05',13,2,'наличные',447),(13,'2019-02-05',14,2,'карта банка',368),(14,'2019-02-06',16,3,'наличные',859),(15,'2019-02-07',18,1,'наличные',568),(16,'2019-02-07',19,1,'карта банка',1157),(17,'2019-02-07',20,1,'наличные',515),(18,'2019-02-07',21,1,'наличные',544);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sushi`
--

DROP TABLE IF EXISTS `sushi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sushi` (
  `id_sushi` int(4) NOT NULL AUTO_INCREMENT,
  `name_sushi` varchar(40) NOT NULL,
  `weight` int(4) NOT NULL,
  `price` int(4) NOT NULL,
  PRIMARY KEY (`id_sushi`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sushi`
--

LOCK TABLES `sushi` WRITE;
/*!40000 ALTER TABLE `sushi` DISABLE KEYS */;
INSERT INTO `sushi` VALUES (1,'Ролл Грин Тим',222,179),(2,'Ролл Океания',252,345),(3,'Ролл Тори',250,225),(4,'Ролл Угорь Шиитаки',252,289),(5,'Ролл Сочная креветка',207,247),(6,'Ролл Кин-дза-дза',217,239),(7,'Ролл Сливочный лосось',223,265),(8,'Ролл Калифорния с цыпленком',192,179),(9,'Ролл Филадельфия',209,209),(10,'Ролл Калифорния в кунжуте',202,175),(11,'Ролл Филадельфия в угре',214,335),(12,'Ролл Хайп',243,189),(13,'Ролл Престиж',154,225),(14,'Ролл Окунь терияки',207,185),(15,'Ролл Калифорния с креветкой',202,235),(16,'Ролл Браво',150,199),(17,'Ролл Калифорния с лососем',207,235),(18,'Ролл Филадельфия в масаго',192,227),(19,'Ролл Зим Зим',159,185),(20,'Ролл Пинки',237,189),(21,'Ролл Марокко',205,217),(22,'Ролл Филадельфия шеф',267,399),(23,'Ролл Фуджи',190,199),(24,'Ролл Фараон',272,277),(25,'Ролл Калифорния в масаго',207,229),(26,'Ролл Катана',323,199),(27,'Ролл Харди',223,245),(28,'Ролл Техас',234,229),(29,'Ролл Филадельфия со сливочным сыром',187,265),(30,'Ролл Фьюжн',216,187),(31,'Ролл Невада',219,339),(32,'Ролл Фиеста',203,187),(33,'Ролл Филадельфия абсолют',237,307),(34,'Ролл Филадельфия с креветками',207,313),(35,'Овощной ролл',142,149),(36,'Ролл Мадагаскар',155,225),(37,'Ролл Филадельфия шик',222,309),(38,'Ролл Унаги',219,345),(39,'Ролл с лососем',102,177),(40,'Ролл с угрем',102,199),(41,'Ролл Крабик',122,123),(42,'Ролл с авокадо',102,99),(43,'Ролл острый лосось',112,185),(44,'Ролл со сливочным сыром',102,99),(45,'Ролл с чукой',102,99);
/*!40000 ALTER TABLE `sushi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `worker` (
  `id_worker` int(4) NOT NULL AUTO_INCREMENT,
  `name_w` varchar(30) NOT NULL,
  `surname_w` varchar(30) NOT NULL,
  `patronymic_w` varchar(30) NOT NULL,
  `date_birth` date NOT NULL,
  `tel_w` varchar(16) NOT NULL,
  `status` varchar(10) NOT NULL,
  `login` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`id_worker`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1,'Андрей','Никитин','Александрович','1986-10-10','+7(908)756-36-10','Курьер','1231','qwe'),(2,'Владимир','Кирьянов','Васильевич','2000-05-21','+7(908)869-61-10','Курьер','1232','wqe1'),(3,'Илья','Ларин','Романович','1998-12-12','+7(934)986-36-11','Курьер','1233','qwer'),(4,'Анастасия','Волкова','Сергеевна','1987-06-15','+7(968)747-23-16','Менеджер','1234','1qwe2'),(5,'Анна','Липина','Витальевна','1998-04-18','+8(998)253-46-9','Менеджер','1235','wqd1'),(6,'Михаил','Прохоров','Александрович','1985-03-27','+8(961)457-24-19','Менеджер','1236','wdsc1');
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sushi'
--

--
-- Dumping routines for database 'sushi'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-19 12:03:36
