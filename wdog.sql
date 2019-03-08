/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : wdog

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-03-09 01:14:41
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
  `pictureurl` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '配图文件路径',
  `signup_time` datetime NOT NULL COMMENT '报名起始时间',
  `deadline_time` datetime NOT NULL COMMENT '报名截止时间',
  `start_time` datetime NOT NULL COMMENT '活动开始时间',
  `end_time` datetime NOT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  `organizerId` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '主办方',
  `groupId` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '分组限制',
  `limit_quota` smallint(6) NOT NULL DEFAULT '-1' COMMENT '活动名额\r\n，默认不限',
  `isblackList` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否黑名单限制(0=true;1=false)',
  `isreview` tinyint(1) NOT NULL COMMENT '是否人工审核(0=true;1=false)',
  `associationId` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `create_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `modify_time` datetime NOT NULL,
  `modify_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity
-- ----------------------------

-- ----------------------------
-- Table structure for `activity_form`
-- ----------------------------
DROP TABLE IF EXISTS `activity_form`;
CREATE TABLE `activity_form` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `activity_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '活动表外键',
  `form_entry_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '条目表外键',
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
-- Table structure for `activity_form_entry`
-- ----------------------------
DROP TABLE IF EXISTS `activity_form_entry`;
CREATE TABLE `activity_form_entry` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '类型',
  `default_value` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '默认值',
  `remark` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '注释',
  `allownull` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许空值(0=true;1=false)',
  `create_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `modify_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of activity_form_entry
-- ----------------------------

-- ----------------------------
-- Table structure for `activity_memberlist`
-- ----------------------------
DROP TABLE IF EXISTS `activity_memberlist`;
CREATE TABLE `activity_memberlist` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `aid` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `checkin` tinyint(3) NOT NULL COMMENT '签到管理',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity_memberlist
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
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `apart_admin` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `about` longtext COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `create_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `modify_time` datetime NOT NULL,
  `modify_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of apartment
