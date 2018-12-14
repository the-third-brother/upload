/*
Navicat MySQL Data Transfer

Source Server         : 94.191.68.55
Source Server Version : 50642
Source Host           : 94.191.68.55:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2018-12-14 17:25:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for edoc_category
-- ----------------------------
DROP TABLE IF EXISTS `edoc_category`;
CREATE TABLE `edoc_category` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of edoc_category
-- ----------------------------
INSERT INTO `edoc_category` VALUES ('1', 'java');
INSERT INTO `edoc_category` VALUES ('2', 'c');
INSERT INTO `edoc_category` VALUES ('3', 'c++');
