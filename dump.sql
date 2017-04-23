-- MySQL dump 10.13  Distrib 5.5.23, for Win64 (x86)
--
-- Host: localhost    Database: rieltor
-- ------------------------------------------------------
-- Server version	5.5.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES cp1251 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `apartment`
--

DROP TABLE IF EXISTS `apartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apartment` (
  `id_apartments` int(11) NOT NULL,
  `street_name` char(20) NOT NULL,
  `house` decimal(4,0) NOT NULL,
  `room_apartment` decimal(4,0) NOT NULL,
  `tipe_plan` char(15) NOT NULL,
  `type_property` char(15) NOT NULL,
  `number_rooms` decimal(2,0) NOT NULL,
  `floor` decimal(3,0) NOT NULL,
  `floors_house` decimal(3,0) NOT NULL,
  `value_apartment` decimal(19,4) NOT NULL,
  `cost_renting` decimal(19,4) NOT NULL,
  `id_seller` int(11) NOT NULL,
  `id_landlord` int(11) NOT NULL,
  `id_district` int(11) NOT NULL,
  PRIMARY KEY (`id_apartments`),
  KEY `id_distric` (`id_district`),
  KEY `id_landlor` (`id_landlord`),
  KEY `id_seller` (`id_seller`),
  CONSTRAINT `apartmentid_distric` FOREIGN KEY (`id_district`) REFERENCES `district` (`id_district`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `apartmentid_landlor` FOREIGN KEY (`id_landlord`) REFERENCES `carowners` (`id_landlord`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `apartmentid_seller` FOREIGN KEY (`id_seller`) REFERENCES `seller` (`id_seller`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartment`
--

LOCK TABLES `apartment` WRITE;
/*!40000 ALTER TABLE `apartment` DISABLE KEYS */;
/*!40000 ALTER TABLE `apartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank` (
  `id_bank` int(11) NOT NULL AUTO_INCREMENT,
  `inn_bank` decimal(10,0) NOT NULL,
  `name` char(20) NOT NULL,
  `location` char(25) NOT NULL,
  `type_loan` char(25) NOT NULL,
  `credit_term` date NOT NULL,
  `interest_rate` decimal(2,0) NOT NULL,
  `amount_credit` decimal(19,4) NOT NULL,
  `id_buyer` int(11) NOT NULL,
  PRIMARY KEY (`id_bank`),
  UNIQUE KEY `inn_bank` (`inn_bank`),
  KEY `id_buyer` (`id_buyer`),
  CONSTRAINT `bankid_buyer` FOREIGN KEY (`id_buyer`) REFERENCES `buyer` (`id_buyer`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES (1,9450674315,'Сбербанк','Кирова 36','Ипотека','2019-11-01',14,1500000.0000,9),(2,6790364698,'ВТБ','Льва Толстого 83','Потребительский кредит','2016-09-01',22,1000000.0000,12),(3,3497306439,'Газпромбанк','Красноармейская 101','Ипотека','2018-12-01',16,300000.0000,8),(4,6797306157,'ВТБ','Советская 34а','Ипотека','2023-02-01',15,500000.0000,1),(5,5437915730,'Альфа-Банк','Ленина 80','Автокредитование','2015-05-01',17,200000.0000,11),(6,9442570619,'Сбербанк','Котовского 10','Ипотека','2020-09-01',14,1500000.0000,5),(7,3490278946,'Газпромбанк','Иркутский тракт 100','Кредитная карта','2016-12-01',26,50000.0000,8),(8,6757306187,'ВТБ','Нахимова 8','Ипотека','2016-01-01',15,600000.0000,7),(9,5467214673,'Альфа-банк','1905 года 14/1','Потребительский кредит','2018-07-01',24,300000.0000,4),(10,9473012569,'Сбербанк','Белинского 18','Автокредитование','2018-11-01',16,250000.0000,1),(11,3340679034,'Газпромбанк','1905 года 7','Ипотека','2024-12-01',15,2000000.0000,2);
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buyer` (
  `id_buyer` int(11) NOT NULL AUTO_INCREMENT,
  `surname` char(20) NOT NULL,
  `name` char(20) NOT NULL,
  `patronymic` char(20) NOT NULL,
  `date_birth` date NOT NULL,
  `place_residence` char(25) NOT NULL,
  `phone_number` decimal(11,0) NOT NULL,
  `passport_series` decimal(4,0) NOT NULL,
  `passport_number` decimal(6,0) NOT NULL,
  `issued` char(50) NOT NULL,
  `date_issue` date NOT NULL,
  PRIMARY KEY (`id_buyer`),
  UNIQUE KEY `pasport_n` (`passport_number`),
  UNIQUE KEY `surname` (`surname`,`name`,`patronymic`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer`
--

LOCK TABLES `buyer` WRITE;
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
INSERT INTO `buyer` VALUES (1,'Шубин','Богдан','Станиславович','1956-06-02','Кирова 80',89135162453,4201,646851,'Отдел УФМС по Кемеровской области','2001-07-06'),(2,'Павлов','Роман','Степанович','1988-03-15','Вершинина 32',89942461640,7008,453453,'Отдел УФМС по Томской области','2008-04-29'),(3,'Уваров','Максим','Петрович','1995-04-16','Кирова 51',89213604655,5411,267461,'Отдел УФМС по Новосибирской области','2011-04-25'),(4,'Хохлов','Илья','Глебович','1968-09-25','Учебная 46',89011349889,7009,464565,'Отдел УФМС по Томской области','2009-12-26'),(5,'Исаков','Иван','Гаврилович','1985-11-30','Тверская 51',89941246424,4215,586161,'Отдел УФМС по Кемеровской области','2015-01-09'),(6,'Кабанов','Александр','Леонидович','1965-05-29','Усова 3',89514917563,2308,664846,'Отдел УФМС по Красноярскому краю','2008-03-12'),(7,'Гущин','Павел','Федорович','1969-02-16','Герцена 68',89021797314,7003,364541,'Отдел УФМС по Томской области','2003-05-24'),(8,'Кононов','Илья','Сергеевич','1987-12-31','Советская 68',89201514664,5409,461253,'Отдел УФМС по Новосибирской области','2009-04-26'),(9,'Рожков','Антон','Степанович','1963-01-14','Учебная 40',89171273004,7006,544646,'Отдел УФМС по Томской области','2006-11-05'),(10,'Наумов','Василий','Павлович','1990-01-20','Ленина 8',89415736240,2314,464564,'Отдел УФМС по Красноярскому краю','2014-07-14'),(11,'Беспалов','Даниил','Святославович','1974-05-30','Фёдора Лыткина 12',89126415672,5405,486446,'Отдел УФМС по Новосибирской области','2005-09-06'),(12,'Королев','Никита','Ярославович','1960-02-20','Нахимова 2',89719561243,4213,456466,'Отдел УФМС по Кемеровской области','2013-08-13'),(13,'Тихонов','Олег','Васильевич','1979-06-25','Алтайская 85',89414323621,7001,614666,'Отдел УФМС по Томской области','2001-08-15');
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carowners`
--

DROP TABLE IF EXISTS `carowners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carowners` (
  `id_landlord` int(11) NOT NULL AUTO_INCREMENT,
  `surname` char(20) NOT NULL,
  `name` char(20) NOT NULL,
  `patronymic` char(20) NOT NULL,
  `date_birth` date NOT NULL,
  `place_residence` char(25) NOT NULL,
  `phone_number` decimal(11,0) NOT NULL,
  `number_title_document` decimal(13,0) NOT NULL,
  `series_passport` decimal(4,0) NOT NULL,
  `passport_number` decimal(6,0) NOT NULL,
  `issued` char(60) NOT NULL,
  `date_issue` date NOT NULL,
  PRIMARY KEY (`id_landlord`),
  UNIQUE KEY `number_tit` (`number_title_document`),
  UNIQUE KEY `pasport_nu` (`passport_number`),
  UNIQUE KEY `surname` (`surname`,`name`,`patronymic`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carowners`
--

LOCK TABLES `carowners` WRITE;
/*!40000 ALTER TABLE `carowners` DISABLE KEYS */;
INSERT INTO `carowners` VALUES (1,'Кулакова','Лариса','Викторовна','1976-12-13','Пушкина 12',89516153235,7219716766415,4215,654234,'Отдел УФМС по Кемеровской области','2015-02-15'),(2,'Устинов','Егор','Филипович','1969-11-15','Кирова 2',89423657003,8448464554878,7014,456318,'Отдел УФМС по Томской области','2014-12-08'),(3,'Осипов','Андрей','Юрьевич','1996-04-27','Лыткина 18',89753104523,8481545411551,7014,456730,'Отдел УФМС по Томской области','2014-05-15'),(4,'Купцов','Петр','Андреевич','1996-05-01','Октябрьская 15',89423067942,4864638155225,4213,406843,'Отдел УФМС по Кемеровской области','2013-02-28'),(5,'Аверин','Иван','Грегорьевич','2055-09-05','Ленина 1',89462106586,8431546791523,5486,423097,'Отдел УФМС по Новосибирской области','1986-11-30'),(6,'Власов','Александр','Иванович','1988-12-31','Нахимова 21',89236470698,6791845633751,7713,607824,'Отдел УФМС по Московской области','2013-12-02'),(7,'Иванов','Петр','Сергеевич','1974-08-08','Спортивная 11',89726413054,9764571364885,4298,864203,'Отдел УФМС по Кемеровской области','1998-07-15'),(8,'Ларионов','Юрий','Дмитреевич','1970-05-28','Тухумская 5',89421868994,5671497951751,7715,643025,'Отдел УФМС по Московской области','2015-01-17'),(9,'Прохоров','Генадий','Алексеевич','1981-11-12','Ольховая 10',89736105006,1465151461808,7013,961034,'Отдел УФМС по Томской области','2013-05-13'),(10,'Андреевская','Анна','Владленовна','1991-08-15','Киевская 12',89467921640,1579197515710,5414,946053,'Отдел УФМС по Новосибирской области','2014-09-25'),(11,'Петров','Ренат','Александрович','2061-01-02','Алтайская 12',89546794306,3476504870097,7003,657302,'Отдел УФМС по Томской области','2003-04-11'),(12,'Алексеева','Алина','Павловна','1970-05-08','Новосибирская 14',89467916064,2436158790008,7708,679314,'Отдел УФМС по Московской области','2008-04-12'),(13,'Романова','Ольга','Алексеевна','1988-01-01','Новгородская 4',89314672894,4366057954875,7007,946750,'Отдел УФМС по Томской области','2007-09-16'),(14,'Кривдюк','Наталья','Пертовна','1985-11-09','Железнодорожная 8',89136462097,1979157621544,4298,376159,'Отдел УФМС по Кемеровской области','1998-02-19'),(15,'Кравцов','Алексей','Алексеевич','1990-12-26','Высокая 37',89715616067,2174097512576,7010,679813,'Отдел УФМС по Томской области','2010-03-12'),(16,'Ланевская','Мария','Андреевна','1993-06-12','Комсомольская 85',89173216404,5917079510971,5413,548427,'Отдел УФМС по Новосибирской области','2013-07-18'),(17,'Кирилова','Анна','Дмитриевна','1989-12-08','Рабочая 32',89461736857,6417157522138,7009,376954,'Отдел УФМС по Томской области','2009-01-11'),(18,'Денисов','Владимир','Анатольевич','1966-05-01','Профсоюзная 11',89172131276,4985107107957,4211,346185,'Отдел УФМС по Кемеровской области','2011-05-02'),(19,'Дурова','Людмила','Романовна','1994-11-07','Почтовая 77',89017097432,5979507517971,7714,376950,'Отдел УФМС по Московской области','2014-11-07'),(20,'Киселев','Андрей','Викторович','1985-11-02','Киевская 83',89235136512,5570795591971,5405,725423,'Отдел УФМС по Новосибирской области','2005-12-15');
/*!40000 ALTER TABLE `carowners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id_leaseholder` int(11) NOT NULL AUTO_INCREMENT,
  `surname` char(20) NOT NULL,
  `name` char(20) NOT NULL,
  `patronymic` char(20) NOT NULL,
  `date_birth` date NOT NULL,
  `place_residence` char(25) NOT NULL,
  `phone_number` decimal(11,0) NOT NULL,
  `series_passport` decimal(4,0) NOT NULL,
  `passport_number` decimal(6,0) NOT NULL,
  `issued` char(60) NOT NULL,
  `date_issue` date NOT NULL,
  PRIMARY KEY (`id_leaseholder`),
  UNIQUE KEY `pasport_nu` (`passport_number`),
  UNIQUE KEY `surname` (`surname`,`name`,`patronymic`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Уваров','Георгий','Владимирович','1968-03-15','Усова 44а',89246046246,7013,546556,'Отдел УФМС по Томской области','2013-04-16'),(2,'Ельцин','Евгений','Николаевич','1994-05-14','Белинского 52',89412436243,5414,535153,'Отдел УФМС по Новосибирской области','2014-06-19'),(3,'Маисеев','Артем','Владиславович','1988-08-06','Фрунзе 92',89156124813,4208,533830,'Отдел УФМС по Кемеровской области','2008-08-25'),(4,'Фомичёв','Данила','Растиславович','1992-03-05','Красноармейская 31',89412421733,7012,181681,'Отдел УФМС по Томской области','2012-04-17'),(5,'Власов','Илья','Данилович','1978-04-16','Герцена 1а',89171234660,2498,641866,'Отдел УФМС по Красноярскому краю','1998-03-18'),(6,'Анисимов','Семен','Павлович','1982-12-31','Нахимова 2',89423712004,5402,840868,'Отдел УФМС по Новосибирской области','2002-04-02'),(7,'Исаев','Филип','Петрович','1991-05-15','Киевская 13',89771263404,7011,846125,'Отдел УФМС по Томской области','2011-06-06'),(8,'Федотова','Марья','Леонидовна','1990-11-19','Ленина 3',89741234067,7010,686810,'Отдел УФМС по Томской области','2010-12-16'),(9,'Александровна','Алла','Эдуардовна','1975-06-14','Плеханова 6',89712730163,4295,561586,'Отдел УФМС по Кемеровской области','1995-06-07'),(10,'Фомин','Максим','Кирилович','1991-12-12','Пушкина 21а',89712330761,5411,408670,'Отдел УФМС по Новосибирской области','2011-12-15'),(11,'Копытова','Марья','Денисовна','1995-05-06','Ленина 159',89123742017,7013,684844,'Отдел УФМС по Томской области','2013-03-16'),(12,'Самойлова','Анна','Валерьевна','1979-06-15','Говорова 19в',89714327321,4299,846016,'Отдел УФМС по Кемеровской области','1999-09-18'),(13,'Овчиников','Растислав','Петрович','1976-06-16','Сергея Лазо 3',89712763021,5406,869468,'Отдел УФМС по Новосибирской области','2006-06-17'),(14,'Наумов','Кирил','Горгиевич','1993-01-06','Ленина 258/1',89123712003,7014,486156,'Отдел УФМС по Томской области','2014-08-15'),(15,'Пестова','Елена','Андреевна','1983-01-02','Лебедева 12',89412312331,4211,486121,'Отдел УФМС по Кемеровской области','2011-01-03');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `id_district` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL,
  PRIMARY KEY (`id_district`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,'Вокзальный'),(2,'Кировский'),(3,'Ленинский'),(4,'Куйбышевский'),(5,'Октябрьский'),(6,'Советский');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notary`
--

DROP TABLE IF EXISTS `notary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notary` (
  `id_notary` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` char(60) NOT NULL,
  `location` char(25) NOT NULL,
  `sum_tariff` decimal(19,4) NOT NULL,
  `phone_number` decimal(11,0) NOT NULL,
  `id_seller` int(11) NOT NULL,
  `id_buyer` int(11) NOT NULL,
  PRIMARY KEY (`id_notary`),
  UNIQUE KEY `full_name` (`full_name`),
  KEY `id_buyer` (`id_buyer`),
  KEY `id_seller` (`id_seller`),
  CONSTRAINT `notaryid_buyer` FOREIGN KEY (`id_buyer`) REFERENCES `buyer` (`id_buyer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `notaryid_seller` FOREIGN KEY (`id_seller`) REFERENCES `seller` (`id_seller`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notary`
--

LOCK TABLES `notary` WRITE;
/*!40000 ALTER TABLE `notary` DISABLE KEYS */;
INSERT INTO `notary` VALUES (1,'Осипов Лев Николаевич','Кузнецова 6',5000.0000,89414714123,9,5),(2,'Воробьев Федор Матвеевич','Елизаровых 39',6000.0000,89241246666,3,2),(3,'Кузьмин Олег Егорович','Фрунзе 94',5500.0000,89135689416,12,1),(4,'Харитонов Иван Филипович','Учебная 34',5300.0000,89149092421,5,8),(5,'Силин Григорий Федорович','Кулёва 32',6000.0000,89126426413,12,12),(6,'Борисов Растислав Антонович','Гагарина 31',4800.0000,89522562565,11,6),(7,'Рябов Юрий Семенович','Ленина 81а',5900.0000,89124321643,8,11),(8,'Селеверстов Анатолий Алексеевич','Пушкина 32а',6500.0000,89402426423,5,8),(9,'Баранов Кирил Георгиевич','Иркутский тракт 17',7000.0000,89415466044,9,7);
/*!40000 ALTER TABLE `notary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realtor`
--

DROP TABLE IF EXISTS `realtor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realtor` (
  `id_realtor` int(11) NOT NULL AUTO_INCREMENT,
  `surname` char(20) NOT NULL,
  `name` char(20) NOT NULL,
  `patronymic` char(20) NOT NULL,
  `salary` decimal(19,4) NOT NULL,
  `phone_number` decimal(11,0) NOT NULL,
  PRIMARY KEY (`id_realtor`),
  UNIQUE KEY `surname` (`surname`,`name`,`patronymic`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realtor`
--

LOCK TABLES `realtor` WRITE;
/*!40000 ALTER TABLE `realtor` DISABLE KEYS */;
INSERT INTO `realtor` VALUES (1,'Морозов','Даниил','Генадьевич',30000.0000,89134523761),(2,'Матвеев','Леонид','Георгиевич',19000.0000,89915464155),(3,'Костин','Андрей','Тимурович',12000.0000,89546214455),(4,'Герасимов','Матвей','Русланович',23000.0000,89461354891),(5,'Исаков','Генадий','Ростиславович',19000.0000,89645723615),(6,'Тимофеев','Сергей','Георгиевич',11000.0000,89546731255),(7,'Аксёнова','Мария','Фёдоровна',16000.0000,89673051346),(8,'Силина','Алина','Михайловна',24000.0000,89672134652),(9,'Игнатов','Григорий','Генадьевич',26000.0000,89675123467),(10,'Смирнов','Леонид','Дмитриевич',31000.0000,89673125436),(11,'Ситникова','Ирина','Егоровна',25000.0000,89463025467),(12,'Горшков','Анатолий','Владимирович',18000.0000,89673205461),(13,'Зотова','Ольга','Васильевна',35000.0000,89056458097),(14,'Борисов','Иван','Витальевич',24000.0000,89675034651),(15,'Воронцов','Степан','Ильич',24000.0000,89576034506),(16,'Копылов','Ростислав','Артемович',28000.0000,89760534605),(17,'Тарасова','Наталья','Кириловна',30000.0000,89673054300),(18,'Шестакова','Ольга','Антонова',17000.0000,89761215434),(19,'Семенов','Маисей','Витальевич',15000.0000,89673613514),(20,'Петров','Артемий','Викторович',19000.0000,89761514334);
/*!40000 ALTER TABLE `realtor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller` (
  `id_seller` int(11) NOT NULL AUTO_INCREMENT,
  `surname` char(20) NOT NULL,
  `name` char(20) NOT NULL,
  `patronymic` char(20) NOT NULL,
  `dae_birth` date NOT NULL,
  `full_name_spouse` char(60) NOT NULL,
  `place_residence` char(25) NOT NULL,
  `phone_number` decimal(11,0) NOT NULL,
  `number_title_document` decimal(13,0) NOT NULL,
  `series_pasport` decimal(4,0) NOT NULL,
  `pasport_number` decimal(6,0) NOT NULL,
  `issued` char(60) NOT NULL,
  `date_issue` date NOT NULL,
  PRIMARY KEY (`id_seller`),
  UNIQUE KEY `number_tit` (`number_title_document`),
  UNIQUE KEY `pasport_nu` (`pasport_number`),
  UNIQUE KEY `surname` (`surname`,`name`,`patronymic`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Стрелкова','Инна','Денисова','1989-02-15','Стрелков Динис Данилович','Иркутский тракт 194',89154261346,1279216266424,7009,641676,'Отдел УФМС по Томской области','2009-03-18'),(2,'Евсеев','Филип','Никитич','1975-03-15','Евсеева Оксана Никитична','Рабочая 1',89413723305,6547197211334,7008,246101,'Отдел УФМС по Томской области','2008-03-25'),(3,'Селиверстов','Илья','Львович','1968-05-16','-','Сергея Лазо 10',89451342134,3514531237336,5414,135412,'Отдел УФМС по Новосибирской области','2014-05-16'),(4,'Носов','Андрей','Глебович','1969-08-09','Носова Анна Сергеевна','Советская 15',89463124616,1267123343464,7003,271266,'Отдел УФМС по Томской области','2003-01-24'),(5,'Новикова','Анна','Александровна','1978-06-14','Рябов Данил Алексеевич','Пушкина 57',89712313040,5768514686641,4298,891761,'Отдел УФМС по Кемеровской области','1998-09-18'),(6,'Соболева','Елизавета','Богданова','1990-08-12','-','Мира 3',89895671430,5981676162161,7010,546716,'Отдел УФМС по Томской области','2010-03-15'),(7,'Пестов','Петр','Светославович','1982-06-12','Пестова Светлана Филиповна','Ленина 12',89463123421,3324312343410,4203,548717,'Отдел УФМС по Кемеровской области','2003-09-18'),(8,'Афанасьев','Павел','Аркадьевич','1967-01-24','-','Савиных 15',89243204673,5219216761607,7009,564961,'Отдел УФМС по Томской области','2009-06-24'),(9,'Барисова','Эмма','Владимировна','2059-05-29','Борисов Алексей Юрьевич','Клюева 20/1',89516064071,5217616723043,7705,517661,'Отдел УФМС по Московской области','2005-01-27'),(10,'Сафонов','Владислав','Глебович','1968-04-16','-','Ленина 118',89546126713,2564137303373,5413,626762,'Отдел УФМС по Новосибирской области','2013-04-19'),(11,'Мельников','Михаил','Артемович','1965-12-31','Мельникова Оксана Олеговна','Киевская 88',89641460710,7562176676716,7011,717125,'Отдел УФМС по Томской области','2011-01-24'),(12,'Овчиникова','Любовь','Олеговна','1986-05-23','Фадеев Эдуард Аркадьевич','Смрнова 38а',89313516583,4651640455136,4206,416896,'Отдел УФМС по Кемеровской области','2006-08-31');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `id_realtor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_realtor` (`id_realtor`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_realtor`) REFERENCES `realtor` (`id_realtor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'stas_zubarev@mail.ru','$2a$10$my4Pqw0Tzj7MUFyUn7GvIOq1rWcBtqtDCDh3DCuIOR4ujSCeKC6Ji',1),(2,'zsv5832@mail.ru','$2a$10$my4Pqw0Tzj7MUFyUn7GvIOq1rWcBtqtDCDh3DCuIOR4ujSCeKC6Ji',14);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-28 23:49:19