-- ----------------------------

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
-- Table structure for `group`
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `dict_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '字典表代码，如学院、专业、年级、班级',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `create_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of group
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
  `award_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `award_num` int(11) NOT NULL,
  `award_score` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `notify_time` datetime NOT NULL,
  `notify_user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
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
  `profession` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `grade` int(5) NOT NULL,
  `stu_class` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `id` char(36) COLLATE utf8_bin NOT NULL,
  `dict_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `parent_id` char(36) COLLATE utf8_bin DEFAULT NULL,
  `dict_code` varchar(100) COLLATE utf8_bin NOT NULL,
  `dict_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `dict_value` text COLLATE utf8_bin,
  `sort` int(11) unsigned DEFAULT '0',
  `remark` text COLLATE utf8_bin,
  `create_time` datetime NOT NULL,
  `create_user` varchar(200) COLLATE utf8_bin NOT NULL,
  `modify_time` datetime NOT NULL,
  `modify_user` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------

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
INSERT INTO `sys_role_resource` VALUES ('1091634069294329857', '988623554205990914', '987977834901315586');
INSERT INTO `sys_role_resource` VALUES ('1091634069944446977', '988623554205990914', '1001315563194589185');
INSERT INTO `sys_role_resource` VALUES ('1091634072771407874', '988623554205990914', '987981277195968513');
INSERT INTO `sys_role_resource` VALUES ('1091634072867876865', '988623554205990914', '987981486382686210');
INSERT INTO `sys_role_resource` VALUES ('1091634073060814849', '988623554205990914', '987986018126831617');
INSERT INTO `sys_role_resource` VALUES ('1091634073115340802', '988623554205990914', '987986318946508801');
INSERT INTO `sys_role_resource` VALUES ('1091634073165672449', '988623554205990914', '987986542024761345');
INSERT INTO `sys_role_resource` VALUES ('1091634073274724353', '988623554205990914', '989417091599802370');
INSERT INTO `sys_role_resource` VALUES ('1091634073362804737', '988623554205990914', '989417919966453762');
INSERT INTO `sys_role_resource` VALUES ('1091634073362804738', '988623554205990914', '989418114355666946');
INSERT INTO `sys_role_resource` VALUES ('1091634073526382594', '988623554205990914', '989418202087923713');
INSERT INTO `sys_role_resource` VALUES ('1091634073677377537', '988623554205990914', '987981659066376194');
INSERT INTO `sys_role_resource` VALUES ('1091634073677377538', '988623554205990914', '987974185122832386');
INSERT INTO `sys_role_resource` VALUES ('1091634075153772545', '988623554205990914', '987980763175624706');
INSERT INTO `sys_role_resource` VALUES ('1091634075271213058', '988623554205990914', '987985944781037570');
INSERT INTO `sys_role_resource` VALUES ('1091634075405430786', '988623554205990914', '988602498871316482');
INSERT INTO `sys_role_resource` VALUES ('1091634075468345346', '988623554205990914', '987982017863917570');
INSERT INTO `sys_role_resource` VALUES ('1091634075535454210', '988623554205990914', '987985589477351426');
INSERT INTO `sys_role_resource` VALUES ('1091634075652894721', '988623554205990914', '987985700785790978');
INSERT INTO `sys_role_resource` VALUES ('1091634075803889665', '988623554205990914', '987985782880903170');
INSERT INTO `sys_role_resource` VALUES ('1091634075824861186', '988623554205990914', '988254531404496898');
INSERT INTO `sys_role_resource` VALUES ('1091634075963273217', '988623554205990914', '990058578210021378');
INSERT INTO `sys_role_resource` VALUES ('1091634075963273218', '988623554205990914', '990058692110540801');
INSERT INTO `sys_role_resource` VALUES ('1091634075963273219', '988623554205990914', '990058791586848769');
INSERT INTO `sys_role_resource` VALUES ('1091634076248485889', '988623554205990914', '1091630776044265473');
INSERT INTO `sys_role_resource` VALUES ('1091634076810522626', '988623554205990914', '1091632587094401025');
INSERT INTO `sys_role_resource` VALUES ('1091634076911185921', '988623554205990914', '1091631854995415042');
INSERT INTO `sys_role_resource` VALUES ('992330724542074882', '989416986389880834', '987977834901315586');
INSERT INTO `sys_role_resource` VALUES ('992330724638543874', '989416986389880834', '989417091599802370');
INSERT INTO `sys_role_resource` VALUES ('992330724735012866', '989416986389880834', '987974185122832386');
INSERT INTO `sys_role_resource` VALUES ('992330724844064769', '989416986389880834', '988602498871316482');
INSERT INTO `sys_role_resource` VALUES ('992330724940533762', '989416986389880834', '988254531404496898');
INSERT INTO `sys_role_resource` VALUES ('992330725057974274', '989416986389880834', '990058692110540801');

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
INSERT INTO `sys_user` VALUES ('1', 'admin', 'b9d11b3be25f5a1a7dc8ca04cd310b28', '20', '1', '2018-04-18 15:01:04');
INSERT INTO `sys_user` VALUES ('1091628370111799298', 'chiu', '633c845cdc95a19b6d7ffcbfa9b67e45', '18', '1', '2019-02-02 17:24:20');
INSERT INTO `sys_user` VALUES ('2', 'user', '0b1010c7ce259a10d113369c2ac59d11', '20', '1', '2018-04-18 15:01:08');

-- ----------------------------
-- Table structure for `sys_user_auth`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_auth`;
CREATE TABLE `sys_user_auth` (
  `id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `real_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `stu_num` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `profession` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `grade` int(5) NOT NULL,
  `stu_class` int(5) NOT NULL,
  `status` int(5) NOT NULL COMMENT '认证状态(0 = 认证中; 1 = 已认证; 2 = 不通过; -1 = 已删除)',
  PRIMARY KEY (`id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_user_auth
-- ----------------------------

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
INSERT INTO `sys_user_role` VALUES ('1', '1', '988623554205990914');
INSERT INTO `sys_user_role` VALUES ('1091750341403258882', '1091628370111799298', '988623554205990914');
INSERT INTO `sys_user_role` VALUES ('1091750341575225345', '1091628370111799298', '989416986389880834');
INSERT INTO `sys_user_role` VALUES ('989753486051151873', '2', '989416986389880834');
