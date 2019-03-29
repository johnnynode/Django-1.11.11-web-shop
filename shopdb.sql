/*
 Navicat Premium Data Transfer

 Source Server         : full-stack
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost
 Source Database       : shopdb

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : utf-8

 Date: 03/29/2019 08:37:55 AM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `auth_permission`
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry'), ('2', 'Can change log entry', '1', 'change_logentry'), ('3', 'Can delete log entry', '1', 'delete_logentry'), ('4', 'Can add permission', '2', 'add_permission'), ('5', 'Can change permission', '2', 'change_permission'), ('6', 'Can delete permission', '2', 'delete_permission'), ('7', 'Can add group', '3', 'add_group'), ('8', 'Can change group', '3', 'change_group'), ('9', 'Can delete group', '3', 'delete_group'), ('10', 'Can add user', '4', 'add_user'), ('11', 'Can change user', '4', 'change_user'), ('12', 'Can delete user', '4', 'delete_user'), ('13', 'Can add content type', '5', 'add_contenttype'), ('14', 'Can change content type', '5', 'change_contenttype'), ('15', 'Can delete content type', '5', 'delete_contenttype'), ('16', 'Can add session', '6', 'add_session'), ('17', 'Can change session', '6', 'change_session'), ('18', 'Can delete session', '6', 'delete_session');
COMMIT;

-- ----------------------------
--  Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `detail`
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `orderid` int(11) unsigned DEFAULT NULL,
  `goodsid` int(11) unsigned DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `price` double(6,2) DEFAULT NULL,
  `num` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `detail`
-- ----------------------------
BEGIN;
INSERT INTO `detail` VALUES ('1', '1', '1', 'x1', '30.00', '1'), ('2', '2', '1', 'x1', '30.00', '2'), ('3', '3', '3', '哈雷', '22.00', '2');
COMMIT;

-- ----------------------------
--  Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `django_content_type`
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry'), ('3', 'auth', 'group'), ('2', 'auth', 'permission'), ('4', 'auth', 'user'), ('5', 'contenttypes', 'contenttype'), ('6', 'sessions', 'session');
COMMIT;

-- ----------------------------
--  Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `django_migrations`
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-04-08 12:22:15.498037'), ('2', 'auth', '0001_initial', '2018-04-08 12:22:15.858037'), ('3', 'admin', '0001_initial', '2018-04-08 12:22:15.943037'), ('4', 'admin', '0002_logentry_remove_auto_add', '2018-04-08 12:22:15.960537'), ('5', 'contenttypes', '0002_remove_content_type_name', '2018-04-08 12:22:16.020537'), ('6', 'auth', '0002_alter_permission_name_max_length', '2018-04-08 12:22:16.050537'), ('7', 'auth', '0003_alter_user_email_max_length', '2018-04-08 12:22:16.095537'), ('8', 'auth', '0004_alter_user_username_opts', '2018-04-08 12:22:16.110537'), ('9', 'auth', '0005_alter_user_last_login_null', '2018-04-08 12:22:16.140037'), ('10', 'auth', '0006_require_contenttypes_0002', '2018-04-08 12:22:16.147037'), ('11', 'auth', '0007_alter_validators_add_error_messages', '2018-04-08 12:22:16.164037'), ('12', 'auth', '0008_alter_user_username_max_length', '2018-04-08 12:22:16.241037'), ('13', 'sessions', '0001_initial', '2018-04-08 12:22:16.268537');
COMMIT;

-- ----------------------------
--  Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `django_session`
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('8i6g2cxek0e732i9dqqu4wx3l30ca42l', 'MDY5ZjkzNTE1NmRhMTMzMzlkNWQyMmZmZjM5ZGI0NzQ3MjdiMDdhMTp7InZlcmlmeWNvZGUiOiI0MjIxIiwiYWRtaW51c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwibmFtZSI6Ilx1N2JhMVx1NzQwNlx1NTQ1ODIiLCJwYXNzd29yZCI6IjIxMjMyZjI5N2E1N2E1YTc0Mzg5NGEwZTRhODAxZmMzIiwiYWRkcmVzcyI6Ilx1NTMxN1x1NGVhY1x1NWUwMlx1NjcxZFx1OTYzM1x1NTMzYVx1NTkyN1x1NWM3MVx1NWI1MDAwN1x1NTNmNyIsInBob25lIjoiMTM1NjY2ODY4NjgiLCJlbWFpbCI6IjEyMjc5NDEwNUBxcS5jb20iLCJzdGF0ZSI6MH19', '2018-04-23 06:42:32.449065'), ('mwsr6yu2q1010woxzlpsccxufg5trz1t', 'MGRmOGM0ZDljZjJhMDI4YTE0ZTg3MTkxOTE5N2IxZDczOTNkMzQ4Yzp7InZlcmlmeWNvZGUiOiI5Njg1Iiwic2hvcGxpc3QiOnt9LCJhZG1pbnVzZXIiOnsiaWQiOjMsInVzZXJuYW1lIjoiemhhbmdzYW4iLCJuYW1lIjoiXHU1ZjIwXHU0ZTA5IiwicGFzc3dvcmQiOiIyMDJjYjk2MmFjNTkwNzViOTY0YjA3MTUyZDIzNGI3MCIsImFkZHJlc3MiOiJcdTUzMTdcdTRlYWNcdTVlMDJcdTRlMDlcdTkxY2NcdTZjYjNcdTg2MTFcdTgzYzdcdTY3NTExMDJcdTUzZjciLCJwaG9uZSI6IjEyMzQ1Njc2ODkwIiwiZW1haWwiOiJ6aGFuZ3NhbkAxMS5jb20iLCJzdGF0ZSI6MH0sInZpcHVzZXIiOnsiaWQiOjMsInVzZXJuYW1lIjoiemhhbmdzYW4iLCJuYW1lIjoiXHU1ZjIwXHU0ZTA5IiwicGFzc3dvcmQiOiIyMDJjYjk2MmFjNTkwNzViOTY0YjA3MTUyZDIzNGI3MCIsImFkZHJlc3MiOiJcdTUzMTdcdTRlYWNcdTVlMDJcdTRlMDlcdTkxY2NcdTZjYjNcdTg2MTFcdTgzYzdcdTY3NTExMDJcdTUzZjciLCJwaG9uZSI6IjEyMzQ1Njc2ODkwIiwiZW1haWwiOiJ6aGFuZ3NhbkAxMS5jb20iLCJzdGF0ZSI6MH19', '2019-04-11 15:40:49.687904');
COMMIT;

-- ----------------------------
--  Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` int(11) unsigned NOT NULL,
  `goods` varchar(32) NOT NULL,
  `company` varchar(50) DEFAULT NULL,
  `content` text,
  `price` double(6,2) unsigned NOT NULL,
  `picname` varchar(255) DEFAULT NULL,
  `store` int(11) unsigned NOT NULL DEFAULT '0',
  `num` int(11) unsigned NOT NULL DEFAULT '0',
  `clicknum` int(11) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeid` (`typeid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `goods`
-- ----------------------------
BEGIN;
INSERT INTO `goods` VALUES ('1', '3', 'x1', 'ss', '<p>阿萨德范德萨发大水</p>', '30.00', '1553749540.5400069.jpg', '111', '0', '3', '1', '2019-03-28 05:05:40'), ('2', '4', '照相机', '三星', '<p>sdfdsfdsfdsfsfds</p>', '3000.00', '1553780402.4391391.jpg', '122', '0', '0', '1', '2019-03-28 13:40:02'), ('3', '11', '哈雷', '测试', '<p>sw</p>', '22.00', '1553780560.702442.jpeg', '112', '0', '1', '1', '2019-03-28 13:42:40'), ('4', '3', '【设计师合作款】女装 乔其纱吊带连衣裙 417143 优衣库', 'x', '<p>sds</p>', '12.00', '1553786503.20545.webp', '1', '0', '0', '1', '2019-03-28 15:21:43'), ('5', '4', 'huawei', '1h', '<p>水电费胜多负少的<br/></p>', '11.00', '1553787080.101948.jpg', '1', '0', '0', '1', '2019-03-28 15:31:20'), ('6', '3', '红', '防守打法', '<p>是的范德萨</p>', '1.00', '1553787114.7070642.jpg', '22', '0', '0', '1', '2019-03-28 15:31:54'), ('7', '9', 'iphone', '112', '<p>sdfsdf</p>', '2233.00', '1553787164.509481.jpg', '1', '0', '0', '1', '2019-03-28 15:32:44');
COMMIT;

-- ----------------------------
--  Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT NULL,
  `linkman` varchar(32) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `code` char(6) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `total` double(8,2) unsigned DEFAULT NULL,
  `state` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `orders`
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES ('1', '3', '张三', '北京市三里河蘑菇村102号', '123456', '12345676890', '2019-03-28 05:06:34', '30.00', '2'), ('2', '3', '张三', '北京市三里河蘑菇村102号', '8851', '12345676890', '2019-03-28 13:36:57', '60.00', '3'), ('3', '3', '张三', '北京市三里河蘑菇村102号', '', '12345676890', '2019-03-28 13:43:06', '44.00', '3');
COMMIT;

-- ----------------------------
--  Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `pid` int(11) unsigned DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `type`
-- ----------------------------
BEGIN;
INSERT INTO `type` VALUES ('1', '服装', '0', '0,'), ('2', '数码', '0', '0,'), ('3', '女装', '1', '0,1,'), ('4', '数码相机', '2', '0,2,'), ('5', '食品', '0', '0,'), ('6', '电脑', '2', '0,2,'), ('7', '男装', '1', '0,1,'), ('8', '儿童装', '1', '0,1,'), ('9', '手机', '2', '0,2,'), ('11', '零食', '5', '0,5,');
COMMIT;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `password` char(32) NOT NULL,
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `address` varchar(255) DEFAULT NULL,
  `code` char(6) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', 'admin', '管理员2', '21232f297a57a5a743894a0e4a801fc3', '1', '北京市朝阳区大山子007号', '100086', '13566686868', '@qq.com', '0', '2018-04-07 21:20:08'), ('3', 'zhangsan', '张三', '202cb962ac59075b964b07152d234b70', '1', '北京市三里河蘑菇村102号', '100086', '12345676890', 'zhangsan@11.com', '0', '2018-04-08 11:11:18'), ('4', 'lisi', '李四', '202cb962ac59075b964b07152d234b70', '0', '北京市三里河蘑菇村103号', '100088', '6666666666666', 'lisi@11.com', '1', '2018-04-08 11:12:21'), ('6', 'wangwu', '王五', '202cb962ac59075b964b07152d234b70', '0', '北京市三里河蘑菇村102号', '100086', '12345676890', 'zhangsan@11.com', '2', '2018-04-08 12:58:58');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
