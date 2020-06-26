-- Adminer 4.7.6 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

CREATE DATABASE `libraria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `libraria`;

CREATE TABLE `aut_lib` (
  `Autoret_ID` int NOT NULL,
  `Librat_ID` int NOT NULL,
  KEY `Autoret_ID` (`Autoret_ID`),
  KEY `Librat_ID` (`Librat_ID`),
  CONSTRAINT `aut_lib_ibfk_1` FOREIGN KEY (`Autoret_ID`) REFERENCES `autoret` (`Autoret_ID`),
  CONSTRAINT `aut_lib_ibfk_2` FOREIGN KEY (`Librat_ID`) REFERENCES `librat` (`Librat_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `aut_lib` (`Autoret_ID`, `Librat_ID`) VALUES
(1,	1),
(2,	2),
(3,	3),
(4,	4),
(20,	4),
(5,	5),
(6,	6),
(10,	6),
(6,	7),
(7,	8),
(8,	9),
(2,	9),
(8,	10),
(8,	11),
(1,	11),
(9,	12),
(10,	13),
(10,	14),
(17,	14),
(11,	15),
(12,	16),
(12,	17),
(11,	18),
(3,	18),
(12,	19),
(13,	20),
(14,	21),
(15,	22),
(16,	23),
(16,	24),
(17,	25),
(17,	26),
(17,	27),
(22,	27),
(18,	28),
(19,	29),
(20,	30),
(21,	31),
(22,	32),
(23,	33),
(24,	34),
(25,	35),
(26,	36),
(27,	37),
(28,	38),
(27,	39),
(28,	40),
(27,	41),
(10,	42),
(11,	43),
(12,	44),
(13,	45),
(14,	46),
(15,	47),
(16,	48),
(17,	49),
(18,	50),
(19,	51),
(20,	52);

