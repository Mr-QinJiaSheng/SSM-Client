/*
Navicat MySQL Data Transfer

Source Host           : localhost:3306
Source Database       : ssmclient

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2019-11-11 09:51:02
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `kh_clientinfo`
-- ----------------------------
DROP TABLE IF EXISTS `kh_clientinfo`;
CREATE TABLE `kh_clientinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kuhuname` varchar(255) DEFAULT NULL,
  `kehuaddres` varchar(255) DEFAULT NULL,
  `kehutel` varchar(255) DEFAULT NULL,
  `kehulei` varchar(255) DEFAULT NULL,
  `kehugenre` varchar(255) DEFAULT NULL,
  `kehuday` varchar(255) DEFAULT NULL,
  `kefuname` varchar(255) DEFAULT NULL,
  `kaiday` varchar(255) DEFAULT NULL,
  `weixin` varchar(255) DEFAULT NULL,
  `xu` varchar(255) DEFAULT NULL,
  `khremark` varchar(255) DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `khstate` varchar(255) DEFAULT NULL,
  `qu` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `an` varchar(255) DEFAULT NULL,
  `yumoney` varchar(255) DEFAULT NULL,
  `jiename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kh_clientinfo
-- ----------------------------
INSERT INTO kh_clientinfo VALUES ('4', '11', '33', '22', 'D:6个月以上交房客户', '', '2019-08-07', null, '', '', '', '', '', '完成', null, null, null, null, null);
INSERT INTO kh_clientinfo VALUES ('5', '1', '3', '2', 'B:3个月内交房客户', '', '2019-08-08', null, '', '', '', '', '', '跟进中', null, null, null, null, null);
INSERT INTO kh_clientinfo VALUES ('6', '李四', '武汉', '1', 'D:6个月以上交房客户', '', '2019-08-09', '李白', '', '', '', '', '', '丢失', null, null, null, null, null);
INSERT INTO kh_clientinfo VALUES ('8', '王德发', '', '15892155', 'D:6个月以上交房客户', '精装', '2019-08-17', '李白', '2019-10-18', '否', '', '', '抖音', '跟进中', null, null, null, null, null);
INSERT INTO kh_clientinfo VALUES ('9', '万德福', '武汉', '1598678911', 'A:已交房客户', '精装', '2019-08-17', '张三', '2019-09-17', '否', '', '', '美团', '跟进中', null, null, null, null, null);

-- ----------------------------
-- Table structure for `kh_hui`
-- ----------------------------
DROP TABLE IF EXISTS `kh_hui`;
CREATE TABLE `kh_hui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inid` int(11) DEFAULT NULL,
  `scday` varchar(255) DEFAULT NULL,
  `wenti` varchar(255) DEFAULT NULL,
  `jieguo` varchar(255) DEFAULT NULL,
  `jieday` varchar(255) DEFAULT NULL,
  `jiename` varchar(255) DEFAULT NULL,
  `yuday` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inid` (`inid`),
  CONSTRAINT `kh_hui_ibfk_1` FOREIGN KEY (`inid`) REFERENCES `kh_clientinfo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kh_hui
-- ----------------------------
INSERT INTO kh_hui VALUES ('2', '4', '2019-08-09', '11233', '22', '2019-08-13', '李白', '2019-08-15');
INSERT INTO kh_hui VALUES ('13', '6', '2019-08-16', '11', '', '', '', '2019-08-18');
INSERT INTO kh_hui VALUES ('15', '8', '2019-08-17', '客户第一次跟进', null, null, null, '2019-09-16');
INSERT INTO kh_hui VALUES ('16', '9', '2019-08-17', '客户第一次跟进', null, null, null, '2019-08-20');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `onlinetime` varchar(255) DEFAULT NULL,
  `exittime` varchar(255) DEFAULT NULL,
  `sessionid` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO log VALUES ('1', '李白', '2019-08-17 14:34:42', '2019-08-17 14:35:24', '04CCC74C170FDDB37BB7F152A7D00522', null);
INSERT INTO log VALUES ('2', '李白', '2019-08-17 14:35:30', '2019-08-17 16:36:34', 'F316831A387B1F2D492E929A5994282C', null);
INSERT INTO log VALUES ('3', '张三', '2019-08-17 16:36:38', '2019-08-17 16:38:03', 'AC16E46C4E755768005ECC6F3B2C613D', null);
INSERT INTO log VALUES ('4', '张三', '2019-08-17 16:38:36', '2019-08-17 19:33:12', 'AB038983FA249AB5AE5742A353886C00', null);
INSERT INTO log VALUES ('5', '李白', '2019-08-18 08:32:57', '2019-08-18 13:17:03', 'BB75CF76973BA557FB6530E3D4F17CDC', null);
INSERT INTO log VALUES ('6', '李白', '2019-08-18 14:08:35', '2019-08-18 16:54:13', '0B4EBF7859F530F954CE7A875FF93C23', null);
INSERT INTO log VALUES ('7', '李白', '2019-08-20 08:52:29', '2019-08-20 10:28:26', 'C2A21E01BFB3FBCD2C9FFEFC11C24D5E', null);
INSERT INTO log VALUES ('8', '李白', '2019-08-20 10:28:30', '2019-08-20 17:03:58', '1BA8F6F9F2D8DA11769B64C2EEB16F7B', null);
INSERT INTO log VALUES ('9', '李白', '2019-08-21 08:14:49', null, '4A26157D91BCD18307A05CE58251B817', null);
INSERT INTO log VALUES ('10', '李白', '2019-08-21 15:43:46', '2019-08-21 21:06:23', '5D81384ABB287793500B8227E35AE513', null);
INSERT INTO log VALUES ('11', '李白', '2019-08-22 08:40:54', '2019-08-22 08:41:10', '611218534154E5C6AB37124EA791CA8B', null);
INSERT INTO log VALUES ('12', '李白', '2019-08-22 09:35:52', '2019-08-22 12:11:42', 'A5476930F815FD009F336FF11B0388C4', null);
INSERT INTO log VALUES ('13', '李白', '2019-08-22 13:54:27', '2019-08-22 16:26:38', 'A8E6CB947B72AC7CDE4ED665C0074C6A', null);
INSERT INTO log VALUES ('14', '李白', '2019-08-22 16:15:35', '2019-08-22 18:47:56', '2DA6512334A57373125809CD6F55D699', null);
INSERT INTO log VALUES ('15', '李白', '2019-08-26 13:52:40', '2019-08-26 14:29:01', '14C5B3E7B24043D4FF89AF4ABD2A0A57', null);
INSERT INTO log VALUES ('16', '张三', '2019-08-26 14:29:11', '2019-08-26 18:23:29', 'CEEC477B341113090072897C1CF5C943', null);
INSERT INTO log VALUES ('17', '李白', '2019-08-31 14:49:23', '2019-08-31 17:21:12', '998B6C0DF670221386896D45E7C82610', null);
INSERT INTO log VALUES ('18', '李白', '2019-10-31 08:27:39', null, '5559BCF5ACB6459E748E2C8DAC281DE2', null);

-- ----------------------------
-- Table structure for `logs`
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loname` varchar(255) DEFAULT NULL,
  `day` varchar(255) DEFAULT NULL,
  `lei` varchar(255) DEFAULT NULL,
  `biao` varchar(255) DEFAULT NULL,
  `biaoid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO logs VALUES ('1', '李白', '2019-08-17 11:33:45', '删除', '客户表及跟进详情', '自己的事情+1313588888');
INSERT INTO logs VALUES ('2', 'xin', '2019-10-31 09:42:09', '删除', '客户表及跟进详情', '张三+1111');

-- ----------------------------
-- Table structure for `yh_employee`
-- ----------------------------
DROP TABLE IF EXISTS `yh_employee`;
CREATE TABLE `yh_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empName` varchar(100) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_yh_employee` (`roleId`),
  CONSTRAINT `yh_employee_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `yh_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of yh_employee
-- ----------------------------
INSERT INTO yh_employee VALUES ('3', '张三', '698D51A19D8A121CE581499D7B701668', '3', '111');
INSERT INTO yh_employee VALUES ('4', '李四', '698D51A19D8A121CE581499D7B701668', '3', null);
INSERT INTO yh_employee VALUES ('5', '', '', '1', '');
INSERT INTO yh_employee VALUES ('6', 'admin', '21232F297A57A5A743894AE4A801FC3', '1', '');

-- ----------------------------
-- Table structure for `yh_role`
-- ----------------------------
DROP TABLE IF EXISTS `yh_role`;
CREATE TABLE `yh_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yh_role
-- ----------------------------
INSERT INTO yh_role VALUES ('1', '管理员');
INSERT INTO yh_role VALUES ('2', '客服');
INSERT INTO yh_role VALUES ('3', '客服主管');

-- ----------------------------
-- Table structure for `yh_roleroot`
-- ----------------------------
DROP TABLE IF EXISTS `yh_roleroot`;
CREATE TABLE `yh_roleroot` (
  `roleId` int(11) NOT NULL,
  `rootId` int(11) NOT NULL,
  `rootIds` int(11) DEFAULT NULL,
  KEY `FK_yh_roleroot1` (`roleId`),
  KEY `FK_yh_roleroot` (`rootId`),
  CONSTRAINT `yh_roleroot_ibfk_1` FOREIGN KEY (`rootId`) REFERENCES `yh_root` (`id`) ON DELETE CASCADE,
  CONSTRAINT `yh_roleroot_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `yh_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of yh_roleroot
-- ----------------------------
INSERT INTO yh_roleroot VALUES ('1', '1', null);
INSERT INTO yh_roleroot VALUES ('1', '2', null);
INSERT INTO yh_roleroot VALUES ('1', '3', null);
INSERT INTO yh_roleroot VALUES ('1', '4', null);
INSERT INTO yh_roleroot VALUES ('1', '5', null);
INSERT INTO yh_roleroot VALUES ('1', '6', null);
INSERT INTO yh_roleroot VALUES ('1', '7', null);
INSERT INTO yh_roleroot VALUES ('1', '8', null);
INSERT INTO yh_roleroot VALUES ('1', '9', null);
INSERT INTO yh_roleroot VALUES ('1', '10', null);
INSERT INTO yh_roleroot VALUES ('1', '11', null);
INSERT INTO yh_roleroot VALUES ('1', '12', null);
INSERT INTO yh_roleroot VALUES ('1', '13', null);
INSERT INTO yh_roleroot VALUES ('1', '14', null);
INSERT INTO yh_roleroot VALUES ('1', '15', null);
INSERT INTO yh_roleroot VALUES ('1', '16', null);
INSERT INTO yh_roleroot VALUES ('1', '17', null);
INSERT INTO yh_roleroot VALUES ('1', '18', null);
INSERT INTO yh_roleroot VALUES ('1', '19', null);
INSERT INTO yh_roleroot VALUES ('1', '20', null);
INSERT INTO yh_roleroot VALUES ('1', '21', null);
INSERT INTO yh_roleroot VALUES ('1', '22', null);
INSERT INTO yh_roleroot VALUES ('1', '23', null);
INSERT INTO yh_roleroot VALUES ('1', '24', null);
INSERT INTO yh_roleroot VALUES ('1', '25', null);
INSERT INTO yh_roleroot VALUES ('1', '26', null);
INSERT INTO yh_roleroot VALUES ('1', '27', null);
INSERT INTO yh_roleroot VALUES ('1', '28', null);
INSERT INTO yh_roleroot VALUES ('1', '29', null);
INSERT INTO yh_roleroot VALUES ('1', '30', null);
INSERT INTO yh_roleroot VALUES ('1', '31', null);
INSERT INTO yh_roleroot VALUES ('1', '32', null);
INSERT INTO yh_roleroot VALUES ('2', '15', null);
INSERT INTO yh_roleroot VALUES ('2', '16', null);
INSERT INTO yh_roleroot VALUES ('2', '18', null);
INSERT INTO yh_roleroot VALUES ('2', '19', null);
INSERT INTO yh_roleroot VALUES ('2', '20', null);
INSERT INTO yh_roleroot VALUES ('2', '21', null);
INSERT INTO yh_roleroot VALUES ('2', '22', null);
INSERT INTO yh_roleroot VALUES ('2', '23', null);
INSERT INTO yh_roleroot VALUES ('2', '24', null);
INSERT INTO yh_roleroot VALUES ('2', '25', null);
INSERT INTO yh_roleroot VALUES ('2', '26', null);
INSERT INTO yh_roleroot VALUES ('2', '27', null);
INSERT INTO yh_roleroot VALUES ('2', '28', null);
INSERT INTO yh_roleroot VALUES ('2', '29', null);
INSERT INTO yh_roleroot VALUES ('2', '31', null);
INSERT INTO yh_roleroot VALUES ('3', '3', null);
INSERT INTO yh_roleroot VALUES ('3', '9', null);
INSERT INTO yh_roleroot VALUES ('3', '10', null);
INSERT INTO yh_roleroot VALUES ('3', '11', null);
INSERT INTO yh_roleroot VALUES ('3', '12', null);
INSERT INTO yh_roleroot VALUES ('3', '13', null);
INSERT INTO yh_roleroot VALUES ('3', '14', null);
INSERT INTO yh_roleroot VALUES ('3', '15', null);
INSERT INTO yh_roleroot VALUES ('3', '16', null);
INSERT INTO yh_roleroot VALUES ('3', '17', null);
INSERT INTO yh_roleroot VALUES ('3', '18', null);
INSERT INTO yh_roleroot VALUES ('3', '19', null);
INSERT INTO yh_roleroot VALUES ('3', '20', null);
INSERT INTO yh_roleroot VALUES ('3', '21', null);
INSERT INTO yh_roleroot VALUES ('3', '22', null);
INSERT INTO yh_roleroot VALUES ('3', '23', null);
INSERT INTO yh_roleroot VALUES ('3', '24', null);
INSERT INTO yh_roleroot VALUES ('3', '25', null);
INSERT INTO yh_roleroot VALUES ('3', '26', null);
INSERT INTO yh_roleroot VALUES ('3', '27', null);
INSERT INTO yh_roleroot VALUES ('3', '28', null);
INSERT INTO yh_roleroot VALUES ('3', '29', null);
INSERT INTO yh_roleroot VALUES ('3', '30', null);
INSERT INTO yh_roleroot VALUES ('3', '31', null);
INSERT INTO yh_roleroot VALUES ('2', '32', null);
INSERT INTO yh_roleroot VALUES ('3', '32', null);

-- ----------------------------
-- Table structure for `yh_root`
-- ----------------------------
DROP TABLE IF EXISTS `yh_root`;
CREATE TABLE `yh_root` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rootName` varchar(252) DEFAULT NULL,
  `url` varchar(252) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yh_root
-- ----------------------------
INSERT INTO yh_root VALUES ('1', '权限管理前取数据', 'YhroleController/grant');
INSERT INTO yh_root VALUES ('2', '权限管理', 'YhroleController/grant_save');
INSERT INTO yh_root VALUES ('3', '显示', 'YhroleController/jshow');
INSERT INTO yh_root VALUES ('4', '删除角色', 'YhroleController/jdel');
INSERT INTO yh_root VALUES ('5', '角色修改前取数据', 'YhroleController/jloadById');
INSERT INTO yh_root VALUES ('6', '角色修改', 'YhroleController/jupdate');
INSERT INTO yh_root VALUES ('7', '角色添加前取数据', 'YhroleController/jadd');
INSERT INTO yh_root VALUES ('8', '添加角色并添加权限', 'YhroleController/jaddload');
INSERT INTO yh_root VALUES ('9', '人员管理显示', 'YhroleController/show');
INSERT INTO yh_root VALUES ('10', '人员编辑取数据', 'YhroleController/loads');
INSERT INTO yh_root VALUES ('11', '人员编辑', 'YhroleController/updates');
INSERT INTO yh_root VALUES ('12', '人员删除', 'YhroleController/del');
INSERT INTO yh_root VALUES ('13', '人员添加前取数据', 'YhroleController/doadd');
INSERT INTO yh_root VALUES ('14', '人员添加', 'YhroleController/add');
INSERT INTO yh_root VALUES ('15', '登录信息', 'LogController/show');
INSERT INTO yh_root VALUES ('16', '登录查询', 'LogController/like');
INSERT INTO yh_root VALUES ('17', '人员模糊查询', 'YhroleController/like');
INSERT INTO yh_root VALUES ('18', '客户表显示显示', 'KhClientinfoController/show');
INSERT INTO yh_root VALUES ('19', '客户表模糊查找显示', 'KhClientinfoController/like');
INSERT INTO yh_root VALUES ('20', '客户表显示添加', 'KhClientinfoController/add');
INSERT INTO yh_root VALUES ('21', '客户表显示删除', 'KhClientinfoController/del');
INSERT INTO yh_root VALUES ('22', '客户表编辑前取数据', 'KhClientinfoController/load');
INSERT INTO yh_root VALUES ('23', '客户表编辑', 'KhClientinfoController/update');
INSERT INTO yh_root VALUES ('24', '客户跟进表详情查看', 'KhHuiController/xiang');
INSERT INTO yh_root VALUES ('25', '客户跟进表详情添加', 'KhHuiController/add');
INSERT INTO yh_root VALUES ('26', '客户跟进表详情删除', 'KhHuiController/del');
INSERT INTO yh_root VALUES ('27', '客户跟进表详情修改', 'KhHuiController/update');
INSERT INTO yh_root VALUES ('28', '客户跟进记录表', 'KhHuiController/show');
INSERT INTO yh_root VALUES ('29', '客户跟进记录表查询', 'KhHuiController/like');
INSERT INTO yh_root VALUES ('30', '导出客户跟进记录xls表', 'KhHuiController/xls');
INSERT INTO yh_root VALUES ('31', '个人操作信息记录', 'LogController/shows');
INSERT INTO yh_root VALUES ('32', '客户跟进表未跟进记录', 'KhHuiController/weishow');
