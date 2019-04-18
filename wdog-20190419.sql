/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : wdog

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-04-19 01:00:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '主键',
  `title` varchar(300) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '活动标题',
  `description` text COLLATE utf8_unicode_ci NOT NULL COMMENT '活动内容介绍及描述',
  `picture_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '配图文件路径',
  `signup_time` datetime NOT NULL COMMENT '报名起始时间',
  `deadline_time` datetime NOT NULL COMMENT '报名截止时间',
  `start_time` datetime NOT NULL COMMENT '活动开始时间',
  `end_time` datetime NOT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(3) NOT NULL COMMENT '状态',
  `organizer_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '主办方',
  `limit_quota` int(11) NOT NULL COMMENT '活动名额\r\n',
  `isblackList` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否黑名单限制(0=true;1=false)',
  `isreview` tinyint(1) NOT NULL COMMENT '是否人工审核(0=true;1=false)',
  `association_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `create_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity
-- ----------------------------

-- ----------------------------
-- Table structure for `activity_admins`
-- ----------------------------
DROP TABLE IF EXISTS `activity_admins`;
CREATE TABLE `activity_admins` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `activity_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `create_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity_admins
-- ----------------------------

-- ----------------------------
-- Table structure for `activity_form`
-- ----------------------------
DROP TABLE IF EXISTS `activity_form`;
CREATE TABLE `activity_form` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `activity_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '活动表外键',
  `rules` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '表单规则',
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  `create_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `modify_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity_form
-- ----------------------------

-- ----------------------------
-- Table structure for `activity_limit`
-- ----------------------------
DROP TABLE IF EXISTS `activity_limit`;
CREATE TABLE `activity_limit` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `aid` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '活动ID',
  `gid` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '分组ID',
  `create_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `modify_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of activity_limit
-- ----------------------------

-- ----------------------------
-- Table structure for `activity_member`
-- ----------------------------
DROP TABLE IF EXISTS `activity_member`;
CREATE TABLE `activity_member` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `acti_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `checkin` tinyint(3) NOT NULL COMMENT '签到管理',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity_member
-- ----------------------------

-- ----------------------------
-- Table structure for `activity_notice`
-- ----------------------------
DROP TABLE IF EXISTS `activity_notice`;
CREATE TABLE `activity_notice` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `aid` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `send_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '发送方式：短信、邮箱等',
  `operate_type` int(1) NOT NULL COMMENT '0:手动; 1:自动',
  `notice_time` datetime NOT NULL,
  `create_time` datetime NOT NULL,
  `create_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `modify_time` datetime NOT NULL,
  `modify_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `apartment`
-- ----------------------------
DROP TABLE IF EXISTS `apartment`;
CREATE TABLE `apartment` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `apart_admin` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `about` longtext COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `create_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of apartment
-- ----------------------------
INSERT INTO `apartment` VALUES ('1118863334049951745', '通勤部', '1118814425151758337', '用于功能测试的部门', '2019-04-18 21:06:21', '111111', null, null);

-- ----------------------------
-- Table structure for `apartment_member`
-- ----------------------------
DROP TABLE IF EXISTS `apartment_member`;
CREATE TABLE `apartment_member` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `apar_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `isadmin` tinyint(1) NOT NULL COMMENT '部门管理员',
  `create_time` datetime NOT NULL,
  `create_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of apartment_member
-- ----------------------------
INSERT INTO `apartment_member` VALUES ('1118878441614110722', '1118863334049951745', '1118813844702027777', '1', '2019-04-18 22:06:23', '111111', null, null);
INSERT INTO `apartment_member` VALUES ('777', '1118863334049951745', '1118867769153138690', '0', '2019-04-18 21:25:34', '111111', null, null);

-- ----------------------------
-- Table structure for `a_group`
-- ----------------------------
DROP TABLE IF EXISTS `a_group`;
CREATE TABLE `a_group` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type_symbol` tinyint(1) NOT NULL COMMENT '0：用户分组；1：部门分组',
  `dict_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '字典表代码，如学院、专业',
  `period` int(4) DEFAULT NULL COMMENT '年级，为null表示为专业分组',
  `class_num` int(4) DEFAULT NULL,
  `what_class` int(4) DEFAULT NULL,
  `apartment_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部门ID',
  `create_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_user` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of a_group
-- ----------------------------
INSERT INTO `a_group` VALUES ('1117468931662049282', '2015级信息管理与信息系统专业（信息管理）1班', '0', '1106975840870133761', '2015', '1', '1', null, '111111', '2019-04-15 00:45:30', null, null);
INSERT INTO `a_group` VALUES ('1117470959209668610', '信息管理与信息系统专业（信息管理）', '0', '1106975840870133761', null, null, null, null, '111111', '2019-04-15 00:53:33', null, null);
INSERT INTO `a_group` VALUES ('1117470959247417346', '2015级', '0', null, '2015', null, null, null, '111111', '2019-04-15 00:53:33', null, null);
INSERT INTO `a_group` VALUES ('1117470959264194561', '2015级信息管理与信息系统专业（信息管理）', '0', '1106975840870133761', '2015', null, null, null, '111111', '2019-04-15 00:53:33', null, null);
INSERT INTO `a_group` VALUES ('1117470959276777474', '2015级信息管理与信息系统专业（信息管理）1班', '0', '1106975840870133761', '2015', '1', '1', null, '111111', '2019-04-15 00:53:33', null, null);
INSERT INTO `a_group` VALUES ('1117817869577601025', '建筑学', '0', '1106977594353446913', null, null, null, null, '111111', '2019-04-15 23:52:03', null, null);
INSERT INTO `a_group` VALUES ('1117817869598572546', '2016级', '0', null, '2016', null, null, null, '111111', '2019-04-15 23:52:03', null, null);
INSERT INTO `a_group` VALUES ('1117817869619544066', '2016级建筑学', '0', '1106977594353446913', '2016', null, null, null, '111111', '2019-04-15 23:52:03', null, null);
INSERT INTO `a_group` VALUES ('1117817869619544067', '2016级建筑学1班', '0', '1106977594353446913', '2016', '4', '1', null, '111111', '2019-04-15 23:52:03', null, null);
INSERT INTO `a_group` VALUES ('1117817869619544068', '2016级建筑学2班', '0', '1106977594353446913', '2016', '4', '2', null, '111111', '2019-04-15 23:52:03', null, null);
INSERT INTO `a_group` VALUES ('1117817869619544069', '2016级建筑学3班', '0', '1106977594353446913', '2016', '4', '3', null, '111111', '2019-04-15 23:52:03', null, null);
INSERT INTO `a_group` VALUES ('1117817869682458626', '2016级建筑学4班', '0', '1106977594353446913', '2016', '4', '4', null, '111111', '2019-04-15 23:52:03', null, null);
INSERT INTO `a_group` VALUES ('1117817939974799362', '2017级', '0', null, '2017', null, null, null, '111111', '2019-04-15 23:52:20', null, null);
INSERT INTO `a_group` VALUES ('1117817939978993665', '2017级建筑学', '0', '1106977594353446913', '2017', null, null, null, '111111', '2019-04-15 23:52:20', null, null);
INSERT INTO `a_group` VALUES ('1117817939995770882', '2017级建筑学1班', '0', '1106977594353446913', '2017', '4', '1', null, '111111', '2019-04-15 23:52:20', null, null);
INSERT INTO `a_group` VALUES ('1117817940104822786', '2017级建筑学2班', '0', '1106977594353446913', '2017', '4', '2', null, '111111', '2019-04-15 23:52:20', null, null);
INSERT INTO `a_group` VALUES ('1117817940113211394', '2017级建筑学3班', '0', '1106977594353446913', '2017', '4', '3', null, '111111', '2019-04-15 23:52:20', null, null);
INSERT INTO `a_group` VALUES ('1117817940121600001', '2017级建筑学4班', '0', '1106977594353446913', '2017', '4', '4', null, '111111', '2019-04-15 23:52:20', null, null);
INSERT INTO `a_group` VALUES ('1118813906794504193', '应用统计学', '0', '1106975625861722114', null, null, null, null, '111111', '2019-04-18 17:49:57', null, null);
INSERT INTO `a_group` VALUES ('1118813906937110529', '2019级', '0', null, '2019', null, null, null, '111111', '2019-04-18 17:49:57', null, null);
INSERT INTO `a_group` VALUES ('1118813906937110530', '2019级应用统计学', '0', '1106975625861722114', '2019', null, null, null, '111111', '2019-04-18 17:49:57', null, null);
INSERT INTO `a_group` VALUES ('1118813906937110531', '2019级应用统计学1班', '0', '1106975625861722114', '2019', '1', '1', null, '111111', '2019-04-18 17:49:57', null, null);
INSERT INTO `a_group` VALUES ('1118813937698136065', '数学与应用数学（师范）', '0', '1106975748670943234', null, null, null, null, '111111', '2019-04-18 17:50:04', null, null);
INSERT INTO `a_group` VALUES ('1118813937706524673', '2019级数学与应用数学（师范）', '0', '1106975748670943234', '2019', null, null, null, '111111', '2019-04-18 17:50:04', null, null);
INSERT INTO `a_group` VALUES ('1118813937723301889', '2019级数学与应用数学（师范）1班', '0', '1106975748670943234', '2019', '1', '1', null, '111111', '2019-04-18 17:50:04', null, null);
INSERT INTO `a_group` VALUES ('1118813960116690945', '2019级信息管理与信息系统专业（信息管理）', '0', '1106975840870133761', '2019', null, null, null, '111111', '2019-04-18 17:50:09', null, null);
INSERT INTO `a_group` VALUES ('1118813960129273857', '2019级信息管理与信息系统专业（信息管理）1班', '0', '1106975840870133761', '2019', '1', '1', null, '111111', '2019-04-18 17:50:09', null, null);
INSERT INTO `a_group` VALUES ('1118814037904252930', '2019级建筑学', '0', '1106977594353446913', '2019', null, null, null, '111111', '2019-04-18 17:50:28', null, null);
INSERT INTO `a_group` VALUES ('1118814037904252931', '2019级建筑学1班', '0', '1106977594353446913', '2019', '2', '1', null, '111111', '2019-04-18 17:50:28', null, null);
INSERT INTO `a_group` VALUES ('1118814037912641538', '2019级建筑学2班', '0', '1106977594353446913', '2019', '2', '2', null, '111111', '2019-04-18 17:50:28', null, null);
INSERT INTO `a_group` VALUES ('1118814094917427202', '土木工程', '0', '1106977695704608770', null, null, null, null, '111111', '2019-04-18 17:50:41', null, null);
INSERT INTO `a_group` VALUES ('1118814094925815809', '2019级土木工程', '0', '1106977695704608770', '2019', null, null, null, '111111', '2019-04-18 17:50:41', null, null);
INSERT INTO `a_group` VALUES ('1118814094925815810', '2019级土木工程1班', '0', '1106977695704608770', '2019', '2', '1', null, '111111', '2019-04-18 17:50:41', null, null);
INSERT INTO `a_group` VALUES ('1118814094925815811', '2019级土木工程2班', '0', '1106977695704608770', '2019', '2', '2', null, '111111', '2019-04-18 17:50:41', null, null);

-- ----------------------------
-- Table structure for `blacklist`
-- ----------------------------
DROP TABLE IF EXISTS `blacklist`;
CREATE TABLE `blacklist` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `aid` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'apartmentId',
  `uid` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'userId',
  `sid` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'studentId',
  `create_time` datetime NOT NULL,
  `create_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `modify_time` datetime NOT NULL,
  `modify_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of blacklist
-- ----------------------------

-- ----------------------------
-- Table structure for `group_user`
-- ----------------------------
DROP TABLE IF EXISTS `group_user`;
CREATE TABLE `group_user` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `gid` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `is_admin` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of group_user
-- ----------------------------

-- ----------------------------
-- Table structure for `score_allocation`
-- ----------------------------
DROP TABLE IF EXISTS `score_allocation`;
CREATE TABLE `score_allocation` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sid` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `aid` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `create_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `modify_time` datetime NOT NULL,
  `modify_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of score_allocation
-- ----------------------------

-- ----------------------------
-- Table structure for `score_setting`
-- ----------------------------
DROP TABLE IF EXISTS `score_setting`;
CREATE TABLE `score_setting` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `aid` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `award_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `award_num` int(11) NOT NULL,
  `award_score` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of score_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `real_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `stu_num` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `group_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '具体到班级的分组',
  `create_time` datetime NOT NULL,
  `create_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1118813844702027777', '陈一一', '1509876543211', '1118813906937110531', '2019-04-18 17:49:42', '111111', '2019-04-18 17:51:27', '111111');
INSERT INTO `student` VALUES ('1118814425151758337', '李二二', '1509876543222', '1118813960129273857', '2019-04-18 17:52:00', '111111', null, null);
INSERT INTO `student` VALUES ('1118814572799647746', '任三三', '1509876543233', '1118814037904252931', '2019-04-18 17:52:35', '111111', null, null);
INSERT INTO `student` VALUES ('1118867769153138690', '刘七七', '1509876543177', '1118813960129273857', '2019-04-18 21:23:58', '111111', null, null);

-- ----------------------------
-- Table structure for `sys_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `id` char(36) COLLATE utf8_bin NOT NULL,
  `parent_id` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `dict_code` varchar(100) COLLATE utf8_bin NOT NULL,
  `dict_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `dict_value` text COLLATE utf8_bin,
  `sort` int(11) unsigned DEFAULT '0',
  `remark` text COLLATE utf8_bin,
  `create_time` datetime NOT NULL,
  `create_user` varchar(200) COLLATE utf8_bin NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES ('1106973238828789762', null, 'INSTITUTE', '组织机构', null, '0', 0x696E73746974757465, '2019-03-17 01:39:21', '1', '2019-03-20 00:09:58', '1');
INSERT INTO `sys_dictionary` VALUES ('1106973646913597441', '1106973238828789762', '0100', '数学与大数据学院', null, '0', '', '2019-03-17 01:40:58', '1', '2019-03-17 02:05:29', '1');
INSERT INTO `sys_dictionary` VALUES ('1106974439016296449', '1106973238828789762', '0200', '建筑与土木工程学院', null, '0', '', '2019-03-17 01:44:07', '1', '2019-03-17 02:05:05', '1');
INSERT INTO `sys_dictionary` VALUES ('1106974705237159937', '1106973238828789762', '0300', '信息科学技术学院', null, '0', '', '2019-03-17 01:45:11', '1', '2019-03-17 02:04:35', '1');
INSERT INTO `sys_dictionary` VALUES ('1106975625861722114', '1106973646913597441', '0101', '应用统计学', null, '0', '', '2019-03-17 01:48:50', '1', '2019-03-17 02:05:25', '1');
INSERT INTO `sys_dictionary` VALUES ('1106975748670943234', '1106973646913597441', '0102', '数学与应用数学（师范）', null, '0', '', '2019-03-17 01:49:20', '1', '2019-03-17 02:05:20', '1');
INSERT INTO `sys_dictionary` VALUES ('1106975840870133761', '1106973646913597441', '0103', '信息管理与信息系统专业（信息管理）', null, '0', '', '2019-03-17 01:49:42', '1', '2019-03-17 02:05:11', '1');
INSERT INTO `sys_dictionary` VALUES ('1106977594353446913', '1106974439016296449', '0201', '建筑学', null, '0', '', '2019-03-17 01:56:40', '1', '2019-03-17 02:04:58', '1');
INSERT INTO `sys_dictionary` VALUES ('1106977695704608770', '1106974439016296449', '0202', '土木工程', null, '0', '', '2019-03-17 01:57:04', '1', '2019-03-17 02:04:51', '1');
INSERT INTO `sys_dictionary` VALUES ('1106977789036261377', '1106974439016296449', '0203', '工程管理', null, '0', '', '2019-03-17 01:57:26', '1', '2019-03-17 02:04:42', '1');
INSERT INTO `sys_dictionary` VALUES ('1106978120407248897', '1106974705237159937', '0301', '软件工程', null, '0', '', '2019-03-17 01:58:45', '1', '2019-03-17 02:04:26', '1');
INSERT INTO `sys_dictionary` VALUES ('1106978243103223810', '1106974705237159937', '0302', '网络工程', null, '0', '', '2019-03-17 01:59:14', '1', '2019-03-17 02:04:16', '1');
INSERT INTO `sys_dictionary` VALUES ('1106979252336652290', '1106974705237159937', '0303', '计算机科学与技术', null, '0', '', '2019-03-17 02:03:15', '1', '2019-03-17 02:04:02', '1');
INSERT INTO `sys_dictionary` VALUES ('1106979397560233986', '1106974705237159937', '0304', '网络空间安全', null, '0', '', '2019-03-17 02:03:50', '1', null, null);

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(30) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `uid` varchar(30) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `ajax` int(1) DEFAULT NULL,
  `uri` varchar(250) DEFAULT NULL,
  `params` varchar(500) DEFAULT NULL,
  `http_method` varchar(20) DEFAULT NULL,
  `class_method` varchar(100) DEFAULT NULL,
  `action_name` varchar(30) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1091621785977266178', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-02-02 16:58:10');