CREATE TABLE `autoret` (
  `Autoret_ID` int NOT NULL AUTO_INCREMENT,
  `Emri` longtext NOT NULL,
  `Mbiemri` longtext NOT NULL,
  PRIMARY KEY (`Autoret_ID`),
  UNIQUE KEY `Autoret_ID` (`Autoret_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `autoret` (`Autoret_ID`, `Emri`, `Mbiemri`) VALUES
(1,	'Ismail',	'Kadare'),
(2,	'Sigmund',	'Freud'),
(3,	'Pjeter',	'Budi'),
(4,	'Gjon',	'Buzuku'),
(5,	'Pjeter',	'Bogdani'),
(6,	'Nezim',	'Frakulla'),
(7,	'Lasgush',	'Poradeci'),
(8,	'Dritero',	'Agolli'),
(9,	'Gjergj',	'Fishta'),
(10,	'Ndre',	'Mjeda'),
(11,	'Fan',	'Noli'),
(12,	'Mitrush',	'Kuteli'),
(13,	'Ali',	'Podrimja'),
(14,	'Kasem',	'Trebeshina'),
(15,	'Martin',	'Camaj'),
(16,	'Guilio',	'Variboba'),
(17,	'Azem',	'Shkreli'),
(18,	'Filip',	'Shiroka'),
(19,	'Ernest',	'Koliqi'),
(20,	'Esad',	'Mekuli'),
(21,	'Arshi',	'Pipa'),
(22,	'Frang',	'Bardhi'),
(23,	'Vaso',	'Pasha'),
(24,	'Marlin',	'Barleti'),
(25,	'Fator',	'Arapi'),
(26,	'Drin',	'Mehmeti'),
(27,	'Petro',	'Marko'),
(28,	'Rrahman',	'Dedaj'),
(29,	'Dhimiter',	'Xhovanni');

CREATE TABLE `huazimet` (
  `Huazimet_ID` int NOT NULL AUTO_INCREMENT,
  `DataMarrjes` date NOT NULL,
  `DataPritjes` date NOT NULL,
  `DataKthimit` date DEFAULT NULL,
  `Klientet_ID` int NOT NULL,
  `Librat_ID` int NOT NULL,
  `Aktiv` tinyint NOT NULL,
  PRIMARY KEY (`Huazimet_ID`),
  UNIQUE KEY `Huazimet_ID` (`Huazimet_ID`),
  KEY `huazimet_ibfk_1` (`Klientet_ID`),
  KEY `huazimet_ibfk_2` (`Librat_ID`),
  CONSTRAINT `huazimet_ibfk_1` FOREIGN KEY (`Klientet_ID`) REFERENCES `klientet` (`Klientet_ID`),
  CONSTRAINT `huazimet_ibfk_2` FOREIGN KEY (`Librat_ID`) REFERENCES `librat` (`Librat_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `klientet` (
  `Klientet_ID` int NOT NULL AUTO_INCREMENT,
  `Emri` longtext NOT NULL,
  `Mbiemri` longtext NOT NULL,
  `Email` longtext NOT NULL,
  `NumriTel` longtext NOT NULL,
  `Aktiv` tinyint NOT NULL,
  PRIMARY KEY (`Klientet_ID`),
  UNIQUE KEY `Klientet_ID` (`Klientet_ID`),
  KEY `huazimet_ibfk_1` (`Klientet_ID`),
  KEY `pagesat_ibfk_1` (`Klientet_ID`),
  KEY `rezervimet_ibfk_1` (`Klientet_ID`),
  CONSTRAINT `Klientet_chk_1` CHECK ((`Email` like _utf8mb4'%@%.%'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `klientet` (`Klientet_ID`, `Emri`, `Mbiemri`, `Email`, `NumriTel`, `Aktiv`) VALUES
(1,	'Amy',	'Mountain',	'amy@gmail.com',	'014123123',	0),
(2,	'Emma',	'Sith',	'emma@gmail.com',	'024223123',	0),
(3,	'Liam',	'Hall',	'liam@gmail.com',	'034323123',	0),
(4,	'Noah',	'Johnson',	'noah@gmail.com',	'044423123',	0),
(5,	'Olivia',	'Stewart',	'olivia@gmail.com',	'054523123',	0),
(6,	'Ava',	'Jones',	'ava@gmail.com',	'064623123',	0),
(7,	'Sofia',	'Brown',	'sofia@gmail.com',	'074723123',	0),
(8,	'Charlote',	'Davis',	'charlote@gmail.com',	'084823123',	0),
(9,	'Oliver',	'Miller ',	'oliver@gmail.com',	'094923123',	0),
(10,	'Benjamin',	'Wilson',	'benjamin@gmail.com',	'041113123',	0),
(11,	'Lucas',	'Moore',	'lucas@gmail.com',	'042133123',	0),
(12,	'Mason',	'Taylor',	'mason@gmail.com',	'043143123',	0),
(13,	'Logan',	'Anderson',	'logan@gmail.com',	'044153123',	0),
(14,	'Alexander',	'Thomas',	'alexander@gmail.com',	'045163123',	0),
(15,	'Emily',	'Jackson',	'emily@gmail.com',	'026173123',	0),
(16,	'Abigail',	'White',	'abigail@gmail.com',	'027183123',	0),
(17,	'Elizabeth',	'Harris',	'elizabeth@gmail.com',	'028193123',	0),
(18,	'Mila',	'Martin',	'mila@gmail.com',	'021121123',	0),
(19,	'Daniel',	'Thomson',	'daniel@gmail.com',	'022122123',	0),
(20,	'Henry',	'Garcia',	'henry@gmail.com',	'023124123',	0),
(21,	'Jackson',	'Martinez',	'jackson@gmail.com',	'024125123',	0),
(22,	'Sebastian',	'Lewis',	'sebastian@gmail.com',	'025126123',	0),
(23,	'Aiden',	'Lee',	'aiden@gmail.com',	'026127123',	0),
(24,	'Matthew',	'Walker',	'matthew@gmail.com',	'027128123',	0),
(25,	'Samuel',	'Young',	'samuel@gmail.com',	'028129123',	0),
(26,	'David',	'King',	'david@gmail.com',	'029123223',	0),
(27,	'Luna',	'Lopez',	'luna@gmail.com',	'031123323',	0);

CREATE TABLE `librat` (
  `Librat_ID` int NOT NULL AUTO_INCREMENT,
  `Titulli` longtext NOT NULL,
  `Rafti_ID` int NOT NULL,
  `ELire` tinyint NOT NULL,
  PRIMARY KEY (`Librat_ID`),
  UNIQUE KEY `Librat_ID` (`Librat_ID`),
  KEY `Rafti_ID` (`Rafti_ID`),
  KEY `huazimet_ibfk_2` (`Librat_ID`),
  KEY `rezervimet_ibfk_2` (`Librat_ID`),
  CONSTRAINT `librat_ibfk_1` FOREIGN KEY (`Rafti_ID`) REFERENCES `rafti` (`Rafti_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `librat` (`Librat_ID`, `Titulli`, `Rafti_ID`, `ELire`) VALUES
(1,	'Keshtjella',	1,	1),
(2,	'Tatuisit i Aushvicit',	1,	1),
(3,	'Shtate Motrat',	1,	1),
(4,	'Presidenti eshte zhdukur',	1,	1),
(5,	'Lulet e Veres',	1,	1),
(6,	'Guret e Vetmise',	1,	1),
(7,	'I huaji',	1,	1),
(8,	'Krim dhe Ndeshkim',	1,	1),
(9,	'Nen uje',	1,	1),
(10,	'Rojtari i Padukshem',	1,	1),
(11,	'Gjenerali i Ushtrise',	2,	1),
(12,	'Bostet e Tiranes',	2,	1),
(13,	'Tri bijat e Eves',	2,	1),
(14,	'Arka e Djallit',	2,	1),
(15,	'Fausti',	2,	1),
(16,	'Historia e vajzes se humbur',	2,	1),
(17,	'Gjyqi',	2,	1),
(18,	'Momente jete',	2,	1),
(19,	'Blu Safiri',	2,	1),
(20,	'Dekorata',	3,	1),
(21,	'Renia',	3,	1),
(22,	'City',	3,	1),
(23,	'Loja e Riperit',	3,	1),
(24,	'Dita e mbetur',	3,	1),
(25,	'Kamera e fshehte',	3,	1),
(26,	'Funeral',	3,	1),
(27,	'Bibollasit',	3,	1),
(28,	'Njeqind vjet vetmi',	3,	1),
(29,	'Te jetosh ne paqe',	3,	1),
(30,	'Sekreti i nje nate vere',	3,	1),
(31,	'Arbenita e zhdukur',	4,	1),
(32,	'Lekura e Shagrenit',	4,	1),
(33,	'Nje kange feste',	4,	1),
(34,	'Toke e Premtuar',	4,	1),
(35,	'Dashuri dhe pleqeri',	4,	1),
(36,	'Zhurma e bardhe',	4,	1),
(37,	'Xha gorio',	4,	1),
(38,	'Kerol',	4,	1),
(39,	'Me Befaso!',	4,	1),
(40,	'Suite Franceze',	4,	1),
(41,	'Zonja e funeraleve',	4,	1),
(42,	'Vajza e letres',	4,	1),
(43,	'Mall per ty',	4,	1),
(44,	'Me bej te dua',	4,	1),
(45,	'Misteri i trenit blue',	4,	1),
(46,	'Motra tjeter',	4,	1),
(47,	'Uni i tij i ndalur',	4,	1),
(48,	'Libri i Baltimoreve',	4,	1),
(49,	'Metamorfoza-Albas',	4,	1),
(50,	'Marrja e gjakut',	4,	1),
(51,	'Fabula Rasa',	4,	1),
(52,	'Hipi',	4,	1),
(53,	'Dielli i ulet',	4,	1);

CREATE TABLE `pagesat` (
  `Pagesat_ID` int NOT NULL AUTO_INCREMENT,
  `DataPageses` date NOT NULL,
  `DataSkadimit` date NOT NULL,
  `ShumaPageses` int NOT NULL,
  `Klientet_ID` int NOT NULL,
  `Aktiv` tinyint NOT NULL,
  PRIMARY KEY (`Pagesat_ID`),
  UNIQUE KEY `Pagesat_ID` (`Pagesat_ID`),
  KEY `pagesat_ibfk_2` (`Klientet_ID`),
  CONSTRAINT `pagesat_ibfk_2` FOREIGN KEY (`Klientet_ID`) REFERENCES `klientet` (`Klientet_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `perdoruesit` (
  `Perdoruesit_ID` int NOT NULL AUTO_INCREMENT,
  `Emri` longtext NOT NULL,
  `Mbiemri` longtext NOT NULL,
  `Email` longtext NOT NULL,
  `Password` longtext NOT NULL,
  `Roli_ID` int NOT NULL,
  `Foto` longtext,
  `Online` tinyint NOT NULL,
  PRIMARY KEY (`Perdoruesit_ID`),
  UNIQUE KEY `Perdoruesit_ID` (`Perdoruesit_ID`),
  KEY `Roli_ID` (`Roli_ID`),
  CONSTRAINT `perderuesit_ibfk_1` FOREIGN KEY (`Roli_ID`) REFERENCES `roli` (`Roli_ID`),
  CONSTRAINT `perdoruesit_chk_1` CHECK ((`Email` like _utf8mb4'%@%.%'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `perdoruesit` (`Perdoruesit_ID`, `Emri`, `Mbiemri`, `Email`, `Password`, `Roli_ID`, `Foto`, `Online`) VALUES
(5,	'A',	'V',	'av@gmail.com',	'4124bc0a9335c27f086f24ba207a4912',	1,	NULL,	1);

CREATE TABLE `rafti` (
  `Rafti_ID` int NOT NULL AUTO_INCREMENT,
  `Rreshti` int NOT NULL,
  PRIMARY KEY (`Rafti_ID`),
  UNIQUE KEY `Rafti_ID` (`Rafti_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `rafti` (`Rafti_ID`, `Rreshti`) VALUES
(1,	1),
(2,	2),
(3,	3),
(4,	4);

CREATE TABLE `rezervimet` (
  `Rezervimet_ID` int NOT NULL AUTO_INCREMENT,
  `DRez` date NOT NULL,
  `Klientet_ID` int NOT NULL,
  `Librat_ID` int NOT NULL,
  `Aktiv` tinyint NOT NULL,
  PRIMARY KEY (`Rezervimet_ID`),
  UNIQUE KEY `Rezervimet_ID` (`Rezervimet_ID`),
  KEY `rezervimet_ibfk_1` (`Klientet_ID`),
  KEY `rezervimet_ibfk_2` (`Librat_ID`),
  CONSTRAINT `rezervimet_ibfk_1` FOREIGN KEY (`Klientet_ID`) REFERENCES `klientet` (`Klientet_ID`),
  CONSTRAINT `rezervimet_ibfk_2` FOREIGN KEY (`Librat_ID`) REFERENCES `librat` (`Librat_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `roli` (
  `Roli_ID` int NOT NULL AUTO_INCREMENT,
  `Emertimi` longtext NOT NULL,
  PRIMARY KEY (`Roli_ID`),
  UNIQUE KEY `Roli_ID` (`Roli_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `roli` (`Roli_ID`, `Emertimi`) VALUES
(1,	'Admini'),
(2,	'Useri');

-- 2020-06-26 13:43:44
