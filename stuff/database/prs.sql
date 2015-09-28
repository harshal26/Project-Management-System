# MySQL-Front 5.1  (Build 1.5)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: prs
# ------------------------------------------------------
# Server version 5.1.68-community

#
# Source for table tbl_branch
#

DROP TABLE IF EXISTS `tbl_branch`;
CREATE TABLE `tbl_branch` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `branchname` varchar(255) DEFAULT NULL,
  `branchcode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Dumping data for table tbl_branch
#
LOCK TABLES `tbl_branch` WRITE;
/*!40000 ALTER TABLE `tbl_branch` DISABLE KEYS */;

INSERT INTO `tbl_branch` VALUES (1,'Computer Engineering','CE');
INSERT INTO `tbl_branch` VALUES (2,'Electrnics & Communication Engineering','EC');
INSERT INTO `tbl_branch` VALUES (3,'Information Technology','IT');
INSERT INTO `tbl_branch` VALUES (4,'Civil Engineering','CV');
INSERT INTO `tbl_branch` VALUES (5,'Mechanical Engineering','ME');
INSERT INTO `tbl_branch` VALUES (6,'Electrical Engineering','EE');
/*!40000 ALTER TABLE `tbl_branch` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tbl_faculty
#

DROP TABLE IF EXISTS `tbl_faculty`;
CREATE TABLE `tbl_faculty` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `branchcode` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobileno` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

#
# Dumping data for table tbl_faculty
#
LOCK TABLES `tbl_faculty` WRITE;
/*!40000 ALTER TABLE `tbl_faculty` DISABLE KEYS */;

INSERT INTO `tbl_faculty` VALUES (1,'CE','admin1','admin1','Uday','Yadav','abc@yahoo.com','9999999999');
INSERT INTO `tbl_faculty` VALUES (2,'CE','admin2','admin2','Nakul','Dave','bcd@gmail.com','8888888888');
INSERT INTO `tbl_faculty` VALUES (3,'CE','admin3','admin3','Sanjay','Patel','xyz@yahoo.com','5555555555');
INSERT INTO `tbl_faculty` VALUES (4,'CE','admin4','admin4','Jigar','Mistry','abc@yahoo.com','4444444444');
INSERT INTO `tbl_faculty` VALUES (5,'CE','admin5','admin5',' M T','Savaliya','aaa@gmail.com','2222222222');
INSERT INTO `tbl_faculty` VALUES (6,'CE','admin6','admin6','Aniruddh','Dodiya','hp@yahoo.com','5555555555');
INSERT INTO `tbl_faculty` VALUES (7,'CE','admin7','admin7','Uttam ','Chauhan','sas@gmail.com','7777777777');
/*!40000 ALTER TABLE `tbl_faculty` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tbl_forum
#

DROP TABLE IF EXISTS `tbl_forum`;
CREATE TABLE `tbl_forum` (
  `forumid` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `creationdate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`forumid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

#
# Dumping data for table tbl_forum
#
LOCK TABLES `tbl_forum` WRITE;
/*!40000 ALTER TABLE `tbl_forum` DISABLE KEYS */;

INSERT INTO `tbl_forum` VALUES (1,'How to change password?','100170107026','2014-3-20');
INSERT INTO `tbl_forum` VALUES (2,'How to submit project detail?','100170107026','2014-3-20');
INSERT INTO `tbl_forum` VALUES (3,'How to make team registration?','100170107026','2014-3-20');
INSERT INTO `tbl_forum` VALUES (4,'How to submit project detail?','100170107026','2014-3-20');
INSERT INTO `tbl_forum` VALUES (5,'what is your project definition?','100170107026','2014-3-20');
INSERT INTO `tbl_forum` VALUES (23,'what is your project technology?','100170107026','2014-3-20');
INSERT INTO `tbl_forum` VALUES (24,'Who is your internal guide?','100170107026','2014-3-20');
INSERT INTO `tbl_forum` VALUES (25,'What is IDP/UDP?','100170107026','2014-3-20');
INSERT INTO `tbl_forum` VALUES (26,'How to get NOC?','100170107026','2014-3-20');
INSERT INTO `tbl_forum` VALUES (27,'How to submit my Project Work?','100170107026','2014-3-20');
INSERT INTO `tbl_forum` VALUES (28,'what is your name?','100170107026','2014-3-24');
/*!40000 ALTER TABLE `tbl_forum` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tbl_forumcomment
#

DROP TABLE IF EXISTS `tbl_forumcomment`;
CREATE TABLE `tbl_forumcomment` (
  `commentid` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `creationdate` varchar(255) DEFAULT NULL,
  `forumid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`commentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table tbl_forumcomment
#
LOCK TABLES `tbl_forumcomment` WRITE;
/*!40000 ALTER TABLE `tbl_forumcomment` DISABLE KEYS */;

