/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50554
Source Host           : localhost:3306
Source Database       : crm_32

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2018-08-04 21:21:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for base_dict
-- ----------------------------
DROP TABLE IF EXISTS `base_dict`;
CREATE TABLE `base_dict` (
  `dict_id` varchar(255) NOT NULL,
  `dict_type_code` varchar(255) DEFAULT NULL,
  `dict_type_name` varchar(255) DEFAULT NULL,
  `dict_item_name` varchar(255) DEFAULT NULL,
  `dict_item_code` varchar(255) DEFAULT NULL,
  `dict_memo` varchar(255) DEFAULT NULL,
  `dict_sort` int(11) DEFAULT NULL,
  `dict_enable` char(1) DEFAULT NULL,
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_dict
-- ----------------------------
INSERT INTO `base_dict` VALUES ('1', '001', '客户行业', '教育培训 ', null, null, '1', '1');
INSERT INTO `base_dict` VALUES ('10', '003', '公司性质', '民企', null, null, '3', '1');
INSERT INTO `base_dict` VALUES ('12', '004', '年营业额', '1-10万', null, null, '1', '1');
INSERT INTO `base_dict` VALUES ('13', '004', '年营业额', '10-20万', null, null, '2', '1');
INSERT INTO `base_dict` VALUES ('14', '004', '年营业额', '20-50万', null, null, '3', '1');
INSERT INTO `base_dict` VALUES ('15', '004', '年营业额', '50-100万', null, null, '4', '1');
INSERT INTO `base_dict` VALUES ('16', '004', '年营业额', '100-500万', null, null, '5', '1');
INSERT INTO `base_dict` VALUES ('17', '004', '年营业额', '500-1000万', null, null, '6', '1');
INSERT INTO `base_dict` VALUES ('18', '005', '客户状态', '基础客户', null, null, '1', '1');
INSERT INTO `base_dict` VALUES ('19', '005', '客户状态', '潜在客户', null, null, '2', '1');
INSERT INTO `base_dict` VALUES ('2', '001', '客户行业', '电子商务', null, null, '2', '1');
INSERT INTO `base_dict` VALUES ('20', '005', '客户状态', '成功客户', null, null, '3', '1');
INSERT INTO `base_dict` VALUES ('21', '005', '客户状态', '无效客户', null, null, '4', '1');
INSERT INTO `base_dict` VALUES ('22', '006', '客户级别', '普通客户', null, null, '1', '1');
INSERT INTO `base_dict` VALUES ('23', '006', '客户级别', 'VIP客户', null, null, '2', '1');
INSERT INTO `base_dict` VALUES ('24', '007', '商机状态', '意向客户', null, null, '1', '1');
INSERT INTO `base_dict` VALUES ('25', '007', '商机状态', '初步沟通', null, null, '2', '1');
INSERT INTO `base_dict` VALUES ('26', '007', '商机状态', '深度沟通', null, null, '3', '1');
INSERT INTO `base_dict` VALUES ('27', '007', '商机状态', '签订合同', null, null, '4', '1');
INSERT INTO `base_dict` VALUES ('3', '001', '客户行业', '对外贸易', null, null, '3', '1');
INSERT INTO `base_dict` VALUES ('30', '008', '商机类型', '新业务', null, null, '1', '1');
INSERT INTO `base_dict` VALUES ('31', '008', '商机类型', '现有业务', null, null, '2', '1');
INSERT INTO `base_dict` VALUES ('32', '009', '商机来源', '电话营销', null, null, '1', '1');
INSERT INTO `base_dict` VALUES ('33', '009', '商机来源', '网络营销', null, null, '2', '1');
INSERT INTO `base_dict` VALUES ('34', '009', '商机来源', '推广活动', null, null, '3', '1');
INSERT INTO `base_dict` VALUES ('4', '001', '客户行业', '酒店旅游', null, null, '4', '1');
INSERT INTO `base_dict` VALUES ('5', '001', '客户行业', '房地产', null, null, '5', '1');
INSERT INTO `base_dict` VALUES ('6', '002', '客户信息来源', '电话营销', null, null, '1', '1');
INSERT INTO `base_dict` VALUES ('7', '002', '客户信息来源', '网络营销', null, null, '2', '1');
INSERT INTO `base_dict` VALUES ('8', '003', '公司性质', '合资', null, null, '1', '1');
INSERT INTO `base_dict` VALUES ('9', '003', '公司性质', '国企', null, null, '2', '1');

-- ----------------------------
-- Table structure for cst_customer
-- ----------------------------
DROP TABLE IF EXISTS `cst_customer`;
CREATE TABLE `cst_customer` (
  `cust_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(255) DEFAULT NULL,
  `cust_source` varchar(255) DEFAULT NULL,
  `cust_industry` varchar(255) DEFAULT NULL,
  `cust_level` varchar(255) DEFAULT NULL,
  `cust_linkman` varchar(255) DEFAULT NULL,
  `cust_phone` varchar(255) DEFAULT NULL,
  `cust_mobile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  KEY `FKeh5g36duab8g1h051pdjfwcgd` (`cust_source`),
  KEY `FK2xhr3arwp3tkuae1da4lqv352` (`cust_industry`),
  KEY `FKrty52nvbjg1echf0se39eng49` (`cust_level`),
  CONSTRAINT `FKrty52nvbjg1echf0se39eng49` FOREIGN KEY (`cust_level`) REFERENCES `base_dict` (`dict_id`),
  CONSTRAINT `FK2xhr3arwp3tkuae1da4lqv352` FOREIGN KEY (`cust_industry`) REFERENCES `base_dict` (`dict_id`),
  CONSTRAINT `FKeh5g36duab8g1h051pdjfwcgd` FOREIGN KEY (`cust_source`) REFERENCES `base_dict` (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cst_customer
-- ----------------------------
INSERT INTO `cst_customer` VALUES ('1', '传智播客', '33', '2', '22', null, '112', '112');
INSERT INTO `cst_customer` VALUES ('2', '黑马公司', '32', '1', null, null, null, null);
INSERT INTO `cst_customer` VALUES ('3', '博客园公司', '34', '2', '23', null, '110', '112');
INSERT INTO `cst_customer` VALUES ('4', 'csdn公司', '32', '3', null, null, null, null);
INSERT INTO `cst_customer` VALUES ('5', 'sf公司', '33', '5', null, null, null, null);
INSERT INTO `cst_customer` VALUES ('6', '360公司', '34', '1', null, null, null, null);
INSERT INTO `cst_customer` VALUES ('7', '华为公司', '34', '2', null, null, null, null);
INSERT INTO `cst_customer` VALUES ('8', '快播', '33', '3', null, null, null, null);
INSERT INTO `cst_customer` VALUES ('9', 'github公司', '32', '4', null, null, null, null);
INSERT INTO `cst_customer` VALUES ('10', '锤子公司', '34', '5', null, null, null, null);
INSERT INTO `cst_customer` VALUES ('11', '魅族', '32', '1', null, null, null, null);
INSERT INTO `cst_customer` VALUES ('12', '小米', '33', '2', null, null, null, null);
INSERT INTO `cst_customer` VALUES ('13', '测试录入', '32', '1', '22', null, '110', '112');
INSERT INTO `cst_customer` VALUES ('14', '测试保存2', '33', '3', '23', null, '112', '119');
INSERT INTO `cst_customer` VALUES ('15', '测试上传文件我爱我家', '34', '4', '23', null, '110', '112');
INSERT INTO `cst_customer` VALUES ('16', '测试上传文件2', '33', '1', '22', null, '1112', '11123');
INSERT INTO `cst_customer` VALUES ('18', '黑马公司', '32', '1', '23', null, '', '');
INSERT INTO `cst_customer` VALUES ('20', '传智播客', '32', '1', '22', null, '110', '119');

-- ----------------------------
-- Table structure for cst_linkman
-- ----------------------------
DROP TABLE IF EXISTS `cst_linkman`;
CREATE TABLE `cst_linkman` (
  `lkm_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lkm_gender` char(1) DEFAULT NULL,
  `lkm_name` varchar(255) DEFAULT NULL,
  `lkm_phone` varchar(255) DEFAULT NULL,
  `lkm_email` varchar(255) DEFAULT NULL,
  `lkm_qq` varchar(255) DEFAULT NULL,
  `lkm_mobile` varchar(255) DEFAULT NULL,
  `lkm_memo` varchar(255) DEFAULT NULL,
  `lkm_position` varchar(255) DEFAULT NULL,
  `lkm_cust_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`lkm_id`),
  KEY `FKh9yp1nql5227xxcopuxqx2e7q` (`lkm_cust_id`),
  CONSTRAINT `FKh9yp1nql5227xxcopuxqx2e7q` FOREIGN KEY (`lkm_cust_id`) REFERENCES `cst_customer` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cst_linkman
-- ----------------------------
INSERT INTO `cst_linkman` VALUES ('1', '1', '陈帅', '15893630801', null, null, '123123', null, null, '2');
INSERT INTO `cst_linkman` VALUES ('2', '1', '帅哥', '110', null, null, '112', null, null, '2');
INSERT INTO `cst_linkman` VALUES ('3', '1', '陈哥', '1', null, null, '2', null, null, '1');
INSERT INTO `cst_linkman` VALUES ('4', '1', '陈帅哥', '112', null, null, '119', null, null, '1');
INSERT INTO `cst_linkman` VALUES ('5', '2', '帅帅哥我是文文', '110', null, null, '112', null, null, '1');
INSERT INTO `cst_linkman` VALUES ('6', null, '文文', null, null, null, null, null, null, null);
INSERT INTO `cst_linkman` VALUES ('7', null, '妹妹', null, null, null, null, null, null, null);
INSERT INTO `cst_linkman` VALUES ('8', '1', '哥', '15893630801', null, null, '12321', null, null, '1');
INSERT INTO `cst_linkman` VALUES ('9', '1', '陈哥', '1', null, null, '2', null, null, '1');
INSERT INTO `cst_linkman` VALUES ('10', '1', '陈帅12313', '15893630801', null, null, '123123', null, null, '2');
INSERT INTO `cst_linkman` VALUES ('11', '2', '文文我爱你', '15893630801', null, null, '112', null, null, '1');

-- ----------------------------
-- Table structure for sale_visit
-- ----------------------------
DROP TABLE IF EXISTS `sale_visit`;
CREATE TABLE `sale_visit` (
  `visit_id` varchar(255) NOT NULL,
  `visit_interviewee` varchar(255) DEFAULT NULL,
  `visit_addr` varchar(255) DEFAULT NULL,
  `visit_detail` varchar(255) DEFAULT NULL,
  `visit_time` datetime DEFAULT NULL,
  `visit_nexttime` datetime DEFAULT NULL,
  `visit_cust_id` bigint(20) DEFAULT NULL,
  `visit_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`visit_id`),
  KEY `FKgr4aivocixwcvkwxcmc0b4css` (`visit_cust_id`),
  KEY `FKc92iepd26mixxfiris92hccjx` (`visit_user_id`),
  CONSTRAINT `FKc92iepd26mixxfiris92hccjx` FOREIGN KEY (`visit_user_id`) REFERENCES `sys_user` (`user_id`),
  CONSTRAINT `FKgr4aivocixwcvkwxcmc0b4css` FOREIGN KEY (`visit_cust_id`) REFERENCES `cst_customer` (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale_visit
-- ----------------------------
INSERT INTO `sale_visit` VALUES ('402880e864fd98730164fd9a21350000', '123123', '荒野', '很好', '2018-08-15 00:00:00', '2018-08-24 00:00:00', '1', '2');
INSERT INTO `sale_visit` VALUES ('402880e864fda4190164fda57e720000', '陈文1', '郑州', '融洽', '2018-08-01 00:00:00', '2018-08-10 00:00:00', '1', '2');
INSERT INTO `sale_visit` VALUES ('402880e864fda4190164fda8fc140001', '123123', '21313', '很好', '2018-07-04 00:00:00', '2018-08-17 00:00:00', '2', '2');
INSERT INTO `sale_visit` VALUES ('402880e864fdab370164fdad20760000', '陈帅', '郑州', 'nice', '2018-07-04 00:00:00', '2018-08-03 00:00:00', '3', '3');
INSERT INTO `sale_visit` VALUES ('402880e864fdb0f00164fdb255f40000', '陈文文', '郑州', '12312', '2018-08-01 00:00:00', '2018-08-07 00:00:00', '9', '1');
INSERT INTO `sale_visit` VALUES ('402880e864fdb6510164fdb7acac0000', '123123', '21313', '很好', '2018-08-15 00:00:00', '2018-08-24 00:00:00', '3', '1');
INSERT INTO `sale_visit` VALUES ('402880e864fdbfbd0164fdc1637d0000', '123123', '荒野', 'nice', '2018-08-15 00:00:00', '2018-08-24 00:00:00', '1', '3');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_state` char(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'css', '陈帅', '202cb962ac59075b964b07152d234b70', null);
INSERT INTO `sys_user` VALUES ('2', 'hanmeimei', '韩妹妹', '202cb962ac59075b964b07152d234b70', null);
INSERT INTO `sys_user` VALUES ('3', 'chenwen', '陈文', '202cb962ac59075b964b07152d234b70', null);
INSERT INTO `sys_user` VALUES ('4', 'lilei', '李磊', '202cb962ac59075b964b07152d234b70', null);
