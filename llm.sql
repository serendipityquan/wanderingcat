/*
 Navicat MySQL Data Transfer

 Source Server         : 1111
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 127.0.0.1:3306
 Source Schema         : llm

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 11/10/2021 21:22:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fa_admin
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin`;
CREATE TABLE `fa_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `logintime` int(10) NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录IP',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_admin
-- ----------------------------
INSERT INTO `fa_admin` VALUES (1, 'admin888', 'Admin', '0f9f0d1fa28b9cdb89679f6fd5778727', 'a8cf8b', '/assets/img/avatar.png', 'admin@admin.com', 0, 1633773479, '127.0.0.1', 1491635035, 1633773479, '78a92a6c-6488-402d-8788-2b8660201acf', 'normal');

-- ----------------------------
-- Table structure for fa_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin_log`;
CREATE TABLE `fa_admin_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '日志标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_admin_log
-- ----------------------------
INSERT INTO `fa_admin_log` VALUES (1, 1, 'admin888', '/abcd.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin888\",\"password\":\"***\",\"captcha\":\"rsp3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632935284);
INSERT INTO `fa_admin_log` VALUES (2, 1, 'admin888', '/abcd.php/addon/install', '插件管理', '{\"name\":\"command\",\"force\":\"0\",\"uid\":\"38706\",\"token\":\"***\",\"version\":\"1.0.6\",\"faversion\":\"1.2.1.20210730_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632935611);
INSERT INTO `fa_admin_log` VALUES (3, 1, 'admin888', '/abcd.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632937772);
INSERT INTO `fa_admin_log` VALUES (4, 1, 'admin888', '/abcd.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_mao_info\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632937781);
INSERT INTO `fa_admin_log` VALUES (5, 1, 'admin888', '/abcd.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_mao_info\",\"controller\":\"mao\\/Info\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"mao_jy,mao_sex\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632937864);
INSERT INTO `fa_admin_log` VALUES (6, 1, 'admin888', '/abcd.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_mao_info\",\"controller\":\"mao\\/Info\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"mao_jy,mao_sex\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632937865);
INSERT INTO `fa_admin_log` VALUES (7, 1, 'admin888', '/abcd.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"mao\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938028);
INSERT INTO `fa_admin_log` VALUES (8, 1, 'admin888', '/abcd.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"mao\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938044);
INSERT INTO `fa_admin_log` VALUES (9, 1, 'admin888', '/abcd.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"mao\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938081);
INSERT INTO `fa_admin_log` VALUES (10, 1, 'admin888', '/abcd.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"mao\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938082);
INSERT INTO `fa_admin_log` VALUES (11, 1, 'admin888', '/abcd.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938098);
INSERT INTO `fa_admin_log` VALUES (12, 1, 'admin888', '/abcd.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_mao_info\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938107);
INSERT INTO `fa_admin_log` VALUES (13, 1, 'admin888', '/abcd.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mao_info\",\"controller\":\"mao\\/Info\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"mao_pic,wx_pic\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938147);
INSERT INTO `fa_admin_log` VALUES (14, 1, 'admin888', '/abcd.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mao_info\",\"controller\":\"mao\\/Info\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"mao_pic,wx_pic\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938148);
INSERT INTO `fa_admin_log` VALUES (15, 1, 'admin888', '/abcd.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"mao\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938160);
INSERT INTO `fa_admin_log` VALUES (16, 1, 'admin888', '/abcd.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"mao\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938161);
INSERT INTO `fa_admin_log` VALUES (17, 1, 'admin888', '/abcd.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938168);
INSERT INTO `fa_admin_log` VALUES (18, 1, 'admin888', '/abcd.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938171);
INSERT INTO `fa_admin_log` VALUES (19, 1, 'admin888', '/abcd.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mao_info\",\"controller\":\"mao\\/Info\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"mao_pic,wx_pic\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938195);
INSERT INTO `fa_admin_log` VALUES (20, 1, 'admin888', '/abcd.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mao_info\",\"controller\":\"mao\\/Info\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"mao_pic,wx_pic\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938196);
INSERT INTO `fa_admin_log` VALUES (21, 1, 'admin888', '/abcd.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938208);
INSERT INTO `fa_admin_log` VALUES (22, 1, 'admin888', '/abcd.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938211);
INSERT INTO `fa_admin_log` VALUES (23, 1, 'admin888', '/abcd.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mao_info\",\"controller\":\"mao\\/Info\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"mao_jy,mao_sex\",\"imagefield\":\"mao_pic,wx_pic\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938247);
INSERT INTO `fa_admin_log` VALUES (24, 1, 'admin888', '/abcd.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mao_info\",\"controller\":\"mao\\/Info\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"mao_jy,mao_sex\",\"imagefield\":\"mao_pic,wx_pic\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938248);
INSERT INTO `fa_admin_log` VALUES (25, 1, 'admin888', '/abcd.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mao_info\",\"controller\":\"mao\\/Info\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"mao_jy,mao_sex\",\"imagefield\":\"mao_pic,wx_pic\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"city\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938325);
INSERT INTO `fa_admin_log` VALUES (26, 1, 'admin888', '/abcd.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mao_info\",\"controller\":\"mao\\/Info\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"mao_jy,mao_sex\",\"imagefield\":\"mao_pic,wx_pic\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"city\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938326);
INSERT INTO `fa_admin_log` VALUES (27, 1, 'admin888', '/abcd.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938342);
INSERT INTO `fa_admin_log` VALUES (28, 1, 'admin888', '/abcd.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938345);
INSERT INTO `fa_admin_log` VALUES (29, 1, 'admin888', '/abcd.php/mao/info/add?dialog=1', '猫', '{\"dialog\":\"1\",\"row\":{\"mao_pic\":\"\\/uploads\\/20210930\\/867b27dc2952457c728d13d7e74d6e42.png\",\"wx_pic\":\"\\/uploads\\/20210930\\/f5e6d96871b22ea9247994745c7a786f.png\",\"mao_name\":\"猫咪名称\",\"mao_age\":\"猫咪年龄\",\"mao_sex\":\"1\",\"mao_jy\":\"0\",\"mao_source\":\"猫咪来源\",\"mao_remark\":\"猫咪备注\",\"city\":\"安徽省\\/蚌埠市\\/禹会区\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938359);
INSERT INTO `fa_admin_log` VALUES (30, 1, 'admin888', '/abcd.php/mao/info/edit/ids/1?dialog=1', '猫', '{\"dialog\":\"1\",\"row\":{\"mao_pic\":\"\\/uploads\\/20210930\\/867b27dc2952457c728d13d7e74d6e42.png\",\"wx_pic\":\"\\/uploads\\/20210930\\/f5e6d96871b22ea9247994745c7a786f.png\",\"mao_name\":\"猫咪名称\",\"mao_age\":\"猫咪年龄\",\"mao_sex\":\"1\",\"mao_jy\":\"0\",\"mao_source\":\"猫咪来源\",\"mao_remark\":\"猫咪备注\",\"city\":\"安徽省\\/蚌埠市\\/禹会区\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632938772);
INSERT INTO `fa_admin_log` VALUES (31, 1, 'admin888', '/abcd.php/mao/info/edit/ids/1?dialog=1', '猫', '{\"dialog\":\"1\",\"row\":{\"mao_pic\":\"\\/uploads\\/20210930\\/867b27dc2952457c728d13d7e74d6e42.png\",\"wx_pic\":\"\\/uploads\\/20210930\\/f5e6d96871b22ea9247994745c7a786f.png\",\"mao_name\":\"猫咪名称\",\"mao_age\":\"猫咪年龄\",\"mao_sex\":\"1\",\"mao_jy\":\"0\",\"mao_source\":\"猫咪来源\",\"mao_remark\":\"猫咪备注\",\"city\":\"安徽省\\/蚌埠市\\/淮上区\",\"province_id\":\"340000\",\"city_id\":\"340300\",\"district_id\":\"340311\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632969962);
INSERT INTO `fa_admin_log` VALUES (32, 1, 'admin888', '/abcd.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{\"__token__\":\"***\",\"row\":{\"categorytype\":\"{&quot;default&quot;:&quot;默认&quot;,&quot;page&quot;:&quot;单页&quot;,&quot;article&quot;:&quot;文章&quot;,&quot;test&quot;:&quot;Test&quot;}\",\"configgroup\":\"{&quot;basic&quot;:&quot;基础配置&quot;,&quot;email&quot;:&quot;邮件配置&quot;,&quot;dictionary&quot;:&quot;字典配置&quot;,&quot;user&quot;:&quot;会员配置&quot;,&quot;mao&quot;:&quot;和猫住配置&quot;}\",\"attachmentcategory\":\"{&quot;category1&quot;:&quot;分类一&quot;,&quot;category2&quot;:&quot;分类二&quot;,&quot;custom&quot;:&quot;自定义&quot;}\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632970162);
INSERT INTO `fa_admin_log` VALUES (33, 1, 'admin888', '/abcd.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"logo\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632970198);
INSERT INTO `fa_admin_log` VALUES (34, 1, 'admin888', '/abcd.php/general.config/add', '常规管理 / 系统配置 / 添加', '{\"__token__\":\"***\",\"row\":{\"group\":\"mao\",\"type\":\"image\",\"name\":\"logo\",\"title\":\"和猫住logo\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"tip\":\"和猫住logo\",\"rule\":\"\",\"extend\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632970275);
INSERT INTO `fa_admin_log` VALUES (35, 1, 'admin888', '/abcd.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{\"__token__\":\"***\",\"row\":{\"logo\":\"\\/uploads\\/20210930\\/f5e6d96871b22ea9247994745c7a786f.png\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1632970283);
INSERT INTO `fa_admin_log` VALUES (36, 1, 'admin888', '/abcd.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin888\",\"password\":\"***\",\"captcha\":\"ahmu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633052023);
INSERT INTO `fa_admin_log` VALUES (37, 1, 'admin888', '/abcd.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"导航栏logo\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633052064);
INSERT INTO `fa_admin_log` VALUES (38, 1, 'admin888', '/abcd.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"nav_logo\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633052074);
INSERT INTO `fa_admin_log` VALUES (39, 1, 'admin888', '/abcd.php/general.config/add', '常规管理 / 系统配置 / 添加', '{\"__token__\":\"***\",\"row\":{\"group\":\"mao\",\"type\":\"image\",\"name\":\"nav_logo\",\"title\":\"导航栏logo\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"tip\":\"导航栏logo\",\"rule\":\"\",\"extend\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633052077);
INSERT INTO `fa_admin_log` VALUES (40, 1, 'admin888', '/abcd.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633052091);
INSERT INTO `fa_admin_log` VALUES (41, 1, 'admin888', '/abcd.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{\"__token__\":\"***\",\"row\":{\"logo\":\"\\/uploads\\/20210930\\/f5e6d96871b22ea9247994745c7a786f.png\",\"nav_logo\":\"\\/uploads\\/20211001\\/771a40fc21194f20c8b2734d937af3b5.png\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633052095);
INSERT INTO `fa_admin_log` VALUES (42, 1, 'admin888', '/abcd.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"hot_logo\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633052161);
INSERT INTO `fa_admin_log` VALUES (43, 1, 'admin888', '/abcd.php/general.config/add', '常规管理 / 系统配置 / 添加', '{\"__token__\":\"***\",\"row\":{\"group\":\"mao\",\"type\":\"image\",\"name\":\"hot_logo\",\"title\":\"热门城市logo\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"tip\":\"热门城市logo\",\"rule\":\"\",\"extend\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633052163);
INSERT INTO `fa_admin_log` VALUES (44, 1, 'admin888', '/abcd.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633052172);
INSERT INTO `fa_admin_log` VALUES (45, 1, 'admin888', '/abcd.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{\"__token__\":\"***\",\"row\":{\"logo\":\"\\/uploads\\/20210930\\/f5e6d96871b22ea9247994745c7a786f.png\",\"nav_logo\":\"\\/uploads\\/20211001\\/771a40fc21194f20c8b2734d937af3b5.png\",\"hot_logo\":\"\\/uploads\\/20211001\\/d804ce5c1b15aa36cc1cb16820b678af.png\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633052175);
INSERT INTO `fa_admin_log` VALUES (46, 1, 'admin888', '/abcd.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"wechat_logo\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633056122);
INSERT INTO `fa_admin_log` VALUES (47, 1, 'admin888', '/abcd.php/general.config/add', '常规管理 / 系统配置 / 添加', '{\"__token__\":\"***\",\"row\":{\"group\":\"mao\",\"type\":\"image\",\"name\":\"wechat_logo\",\"title\":\"微信公众号logo\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"tip\":\"微信公众号logo\",\"rule\":\"\",\"extend\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633056135);
INSERT INTO `fa_admin_log` VALUES (48, 1, 'admin888', '/abcd.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633056147);
INSERT INTO `fa_admin_log` VALUES (49, 1, 'admin888', '/abcd.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{\"__token__\":\"***\",\"row\":{\"logo\":\"\\/uploads\\/20210930\\/f5e6d96871b22ea9247994745c7a786f.png\",\"nav_logo\":\"\\/uploads\\/20211001\\/771a40fc21194f20c8b2734d937af3b5.png\",\"hot_logo\":\"\\/uploads\\/20211001\\/d804ce5c1b15aa36cc1cb16820b678af.png\",\"wechat_logo\":\"\\/uploads\\/20211001\\/994075f8867c7ee68b8082a6413bc187.png\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633056150);
INSERT INTO `fa_admin_log` VALUES (50, 1, 'admin888', '/abcd.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"第一个分享图 配图\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633056172);
INSERT INTO `fa_admin_log` VALUES (51, 1, 'admin888', '/abcd.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"wechat_logo2\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633056208);
INSERT INTO `fa_admin_log` VALUES (52, 1, 'admin888', '/abcd.php/general.config/add', '常规管理 / 系统配置 / 添加', '{\"__token__\":\"***\",\"row\":{\"group\":\"mao\",\"type\":\"image\",\"name\":\"wechat_logo2\",\"title\":\"第一个分享图 公众号左边第二行配图\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"tip\":\"第一个分享图 公众号左边第二行配图\",\"rule\":\"\",\"extend\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633056210);
INSERT INTO `fa_admin_log` VALUES (53, 1, 'admin888', '/abcd.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633056223);
INSERT INTO `fa_admin_log` VALUES (54, 1, 'admin888', '/abcd.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{\"__token__\":\"***\",\"row\":{\"logo\":\"\\/uploads\\/20210930\\/f5e6d96871b22ea9247994745c7a786f.png\",\"nav_logo\":\"\\/uploads\\/20211001\\/771a40fc21194f20c8b2734d937af3b5.png\",\"hot_logo\":\"\\/uploads\\/20211001\\/d804ce5c1b15aa36cc1cb16820b678af.png\",\"wechat_logo\":\"\\/uploads\\/20211001\\/994075f8867c7ee68b8082a6413bc187.png\",\"wechat_logo2\":\"\\/uploads\\/20211001\\/c6832daad70f5a036e83e67265a0ba68.png\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633056228);
INSERT INTO `fa_admin_log` VALUES (55, 1, 'admin888', '/abcd.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"分享图 背景1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633057756);
INSERT INTO `fa_admin_log` VALUES (56, 1, 'admin888', '/abcd.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"share_bg1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633057770);
INSERT INTO `fa_admin_log` VALUES (57, 1, 'admin888', '/abcd.php/general.config/add', '常规管理 / 系统配置 / 添加', '{\"__token__\":\"***\",\"row\":{\"group\":\"mao\",\"type\":\"image\",\"name\":\"share_bg1\",\"title\":\"分享图 背景1\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"tip\":\"分享图 背景1\",\"rule\":\"\",\"extend\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633057780);
INSERT INTO `fa_admin_log` VALUES (58, 1, 'admin888', '/abcd.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633057791);
INSERT INTO `fa_admin_log` VALUES (59, 1, 'admin888', '/abcd.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{\"__token__\":\"***\",\"row\":{\"logo\":\"\\/uploads\\/20210930\\/f5e6d96871b22ea9247994745c7a786f.png\",\"nav_logo\":\"\\/uploads\\/20211001\\/771a40fc21194f20c8b2734d937af3b5.png\",\"hot_logo\":\"\\/uploads\\/20211001\\/d804ce5c1b15aa36cc1cb16820b678af.png\",\"wechat_logo\":\"\\/uploads\\/20211001\\/994075f8867c7ee68b8082a6413bc187.png\",\"wechat_logo2\":\"\\/uploads\\/20211001\\/c6832daad70f5a036e83e67265a0ba68.png\",\"share_bg1\":\"\\/uploads\\/20211001\\/727aebbb704478222cb4b0dfd252119a.jpg\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633057801);
INSERT INTO `fa_admin_log` VALUES (60, 1, 'admin888', '/abcd.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633058216);
INSERT INTO `fa_admin_log` VALUES (61, 1, 'admin888', '/abcd.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_mao_info\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633058220);
INSERT INTO `fa_admin_log` VALUES (62, 1, 'admin888', '/abcd.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mao_info\",\"controller\":\"mao\\/Info\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633058237);
INSERT INTO `fa_admin_log` VALUES (63, 1, 'admin888', '/abcd.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mao_info\",\"controller\":\"mao\\/Info\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"mao_ym,mao_jy,mao_sex\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633058262);
INSERT INTO `fa_admin_log` VALUES (64, 1, 'admin888', '/abcd.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_mao_info\",\"controller\":\"mao\\/Info\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"mao_ym,mao_jy,mao_sex\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633058263);
INSERT INTO `fa_admin_log` VALUES (65, 1, 'admin888', '/abcd.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"分享图 背景1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633058657);
INSERT INTO `fa_admin_log` VALUES (66, 1, 'admin888', '/abcd.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"share_bg2\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633058669);
INSERT INTO `fa_admin_log` VALUES (67, 1, 'admin888', '/abcd.php/general.config/add', '常规管理 / 系统配置 / 添加', '{\"__token__\":\"***\",\"row\":{\"group\":\"mao\",\"type\":\"image\",\"name\":\"share_bg2\",\"title\":\"分享图 背景2\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"tip\":\"分享图 背景2\",\"rule\":\"\",\"extend\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633058677);
INSERT INTO `fa_admin_log` VALUES (68, 1, 'admin888', '/abcd.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"分享图 背景2\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633058683);
INSERT INTO `fa_admin_log` VALUES (69, 1, 'admin888', '/abcd.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"share_bg3\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633058697);
INSERT INTO `fa_admin_log` VALUES (70, 1, 'admin888', '/abcd.php/general.config/add', '常规管理 / 系统配置 / 添加', '{\"__token__\":\"***\",\"row\":{\"group\":\"mao\",\"type\":\"image\",\"name\":\"share_bg3\",\"title\":\"分享图 背景3\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"tip\":\"分享图 背景3\",\"rule\":\"\",\"extend\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633058705);
INSERT INTO `fa_admin_log` VALUES (71, 1, 'admin888', '/abcd.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633058715);
INSERT INTO `fa_admin_log` VALUES (72, 1, 'admin888', '/abcd.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{\"__token__\":\"***\",\"row\":{\"logo\":\"\\/uploads\\/20210930\\/f5e6d96871b22ea9247994745c7a786f.png\",\"nav_logo\":\"\\/uploads\\/20211001\\/771a40fc21194f20c8b2734d937af3b5.png\",\"hot_logo\":\"\\/uploads\\/20211001\\/d804ce5c1b15aa36cc1cb16820b678af.png\",\"wechat_logo\":\"\\/uploads\\/20211001\\/994075f8867c7ee68b8082a6413bc187.png\",\"wechat_logo2\":\"\\/uploads\\/20211001\\/c6832daad70f5a036e83e67265a0ba68.png\",\"share_bg1\":\"\\/uploads\\/20211001\\/727aebbb704478222cb4b0dfd252119a.jpg\",\"share_bg2\":\"\\/uploads\\/20211001\\/5043161aa884ae1dab3fa39ffee69a4b.jpg\",\"share_bg3\":\"\\/uploads\\/20211001\\/5043161aa884ae1dab3fa39ffee69a4b.jpg\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633058726);
INSERT INTO `fa_admin_log` VALUES (73, 0, 'Unknown', '/abcd.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"VENJ\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.25 Safari/537.36 Core/1.70.3870.400 QQBrowser/10.8.4405.400', 1633154157);
INSERT INTO `fa_admin_log` VALUES (74, 0, 'Unknown', '/abcd.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"zq8c\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.25 Safari/537.36 Core/1.70.3870.400 QQBrowser/10.8.4405.400', 1633154183);
INSERT INTO `fa_admin_log` VALUES (75, 1, 'admin888', '/abcd.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin888\",\"password\":\"***\",\"captcha\":\"neck\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.25 Safari/537.36 Core/1.70.3870.400 QQBrowser/10.8.4405.400', 1633154192);
INSERT INTO `fa_admin_log` VALUES (76, 0, 'Unknown', '/abcd.php/index/login', '', '{\"__token__\":\"***\",\"username\":\"admin888\",\"password\":\"***\",\"captcha\":\"nzxq\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633773383);
INSERT INTO `fa_admin_log` VALUES (77, 1, 'admin888', '/abcd.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin888\",\"password\":\"***\",\"captcha\":\"schu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633773388);
INSERT INTO `fa_admin_log` VALUES (78, 1, 'admin888', '/abcd.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin888\",\"password\":\"***\",\"captcha\":\"utmg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633773479);
INSERT INTO `fa_admin_log` VALUES (79, 1, 'admin888', '/abcd.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633773504);
INSERT INTO `fa_admin_log` VALUES (80, 1, 'admin888', '/abcd.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{\"__token__\":\"***\",\"row\":{\"logo\":\"\\/uploads\\/20210930\\/f5e6d96871b22ea9247994745c7a786f.png\",\"nav_logo\":\"\\/uploads\\/20211001\\/771a40fc21194f20c8b2734d937af3b5.png\",\"hot_logo\":\"\\/uploads\\/20211001\\/d804ce5c1b15aa36cc1cb16820b678af.png\",\"wechat_logo\":\"\\/uploads\\/20211001\\/994075f8867c7ee68b8082a6413bc187.png\",\"wechat_logo2\":\"\\/uploads\\/20211001\\/c6832daad70f5a036e83e67265a0ba68.png\",\"share_bg1\":\"\\/uploads\\/20211001\\/727aebbb704478222cb4b0dfd252119a.jpg\",\"share_bg2\":\"\\/uploads\\/20211009\\/81b60d360c9d59f0aa57551db9b8fbef.png\",\"share_bg3\":\"\\/uploads\\/20211009\\/81b60d360c9d59f0aa57551db9b8fbef.png\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1633773517);

-- ----------------------------
-- Table structure for fa_area
-- ----------------------------
DROP TABLE IF EXISTS `fa_area`;
CREATE TABLE `fa_area`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) NULL DEFAULT NULL COMMENT '父id',
  `shortname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '简称',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `mergename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '全称',
  `level` tinyint(4) NULL DEFAULT NULL COMMENT '层级 0 1 2 省市区县',
  `pinyin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '拼音',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '长途区号',
  `zip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮编',
  `first` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '首字母',
  `lng` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '经度',
  `lat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '地区表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_area
-- ----------------------------

-- ----------------------------
-- Table structure for fa_attachment
-- ----------------------------
DROP TABLE IF EXISTS `fa_attachment`;
CREATE TABLE `fa_attachment`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '类别',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片帧数',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '文件名称',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `mimetype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) NULL DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_attachment
-- ----------------------------
INSERT INTO `fa_attachment` VALUES (1, '', 1, 0, '/assets/img/qrcode.png', '150', '150', 'png', 0, 'qrcode.png', 21859, 'image/png', '', 1491635035, 1491635035, 1491635035, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
INSERT INTO `fa_attachment` VALUES (2, '', 1, 0, '/uploads/20210930/867b27dc2952457c728d13d7e74d6e42.png', '200', '200', 'png', 0, '大暑.png', 19406, 'image/png', '', 1632938168, 1632938168, 1632938168, 'local', 'a1210a2f885bd0e81056aa1310639e8101eb656e');
INSERT INTO `fa_attachment` VALUES (3, '', 1, 0, '/uploads/20210930/aaedabcb6bdc0d820ce18e3f0dc3ca06.png', '200', '200', 'png', 0, '大雪.png', 14148, 'image/png', '', 1632938171, 1632938171, 1632938171, 'local', '81a48e5449bfe22689c8ee98a9f6c4047b70d105');
INSERT INTO `fa_attachment` VALUES (4, '', 1, 0, '/uploads/20210930/3cc0b60d2afb41879bb569796abf8042.png', '200', '200', 'png', 0, '大寒.png', 17077, 'image/png', '', 1632938208, 1632938208, 1632938208, 'local', '31759d5f4c01ab5831c2502697d9c288f5d5be9b');
INSERT INTO `fa_attachment` VALUES (5, '', 1, 0, '/uploads/20210930/f5e6d96871b22ea9247994745c7a786f.png', '200', '200', 'png', 0, '冬至.png', 18323, 'image/png', '', 1632938345, 1632938345, 1632938345, 'local', '9d06d64f896544a8aeb4885183fa85dbeb39464a');
INSERT INTO `fa_attachment` VALUES (6, '', 1, 0, '/uploads/20211001/ff95d83c88f94928d8f33b174a288780.png', '180', '180', 'png', 0, '春分.png', 11157, 'image/png', '', 1633049201, 1633049201, 1633049201, 'local', '77472f3e5de037027cf28b6573159e4ee6183d84');
INSERT INTO `fa_attachment` VALUES (7, '', 1, 0, '/uploads/20211001/a433cb73221e36939ac88a388ddf5f54.png', '180', '180', 'png', 0, '大寒.png', 14262, 'image/png', '', 1633049201, 1633049201, 1633049201, 'local', '019a70d2c23dcd18199dc5ebdfd4bc01b73aef26');
INSERT INTO `fa_attachment` VALUES (8, '', 1, 0, '/uploads/20211001/197f4086a01b772c719b2de296672c59.png', '471', '471', 'png', 0, '360截图178606047111284.png', 398245, 'image/png', '', 1633049939, 1633049939, 1633049939, 'local', '675e6e3c60ec6107c7faa23908a4449f8a4e6084');
INSERT INTO `fa_attachment` VALUES (9, '', 1, 0, '/uploads/20211001/053ced9dd6ced96a8831c7d488f84719.png', '734', '734', 'png', 0, '360截图17991017102130139.png', 209122, 'image/png', '', 1633049939, 1633049939, 1633049939, 'local', '94923a04542df69208f0f254f62c09f6fc6894b2');
INSERT INTO `fa_attachment` VALUES (10, '', 1, 0, '/uploads/20211001/771a40fc21194f20c8b2734d937af3b5.png', '375', '375', 'png', 0, '375x375.png', 48043, 'image/png', '', 1633052091, 1633052091, 1633052091, 'local', '262e8a063339eab1277f9d62d1e5fe8782900b3c');
INSERT INTO `fa_attachment` VALUES (11, '', 1, 0, '/uploads/20211001/d804ce5c1b15aa36cc1cb16820b678af.png', '189', '181', 'png', 0, 'cat-bg (1).png', 20142, 'image/png', '', 1633052172, 1633052172, 1633052172, 'local', '56d7fbe2def618e587e3b26de029e7cc1d224cb4');
INSERT INTO `fa_attachment` VALUES (12, '', 1, 0, '/uploads/20211001/994075f8867c7ee68b8082a6413bc187.png', '222', '218', 'png', 0, '360截图16810228346478.png', 125556, 'image/png', '', 1633056147, 1633056147, 1633056147, 'local', '3b11b9b285610bfa98b367168c3f7a95d5f98794');
INSERT INTO `fa_attachment` VALUES (13, '', 1, 0, '/uploads/20211001/c6832daad70f5a036e83e67265a0ba68.png', '438', '51', 'png', 0, '360截图1786060874116110.png', 22792, 'image/png', '', 1633056223, 1633056223, 1633056223, 'local', '69c1dfe5f494befb1149b6801487fc5d4b69aa19');
INSERT INTO `fa_attachment` VALUES (14, '', 1, 0, '/uploads/20211001/727aebbb704478222cb4b0dfd252119a.jpg', '863', '417', 'jpg', 0, '下载.jpg', 16835, 'image/jpeg', '', 1633057791, 1633057791, 1633057791, 'local', '6d7747abb790eca1d5927d5d94f3281274524b1a');
INSERT INTO `fa_attachment` VALUES (15, '', 1, 0, '/uploads/20211001/5043161aa884ae1dab3fa39ffee69a4b.jpg', '720', '1281', 'jpg', 0, '下载 (1).jpg', 67642, 'image/jpeg', '', 1633058715, 1633058715, 1633058715, 'local', '0871ab0e52dbb54dfff591a8e188d66f84f2a3d1');
INSERT INTO `fa_attachment` VALUES (16, '', 0, 0, '/uploads/20211001/d23ae518ad005cae1c0d9ad363d8e26b.png', '1080', '1080', 'png', 0, 'Screenshot_2021-08-28-16-04-58-22.png', 295192, 'image/png', '', 1633061194, 1633061194, 1633061194, 'local', '8874cabd1b2317c7537b2281276c2d259f876acc');
INSERT INTO `fa_attachment` VALUES (17, '', 0, 0, '/uploads/20211001/5004e00db9f67e8b6b78efced27f101b.png', '972', '972', 'png', 0, 'Screenshot_2021-08-28-16-04-58-22.png', 217848, 'image/png', '', 1633061194, 1633061194, 1633061194, 'local', 'd7787c42724d20ec354372b859072a5b74a5f588');
INSERT INTO `fa_attachment` VALUES (18, '', 1, 0, '/uploads/20211001/85bb26b9f0a254a0355a91cad494851c.png', '180', '180', 'png', 0, '大暑.png', 17290, 'image/png', '', 1633061308, 1633061308, 1633061308, 'local', '962b2ed720a79e77fbe00806a21544186502ac33');
INSERT INTO `fa_attachment` VALUES (19, '', 1, 0, '/uploads/20211001/4199993d221e7af0fd42d9a7fabac7a9.png', '180', '180', 'png', 0, '大寒.png', 14292, 'image/png', '', 1633061336, 1633061336, 1633061336, 'local', '30d529c14e3b7734ff210d1eda445a46eec9dd51');
INSERT INTO `fa_attachment` VALUES (20, '', 1, 0, '/uploads/20211001/1ac0c069f9d6c810743d4a3a49968e92.png', '180', '180', 'png', 0, '冬至.png', 15894, 'image/png', '', 1633061367, 1633061367, 1633061367, 'local', '1e25ad277231f0a3534921f9d8c16b1548611cb1');
INSERT INTO `fa_attachment` VALUES (21, '', 1, 0, '/uploads/20211001/a7ad24c84154493a0aaf32a88012ccef.png', '180', '180', 'png', 0, '大雪.png', 11473, 'image/png', '', 1633061407, 1633061407, 1633061407, 'local', 'de9ac69585c295c4602dd3d79f01a96b29b03bb4');
INSERT INTO `fa_attachment` VALUES (22, '', 1, 0, '/uploads/20211001/6526fc9606f993c70a75c47a680cd4d5.png', '200', '200', 'png', 0, '大寒.png', 17089, 'image/png', '', 1633064345, 1633064345, 1633064345, 'local', 'ec87735da33ce23d7e56db238cac75c5eef8f244');
INSERT INTO `fa_attachment` VALUES (23, '', 1, 0, '/uploads/20211001/4b297ea538a136761e6fc8f943b9a0b6.png', '180', '180', 'png', 0, '处暑.png', 17330, 'image/png', '', 1633064379, 1633064379, 1633064379, 'local', '976088b9e6e985c9d8a415bd76794e95aa90c1d1');
INSERT INTO `fa_attachment` VALUES (24, '', 1, 0, '/uploads/20211001/295fb7f9cab16f921a7a11f28f43ce2a.png', '180', '180', 'png', 0, '立冬.png', 24356, 'image/png', '', 1633064515, 1633064515, 1633064515, 'local', '2da3b0a56b0e9c5bece0cfbf7cf806a9b9ee25fa');
INSERT INTO `fa_attachment` VALUES (25, '', 1, 0, '/uploads/20211001/01b7aaf05002e6ec30800650a4188518.png', '180', '180', 'png', 0, '谷雨.png', 28522, 'image/png', '', 1633066085, 1633066085, 1633066085, 'local', '38e39873a6950adabb1dd640c185a1de1772a1fe');
INSERT INTO `fa_attachment` VALUES (26, '', 1, 0, '/uploads/20211001/ab98b8618ea4f551aaa9dec53d4bbf1e.png', '180', '180', 'png', 0, '大暑.png', 17042, 'image/png', '', 1633066765, 1633066765, 1633066765, 'local', 'dae445bc70e1681e5c0e0b7bf0afcbabb93ef33a');
INSERT INTO `fa_attachment` VALUES (27, '', 1, 0, '/uploads/20211002/197f4086a01b772c719b2de296672c59.png', '471', '471', 'png', 0, '360截图178606047111284.png', 398245, 'image/png', '', 1633155563, 1633155563, 1633155563, 'local', '675e6e3c60ec6107c7faa23908a4449f8a4e6084');
INSERT INTO `fa_attachment` VALUES (28, '', 1, 0, '/uploads/20211002/053ced9dd6ced96a8831c7d488f84719.png', '734', '734', 'png', 0, '360截图17991017102130139.png', 209122, 'image/png', '', 1633155563, 1633155563, 1633155563, 'local', '94923a04542df69208f0f254f62c09f6fc6894b2');
INSERT INTO `fa_attachment` VALUES (29, '', 0, 0, '/uploads/20211007/ecd18e782af8047389180a26d6fc4dd9.jpg', '1151', '1151', 'jpg', 0, 'mmexport1633489578666.jpg', 121566, 'image/jpeg', '', 1633600911, 1633600911, 1633600911, 'local', 'f5de591c47c19d65883f9812e158d98d15e8fb45');
INSERT INTO `fa_attachment` VALUES (30, '', 0, 0, '/uploads/20211007/c40c51c7dd52586b0abf83b8b30de210.jpg', '269', '269', 'jpg', 0, 'mmexport1633402303669.jpg', 26202, 'image/jpeg', '', 1633600911, 1633600911, 1633600911, 'local', '12f825d325b81a82fa0510b2e9cf8421b96a27da');
INSERT INTO `fa_attachment` VALUES (31, '', 0, 0, '/uploads/20211007/1ac0c069f9d6c810743d4a3a49968e92.png', '180', '180', 'png', 0, '冬至.png', 15894, 'image/png', '', 1633605032, 1633605032, 1633605032, 'local', '1e25ad277231f0a3534921f9d8c16b1548611cb1');
INSERT INTO `fa_attachment` VALUES (32, '', 0, 0, '/uploads/20211007/a433cb73221e36939ac88a388ddf5f54.png', '180', '180', 'png', 0, '大寒.png', 14262, 'image/png', '', 1633605032, 1633605032, 1633605032, 'local', '019a70d2c23dcd18199dc5ebdfd4bc01b73aef26');
INSERT INTO `fa_attachment` VALUES (33, '', 0, 0, '/uploads/20211007/b0a15704aaa606a5c70c02e76dbb47b5.png', '200', '200', 'png', 0, '春分.png', 13233, 'image/png', '', 1633605306, 1633605306, 1633605306, 'local', '58cd1aa584755a4b90410ff5fefe25e4c398120b');
INSERT INTO `fa_attachment` VALUES (34, '', 0, 0, '/uploads/20211009/704f541f4a50b52acf38cf105cb44074.jpg', '919', '919', 'jpg', 0, 'Screenshot_20211009_114535_com.tencent.mm.jpg', 89955, 'image/jpeg', '', 1633751212, 1633751212, 1633751211, 'local', '8de7424fda57924b8c723f89030beec6642c1b28');
INSERT INTO `fa_attachment` VALUES (35, '', 0, 0, '/uploads/20211009/0eb8db993cc961a72dd87d7d8fdf3fe7.jpg', '803', '803', 'jpg', 0, 'Screenshot_20211009_114535_com.tencent.mm.jpg', 87678, 'image/jpeg', '', 1633751212, 1633751212, 1633751212, 'local', '2e30d489445edfbdc89cd2ee8b3e172f3baa84e1');
INSERT INTO `fa_attachment` VALUES (36, '', 0, 0, '/uploads/20211009/f9865493521d721e9167347a26a324d6.png', '198', '198', 'png', 0, '-d1d0407fe82faf.png', 8595, 'image/png', '', 1633762802, 1633762802, 1633762802, 'local', 'e3ccab17b5c6a109a1b5b82f375b67685a25cbb9');
INSERT INTO `fa_attachment` VALUES (37, '', 0, 0, '/uploads/20211009/b03598a3c6b68129c7092b22b21892cc.jpg', '1055', '1055', 'jpg', 0, 'mmexport1633402306584.jpg', 120431, 'image/jpeg', '', 1633762802, 1633762802, 1633762802, 'local', '6d6750c895e620de1de85c9b3c84e2b19c80c272');
INSERT INTO `fa_attachment` VALUES (38, '', 0, 0, '/uploads/20211009/0bad51d371e3eea28830ea4b8fb8c89f.jpg', '1151', '1151', 'jpg', 0, 'mmexport1633489578666.jpg', 122388, 'image/jpeg', '', 1633762952, 1633762952, 1633762952, 'local', '32094b7b14fc34b5083206e72900c40aa011d132');
INSERT INTO `fa_attachment` VALUES (39, '', 0, 0, '/uploads/20211009/8e1b635f84904e101a17253ec517b023.jpg', '995', '995', 'jpg', 0, 'Screenshot_20211009_114535_com.tencent.mm.jpg', 100531, 'image/jpeg', '', 1633762952, 1633762952, 1633762952, 'local', '221d36346053a4cd517e53ca4f3e4fe5c8c5d2a2');
INSERT INTO `fa_attachment` VALUES (40, '', 1, 0, '/uploads/20211009/81b60d360c9d59f0aa57551db9b8fbef.png', '720', '1281', 'png', 0, '下载(1).png', 346640, 'image/png', '', 1633773504, 1633773504, 1633773504, 'local', '0d7903424742267c86c4ecf3f1cbc5afcd19565f');
INSERT INTO `fa_attachment` VALUES (41, '', 0, 0, '/uploads/20211010/770b79a432465374219b897aa4fdfa06.jpg', '301', '301', 'jpg', 0, 'mmexport1633489578666.jpg', 16478, 'image/jpeg', '', 1633844790, 1633844790, 1633844790, 'local', 'a29a2c4c8c81e8e24557b964d7326c83443ea22f');
INSERT INTO `fa_attachment` VALUES (42, '', 0, 0, '/uploads/20211010/aafc12f0de9d04d1f1e1521971477e3e.jpg', '809', '809', 'jpg', 0, 'Screenshot_20211009_114535_com.tencent.mm.jpg', 86402, 'image/jpeg', '', 1633844790, 1633844790, 1633844790, 'local', 'a346bc432927ed3e7ce61b4cd5c56174e8f12dd9');
INSERT INTO `fa_attachment` VALUES (43, '', 0, 0, '/uploads/20211010/d3bd6430b4b064f40498704ae58a1c4e.jpg', '1151', '1151', 'jpg', 0, 'mmexport1633489578666.jpg', 139817, 'image/jpeg', '', 1633845314, 1633845314, 1633845314, 'local', '2e3512f350202ebc978c62f2ec66eecbc05f8c1d');
INSERT INTO `fa_attachment` VALUES (44, '', 0, 0, '/uploads/20211010/aa51ee1e163a7325cac2e0f0836eaec8.jpg', '876', '876', 'jpg', 0, 'mmexport1633489584587.jpg', 90579, 'image/jpeg', '', 1633845314, 1633845314, 1633845314, 'local', '9ff75752a4bc087a7f99f57d29f10e4866ae4279');

-- ----------------------------
-- Table structure for fa_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group`;
CREATE TABLE `fa_auth_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父组别',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则ID',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_auth_group
-- ----------------------------
INSERT INTO `fa_auth_group` VALUES (1, 0, 'Admin group', '*', 1491635035, 1491635035, 'normal');
INSERT INTO `fa_auth_group` VALUES (2, 1, 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', 1491635035, 1491635035, 'normal');
INSERT INTO `fa_auth_group` VALUES (3, 2, 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1491635035, 1491635035, 'normal');
INSERT INTO `fa_auth_group` VALUES (4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1491635035, 1491635035, 'normal');
INSERT INTO `fa_auth_group` VALUES (5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1491635035, 1491635035, 'normal');

-- ----------------------------
-- Table structure for fa_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group_access`;
CREATE TABLE `fa_auth_group_access`  (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '级别ID',
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '权限分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_auth_group_access
-- ----------------------------
INSERT INTO `fa_auth_group_access` VALUES (1, 1);

-- ----------------------------
-- Table structure for fa_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_rule`;
CREATE TABLE `fa_auth_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图标',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '规则URL',
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为菜单',
  `menutype` enum('addtabs','blank','dialog','ajax') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单类型',
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '扩展属性',
  `py` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '拼音首字母',
  `pinyin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '拼音',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_auth_rule
-- ----------------------------
INSERT INTO `fa_auth_rule` VALUES (1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', '', 'Dashboard tips', 1, NULL, '', 'kzt', 'kongzhitai', 1491635035, 1491635035, 143, 'normal');
INSERT INTO `fa_auth_rule` VALUES (2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', '', 1, NULL, '', 'cggl', 'changguiguanli', 1491635035, 1491635035, 137, 'normal');
INSERT INTO `fa_auth_rule` VALUES (3, 'file', 0, 'category', 'Category', 'fa fa-leaf', '', '', 'Category tips', 1, NULL, '', 'flgl', 'fenleiguanli', 1491635035, 1491635035, 119, 'normal');
INSERT INTO `fa_auth_rule` VALUES (4, 'file', 0, 'addon', 'Addon', 'fa fa-rocket', '', '', 'Addon tips', 1, NULL, '', 'cjgl', 'chajianguanli', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (5, 'file', 0, 'auth', 'Auth', 'fa fa-group', '', '', '', 1, NULL, '', 'qxgl', 'quanxianguanli', 1491635035, 1491635035, 99, 'normal');
INSERT INTO `fa_auth_rule` VALUES (6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', '', 'Config tips', 1, NULL, '', 'xtpz', 'xitongpeizhi', 1491635035, 1491635035, 60, 'normal');
INSERT INTO `fa_auth_rule` VALUES (7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', '', 'Attachment tips', 1, NULL, '', 'fjgl', 'fujianguanli', 1491635035, 1491635035, 53, 'normal');
INSERT INTO `fa_auth_rule` VALUES (8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', '', 1, NULL, '', 'grzl', 'gerenziliao', 1491635035, 1491635035, 34, 'normal');
INSERT INTO `fa_auth_rule` VALUES (9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', '', 'Admin tips', 1, NULL, '', 'glygl', 'guanliyuanguanli', 1491635035, 1491635035, 118, 'normal');
INSERT INTO `fa_auth_rule` VALUES (10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', '', 'Admin log tips', 1, NULL, '', 'glyrz', 'guanliyuanrizhi', 1491635035, 1491635035, 113, 'normal');
INSERT INTO `fa_auth_rule` VALUES (11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', '', 'Group tips', 1, NULL, '', 'jsz', 'juesezu', 1491635035, 1491635035, 109, 'normal');
INSERT INTO `fa_auth_rule` VALUES (12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', '', 'Rule tips', 1, NULL, '', 'cdgz', 'caidanguize', 1491635035, 1491635035, 104, 'normal');
INSERT INTO `fa_auth_rule` VALUES (13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 136, 'normal');
INSERT INTO `fa_auth_rule` VALUES (14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 135, 'normal');
INSERT INTO `fa_auth_rule` VALUES (15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 133, 'normal');
INSERT INTO `fa_auth_rule` VALUES (16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 134, 'normal');
INSERT INTO `fa_auth_rule` VALUES (17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 132, 'normal');
INSERT INTO `fa_auth_rule` VALUES (18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 52, 'normal');
INSERT INTO `fa_auth_rule` VALUES (19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 51, 'normal');
INSERT INTO `fa_auth_rule` VALUES (20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 50, 'normal');
INSERT INTO `fa_auth_rule` VALUES (21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 49, 'normal');
INSERT INTO `fa_auth_rule` VALUES (22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 48, 'normal');
INSERT INTO `fa_auth_rule` VALUES (23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', '', 'Attachment tips', 0, NULL, '', '', '', 1491635035, 1491635035, 59, 'normal');
INSERT INTO `fa_auth_rule` VALUES (24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 58, 'normal');
INSERT INTO `fa_auth_rule` VALUES (25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 57, 'normal');
INSERT INTO `fa_auth_rule` VALUES (26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 56, 'normal');
INSERT INTO `fa_auth_rule` VALUES (27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 55, 'normal');
INSERT INTO `fa_auth_rule` VALUES (28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 54, 'normal');
INSERT INTO `fa_auth_rule` VALUES (29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 33, 'normal');
INSERT INTO `fa_auth_rule` VALUES (30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 32, 'normal');
INSERT INTO `fa_auth_rule` VALUES (31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 31, 'normal');
INSERT INTO `fa_auth_rule` VALUES (32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 30, 'normal');
INSERT INTO `fa_auth_rule` VALUES (33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 29, 'normal');
INSERT INTO `fa_auth_rule` VALUES (34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 28, 'normal');
INSERT INTO `fa_auth_rule` VALUES (35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', '', 'Category tips', 0, NULL, '', '', '', 1491635035, 1491635035, 142, 'normal');
INSERT INTO `fa_auth_rule` VALUES (36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 141, 'normal');
INSERT INTO `fa_auth_rule` VALUES (37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 140, 'normal');
INSERT INTO `fa_auth_rule` VALUES (38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 139, 'normal');
INSERT INTO `fa_auth_rule` VALUES (39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 138, 'normal');
INSERT INTO `fa_auth_rule` VALUES (40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', '', 'Admin tips', 0, NULL, '', '', '', 1491635035, 1491635035, 117, 'normal');
INSERT INTO `fa_auth_rule` VALUES (41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 116, 'normal');
INSERT INTO `fa_auth_rule` VALUES (42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 115, 'normal');
INSERT INTO `fa_auth_rule` VALUES (43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 114, 'normal');
INSERT INTO `fa_auth_rule` VALUES (44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', '', 'Admin log tips', 0, NULL, '', '', '', 1491635035, 1491635035, 112, 'normal');
INSERT INTO `fa_auth_rule` VALUES (45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 111, 'normal');
INSERT INTO `fa_auth_rule` VALUES (46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 110, 'normal');
INSERT INTO `fa_auth_rule` VALUES (47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', '', 'Group tips', 0, NULL, '', '', '', 1491635035, 1491635035, 108, 'normal');
INSERT INTO `fa_auth_rule` VALUES (48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 107, 'normal');
INSERT INTO `fa_auth_rule` VALUES (49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 106, 'normal');
INSERT INTO `fa_auth_rule` VALUES (50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 105, 'normal');
INSERT INTO `fa_auth_rule` VALUES (51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', '', 'Rule tips', 0, NULL, '', '', '', 1491635035, 1491635035, 103, 'normal');
INSERT INTO `fa_auth_rule` VALUES (52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 102, 'normal');
INSERT INTO `fa_auth_rule` VALUES (53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 101, 'normal');
INSERT INTO `fa_auth_rule` VALUES (54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 100, 'normal');
INSERT INTO `fa_auth_rule` VALUES (55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', '', 'Addon tips', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (59, 'file', 4, 'addon/downloaded', 'Local addon', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (66, 'file', 0, 'user', 'User', 'fa fa-user-circle', '', '', '', 1, NULL, '', 'hygl', 'huiyuanguanli', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (67, 'file', 66, 'user/user', 'User', 'fa fa-user', '', '', '', 1, NULL, '', 'hygl', 'huiyuanguanli', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', '', 1, NULL, '', 'hyfz', 'huiyuanfenzu', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'hygz', 'huiyuanguize', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (85, 'file', 0, 'command', '在线命令管理', 'fa fa-terminal', '', '', '', 1, NULL, '', 'zxmlgl', 'zaixianminglingguanli', 1632935611, 1632935611, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (86, 'file', 85, 'command/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1632935611, 1632935611, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (87, 'file', 85, 'command/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1632935611, 1632935611, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (88, 'file', 85, 'command/detail', '详情', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xq', 'xiangqing', 1632935611, 1632935611, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (89, 'file', 85, 'command/execute', '运行', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'yx', 'yunxing', 1632935611, 1632935611, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (90, 'file', 85, 'command/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1632935611, 1632935611, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (91, 'file', 85, 'command/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1632935611, 1632935611, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (92, 'file', 0, 'mao', '猫', 'fa fa-users', '', '', '', 1, NULL, '', 'm', 'mao', 1632938029, 1632938161, 999, 'normal');
INSERT INTO `fa_auth_rule` VALUES (93, 'file', 92, 'mao/info/index', '猫领养信息', 'fa fa-wechat', '', '', '', 1, NULL, '', 'mlyxx', 'maolingyangxinxi', 1632938029, 1632938161, 101, 'normal');
INSERT INTO `fa_auth_rule` VALUES (94, 'file', 93, 'gii/info/add', '猫领养信息添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'mlyxxtj', 'maolingyangxinxitianjia', 1632938029, 1632938161, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (95, 'file', 93, 'gii/info/edit', '猫领养信息修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'mlyxxxg', 'maolingyangxinxixiugai', 1632938029, 1632938161, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (96, 'file', 93, 'gii/info/del', '猫领养信息删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'mlyxxsc', 'maolingyangxinxishanchu', 1632938029, 1632938161, 0, 'normal');

-- ----------------------------
-- Table structure for fa_category
-- ----------------------------
DROP TABLE IF EXISTS `fa_category`;
CREATE TABLE `fa_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `flag` set('hot','index','recommend') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `weigh`(`weigh`, `id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_category
-- ----------------------------
INSERT INTO `fa_category` VALUES (1, 0, 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', 1491635035, 1491635035, 1, 'normal');
INSERT INTO `fa_category` VALUES (2, 0, 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', 1491635035, 1491635035, 2, 'normal');
INSERT INTO `fa_category` VALUES (3, 2, 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', 1491635035, 1491635035, 3, 'normal');
INSERT INTO `fa_category` VALUES (4, 2, 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', 1491635035, 1491635035, 4, 'normal');
INSERT INTO `fa_category` VALUES (5, 0, 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', 1491635035, 1491635035, 5, 'normal');
INSERT INTO `fa_category` VALUES (6, 5, 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', 1491635035, 1491635035, 6, 'normal');
INSERT INTO `fa_category` VALUES (7, 5, 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', 1491635035, 1491635035, 7, 'normal');
INSERT INTO `fa_category` VALUES (8, 6, 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', 1491635035, 1491635035, 8, 'normal');
INSERT INTO `fa_category` VALUES (9, 6, 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', 1491635035, 1491635035, 9, 'normal');
INSERT INTO `fa_category` VALUES (10, 7, 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', 1491635035, 1491635035, 10, 'normal');
INSERT INTO `fa_category` VALUES (11, 7, 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', 1491635035, 1491635035, 11, 'normal');
INSERT INTO `fa_category` VALUES (12, 0, 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', 1491635035, 1491635035, 12, 'normal');
INSERT INTO `fa_category` VALUES (13, 0, 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', 1491635035, 1491635035, 13, 'normal');

-- ----------------------------
-- Table structure for fa_command
-- ----------------------------
DROP TABLE IF EXISTS `fa_command`;
CREATE TABLE `fa_command`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型',
  `params` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数',
  `command` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '命令',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '返回结果',
  `executetime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '执行时间',
  `createtime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('successed','failured') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'failured' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线命令表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_command
-- ----------------------------
INSERT INTO `fa_command` VALUES (1, 'crud', '[\"--table=fa_mao_info\",\"--controller=mao\\/Info\",\"--enumradiosuffix=mao_jy\",\"--enumradiosuffix=mao_sex\"]', 'php think crud --table=fa_mao_info --controller=mao/Info --enumradiosuffix=mao_jy --enumradiosuffix=mao_sex', 'Build Successed', 1632937864, 1632937864, 1632937865, 'successed');
INSERT INTO `fa_command` VALUES (2, 'crud', '[\"--force=1\",\"--table=fa_mao_info\",\"--controller=mao\\/Info\",\"--imagefield=mao_pic\",\"--imagefield=wx_pic\"]', 'php think crud --force=1 --table=fa_mao_info --controller=mao/Info --imagefield=mao_pic --imagefield=wx_pic', 'Build Successed', 1632938148, 1632938148, 1632938148, 'successed');
INSERT INTO `fa_command` VALUES (3, 'crud', '[\"--force=1\",\"--table=fa_mao_info\",\"--controller=mao\\/Info\",\"--imagefield=mao_pic\",\"--imagefield=wx_pic\"]', 'php think crud --force=1 --table=fa_mao_info --controller=mao/Info --imagefield=mao_pic --imagefield=wx_pic', 'Build Successed', 1632938196, 1632938196, 1632938196, 'successed');
INSERT INTO `fa_command` VALUES (4, 'crud', '[\"--force=1\",\"--table=fa_mao_info\",\"--controller=mao\\/Info\",\"--enumradiosuffix=mao_jy\",\"--enumradiosuffix=mao_sex\",\"--imagefield=mao_pic\",\"--imagefield=wx_pic\"]', 'php think crud --force=1 --table=fa_mao_info --controller=mao/Info --enumradiosuffix=mao_jy --enumradiosuffix=mao_sex --imagefield=mao_pic --imagefield=wx_pic', 'Build Successed', 1632938248, 1632938248, 1632938248, 'successed');
INSERT INTO `fa_command` VALUES (5, 'crud', '[\"--force=1\",\"--table=fa_mao_info\",\"--controller=mao\\/Info\",\"--enumradiosuffix=mao_jy\",\"--enumradiosuffix=mao_sex\",\"--imagefield=mao_pic\",\"--imagefield=wx_pic\",\"--citysuffix=city\"]', 'php think crud --force=1 --table=fa_mao_info --controller=mao/Info --enumradiosuffix=mao_jy --enumradiosuffix=mao_sex --imagefield=mao_pic --imagefield=wx_pic --citysuffix=city', 'Build Successed', 1632938326, 1632938326, 1632938326, 'successed');
INSERT INTO `fa_command` VALUES (6, 'crud', '[\"--force=1\",\"--table=fa_mao_info\",\"--controller=mao\\/Info\",\"--enumradiosuffix=mao_ym\",\"--enumradiosuffix=mao_jy\",\"--enumradiosuffix=mao_sex\"]', 'php think crud --force=1 --table=fa_mao_info --controller=mao/Info --enumradiosuffix=mao_ym --enumradiosuffix=mao_jy --enumradiosuffix=mao_sex', 'Build Successed', 1633058263, 1633058263, 1633058263, 'successed');

-- ----------------------------
-- Table structure for fa_config
-- ----------------------------
DROP TABLE IF EXISTS `fa_config`;
CREATE TABLE `fa_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '变量值',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '变量字典数据',
  `rule` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '扩展属性',
  `setting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '配置',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_config
-- ----------------------------
INSERT INTO `fa_config` VALUES (1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', '我的网站', '', 'required', '', '');
INSERT INTO `fa_config` VALUES (2, 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '', '');
INSERT INTO `fa_config` VALUES (3, 'cdnurl', 'basic', 'Cdn url', '如果全站静态资源使用第三方云储存请配置该值', 'string', '', '', '', '', '');
INSERT INTO `fa_config` VALUES (4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', '', '');
INSERT INTO `fa_config` VALUES (5, 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '', '');
INSERT INTO `fa_config` VALUES (6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '', '');
INSERT INTO `fa_config` VALUES (7, 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '', '');
INSERT INTO `fa_config` VALUES (8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '', '');
INSERT INTO `fa_config` VALUES (9, 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"默认\",\"page\":\"单页\",\"article\":\"文章\",\"test\":\"Test\"}', '', '', '', NULL);
INSERT INTO `fa_config` VALUES (10, 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"基础配置\",\"email\":\"邮件配置\",\"dictionary\":\"字典配置\",\"user\":\"会员配置\",\"mao\":\"和猫住配置\"}', '', '', '', NULL);
INSERT INTO `fa_config` VALUES (11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"请选择\",\"SMTP\"]', '', '', '');
INSERT INTO `fa_config` VALUES (12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', '', '');
INSERT INTO `fa_config` VALUES (13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '', '');
INSERT INTO `fa_config` VALUES (14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', '', '');
INSERT INTO `fa_config` VALUES (15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码或授权码）', 'string', 'password', '', '', '', '');
INSERT INTO `fa_config` VALUES (16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"无\",\"TLS\",\"SSL\"]', '', '', '');
INSERT INTO `fa_config` VALUES (17, 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '', '');
INSERT INTO `fa_config` VALUES (18, 'attachmentcategory', 'dictionary', 'Attachment category', '', 'array', '{\"category1\":\"分类一\",\"category2\":\"分类二\",\"custom\":\"自定义\"}', '', '', '', NULL);
INSERT INTO `fa_config` VALUES (19, 'logo', 'mao', '和猫住logo', '和猫住logo', 'image', '/uploads/20210930/f5e6d96871b22ea9247994745c7a786f.png', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (20, 'nav_logo', 'mao', '导航栏logo', '导航栏logo', 'image', '/uploads/20211001/771a40fc21194f20c8b2734d937af3b5.png', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (21, 'hot_logo', 'mao', '热门城市logo', '热门城市logo', 'image', '/uploads/20211001/d804ce5c1b15aa36cc1cb16820b678af.png', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (22, 'wechat_logo', 'mao', '微信公众号logo', '微信公众号logo', 'image', '/uploads/20211001/994075f8867c7ee68b8082a6413bc187.png', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (23, 'wechat_logo2', 'mao', '第一个分享图 公众号左边第二行配图', '第一个分享图 公众号左边第二行配图', 'image', '/uploads/20211001/c6832daad70f5a036e83e67265a0ba68.png', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (24, 'share_bg1', 'mao', '分享图 背景1', '分享图 背景1', 'image', '/uploads/20211001/727aebbb704478222cb4b0dfd252119a.jpg', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (25, 'share_bg2', 'mao', '分享图 背景2', '分享图 背景2', 'image', '/uploads/20211009/81b60d360c9d59f0aa57551db9b8fbef.png', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `fa_config` VALUES (26, 'share_bg3', 'mao', '分享图 背景3', '分享图 背景3', 'image', '/uploads/20211009/81b60d360c9d59f0aa57551db9b8fbef.png', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');

-- ----------------------------
-- Table structure for fa_ems
-- ----------------------------
DROP TABLE IF EXISTS `fa_ems`;
CREATE TABLE `fa_ems`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '邮箱验证码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_ems
-- ----------------------------

-- ----------------------------
-- Table structure for fa_mao_info
-- ----------------------------
DROP TABLE IF EXISTS `fa_mao_info`;
CREATE TABLE `fa_mao_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mao_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '猫咪照片',
  `wx_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信联系二维码',
  `mao_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '猫咪名称',
  `mao_age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '猫咪年龄',
  `mao_sex` tinyint(4) NOT NULL DEFAULT 1 COMMENT '猫咪性别:1=妹妹,2=弟弟,3=未知',
  `mao_jy` tinyint(4) NOT NULL DEFAULT 0 COMMENT '已绝育:0=否,1=是',
  `mao_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '猫咪来源',
  `mao_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '猫咪备注',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '城市',
  `province_id` int(11) NOT NULL DEFAULT 0,
  `city_id` int(11) NOT NULL DEFAULT 0,
  `district_id` int(11) NOT NULL DEFAULT 0,
  `mao_ym` tinyint(4) NOT NULL DEFAULT 0 COMMENT '已打疫苗:0=否,1=是',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '提交时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `uid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_mao_info
-- ----------------------------
INSERT INTO `fa_mao_info` VALUES (1, '/uploads/20211001/4b297ea538a136761e6fc8f943b9a0b6.png', '/uploads/20211001/a433cb73221e36939ac88a388ddf5f54.png', '问请问', '21313', 3, 0, '123123', '123123', '北京/北京/东城区', 110000, 110000, 110000, 0, 1633064998, 1633064998, '2b5e7067fb3e6ccf8a1b1f7a7ebac4bf', '5dcf08e075ac50b9b9bf855f311640f6');
INSERT INTO `fa_mao_info` VALUES (2, '/uploads/20211001/85bb26b9f0a254a0355a91cad494851c.png', '/uploads/20211001/01b7aaf05002e6ec30800650a4188518.png', '发射点发生', '阀手动阀', 2, 0, '发射点发射点', '发射点发射点', '四川省/成都市/锦江区', 510000, 510100, 510104, 0, 1633066085, 1633066085, '2b5e7067fb3e6ccf8a1b1f7a7ebac4bf', '1dca09d0e9b1927548785f2f750c4a0a');
INSERT INTO `fa_mao_info` VALUES (3, '', '', '发射点发生', '阀手动阀', 2, 0, '发射点发射点', '发射点发射点', '四川省/成都市/锦江区', 510000, 510100, 510104, 0, 1633066611, 1633066611, '2b5e7067fb3e6ccf8a1b1f7a7ebac4bf', '003af2113aa9e1ee6072b3cc752b6066');
INSERT INTO `fa_mao_info` VALUES (4, '', '', '发射点发生', '阀手动阀', 2, 0, '发射点发射点', '发射点发射点', '四川省/成都市/锦江区', 510000, 510100, 510104, 0, 1633066679, 1633066679, '2b5e7067fb3e6ccf8a1b1f7a7ebac4bf', '87d13428d0793359be19618c714b1ac6');
INSERT INTO `fa_mao_info` VALUES (5, '/uploads/20211001/ff95d83c88f94928d8f33b174a288780.png', '/uploads/20211001/ab98b8618ea4f551aaa9dec53d4bbf1e.png', '我去恶趣味x', 'eqwe', 3, 1, 'qweqw', 'qweqwe', '贵州省/贵阳市/南明区', 520000, 520100, 520102, 0, 1633066765, 1633066794, '2b5e7067fb3e6ccf8a1b1f7a7ebac4bf', '0ca223ecd388b25f842a3d9285b6ab0a');
INSERT INTO `fa_mao_info` VALUES (6, '/uploads/20211002/197f4086a01b772c719b2de296672c59.png', '/uploads/20211002/053ced9dd6ced96a8831c7d488f84719.png', '恶趣味全额', '额为全额', 2, 0, '123', 'fdf', '北京/北京/东城区', 110000, 110000, 110000, 0, 1633155563, 1633155563, 'ebb1ca5004bbd1d5baa820c1689945b3', '46b05a96797aab5de0207137471aca98');
INSERT INTO `fa_mao_info` VALUES (7, '/uploads/20211007/ecd18e782af8047389180a26d6fc4dd9.jpg', '/uploads/20211007/c40c51c7dd52586b0abf83b8b30de210.jpg', '你好', '2个月', 3, 0, '', '有房有车', '北京/北京/东城区', 110000, 110000, 110000, 0, 1633600911, 1633600911, 'a5e9ab9f793f99a8a7dd44ca14ea4649', '42c8d52c2bc0a428b6ded7e6584508be');
INSERT INTO `fa_mao_info` VALUES (8, '/uploads/20211007/b0a15704aaa606a5c70c02e76dbb47b5.png', '/uploads/20211007/a433cb73221e36939ac88a388ddf5f54.png', 'saff', 'asfasf', 3, 0, 'afsf', 'af', '北京/北京/东城区', 110000, 110000, 110000, 0, 1633605032, 1633605306, '93aaddff42250299cf845755f88b0e6b', '7ef00b1e5bde2c5d3ceb276863abb160');
INSERT INTO `fa_mao_info` VALUES (9, '/uploads/20211009/704f541f4a50b52acf38cf105cb44074.jpg', '/uploads/20211009/0eb8db993cc961a72dd87d7d8fdf3fe7.jpg', '猫咪', '', 3, 0, '小区流浪猫', '你好，有吧', '北京/北京/东城区', 110000, 110000, 110000, 0, 1633751212, 1633751212, '99c82916438a65af9c3be0345cfe459b', '1e5849f133eaf509977e0af146dee012');
INSERT INTO `fa_mao_info` VALUES (10, '/uploads/20211009/f9865493521d721e9167347a26a324d6.png', '/uploads/20211009/b03598a3c6b68129c7092b22b21892cc.jpg', '', '', 3, 0, '', '', '北京/北京/东城区', 110000, 110000, 110000, 0, 1633762802, 1633762802, '99c82916438a65af9c3be0345cfe459b', 'a5f40e48e2034f3501e14fb80e4600a1');
INSERT INTO `fa_mao_info` VALUES (11, '/uploads/20211009/0bad51d371e3eea28830ea4b8fb8c89f.jpg', '/uploads/20211009/8e1b635f84904e101a17253ec517b023.jpg', '', '', 3, 0, '', '', '北京/北京/东城区', 110000, 110000, 110000, 0, 1633762952, 1633762952, '99c82916438a65af9c3be0345cfe459b', 'e0912edb452fd12d96925c2b805962f7');
INSERT INTO `fa_mao_info` VALUES (12, '/uploads/20211010/770b79a432465374219b897aa4fdfa06.jpg', '/uploads/20211010/aafc12f0de9d04d1f1e1521971477e3e.jpg', '猫咪', '', 3, 0, '', '', '北京/北京/东城区', 110000, 110000, 110000, 0, 1633844790, 1633844790, 'bc51af16c53fd3213cc9a967d5e1dea9', '5b93bdc3c989f1805e50d1aee5b5c001');
INSERT INTO `fa_mao_info` VALUES (13, '/uploads/20211010/d3bd6430b4b064f40498704ae58a1c4e.jpg', '/uploads/20211010/aa51ee1e163a7325cac2e0f0836eaec8.jpg', '猫咪', '', 2, 0, '流浪猫', '你好，我是不是', '北京/北京/东城区', 110000, 110000, 110000, 0, 1633845314, 1633845314, 'bc51af16c53fd3213cc9a967d5e1dea9', '6896205128f1f4d1d69b137c4c8fb49d');

-- ----------------------------
-- Table structure for fa_sms
-- ----------------------------
DROP TABLE IF EXISTS `fa_sms`;
CREATE TABLE `fa_sms`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '短信验证码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_sms
-- ----------------------------

-- ----------------------------
-- Table structure for fa_test
-- ----------------------------
DROP TABLE IF EXISTS `fa_test`;
CREATE TABLE `fa_test`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NULL DEFAULT 0 COMMENT '管理员ID',
  `category_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '分类ID(单选)',
  `category_ids` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '省市',
  `json` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `price` decimal(10, 2) UNSIGNED NULL COMMENT '价格',
  `views` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '点击',
  `startdate` date NULL DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime(0) NULL DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year NULL DEFAULT NULL COMMENT '年',
  `times` time(0) NULL DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) NULL DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) NULL DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NULL DEFAULT 0 COMMENT '权重',
  `switch` tinyint(1) NULL DEFAULT 0 COMMENT '开关',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '测试表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_test
-- ----------------------------
INSERT INTO `fa_test` VALUES (1, 0, 12, '12,13', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', '{\"a\":\"1\",\"b\":\"2\"}', 0.00, 0, '2017-07-10', '2017-07-10 18:24:45', 2017, '18:24:45', 1491635035, 1491635035, 1491635035, NULL, 0, 1, 'normal', '1');

-- ----------------------------
-- Table structure for fa_user
-- ----------------------------
DROP TABLE IF EXISTS `fa_user`;
CREATE TABLE `fa_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '组别ID',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '等级',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10, 2) NOT NULL COMMENT '余额',
  `score` int(10) NOT NULL DEFAULT 0 COMMENT '积分',
  `successions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '连续登录天数',
  `maxsuccessions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '最大连续登录天数',
  `prevtime` int(10) NULL DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `joinip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) NULL DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user
-- ----------------------------
INSERT INTO `fa_user` VALUES (1, 1, 'admin', 'admin', '1a5a785bfc7f0b8d11a264bfc8ab22f5', '7cad1e', 'admin@163.com', '13888888888', '', 0, 0, '2017-04-08', '', 0.00, 0, 1, 1, 1491635035, 1491635035, '127.0.0.1', 0, '127.0.0.1', 1491635035, 0, 1491635035, '', 'normal', '');

-- ----------------------------
-- Table structure for fa_user_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_group`;
CREATE TABLE `fa_user_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '权限节点',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_group
-- ----------------------------
INSERT INTO `fa_user_group` VALUES (1, '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', 1491635035, 1491635035, 'normal');

-- ----------------------------
-- Table structure for fa_user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_money_log`;
CREATE TABLE `fa_user_money_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `money` decimal(10, 2) NOT NULL COMMENT '变更余额',
  `before` decimal(10, 2) NOT NULL COMMENT '变更前余额',
  `after` decimal(10, 2) NOT NULL COMMENT '变更后余额',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员余额变动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_money_log
-- ----------------------------

-- ----------------------------
-- Table structure for fa_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_rule`;
CREATE TABLE `fa_user_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) NULL DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '标题',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) NULL DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NULL DEFAULT 0 COMMENT '权重',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_rule
-- ----------------------------
INSERT INTO `fa_user_rule` VALUES (1, 0, 'index', 'Frontend', '', 1, 1491635035, 1491635035, 1, 'normal');
INSERT INTO `fa_user_rule` VALUES (2, 0, 'api', 'API Interface', '', 1, 1491635035, 1491635035, 2, 'normal');
INSERT INTO `fa_user_rule` VALUES (3, 1, 'user', 'User Module', '', 1, 1491635035, 1491635035, 12, 'normal');
INSERT INTO `fa_user_rule` VALUES (4, 2, 'user', 'User Module', '', 1, 1491635035, 1491635035, 11, 'normal');
INSERT INTO `fa_user_rule` VALUES (5, 3, 'index/user/login', 'Login', '', 0, 1491635035, 1491635035, 5, 'normal');
INSERT INTO `fa_user_rule` VALUES (6, 3, 'index/user/register', 'Register', '', 0, 1491635035, 1491635035, 7, 'normal');
INSERT INTO `fa_user_rule` VALUES (7, 3, 'index/user/index', 'User Center', '', 0, 1491635035, 1491635035, 9, 'normal');
INSERT INTO `fa_user_rule` VALUES (8, 3, 'index/user/profile', 'Profile', '', 0, 1491635035, 1491635035, 4, 'normal');
INSERT INTO `fa_user_rule` VALUES (9, 4, 'api/user/login', 'Login', '', 0, 1491635035, 1491635035, 6, 'normal');
INSERT INTO `fa_user_rule` VALUES (10, 4, 'api/user/register', 'Register', '', 0, 1491635035, 1491635035, 8, 'normal');
INSERT INTO `fa_user_rule` VALUES (11, 4, 'api/user/index', 'User Center', '', 0, 1491635035, 1491635035, 10, 'normal');
INSERT INTO `fa_user_rule` VALUES (12, 4, 'api/user/profile', 'Profile', '', 0, 1491635035, 1491635035, 3, 'normal');

-- ----------------------------
-- Table structure for fa_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_score_log`;
CREATE TABLE `fa_user_score_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT 0 COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT 0 COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT 0 COMMENT '变更后积分',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员积分变动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_score_log
-- ----------------------------

-- ----------------------------
-- Table structure for fa_user_token
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_token`;
CREATE TABLE `fa_user_token`  (
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Token',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员Token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_token
-- ----------------------------

-- ----------------------------
-- Table structure for fa_version
-- ----------------------------
DROP TABLE IF EXISTS `fa_version`;
CREATE TABLE `fa_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '强制更新',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '版本表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_version
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