/*!40000 ALTER TABLE `tbl_forumcomment` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tbl_noc
#

DROP TABLE IF EXISTS `tbl_noc`;
CREATE TABLE `tbl_noc` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) DEFAULT NULL,
  `facultyid` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `creationdate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table tbl_noc
#
LOCK TABLES `tbl_noc` WRITE;
/*!40000 ALTER TABLE `tbl_noc` DISABLE KEYS */;

/*!40000 ALTER TABLE `tbl_noc` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tbl_project
#

DROP TABLE IF EXISTS `tbl_project`;
CREATE TABLE `tbl_project` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `teamid` varchar(255) DEFAULT NULL,
  `projecttitle` varchar(255) DEFAULT NULL,
  `projectdesc` text,
  `projecttechnology` text,
  `projecttype` varchar(255) DEFAULT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  `guidename` varchar(255) DEFAULT NULL,
  `guidecontact` varchar(255) DEFAULT NULL,
  `guideemail` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `creationdate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `unq_teamid` (`teamid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

#
# Dumping data for table tbl_project
#
LOCK TABLES `tbl_project` WRITE;
/*!40000 ALTER TABLE `tbl_project` DISABLE KEYS */;

INSERT INTO `tbl_project` VALUES (20,'CE2014000000014026','    Project Review & Evaluation System','            This is web based system to track progress and genuine work of \r\n  each IDP/UDP project of  the last year student.This system is \r\n  useful to both administrator and students to manage their work \r\n  efficiently.  \r\n         \r\n  Main modules of the project are:\r\n\r\n  Create Student profile\r\n  Student profile contains information regarding to students which \r\n  includes basic details firstname,Lastname,Semester,Birthdate,\r\n  Passout Year and other contact details.\r\n\r\n  Submit project detail \r\n  Project details contain project regarding information like \r\n  Definition,Members,Abstract,Type, Technology,Guide.If type \r\n  is IDP,it will also contain company Information of students.\r\n\r\n  Approval of project\r\n  After submission of project definition,it will be examined by \r\n  administrator. If  admin will be satisfied by the content and \r\n  description of definition ,he or she will approve definition \r\n  otherwise approval of project will be denied. In this case, \r\n  students have to modify their definition to make admin\r\n  satisfied.\r\n  \r\n  Create Project report  \r\n  It includes student enrollment no and his/her company details \r\n  which he has specified in project details.Only Admin can Access\r\n  this Page for Report and NOC Purpose.\r\n\r\n  Request for NOC \r\n  Students can request for NOC letter online.\r\n\r\n  Project Tracking \r\n  Project Tracking can be done by reporting project status details \r\n  like Current work, future Work, Task Allocation,Description etc.  \r\n  within  particular time period.               \t\r\n                    \t\t\t\t\t\r\n                    \t\t\t\t\t','                    \t\t\t\t\t                    \t\t\t\t\t                    \t\t\t\t\t                    \t\t\t\t\tJSP Servlet HTML CSS                    \t\t\t\t\t\r\n                    \t\t\t\t\t\r\n                    \t\t\t\t\t\r\n                    \t\t\t\t\t\r\n                    \t\t\t\t\t\r\n                    \t\t\t\t\t','UDP','     ','     ','     ','','Accept','2014-4-15');
INSERT INTO `tbl_project` VALUES (28,'CE2014000000027071','Share My Car','qjwhehvwlbhlwhblkhwkb                    \t\t\t\t\t\r\n                    \t\t\t\t\t\r\n                    \t\t\t\t\t','ebk;jwk;tbjk;wjtbk;jbwk;j,jj                    \t\t\t\t\t\r\n                    \t\t\t\t\t','UDP',' ',' ',' ','','Accept','2014-4-15');
INSERT INTO `tbl_project` VALUES (29,'CE2014000000037040',' ABC','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa                    \t\t\t\t\t\r\n                    \t\t\t\t\t\r\n                    \t\t\t\t\t','Advance .NET Technology                    \t\t\t\t\t\r\n                    \t\t\t\t\t','UDP',' ',' ',' ','','Accept','2014-4-22');
INSERT INTO `tbl_project` VALUES (30,'CE2014000000061063','XYZ','bbbbbbbbbbbbbbbbbbbbbbbbb                    \t\t\t\t\t\r\n                    \t\t\t\t\t\r\n                    \t\t\t\t\t','JSP,Servlet,HTML                    \t\t\r\n\t\t\t\r\n                    \t\t\t\t\t','UDP',' ',' ',' ','','Accept','2014-4-22');
INSERT INTO `tbl_project` VALUES (31,'CE2014000020045067',' XYZ','ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc                    \t\t\t\t\t\r\n                    \t\t\t\t\t\r\n                    \t\t\t\t\t','PHP,HTML,CSS                    \t\t\t\t\t\r\n                    \t\t\t\t\t','UDP',' ',' ',' ','','Pending','2014-4-22');
INSERT INTO `tbl_project` VALUES (32,'CE2014005030048056',' MNO','nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn                    \t\t\t\t\t\r\n                    \t\t\t\t\t\r\n                    \t\t\t\t\t','Android,AJAX                    \t\t\t\t\t\r\n                    \t\t\t\t\t','UDP',' ',' ',' ','','Pending','2014-4-22');
/*!40000 ALTER TABLE `tbl_project` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tbl_role
#

DROP TABLE IF EXISTS `tbl_role`;
CREATE TABLE `tbl_role` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table tbl_role
#
LOCK TABLES `tbl_role` WRITE;
/*!40000 ALTER TABLE `tbl_role` DISABLE KEYS */;

