CREATE DATABASE `sparsdata` DEFAULT CHARACTER SET utf8;

USE `sparsdata`;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `mdContent` text,
  `htmlContent` text,
  `summary` text,
  `cid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `publishDate` datetime DEFAULT NULL,
  `editTime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `pageView` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`id`),
  CONSTRAINT `article_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', 'Java', 'Hello Isaac!', 'Hello Isaac!', '60', '6', '2020-10-24 10:05:20', '2020-10-24 10:05:20', '1', '1');


-- ----------------------------
-- Table structure for article_tags
-- ----------------------------
DROP TABLE IF EXISTS `article_tags`;
CREATE TABLE `article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `article_tags_ibfk_1` (`aid`),
  CONSTRAINT `article_tags_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `article` (`id`) ON DELETE CASCADE,
  CONSTRAINT `article_tags_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_tags
-- ----------------------------

INSERT INTO `article_tags` VALUES ('49', '108', '34');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cateName` varchar(64) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('56', 'Java', '2020-10-21');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL,
  `content` text,
  `publishDate` datetime DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`),
  KEY `uid` (`uid`),
  KEY `parentId` (`parentId`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `article` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`),
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`parentId`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for pv
-- ----------------------------
DROP TABLE IF EXISTS `pv`;
CREATE TABLE `pv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countDate` date DEFAULT NULL,
  `pv` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pv_ibfk_1` (`uid`),
  CONSTRAINT `pv_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv
-- ----------------------------
INSERT INTO `pv` VALUES ('1', '2020-10-24', '20', '6');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'Admin');
INSERT INTO `roles` VALUES ('2', 'Nomal user');
INSERT INTO `roles` VALUES ('3', 'Test Role');

-- ----------------------------
-- Table structure for roles_user
-- ----------------------------
DROP TABLE IF EXISTS `roles_user`;
CREATE TABLE `roles_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT '2',
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `roles_user_ibfk_2` (`uid`),
  CONSTRAINT `roles_user_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `roles` (`id`),
  CONSTRAINT `roles_user_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles_user
-- ----------------------------

INSERT INTO `roles_user` VALUES ('108', '1', '1');

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagName` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tagName` (`tagName`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('66', 'Java');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `email` varchar(64) DEFAULT NULL,
  `userface` varchar(255) DEFAULT NULL,
  `regTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------

INSERT INTO `user` VALUES ('1', 'Rui', 'Rui', '202cb962ac59075b964b07152d234b70', '1', 'rzhu@ieee.org', NULL, NULL);

-- ----------------------------
-- View structure for pvview
-- ----------------------------
DROP VIEW IF EXISTS `pvview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `pvview` AS select sum(pv) as pv,uid from pv group by uid ;

-- ----------------------------
-- View structure for totalpvview
-- ----------------------------
DROP VIEW IF EXISTS `totalpvview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `totalpvview` AS select sum(pageView) as totalPv,uid from article a group by uid ;
SET FOREIGN_KEY_CHECKS=1;
