/*
Navicat MySQL Data Transfer

Source Server         : 94.191.68.55
Source Server Version : 50642
Source Host           : 94.191.68.55:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2018-12-14 17:25:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for edoc_entry
-- ----------------------------
DROP TABLE IF EXISTS `edoc_entry`;
CREATE TABLE `edoc_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文档编号',
  `category_id` int(11) NOT NULL COMMENT '分类编号',
  `title` varchar(255) NOT NULL COMMENT '文档名称',
  `summary` varchar(255) DEFAULT NULL COMMENT '文档摘要',
  `upload_user` varchar(255) DEFAULT NULL COMMENT '上传人',
  `create_date` datetime NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of edoc_entry
-- ----------------------------
INSERT INTO `edoc_entry` VALUES ('1', '1', 'jdbc连接', 'jdbc', 'David', '2018-12-12 12:15:22');
INSERT INTO `edoc_entry` VALUES ('2', '2', 'main函数', 'main函数', 'Jerry', '2018-12-11 12:15:52');
INSERT INTO `edoc_entry` VALUES ('3', '3', '面向对象编程', '面向对象', 'Curry', '2018-12-10 12:16:34');
INSERT INTO `edoc_entry` VALUES ('4', '1', 'java语言特性', 'java语言特性', '3', '2018-12-03 00:00:00');