/*!40000 ALTER TABLE `tbl_role` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tbl_team
#

DROP TABLE IF EXISTS `tbl_team`;
CREATE TABLE `tbl_team` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `teamid` varchar(255) NOT NULL DEFAULT '',
  `facultyid` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `member1` varchar(255) DEFAULT NULL,
  `member2` varchar(255) DEFAULT NULL,
  `member3` varchar(255) DEFAULT NULL,
  `creationdate` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `teamid_unique` (`teamid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

#
# Dumping data for table tbl_team
#
LOCK TABLES `tbl_team` WRITE;
/*!40000 ALTER TABLE `tbl_team` DISABLE KEYS */;

INSERT INTO `tbl_team` VALUES (21,'CE2014000000014026','1','100170107026','100170107014','','','2014-04-12');
INSERT INTO `tbl_team` VALUES (29,'CE2014000000027071','2','100170107027','100170107071','','','2014-04-15');
INSERT INTO `tbl_team` VALUES (30,'CE2014000000037040','3','100170107040','100170107037','','','2014-04-15');
INSERT INTO `tbl_team` VALUES (31,'CE2014000000061063','4','100170107063','100170107061','','','2014-04-18');
INSERT INTO `tbl_team` VALUES (32,'CE2014000020045067','5','100170107045','100170107020','100170107067','','2014-04-18');
INSERT INTO `tbl_team` VALUES (33,'CE2014005030048056','6','100170107056','100170107005','100170107048','100170107030','2014-04-18');
/*!40000 ALTER TABLE `tbl_team` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tbl_user
#

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `branchcode` varchar(11) DEFAULT NULL,
  `enrollment` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `teamid` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `birthdate` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contactno` varchar(255) DEFAULT NULL,
  `passout` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `enrollment` (`enrollment`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

#
# Dumping data for table tbl_user
#
LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;

INSERT INTO `tbl_user` VALUES (16,'CE','100170107026','100170107026','harshal_shah93@yahoo.com','CE2014000000014026','Harshal','Pareshbhai','Shah','05/26/1993','m','Ahmedabad                  \t\t\t\t\t\t\r\n                    \t\t\t\t\t','9426460941','2014');
INSERT INTO `tbl_user` VALUES (17,'CE','100170107014','100170107014','prakruti@gmail.com','CE2014000000014026',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014');
INSERT INTO `tbl_user` VALUES (24,'CE','100170107027','100170107027','purvesh@yahoo.com','CE2014000000027071','Purvesh','Sanjivkumar','KothRI','04/08/2014','m','QEFQEFIQELFUQLFKJ\t\t\t\r\n                    \t\t\t\t\t','420420420','2014');
INSERT INTO `tbl_user` VALUES (25,'CE','100170107071','100170107071','harsh_hrd@yahoo.com','CE2014000000027071',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014');
INSERT INTO `tbl_user` VALUES (26,'CE','100170107040','100170107040','abc@gmail.com','CE2014000000037040',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014');
INSERT INTO `tbl_user` VALUES (27,'CE','100170107037','100170107037','bbb@gmail.com','CE2014000000037040',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014');
INSERT INTO `tbl_user` VALUES (28,'CE','100170107061','100170107061','darshna@gmail.com','CE2014000000061063','darshna','aswinbhai','somani','12/04/1993','f','paldi(vasna),\r\nahmedabad 380015                    \t\t\t\t\t\r\n                    \t\t\t\t\t','9898929898','2014');
INSERT INTO `tbl_user` VALUES (29,'CE','100170107063','100170107063','bhumika@gmail.com','CE2014000000061063','bhumika','pravinsinh','vaghela','08/28/2014','f','bapunagar,\r\nahmedabad-380015                    \t\t\t\t\t\t\r\n                    \t\t\t\t\t','7878007878','2014');
INSERT INTO `tbl_user` VALUES (30,'CE','100170107020','100170107020','kirtanthakar@gmail.com','CE2014000020045067','kirtan','A.','thakkar','04/08/2014','m',' satellight,\r\nahmedabad-380015                   \t\t\t\t\t\t\r\n                    \t\t\t\t\t','9033241543','2014');
INSERT INTO `tbl_user` VALUES (31,'CE','100170107067','100170107067','tanvipatel@yahoo.com','CE2014000020045067','tanvi','R.','patel','06/10/2014','f','gaytrinagar,sec-27,\r\ngandhinagar-382027                    \t\t\t\t\t\t\r\n                    \t\t\t\t\t','962470001','2014');
INSERT INTO `tbl_user` VALUES (32,'CE','100170107045','100170107045','vidhiraval@gmail.com','CE2014000020045067','vidhi','R.','raval','02/09/1993','f','paldi,\r\nnear vijay char rasta, ahmedabad-380015                    \t\t\t\t\t\t\r\n                    \t\t\t\t\t','946748678','2014');
INSERT INTO `tbl_user` VALUES (33,'CE','100170107005','100170107005','viralpatel@yahoo.in','CE2014005030048056','viral','K.','patel','06/19/2014','m','janseva society, mehsana                   \t\t\t\t\t\t\r\n                    \t\t\t\t\t','956783655','2014');
INSERT INTO `tbl_user` VALUES (34,'CE','100170107030','100170107030','harsh@gmail.com','CE2014005030048056','harsh','A.','shukla','08/18/1993','m','                    \t\t\t\t\t\t\r\n                    \t\t\t\t\t','7846572509','2014');
INSERT INTO `tbl_user` VALUES (35,'CE','100170107048','100170107048','dhyeyshah@ymail.com','CE2014005030048056','dhyey','H.','shah','09/14/1993','m','shivranjni,ahmedabad-380015                    \t\t\t\t\t\t\r\n                    \t\t\t\t\t','8438583928','2014');
INSERT INTO `tbl_user` VALUES (36,'CE','100170107056','100170107056','sharan@gmail.com','CE2014005030048056','sharan','G.','raghu','01/21/1992','m','sector-3,gandhinagar-382003                    \t\t\t\t\t\t\r\n                    \t\t\t\t\t','9846578275','2014');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