INSERT INTO `sys_log` VALUES ('1091628371156180993', 'admin', '1', '127.0.0.1', '1', '/system/user/add', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.add()', '添加用户', '2019-02-02 17:24:20');
INSERT INTO `sys_log` VALUES ('1091628373370773506', 'admin', '1', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-02-02 17:24:20');
INSERT INTO `sys_log` VALUES ('1091628500877615106', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-02 17:24:51');
INSERT INTO `sys_log` VALUES ('1091628584784666626', 'admin', '1', '127.0.0.1', '1', '/system/role/update/988623554205990914', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.common.controller.UpdateController.update()', '更新指定ID对象的信息', '2019-02-02 17:25:11');
INSERT INTO `sys_log` VALUES ('1091628602685956097', 'admin', '1', '127.0.0.1', '1', '/system/role/remove/990069592976588801', '[\"990069592976588801\"]', 'POST', 'cn.licoy.wdog.common.controller.DeleteController.remove()', '删除指定ID的对象', '2019-02-02 17:25:15');
INSERT INTO `sys_log` VALUES ('1091628618720780290', 'admin', '1', '127.0.0.1', '1', '/system/role/remove/990069578007117825', '[\"990069578007117825\"]', 'POST', 'cn.licoy.wdog.common.controller.DeleteController.remove()', '删除指定ID的对象', '2019-02-02 17:25:19');
INSERT INTO `sys_log` VALUES ('1091628631190446081', 'admin', '1', '127.0.0.1', '1', '/system/role/remove/990069556293206018', '[\"990069556293206018\"]', 'POST', 'cn.licoy.wdog.common.controller.DeleteController.remove()', '删除指定ID的对象', '2019-02-02 17:25:22');
INSERT INTO `sys_log` VALUES ('1091628642615730178', 'admin', '1', '127.0.0.1', '1', '/system/role/remove/990069540665229314', '[\"990069540665229314\"]', 'POST', 'cn.licoy.wdog.common.controller.DeleteController.remove()', '删除指定ID的对象', '2019-02-02 17:25:25');
INSERT INTO `sys_log` VALUES ('1091628652937912321', 'admin', '1', '127.0.0.1', '1', '/system/role/remove/990069520104751106', '[\"990069520104751106\"]', 'POST', 'cn.licoy.wdog.common.controller.DeleteController.remove()', '删除指定ID的对象', '2019-02-02 17:25:27');
INSERT INTO `sys_log` VALUES ('1091628663637581825', 'admin', '1', '127.0.0.1', '1', '/system/role/remove/990069503935709185', '[\"990069503935709185\"]', 'POST', 'cn.licoy.wdog.common.controller.DeleteController.remove()', '删除指定ID的对象', '2019-02-02 17:25:30');
INSERT INTO `sys_log` VALUES ('1091628815211339777', 'admin', '1', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-02-02 17:26:06');
INSERT INTO `sys_log` VALUES ('1091628846307909634', 'admin', '1', '127.0.0.1', '1', '/system/user/remove/989423607472562177', '[\"989423607472562177\"]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.remove()', '删除用户', '2019-02-02 17:26:13');
INSERT INTO `sys_log` VALUES ('1091628866121801730', 'admin', '1', '127.0.0.1', '1', '/system/user/remove/989416849999503361', '[\"989416849999503361\"]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.remove()', '删除用户', '2019-02-02 17:26:18');
INSERT INTO `sys_log` VALUES ('1091628965581332481', 'admin', '1', '127.0.0.1', '1', '/system/role/remove/989419745311301633', '[\"989419745311301633\"]', 'POST', 'cn.licoy.wdog.common.controller.DeleteController.remove()', '删除指定ID的对象', '2019-02-02 17:26:42');
INSERT INTO `sys_log` VALUES ('1091629184750493697', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-02 17:27:34');
INSERT INTO `sys_log` VALUES ('1091629440070361090', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-02 17:28:35');
INSERT INTO `sys_log` VALUES ('1091630298837327874', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-02 17:31:59');
INSERT INTO `sys_log` VALUES ('1091630375601479682', 'admin', '1', '127.0.0.1', '1', '/system/role/update/988623554205990914', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.common.controller.UpdateController.update()', '更新指定ID对象的信息', '2019-02-02 17:32:18');
INSERT INTO `sys_log` VALUES ('1091630410787495938', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-02 17:32:26');
INSERT INTO `sys_log` VALUES ('1091630473832079362', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-02 17:32:41');
INSERT INTO `sys_log` VALUES ('1091630777315139586', 'admin', '1', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#FFB13C\",\"icon\":\"\",\"name\":\"活动管理\",\"permission\":\"activity\",\"sort\":1,\"type\":0,\"url\":\"/activity\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-02-02 17:33:53');
INSERT INTO `sys_log` VALUES ('1091630788924973057', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-02 17:33:56');
INSERT INTO `sys_log` VALUES ('1091631869000196097', 'admin', '1', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#0D94AA\",\"icon\":\"\",\"name\":\"数据监控\",\"permission\":\"statistics\",\"sort\":2,\"type\":0,\"url\":\"/statistics\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-02-02 17:38:14');
INSERT INTO `sys_log` VALUES ('1091631871302868993', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-02 17:38:14');
INSERT INTO `sys_log` VALUES ('1091632590042996737', 'admin', '1', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#F16B62\",\"icon\":\"\",\"name\":\"现场签到\",\"permission\":\"activity:checkin\",\"sort\":3,\"type\":0,\"url\":\"/activity/checkin\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-02-02 17:41:06');
INSERT INTO `sys_log` VALUES ('1091632591502614530', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-02 17:41:06');
INSERT INTO `sys_log` VALUES ('1091632800085352449', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-02 17:41:56');
INSERT INTO `sys_log` VALUES ('1091632866435047426', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-02 17:42:12');
INSERT INTO `sys_log` VALUES ('1091633500764811265', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-02 17:44:41');
INSERT INTO `sys_log` VALUES ('1091633640837787650', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-02 17:45:16');
INSERT INTO `sys_log` VALUES ('1091633670483128321', 'admin', '1', '127.0.0.1', '1', '/system/role/update/988623554205990914', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.common.controller.UpdateController.update()', '更新指定ID对象的信息', '2019-02-02 17:45:23');
INSERT INTO `sys_log` VALUES ('1091633831003336706', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-02-02 17:46:02');
INSERT INTO `sys_log` VALUES ('1091633887987150850', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-02 17:46:15');
INSERT INTO `sys_log` VALUES ('1091634043516137473', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-02 17:46:52');
INSERT INTO `sys_log` VALUES ('1091634077078958082', 'admin', '1', '127.0.0.1', '1', '/system/role/update/988623554205990914', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.common.controller.UpdateController.update()', '更新指定ID对象的信息', '2019-02-02 17:47:00');
INSERT INTO `sys_log` VALUES ('1091634205357551617', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-02-02 17:47:31');
INSERT INTO `sys_log` VALUES ('1091748253218680833', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-02-03 01:20:42');
INSERT INTO `sys_log` VALUES ('1091748301688057857', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-03 01:20:53');
INSERT INTO `sys_log` VALUES ('1091748314187083778', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-03 01:20:56');
INSERT INTO `sys_log` VALUES ('1091749404592877570', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"chiu\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-02-03 01:25:16');
INSERT INTO `sys_log` VALUES ('1091749483764559874', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-03 01:25:35');
INSERT INTO `sys_log` VALUES ('1091749917581422593', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/system/resource/update/1091632587094401025', '[\"1091632587094401025\",{\"color\":\"#F16B62\",\"icon\":\"\",\"name\":\"现场签到\",\"permission\":\"activity:checkin\",\"sort\":3,\"type\":0,\"url\":\"/activity/checkin\",\"verification\":false}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-02-03 01:27:19');
INSERT INTO `sys_log` VALUES ('1091749920823619586', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-03 01:27:20');
INSERT INTO `sys_log` VALUES ('1091749969959890946', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/system/resource/update/1091630776044265473', '[\"1091630776044265473\",{\"color\":\"#FFB13C\",\"icon\":\"\",\"name\":\"活动管理\",\"permission\":\"activity\",\"sort\":0,\"type\":0,\"url\":\"/activity\",\"verification\":false}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-02-03 01:27:31');
INSERT INTO `sys_log` VALUES ('1091749977614495746', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-03 01:27:33');
INSERT INTO `sys_log` VALUES ('1091750061005647873', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/system/resource/update/1091632587094401025', '[\"1091632587094401025\",{\"color\":\"#F16B62\",\"icon\":\"\",\"name\":\"现场签到\",\"permission\":\"activity:checkin\",\"sort\":3,\"type\":0,\"url\":\"/activity/checkin\",\"verification\":false}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-02-03 01:27:53');
INSERT INTO `sys_log` VALUES ('1091750064709218305', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-03 01:27:54');
INSERT INTO `sys_log` VALUES ('1091750140244439042', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/system/resource/update/1091631854995415042', '[\"1091631854995415042\",{\"color\":\"#0D94AA\",\"icon\":\"\",\"name\":\"数据监控\",\"permission\":\"statistics\",\"sort\":0,\"type\":0,\"url\":\"/statistics\",\"verification\":false}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-02-03 01:28:12');
INSERT INTO `sys_log` VALUES ('1091750141775360002', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-03 01:28:12');
INSERT INTO `sys_log` VALUES ('1091750243466260482', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-02-03 01:28:36');
INSERT INTO `sys_log` VALUES ('1091750270758596610', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-02-03 01:28:43');
INSERT INTO `sys_log` VALUES ('1091750305361604609', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/system/user/get/id/1091628370111799298', '[\"1091628370111799298\"]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.getById()', '根据ID获取用户信息', '2019-02-03 01:28:51');
INSERT INTO `sys_log` VALUES ('1091750341868826626', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/system/user/update/1091628370111799298', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.update()', '更新用户', '2019-02-03 01:29:00');
INSERT INTO `sys_log` VALUES ('1091750348470661121', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-02-03 01:29:01');
INSERT INTO `sys_log` VALUES ('1091750382104784898', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-02-03 01:29:10');
INSERT INTO `sys_log` VALUES ('1091751710914818050', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-02-03 01:34:26');
INSERT INTO `sys_log` VALUES ('1091929633009479682', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-03 13:21:26');
INSERT INTO `sys_log` VALUES ('1091948425366253570', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-02-03 14:36:07');
INSERT INTO `sys_log` VALUES ('1091966183025979394', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-02-03 15:46:40');
INSERT INTO `sys_log` VALUES ('1104303349152399362', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-03-09 16:50:10');
INSERT INTO `sys_log` VALUES ('1104364246529052674', 'admin', '1', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-03-09 20:52:09');
INSERT INTO `sys_log` VALUES ('1104419635140333570', 'admin', '1', '127.0.0.1', '1', '/system/user/lock/1091628370111799298', '[\"1091628370111799298\"]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.lock()', '锁定用户', '2019-03-10 00:32:15');
INSERT INTO `sys_log` VALUES ('1104419667939790849', 'admin', '1', '127.0.0.1', '1', '/system/user/unlock/1091628370111799298', '[\"1091628370111799298\"]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.unlock()', '解锁用户', '2019-03-10 00:32:23');
INSERT INTO `sys_log` VALUES ('1104749425130995714', 'admin', '1', '127.0.0.1', '1', '/system/user/lock/1091628370111799298', '[\"1091628370111799298\"]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.lock()', '锁定用户', '2019-03-10 22:22:42');
INSERT INTO `sys_log` VALUES ('1105112230908657665', 'admin', '1', '127.0.0.1', '1', '/system/user/unlock/1091628370111799298', '[\"1091628370111799298\"]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.unlock()', '解锁用户', '2019-03-11 22:24:22');
INSERT INTO `sys_log` VALUES ('1105114457010339841', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-03-11 22:33:13');
INSERT INTO `sys_log` VALUES ('1105114569371549698', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-11 22:33:40');
INSERT INTO `sys_log` VALUES ('1105114599637647362', 'admin', '1', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-03-11 22:33:47');
INSERT INTO `sys_log` VALUES ('1105145693451845633', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 00:37:21');
INSERT INTO `sys_log` VALUES ('1105149002657038337', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 00:50:30');
INSERT INTO `sys_log` VALUES ('1105454442964058114', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 21:04:12');
INSERT INTO `sys_log` VALUES ('1105460196496375809', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 21:27:04');
INSERT INTO `sys_log` VALUES ('1105460311336419330', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 21:27:31');
INSERT INTO `sys_log` VALUES ('1105469860839686146', 'admin', '1', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"活动创建\",\"parentId\":\"1091630776044265473\",\"permission\":\"activity:add\",\"sort\":1,\"type\":1,\"url\":\"/activity/add\",\"verification\":false}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-12 22:05:28');
INSERT INTO `sys_log` VALUES ('1105469862228000770', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 22:05:28');
INSERT INTO `sys_log` VALUES ('1105470126112636929', 'admin', '1', '127.0.0.1', '1', '/system/resource/update/1091630776044265473', '[\"1091630776044265473\",{\"color\":\"#FFB13C\",\"icon\":\"\",\"name\":\"活动管理\",\"permission\":\"activity\",\"sort\":0,\"type\":0,\"url\":\"/activity\",\"verification\":false}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-12 22:06:31');
INSERT INTO `sys_log` VALUES ('1105470127991685121', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 22:06:32');
INSERT INTO `sys_log` VALUES ('1105470175630589954', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 22:06:43');
INSERT INTO `sys_log` VALUES ('1105470192248422401', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 22:06:47');
INSERT INTO `sys_log` VALUES ('1105470202474135554', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 22:06:50');
INSERT INTO `sys_log` VALUES ('1105470395290484737', 'admin', '1', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"活动管理\",\"parentId\":\"1091630776044265473\",\"permission\":\"activity:list\",\"sort\":0,\"type\":0,\"url\":\"/activity/manage\",\"verification\":false}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-12 22:07:36');
INSERT INTO `sys_log` VALUES ('1105470395990933505', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 22:07:36');
INSERT INTO `sys_log` VALUES ('1105470604418482177', 'admin', '1', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"活动编辑\",\"parentId\":\"1091630776044265473\",\"permission\":\"activity:update\",\"sort\":2,\"type\":1,\"url\":\"/activity/update\",\"verification\":false}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-12 22:08:25');
INSERT INTO `sys_log` VALUES ('1105470605869711361', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 22:08:26');
INSERT INTO `sys_log` VALUES ('1105471124730281985', 'admin', '1', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"回收站\",\"parentId\":\"1091630776044265473\",\"permission\":\"activity:list\",\"sort\":7,\"type\":1,\"url\":\"/activity/cancel\",\"verification\":false}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-12 22:10:29');
INSERT INTO `sys_log` VALUES ('1105471125736914945', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 22:10:30');
INSERT INTO `sys_log` VALUES ('1105471790274052097', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 22:13:08');
INSERT INTO `sys_log` VALUES ('1105491429498552321', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-03-12 23:31:10');
INSERT INTO `sys_log` VALUES ('1105491525078351873', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 23:31:33');
INSERT INTO `sys_log` VALUES ('1105492426614636546', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 23:35:08');
INSERT INTO `sys_log` VALUES ('1105492504687411202', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 23:35:27');
INSERT INTO `sys_log` VALUES ('1105492549277057025', 'admin', '1', '127.0.0.1', '1', '/system/role/update/988623554205990914', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.common.controller.UpdateController.update()', '更新指定ID对象的信息', '2019-03-12 23:35:37');
INSERT INTO `sys_log` VALUES ('1105492583485800449', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 23:35:46');
INSERT INTO `sys_log` VALUES ('1105492693787607042', 'admin', '1', '127.0.0.1', '1', '/system/resource/update/1105469852140699649', '[\"1105469852140699649\",{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"活动创建\",\"permission\":\"activity:add\",\"sort\":1,\"type\":0,\"url\":\"/activity/add\",\"verification\":false}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-12 23:36:12');
INSERT INTO `sys_log` VALUES ('1105492694769074177', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 23:36:12');
INSERT INTO `sys_log` VALUES ('1105492720341745665', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 23:36:18');
INSERT INTO `sys_log` VALUES ('1105492830714855426', 'admin', '1', '127.0.0.1', '1', '/system/resource/update/1105471123828506625', '[\"1105471123828506625\",{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"回收站\",\"permission\":\"activity:list\",\"sort\":7,\"type\":0,\"url\":\"/activity/cancel\",\"verification\":false}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-12 23:36:45');
INSERT INTO `sys_log` VALUES ('1105492833197883394', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 23:36:45');
INSERT INTO `sys_log` VALUES ('1105492867226271746', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 23:36:53');
INSERT INTO `sys_log` VALUES ('1105493554798526466', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 23:39:37');
INSERT INTO `sys_log` VALUES ('1105493618363203586', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-12 23:39:52');
INSERT INTO `sys_log` VALUES ('1106056991173836802', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-03-14 12:58:29');
INSERT INTO `sys_log` VALUES ('1106057050623901698', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-14 12:58:45');
INSERT INTO `sys_log` VALUES ('1106057130839965698', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-14 12:59:04');
INSERT INTO `sys_log` VALUES ('1106201796231102465', 'admin', '1', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-03-14 22:33:55');
INSERT INTO `sys_log` VALUES ('1106201855597281282', 'admin', '1', '127.0.0.1', '1', '/system/user/get/id/1091628370111799298', '[\"1091628370111799298\"]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.getById()', '根据ID获取用户信息', '2019-03-14 22:34:09');
INSERT INTO `sys_log` VALUES ('1106202014381047810', 'admin', '1', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-03-14 22:34:47');
INSERT INTO `sys_log` VALUES ('1106202041706938369', 'admin', '1', '127.0.0.1', '1', '/system/user/get/id/1091628370111799298', '[\"1091628370111799298\"]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.getById()', '根据ID获取用户信息', '2019-03-14 22:34:54');
INSERT INTO `sys_log` VALUES ('1106202069217378306', 'admin', '1', '127.0.0.1', '1', '/system/user/update/1091628370111799298', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.update()', '更新用户', '2019-03-14 22:35:00');
INSERT INTO `sys_log` VALUES ('1106202071557799937', 'admin', '1', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-03-14 22:35:01');
INSERT INTO `sys_log` VALUES ('1106202119301562369', 'admin', '1', '127.0.0.1', '1', '/system/user/get/id/1091628370111799298', '[\"1091628370111799298\"]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.getById()', '根据ID获取用户信息', '2019-03-14 22:35:12');
INSERT INTO `sys_log` VALUES ('1106202147734749186', 'admin', '1', '127.0.0.1', '1', '/system/user/update/1091628370111799298', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.update()', '更新用户', '2019-03-14 22:35:19');
INSERT INTO `sys_log` VALUES ('1106202153766158338', 'admin', '1', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-03-14 22:35:20');
INSERT INTO `sys_log` VALUES ('1106234995590103041', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-15 00:45:50');
INSERT INTO `sys_log` VALUES ('1106801838759399426', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-03-16 14:18:16');
INSERT INTO `sys_log` VALUES ('1106802104468557825', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-03-16 14:19:20');
INSERT INTO `sys_log` VALUES ('1106802141441347586', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-03-16 14:19:29');
INSERT INTO `sys_log` VALUES ('1106802150308106241', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-03-16 14:19:31');
INSERT INTO `sys_log` VALUES ('1106804080153513985', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-03-16 14:27:11');
INSERT INTO `sys_log` VALUES ('1106815913253982209', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-16 15:14:12');
INSERT INTO `sys_log` VALUES ('1106869834001469441', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-16 18:48:28');
INSERT INTO `sys_log` VALUES ('1106869841010151426', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-16 18:48:29');
INSERT INTO `sys_log` VALUES ('1106869842247471105', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-16 18:48:30');
INSERT INTO `sys_log` VALUES ('1106869845300924418', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-16 18:48:30');
INSERT INTO `sys_log` VALUES ('1106869873826385921', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-16 18:48:37');
INSERT INTO `sys_log` VALUES ('1106902561186697217', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 20:58:30');
INSERT INTO `sys_log` VALUES ('1106903664292843522', 'admin', '1', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#0D9B53\",\"icon\":\"\",\"name\":\"数字字典\",\"parentId\":\"987981277195968513\",\"permission\":\"system:dictionary\",\"sort\":0,\"type\":0,\"url\":\"/system/dictionary\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-16 21:02:53');
INSERT INTO `sys_log` VALUES ('1106903696995831809', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 21:03:01');
INSERT INTO `sys_log` VALUES ('1106903998541123586', 'admin', '1', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"字典添加\",\"parentId\":\"1106903649885409281\",\"permission\":\"system:dictionary:add\",\"sort\":0,\"type\":1,\"url\":\"/system/dictionary/add\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-16 21:04:13');
INSERT INTO `sys_log` VALUES ('1106904005029711874', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 21:04:15');
INSERT INTO `sys_log` VALUES ('1106904196940091393', 'admin', '1', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"字典更新\",\"parentId\":\"1106903649885409281\",\"permission\":\"system:dictionary:update\",\"sort\":0,\"type\":1,\"url\":\"/system/dictionary/update\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-16 21:05:00');
INSERT INTO `sys_log` VALUES ('1106904206679265281', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 21:05:03');
INSERT INTO `sys_log` VALUES ('1106904351533748225', 'admin', '1', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"字典删除\",\"parentId\":\"1106903649885409281\",\"permission\":\"system:dictionary:delete\",\"sort\":0,\"type\":0,\"url\":\"/system/dictionary/delete\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-16 21:05:37');
INSERT INTO `sys_log` VALUES ('1106904366662602754', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 21:05:41');
INSERT INTO `sys_log` VALUES ('1106904513287081985', 'admin', '1', '127.0.0.1', '1', '/system/resource/update/1106904348371243009', '[\"1106904348371243009\",{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"字典删除\",\"permission\":\"system:dictionary:remove\",\"sort\":0,\"type\":0,\"url\":\"/system/dictionary/remove\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-16 21:06:16');
INSERT INTO `sys_log` VALUES ('1106904516025962497', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 21:06:17');
INSERT INTO `sys_log` VALUES ('1106904705130352642', 'admin', '1', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"字典列表\",\"parentId\":\"1106903649885409281\",\"permission\":\"system:dictionary:list\",\"sort\":0,\"type\":0,\"url\":\"/system/dictionary/list\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-16 21:07:02');
INSERT INTO `sys_log` VALUES ('1106904715725164546', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 21:07:04');
INSERT INTO `sys_log` VALUES ('1106906444868931586', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 21:13:56');
INSERT INTO `sys_log` VALUES ('1106906807986606082', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 21:15:23');
INSERT INTO `sys_log` VALUES ('1106906867096932353', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 21:15:37');
INSERT INTO `sys_log` VALUES ('1106906912709988353', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 21:15:48');
INSERT INTO `sys_log` VALUES ('1106906988987600898', 'admin', '1', '127.0.0.1', '1', '/system/role/update/988623554205990914', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.common.controller.UpdateController.update()', '更新指定ID对象的信息', '2019-03-16 21:16:06');
INSERT INTO `sys_log` VALUES ('1106907194231672833', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 21:16:55');
INSERT INTO `sys_log` VALUES ('1106907350746320898', 'admin', '1', '127.0.0.1', '1', '/system/resource/update/1106903649885409281', '[\"1106903649885409281\",{\"color\":\"#0D9B53\",\"icon\":\"\",\"name\":\"字典管理\",\"permission\":\"system:dictionary\",\"sort\":0,\"type\":0,\"url\":\"/system/dictionary\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-16 21:17:32');
INSERT INTO `sys_log` VALUES ('1106907355926286338', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 21:17:34');
INSERT INTO `sys_log` VALUES ('1106907418933121025', 'admin', '1', '127.0.0.1', '1', '/system/resource/update/1106904348371243009', '[\"1106904348371243009\",{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"字典删除\",\"permission\":\"system:dictionary:remove\",\"sort\":0,\"type\":1,\"url\":\"/system/dictionary/remove\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-16 21:17:49');
INSERT INTO `sys_log` VALUES ('1106907428898787329', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 21:17:51');
INSERT INTO `sys_log` VALUES ('1106907686940758018', 'admin', '1', '127.0.0.1', '1', '/system/resource/update/1106904696053878786', '[\"1106904696053878786\",{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"字典列表\",\"permission\":\"system:dictionary:list\",\"sort\":0,\"type\":1,\"url\":\"/system/dictionary/list\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-16 21:18:53');
INSERT INTO `sys_log` VALUES ('1106907690010988546', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 21:18:53');
INSERT INTO `sys_log` VALUES ('1106907708059078657', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 21:18:58');
INSERT INTO `sys_log` VALUES ('1106909695945265153', 'admin', '1', '127.0.0.1', '1', '/system/resource/update/1106903649885409281', '[\"1106903649885409281\",{\"color\":\"#0D9B53\",\"icon\":\"\",\"name\":\"字典定义\",\"permission\":\"system:dictionary\",\"sort\":0,\"type\":0,\"url\":\"/system/dictionary\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-16 21:26:52');
INSERT INTO `sys_log` VALUES ('1106909702215749634', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 21:26:53');
INSERT INTO `sys_log` VALUES ('1106909858822672385', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 21:27:30');
INSERT INTO `sys_log` VALUES ('1106940353899974658', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 23:28:41');
INSERT INTO `sys_log` VALUES ('1106940561014706177', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 23:29:30');
INSERT INTO `sys_log` VALUES ('1106941900503437314', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 23:34:50');
INSERT INTO `sys_log` VALUES ('1106942044644888578', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 23:35:24');
INSERT INTO `sys_log` VALUES ('1106942814555525122', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 23:38:28');
INSERT INTO `sys_log` VALUES ('1106942903592210434', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 23:38:49');
INSERT INTO `sys_log` VALUES ('1106943411014914050', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 23:40:50');
INSERT INTO `sys_log` VALUES ('1106943672840146946', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 23:41:52');
INSERT INTO `sys_log` VALUES ('1106944105822343170', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 23:43:36');
INSERT INTO `sys_log` VALUES ('1106945013880770562', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-16 23:47:12');
INSERT INTO `sys_log` VALUES ('1106969783540183041', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-17 01:25:37');
INSERT INTO `sys_log` VALUES ('1106969826586324993', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:25:48');
INSERT INTO `sys_log` VALUES ('1106971299235819521', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:31:39');
INSERT INTO `sys_log` VALUES ('1106971916612202498', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:34:06');
INSERT INTO `sys_log` VALUES ('1106972572861394945', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/add', '[{\"dictCode\":\"AAA\",\"dictName\":\"AAA\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.add()', '添加字典', '2019-03-17 01:36:43');
INSERT INTO `sys_log` VALUES ('1106972573276631041', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:36:43');
INSERT INTO `sys_log` VALUES ('1106972626342965250', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/add', '[{\"dictCode\":\"BBB\",\"dictName\":\"BBB\",\"parentId\":\"1106972566456692737\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.add()', '添加字典', '2019-03-17 01:36:55');
INSERT INTO `sys_log` VALUES ('1106972626766589953', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:36:55');
INSERT INTO `sys_log` VALUES ('1106972673235283970', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/add', '[{\"dictCode\":\"CCC\",\"dictName\":\"CCC\",\"parentId\":\"1106972624434556929\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.add()', '添加字典', '2019-03-17 01:37:07');
INSERT INTO `sys_log` VALUES ('1106972675428904961', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:37:07');
INSERT INTO `sys_log` VALUES ('1106972719032889346', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/add', '[{\"dictCode\":\"CCC\",\"dictName\":\"CCC\",\"parentId\":\"1106972624434556929\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.add()', '添加字典', '2019-03-17 01:37:17');
INSERT INTO `sys_log` VALUES ('1106972720735776770', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:37:18');
INSERT INTO `sys_log` VALUES ('1106972771923062786', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/add', '[{\"dictCode\":\"DDD\",\"dictName\":\"DDD\",\"parentId\":\"1106972624434556929\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.add()', '添加字典', '2019-03-17 01:37:30');
INSERT INTO `sys_log` VALUES ('1106972785671991297', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:37:33');
INSERT INTO `sys_log` VALUES ('1106972802264657922', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/remove/1106972769150627842', '[\"1106972769150627842\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.remove()', '删除字典', '2019-03-17 01:37:37');
INSERT INTO `sys_log` VALUES ('1106972804269535234', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:37:38');
INSERT INTO `sys_log` VALUES ('1106972815850008578', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:37:41');
INSERT INTO `sys_log` VALUES ('1106972848439750658', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/add', '[{\"dictCode\":\"DDD\",\"dictName\":\"DDD\",\"parentId\":\"1106972710568783873\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.add()', '添加字典', '2019-03-17 01:37:48');
INSERT INTO `sys_log` VALUES ('1106972848829820929', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:37:48');
INSERT INTO `sys_log` VALUES ('1106972891204874242', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/remove/1106972566456692737', '[\"1106972566456692737\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.remove()', '删除字典', '2019-03-17 01:37:58');
INSERT INTO `sys_log` VALUES ('1106972891875962881', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:37:59');
INSERT INTO `sys_log` VALUES ('1106972901573193729', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:38:01');
INSERT INTO `sys_log` VALUES ('1106973241890631681', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/add', '[{\"dictCode\":\"ROOT\",\"dictName\":\"学院\",\"remark\":\"institute\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.add()', '添加字典', '2019-03-17 01:39:22');
INSERT INTO `sys_log` VALUES ('1106973242804989953', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:39:22');
INSERT INTO `sys_log` VALUES ('1106973658817032193', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/add', '[{\"dictCode\":\"01000000\",\"dictName\":\"数学与大数据学院\",\"parentId\":\"1106973238828789762\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.add()', '添加字典', '2019-03-17 01:41:01');
INSERT INTO `sys_log` VALUES ('1106973659945299970', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:41:02');
INSERT INTO `sys_log` VALUES ('1106974440492691457', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/add', '[{\"dictCode\":\"02000000\",\"dictName\":\"建筑与土木工程学院\",\"parentId\":\"1106973238828789762\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.add()', '添加字典', '2019-03-17 01:44:08');
INSERT INTO `sys_log` VALUES ('1106974441025368066', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:44:08');
INSERT INTO `sys_log` VALUES ('1106974710526177282', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/add', '[{\"dictCode\":\"03000000\",\"dictName\":\"信息科学技术学院\",\"parentId\":\"1106973238828789762\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.add()', '添加字典', '2019-03-17 01:45:12');
INSERT INTO `sys_log` VALUES ('1106974711784468481', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:45:13');
INSERT INTO `sys_log` VALUES ('1106975636263596033', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/add', '[{\"dictCode\":\"01010000\",\"dictName\":\"应用统计学\",\"parentId\":\"1106973646913597441\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.add()', '添加字典', '2019-03-17 01:48:53');
INSERT INTO `sys_log` VALUES ('1106975638230724609', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:48:53');
INSERT INTO `sys_log` VALUES ('1106975750961033218', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/add', '[{\"dictCode\":\"01020000\",\"dictName\":\"数学与应用数学（师范）\",\"parentId\":\"1106973646913597441\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.add()', '添加字典', '2019-03-17 01:49:20');
INSERT INTO `sys_log` VALUES ('1106975756476542977', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:49:22');
INSERT INTO `sys_log` VALUES ('1106975843726454785', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/add', '[{\"dictCode\":\"01030000\",\"dictName\":\"信息管理与信息系统专业（信息管理）\",\"parentId\":\"1106973646913597441\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.add()', '添加字典', '2019-03-17 01:49:42');
INSERT INTO `sys_log` VALUES ('1106975845764886529', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:49:43');
INSERT INTO `sys_log` VALUES ('1106976133401866241', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:50:51');
INSERT INTO `sys_log` VALUES ('1106977597289459713', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/add', '[{\"dictCode\":\"02010000\",\"dictName\":\"建筑学\",\"parentId\":\"1106974439016296449\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.add()', '添加字典', '2019-03-17 01:56:41');
INSERT INTO `sys_log` VALUES ('1106977598291898370', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:56:41');
INSERT INTO `sys_log` VALUES ('1106977697520742402', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/add', '[{\"dictCode\":\"02020000\",\"dictName\":\"土木工程\",\"parentId\":\"1106974439016296449\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.add()', '添加字典', '2019-03-17 01:57:04');
INSERT INTO `sys_log` VALUES ('1106977698967777282', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:57:05');
INSERT INTO `sys_log` VALUES ('1106977790307135489', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/add', '[{\"dictCode\":\"02030000\",\"dictName\":\"工程管理\",\"parentId\":\"1106974439016296449\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.add()', '添加字典', '2019-03-17 01:57:27');
INSERT INTO `sys_log` VALUES ('1106977791649312770', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:57:27');
INSERT INTO `sys_log` VALUES ('1106978125696266241', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/add', '[{\"dictCode\":\"03010000\",\"dictName\":\"软件工程专业\",\"parentId\":\"1106974705237159937\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.add()', '添加字典', '2019-03-17 01:58:46');
INSERT INTO `sys_log` VALUES ('1106978127051026434', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:58:47');
INSERT INTO `sys_log` VALUES ('1106978244529287170', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/add', '[{\"dictCode\":\"03020000\",\"dictName\":\"网络工程\",\"parentId\":\"1106974705237159937\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.add()', '添加字典', '2019-03-17 01:59:15');
INSERT INTO `sys_log` VALUES ('1106978246274117633', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 01:59:15');
INSERT INTO `sys_log` VALUES ('1106979059906179074', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 02:02:29');
INSERT INTO `sys_log` VALUES ('1106979112582443009', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/update/1106978120407248897', '[\"1106978120407248897\",{\"dictCode\":\"03010000\",\"dictName\":\"软件工程\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.update()', '添加字典', '2019-03-17 02:02:42');
INSERT INTO `sys_log` VALUES ('1106979113408720897', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 02:02:42');
INSERT INTO `sys_log` VALUES ('1106979253808852994', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/add', '[{\"dictCode\":\"03030000\",\"dictName\":\"计算机科学与技术专业\",\"parentId\":\"1106974705237159937\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.add()', '添加字典', '2019-03-17 02:03:15');
INSERT INTO `sys_log` VALUES ('1106979257164296194', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 02:03:16');
INSERT INTO `sys_log` VALUES ('1106979399070183425', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/add', '[{\"dictCode\":\"0304\",\"dictName\":\"网络空间安全\",\"parentId\":\"1106974705237159937\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.add()', '添加字典', '2019-03-17 02:03:50');
INSERT INTO `sys_log` VALUES ('1106979401221861378', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 02:03:51');
INSERT INTO `sys_log` VALUES ('1106979456624422913', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/update/1106979252336652290', '[\"1106979252336652290\",{\"dictCode\":\"0303\",\"dictName\":\"计算机科学与技术\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.update()', '添加字典', '2019-03-17 02:04:04');
INSERT INTO `sys_log` VALUES ('1106979457123545090', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 02:04:04');
INSERT INTO `sys_log` VALUES ('1106979521074098177', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/update/1106978243103223810', '[\"1106978243103223810\",{\"dictCode\":\"0302\",\"dictName\":\"网络工程\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.update()', '添加字典', '2019-03-17 02:04:19');
INSERT INTO `sys_log` VALUES ('1106979522579853314', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 02:04:20');
INSERT INTO `sys_log` VALUES ('1106979554263625730', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/update/1106978120407248897', '[\"1106978120407248897\",{\"dictCode\":\"0301\",\"dictName\":\"软件工程\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.update()', '添加字典', '2019-03-17 02:04:27');
INSERT INTO `sys_log` VALUES ('1106979555123458049', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 02:04:27');
INSERT INTO `sys_log` VALUES ('1106979589416087554', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/update/1106974705237159937', '[\"1106974705237159937\",{\"dictCode\":\"0300\",\"dictName\":\"信息科学技术学院\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.update()', '添加字典', '2019-03-17 02:04:35');
INSERT INTO `sys_log` VALUES ('1106979591496462338', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 02:04:36');
INSERT INTO `sys_log` VALUES ('1106979621187940353', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/update/1106977789036261377', '[\"1106977789036261377\",{\"dictCode\":\"0203\",\"dictName\":\"工程管理\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.update()', '添加字典', '2019-03-17 02:04:43');
INSERT INTO `sys_log` VALUES ('1106979624216227842', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 02:04:44');
INSERT INTO `sys_log` VALUES ('1106979659221889025', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/update/1106977695704608770', '[\"1106977695704608770\",{\"dictCode\":\"0202\",\"dictName\":\"土木工程\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.update()', '添加字典', '2019-03-17 02:04:52');
INSERT INTO `sys_log` VALUES ('1106979661478424578', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 02:04:53');
INSERT INTO `sys_log` VALUES ('1106979686954627074', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/update/1106977594353446913', '[\"1106977594353446913\",{\"dictCode\":\"0201\",\"dictName\":\"建筑学\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.update()', '添加字典', '2019-03-17 02:04:59');
INSERT INTO `sys_log` VALUES ('1106979689576067073', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 02:04:59');
INSERT INTO `sys_log` VALUES ('1106979715849187329', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/update/1106974439016296449', '[\"1106974439016296449\",{\"dictCode\":\"0200\",\"dictName\":\"建筑与土木工程学院\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.update()', '添加字典', '2019-03-17 02:05:06');
INSERT INTO `sys_log` VALUES ('1106979717027786753', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 02:05:06');
INSERT INTO `sys_log` VALUES ('1106979744089436161', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/update/1106975840870133761', '[\"1106975840870133761\",{\"dictCode\":\"0103\",\"dictName\":\"信息管理与信息系统专业（信息管理）\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.update()', '添加字典', '2019-03-17 02:05:12');
INSERT INTO `sys_log` VALUES ('1106979744588558338', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 02:05:12');
INSERT INTO `sys_log` VALUES ('1106979778583392257', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/update/1106975748670943234', '[\"1106975748670943234\",{\"dictCode\":\"0102\",\"dictName\":\"数学与应用数学（师范）\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.update()', '添加字典', '2019-03-17 02:05:21');
INSERT INTO `sys_log` VALUES ('1106979779275452417', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 02:05:21');
INSERT INTO `sys_log` VALUES ('1106979809847734273', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/update/1106975625861722114', '[\"1106975625861722114\",{\"dictCode\":\"0101\",\"dictName\":\"应用统计学\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.update()', '添加字典', '2019-03-17 02:05:28');
INSERT INTO `sys_log` VALUES ('1106979811013750785', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 02:05:28');
INSERT INTO `sys_log` VALUES ('1106979817380704257', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/update/1106973646913597441', '[\"1106973646913597441\",{\"dictCode\":\"0100\",\"dictName\":\"数学与大数据学院\",\"remark\":\"\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.update()', '添加字典', '2019-03-17 02:05:30');
INSERT INTO `sys_log` VALUES ('1106979818559303681', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 02:05:30');
INSERT INTO `sys_log` VALUES ('1106979937228746753', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/update/1106973238828789762', '[\"1106973238828789762\",{\"dictCode\":\"ROOT\",\"dictName\":\"组织机构\",\"remark\":\"institute\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.update()', '添加字典', '2019-03-17 02:05:58');
INSERT INTO `sys_log` VALUES ('1106979938319265793', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 02:05:59');
INSERT INTO `sys_log` VALUES ('1107177153553821698', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-03-17 15:09:38');
INSERT INTO `sys_log` VALUES ('1107177196520271874', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-17 15:09:49');
INSERT INTO `sys_log` VALUES ('1107177958960852994', 'admin', '1', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"分组管理\",\"permission\":\"app:group\",\"sort\":0,\"type\":0,\"url\":\"app/group\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-17 15:12:50');
INSERT INTO `sys_log` VALUES ('1107177961896865794', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-17 15:12:51');
INSERT INTO `sys_log` VALUES ('1107178127131471873', 'admin', '1', '127.0.0.1', '1', '/system/resource/update/1107177955806736385', '[\"1107177955806736385\",{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"分组管理\",\"permission\":\"group\",\"sort\":0,\"type\":0,\"url\":\"/group\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-17 15:13:31');
INSERT INTO `sys_log` VALUES ('1107178127999692802', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-17 15:13:31');
INSERT INTO `sys_log` VALUES ('1107183204017696769', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-17 15:33:41');
INSERT INTO `sys_log` VALUES ('1107184197237272578', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 15:37:38');
INSERT INTO `sys_log` VALUES ('1107194073015447554', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 16:16:52');
INSERT INTO `sys_log` VALUES ('1107194202703327233', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 16:17:23');
INSERT INTO `sys_log` VALUES ('1107194218754928641', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 16:17:27');
INSERT INTO `sys_log` VALUES ('1107194406047379458', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 16:18:12');
INSERT INTO `sys_log` VALUES ('1107194419473346561', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 16:18:15');
INSERT INTO `sys_log` VALUES ('1107194463756808194', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 16:18:25');
INSERT INTO `sys_log` VALUES ('1107194737246400514', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 16:19:31');
INSERT INTO `sys_log` VALUES ('1107194761606918145', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/remove/1106972845562458114', '[\"1106972845562458114\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.remove()', '删除字典', '2019-03-17 16:19:37');
INSERT INTO `sys_log` VALUES ('1107194762613551106', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 16:19:37');
INSERT INTO `sys_log` VALUES ('1107194776492503042', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/remove/1106972710568783873', '[\"1106972710568783873\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.remove()', '删除字典', '2019-03-17 16:19:40');
INSERT INTO `sys_log` VALUES ('1107194777465581570', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 16:19:40');
INSERT INTO `sys_log` VALUES ('1107194789792641026', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/remove/1106972669749817345', '[\"1106972669749817345\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.remove()', '删除字典', '2019-03-17 16:19:43');
INSERT INTO `sys_log` VALUES ('1107194790648279042', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 16:19:43');
INSERT INTO `sys_log` VALUES ('1107194808876724225', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/remove/1106972624434556929', '[\"1106972624434556929\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.remove()', '删除字典', '2019-03-17 16:19:48');
INSERT INTO `sys_log` VALUES ('1107194816690712578', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-17 16:19:50');
INSERT INTO `sys_log` VALUES ('1107323226561769473', 'admin', '1', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-03-18 00:50:05');
INSERT INTO `sys_log` VALUES ('1107324234901811201', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-18 00:54:05');
INSERT INTO `sys_log` VALUES ('1107324248701071361', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-18 00:54:09');
INSERT INTO `sys_log` VALUES ('1107324515039375361', 'admin', '1', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#9B1DEA\",\"icon\":\"\",\"name\":\"分组添加\",\"parentId\":\"1107177955806736385\",\"permission\":\"group:add\",\"sort\":0,\"type\":0,\"url\":\"/group/add\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-18 00:55:12');
INSERT INTO `sys_log` VALUES ('1107324515806932994', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-18 00:55:12');
INSERT INTO `sys_log` VALUES ('1107324693842554881', 'admin', '1', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"分组更新\",\"parentId\":\"1107177955806736385\",\"permission\":\"group:update\",\"sort\":0,\"type\":1,\"url\":\"/group/update\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-18 00:55:55');
INSERT INTO `sys_log` VALUES ('1107324695549636609', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-18 00:55:55');
INSERT INTO `sys_log` VALUES ('1107324822171480065', 'admin', '1', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"分组移除\",\"parentId\":\"1107177955806736385\",\"permission\":\"group:remove\",\"sort\":0,\"type\":0,\"url\":\"/group/remove\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-18 00:56:25');
INSERT INTO `sys_log` VALUES ('1107324823534628866', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-18 00:56:26');
INSERT INTO `sys_log` VALUES ('1107324949305028610', 'admin', '1', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#9B1DEA\",\"icon\":\"\",\"name\":\"分组列表\",\"parentId\":\"1107177955806736385\",\"permission\":\"group:list\",\"sort\":0,\"type\":1,\"url\":\"/group/list\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-18 00:56:56');
INSERT INTO `sys_log` VALUES ('1107324950492016641', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-18 00:56:56');
INSERT INTO `sys_log` VALUES ('1107324998286110722', 'admin', '1', '127.0.0.1', '1', '/system/resource/update/1107324821777215490', '[\"1107324821777215490\",{\"color\":\"#9B1DEA\",\"icon\":\"\",\"name\":\"分组移除\",\"permission\":\"group:remove\",\"sort\":0,\"type\":1,\"url\":\"/group/remove\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-18 00:57:07');
INSERT INTO `sys_log` VALUES ('1107324999481487362', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-18 00:57:08');
INSERT INTO `sys_log` VALUES ('1107325038220079105', 'admin', '1', '127.0.0.1', '1', '/system/resource/update/1107324513160327169', '[\"1107324513160327169\",{\"color\":\"#9B1DEA\",\"icon\":\"\",\"name\":\"分组添加\",\"permission\":\"group:add\",\"sort\":0,\"type\":1,\"url\":\"/group/add\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-18 00:57:17');
INSERT INTO `sys_log` VALUES ('1107325039469981698', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-18 00:57:17');
INSERT INTO `sys_log` VALUES ('1107325084768464898', 'admin', '1', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-03-18 00:57:28');
INSERT INTO `sys_log` VALUES ('1107325113285537794', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-18 00:57:35');
INSERT INTO `sys_log` VALUES ('1107325146311487489', 'admin', '1', '127.0.0.1', '1', '/system/role/update/988623554205990914', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.common.controller.UpdateController.update()', '更新指定ID对象的信息', '2019-03-18 00:57:43');
INSERT INTO `sys_log` VALUES ('1107325182223118337', 'admin', '1', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-03-18 00:57:51');
INSERT INTO `sys_log` VALUES ('1107326071197462530', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-18 01:01:23');
INSERT INTO `sys_log` VALUES ('1107330163768602626', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-18 01:17:39');
INSERT INTO `sys_log` VALUES ('1107330511036002305', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-18 01:19:02');
INSERT INTO `sys_log` VALUES ('1107330554925199362', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-18 01:19:12');
INSERT INTO `sys_log` VALUES ('1107331034279620610', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-18 01:21:06');
INSERT INTO `sys_log` VALUES ('1107331070455492610', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-18 01:21:15');
INSERT INTO `sys_log` VALUES ('1107331086486122497', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-18 01:21:19');
INSERT INTO `sys_log` VALUES ('1107331118266363905', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-18 01:21:26');
INSERT INTO `sys_log` VALUES ('1107331389042241538', 'admin', '1', '127.0.0.1', '1', '/system/resource/update/1107324948407447553', '[\"1107324948407447553\",{\"color\":\"#9B1DEA\",\"icon\":\"\",\"name\":\"分组列表\",\"permission\":\"group:list\",\"sort\":0,\"type\":0,\"url\":\"/group/list\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-18 01:22:31');
INSERT INTO `sys_log` VALUES ('1107331389952405506', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-18 01:22:31');
INSERT INTO `sys_log` VALUES ('1107331403000885250', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-18 01:22:34');
INSERT INTO `sys_log` VALUES ('1107331424958066689', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-18 01:22:40');
INSERT INTO `sys_log` VALUES ('1107331431832530945', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-18 01:22:41');
INSERT INTO `sys_log` VALUES ('1107331776449130497', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-18 01:24:03');
INSERT INTO `sys_log` VALUES ('1107331818119540738', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-18 01:24:13');
INSERT INTO `sys_log` VALUES ('1107331883450019842', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-18 01:24:29');
INSERT INTO `sys_log` VALUES ('1107331891939291138', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-18 01:24:31');
INSERT INTO `sys_log` VALUES ('1107332278276632578', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-18 01:26:03');
INSERT INTO `sys_log` VALUES ('1107332285935431681', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-18 01:26:05');
INSERT INTO `sys_log` VALUES ('1107332303060774913', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-18 01:26:09');
INSERT INTO `sys_log` VALUES ('1107332316876812290', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-18 01:26:12');
INSERT INTO `sys_log` VALUES ('1107332715188891649', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-18 01:27:47');
INSERT INTO `sys_log` VALUES ('1107332718464643074', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-18 01:27:48');
INSERT INTO `sys_log` VALUES ('1107332734579159042', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-18 01:27:52');
INSERT INTO `sys_log` VALUES ('1107332745383686146', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-18 01:27:54');
INSERT INTO `sys_log` VALUES ('1107333135516872705', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-18 01:29:27');
INSERT INTO `sys_log` VALUES ('1107333148892508161', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-18 01:29:31');
INSERT INTO `sys_log` VALUES ('1107333276600676353', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-18 01:30:01');
INSERT INTO `sys_log` VALUES ('1107690051359256577', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-03-19 01:07:43');
INSERT INTO `sys_log` VALUES ('1107690068023226369', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-19 01:07:47');
INSERT INTO `sys_log` VALUES ('1107694650803662849', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-19 01:25:59');
INSERT INTO `sys_log` VALUES ('1107694663273328641', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-19 01:26:02');
INSERT INTO `sys_log` VALUES ('1107695900618174466', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-19 01:30:57');
INSERT INTO `sys_log` VALUES ('1108001280078426113', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-19 21:44:25');
INSERT INTO `sys_log` VALUES ('1108001361909297153', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-19 21:44:45');
INSERT INTO `sys_log` VALUES ('1108004037703282689', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-19 21:55:23');
INSERT INTO `sys_log` VALUES ('1108005512596729857', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-19 22:01:15');
INSERT INTO `sys_log` VALUES ('1108006441450516482', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-19 22:04:56');
INSERT INTO `sys_log` VALUES ('1108032211271069697', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-19 23:47:20');
INSERT INTO `sys_log` VALUES ('1108033200988401665', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-19 23:51:16');
INSERT INTO `sys_log` VALUES ('1108036196770033665', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-03-20 00:03:10');
INSERT INTO `sys_log` VALUES ('1108037661022531585', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-20 00:08:59');
INSERT INTO `sys_log` VALUES ('1108037843676082178', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/update/1106973238828789762', '[\"1106973238828789762\",{\"dictCode\":\"institute\",\"dictName\":\"组织机构\",\"remark\":\"institute\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.update()', '添加字典', '2019-03-20 00:09:43');
INSERT INTO `sys_log` VALUES ('1108037850198224897', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-20 00:09:45');
INSERT INTO `sys_log` VALUES ('1108037915897802754', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/update/1106973238828789762', '[\"1106973238828789762\",{\"dictCode\":\"INSTITUTE\",\"dictName\":\"组织机构\",\"remark\":\"institute\",\"sort\":0}]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.update()', '添加字典', '2019-03-20 00:10:00');
INSERT INTO `sys_log` VALUES ('1108037918053675010', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-20 00:10:01');
INSERT INTO `sys_log` VALUES ('1108055469294886913', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-03-20 01:19:44');
INSERT INTO `sys_log` VALUES ('1108399109678620674', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-21 00:05:13');
INSERT INTO `sys_log` VALUES ('1108733094472507394', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-03-21 22:12:24');
INSERT INTO `sys_log` VALUES ('1109122099261267969', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-03-22 23:58:10');
INSERT INTO `sys_log` VALUES ('1109128938791211009', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-03-23 00:25:20');
INSERT INTO `sys_log` VALUES ('1109129040591163393', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-03-23 00:25:45');
INSERT INTO `sys_log` VALUES ('1109132324374679553', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-03-23 00:38:47');
INSERT INTO `sys_log` VALUES ('1109132394436333570', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-03-23 00:39:04');
INSERT INTO `sys_log` VALUES ('1109132761085612034', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-03-23 00:40:32');
INSERT INTO `sys_log` VALUES ('1110157494828781570', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-03-25 20:32:26');
INSERT INTO `sys_log` VALUES ('1110157524528648193', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-03-25 20:32:34');
INSERT INTO `sys_log` VALUES ('1110157925294395393', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-25 20:34:10');
INSERT INTO `sys_log` VALUES ('1110168901905403906', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-25 21:17:47');
INSERT INTO `sys_log` VALUES ('1110172664716185601', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-25 21:32:44');
INSERT INTO `sys_log` VALUES ('1110173304691478530', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-25 21:35:16');
INSERT INTO `sys_log` VALUES ('1110175454456758273', '游客', '0', '127.0.0.1', '1', '/app/activity/add', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.add()', '添加活动', '2019-03-25 21:43:48');
INSERT INTO `sys_log` VALUES ('1110185410492940290', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-25 22:23:23');
INSERT INTO `sys_log` VALUES ('1110185607105134594', '游客', '0', '127.0.0.1', '1', '/app/activity/add', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.add()', '添加活动', '2019-03-25 22:24:10');
INSERT INTO `sys_log` VALUES ('1110187674079117313', '游客', '0', '127.0.0.1', '1', '/app/activity/add', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.add()', '添加活动', '2019-03-25 22:32:22');
INSERT INTO `sys_log` VALUES ('1110187674674708481', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-25 22:32:23');
INSERT INTO `sys_log` VALUES ('1110198157171539969', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-25 23:14:02');
INSERT INTO `sys_log` VALUES ('1110198768986275842', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-25 23:16:28');
INSERT INTO `sys_log` VALUES ('1110199237045436418', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-25 23:18:19');
INSERT INTO `sys_log` VALUES ('1110199238047875074', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-25 23:18:20');
INSERT INTO `sys_log` VALUES ('1110199244045729794', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-25 23:18:21');
INSERT INTO `sys_log` VALUES ('1110199253180923905', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-25 23:18:23');
INSERT INTO `sys_log` VALUES ('1110200014115749889', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-25 23:21:25');
INSERT INTO `sys_log` VALUES ('1110200020302348290', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-25 23:21:26');
INSERT INTO `sys_log` VALUES ('1110200498159403010', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-25 23:23:20');
INSERT INTO `sys_log` VALUES ('1110200507902771201', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-25 23:23:22');
INSERT INTO `sys_log` VALUES ('1110200515335077890', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-25 23:23:24');
INSERT INTO `sys_log` VALUES ('1110200632301633538', '游客', '0', '127.0.0.1', '1', '/app/activity/add', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.add()', '添加活动', '2019-03-25 23:23:52');
INSERT INTO `sys_log` VALUES ('1110202144889290754', '游客', '0', '127.0.0.1', '1', '/app/activity/add', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.add()', '添加活动', '2019-03-25 23:29:53');
INSERT INTO `sys_log` VALUES ('1110215477419847682', '游客', '0', '127.0.0.1', '1', '/app/activity/add', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.add()', '添加活动', '2019-03-26 00:22:51');
INSERT INTO `sys_log` VALUES ('1110215477419847681', '游客', '0', '127.0.0.1', '1', '/app/activity/add', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.add()', '添加活动', '2019-03-26 00:22:51');
INSERT INTO `sys_log` VALUES ('1110216835070021633', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-26 00:28:15');
INSERT INTO `sys_log` VALUES ('1110526804814245889', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-03-26 20:59:57');
INSERT INTO `sys_log` VALUES ('1110526828507869185', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-03-26 21:00:03');
INSERT INTO `sys_log` VALUES ('1110527804186914817', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-26 21:03:55');
INSERT INTO `sys_log` VALUES ('1110528179115749378', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-26 21:05:25');
INSERT INTO `sys_log` VALUES ('1110529307941367810', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-26 21:09:54');
INSERT INTO `sys_log` VALUES ('1110529806535061506', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-26 21:11:53');
INSERT INTO `sys_log` VALUES ('1110530666375770113', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-26 21:15:18');
INSERT INTO `sys_log` VALUES ('1110531084711456769', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-26 21:16:58');
INSERT INTO `sys_log` VALUES ('1110531436735197185', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-03-26 21:18:22');
INSERT INTO `sys_log` VALUES ('1110534198684381186', '游客', '0', '127.0.0.1', '1', '/app/activity/add', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.add()', '添加活动', '2019-03-26 21:29:20');
INSERT INTO `sys_log` VALUES ('1111213172959834113', 'admin', '1', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-03-28 18:27:20');
INSERT INTO `sys_log` VALUES ('1111213243453501441', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-28 18:27:37');
INSERT INTO `sys_log` VALUES ('1111313827745521665', 'admin', '1', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-03-29 01:07:18');
INSERT INTO `sys_log` VALUES ('1111314042380640257', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 01:08:10');
INSERT INTO `sys_log` VALUES ('1111314070952239106', 'admin', '1', '127.0.0.1', '1', '/system/role/update/989416986389880834', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.common.controller.UpdateController.update()', '更新指定ID对象的信息', '2019-03-29 01:08:16');
INSERT INTO `sys_log` VALUES ('1111314163197566978', 'admin', '1', '127.0.0.1', '1', '/system/role/add', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.common.controller.CreateController.add()', '添加新增', '2019-03-29 01:08:38');
INSERT INTO `sys_log` VALUES ('1111314274828967937', 'admin', '1', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 01:09:05');
INSERT INTO `sys_log` VALUES ('1111314709258199042', 'admin', '1', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-29 01:10:49');
INSERT INTO `sys_log` VALUES ('1111315001546661890', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-03-29 01:11:58');
INSERT INTO `sys_log` VALUES ('1111320013278568449', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-03-29 01:31:53');
INSERT INTO `sys_log` VALUES ('1111321184307273729', 'admin', '1', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-03-29 01:36:32');
INSERT INTO `sys_log` VALUES ('1111321632875503618', 'admin', '1', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-03-29 01:38:19');
INSERT INTO `sys_log` VALUES ('1111336385513545729', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:36:57');
INSERT INTO `sys_log` VALUES ('1111336559619104770', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:37:38');
INSERT INTO `sys_log` VALUES ('1111336862808563713', 'admin', '111111', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"部门管理\",\"permission\":\"app:apartment\",\"sort\":0,\"type\":0,\"url\":\"/apartment\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-29 02:38:50');
INSERT INTO `sys_log` VALUES ('1111336863978774530', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:38:51');
INSERT INTO `sys_log` VALUES ('1111336982681772034', 'admin', '111111', '127.0.0.1', '1', '/system/resource/update/1111336861244088322', '[\"1111336861244088322\",{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"部门管理\",\"permission\":\"apartment\",\"sort\":0,\"type\":0,\"url\":\"/apartment\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-29 02:39:19');
INSERT INTO `sys_log` VALUES ('1111336984854421506', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:39:19');
INSERT INTO `sys_log` VALUES ('1111337292959604737', 'admin', '111111', '127.0.0.1', '1', '/system/resource/update/1107177955806736385', '[\"1107177955806736385\",{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"学生信息管理\",\"permission\":\"student\",\"sort\":0,\"type\":0,\"url\":\"/student\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-29 02:40:33');
INSERT INTO `sys_log` VALUES ('1111337293911711745', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:40:33');
INSERT INTO `sys_log` VALUES ('1111337537563025410', 'admin', '111111', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"成员管理\",\"parentId\":\"1111336861244088322\",\"permission\":\"apartment:member:list\",\"sort\":0,\"type\":0,\"url\":\"/apartment/member\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-29 02:41:31');
INSERT INTO `sys_log` VALUES ('1111337538443829249', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:41:31');
INSERT INTO `sys_log` VALUES ('1111337746560999425', 'admin', '111111', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"成员添加\",\"parentId\":\"1111336861244088322\",\"permission\":\"apartment:member:add\",\"sort\":0,\"type\":1,\"url\":\"/apartment/member/add\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-29 02:42:21');
INSERT INTO `sys_log` VALUES ('1111337748205166594', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:42:21');
INSERT INTO `sys_log` VALUES ('1111338010449829890', 'admin', '111111', '127.0.0.1', '1', '/system/resource/update/1111337746099625986', '[\"1111337746099625986\",{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"分组管理\",\"permission\":\"apartment:group:list\",\"sort\":0,\"type\":1,\"url\":\"/apartment/group/list\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-29 02:43:24');
INSERT INTO `sys_log` VALUES ('1111338011456462849', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:43:24');
INSERT INTO `sys_log` VALUES ('1111338093442523138', 'admin', '111111', '127.0.0.1', '1', '/system/resource/update/1111337746099625986', '[\"1111337746099625986\",{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"分组管理\",\"permission\":\"apartment:group:list\",\"sort\":0,\"type\":1,\"url\":\"/apartment/group\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-29 02:43:44');
INSERT INTO `sys_log` VALUES ('1111338094277189634', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:43:44');
INSERT INTO `sys_log` VALUES ('1111338161729986562', 'admin', '111111', '127.0.0.1', '1', '/system/resource/update/1111337746099625986', '[\"1111337746099625986\",{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"分组管理\",\"permission\":\"apartment:group\",\"sort\":0,\"type\":1,\"url\":\"/apartment/group\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-29 02:44:00');
INSERT INTO `sys_log` VALUES ('1111338163701309442', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:44:01');
INSERT INTO `sys_log` VALUES ('1111338208664248321', 'admin', '111111', '127.0.0.1', '1', '/system/resource/update/1111337537055514625', '[\"1111337537055514625\",{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"成员管理\",\"permission\":\"apartment:member\",\"sort\":0,\"type\":0,\"url\":\"/apartment/member\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-29 02:44:11');
INSERT INTO `sys_log` VALUES ('1111338209868013570', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:44:12');
INSERT INTO `sys_log` VALUES ('1111338420459823106', 'admin', '111111', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"信息修改\",\"parentId\":\"1111336861244088322\",\"permission\":\"apartment:message\",\"sort\":0,\"type\":0,\"url\":\"/apartment/message\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-29 02:45:02');
INSERT INTO `sys_log` VALUES ('1111338421420318721', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:45:02');
INSERT INTO `sys_log` VALUES ('1111338599359471617', 'admin', '111111', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"成员列表\",\"parentId\":\"1111337537055514625\",\"permission\":\"apartment:member:llist\",\"sort\":0,\"type\":0,\"url\":\"/apartment/member/list\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-29 02:45:44');
INSERT INTO `sys_log` VALUES ('1111338600353521665', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:45:45');
INSERT INTO `sys_log` VALUES ('1111338803122954241', 'admin', '111111', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"成员添加\",\"parentId\":\"1111337537055514625\",\"permission\":\"apartment:member:add\",\"sort\":0,\"type\":1,\"url\":\"/apartment/member/add\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-29 02:46:33');
INSERT INTO `sys_log` VALUES ('1111338804486103041', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:46:33');
INSERT INTO `sys_log` VALUES ('1111338951307714562', 'admin', '111111', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"成员修改\",\"parentId\":\"1111337537055514625\",\"permission\":\"apartment:member:update\",\"sort\":0,\"type\":0,\"url\":\"/apartment/member/update\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-29 02:47:08');
INSERT INTO `sys_log` VALUES ('1111338952687640577', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:47:09');
INSERT INTO `sys_log` VALUES ('1111339082799144962', 'admin', '111111', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"成员移除\",\"parentId\":\"1111337537055514625\",\"permission\":\"apartment:member:remove\",\"sort\":0,\"type\":0,\"url\":\"/apartment/member/remove\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-29 02:47:40');
INSERT INTO `sys_log` VALUES ('1111339084292317185', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:47:40');
INSERT INTO `sys_log` VALUES ('1111339137811636226', 'admin', '111111', '127.0.0.1', '1', '/system/resource/update/1111338598487056386', '[\"1111338598487056386\",{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"成员列表\",\"permission\":\"apartment:member:llist\",\"sort\":0,\"type\":1,\"url\":\"/apartment/member/list\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-29 02:47:53');
INSERT INTO `sys_log` VALUES ('1111339139107676161', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:47:53');
INSERT INTO `sys_log` VALUES ('1111339174310469633', 'admin', '111111', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-03-29 02:48:01');
INSERT INTO `sys_log` VALUES ('1111339221634801665', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:48:13');
INSERT INTO `sys_log` VALUES ('1111339238747561986', 'admin', '111111', '127.0.0.1', '1', '/system/role/update/988623554205990914', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.common.controller.UpdateController.update()', '更新指定ID对象的信息', '2019-03-29 02:48:17');
INSERT INTO `sys_log` VALUES ('1111339284696162305', 'admin', '111111', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-03-29 02:48:28');
INSERT INTO `sys_log` VALUES ('1111339299321700354', 'admin', '111111', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-03-29 02:48:31');
INSERT INTO `sys_log` VALUES ('1111339915171356674', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:50:58');
INSERT INTO `sys_log` VALUES ('1111339929859809282', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:51:02');
INSERT INTO `sys_log` VALUES ('1111340064073342977', 'admin', '111111', '127.0.0.1', '1', '/system/resource/update/1111338598487056386', '[\"1111338598487056386\",{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"成员列表\",\"permission\":\"apartment:member:llist\",\"sort\":0,\"type\":0,\"url\":\"/apartment/member/list\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-29 02:51:34');
INSERT INTO `sys_log` VALUES ('1111340065847533570', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:51:34');
INSERT INTO `sys_log` VALUES ('1111340119379435521', 'admin', '111111', '127.0.0.1', '1', '/system/resource/update/1111337746099625986', '[\"1111337746099625986\",{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"分组管理\",\"permission\":\"apartment:group\",\"sort\":0,\"type\":0,\"url\":\"/apartment/group\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-29 02:51:47');
INSERT INTO `sys_log` VALUES ('1111340122483220481', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:51:48');
INSERT INTO `sys_log` VALUES ('1111340277257232385', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:52:24');
INSERT INTO `sys_log` VALUES ('1111340796923109378', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 02:54:28');
INSERT INTO `sys_log` VALUES ('1111342751821094914', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-29 03:02:14');
INSERT INTO `sys_log` VALUES ('1111646523503960066', 'admin', '111111', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-03-29 23:09:19');
INSERT INTO `sys_log` VALUES ('1111833786150051842', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-30 11:33:26');
INSERT INTO `sys_log` VALUES ('1111833879422984193', 'admin', '111111', '127.0.0.1', '1', '/system/role/update/988623554205990914', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.common.controller.UpdateController.update()', '更新指定ID对象的信息', '2019-03-30 11:33:48');
INSERT INTO `sys_log` VALUES ('1111833888667230209', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-30 11:33:51');
INSERT INTO `sys_log` VALUES ('1111834000810336258', 'admin', '111111', '127.0.0.1', '1', '/system/resource/update/1107324513160327169', '[\"1107324513160327169\",{\"color\":\"#9B1DEA\",\"icon\":\"\",\"name\":\"分组添加\",\"permission\":\"student:group:add\",\"sort\":0,\"type\":1,\"url\":\"/student/group/add\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-30 11:34:17');
INSERT INTO `sys_log` VALUES ('1111834000810336259', 'admin', '111111', '127.0.0.1', '1', '/system/resource/update/1107324513160327169', '[\"1107324513160327169\",{\"color\":\"#9B1DEA\",\"icon\":\"\",\"name\":\"分组添加\",\"permission\":\"student:group:add\",\"sort\":0,\"type\":1,\"url\":\"/student/group/add\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-30 11:34:17');
INSERT INTO `sys_log` VALUES ('1111834005881249794', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-30 11:34:19');
INSERT INTO `sys_log` VALUES ('1111834006694944770', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-30 11:34:19');
INSERT INTO `sys_log` VALUES ('1111834089586974722', 'admin', '111111', '127.0.0.1', '1', '/system/resource/update/1107324693469261826', '[\"1107324693469261826\",{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"分组更新\",\"permission\":\"student:group:update\",\"sort\":0,\"type\":1,\"url\":\"/student/group/update\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-30 11:34:38');
INSERT INTO `sys_log` VALUES ('1111834090350338049', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-30 11:34:39');
INSERT INTO `sys_log` VALUES ('1111834156444180481', 'admin', '111111', '127.0.0.1', '1', '/system/resource/update/1107324821777215490', '[\"1107324821777215490\",{\"color\":\"#9B1DEA\",\"icon\":\"\",\"name\":\"分组移除\",\"permission\":\"student:group:remove\",\"sort\":0,\"type\":1,\"url\":\"/student/group/remove\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-30 11:34:54');
INSERT INTO `sys_log` VALUES ('1111834157538893825', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-30 11:34:55');
INSERT INTO `sys_log` VALUES ('1111834231731937281', 'admin', '111111', '127.0.0.1', '1', '/system/resource/update/1107324948407447553', '[\"1107324948407447553\",{\"color\":\"#9B1DEA\",\"icon\":\"\",\"name\":\"分组列表\",\"permission\":\"student:group:list\",\"sort\":0,\"type\":0,\"url\":\"/student/group/list\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-03-30 11:35:12');
INSERT INTO `sys_log` VALUES ('1111834233380298753', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-30 11:35:13');
INSERT INTO `sys_log` VALUES ('1111834454063603713', 'admin', '111111', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"分组管理\",\"parentId\":\"1107177955806736385\",\"permission\":\"student:group\",\"sort\":0,\"type\":0,\"url\":\"/student/group\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-30 11:36:05');
INSERT INTO `sys_log` VALUES ('1111834454919241730', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-30 11:36:06');
INSERT INTO `sys_log` VALUES ('1111835003781668865', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-30 11:38:16');
INSERT INTO `sys_log` VALUES ('1111835376038731778', 'admin', '111111', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"学生管理\",\"parentId\":\"1107177955806736385\",\"permission\":\"student:manage\",\"sort\":0,\"type\":0,\"url\":\"/student/manage\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-30 11:39:45');
INSERT INTO `sys_log` VALUES ('1111835377502543874', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-30 11:39:46');
INSERT INTO `sys_log` VALUES ('1111835524508704770', 'admin', '111111', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"学生认证\",\"parentId\":\"1107177955806736385\",\"permission\":\"student:auth\",\"sort\":0,\"type\":0,\"url\":\"/student/auth\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-30 11:40:21');
INSERT INTO `sys_log` VALUES ('1111835525611806722', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-30 11:40:21');
INSERT INTO `sys_log` VALUES ('1111879266489884673', 'admin', '111111', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"学分管理\",\"parentId\":\"1091630776044265473\",\"permission\":\"activity:score\",\"sort\":0,\"type\":0,\"url\":\"/activity/score\",\"verification\":false}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-03-30 14:34:10');
INSERT INTO `sys_log` VALUES ('1111879268553482242', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-30 14:34:10');
INSERT INTO `sys_log` VALUES ('1111885306975510530', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-30 14:58:10');
INSERT INTO `sys_log` VALUES ('1111885614199889922', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-30 14:59:23');
INSERT INTO `sys_log` VALUES ('1111885960502599681', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-30 15:00:45');
INSERT INTO `sys_log` VALUES ('1111886060624830466', 'admin', '111111', '127.0.0.1', '1', '/system/role/update/988623554205990914', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.common.controller.UpdateController.update()', '更新指定ID对象的信息', '2019-03-30 15:01:09');
INSERT INTO `sys_log` VALUES ('1111886157395812353', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-30 15:01:32');
INSERT INTO `sys_log` VALUES ('1111886170393960450', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-30 15:01:36');
INSERT INTO `sys_log` VALUES ('1111886203453464577', 'admin', '111111', '127.0.0.1', '1', '/system/role/update/988623554205990914', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.common.controller.UpdateController.update()', '更新指定ID对象的信息', '2019-03-30 15:01:43');
INSERT INTO `sys_log` VALUES ('1111886347754299394', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-30 15:02:18');
INSERT INTO `sys_log` VALUES ('1111886660414496770', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-03-30 15:03:32');
INSERT INTO `sys_log` VALUES ('1111886726470590465', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-03-30 15:03:48');
INSERT INTO `sys_log` VALUES ('1111910734289199105', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-03-30 16:39:12');
INSERT INTO `sys_log` VALUES ('1111910764299444226', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-03-30 16:39:19');
INSERT INTO `sys_log` VALUES ('1111916973433839617', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-03-30 17:04:00');
INSERT INTO `sys_log` VALUES ('1111917487840059394', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-03-30 17:06:02');
INSERT INTO `sys_log` VALUES ('1112263118903336961', 'admin', '111111', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-03-31 15:59:27');
INSERT INTO `sys_log` VALUES ('1112263238835265537', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-03-31 15:59:56');
INSERT INTO `sys_log` VALUES ('1112263358737833985', 'admin', '111111', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-03-31 16:00:24');
INSERT INTO `sys_log` VALUES ('1112263442506473473', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-03-31 16:00:44');
INSERT INTO `sys_log` VALUES ('1112264024524873729', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-03-31 16:03:03');
INSERT INTO `sys_log` VALUES ('1112272633270919170', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-03-31 16:37:15');
INSERT INTO `sys_log` VALUES ('1112273147077353473', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-03-31 16:39:18');
INSERT INTO `sys_log` VALUES ('1112273950647279618', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-03-31 16:42:30');
INSERT INTO `sys_log` VALUES ('1113438660562280450', 'admin', '111111', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-04-03 21:50:38');
INSERT INTO `sys_log` VALUES ('1113487139275825154', 'admin', '111111', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-04-04 01:03:16');
INSERT INTO `sys_log` VALUES ('1113487201246666753', 'admin', '111111', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-04-04 01:03:31');
INSERT INTO `sys_log` VALUES ('1113487256267546625', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-04 01:03:44');
INSERT INTO `sys_log` VALUES ('1113487279977947138', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-04 01:03:50');
INSERT INTO `sys_log` VALUES ('1113487455866085377', 'admin', '111111', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-04-04 01:04:32');
INSERT INTO `sys_log` VALUES ('1113487575730905090', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-04 01:05:00');
INSERT INTO `sys_log` VALUES ('1114555149541466114', 'admin', '111111', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-04-06 23:47:09');
INSERT INTO `sys_log` VALUES ('1114833959314808834', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-07 18:15:03');
INSERT INTO `sys_log` VALUES ('1114834073374711810', 'admin', '111111', '127.0.0.1', '1', '/system/resource/update/1111338419587407874', '[\"1111338419587407874\",{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"部门管理\",\"permission\":\"apartment:message\",\"sort\":0,\"type\":0,\"url\":\"/apartment/message\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-04-07 18:15:30');
INSERT INTO `sys_log` VALUES ('1114834076109398018', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-07 18:15:31');
INSERT INTO `sys_log` VALUES ('1114834157348872193', 'admin', '111111', '127.0.0.1', '1', '/system/resource/update/1111338419587407874', '[\"1111338419587407874\",{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"部门管理\",\"permission\":\"apartment:manage\",\"sort\":0,\"type\":0,\"url\":\"/apartment/manage\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-04-07 18:15:50');
INSERT INTO `sys_log` VALUES ('1114834169499770881', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-07 18:15:53');
INSERT INTO `sys_log` VALUES ('1114838724912373762', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-07 18:33:59');
INSERT INTO `sys_log` VALUES ('1114932586053918721', 'admin', '111111', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-04-08 00:46:58');
INSERT INTO `sys_log` VALUES ('1114942860286779394', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-08 01:27:47');
INSERT INTO `sys_log` VALUES ('1114943093750128642', 'admin', '111111', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"报名管理\",\"parentId\":\"1091630776044265473\",\"permission\":\"activity:signup\",\"sort\":2,\"type\":0,\"url\":\"/activity/signup\",\"verification\":false}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-04-08 01:28:43');
INSERT INTO `sys_log` VALUES ('1114943095906000898', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-08 01:28:43');
INSERT INTO `sys_log` VALUES ('1114943930014654465', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-08 01:32:02');
INSERT INTO `sys_log` VALUES ('1114944028702433282', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-08 01:32:26');
INSERT INTO `sys_log` VALUES ('1114944031915270146', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-08 01:32:27');
INSERT INTO `sys_log` VALUES ('1114944112420741121', 'admin', '111111', '127.0.0.1', '1', '/system/role/update/988623554205990914', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.common.controller.UpdateController.update()', '更新指定ID对象的信息', '2019-04-08 01:32:46');
INSERT INTO `sys_log` VALUES ('1114945004880551938', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-04-08 01:36:19');
INSERT INTO `sys_log` VALUES ('1114945053005996034', '游客', '0', '127.0.0.1', '1', '/app/activity/list', '[{\"asc\":false,\"page\":1,\"pageSize\":15}]', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.get()', '分页获取活动数据', '2019-04-08 01:36:30');
INSERT INTO `sys_log` VALUES ('1115284764966805506', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-09 00:06:23');
INSERT INTO `sys_log` VALUES ('1115284784927498241', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-09 00:06:28');
INSERT INTO `sys_log` VALUES ('1115284816229588994', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-09 00:06:36');
INSERT INTO `sys_log` VALUES ('1115284827055087617', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-09 00:06:38');
INSERT INTO `sys_log` VALUES ('1115284834730663938', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-09 00:06:40');
INSERT INTO `sys_log` VALUES ('1115284854552944642', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-09 00:06:45');
INSERT INTO `sys_log` VALUES ('1115284857895804930', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-09 00:06:46');
INSERT INTO `sys_log` VALUES ('1115284862555676674', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-09 00:06:47');
INSERT INTO `sys_log` VALUES ('1115284864245981185', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-09 00:06:47');
INSERT INTO `sys_log` VALUES ('1115289547102511106', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-09 00:25:24');
INSERT INTO `sys_log` VALUES ('1115289547706490881', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-09 00:25:24');
INSERT INTO `sys_log` VALUES ('1115289559517650945', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-09 00:25:27');
INSERT INTO `sys_log` VALUES ('1115289564605341698', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-09 00:25:28');
INSERT INTO `sys_log` VALUES ('1115289840070451202', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-09 00:26:34');
INSERT INTO `sys_log` VALUES ('1115289845955059714', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-09 00:26:35');
INSERT INTO `sys_log` VALUES ('1115293701057400834', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-09 00:41:52');
INSERT INTO `sys_log` VALUES ('1115293726755901441', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-09 00:42:00');
INSERT INTO `sys_log` VALUES ('1115294712681582594', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-09 00:45:55');
INSERT INTO `sys_log` VALUES ('1115300712725729282', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-09 01:09:46');
INSERT INTO `sys_log` VALUES ('1115300939683713025', '游客', '0', '127.0.0.1', '1', '/app/activity/add', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.core.controller.app.ActivityController.add()', '添加活动', '2019-04-09 01:10:40');
INSERT INTO `sys_log` VALUES ('1116009680028684289', 'admin', '111111', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-04-11 00:06:56');
INSERT INTO `sys_log` VALUES ('1116375408019779585', 'admin', '111111', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-04-12 00:20:13');
INSERT INTO `sys_log` VALUES ('1116375829748658178', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-12 00:21:54');
INSERT INTO `sys_log` VALUES ('1116379869249286145', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-12 00:37:57');
INSERT INTO `sys_log` VALUES ('1116381851993251841', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-12 00:45:49');
INSERT INTO `sys_log` VALUES ('1116384498099953665', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-12 00:56:20');
INSERT INTO `sys_log` VALUES ('1116384507021238273', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-12 00:56:23');
INSERT INTO `sys_log` VALUES ('1116392691043667970', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-12 01:28:53');
INSERT INTO `sys_log` VALUES ('1116972350793957378', 'admin', '111111', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-04-13 15:52:15');
INSERT INTO `sys_log` VALUES ('1116972725269807106', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-13 15:53:45');
INSERT INTO `sys_log` VALUES ('1116974126670659586', 'admin', '111111', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"部门主页\",\"parentId\":\"1111336861244088322\",\"permission\":\"apartment:index\",\"sort\":0,\"type\":0,\"url\":\"/apartment/index\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-04-13 15:59:19');
INSERT INTO `sys_log` VALUES ('1116974131099844609', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-13 15:59:20');
INSERT INTO `sys_log` VALUES ('1116974611108577282', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-13 16:01:14');
INSERT INTO `sys_log` VALUES ('1116980474439385090', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-13 16:24:32');
INSERT INTO `sys_log` VALUES ('1116980498229477378', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-13 16:24:38');
INSERT INTO `sys_log` VALUES ('1116989697944567809', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-13 17:01:11');
INSERT INTO `sys_log` VALUES ('1116989767330938882', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-13 17:01:28');
INSERT INTO `sys_log` VALUES ('1116989800755347458', 'admin', '111111', '127.0.0.1', '1', '/system/role/update/988623554205990914', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.common.controller.UpdateController.update()', '更新指定ID对象的信息', '2019-04-13 17:01:36');
INSERT INTO `sys_log` VALUES ('1116989873828511746', 'admin', '111111', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-04-13 17:01:53');
INSERT INTO `sys_log` VALUES ('1117044834952134657', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-04-13 20:40:17');
INSERT INTO `sys_log` VALUES ('1117432961722019842', 'admin', '111111', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-04-14 22:22:32');
INSERT INTO `sys_log` VALUES ('1117432991237337090', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-14 22:22:41');
INSERT INTO `sys_log` VALUES ('1117445054722535425', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-14 23:10:37');
INSERT INTO `sys_log` VALUES ('1117445840865128450', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-14 23:13:44');
INSERT INTO `sys_log` VALUES ('1117446413911973889', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-14 23:16:00');
INSERT INTO `sys_log` VALUES ('1117446624101130242', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-04-14 23:16:51');
INSERT INTO `sys_log` VALUES ('1117447473346940929', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-14 23:20:13');
INSERT INTO `sys_log` VALUES ('1117447474471014401', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-14 23:20:14');
INSERT INTO `sys_log` VALUES ('1117448452209500162', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-04-14 23:24:06');
INSERT INTO `sys_log` VALUES ('1117448700340330498', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-04-14 23:25:06');
INSERT INTO `sys_log` VALUES ('1117449222317268994', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-04-14 23:27:10');
INSERT INTO `sys_log` VALUES ('1117449324033335298', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-04-14 23:27:35');
INSERT INTO `sys_log` VALUES ('1117453177105416193', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-04-14 23:42:53');
INSERT INTO `sys_log` VALUES ('1117453225297969153', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-14 23:43:05');
INSERT INTO `sys_log` VALUES ('1117453226526900225', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-14 23:43:05');
INSERT INTO `sys_log` VALUES ('1117461128163741698', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 00:14:29');
INSERT INTO `sys_log` VALUES ('1117463497542737921', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 00:23:54');
INSERT INTO `sys_log` VALUES ('1117464291780440065', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 00:27:03');
INSERT INTO `sys_log` VALUES ('1117464874989924353', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 00:29:22');
INSERT INTO `sys_log` VALUES ('1117464904509435906', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 00:29:29');
INSERT INTO `sys_log` VALUES ('1117465494618636290', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 00:31:50');
INSERT INTO `sys_log` VALUES ('1117465498892632066', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-15 00:31:51');
INSERT INTO `sys_log` VALUES ('1117469347934138369', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-04-15 00:47:09');
INSERT INTO `sys_log` VALUES ('1117470837952339970', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 00:53:04');
INSERT INTO `sys_log` VALUES ('1117470838728286209', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-15 00:53:04');
INSERT INTO `sys_log` VALUES ('1117470960216301569', 'admin', '111111', '127.0.0.1', '1', '/app/group/add', '[{\"classNum\":1,\"dictId\":\"1106975840870133761\",\"name\":\"15dd\",\"period\":2015}]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.add()', '添加分组', '2019-04-15 00:53:33');
INSERT INTO `sys_log` VALUES ('1117470960426016770', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 00:53:33');
INSERT INTO `sys_log` VALUES ('1117470960895778817', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-15 00:53:33');
INSERT INTO `sys_log` VALUES ('1117475286515048450', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.list()', '获取所有的字典列表', '2019-04-15 01:10:45');
INSERT INTO `sys_log` VALUES ('1117476040210403330', 'admin', '111111', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-04-15 01:13:44');
INSERT INTO `sys_log` VALUES ('1117477506224517122', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 01:19:33');
INSERT INTO `sys_log` VALUES ('1117477510745976834', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-15 01:19:35');
INSERT INTO `sys_log` VALUES ('1117477735472590850', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 01:20:29');
INSERT INTO `sys_log` VALUES ('1117477736856711170', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-15 01:20:29');
INSERT INTO `sys_log` VALUES ('1117477766246199298', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 01:20:36');
INSERT INTO `sys_log` VALUES ('1117477767110225922', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-15 01:20:36');
INSERT INTO `sys_log` VALUES ('1117478620621725698', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 01:23:59');
INSERT INTO `sys_log` VALUES ('1117478625604558849', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-15 01:24:01');
INSERT INTO `sys_log` VALUES ('1117478691710984193', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 01:24:17');
INSERT INTO `sys_log` VALUES ('1117478692432404482', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-15 01:24:17');
INSERT INTO `sys_log` VALUES ('1117478870715502593', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 01:24:59');
INSERT INTO `sys_log` VALUES ('1117478876763688961', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-15 01:25:01');
INSERT INTO `sys_log` VALUES ('1117479003184205826', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 01:25:31');
INSERT INTO `sys_log` VALUES ('1117479004509605890', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-15 01:25:31');
INSERT INTO `sys_log` VALUES ('1117479231530504193', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 01:26:25');
INSERT INTO `sys_log` VALUES ('1117479232767823874', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-15 01:26:26');
INSERT INTO `sys_log` VALUES ('1117479450934546433', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 01:27:18');
INSERT INTO `sys_log` VALUES ('1117479451605635074', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-15 01:27:18');
INSERT INTO `sys_log` VALUES ('1117803770298798082', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 22:56:01');
INSERT INTO `sys_log` VALUES ('1117803775248076802', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-15 22:56:03');
INSERT INTO `sys_log` VALUES ('1117817752200003586', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 23:51:34');
INSERT INTO `sys_log` VALUES ('1117817754330710018', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-15 23:51:35');
INSERT INTO `sys_log` VALUES ('1117817875030196226', 'admin', '111111', '127.0.0.1', '1', '/app/group/add', '[{\"classNum\":4,\"dictId\":\"1106977594353446913\",\"name\":\"ss\",\"period\":2016}]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.add()', '添加分组', '2019-04-15 23:52:04');
INSERT INTO `sys_log` VALUES ('1117817875667730433', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 23:52:04');
INSERT INTO `sys_log` VALUES ('1117817877479669762', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-15 23:52:05');
INSERT INTO `sys_log` VALUES ('1117817940775911426', 'admin', '111111', '127.0.0.1', '1', '/app/group/add', '[{\"classNum\":4,\"dictId\":\"1106977594353446913\",\"name\":\"ss\",\"period\":2017}]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.add()', '添加分组', '2019-04-15 23:52:20');
INSERT INTO `sys_log` VALUES ('1117817941581217794', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-15 23:52:20');
INSERT INTO `sys_log` VALUES ('1117817942587850754', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-15 23:52:20');
INSERT INTO `sys_log` VALUES ('1117818065770364930', '游客', '0', '127.0.0.1', '1', '/app/student/remove/1', '[\"1\"]', 'POST', 'cn.licoy.wdog.common.controller.DeleteController.remove()', '删除指定ID的对象', '2019-04-15 23:52:50');
INSERT INTO `sys_log` VALUES ('1117821103797026817', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.memberList()', '部门成员列表', '2019-04-16 00:04:54');
INSERT INTO `sys_log` VALUES ('1117828707973709826', 'admin', '111111', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-04-16 00:35:07');
INSERT INTO `sys_log` VALUES ('1117828708783210498', 'admin', '111111', '127.0.0.1', '1', '/account/current', '[]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.current()', '获取当前用户信息', '2019-04-16 00:35:07');
INSERT INTO `sys_log` VALUES ('1118542879233466370', 'admin', '111111', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-04-17 23:52:58');
INSERT INTO `sys_log` VALUES ('1118542885189378049', 'admin', '111111', '127.0.0.1', '1', '/account/current', '[]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.current()', '获取当前用户信息', '2019-04-17 23:53:00');
INSERT INTO `sys_log` VALUES ('1118786340389969922', 'admin', '111111', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-04-18 16:00:24');
INSERT INTO `sys_log` VALUES ('1118786544535134209', 'admin', '111111', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"admin\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-04-18 16:01:13');
INSERT INTO `sys_log` VALUES ('1118788241990934529', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-18 16:07:58');
INSERT INTO `sys_log` VALUES ('1118789544993415169', 'admin', '111111', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"客户端\",\"permission\":\"client\",\"sort\":0,\"type\":0,\"url\":\"/c\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-04-18 16:13:08');
INSERT INTO `sys_log` VALUES ('1118789546444644353', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-18 16:13:09');
INSERT INTO `sys_log` VALUES ('1118789756113707009', 'admin', '111111', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"个人主页\",\"parentId\":\"1118789543013703681\",\"permission\":\"client:my\",\"sort\":0,\"type\":0,\"url\":\"/c/my\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-04-18 16:13:59');
INSERT INTO `sys_log` VALUES ('1118789757325860865', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-18 16:13:59');
INSERT INTO `sys_log` VALUES ('1118789939182493698', 'admin', '111111', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"我的学分\",\"parentId\":\"1118789543013703681\",\"permission\":\"client:credits\",\"sort\":0,\"type\":0,\"url\":\"/c/credits\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-04-18 16:14:42');
INSERT INTO `sys_log` VALUES ('1118789940763746306', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-18 16:14:43');
INSERT INTO `sys_log` VALUES ('1118790178433982466', 'admin', '111111', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"我的活动\",\"parentId\":\"1118789543013703681\",\"permission\":\"client:activities\",\"sort\":0,\"type\":0,\"url\":\"/c/activities\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-04-18 16:15:39');
INSERT INTO `sys_log` VALUES ('1118790179876823042', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-18 16:15:40');
INSERT INTO `sys_log` VALUES ('1118790479186550785', 'admin', '111111', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"首页\",\"parentId\":\"1118789543013703681\",\"permission\":\"client:home\",\"sort\":0,\"type\":0,\"url\":\"/c\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-04-18 16:16:51');
INSERT INTO `sys_log` VALUES ('1118790480730054658', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-18 16:16:51');
INSERT INTO `sys_log` VALUES ('1118790793725796354', 'admin', '111111', '127.0.0.1', '1', '/system/resource/update/1118790478062477314', '[\"1118790478062477314\",{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"首页\",\"permission\":\"client:home\",\"sort\":0,\"type\":0,\"url\":\"/c/index\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-04-18 16:18:06');
INSERT INTO `sys_log` VALUES ('1118790795214774273', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-18 16:18:06');
INSERT INTO `sys_log` VALUES ('1118791221960040449', 'admin', '111111', '127.0.0.1', '1', '/system/resource/update/1118790478062477314', '[\"1118790478062477314\",{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"首页\",\"permission\":\"home_index\",\"sort\":0,\"type\":0,\"url\":\"/c/index\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.update()', '添加资源', '2019-04-18 16:19:48');
INSERT INTO `sys_log` VALUES ('1118791223205748738', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-18 16:19:48');
INSERT INTO `sys_log` VALUES ('1118791613993246721', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-18 16:21:22');
INSERT INTO `sys_log` VALUES ('1118791678434533377', 'admin', '111111', '127.0.0.1', '1', '/system/role/update/989416986389880834', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.common.controller.UpdateController.update()', '更新指定ID对象的信息', '2019-04-18 16:21:37');
INSERT INTO `sys_log` VALUES ('1118791693349478402', 'admin', '111111', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-04-18 16:21:40');
INSERT INTO `sys_log` VALUES ('1118791729206583298', 'admin', '111111', '127.0.0.1', '1', '/system/user/get/id/1091628370111799298', '[\"1091628370111799298\"]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.getById()', '根据ID获取用户信息', '2019-04-18 16:21:49');
INSERT INTO `sys_log` VALUES ('1118791757224534018', 'admin', '111111', '127.0.0.1', '1', '/system/user/update/1091628370111799298', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.update()', '更新用户', '2019-04-18 16:21:56');
INSERT INTO `sys_log` VALUES ('1118791757480386562', 'admin', '111111', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-04-18 16:21:56');
INSERT INTO `sys_log` VALUES ('1118791800576860162', 'admin', '111111', '127.0.0.1', '1', '/system/user/reset-password', '[{\"password\":\"******\",\"uid\":\"1091628370111799298\"}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.resetPassword()', '重置密码', '2019-04-18 16:22:06');
INSERT INTO `sys_log` VALUES ('1118791800878850049', 'admin', '111111', '127.0.0.1', '1', '/system/user/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.system.UserController.get()', '分页获取用户数据', '2019-04-18 16:22:06');
INSERT INTO `sys_log` VALUES ('1118791866033168385', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"chiu\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-04-18 16:22:22');
INSERT INTO `sys_log` VALUES ('1118791867538923522', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/account/current', '[]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.current()', '获取当前用户信息', '2019-04-18 16:22:22');
INSERT INTO `sys_log` VALUES ('1118793309117014018', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-18 16:28:06');
INSERT INTO `sys_log` VALUES ('1118793771245428737', 'admin', '111111', '127.0.0.1', '1', '/system/resource/add', '[{\"color\":\"#19BE6B\",\"icon\":\"\",\"name\":\"活动详情\",\"parentId\":\"1118789543013703681\",\"permission\":\"client:detail\",\"sort\":0,\"type\":0,\"url\":\"/c/detail\",\"verification\":true}]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.add()', '添加资源', '2019-04-18 16:29:56');
INSERT INTO `sys_log` VALUES ('1118793772927344642', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-18 16:29:56');
INSERT INTO `sys_log` VALUES ('1118793945132883970', 'admin', '111111', '127.0.0.1', '1', '/system/resource/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.system.ResourceController.list()', '获取所有的资源列表', '2019-04-18 16:30:37');
INSERT INTO `sys_log` VALUES ('1118793966037295105', 'admin', '111111', '127.0.0.1', '1', '/system/role/update/989416986389880834', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.common.controller.UpdateController.update()', '更新指定ID对象的信息', '2019-04-18 16:30:42');
INSERT INTO `sys_log` VALUES ('1118794651185242114', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"chiu\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-04-18 16:33:26');
INSERT INTO `sys_log` VALUES ('1118794651445288961', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/account/current', '[]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.current()', '获取当前用户信息', '2019-04-18 16:33:26');
INSERT INTO `sys_log` VALUES ('1118798874799038466', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/account/sign-in', '[{\"password\":\"******\",\"username\":\"chiu\"}]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.signIn()', '登录', '2019-04-18 16:50:13');
INSERT INTO `sys_log` VALUES ('1118798875461738497', 'chiu', '1091628370111799298', '127.0.0.1', '1', '/account/current', '[]', 'POST', 'cn.licoy.wdog.core.controller.AccountController.current()', '获取当前用户信息', '2019-04-18 16:50:13');
INSERT INTO `sys_log` VALUES ('1118812189034078209', 'admin', '111111', '127.0.0.1', '1', '/system/role/update/988623554205990914', '数据过大，不给予记录', 'POST', 'cn.licoy.wdog.common.controller.UpdateController.update()', '更新指定ID对象的信息', '2019-04-18 17:43:07');
INSERT INTO `sys_log` VALUES ('1118812259678740481', '游客', '0', '127.0.0.1', '1', '/app/apartment/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.list()', '获取部门列表', '2019-04-18 17:43:24');
INSERT INTO `sys_log` VALUES ('1118813546927415298', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 17:48:31');
INSERT INTO `sys_log` VALUES ('1118813550865866753', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 17:48:32');
INSERT INTO `sys_log` VALUES ('1118813554250670082', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 17:48:33');
INSERT INTO `sys_log` VALUES ('1118813557174099970', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 17:48:33');
INSERT INTO `sys_log` VALUES ('1118813569626988545', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 17:48:36');
INSERT INTO `sys_log` VALUES ('1118813626879238145', '游客', '0', '127.0.0.1', '1', '/app/apartment/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.list()', '获取部门列表', '2019-04-18 17:48:50');
INSERT INTO `sys_log` VALUES ('1118813654926548993', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118329040784252929', '[\"1118329040784252929\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 17:48:57');
INSERT INTO `sys_log` VALUES ('1118813699642023937', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-18 17:49:07');
INSERT INTO `sys_log` VALUES ('1118813844769136642', 'admin', '111111', '127.0.0.1', '1', '/app/student/add', '[{\"dictId\":\"1106975625861722114\",\"period\":2019,\"realName\":\"陈一一\",\"stuNum\":\"1509876543211\",\"whatClass\":1}]', 'POST', 'cn.licoy.wdog.common.controller.CreateController.add()', '添加新增', '2019-04-18 17:49:42');
INSERT INTO `sys_log` VALUES ('1118813876624875521', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-18 17:49:49');
INSERT INTO `sys_log` VALUES ('1118813878101270530', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-18 17:49:50');
INSERT INTO `sys_log` VALUES ('1118813907100688386', 'admin', '111111', '127.0.0.1', '1', '/app/group/add', '[{\"classNum\":1,\"dictId\":\"1106975625861722114\",\"name\":\"11\",\"period\":2019}]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.add()', '添加分组', '2019-04-18 17:49:57');
INSERT INTO `sys_log` VALUES ('1118813907981492226', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-18 17:49:57');
INSERT INTO `sys_log` VALUES ('1118813909223006209', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-18 17:49:57');
INSERT INTO `sys_log` VALUES ('1118813937782022145', 'admin', '111111', '127.0.0.1', '1', '/app/group/add', '[{\"classNum\":1,\"dictId\":\"1106975748670943234\",\"name\":\"11\",\"period\":2019}]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.add()', '添加分组', '2019-04-18 17:50:04');
INSERT INTO `sys_log` VALUES ('1118813938738323457', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-18 17:50:04');
INSERT INTO `sys_log` VALUES ('1118813940336353282', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-18 17:50:05');
INSERT INTO `sys_log` VALUES ('1118813960158633986', 'admin', '111111', '127.0.0.1', '1', '/app/group/add', '[{\"classNum\":1,\"dictId\":\"1106975840870133761\",\"name\":\"11\",\"period\":2019}]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.add()', '添加分组', '2019-04-18 17:50:09');
INSERT INTO `sys_log` VALUES ('1118813960993300481', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-18 17:50:10');
INSERT INTO `sys_log` VALUES ('1118813962977206274', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-18 17:50:10');
INSERT INTO `sys_log` VALUES ('1118814037950390274', 'admin', '111111', '127.0.0.1', '1', '/app/group/add', '[{\"classNum\":2,\"dictId\":\"1106977594353446913\",\"name\":\"11\",\"period\":2019}]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.add()', '添加分组', '2019-04-18 17:50:28');
INSERT INTO `sys_log` VALUES ('1118814038940246017', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-18 17:50:28');
INSERT INTO `sys_log` VALUES ('1118814040613773314', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-18 17:50:28');
INSERT INTO `sys_log` VALUES ('1118814095139725314', 'admin', '111111', '127.0.0.1', '1', '/app/group/add', '[{\"classNum\":2,\"dictId\":\"1106977695704608770\",\"name\":\"11\",\"period\":2019}]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.add()', '添加分组', '2019-04-18 17:50:41');
INSERT INTO `sys_log` VALUES ('1118814096293158914', '游客', '0', '127.0.0.1', '1', '/app/group/list', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.list()', '获取所有的分组列表', '2019-04-18 17:50:42');
INSERT INTO `sys_log` VALUES ('1118814098176401409', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-18 17:50:42');
INSERT INTO `sys_log` VALUES ('1118814150638755842', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-18 17:50:55');
INSERT INTO `sys_log` VALUES ('1118814285024256001', '游客', '0', '127.0.0.1', '1', '/app/group/exist', '[{\"dictId\":\"1106975625861722114\",\"period\":2019,\"whatClass\":1}]', 'POST', 'cn.licoy.wdog.core.controller.app.GroupController.existGroup()', '删除分组', '2019-04-18 17:51:27');
INSERT INTO `sys_log` VALUES ('1118814285980557313', 'admin', '111111', '127.0.0.1', '1', '/app/student/update/1118813844702027777', '[\"1118813844702027777\",{\"dictId\":\"1106975625861722114\",\"period\":2019,\"realName\":\"陈一一\",\"stuNum\":\"1509876543211\",\"whatClass\":1}]', 'POST', 'cn.licoy.wdog.common.controller.UpdateController.update()', '更新指定ID对象的信息', '2019-04-18 17:51:27');
INSERT INTO `sys_log` VALUES ('1118814317593026562', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-18 17:51:35');
INSERT INTO `sys_log` VALUES ('1118814425176924162', 'admin', '111111', '127.0.0.1', '1', '/app/student/add', '[{\"dictId\":\"1106975840870133761\",\"period\":2019,\"realName\":\"李二二\",\"stuNum\":\"1509876543222\",\"whatClass\":1}]', 'POST', 'cn.licoy.wdog.common.controller.CreateController.add()', '添加新增', '2019-04-18 17:52:00');
INSERT INTO `sys_log` VALUES ('1118814472199266305', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-18 17:52:11');
INSERT INTO `sys_log` VALUES ('1118814572858368002', 'admin', '111111', '127.0.0.1', '1', '/app/student/add', '[{\"dictId\":\"1106977594353446913\",\"period\":2019,\"realName\":\"任三三\",\"stuNum\":\"1509876543233\",\"whatClass\":1}]', 'POST', 'cn.licoy.wdog.common.controller.CreateController.add()', '添加新增', '2019-04-18 17:52:35');
INSERT INTO `sys_log` VALUES ('1118814632933384193', '游客', '0', '127.0.0.1', '1', '/app/apartment/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.list()', '获取部门列表', '2019-04-18 17:52:50');
INSERT INTO `sys_log` VALUES ('1118814690118524929', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 17:53:03');
INSERT INTO `sys_log` VALUES ('1118814691183878145', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 17:53:04');
INSERT INTO `sys_log` VALUES ('1118814751326003202', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 17:53:18');
INSERT INTO `sys_log` VALUES ('1118863335811559425', 'admin', '111111', '127.0.0.1', '1', '/app/apartment/add', '[{\"about\":\"用于功能测试的部门\",\"apartAdmin\":\"1118814425151758337\",\"name\":\"通勤部\"}]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.add()', '添加部门', '2019-04-18 21:06:21');
INSERT INTO `sys_log` VALUES ('1118863337900322817', '游客', '0', '127.0.0.1', '1', '/app/apartment/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.list()', '获取部门列表', '2019-04-18 21:06:22');
INSERT INTO `sys_log` VALUES ('1118863505827672065', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:07:02');
INSERT INTO `sys_log` VALUES ('1118863532750909442', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118329040784252929', '[\"1118329040784252929\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:07:08');
INSERT INTO `sys_log` VALUES ('1118863586194731010', '游客', '0', '127.0.0.1', '1', '/app/apartment/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.list()', '获取部门列表', '2019-04-18 21:07:21');
INSERT INTO `sys_log` VALUES ('1118865249676668930', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118329040784252929', '[\"1118329040784252929\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:13:58');
INSERT INTO `sys_log` VALUES ('1118865283793137666', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:14:06');
INSERT INTO `sys_log` VALUES ('1118867655328116737', 'admin', '111111', '127.0.0.1', '1', '/system/dictionary/list/INSTITUTE', '[\"INSTITUTE\"]', 'POST', 'cn.licoy.wdog.core.controller.system.DictionaryController.listByCode()', '获取所有的字典列表', '2019-04-18 21:23:31');
INSERT INTO `sys_log` VALUES ('1118867769333493761', 'admin', '111111', '127.0.0.1', '1', '/app/student/add', '[{\"dictId\":\"1106975840870133761\",\"period\":2019,\"realName\":\"刘七七\",\"stuNum\":\"1509876543177\",\"whatClass\":1}]', 'POST', 'cn.licoy.wdog.common.controller.CreateController.add()', '添加新增', '2019-04-18 21:23:58');
INSERT INTO `sys_log` VALUES ('1118867976599220226', '游客', '0', '127.0.0.1', '1', '/app/apartment/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.list()', '获取部门列表', '2019-04-18 21:24:48');
INSERT INTO `sys_log` VALUES ('1118868454951202817', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:26:42');
INSERT INTO `sys_log` VALUES ('1118870695917391873', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:35:36');
INSERT INTO `sys_log` VALUES ('1118871703661842433', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:39:36');
INSERT INTO `sys_log` VALUES ('1118872055488450561', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:41:00');
INSERT INTO `sys_log` VALUES ('1118872115475386369', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:41:15');
INSERT INTO `sys_log` VALUES ('1118872891102859265', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:44:20');
INSERT INTO `sys_log` VALUES ('1118872901940940802', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:44:22');
INSERT INTO `sys_log` VALUES ('1118872906055553026', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:44:23');
INSERT INTO `sys_log` VALUES ('1118873039681884161', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:44:55');
INSERT INTO `sys_log` VALUES ('1118873059101511682', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:45:00');
INSERT INTO `sys_log` VALUES ('1118873341122318337', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:46:07');
INSERT INTO `sys_log` VALUES ('1118873580822597633', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:47:04');
INSERT INTO `sys_log` VALUES ('1118873768291209218', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:47:49');
INSERT INTO `sys_log` VALUES ('1118873925678272513', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:48:26');
INSERT INTO `sys_log` VALUES ('1118874336711675905', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 21:50:04');
INSERT INTO `sys_log` VALUES ('1118874337210798081', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 21:50:04');
INSERT INTO `sys_log` VALUES ('1118874360606625794', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 21:50:10');
INSERT INTO `sys_log` VALUES ('1118874464428232705', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:50:35');
INSERT INTO `sys_log` VALUES ('1118874479712276481', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 21:50:38');
INSERT INTO `sys_log` VALUES ('1118874488218324994', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 21:50:40');
INSERT INTO `sys_log` VALUES ('1118874909125120001', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:52:21');
INSERT INTO `sys_log` VALUES ('1118875269436805122', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 21:53:47');
INSERT INTO `sys_log` VALUES ('1118875275648569346', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 21:53:48');
INSERT INTO `sys_log` VALUES ('1118875394758414338', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 21:54:16');
INSERT INTO `sys_log` VALUES ('1118875400089374722', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 21:54:18');
INSERT INTO `sys_log` VALUES ('1118875824976564225', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:55:59');
INSERT INTO `sys_log` VALUES ('1118875826129997825', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 21:55:59');
INSERT INTO `sys_log` VALUES ('1118875826826252290', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 21:55:59');
INSERT INTO `sys_log` VALUES ('1118875826780114946', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 21:55:59');
INSERT INTO `sys_log` VALUES ('1118875826872389633', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 21:55:59');
INSERT INTO `sys_log` VALUES ('1118875878743347202', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 21:56:12');
INSERT INTO `sys_log` VALUES ('1118875902093037570', 'admin', '111111', '127.0.0.1', '1', '/app/apartment/member/add', '[{\"aparId\":\"1118863334049951745\",\"uid\":\"1118813844702027777\"}]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.add()', '添加成员', '2019-04-18 21:56:17');
INSERT INTO `sys_log` VALUES ('1118875902801874945', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:56:18');
INSERT INTO `sys_log` VALUES ('1118876312937697282', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 21:57:55');
INSERT INTO `sys_log` VALUES ('1118878314241486849', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 22:05:52');
INSERT INTO `sys_log` VALUES ('1118878329974321153', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/remove/1118875900515979266', '[\"1118875900515979266\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.remove()', '删除成员', '2019-04-18 22:05:56');
INSERT INTO `sys_log` VALUES ('1118878426053242882', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 22:06:19');
INSERT INTO `sys_log` VALUES ('1118878433636544514', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 22:06:21');
INSERT INTO `sys_log` VALUES ('1118878441932877826', 'admin', '111111', '127.0.0.1', '1', '/app/apartment/member/add', '[{\"aparId\":\"1118863334049951745\",\"uid\":\"1118813844702027777\"}]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.add()', '添加成员', '2019-04-18 22:06:23');
INSERT INTO `sys_log` VALUES ('1118878442343919617', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 22:06:23');
INSERT INTO `sys_log` VALUES ('1118878505380114434', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 22:06:38');
INSERT INTO `sys_log` VALUES ('1118900152753487873', '游客', '0', '127.0.0.1', '1', '/app/apartment/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.list()', '获取部门列表', '2019-04-18 23:32:39');
INSERT INTO `sys_log` VALUES ('1118900210009931778', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:32:53');
INSERT INTO `sys_log` VALUES ('1118900306562809858', '游客', '0', '127.0.0.1', '1', '/app/apartment/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.list()', '获取部门列表', '2019-04-18 23:33:16');
INSERT INTO `sys_log` VALUES ('1118900389882658817', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 23:33:36');
INSERT INTO `sys_log` VALUES ('1118900394454450178', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 23:33:37');
INSERT INTO `sys_log` VALUES ('1118900401282777089', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/abcdefg', '[\"abcdefg\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 23:33:38');
INSERT INTO `sys_log` VALUES ('1118900800119144450', '游客', '0', '127.0.0.1', '1', '/app/apartment/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.list()', '获取部门列表', '2019-04-18 23:35:14');
INSERT INTO `sys_log` VALUES ('1118900816065888258', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:35:17');
INSERT INTO `sys_log` VALUES ('1118900939277762562', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:35:47');
INSERT INTO `sys_log` VALUES ('1118901271500193793', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:06');
INSERT INTO `sys_log` VALUES ('1118901306556186626', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:14');
INSERT INTO `sys_log` VALUES ('1118901314504392705', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:16');
INSERT INTO `sys_log` VALUES ('1118901317427822593', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:17');
INSERT INTO `sys_log` VALUES ('1118901320938455042', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:18');
INSERT INTO `sys_log` VALUES ('1118901331784925185', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:20');
INSERT INTO `sys_log` VALUES ('1118901338952990722', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:22');
INSERT INTO `sys_log` VALUES ('1118901340098035714', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:22');
INSERT INTO `sys_log` VALUES ('1118901341004005378', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:23');
INSERT INTO `sys_log` VALUES ('1118901342178410498', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:23');
INSERT INTO `sys_log` VALUES ('1118901343210209281', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:23');
INSERT INTO `sys_log` VALUES ('1118901344183287810', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:23');
INSERT INTO `sys_log` VALUES ('1118901349321310209', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:25');
INSERT INTO `sys_log` VALUES ('1118901352680947714', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:25');
INSERT INTO `sys_log` VALUES ('1118901353763078146', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:26');
INSERT INTO `sys_log` VALUES ('1118901355000397825', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:26');
INSERT INTO `sys_log` VALUES ('1118901356904611841', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:26');
INSERT INTO `sys_log` VALUES ('1118901357386956802', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:26');
INSERT INTO `sys_log` VALUES ('1118901357521174530', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:26');
INSERT INTO `sys_log` VALUES ('1118901358313897986', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:27');
INSERT INTO `sys_log` VALUES ('1118901358313897987', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:27');
INSERT INTO `sys_log` VALUES ('1118901358435532802', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:37:27');
INSERT INTO `sys_log` VALUES ('1118902137607192578', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:40:32');
INSERT INTO `sys_log` VALUES ('1118902216229421057', '游客', '0', '127.0.0.1', '1', '/app/apartment/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.list()', '获取部门列表', '2019-04-18 23:40:51');
INSERT INTO `sys_log` VALUES ('1118902447964717058', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:41:46');
INSERT INTO `sys_log` VALUES ('1118902484123811842', '游客', '0', '127.0.0.1', '1', '/app/apartment/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.list()', '获取部门列表', '2019-04-18 23:41:55');
INSERT INTO `sys_log` VALUES ('1118902500540317697', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 23:41:59');
INSERT INTO `sys_log` VALUES ('1118902522472333314', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:42:04');
INSERT INTO `sys_log` VALUES ('1118902539673174017', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:42:08');
INSERT INTO `sys_log` VALUES ('1118902542982479874', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:42:09');
INSERT INTO `sys_log` VALUES ('1118902545121574913', '游客', '0', '127.0.0.1', '1', '/app/student/alllist', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.allList()', '获取学生列表', '2019-04-18 23:42:10');
INSERT INTO `sys_log` VALUES ('1118902565547835393', '游客', '0', '127.0.0.1', '1', '/app/apartment/member/list/1118863334049951745', '[\"1118863334049951745\"]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentMemberController.list()', '获取部门成员列表', '2019-04-18 23:42:14');
INSERT INTO `sys_log` VALUES ('1118902862957543426', '游客', '0', '127.0.0.1', '1', '/app/apartment/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.list()', '获取部门列表', '2019-04-18 23:43:25');
INSERT INTO `sys_log` VALUES ('1118902877792796673', '游客', '0', '127.0.0.1', '1', '/app/student/listExAdmin', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.listExAdmin()', '获取学生列表', '2019-04-18 23:43:29');
INSERT INTO `sys_log` VALUES ('1118908519018430466', '游客', '0', '127.0.0.1', '1', '/app/student/listExAdmin', '[]', 'POST', 'cn.licoy.wdog.core.controller.app.StudentController.listExAdmin()', '获取学生列表', '2019-04-19 00:05:54');
INSERT INTO `sys_log` VALUES ('1118908601465864193', '游客', '0', '127.0.0.1', '1', '/app/apartment/list', '[{\"asc\":false,\"page\":1,\"pageSize\":10}]', 'POST', 'cn.licoy.wdog.core.controller.app.ApartmentController.list()', '获取部门列表', '2019-04-19 00:06:14');

-- ----------------------------
-- Table structure for `sys_resource`
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `parent_id` varchar(30) DEFAULT NULL,
  `type` int(1) NOT NULL DEFAULT '0',
  `url` varchar(100) DEFAULT NULL,
  `permission` varchar(50) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `verification` tinyint(1) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('1001315563194589185', '首页', '987977834901315586', '0', '/home/index', 'home_index', '#19BE6B', '', '0', '0', '2018-05-29 12:13:28');
INSERT INTO `sys_resource` VALUES ('1091630776044265473', '活动管理', null, '0', '/activity', 'activity', '#FFB13C', '', '0', '0', '2019-02-02 17:33:53');
INSERT INTO `sys_resource` VALUES ('1091631854995415042', '数据监控', null, '0', '/statistics', 'statistics', '#0D94AA', '', '0', '0', '2019-02-02 17:38:11');
INSERT INTO `sys_resource` VALUES ('1091632587094401025', '现场签到', '1091630776044265473', '0', '/activity/checkin', 'activity:checkin', '#F16B62', '', '3', '0', '2019-02-02 17:41:05');
INSERT INTO `sys_resource` VALUES ('1105469852140699649', '活动创建', '1105470394506149890', '0', '/activity/add', 'activity:add', '#19BE6B', '', '1', '0', '2019-03-12 22:05:26');
INSERT INTO `sys_resource` VALUES ('1105470394506149890', '活动管理', '1091630776044265473', '0', '/activity/manage', 'activity:list', '#19BE6B', '', '0', '0', '2019-03-12 22:07:35');
INSERT INTO `sys_resource` VALUES ('1105470602610737154', '活动编辑', '1105470394506149890', '1', '/activity/update', 'activity:update', '#19BE6B', '', '2', '0', '2019-03-12 22:08:25');
INSERT INTO `sys_resource` VALUES ('1105471123828506625', '回收站', '1105470394506149890', '0', '/activity/cancel', 'activity:list', '#19BE6B', '', '7', '0', '2019-03-12 22:10:29');
INSERT INTO `sys_resource` VALUES ('1106903649885409281', '字典定义', '987981277195968513', '0', '/system/dictionary', 'system:dictionary', '#0D9B53', '', '0', '1', '2019-03-16 21:02:50');
INSERT INTO `sys_resource` VALUES ('1106903996838236162', '字典添加', '1106903649885409281', '1', '/system/dictionary/add', 'system:dictionary:add', '#19BE6B', '', '0', '1', '2019-03-16 21:04:13');
INSERT INTO `sys_resource` VALUES ('1106904195421753346', '字典更新', '1106903649885409281', '1', '/system/dictionary/update', 'system:dictionary:update', '#19BE6B', '', '0', '1', '2019-03-16 21:05:00');
INSERT INTO `sys_resource` VALUES ('1106904348371243009', '字典删除', '1106903649885409281', '1', '/system/dictionary/remove', 'system:dictionary:remove', '#19BE6B', '', '0', '1', '2019-03-16 21:05:37');
INSERT INTO `sys_resource` VALUES ('1106904696053878786', '字典列表', '1106903649885409281', '1', '/system/dictionary/list', 'system:dictionary:list', '#19BE6B', '', '0', '1', '2019-03-16 21:06:59');
INSERT INTO `sys_resource` VALUES ('1107177955806736385', '学生信息管理', null, '0', '/student', 'student', '#19BE6B', '', '0', '1', '2019-03-17 15:12:50');
INSERT INTO `sys_resource` VALUES ('1107324513160327169', '分组添加', '1111834453598035970', '1', '/student/group/add', 'student:group:add', '#9B1DEA', '', '0', '1', '2019-03-18 00:55:12');
INSERT INTO `sys_resource` VALUES ('1107324693469261826', '分组更新', '1111834453598035970', '1', '/student/group/update', 'student:group:update', '#19BE6B', '', '0', '1', '2019-03-18 00:55:55');
INSERT INTO `sys_resource` VALUES ('1107324821777215490', '分组移除', '1111834453598035970', '1', '/student/group/remove', 'student:group:remove', '#9B1DEA', '', '0', '1', '2019-03-18 00:56:25');
INSERT INTO `sys_resource` VALUES ('1107324948407447553', '分组列表', '1111834453598035970', '0', '/student/group/list', 'student:group:list', '#9B1DEA', '', '0', '1', '2019-03-18 00:56:55');
INSERT INTO `sys_resource` VALUES ('1111336861244088322', '部门管理', null, '0', '/apartment', 'apartment', '#19BE6B', '', '0', '1', '2019-03-29 02:38:50');
INSERT INTO `sys_resource` VALUES ('1111337537055514625', '成员管理', '1111336861244088322', '0', '/apartment/member', 'apartment:member', '#19BE6B', '', '0', '1', '2019-03-29 02:41:31');
INSERT INTO `sys_resource` VALUES ('1111337746099625986', '分组管理', '1111336861244088322', '0', '/apartment/group', 'apartment:group', '#19BE6B', '', '0', '1', '2019-03-29 02:42:21');
INSERT INTO `sys_resource` VALUES ('1111338419587407874', '部门管理', '1111336861244088322', '0', '/apartment/manage', 'apartment:manage', '#19BE6B', '', '0', '1', '2019-03-29 02:45:02');
INSERT INTO `sys_resource` VALUES ('1111338598487056386', '成员列表', '1111337537055514625', '0', '/apartment/member/list', 'apartment:member:llist', '#19BE6B', '', '0', '1', '2019-03-29 02:45:44');
INSERT INTO `sys_resource` VALUES ('1111338802296676353', '成员添加', '1111337537055514625', '1', '/apartment/member/add', 'apartment:member:add', '#19BE6B', '', '0', '1', '2019-03-29 02:46:33');
INSERT INTO `sys_resource` VALUES ('1111338950804398081', '成员修改', '1111337537055514625', '0', '/apartment/member/update', 'apartment:member:update', '#19BE6B', '', '0', '1', '2019-03-29 02:47:08');
INSERT INTO `sys_resource` VALUES ('1111339081566019585', '成员移除', '1111337537055514625', '0', '/apartment/member/remove', 'apartment:member:remove', '#19BE6B', '', '0', '1', '2019-03-29 02:47:39');
INSERT INTO `sys_resource` VALUES ('1111834453598035970', '分组管理', '1107177955806736385', '0', '/student/group', 'student:group', '#19BE6B', '', '0', '1', '2019-03-30 11:36:05');
INSERT INTO `sys_resource` VALUES ('1111835375434752002', '学生管理', '1107177955806736385', '0', '/student/manage', 'student:manage', '#19BE6B', '', '0', '1', '2019-03-30 11:39:45');
INSERT INTO `sys_resource` VALUES ('1111835523866976258', '学生认证', '1107177955806736385', '0', '/student/auth', 'student:auth', '#19BE6B', '', '0', '1', '2019-03-30 11:40:20');
INSERT INTO `sys_resource` VALUES ('1111879265726521346', '学分管理', '1091630776044265473', '0', '/activity/score', 'activity:score', '#19BE6B', '', '0', '0', '2019-03-30 14:34:09');
INSERT INTO `sys_resource` VALUES ('1114943091577479170', '报名管理', '1091630776044265473', '0', '/activity/signup', 'activity:signup', '#19BE6B', '', '2', '0', '2019-04-08 01:28:42');
INSERT INTO `sys_resource` VALUES ('1116974124623839233', '部门主页', '1111336861244088322', '0', '/apartment/index', 'apartment:index', '#19BE6B', '', '0', '1', '2019-04-13 15:59:18');
INSERT INTO `sys_resource` VALUES ('1118789543013703681', '客户端', null, '0', '/c', 'client', '#19BE6B', '', '0', '1', '2019-04-18 16:13:08');
INSERT INTO `sys_resource` VALUES ('1118789755245486081', '个人主页', '1118789543013703681', '0', '/c/my', 'client:my', '#19BE6B', '', '0', '1', '2019-04-18 16:13:58');
INSERT INTO `sys_resource` VALUES ('1118789938041643010', '我的学分', '1118789543013703681', '0', '/c/credits', 'client:credits', '#19BE6B', '', '0', '1', '2019-04-18 16:14:42');
INSERT INTO `sys_resource` VALUES ('1118790177607704577', '我的活动', '1118789543013703681', '0', '/c/activities', 'client:activities', '#19BE6B', '', '0', '1', '2019-04-18 16:15:39');
INSERT INTO `sys_resource` VALUES ('1118790478062477314', '首页', '1118789543013703681', '0', '/c/index', 'home_index', '#19BE6B', '', '0', '1', '2019-04-18 16:16:51');
INSERT INTO `sys_resource` VALUES ('1118793770507231233', '活动详情', '1118789543013703681', '0', '/c/detail', 'client:detail', '#19BE6B', '', '0', '1', '2019-04-18 16:29:56');
INSERT INTO `sys_resource` VALUES ('987974185122832386', '角色添加', '987981659066376194', '1', '/system/role/add', 'system:role:add', '#19BE6B', '', '0', '1', '2018-04-22 16:39:36');
INSERT INTO `sys_resource` VALUES ('987977834901315586', '首页', null, '0', '/home', 'home', '#19BE6B', 'ios-home-outline', '-1', '1', '2018-04-22 16:54:06');
INSERT INTO `sys_resource` VALUES ('987980763175624706', '角色更新', '987981659066376194', '1', '/system/role/update', 'system:role:update', '#19BE6B', '', '0', '1', '2018-04-22 17:05:44');
INSERT INTO `sys_resource` VALUES ('987981277195968513', '系统设置', null, '0', '/system', 'system', '#19BE6B', 'ios-gear', '0', '1', '2018-04-22 17:07:46');
INSERT INTO `sys_resource` VALUES ('987981486382686210', '用户管理', '987981277195968513', '0', '/system/user', 'system:user', '#19BE6B', 'person', '0', '1', '2018-04-22 17:08:36');
INSERT INTO `sys_resource` VALUES ('987981659066376194', '角色管理', '987981277195968513', '0', '/system/role', 'system:role', '#19BE6B', 'compose', '0', '1', '2018-04-22 17:09:17');
INSERT INTO `sys_resource` VALUES ('987982017863917570', '资源管理', '987981277195968513', '0', '/system/resource', 'system:resource', '#19BE6B', 'lock-combination', '0', '1', '2018-04-22 17:10:43');
INSERT INTO `sys_resource` VALUES ('987985589477351426', '资源添加', '987982017863917570', '1', '/system/resource/add', 'system:resource:add', '#19BE6B', '', '0', '1', '2018-04-22 17:24:55');
INSERT INTO `sys_resource` VALUES ('987985700785790978', '资源更新', '987982017863917570', '1', '/system/resource/update', 'system:resource:update', '#19BE6B', '', '0', '1', '2018-04-22 17:25:21');
INSERT INTO `sys_resource` VALUES ('987985782880903170', '资源删除', '987982017863917570', '1', '/system/resource/remove', 'system:resource:remove', '#EA1A1A', '', '0', '1', '2018-04-22 17:25:41');
INSERT INTO `sys_resource` VALUES ('987985944781037570', '角色删除', '987981659066376194', '1', '/system/role/remove', 'system:role:remove', '#ED3F14', '', '0', '1', '2018-04-22 17:26:19');
INSERT INTO `sys_resource` VALUES ('987986018126831617', '用户添加', '987981486382686210', '1', '/system/user/add', 'system:user:add', '#19BE6B', '', '0', '1', '2018-04-22 17:26:37');
INSERT INTO `sys_resource` VALUES ('987986318946508801', '用户更新', '987981486382686210', '1', '/system/user/update', 'system:user:update', '#19BE6B', '', '0', '1', '2018-04-22 17:27:48');
INSERT INTO `sys_resource` VALUES ('987986542024761345', '用户删除', '987981486382686210', '1', '/system/user/remove', 'system:user:remove', '#ED3F14', '', '0', '1', '2018-04-22 17:28:42');
INSERT INTO `sys_resource` VALUES ('988254531404496898', '资源列表', '987982017863917570', '1', '/system/resource/list', 'system:resource:list', '#19BE6B', '', '0', '1', '2018-04-23 11:13:35');
INSERT INTO `sys_resource` VALUES ('988602498871316482', '角色列表', '987981659066376194', '1', '/system/role/list', 'system:role:list', '#19BE6B', '', '0', '1', '2018-04-24 10:16:17');
INSERT INTO `sys_resource` VALUES ('989417091599802370', '用户列表', '987981486382686210', '1', '/system/user/list', 'system:user:list', '#19BE6B', '', '0', '1', '2018-04-26 16:13:12');
INSERT INTO `sys_resource` VALUES ('989417919966453762', '密码重置', '987981486382686210', '1', '/system/user/resetPassword', 'system:user:resetPassword', '#19BE6B', '', '0', '1', '2018-04-26 16:16:29');
INSERT INTO `sys_resource` VALUES ('989418114355666946', '锁定用户', '987981486382686210', '1', '/system/user/lock', 'system:user:lock', '#FF9900', '', '0', '1', '2018-04-26 16:17:16');
INSERT INTO `sys_resource` VALUES ('989418202087923713', '解锁用户', '987981486382686210', '1', '/system/user/unlock', 'system:user:unlock', '#FF9900', '', '0', '1', '2018-04-26 16:17:37');
INSERT INTO `sys_resource` VALUES ('990058578210021378', '系统日志', '987981277195968513', '0', '/system/log', 'system:log', '#19BE6B', 'leaf', '0', '1', '2018-04-28 10:42:14');
INSERT INTO `sys_resource` VALUES ('990058692110540801', '日志查看', '990058578210021378', '1', '/system/log/list', 'system:log:list', '#19BE6B', '', '0', '1', '2018-04-28 10:42:41');
INSERT INTO `sys_resource` VALUES ('990058791586848769', '日志删除', '990058578210021378', '1', '/system/log/remove', 'system:log:remove', '#ED3F14', '', '0', '1', '2018-04-28 10:43:04');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(30) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1111314161494679553', '部门管理员');
INSERT INTO `sys_role` VALUES ('988623554205990914', '管理员');
INSERT INTO `sys_role` VALUES ('989416986389880834', '演示用户组');

-- ----------------------------
-- Table structure for `sys_role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `id` varchar(30) NOT NULL,
  `rid` varchar(30) NOT NULL,
  `pid` varchar(30) NOT NULL,
  PRIMARY KEY (`id`,`rid`,`pid`),
  KEY `rid` (`rid`),
  KEY `pid` (`pid`),
  CONSTRAINT `sys_role_resource_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sys_role_resource_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `sys_resource` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
INSERT INTO `sys_role_resource` VALUES ('1111314161574371330', '1111314161494679553', '987977834901315586');
INSERT INTO `sys_role_resource` VALUES ('1111314161641480194', '1111314161494679553', '1001315563194589185');
INSERT INTO `sys_role_resource` VALUES ('1111314161888944129', '1111314161494679553', '1091630776044265473');
INSERT INTO `sys_role_resource` VALUES ('1111314162086076417', '1111314161494679553', '1105470394506149890');
INSERT INTO `sys_role_resource` VALUES ('1111314162341928961', '1111314161494679553', '1105469852140699649');
INSERT INTO `sys_role_resource` VALUES ('1111314162476146689', '1111314161494679553', '1105470602610737154');
INSERT INTO `sys_role_resource` VALUES ('1111314162669084673', '1111314161494679553', '1105471123828506625');
INSERT INTO `sys_role_resource` VALUES ('1111314162815885313', '1111314161494679553', '1091632587094401025');
INSERT INTO `sys_role_resource` VALUES ('1111314162916548610', '1111314161494679553', '1091631854995415042');
INSERT INTO `sys_role_resource` VALUES ('1111314162945908738', '1111314161494679553', '1107177955806736385');
INSERT INTO `sys_role_resource` VALUES ('1111314162975268865', '1111314161494679553', '1107324513160327169');
INSERT INTO `sys_role_resource` VALUES ('1111314163029794817', '1111314161494679553', '1107324693469261826');
INSERT INTO `sys_role_resource` VALUES ('1111314163038183426', '1111314161494679553', '1107324821777215490');
INSERT INTO `sys_role_resource` VALUES ('1111314163080126465', '1111314161494679553', '1107324948407447553');
INSERT INTO `sys_role_resource` VALUES ('1118812184005107714', '988623554205990914', '987977834901315586');
INSERT INTO `sys_role_resource` VALUES ('1118812184370012162', '988623554205990914', '1001315563194589185');
INSERT INTO `sys_role_resource` VALUES ('1118812184638447618', '988623554205990914', '1091630776044265473');
INSERT INTO `sys_role_resource` VALUES ('1118812184831385602', '988623554205990914', '1105470394506149890');
INSERT INTO `sys_role_resource` VALUES ('1118812184848162817', '988623554205990914', '1105469852140699649');
INSERT INTO `sys_role_resource` VALUES ('1118812185091432449', '988623554205990914', '1105470602610737154');
INSERT INTO `sys_role_resource` VALUES ('1118812185150152706', '988623554205990914', '1105471123828506625');
INSERT INTO `sys_role_resource` VALUES ('1118812185162735618', '988623554205990914', '1111879265726521346');
INSERT INTO `sys_role_resource` VALUES ('1118812185246621698', '988623554205990914', '1114943091577479170');
INSERT INTO `sys_role_resource` VALUES ('1118812185317924866', '988623554205990914', '1091632587094401025');
INSERT INTO `sys_role_resource` VALUES ('1118812185326313473', '988623554205990914', '1091631854995415042');
INSERT INTO `sys_role_resource` VALUES ('1118812185343090689', '988623554205990914', '1107177955806736385');
INSERT INTO `sys_role_resource` VALUES ('1118812185401810946', '988623554205990914', '1111834453598035970');
INSERT INTO `sys_role_resource` VALUES ('1118812185431171073', '988623554205990914', '1107324513160327169');
INSERT INTO `sys_role_resource` VALUES ('1118812185460531201', '988623554205990914', '1107324693469261826');
INSERT INTO `sys_role_resource` VALUES ('1118812185481502721', '988623554205990914', '1107324821777215490');
INSERT INTO `sys_role_resource` VALUES ('1118812185678635010', '988623554205990914', '1107324948407447553');
INSERT INTO `sys_role_resource` VALUES ('1118812185800269826', '988623554205990914', '1111835375434752002');
INSERT INTO `sys_role_resource` VALUES ('1118812185875767297', '988623554205990914', '1111835523866976258');
INSERT INTO `sys_role_resource` VALUES ('1118812185875767298', '988623554205990914', '1111336861244088322');
INSERT INTO `sys_role_resource` VALUES ('1118812185909321729', '988623554205990914', '1111337537055514625');
INSERT INTO `sys_role_resource` VALUES ('1118812185921904641', '988623554205990914', '1111338598487056386');
INSERT INTO `sys_role_resource` VALUES ('1118812186005790722', '988623554205990914', '1111338802296676353');
INSERT INTO `sys_role_resource` VALUES ('1118812186047733761', '988623554205990914', '1111338950804398081');
INSERT INTO `sys_role_resource` VALUES ('1118812186047733762', '988623554205990914', '1111339081566019585');
INSERT INTO `sys_role_resource` VALUES ('1118812186257448961', '988623554205990914', '1111337746099625986');
INSERT INTO `sys_role_resource` VALUES ('1118812186270031873', '988623554205990914', '1111338419587407874');
INSERT INTO `sys_role_resource` VALUES ('1118812186291003393', '988623554205990914', '1116974124623839233');
INSERT INTO `sys_role_resource` VALUES ('1118812186311974913', '988623554205990914', '1118789543013703681');
INSERT INTO `sys_role_resource` VALUES ('1118812186400055298', '988623554205990914', '1118789755245486081');
INSERT INTO `sys_role_resource` VALUES ('1118812186555244545', '988623554205990914', '1118789938041643010');
INSERT INTO `sys_role_resource` VALUES ('1118812186710433793', '988623554205990914', '1118790177607704577');
INSERT INTO `sys_role_resource` VALUES ('1118812186752376834', '988623554205990914', '1118790478062477314');
INSERT INTO `sys_role_resource` VALUES ('1118812186928537602', '988623554205990914', '1118793770507231233');
INSERT INTO `sys_role_resource` VALUES ('1118812186987257858', '988623554205990914', '987981277195968513');
INSERT INTO `sys_role_resource` VALUES ('1118812187201167361', '988623554205990914', '1106903649885409281');
INSERT INTO `sys_role_resource` VALUES ('1118812187268276225', '988623554205990914', '1106903996838236162');
INSERT INTO `sys_role_resource` VALUES ('1118812187356356609', '988623554205990914', '1106904195421753346');
INSERT INTO `sys_role_resource` VALUES ('1118812187645763586', '988623554205990914', '1106904348371243009');
INSERT INTO `sys_role_resource` VALUES ('1118812187717066754', '988623554205990914', '1106904696053878786');
INSERT INTO `sys_role_resource` VALUES ('1118812187738038273', '988623554205990914', '987981486382686210');
INSERT INTO `sys_role_resource` VALUES ('1118812187754815489', '988623554205990914', '987986018126831617');
INSERT INTO `sys_role_resource` VALUES ('1118812187763204097', '988623554205990914', '987986318946508801');
INSERT INTO `sys_role_resource` VALUES ('1118812187779981314', '988623554205990914', '987986542024761345');
INSERT INTO `sys_role_resource` VALUES ('1118812187784175618', '988623554205990914', '989417091599802370');
INSERT INTO `sys_role_resource` VALUES ('1118812187951947778', '988623554205990914', '989417919966453762');
INSERT INTO `sys_role_resource` VALUES ('1118812188102942722', '988623554205990914', '989418114355666946');
INSERT INTO `sys_role_resource` VALUES ('1118812188203606017', '988623554205990914', '989418202087923713');
INSERT INTO `sys_role_resource` VALUES ('1118812188249743361', '988623554205990914', '987981659066376194');
INSERT INTO `sys_role_resource` VALUES ('1118812188262326274', '988623554205990914', '987974185122832386');
INSERT INTO `sys_role_resource` VALUES ('1118812188274909186', '988623554205990914', '987980763175624706');
INSERT INTO `sys_role_resource` VALUES ('1118812188291686402', '988623554205990914', '987985944781037570');
INSERT INTO `sys_role_resource` VALUES ('1118812188509790209', '988623554205990914', '988602498871316482');
INSERT INTO `sys_role_resource` VALUES ('1118812188534956034', '988623554205990914', '987982017863917570');
INSERT INTO `sys_role_resource` VALUES ('1118812188572704770', '988623554205990914', '987985589477351426');
INSERT INTO `sys_role_resource` VALUES ('1118812188602064897', '988623554205990914', '987985700785790978');
INSERT INTO `sys_role_resource` VALUES ('1118812188652396546', '988623554205990914', '987985782880903170');
INSERT INTO `sys_role_resource` VALUES ('1118812188732088321', '988623554205990914', '988254531404496898');
INSERT INTO `sys_role_resource` VALUES ('1118812188769837057', '988623554205990914', '990058578210021378');
INSERT INTO `sys_role_resource` VALUES ('1118812188811780097', '988623554205990914', '990058692110540801');
INSERT INTO `sys_role_resource` VALUES ('1118812188828557314', '988623554205990914', '990058791586848769');
INSERT INTO `sys_role_resource` VALUES ('1118793965408149505', '989416986389880834', '1118789543013703681');
INSERT INTO `sys_role_resource` VALUES ('1118793965643030529', '989416986389880834', '1118789755245486081');
INSERT INTO `sys_role_resource` VALUES ('1118793965689167873', '989416986389880834', '1118789938041643010');
INSERT INTO `sys_role_resource` VALUES ('1118793965743693825', '989416986389880834', '1118790177607704577');
INSERT INTO `sys_role_resource` VALUES ('1118793965814996993', '989416986389880834', '1118790478062477314');
INSERT INTO `sys_role_resource` VALUES ('1118793965873717249', '989416986389880834', '1118793770507231233');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `status` int(1) NOT NULL COMMENT '1',
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`,`username`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1091628370111799298', 'chiu', '633c845cdc95a19b6d7ffcbfa9b67e45', '18', '1', '2019-02-02 17:24:20');
INSERT INTO `sys_user` VALUES ('111111', 'admin', 'b9d11b3be25f5a1a7dc8ca04cd310b28', '20', '1', '2018-04-18 15:01:04');
INSERT INTO `sys_user` VALUES ('2', 'user', '0b1010c7ce259a10d113369c2ac59d11', '20', '1', '2018-04-18 15:01:08');

-- ----------------------------
-- Table structure for `sys_user_auth`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_auth`;
CREATE TABLE `sys_user_auth` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `stu_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `real_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `stu_num` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `dict_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `period` int(5) NOT NULL,
  `what_class` int(5) NOT NULL,
  `status` int(5) NOT NULL COMMENT '认证状态(0 = 认证中; 1 = 已认证; 2 = 不通过; -1 = 已删除)',
  `create_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_user` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`uid`,`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_user_auth
-- ----------------------------
INSERT INTO `sys_user_auth` VALUES ('777', '1091628370111799298', '1118867769153138690', '刘七七', '1509876543177', '1106975840870133761', '2019', '1', '1', '', '0000-00-00 00:00:00', null, null);

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(30) NOT NULL,
  `uid` varchar(30) NOT NULL,
  `rid` varchar(30) NOT NULL,
  PRIMARY KEY (`id`,`uid`,`rid`),
  KEY `user_role_ibfk_2` (`uid`),
  KEY `user_role_ibfk_1` (`rid`),
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1118791756998041602', '1091628370111799298', '989416986389880834');
INSERT INTO `sys_user_role` VALUES ('1', '111111', '988623554205990914');
INSERT INTO `sys_user_role` VALUES ('989753486051151873', '2', '989416986389880834');
