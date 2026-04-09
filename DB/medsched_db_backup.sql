CREATE DATABASE  IF NOT EXISTS `medscheddb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `medscheddb`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: medscheddb
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `bolumler`
--

DROP TABLE IF EXISTS `bolumler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bolumler` (
  `BolumId` int NOT NULL AUTO_INCREMENT,
  `BolumAdi` varchar(200) NOT NULL,
  `HastaneId` int NOT NULL,
  PRIMARY KEY (`BolumId`),
  KEY `HastaneId` (`HastaneId`),
  CONSTRAINT `bolumler_ibfk_1` FOREIGN KEY (`HastaneId`) REFERENCES `hastaneler` (`HastaneId`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bolumler`
--

LOCK TABLES `bolumler` WRITE;
/*!40000 ALTER TABLE `bolumler` DISABLE KEYS */;
INSERT INTO `bolumler` VALUES (11,'Ağız, Diş ve Çene Cerrahisi',9),(12,'Ortodonti',9),(13,'Periodontoloji',9),(14,'Endodonti',9),(15,'Pedodonti (Çocuk Diş Hekimliği)',9),(16,'Protetik Diş Tedavisi',9),(17,'Restoratif Diş Tedavisi',9),(18,'Oral Diagnoz ve Radyoloji',9),(19,'İmplantoloji',9),(20,'Estetik Diş Hekimliği',9),(21,'Ağız, Diş ve Çene Cerrahisi',10),(22,'Ortodonti',10),(23,'Periodontoloji',10),(24,'Pedodonti',10),(25,'Restoratif Diş Tedavisi',10),(26,'İmplantoloji',10),(27,'Dijital Diş Hekimliği',10),(28,'Endodonti',10),(29,'Protetik Diş Tedavisi',10),(30,'Acil Diş Polikliniği',10),(31,'Kardiyoloji',8),(32,'Göz Hastalıkları',8),(33,'Nefroloji',8),(34,'Psikiyatri',8),(35,'Ortopedi',8),(36,'Dahiliye',8),(37,'KBB',8),(38,'Fizik Tedavi',8),(39,'Gastroenteroloji',8),(40,'Çocuk Cerrahisi',8),(41,'Kalp Damar Cerrahisi',11),(42,'Nöroloji',11),(43,'Göz Hastalıkları',11),(44,'Fizik Tedavi',11),(45,'Radyoloji',11),(46,'Cildiye',11),(47,'Üroloji',11),(48,'Kadın Doğum',11),(49,'Dahiliye',11),(50,'Psikiyatri',11),(51,'Nöroloji',7),(52,'Psikiyatri',7),(53,'Genel Cerrahi',7),(54,'Dahiliye',7),(55,'Göğüs Hastalıkları',7),(56,'Cildiye',7),(57,'Acil Servis',7),(58,'Üroloji',7),(59,'Radyoloji',7),(60,'Kadın Doğum',7),(61,'KBB',6),(62,'Kadın Doğum',6),(63,'Çocuk Hastalıkları',6),(64,'Dahiliye',6),(65,'Kardiyoloji',6),(66,'Fizik Tedavi',6),(67,'Acil Servis',6),(68,'Ortopedi',6),(69,'Göz Hastalıkları',6),(70,'Endokrinoloji',6),(71,'Fizik Tedavi',5),(72,'Acil Servis',5),(73,'Dahiliye',5),(74,'Üroloji',5),(75,'Göz Hastalıkları',5),(76,'Kalp Damar Cerrahisi',5),(77,'Çocuk Cerrahisi',5),(78,'Radyoloji',5),(79,'Onkoloji',5),(80,'Nöroloji',5),(81,'Kardiyoloji',4),(82,'Cildiye',4),(83,'Nöroloji',4),(84,'Gastroenteroloji',4),(85,'Ortopedi',4),(86,'Kadın Doğum',4),(87,'Dahiliye',4),(88,'Psikiyatri',4),(89,'KBB',4),(90,'Enfeksiyon',4),(91,'Psikiyatri',3),(92,'Ortopedi',3),(93,'Dahiliye',3),(94,'Göz Hastalıkları',3),(95,'Fizik Tedavi',3),(96,'Genel Cerrahi',3),(97,'Üroloji',3),(98,'KBB',3),(99,'Ruh Sağlığı',3),(100,'Çocuk Psikiyatrisi',3),(101,'Kardiyoloji',2),(102,'Kadın Doğum',2),(103,'Çocuk Hastalıkları',2),(104,'Nefroloji',2),(105,'Enfeksiyon',2),(106,'Göğüs Hastalıkları',2),(107,'Endokrinoloji',2),(108,'Radyoloji',2),(109,'Acil Servis',2),(110,'Gastroenteroloji',2),(111,'Kardiyoloji',1),(112,'Göz Hastalıkları',1),(113,'Nöroloji',1),(114,'Ortopedi',1),(115,'Dahiliye',1),(116,'Üroloji',1),(117,'Dermatoloji',1),(118,'Psikiyatri',1),(119,'KBB',1),(120,'Fizik Tedavi',1);
/*!40000 ALTER TABLE `bolumler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doktorlar`
--

DROP TABLE IF EXISTS `doktorlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doktorlar` (
  `DoktorId` int NOT NULL AUTO_INCREMENT,
  `DoktorAdi` varchar(200) NOT NULL,
  `BolumId` int NOT NULL,
  PRIMARY KEY (`DoktorId`),
  KEY `BolumId` (`BolumId`),
  CONSTRAINT `doktorlar_ibfk_1` FOREIGN KEY (`BolumId`) REFERENCES `bolumler` (`BolumId`)
) ENGINE=InnoDB AUTO_INCREMENT=2627 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doktorlar`
--

LOCK TABLES `doktorlar` WRITE;
/*!40000 ALTER TABLE `doktorlar` DISABLE KEYS */;
INSERT INTO `doktorlar` VALUES (1527,'Dr. Alper Aksoy',11),(1528,'Dr. Berna Bilgin',11),(1529,'Dr. Cemal Can',11),(1530,'Dr. Deniz Doğan',11),(1531,'Dr. Elif Erdem',11),(1532,'Dr. Faruk Fidan',11),(1533,'Dr. Gülhan Güneş',11),(1534,'Dr. Hakan Hız',11),(1535,'Dr. Işıl Işık',11),(1536,'Dr. Jale Yıldız',11),(1537,'Dr. Kaan Kaya',12),(1538,'Dr. Leyla Lale',12),(1539,'Dr. Mert Meriç',12),(1540,'Dr. Nisa Nur',12),(1541,'Dr. Ozan Öz',12),(1542,'Dr. Pınar Pak',12),(1543,'Dr. Rıza Rüzgar',12),(1544,'Dr. Sibel Sarı',12),(1545,'Dr. Tufan Tunç',12),(1546,'Dr. Uğur Uzun',12),(1547,'Dr. Veli Vardar',13),(1548,'Dr. Yasemin Yılmaz',13),(1549,'Dr. Zeki Zorlu',13),(1550,'Dr. Ayşe Acar',13),(1551,'Dr. Bora Bayrak',13),(1552,'Dr. Ceren Caner',13),(1553,'Dr. Deniz Duran',13),(1554,'Dr. Emre Eren',13),(1555,'Dr. Funda Fidan',13),(1556,'Dr. Gökhan Güler',13),(1557,'Dr. Hande Hazar',14),(1558,'Dr. İlker İnan',14),(1559,'Dr. Jülide Jansen',14),(1560,'Dr. Kadir Kalem',14),(1561,'Dr. Lale Limon',14),(1562,'Dr. Merve Meri',14),(1563,'Dr. Nazlı Narin',14),(1564,'Dr. Onur Oran',14),(1565,'Dr. Pelin Poyraz',14),(1566,'Dr. Rüzgar Rifat',14),(1567,'Dr. Suna Sarıkaya',15),(1568,'Dr. Tarık Toprak',15),(1569,'Dr. Umut Uçar',15),(1570,'Dr. Volkan Vural',15),(1571,'Dr. Yasir Yıldırım',15),(1572,'Dr. Zeynep Zeren',15),(1573,'Dr. Aslı Aydın',15),(1574,'Dr. Berk Bayraktar',15),(1575,'Dr. Cenk Çalışkan',15),(1576,'Dr. Derya Demir',15),(1577,'Dr. Ece Ergin',16),(1578,'Dr. Fatih Fikri',16),(1579,'Dr. Gül Gürsoy',16),(1580,'Dr. Hakan Harun',16),(1581,'Dr. Işıl İnce',16),(1582,'Dr. Jale Jansen',16),(1583,'Dr. Kerem Karaca',16),(1584,'Dr. Leyla Leman',16),(1585,'Dr. Mert Mutlu',16),(1586,'Dr. Nilay Narin',16),(1587,'Dr. Onur Özdemir',17),(1588,'Dr. Pelin Polat',17),(1589,'Dr. Rıza Rıfkı',17),(1590,'Dr. Seda Sezer',17),(1591,'Dr. Tarık Topal',17),(1592,'Dr. Ufuk Uslu',17),(1593,'Dr. Volkan Veli',17),(1594,'Dr. Yasemin Yüce',17),(1595,'Dr. Zeki Ziya',17),(1596,'Dr. Ali Altan',17),(1597,'Dr. Bahar Bulut',18),(1598,'Dr. Cemal Candan',18),(1599,'Dr. Deniz Dilek',18),(1600,'Dr. Ece Erden',18),(1601,'Dr. Fatma Fidan',18),(1602,'Dr. Gökhan Gür',18),(1603,'Dr. Hakan Hazar',18),(1604,'Dr. İlker İpek',18),(1605,'Dr. Jale Jeyan',18),(1606,'Dr. Kadir Kaya',18),(1607,'Dr. Leyla Lale',19),(1608,'Dr. Mert Meriç',19),(1609,'Dr. Nisa Nur',19),(1610,'Dr. Ozan Öz',19),(1611,'Dr. Pınar Pak',19),(1612,'Dr. Rıza Rüzgar',19),(1613,'Dr. Sibel Sarı',19),(1614,'Dr. Tufan Tunç',19),(1615,'Dr. Uğur Uzun',19),(1616,'Dr. Veli Vardar',19),(1617,'Dr. Yasemin Yılmaz',20),(1618,'Dr. Zeki Zorlu',20),(1619,'Dr. Ayşe Acar',20),(1620,'Dr. Bora Bayrak',20),(1621,'Dr. Ceren Caner',20),(1622,'Dr. Deniz Duran',20),(1623,'Dr. Emre Eren',20),(1624,'Dr. Funda Fidan',20),(1625,'Dr. Gökhan Güler',20),(1626,'Dr. Hande Hazar',20),(1627,'Dr. İsmail İleri',21),(1628,'Dr. Jülide Jansen',21),(1629,'Dr. Kerem Karataş',21),(1630,'Dr. Lale Limon',21),(1631,'Dr. Merve Mutlu',21),(1632,'Dr. Nazlı Narin',21),(1633,'Dr. Onur Özcan',21),(1634,'Dr. Pelin Polat',21),(1635,'Dr. Rıza Rifat',21),(1636,'Dr. Seda Sevinç',21),(1637,'Dr. Tarık Turan',22),(1638,'Dr. Ufuk Uslu',22),(1639,'Dr. Volkan Vural',22),(1640,'Dr. Yasemin Yalçın',22),(1641,'Dr. Zeynep Zengin',22),(1642,'Dr. Aslı Arslan',22),(1643,'Dr. Berk Bulut',22),(1644,'Dr. Cenk Çelik',22),(1645,'Dr. Derya Deniz',22),(1646,'Dr. Emre Erdem',22),(1647,'Dr. Funda Fidan',23),(1648,'Dr. Gökhan Güner',23),(1649,'Dr. Hakan Harun',23),(1650,'Dr. Işıl İnci',23),(1651,'Dr. Jale Yıldız',23),(1652,'Dr. Kaan Kılıç',23),(1653,'Dr. Leyla Lale',23),(1654,'Dr. Mert Meriç',23),(1655,'Dr. Nisa Nur',23),(1656,'Dr. Ozan Öz',23),(1657,'Dr. Pınar Peker',24),(1658,'Dr. Rıza Rüzgar',24),(1659,'Dr. Sibel Sarı',24),(1660,'Dr. Tufan Tunç',24),(1661,'Dr. Uğur Uzun',24),(1662,'Dr. Veli Vardar',24),(1663,'Dr. Yasemin Yılmaz',24),(1664,'Dr. Zeki Zorlu',24),(1665,'Dr. Ayşe Acar',24),(1666,'Dr. Bora Bayrak',24),(1667,'Dr. Ceren Caner',25),(1668,'Dr. Deniz Duran',25),(1669,'Dr. Emre Eren',25),(1670,'Dr. Fatih Fidan',25),(1671,'Dr. Gül Gürsoy',25),(1672,'Dr. Hakan Hız',25),(1673,'Dr. İlker İnan',25),(1674,'Dr. Jülide Jansen',25),(1675,'Dr. Kadir Kalem',25),(1676,'Dr. Lale Leman',25),(1677,'Dr. Merve Meri',26),(1678,'Dr. Nazlı Narin',26),(1679,'Dr. Onur Oran',26),(1680,'Dr. Pelin Poyraz',26),(1681,'Dr. Rüzgar Rıfat',26),(1682,'Dr. Suna Sarıkaya',26),(1683,'Dr. Tarık Toprak',26),(1684,'Dr. Umut Uçar',26),(1685,'Dr. Volkan Veli',26),(1686,'Dr. Yasir Yıldırım',26),(1687,'Dr. Zeynep Zeren',27),(1688,'Dr. Aslı Aydın',27),(1689,'Dr. Berk Bayraktar',27),(1690,'Dr. Cenk Çalışkan',27),(1691,'Dr. Derya Demir',27),(1692,'Dr. Ece Ergin',27),(1693,'Dr. Fatih Fikri',27),(1694,'Dr. Gülhan Güneş',27),(1695,'Dr. Hande Hazar',27),(1696,'Dr. İsmail İnan',27),(1697,'Dr. Jale Jeyan',28),(1698,'Dr. Kerem Kaya',28),(1699,'Dr. Leyla Leman',28),(1700,'Dr. Mert Mutlu',28),(1701,'Dr. Nilay Narin',28),(1702,'Dr. Onur Özdemir',28),(1703,'Dr. Pelin Polat',28),(1704,'Dr. Rıza Rıfkı',28),(1705,'Dr. Seda Sezer',28),(1706,'Dr. Tarık Topal',28),(1707,'Dr. Ufuk Uslu',29),(1708,'Dr. Volkan Veli',29),(1709,'Dr. Yasemin Yüce',29),(1710,'Dr. Zeki Ziya',29),(1711,'Dr. Ali Altan',29),(1712,'Dr. Bahar Bulut',29),(1713,'Dr. Cemal Candan',29),(1714,'Dr. Deniz Dilek',29),(1715,'Dr. Ece Erden',29),(1716,'Dr. Fatma Fidan',29),(1717,'Dr. Gökhan Gür',30),(1718,'Dr. Hakan Hazar',30),(1719,'Dr. İlker İpek',30),(1720,'Dr. Jale Jansen',30),(1721,'Dr. Kadir Kaya',30),(1722,'Dr. Leyla Lale',30),(1723,'Dr. Mert Meriç',30),(1724,'Dr. Nisa Nur',30),(1725,'Dr. Ozan Öz',30),(1726,'Dr. Pınar Pak',30),(1727,'Dr. Ali Akın',31),(1728,'Dr. Banu Bilgin',31),(1729,'Dr. Cem Çelik',31),(1730,'Dr. Derya Demir',31),(1731,'Dr. Emre Erkan',31),(1732,'Dr. Funda Fidan',31),(1733,'Dr. Gökhan Güneş',31),(1734,'Dr. Hakan Hız',31),(1735,'Dr. İrem İnan',31),(1736,'Dr. Jülide Yılmaz',31),(1737,'Dr. Kaan Kaya',32),(1738,'Dr. Leyla Lale',32),(1739,'Dr. Mert Mutlu',32),(1740,'Dr. Nisa Nur',32),(1741,'Dr. Ozan Öz',32),(1742,'Dr. Pelin Polat',32),(1743,'Dr. Rıza Rıfkı',32),(1744,'Dr. Seda Sezer',32),(1745,'Dr. Tarık Topal',32),(1746,'Dr. Ufuk Uslu',32),(1747,'Dr. Volkan Vural',33),(1748,'Dr. Yasemin Yüce',33),(1749,'Dr. Zeynep Zengin',33),(1750,'Dr. Ahmet Aydın',33),(1751,'Dr. Berna Bulut',33),(1752,'Dr. Canan Can',33),(1753,'Dr. Deniz Doğan',33),(1754,'Dr. Elif Erdem',33),(1755,'Dr. Faruk Fidan',33),(1756,'Dr. Gülhan Gür',33),(1757,'Dr. Hande Hazar',34),(1758,'Dr. İlker İpek',34),(1759,'Dr. Jale Jeyan',34),(1760,'Dr. Kerem Karataş',34),(1761,'Dr. Lale Limon',34),(1762,'Dr. Merve Meriç',34),(1763,'Dr. Nazlı Narin',34),(1764,'Dr. Onur Oran',34),(1765,'Dr. Pelin Poyraz',34),(1766,'Dr. Rıza Rüzgar',34),(1767,'Dr. Sibel Sarı',35),(1768,'Dr. Tufan Tunç',35),(1769,'Dr. Uğur Uzun',35),(1770,'Dr. Veli Vardar',35),(1771,'Dr. Yasemin Yalçın',35),(1772,'Dr. Zeki Zorlu',35),(1773,'Dr. Ayşe Acar',35),(1774,'Dr. Bora Bayrak',35),(1775,'Dr. Ceren Caner',35),(1776,'Dr. Deniz Duran',35),(1777,'Dr. Emre Eren',36),(1778,'Dr. Fatih Fidan',36),(1779,'Dr. Gül Gürsoy',36),(1780,'Dr. Hakan Harun',36),(1781,'Dr. İlker İnan',36),(1782,'Dr. Jülide Jansen',36),(1783,'Dr. Kadir Kalem',36),(1784,'Dr. Lale Leman',36),(1785,'Dr. Merve Meri',36),(1786,'Dr. Nazlı Narin',36),(1787,'Dr. Onur Özcan',37),(1788,'Dr. Pelin Polat',37),(1789,'Dr. Rüzgar Rıfat',37),(1790,'Dr. Suna Sarıkaya',37),(1791,'Dr. Tarık Toprak',37),(1792,'Dr. Umut Uçar',37),(1793,'Dr. Volkan Veli',37),(1794,'Dr. Yasir Yıldırım',37),(1795,'Dr. Zeynep Zeren',37),(1796,'Dr. Aslı Aydın',37),(1797,'Dr. Berk Bayraktar',38),(1798,'Dr. Cenk Çalışkan',38),(1799,'Dr. Derya Demir',38),(1800,'Dr. Ece Ergin',38),(1801,'Dr. Fatih Fikri',38),(1802,'Dr. Gülhan Güneş',38),(1803,'Dr. Hande Hazar',38),(1804,'Dr. İsmail İnan',38),(1805,'Dr. Jale Jansen',38),(1806,'Dr. Kerem Kaya',38),(1807,'Dr. Leyla Leman',39),(1808,'Dr. Mert Meriç',39),(1809,'Dr. Nilay Narin',39),(1810,'Dr. Onur Özdemir',39),(1811,'Dr. Pelin Polat',39),(1812,'Dr. Rıza Rıfkı',39),(1813,'Dr. Seda Sezer',39),(1814,'Dr. Tarık Topal',39),(1815,'Dr. Ufuk Uslu',39),(1816,'Dr. Volkan Veli',39),(1817,'Dr. Yasemin Yüce',40),(1818,'Dr. Zeki Ziya',40),(1819,'Dr. Ali Altan',40),(1820,'Dr. Bahar Bulut',40),(1821,'Dr. Cemal Candan',40),(1822,'Dr. Deniz Dilek',40),(1823,'Dr. Ece Erden',40),(1824,'Dr. Fatma Fidan',40),(1825,'Dr. Gökhan Gür',40),(1826,'Dr. Hakan Hazar',40),(1827,'Dr. İsmail İnan',41),(1828,'Dr. Jale Jansen',41),(1829,'Dr. Kadir Kalem',41),(1830,'Dr. Lale Limon',41),(1831,'Dr. Merve Meriç',41),(1832,'Dr. Nazlı Narin',41),(1833,'Dr. Onur Oran',41),(1834,'Dr. Pelin Polat',41),(1835,'Dr. Rıza Rüzgar',41),(1836,'Dr. Seda Sarı',41),(1837,'Dr. Tarık Tunç',42),(1838,'Dr. Ufuk Uzun',42),(1839,'Dr. Volkan Vardar',42),(1840,'Dr. Yasemin Yalçın',42),(1841,'Dr. Zeki Zorlu',42),(1842,'Dr. Ali Acar',42),(1843,'Dr. Bora Bayrak',42),(1844,'Dr. Ceren Caner',42),(1845,'Dr. Deniz Duran',42),(1846,'Dr. Emre Eren',42),(1847,'Dr. Fatih Fidan',43),(1848,'Dr. Gül Gürsoy',43),(1849,'Dr. Hakan Harun',43),(1850,'Dr. İlker İnan',43),(1851,'Dr. Jülide Jansen',43),(1852,'Dr. Kadir Kaya',43),(1853,'Dr. Lale Leman',43),(1854,'Dr. Merve Meriç',43),(1855,'Dr. Nazlı Narin',43),(1856,'Dr. Onur Özcan',43),(1857,'Dr. Pelin Polat',44),(1858,'Dr. Rüzgar Rıfat',44),(1859,'Dr. Suna Sarıkaya',44),(1860,'Dr. Tarık Toprak',44),(1861,'Dr. Umut Uçar',44),(1862,'Dr. Volkan Veli',44),(1863,'Dr. Yasir Yıldırım',44),(1864,'Dr. Zeynep Zeren',44),(1865,'Dr. Aslı Aydın',44),(1866,'Dr. Berk Bayraktar',44),(1867,'Dr. Cenk Çalışkan',45),(1868,'Dr. Derya Demir',45),(1869,'Dr. Ece Ergin',45),(1870,'Dr. Fatih Fikri',45),(1871,'Dr. Gülhan Güneş',45),(1872,'Dr. Hande Hazar',45),(1873,'Dr. İsmail İnan',45),(1874,'Dr. Jale Jansen',45),(1875,'Dr. Kerem Kaya',45),(1876,'Dr. Leyla Leman',45),(1877,'Dr. Mert Meriç',46),(1878,'Dr. Nilay Narin',46),(1879,'Dr. Onur Özdemir',46),(1880,'Dr. Pelin Polat',46),(1881,'Dr. Rıza Rıfkı',46),(1882,'Dr. Seda Sezer',46),(1883,'Dr. Tarık Topal',46),(1884,'Dr. Ufuk Uslu',46),(1885,'Dr. Volkan Veli',46),(1886,'Dr. Yasemin Yüce',46),(1887,'Dr. Zeki Ziya',47),(1888,'Dr. Ali Altan',47),(1889,'Dr. Bahar Bulut',47),(1890,'Dr. Cemal Candan',47),(1891,'Dr. Deniz Dilek',47),(1892,'Dr. Ece Erden',47),(1893,'Dr. Fatma Fidan',47),(1894,'Dr. Gökhan Gür',47),(1895,'Dr. Hakan Hazar',47),(1896,'Dr. İsmail İnan',47),(1897,'Dr. Jale Jansen',48),(1898,'Dr. Kadir Kalem',48),(1899,'Dr. Lale Limon',48),(1900,'Dr. Merve Meriç',48),(1901,'Dr. Nazlı Narin',48),(1902,'Dr. Onur Oran',48),(1903,'Dr. Pelin Polat',48),(1904,'Dr. Rıza Rüzgar',48),(1905,'Dr. Seda Sarı',48),(1906,'Dr. Tarık Tunç',48),(1907,'Dr. Ufuk Uzun',49),(1908,'Dr. Volkan Vardar',49),(1909,'Dr. Yasemin Yalçın',49),(1910,'Dr. Zeki Zorlu',49),(1911,'Dr. Ali Acar',49),(1912,'Dr. Bora Bayrak',49),(1913,'Dr. Ceren Caner',49),(1914,'Dr. Deniz Duran',49),(1915,'Dr. Emre Eren',49),(1916,'Dr. Fatih Fidan',49),(1917,'Dr. Gül Gürsoy',50),(1918,'Dr. Hakan Harun',50),(1919,'Dr. İlker İnan',50),(1920,'Dr. Jülide Jansen',50),(1921,'Dr. Kadir Kaya',50),(1922,'Dr. Lale Leman',50),(1923,'Dr. Merve Meriç',50),(1924,'Dr. Nazlı Narin',50),(1925,'Dr. Onur Özcan',50),(1926,'Dr. Pelin Polat',50),(1927,'Dr. Alper Acar',51),(1928,'Dr. Berna Bilgin',51),(1929,'Dr. Canan Çelik',51),(1930,'Dr. Deniz Demir',51),(1931,'Dr. Emre Erdem',51),(1932,'Dr. Fikret Fidan',51),(1933,'Dr. Gülşah Güneş',51),(1934,'Dr. Hakan Hatipoğlu',51),(1935,'Dr. İlker İnan',51),(1936,'Dr. Jale Yıldız',51),(1937,'Dr. Kadir Kılıç',52),(1938,'Dr. Leyla Limon',52),(1939,'Dr. Mert Meriç',52),(1940,'Dr. Nazlı Narin',52),(1941,'Dr. Onur Öztürk',52),(1942,'Dr. Pelin Polat',52),(1943,'Dr. Rıza Rüzgar',52),(1944,'Dr. Seda Sarı',52),(1945,'Dr. Tarık Tunç',52),(1946,'Dr. Ufuk Uzun',52),(1947,'Dr. Volkan Vardar',53),(1948,'Dr. Yasemin Yalçın',53),(1949,'Dr. Zeki Zorlu',53),(1950,'Dr. Ali Acar',53),(1951,'Dr. Bora Bayrak',53),(1952,'Dr. Ceren Caner',53),(1953,'Dr. Deniz Duran',53),(1954,'Dr. Emre Eren',53),(1955,'Dr. Fatih Fidan',53),(1956,'Dr. Gül Gürsoy',53),(1957,'Dr. Hakan Harun',54),(1958,'Dr. İlker İnan',54),(1959,'Dr. Jülide Jansen',54),(1960,'Dr. Kadir Kaya',54),(1961,'Dr. Lale Leman',54),(1962,'Dr. Merve Meriç',54),(1963,'Dr. Nazlı Narin',54),(1964,'Dr. Onur Özcan',54),(1965,'Dr. Pelin Polat',54),(1966,'Dr. Rüzgar Rıfkı',54),(1967,'Dr. Seda Sezer',55),(1968,'Dr. Tarık Topal',55),(1969,'Dr. Ufuk Uslu',55),(1970,'Dr. Volkan Veli',55),(1971,'Dr. Yasemin Yüce',55),(1972,'Dr. Zeki Ziya',55),(1973,'Dr. Ali Altan',55),(1974,'Dr. Bahar Bulut',55),(1975,'Dr. Cemal Candan',55),(1976,'Dr. Deniz Dilek',55),(1977,'Dr. Ece Erden',56),(1978,'Dr. Fatma Fidan',56),(1979,'Dr. Gökhan Gür',56),(1980,'Dr. Hakan Hazar',56),(1981,'Dr. İsmail İnan',56),(1982,'Dr. Jale Jansen',56),(1983,'Dr. Kadir Kalem',56),(1984,'Dr. Lale Limon',56),(1985,'Dr. Merve Meriç',56),(1986,'Dr. Nazlı Narin',56),(1987,'Dr. Onur Oran',57),(1988,'Dr. Pelin Polat',57),(1989,'Dr. Rıza Rüzgar',57),(1990,'Dr. Seda Sarı',57),(1991,'Dr. Tarık Tunç',57),(1992,'Dr. Ufuk Uzun',57),(1993,'Dr. Volkan Vardar',57),(1994,'Dr. Yasemin Yalçın',57),(1995,'Dr. Zeki Zorlu',57),(1996,'Dr. Ali Acar',57),(1997,'Dr. Bora Bayrak',58),(1998,'Dr. Ceren Caner',58),(1999,'Dr. Deniz Duran',58),(2000,'Dr. Emre Eren',58),(2001,'Dr. Fatih Fidan',58),(2002,'Dr. Gül Gürsoy',58),(2003,'Dr. Hakan Harun',58),(2004,'Dr. İlker İnan',58),(2005,'Dr. Jülide Jansen',58),(2006,'Dr. Kadir Kaya',58),(2007,'Dr. Lale Leman',59),(2008,'Dr. Merve Meriç',59),(2009,'Dr. Nazlı Narin',59),(2010,'Dr. Onur Özcan',59),(2011,'Dr. Pelin Polat',59),(2012,'Dr. Rüzgar Rıfat',59),(2013,'Dr. Seda Sezer',59),(2014,'Dr. Tarık Toprak',59),(2015,'Dr. Umut Uçar',59),(2016,'Dr. Volkan Veli',59),(2017,'Dr. Yasir Yıldırım',60),(2018,'Dr. Zeynep Zeren',60),(2019,'Dr. Aslı Aydın',60),(2020,'Dr. Berk Bayraktar',60),(2021,'Dr. Cenk Çalışkan',60),(2022,'Dr. Derya Demir',60),(2023,'Dr. Ece Ergin',60),(2024,'Dr. Fatih Fikri',60),(2025,'Dr. Gülhan Güneş',60),(2026,'Dr. Hande Hazar',60),(2027,'Dr. İsmail İnan',61),(2028,'Dr. Jale Jansen',61),(2029,'Dr. Kerem Kaya',61),(2030,'Dr. Leyla Leman',61),(2031,'Dr. Mert Meriç',61),(2032,'Dr. Nilay Narin',61),(2033,'Dr. Onur Özdemir',61),(2034,'Dr. Pelin Polat',61),(2035,'Dr. Rıza Rıfkı',61),(2036,'Dr. Seda Sezer',61),(2037,'Dr. Tarık Topal',62),(2038,'Dr. Ufuk Uslu',62),(2039,'Dr. Volkan Veli',62),(2040,'Dr. Yasemin Yüce',62),(2041,'Dr. Zeki Ziya',62),(2042,'Dr. Ali Altan',62),(2043,'Dr. Bahar Bulut',62),(2044,'Dr. Cemal Candan',62),(2045,'Dr. Deniz Dilek',62),(2046,'Dr. Ece Erden',62),(2047,'Dr. Fatma Fidan',63),(2048,'Dr. Gökhan Gür',63),(2049,'Dr. Hakan Hazar',63),(2050,'Dr. İsmail İnan',63),(2051,'Dr. Jale Jansen',63),(2052,'Dr. Kadir Kalem',63),(2053,'Dr. Lale Limon',63),(2054,'Dr. Merve Meriç',63),(2055,'Dr. Nazlı Narin',63),(2056,'Dr. Onur Oran',63),(2057,'Dr. Pelin Polat',64),(2058,'Dr. Rıza Rüzgar',64),(2059,'Dr. Seda Sarı',64),(2060,'Dr. Tarık Tunç',64),(2061,'Dr. Ufuk Uzun',64),(2062,'Dr. Volkan Vardar',64),(2063,'Dr. Yasemin Yalçın',64),(2064,'Dr. Zeki Zorlu',64),(2065,'Dr. Ali Acar',64),(2066,'Dr. Bora Bayrak',64),(2067,'Dr. Ceren Caner',65),(2068,'Dr. Deniz Duran',65),(2069,'Dr. Emre Eren',65),(2070,'Dr. Fatih Fidan',65),(2071,'Dr. Gül Gürsoy',65),(2072,'Dr. Hakan Harun',65),(2073,'Dr. İlker İnan',65),(2074,'Dr. Jülide Jansen',65),(2075,'Dr. Kadir Kaya',65),(2076,'Dr. Lale Leman',65),(2077,'Dr. Merve Meriç',66),(2078,'Dr. Nazlı Narin',66),(2079,'Dr. Onur Özcan',66),(2080,'Dr. Pelin Polat',66),(2081,'Dr. Rüzgar Rıfkı',66),(2082,'Dr. Seda Sezer',66),(2083,'Dr. Tarık Toprak',66),(2084,'Dr. Umut Uçar',66),(2085,'Dr. Volkan Veli',66),(2086,'Dr. Yasir Yıldırım',66),(2087,'Dr. Zeynep Zeren',67),(2088,'Dr. Aslı Aydın',67),(2089,'Dr. Berk Bayraktar',67),(2090,'Dr. Cenk Çalışkan',67),(2091,'Dr. Derya Demir',67),(2092,'Dr. Ece Ergin',67),(2093,'Dr. Fatih Fikri',67),(2094,'Dr. Gülhan Güneş',67),(2095,'Dr. Hande Hazar',67),(2096,'Dr. İsmail İnan',67),(2097,'Dr. Jale Jansen',68),(2098,'Dr. Kerem Kaya',68),(2099,'Dr. Leyla Leman',68),(2100,'Dr. Mert Meriç',68),(2101,'Dr. Nilay Narin',68),(2102,'Dr. Onur Özdemir',68),(2103,'Dr. Pelin Polat',68),(2104,'Dr. Rıza Rıfkı',68),(2105,'Dr. Seda Sezer',68),(2106,'Dr. Tarık Topal',68),(2107,'Dr. Ufuk Uslu',69),(2108,'Dr. Volkan Veli',69),(2109,'Dr. Yasemin Yüce',69),(2110,'Dr. Zeki Ziya',69),(2111,'Dr. Ali Altan',69),(2112,'Dr. Bahar Bulut',69),(2113,'Dr. Cemal Candan',69),(2114,'Dr. Deniz Dilek',69),(2115,'Dr. Ece Erden',69),(2116,'Dr. Fatma Fidan',69),(2117,'Dr. Gökhan Gür',70),(2118,'Dr. Hakan Hazar',70),(2119,'Dr. İsmail İnan',70),(2120,'Dr. Jale Jansen',70),(2121,'Dr. Kadir Kalem',70),(2122,'Dr. Lale Limon',70),(2123,'Dr. Merve Meriç',70),(2124,'Dr. Nazlı Narin',70),(2125,'Dr. Onur Oran',70),(2126,'Dr. Pelin Polat',70),(2127,'Dr. Rıza Rüzgar',71),(2128,'Dr. Seda Sarı',71),(2129,'Dr. Tarık Tunç',71),(2130,'Dr. Ufuk Uzun',71),(2131,'Dr. Volkan Vardar',71),(2132,'Dr. Yasemin Yalçın',71),(2133,'Dr. Zeki Zorlu',71),(2134,'Dr. Ali Acar',71),(2135,'Dr. Bora Bayrak',71),(2136,'Dr. Ceren Caner',71),(2137,'Dr. Deniz Duran',72),(2138,'Dr. Emre Eren',72),(2139,'Dr. Fatih Fidan',72),(2140,'Dr. Gül Gürsoy',72),(2141,'Dr. Hakan Harun',72),(2142,'Dr. İlker İnan',72),(2143,'Dr. Jülide Jansen',72),(2144,'Dr. Kadir Kaya',72),(2145,'Dr. Lale Leman',72),(2146,'Dr. Merve Meriç',72),(2147,'Dr. Nazlı Narin',73),(2148,'Dr. Onur Özcan',73),(2149,'Dr. Pelin Polat',73),(2150,'Dr. Rüzgar Rıfkı',73),(2151,'Dr. Seda Sezer',73),(2152,'Dr. Tarık Toprak',73),(2153,'Dr. Umut Uçar',73),(2154,'Dr. Volkan Veli',73),(2155,'Dr. Yasir Yıldırım',73),(2156,'Dr. Zeynep Zeren',73),(2157,'Dr. Aslı Aydın',74),(2158,'Dr. Berk Bayraktar',74),(2159,'Dr. Cenk Çalışkan',74),(2160,'Dr. Derya Demir',74),(2161,'Dr. Ece Ergin',74),(2162,'Dr. Fatih Fikri',74),(2163,'Dr. Gülhan Güneş',74),(2164,'Dr. Hande Hazar',74),(2165,'Dr. İsmail İnan',74),(2166,'Dr. Jale Jansen',74),(2167,'Dr. Kerem Kaya',75),(2168,'Dr. Leyla Leman',75),(2169,'Dr. Mert Meriç',75),(2170,'Dr. Nilay Narin',75),(2171,'Dr. Onur Özdemir',75),(2172,'Dr. Pelin Polat',75),(2173,'Dr. Rıza Rıfkı',75),(2174,'Dr. Seda Sezer',75),(2175,'Dr. Tarık Topal',75),(2176,'Dr. Ufuk Uslu',75),(2177,'Dr. Volkan Veli',76),(2178,'Dr. Yasemin Yüce',76),(2179,'Dr. Zeki Ziya',76),(2180,'Dr. Ali Altan',76),(2181,'Dr. Bahar Bulut',76),(2182,'Dr. Cemal Candan',76),(2183,'Dr. Deniz Dilek',76),(2184,'Dr. Ece Erden',76),(2185,'Dr. Fatma Fidan',76),(2186,'Dr. Gökhan Gür',76),(2187,'Dr. Hakan Hazar',77),(2188,'Dr. İsmail İnan',77),(2189,'Dr. Jale Jansen',77),(2190,'Dr. Kadir Kalem',77),(2191,'Dr. Lale Limon',77),(2192,'Dr. Merve Meriç',77),(2193,'Dr. Nazlı Narin',77),(2194,'Dr. Onur Oran',77),(2195,'Dr. Pelin Polat',77),(2196,'Dr. Rıza Rüzgar',77),(2197,'Dr. Seda Sarı',78),(2198,'Dr. Tarık Tunç',78),(2199,'Dr. Ufuk Uzun',78),(2200,'Dr. Volkan Vardar',78),(2201,'Dr. Yasemin Yalçın',78),(2202,'Dr. Zeki Zorlu',78),(2203,'Dr. Ali Acar',78),(2204,'Dr. Bora Bayrak',78),(2205,'Dr. Ceren Caner',78),(2206,'Dr. Deniz Duran',78),(2207,'Dr. Emre Eren',79),(2208,'Dr. Fatih Fidan',79),(2209,'Dr. Gül Gürsoy',79),(2210,'Dr. Hakan Harun',79),(2211,'Dr. İlker İnan',79),(2212,'Dr. Jülide Jansen',79),(2213,'Dr. Kadir Kaya',79),(2214,'Dr. Lale Leman',79),(2215,'Dr. Merve Meriç',79),(2216,'Dr. Nazlı Narin',79),(2217,'Dr. Onur Özcan',80),(2218,'Dr. Pelin Polat',80),(2219,'Dr. Rüzgar Rıfkı',80),(2220,'Dr. Seda Sezer',80),(2221,'Dr. Tarık Toprak',80),(2222,'Dr. Umut Uçar',80),(2223,'Dr. Volkan Veli',80),(2224,'Dr. Yasir Yıldırım',80),(2225,'Dr. Zeynep Zeren',80),(2226,'Dr. Aslı Aydın',80),(2227,'Dr. Berk Bayraktar',81),(2228,'Dr. Cenk Çalışkan',81),(2229,'Dr. Derya Demir',81),(2230,'Dr. Ece Ergin',81),(2231,'Dr. Fatih Fikri',81),(2232,'Dr. Gülhan Güneş',81),(2233,'Dr. Hande Hazar',81),(2234,'Dr. İsmail İnan',81),(2235,'Dr. Jale Jansen',81),(2236,'Dr. Kerem Kaya',81),(2237,'Dr. Leyla Leman',82),(2238,'Dr. Mert Meriç',82),(2239,'Dr. Nilay Narin',82),(2240,'Dr. Onur Özdemir',82),(2241,'Dr. Pelin Polat',82),(2242,'Dr. Rıza Rıfkı',82),(2243,'Dr. Seda Sezer',82),(2244,'Dr. Tarık Topal',82),(2245,'Dr. Ufuk Uslu',82),(2246,'Dr. Volkan Veli',82),(2247,'Dr. Yasemin Yüce',83),(2248,'Dr. Zeki Ziya',83),(2249,'Dr. Ali Altan',83),(2250,'Dr. Bahar Bulut',83),(2251,'Dr. Cemal Candan',83),(2252,'Dr. Deniz Dilek',83),(2253,'Dr. Ece Erden',83),(2254,'Dr. Fatma Fidan',83),(2255,'Dr. Gökhan Gür',83),(2256,'Dr. Hakan Hazar',83),(2257,'Dr. İsmail İnan',84),(2258,'Dr. Jale Jansen',84),(2259,'Dr. Kadir Kalem',84),(2260,'Dr. Lale Limon',84),(2261,'Dr. Merve Meriç',84),(2262,'Dr. Nazlı Narin',84),(2263,'Dr. Onur Oran',84),(2264,'Dr. Pelin Polat',84),(2265,'Dr. Rıza Rüzgar',84),(2266,'Dr. Seda Sarı',84),(2267,'Dr. Tarık Tunç',85),(2268,'Dr. Ufuk Uzun',85),(2269,'Dr. Volkan Vardar',85),(2270,'Dr. Yasemin Yalçın',85),(2271,'Dr. Zeki Zorlu',85),(2272,'Dr. Ali Acar',85),(2273,'Dr. Bora Bayrak',85),(2274,'Dr. Ceren Caner',85),(2275,'Dr. Deniz Duran',85),(2276,'Dr. Emre Eren',85),(2277,'Dr. Fatih Fidan',86),(2278,'Dr. Gül Gürsoy',86),(2279,'Dr. Hakan Harun',86),(2280,'Dr. İlker İnan',86),(2281,'Dr. Jülide Jansen',86),(2282,'Dr. Kadir Kaya',86),(2283,'Dr. Lale Leman',86),(2284,'Dr. Merve Meriç',86),(2285,'Dr. Nazlı Narin',86),(2286,'Dr. Onur Özcan',86),(2287,'Dr. Pelin Polat',87),(2288,'Dr. Rüzgar Rıfkı',87),(2289,'Dr. Seda Sezer',87),(2290,'Dr. Tarık Toprak',87),(2291,'Dr. Umut Uçar',87),(2292,'Dr. Volkan Veli',87),(2293,'Dr. Yasir Yıldırım',87),(2294,'Dr. Zeynep Zeren',87),(2295,'Dr. Aslı Aydın',87),(2296,'Dr. Berk Bayraktar',87),(2297,'Dr. Cenk Çalışkan',88),(2298,'Dr. Derya Demir',88),(2299,'Dr. Ece Ergin',88),(2300,'Dr. Fatih Fikri',88),(2301,'Dr. Gülhan Güneş',88),(2302,'Dr. Hande Hazar',88),(2303,'Dr. İsmail İnan',88),(2304,'Dr. Jale Jansen',88),(2305,'Dr. Kerem Kaya',88),(2306,'Dr. Leyla Leman',88),(2307,'Dr. Mert Meriç',89),(2308,'Dr. Nilay Narin',89),(2309,'Dr. Onur Özdemir',89),(2310,'Dr. Pelin Polat',89),(2311,'Dr. Rıza Rüzgar',89),(2312,'Dr. Seda Sezer',89),(2313,'Dr. Tarık Topal',89),(2314,'Dr. Ufuk Uslu',89),(2315,'Dr. Volkan Veli',89),(2316,'Dr. Yasemin Yüce',89),(2317,'Dr. Zeki Ziya',90),(2318,'Dr. Ali Altan',90),(2319,'Dr. Bahar Bulut',90),(2320,'Dr. Cemal Candan',90),(2321,'Dr. Deniz Dilek',90),(2322,'Dr. Ece Erden',90),(2323,'Dr. Fatma Fidan',90),(2324,'Dr. Gökhan Gür',90),(2325,'Dr. Hakan Hazar',90),(2326,'Dr. İsmail İnan',90),(2327,'Dr. Jale Jansen',91),(2328,'Dr. Kadir Kalem',91),(2329,'Dr. Lale Limon',91),(2330,'Dr. Merve Meriç',91),(2331,'Dr. Nazlı Narin',91),(2332,'Dr. Onur Oran',91),(2333,'Dr. Pelin Polat',91),(2334,'Dr. Rıza Rüzgar',91),(2335,'Dr. Seda Sarı',91),(2336,'Dr. Tarık Tunç',91),(2337,'Dr. Ufuk Uzun',92),(2338,'Dr. Volkan Vardar',92),(2339,'Dr. Yasemin Yalçın',92),(2340,'Dr. Zeki Zorlu',92),(2341,'Dr. Ali Acar',92),(2342,'Dr. Bora Bayrak',92),(2343,'Dr. Ceren Caner',92),(2344,'Dr. Deniz Duran',92),(2345,'Dr. Emre Eren',92),(2346,'Dr. Fatih Fidan',92),(2347,'Dr. Gül Gürsoy',93),(2348,'Dr. Hakan Harun',93),(2349,'Dr. İlker İnan',93),(2350,'Dr. Jülide Jansen',93),(2351,'Dr. Kadir Kaya',93),(2352,'Dr. Lale Leman',93),(2353,'Dr. Merve Meriç',93),(2354,'Dr. Nazlı Narin',93),(2355,'Dr. Onur Özcan',93),(2356,'Dr. Pelin Polat',93),(2357,'Dr. Rüzgar Rıfkı',94),(2358,'Dr. Seda Sezer',94),(2359,'Dr. Tarık Toprak',94),(2360,'Dr. Umut Uçar',94),(2361,'Dr. Volkan Veli',94),(2362,'Dr. Yasir Yıldırım',94),(2363,'Dr. Zeynep Zeren',94),(2364,'Dr. Aslı Aydın',94),(2365,'Dr. Berk Bayraktar',94),(2366,'Dr. Cenk Çalışkan',94),(2367,'Dr. Derya Demir',95),(2368,'Dr. Ece Ergin',95),(2369,'Dr. Fatih Fikri',95),(2370,'Dr. Gülhan Güneş',95),(2371,'Dr. Hande Hazar',95),(2372,'Dr. İsmail İnan',95),(2373,'Dr. Jale Jansen',95),(2374,'Dr. Kerem Kaya',95),(2375,'Dr. Leyla Leman',95),(2376,'Dr. Mert Meriç',95),(2377,'Dr. Nilay Narin',96),(2378,'Dr. Onur Özdemir',96),(2379,'Dr. Pelin Polat',96),(2380,'Dr. Rıza Rüzgar',96),(2381,'Dr. Seda Sezer',96),(2382,'Dr. Tarık Topal',96),(2383,'Dr. Ufuk Uslu',96),(2384,'Dr. Volkan Veli',96),(2385,'Dr. Yasemin Yüce',96),(2386,'Dr. Zeki Ziya',96),(2387,'Dr. Ali Altan',97),(2388,'Dr. Bahar Bulut',97),(2389,'Dr. Cemal Candan',97),(2390,'Dr. Deniz Dilek',97),(2391,'Dr. Ece Erden',97),(2392,'Dr. Fatma Fidan',97),(2393,'Dr. Gökhan Gür',97),(2394,'Dr. Hakan Hazar',97),(2395,'Dr. İsmail İnan',97),(2396,'Dr. Jale Jansen',97),(2397,'Dr. Kadir Kalem',98),(2398,'Dr. Lale Limon',98),(2399,'Dr. Merve Meriç',98),(2400,'Dr. Nazlı Narin',98),(2401,'Dr. Onur Oran',98),(2402,'Dr. Pelin Polat',98),(2403,'Dr. Rıza Rüzgar',98),(2404,'Dr. Seda Sarı',98),(2405,'Dr. Tarık Tunç',98),(2406,'Dr. Ufuk Uzun',98),(2407,'Dr. Volkan Vardar',99),(2408,'Dr. Yasemin Yalçın',99),(2409,'Dr. Zeki Zorlu',99),(2410,'Dr. Ali Acar',99),(2411,'Dr. Bora Bayrak',99),(2412,'Dr. Ceren Caner',99),(2413,'Dr. Deniz Duran',99),(2414,'Dr. Emre Eren',99),(2415,'Dr. Fatih Fidan',99),(2416,'Dr. Gül Gürsoy',99),(2417,'Dr. Hakan Harun',100),(2418,'Dr. İlker İnan',100),(2419,'Dr. Jülide Jansen',100),(2420,'Dr. Kadir Kaya',100),(2421,'Dr. Lale Leman',100),(2422,'Dr. Merve Meriç',100),(2423,'Dr. Nazlı Narin',100),(2424,'Dr. Onur Özcan',100),(2425,'Dr. Pelin Polat',100),(2426,'Dr. Rüzgar Rıfkı',100),(2427,'Dr. Seda Sezer',101),(2428,'Dr. Tarık Toprak',101),(2429,'Dr. Umut Uçar',101),(2430,'Dr. Volkan Veli',101),(2431,'Dr. Yasir Yıldırım',101),(2432,'Dr. Zeynep Zeren',101),(2433,'Dr. Aslı Aydın',101),(2434,'Dr. Berk Bayraktar',101),(2435,'Dr. Cenk Çalışkan',101),(2436,'Dr. Derya Demir',101),(2437,'Dr. Ece Ergin',102),(2438,'Dr. Fatih Fikri',102),(2439,'Dr. Gülhan Güneş',102),(2440,'Dr. Hande Hazar',102),(2441,'Dr. İsmail İnan',102),(2442,'Dr. Jale Jansen',102),(2443,'Dr. Kerem Kaya',102),(2444,'Dr. Leyla Leman',102),(2445,'Dr. Mert Meriç',102),(2446,'Dr. Nilay Narin',102),(2447,'Dr. Onur Özdemir',103),(2448,'Dr. Pelin Polat',103),(2449,'Dr. Rıza Rüzgar',103),(2450,'Dr. Seda Sezer',103),(2451,'Dr. Tarık Topal',103),(2452,'Dr. Ufuk Uslu',103),(2453,'Dr. Volkan Veli',103),(2454,'Dr. Yasemin Yüce',103),(2455,'Dr. Zeki Ziya',103),(2456,'Dr. Ali Altan',103),(2457,'Dr. Bahar Bulut',104),(2458,'Dr. Cemal Candan',104),(2459,'Dr. Deniz Dilek',104),(2460,'Dr. Ece Erden',104),(2461,'Dr. Fatma Fidan',104),(2462,'Dr. Gökhan Gür',104),(2463,'Dr. Hakan Hazar',104),(2464,'Dr. İsmail İnan',104),(2465,'Dr. Jale Jansen',104),(2466,'Dr. Kadir Kalem',104),(2467,'Dr. Lale Limon',105),(2468,'Dr. Merve Meriç',105),(2469,'Dr. Nazlı Narin',105),(2470,'Dr. Onur Oran',105),(2471,'Dr. Pelin Polat',105),(2472,'Dr. Rıza Rüzgar',105),(2473,'Dr. Seda Sarı',105),(2474,'Dr. Tarık Tunç',105),(2475,'Dr. Ufuk Uzun',105),(2476,'Dr. Volkan Vardar',105),(2477,'Dr. Yasemin Yalçın',106),(2478,'Dr. Zeki Zorlu',106),(2479,'Dr. Ali Acar',106),(2480,'Dr. Bora Bayrak',106),(2481,'Dr. Ceren Caner',106),(2482,'Dr. Deniz Duran',106),(2483,'Dr. Emre Eren',106),(2484,'Dr. Fatih Fidan',106),(2485,'Dr. Gül Gürsoy',106),(2486,'Dr. Hakan Harun',106),(2487,'Dr. İlker İnan',107),(2488,'Dr. Jülide Jansen',107),(2489,'Dr. Kadir Kaya',107),(2490,'Dr. Lale Leman',107),(2491,'Dr. Merve Meriç',107),(2492,'Dr. Nazlı Narin',107),(2493,'Dr. Onur Özcan',107),(2494,'Dr. Pelin Polat',107),(2495,'Dr. Rüzgar Rıfkı',107),(2496,'Dr. Seda Sezer',107),(2497,'Dr. Tarık Toprak',108),(2498,'Dr. Umut Uçar',108),(2499,'Dr. Volkan Veli',108),(2500,'Dr. Yasir Yıldırım',108),(2501,'Dr. Zeynep Zeren',108),(2502,'Dr. Aslı Aydın',108),(2503,'Dr. Berk Bayraktar',108),(2504,'Dr. Cenk Çalışkan',108),(2505,'Dr. Derya Demir',108),(2506,'Dr. Ece Ergin',108),(2507,'Dr. Fatih Fikri',109),(2508,'Dr. Gülhan Güneş',109),(2509,'Dr. Hande Hazar',109),(2510,'Dr. İsmail İnan',109),(2511,'Dr. Jale Jansen',109),(2512,'Dr. Kerem Kaya',109),(2513,'Dr. Leyla Leman',109),(2514,'Dr. Mert Meriç',109),(2515,'Dr. Nilay Narin',109),(2516,'Dr. Onur Özdemir',109),(2517,'Dr. Pelin Polat',110),(2518,'Dr. Rıza Rüzgar',110),(2519,'Dr. Seda Sezer',110),(2520,'Dr. Tarık Topal',110),(2521,'Dr. Ufuk Uslu',110),(2522,'Dr. Volkan Veli',110),(2523,'Dr. Yasemin Yüce',110),(2524,'Dr. Zeki Ziya',110),(2525,'Dr. Ali Altan',110),(2526,'Dr. Bahar Bulut',110),(2527,'Dr. Cemal Candan',111),(2528,'Dr. Deniz Dilek',111),(2529,'Dr. Ece Erden',111),(2530,'Dr. Fatma Fidan',111),(2531,'Dr. Gökhan Gür',111),(2532,'Dr. Hakan Hazar',111),(2533,'Dr. İsmail İnan',111),(2534,'Dr. Jale Jansen',111),(2535,'Dr. Kadir Kalem',111),(2536,'Dr. Lale Limon',111),(2537,'Dr. Merve Meriç',112),(2538,'Dr. Nazlı Narin',112),(2539,'Dr. Onur Oran',112),(2540,'Dr. Pelin Polat',112),(2541,'Dr. Rıza Rüzgar',112),(2542,'Dr. Seda Sarı',112),(2543,'Dr. Tarık Tunç',112),(2544,'Dr. Ufuk Uzun',112),(2545,'Dr. Volkan Vardar',112),(2546,'Dr. Yasemin Yalçın',112),(2547,'Dr. Zeki Zorlu',113),(2548,'Dr. Ali Acar',113),(2549,'Dr. Bora Bayrak',113),(2550,'Dr. Ceren Caner',113),(2551,'Dr. Deniz Duran',113),(2552,'Dr. Emre Eren',113),(2553,'Dr. Fatih Fidan',113),(2554,'Dr. Gül Gürsoy',113),(2555,'Dr. Hakan Harun',113),(2556,'Dr. İlker İnan',113),(2557,'Dr. Jülide Jansen',114),(2558,'Dr. Kadir Kaya',114),(2559,'Dr. Lale Leman',114),(2560,'Dr. Merve Meriç',114),(2561,'Dr. Nazlı Narin',114),(2562,'Dr. Onur Özcan',114),(2563,'Dr. Pelin Polat',114),(2564,'Dr. Rüzgar Rıfkı',114),(2565,'Dr. Seda Sezer',114),(2566,'Dr. Tarık Toprak',114),(2567,'Dr. Umut Uçar',115),(2568,'Dr. Volkan Veli',115),(2569,'Dr. Yasir Yıldırım',115),(2570,'Dr. Zeynep Zeren',115),(2571,'Dr. Aslı Aydın',115),(2572,'Dr. Berk Bayraktar',115),(2573,'Dr. Cenk Çalışkan',115),(2574,'Dr. Derya Demir',115),(2575,'Dr. Ece Ergin',115),(2576,'Dr. Fatih Fikri',115),(2577,'Dr. Gülhan Güneş',116),(2578,'Dr. Hande Hazar',116),(2579,'Dr. İsmail İnan',116),(2580,'Dr. Jale Jansen',116),(2581,'Dr. Kerem Kaya',116),(2582,'Dr. Leyla Leman',116),(2583,'Dr. Mert Meriç',116),(2584,'Dr. Nilay Narin',116),(2585,'Dr. Onur Özdemir',116),(2586,'Dr. Pelin Polat',116),(2587,'Dr. Rıza Rüzgar',117),(2588,'Dr. Seda Sezer',117),(2589,'Dr. Tarık Topal',117),(2590,'Dr. Ufuk Uslu',117),(2591,'Dr. Volkan Veli',117),(2592,'Dr. Yasemin Yüce',117),(2593,'Dr. Zeki Ziya',117),(2594,'Dr. Ali Altan',117),(2595,'Dr. Bahar Bulut',117),(2596,'Dr. Cemal Candan',117),(2597,'Dr. Deniz Dilek',118),(2598,'Dr. Ece Erden',118),(2599,'Dr. Fatma Fidan',118),(2600,'Dr. Gökhan Gür',118),(2601,'Dr. Hakan Hazar',118),(2602,'Dr. İsmail İnan',118),(2603,'Dr. Jale Jansen',118),(2604,'Dr. Kadir Kalem',118),(2605,'Dr. Lale Limon',118),(2606,'Dr. Merve Meriç',118),(2607,'Dr. Nazlı Narin',119),(2608,'Dr. Onur Oran',119),(2609,'Dr. Pelin Polat',119),(2610,'Dr. Rıza Rüzgar',119),(2611,'Dr. Seda Sarı',119),(2612,'Dr. Tarık Tunç',119),(2613,'Dr. Ufuk Uzun',119),(2614,'Dr. Volkan Vardar',119),(2615,'Dr. Yasemin Yalçın',119),(2616,'Dr. Zeki Zorlu',119),(2617,'Dr. Ali Acar',120),(2618,'Dr. Bora Bayrak',120),(2619,'Dr. Ceren Caner',120),(2620,'Dr. Deniz Duran',120),(2621,'Dr. Emre Eren',120),(2622,'Dr. Fatih Fidan',120),(2623,'Dr. Gül Gürsoy',120),(2624,'Dr. Hakan Harun',120),(2625,'Dr. İlker İnan',120),(2626,'Dr. Jülide Jansen',120);
/*!40000 ALTER TABLE `doktorlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hastaneler`
--

DROP TABLE IF EXISTS `hastaneler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hastaneler` (
  `HastaneId` int NOT NULL AUTO_INCREMENT,
  `HastaneAdi` varchar(200) NOT NULL,
  PRIMARY KEY (`HastaneId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hastaneler`
--

LOCK TABLES `hastaneler` WRITE;
/*!40000 ALTER TABLE `hastaneler` DISABLE KEYS */;
INSERT INTO `hastaneler` VALUES (1,'Bağcılar Medipol Mega Üniversite Hastanesi'),(2,'Bahçelievler Medipol Hastanesi'),(3,'Koşuyolu İstanbul Medipol Hastanesi'),(4,'Esenler Medipol Üniversitesi Hastanesi'),(5,'Sefaköy Medipol Üniversitesi Hastanesi'),(6,'Çamlıca Medipol Üniversitesi Hastanesi'),(7,'Pendik Medipol Üniversitesi Hastanesi'),(8,'Vatan Medipol Üniversitesi Hastanesi'),(9,'Unkapanı Medipol Üniversitesi Diş Hastanesi'),(10,'Ankara Medipol Üniversitesi Diş Hastanesi'),(11,'MEDİPOL Acıbadem Bölge Hastanesi');
/*!40000 ALTER TABLE `hastaneler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kullanicilar`
--

DROP TABLE IF EXISTS `kullanicilar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kullanicilar` (
  `KullaniciId` int NOT NULL AUTO_INCREMENT,
  `AdSoyad` varchar(255) NOT NULL,
  `Eposta` varchar(255) NOT NULL,
  `Sifre` varchar(255) NOT NULL,
  `Rol` enum('Admin','Hasta') NOT NULL,
  `OlusturulmaTarihi` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `TCKimlikNo` char(11) NOT NULL,
  PRIMARY KEY (`KullaniciId`),
  UNIQUE KEY `Eposta` (`Eposta`),
  UNIQUE KEY `TCKimlikNo` (`TCKimlikNo`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanicilar`
--

LOCK TABLES `kullanicilar` WRITE;
/*!40000 ALTER TABLE `kullanicilar` DISABLE KEYS */;
INSERT INTO `kullanicilar` VALUES (23,'İrfan Sercan Ergüzel','sercanerguzel120@outlook.com','$2a$11$wObjmcxSvi4JFZ9XnWjOleVfcBYdxc0.TT14maBwamOsptdkfrlA6','Hasta','2025-03-20 07:29:55','31195830516'),(25,'Ahmet Can','ahmetcan@gmail.com','$2a$11$ajjIdSfgjuc0pXz0zvsRy.YwqSFcE5v/tPxFjdNBkwzsLjhUeiI4S','Hasta','2025-03-20 09:25:55','22222222222'),(26,'Sercan','asd@gmail.com','$2a$11$nPRDKM623.mQ8ScZG8LDJeq17QXOJyj95gFtsQtZNTcp1PSpS1enW','Hasta','2025-03-20 09:28:53','44444444444'),(27,'Hilal Karaca','nurhilal@gmail.com','$2a$11$iCM./.zjKirfkBLYTNzRFOqYL4SO2VcFNqEIU4YDt3up2kU9uN08a','Hasta','2025-05-18 16:02:16','12345678910'),(28,'Ali Candan','ali@gmail.com','$2a$11$MiQPbGXMJlHdmlbsnFCBa.e0tSSD7bVcV0JZHLZxpECqQVWz1/sYO','Hasta','2025-05-19 00:51:31','55555555555'),(30,'irfan sercan','sercanerguzel125@gmail.com','$2a$11$iwZs8oD2C/jdCWu2XK86YOsAQKaenKGI.RynMhHbHJJTTEIQ63dLe','Hasta','2025-05-19 01:06:48','31195830519'),(31,'Emre Şenay','emresenay4@gmail.com','$2a$11$1xIdPZmmg3inVDs4Xd6BdeOoiWb8yeD0YFDnyiUmYOkHYW0EpVLQ6','Hasta','2025-05-19 18:56:36','49078266710'),(32,'Hilal','sercanerguzel120@gmail.com','$2a$11$hr3eUIIWaaozLqJgkOGEducdlxgOegMfPM3wHg.Ii9BidXKcuhI5O','Hasta','2026-04-01 15:31:47','26294020814');
/*!40000 ALTER TABLE `kullanicilar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `randevular`
--

DROP TABLE IF EXISTS `randevular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `randevular` (
  `RandevuId` int NOT NULL AUTO_INCREMENT,
  `KullaniciId` int NOT NULL,
  `HastaneId` int NOT NULL,
  `BolumId` int NOT NULL,
  `DoktorId` int NOT NULL,
  `SecilenTarih` date NOT NULL,
  `SecilenSaat` time NOT NULL,
  `Durum` enum('Müsait','Dolu') NOT NULL DEFAULT 'Müsait',
  PRIMARY KEY (`RandevuId`),
  KEY `KullaniciId` (`KullaniciId`),
  KEY `HastaneId` (`HastaneId`),
  KEY `BolumId` (`BolumId`),
  KEY `DoktorId` (`DoktorId`),
  CONSTRAINT `randevular_ibfk_1` FOREIGN KEY (`KullaniciId`) REFERENCES `kullanicilar` (`KullaniciId`),
  CONSTRAINT `randevular_ibfk_2` FOREIGN KEY (`HastaneId`) REFERENCES `hastaneler` (`HastaneId`),
  CONSTRAINT `randevular_ibfk_3` FOREIGN KEY (`BolumId`) REFERENCES `bolumler` (`BolumId`),
  CONSTRAINT `randevular_ibfk_4` FOREIGN KEY (`DoktorId`) REFERENCES `doktorlar` (`DoktorId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `randevular`
--

LOCK TABLES `randevular` WRITE;
/*!40000 ALTER TABLE `randevular` DISABLE KEYS */;
INSERT INTO `randevular` VALUES (24,23,2,108,2500,'2025-05-22','08:30:00','Dolu'),(26,23,6,62,2038,'2025-08-20','11:30:00','Dolu'),(30,27,3,99,2414,'2025-08-20','14:30:00','Dolu');
/*!40000 ALTER TABLE `randevular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `randevusaatleri`
--

DROP TABLE IF EXISTS `randevusaatleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `randevusaatleri` (
  `SaatId` int NOT NULL AUTO_INCREMENT,
  `RandevuSaati` time NOT NULL,
  `TarihId` int NOT NULL,
  `DoktorId` int DEFAULT NULL,
  PRIMARY KEY (`SaatId`),
  KEY `TarihId` (`TarihId`),
  KEY `FK_RandevuSaatleri_Doktorlar` (`DoktorId`),
  CONSTRAINT `FK_RandevuSaatleri_Doktorlar` FOREIGN KEY (`DoktorId`) REFERENCES `doktorlar` (`DoktorId`),
  CONSTRAINT `randevusaatleri_ibfk_1` FOREIGN KEY (`TarihId`) REFERENCES `randevutarihleri` (`TarihId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `randevusaatleri`
--

LOCK TABLES `randevusaatleri` WRITE;
/*!40000 ALTER TABLE `randevusaatleri` DISABLE KEYS */;
/*!40000 ALTER TABLE `randevusaatleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `randevutarihleri`
--

DROP TABLE IF EXISTS `randevutarihleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `randevutarihleri` (
  `TarihId` int NOT NULL AUTO_INCREMENT,
  `RandevuTarihi` date NOT NULL,
  `DoktorId` int NOT NULL,
  PRIMARY KEY (`TarihId`),
  KEY `DoktorId` (`DoktorId`),
  CONSTRAINT `randevutarihleri_ibfk_1` FOREIGN KEY (`DoktorId`) REFERENCES `doktorlar` (`DoktorId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `randevutarihleri`
--

LOCK TABLES `randevutarihleri` WRITE;
/*!40000 ALTER TABLE `randevutarihleri` DISABLE KEYS */;
/*!40000 ALTER TABLE `randevutarihleri` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-07 16:12:57
