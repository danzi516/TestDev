/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : auto_release

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2021-04-30 10:27:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for credentials
-- ----------------------------
DROP TABLE IF EXISTS `credentials`;
CREATE TABLE `credentials` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1服务器，2svn',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='凭证管理';

-- ----------------------------
-- Records of credentials
-- ----------------------------
INSERT INTO `credentials` VALUES ('7', '1', 'test_release', '1111', '服务器1');
INSERT INTO `credentials` VALUES ('10', '2', 'test_release', '1111', 'svn');

-- ----------------------------
-- Table structure for environment
-- ----------------------------
DROP TABLE IF EXISTS `environment`;
CREATE TABLE `environment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `type` int(11) DEFAULT '1' COMMENT '1开发，2测试',
  `hostname` varchar(255) DEFAULT NULL COMMENT '服务器地址',
  `credentials_id` int(11) DEFAULT NULL COMMENT '凭证',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='环境管理';

-- ----------------------------
-- Records of environment
-- ----------------------------
INSERT INTO `environment` VALUES ('1', '测试服务器', '2', '192.168.0.101', '7');

-- ----------------------------
-- Table structure for java_dependencies
-- ----------------------------
DROP TABLE IF EXISTS `java_dependencies`;
CREATE TABLE `java_dependencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `javaproject_id` int(11) NOT NULL COMMENT 'java组件id',
  `dependencies_id` int(11) NOT NULL COMMENT '依赖包id',
  `num` int(11) DEFAULT NULL COMMENT '打包执行顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Java依赖关系表';

-- ----------------------------
-- Records of java_dependencies
-- ----------------------------

-- ----------------------------
-- Table structure for php_configuration
-- ----------------------------
DROP TABLE IF EXISTS `php_configuration`;
CREATE TABLE `php_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) NOT NULL COMMENT 'project_id',
  `parameter` varchar(255) DEFAULT NULL COMMENT '前端包名中间参数',
  `dev_path` varchar(255) DEFAULT NULL COMMENT '前端开发服务器打包路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='前端php组件配置表';

-- ----------------------------
-- Records of php_configuration
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(64) NOT NULL COMMENT '产品名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `ftp_path` varchar(255) DEFAULT NULL COMMENT 'ftp目录路径',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(255) DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT '1' COMMENT '状态（1正常，2关闭）',
  `close_id` int(11) DEFAULT NULL COMMENT '关闭人',
  `close_time` datetime DEFAULT NULL COMMENT '关闭时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('5', '税账通', '', '/projects/piaojujia', '1', '超级管理员', '2021-02-02 08:09:29', '1', null, null);
INSERT INTO `product` VALUES ('8', '生意嘉', '', '/projects/mml_shengyijia', '1', '超级管理员', '2021-02-07 09:18:30', '1', null, null);
INSERT INTO `product` VALUES ('9', '交收嘉加盟版', '', '/projects/jiaoshoujia_jm', '1', '超级管理员', '2021-02-18 02:26:48', '1', null, null);
INSERT INTO `product` VALUES ('10', '交收嘉官网', '', '/projects/jiaoshoujia_pt/', '1', '超级管理员', '2021-02-18 03:15:33', '1', null, null);
INSERT INTO `product` VALUES ('13', '交收嘉协作版', '', '/projects/jiaoshoujia_xz/', '1', '超级管理员', '2021-03-03 01:38:11', '1', null, null);
INSERT INTO `product` VALUES ('14', '交收嘉ERP', '', '/projects/erp', '1', '超级管理员', '2021-03-03 08:10:56', '1', null, null);
INSERT INTO `product` VALUES ('15', '交收嘉手机wap', '', '/projects/jiaoshoujia_pt/', '1', '超级管理员', '2021-03-10 07:42:45', '2', '40', '2021-03-23 08:50:03');
INSERT INTO `product` VALUES ('16', 'BNS', '', '/projects/BNS', '1', '超级管理员', '2021-03-29 08:26:19', '1', null, null);

-- ----------------------------
-- Table structure for product_project
-- ----------------------------
DROP TABLE IF EXISTS `product_project`;
CREATE TABLE `product_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `product_id` int(11) NOT NULL COMMENT 'product.id',
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COMMENT='产品_组件关联表';

-- ----------------------------
-- Records of product_project
-- ----------------------------
INSERT INTO `product_project` VALUES ('38', '5', '38');
INSERT INTO `product_project` VALUES ('39', '5', '21');
INSERT INTO `product_project` VALUES ('40', '5', '44');
INSERT INTO `product_project` VALUES ('46', '9', '58');
INSERT INTO `product_project` VALUES ('47', '9', '60');
INSERT INTO `product_project` VALUES ('94', '13', '67');
INSERT INTO `product_project` VALUES ('95', '13', '61');
INSERT INTO `product_project` VALUES ('97', '15', '69');
INSERT INTO `product_project` VALUES ('98', '10', '62');
INSERT INTO `product_project` VALUES ('99', '10', '61');
INSERT INTO `product_project` VALUES ('100', '10', '69');
INSERT INTO `product_project` VALUES ('101', '16', '70');
INSERT INTO `product_project` VALUES ('118', '8', '39');
INSERT INTO `product_project` VALUES ('119', '8', '40');
INSERT INTO `product_project` VALUES ('120', '8', '46');
INSERT INTO `product_project` VALUES ('121', '8', '52');
INSERT INTO `product_project` VALUES ('122', '8', '53');
INSERT INTO `product_project` VALUES ('123', '8', '54');
INSERT INTO `product_project` VALUES ('124', '8', '55');
INSERT INTO `product_project` VALUES ('125', '8', '56');
INSERT INTO `product_project` VALUES ('126', '8', '41');
INSERT INTO `product_project` VALUES ('127', '8', '42');
INSERT INTO `product_project` VALUES ('128', '8', '45');
INSERT INTO `product_project` VALUES ('129', '8', '47');
INSERT INTO `product_project` VALUES ('130', '8', '48');
INSERT INTO `product_project` VALUES ('131', '8', '50');
INSERT INTO `product_project` VALUES ('132', '8', '63');
INSERT INTO `product_project` VALUES ('133', '8', '43');
INSERT INTO `product_project` VALUES ('134', '8', '59');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL COMMENT '组件名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `type` int(11) DEFAULT NULL COMMENT '1java，2java依赖包，3php，4nodejs',
  `status` int(11) DEFAULT '1' COMMENT '状态（1正常，2关闭）',
  `workspace` varchar(255) DEFAULT NULL COMMENT '组件工作目录（脚本目录）',
  `publish_conf` varchar(255) DEFAULT NULL COMMENT '应用配置目录相对路径',
  `SVNaddress` varchar(255) DEFAULT NULL COMMENT '代码地址',
  `SVNfolder` varchar(255) DEFAULT NULL COMMENT 'svn目录',
  `credentials_id` int(11) DEFAULT NULL COMMENT 'credentials_id',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `start_time` datetime DEFAULT NULL COMMENT '启动时间/重启时间',
  `close_id` int(11) DEFAULT NULL COMMENT '关闭人',
  `close_time` datetime DEFAULT NULL COMMENT '关闭时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='组件表';

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('21', 'jp-pjj-core-1', '', '1', '1', '/jpdata/test_workspace/jp-pjj-core-1', '/WEB-INF/classes', '', null, null, '1', '2021-01-25 16:31:28', null, null, null);
INSERT INTO `project` VALUES ('38', 'jp-szt-web-1', '', '3', '1', '/jpdata/test_workspace/jp-szt-web-1', 'common/config', '', '', null, '1', '2021-01-28 08:20:35', null, null, null);
INSERT INTO `project` VALUES ('39', 'jp-mml-syj-core-1', '', '1', '1', '/jpdata/test_workspace/jp-mml-syj-core-1', '/WEB-INF/classes', '', null, null, '1', '2021-02-01 03:04:34', null, null, null);
INSERT INTO `project` VALUES ('40', 'jp-mml-syj-core-2', '', '1', '1', '/jpdata/test_workspace/jp-mml-syj-core-2', '/WEB-INF/classes', '', null, null, '1', '2021-02-01 03:09:35', null, null, null);
INSERT INTO `project` VALUES ('41', 'jp-slwWeb-web-1', '私联网、发展台、商家公众号pc', '4', '1', '/jpdata/test_workspace/jp-slwWeb-web-1', 'jp-slwWeb-web-1/config', '', '', null, '1', '2021-02-01 09:37:43', null, null, null);
INSERT INTO `project` VALUES ('42', 'jp-syjShare-web-1', '生意嘉分享页', '4', '1', '/jpdata/test_workspace/jp-syjShare-web-1', '/jpdata/kubernetes/unl/jp-syjShare-web-1/config', '', '', null, '1', '2021-02-01 09:45:14', null, null, null);
INSERT INTO `project` VALUES ('43', 'jp-mmlbk-web-1', '大后台', '3', '1', '/jpdata/test_workspace/jp-mmlbk-web-1', '', '', null, null, '1', '2021-02-01 09:59:37', null, null, null);
INSERT INTO `project` VALUES ('44', 'jp-pjj-web-1', '', '3', '1', '/jpdata/test_workspace/jp-pjj-web-1', '', '', null, null, '1', '2021-02-02 02:15:29', null, null, null);
INSERT INTO `project` VALUES ('45', 'jp-fztWx-web-1', '商家公众号', '4', '1', '/jpdata/test_workspace/jp-fztWx-web-1', '/jpdata/kubernetes/unl/jp-fzt-wx-web-1/config', '', '', null, '1', '2021-02-02 02:31:12', null, null, null);
INSERT INTO `project` VALUES ('46', 'jp-oc-jsj-core-2', '', '1', '1', '/jpdata/test_workspace/jp-oc-jsj-core-2', '/WEB-INF/classes', '', null, null, '1', '2021-02-02 03:03:00', null, null, null);
INSERT INTO `project` VALUES ('47', 'jp-syj-web-1', '新版生意嘉pc端对应php服务', '3', '1', '/jpdata/test_workspace/jp-syj-web-1', '', '', null, null, '1', '2021-02-02 07:03:06', null, null, null);
INSERT INTO `project` VALUES ('48', 'jp-vue-web-1', '物料分享等', '3', '1', '/jpdata/test_workspace/jp-vue-web-1', '', '', null, null, '1', '2021-02-02 07:30:51', null, null, null);
INSERT INTO `project` VALUES ('49', 'shengyj', '生意嘉官网', '3', '1', '/jpdata/test_workspace/shengyj', '/shengyj/common/config', '', '', null, '1', '2021-02-02 07:33:16', null, null, null);
INSERT INTO `project` VALUES ('50', 'jp-mml-web-1', '生意嘉、定损宝询价单等分享。2019版生意嘉pc端对应PHP服务', '3', '1', '/jpdata/test_workspace/jp-mml-web-1', '', '', null, null, '1', '2021-02-02 08:13:03', null, null, null);
INSERT INTO `project` VALUES ('51', 'jp-spt-web-1', '生意嘉pc端pqs相关页面', '3', '1', '/jpdata/test_workspace/jp-spt-web-1', '', '', null, null, '1', '2021-02-02 08:33:04', null, null, null);
INSERT INTO `project` VALUES ('52', 'jp-wx-api-1', '', '1', '1', '/jpdata/test_workspace/jp-wx-api-1', '/WEB-INF/classes', '', null, null, '1', '2021-02-02 08:47:22', null, null, null);
INSERT INTO `project` VALUES ('53', 'jp-backend-core-1', '', '1', '1', '/jpdata/test_workspace/jp-backend-core-1', '/WEB-INF/classes', '', null, null, '1', '2021-02-02 08:58:55', null, null, null);
INSERT INTO `project` VALUES ('54', 'jp-mml-jsj-core-1', '', '1', '1', '/jpdata/test_workspace/jp-mml-jsj-core-1', '/WEB-INF/classes', '', null, null, '1', '2021-02-02 09:02:15', null, null, null);
INSERT INTO `project` VALUES ('55', 'jp-oc-jsj-core-1', '', '1', '1', '/jpdata/test_workspace/jp-oc-jsj-core-1', '/WEB-INF/classes', '', null, null, '1', '2021-02-02 09:05:58', null, null, null);
INSERT INTO `project` VALUES ('56', 'jp-xgj-core-1', '', '1', '1', '/jpdata/test_workspace/jp-xgj-core-1', '/WEB-INF/classes', '', null, null, '1', '2021-02-02 09:08:35', null, null, null);
INSERT INTO `project` VALUES ('57', 'jp-pqs-core-1', '', '1', '1', '/jpdata/test_workspace/jp-pqs-core-1', '/WEB-INF/classes', '', null, null, '1', '2021-02-02 09:11:42', null, null, null);
INSERT INTO `project` VALUES ('58', 'jp-jsjjm-web-1', '交收嘉加盟版web', '3', '1', '/jpdata/test_workspace/jp-jsjjm-web-1', '', '', null, null, '1', '2021-02-02 09:13:05', null, null, null);
INSERT INTO `project` VALUES ('59', 'jiaparts-support-api', '总api', '1', '1', '/jpdata/test_workspace/jiaparts-support-api', '', '', null, null, '1', '2021-02-02 09:17:01', null, null, null);
INSERT INTO `project` VALUES ('60', 'jp-jsc-jm-core-1', '交收嘉加盟版接口', '1', '1', '/jpdata/test_workspace/jp-jsc-jm-core-1', '/WEB-INF/classes', '', null, null, '1', '2021-02-02 09:24:12', null, null, null);
INSERT INTO `project` VALUES ('61', 'jp-jsjxz-web-1', '交收嘉协作版和官网web', '3', '1', '/jpdata/test_workspace/jp-jsjxz-web-1', '/', '', '', null, '1', '2021-02-02 09:59:56', null, null, null);
INSERT INTO `project` VALUES ('62', 'jp-jsc-gw-core-1', '交收嘉官网接口', '1', '1', '/jpdata/test_workspace/jp-jsc-gw-core-1', '/WEB-INF/classes', '', null, null, '1', '2021-02-02 10:07:36', null, null, null);
INSERT INTO `project` VALUES ('63', 'jp-buyerWx-web-1', '生意嘉买家公众号页面', '4', '1', '/jpdata/test_workspace/jp-buyerWx-web-1', 'jp-buyer-wx-web-1/config', '', '', null, '1', '2021-02-25 07:15:11', null, null, null);
INSERT INTO `project` VALUES ('67', 'jp-jsc-core-1', '交收嘉协作版接口', '1', '1', '/jpdata/test_workspace/jp-jsc-core-1', '/WEB-INF/classes', '', '', null, '1', '2021-03-03 01:32:33', null, null, null);
INSERT INTO `project` VALUES ('68', 'jp-erp-core-1', '交收嘉ERP接口', '1', '1', '/jpdata/test_workspace/jp-erp-core-1', '/WEB-INF/classes', '', '', null, '1', '2021-03-03 04:19:51', null, null, null);
INSERT INTO `project` VALUES ('69', 'jp-fht-wap-web-1', '交收嘉手机发货台wap', '4', '1', '/jpdata/test_workspace/jp-fht-wap-web-1', '/', '', '', null, '1', '2021-03-03 06:18:12', null, null, null);
INSERT INTO `project` VALUES ('70', 'jp-bns-core-1', '', '1', '1', '/jpdata/test_workspace/jp-bns-core-1', '/WEB-INF/classes', '', '', null, '1', '2021-03-12 08:09:19', null, null, null);
INSERT INTO `project` VALUES ('71', 'jp-wx-web', '生意嘉买家公众号20年7月版本', '4', '1', '/jpdata/test_workspace/jp-wx-web', '/jpdata/kubernetes/unl/jp-wx-web-1/config', '', '', null, '1', '2021-03-12 08:14:17', null, null, null);
INSERT INTO `project` VALUES ('72', 'jiaparts-wxsdk', '', '2', '1', '/jpdata/test_workspace/jiaparts-wxsdk', '', 'https://172.23.2.1/svn/jpCore/new2/jiaparts-wxsdk', '/jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk', '10', '1', '2021-03-26 09:34:55', null, null, null);
INSERT INTO `project` VALUES ('73', 'jp-jpp-core-1', '', '1', '1', '/jpdata/test_workspace/jp-jpp-core-1', 'WEB-INF/classes', '', '', null, '1', '2021-04-25 03:49:26', null, null, null);

-- ----------------------------
-- Table structure for project_bulid
-- ----------------------------
DROP TABLE IF EXISTS `project_bulid`;
CREATE TABLE `project_bulid` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '包名',
  `project_id` int(11) NOT NULL COMMENT '所属组件id',
  `type` int(11) NOT NULL COMMENT '1java全量包，2java增量包',
  `status` int(11) NOT NULL COMMENT '发布状态（1更新代码中，2更新失败，3打包中，4打包成功，5打包失败）',
  `info` text COMMENT '具体信息',
  `SVNversion` varchar(11) DEFAULT NULL COMMENT 'svn版本号',
  `workspace` varchar(255) DEFAULT NULL COMMENT '版本存放目录',
  `create_uid` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='java组件打包历史';

-- ----------------------------
-- Records of project_bulid
-- ----------------------------
INSERT INTO `project_bulid` VALUES ('1', 'jiaparts-wxsdk.jar', '72', '2', '4', '代码更新成功，svn版本号：47323 [[1;34mINFO[m] Scanning for projects...\n[[1;33mWARNING[m] \n[[1;33mWARNING[m] Some problems were encountered while building the effective model for com.jiaparts:jiaparts-wxsdk:jar:0.0.1-SNAPSHOT\n[[1;33mWARNING[m] \'build.plugins.plugin.version\' for org.apache.maven.plugins:maven-compiler-plugin is missing. @ line 102, column 12\n[[1;33mWARNING[m] \n[[1;33mWARNING[m] It is highly recommended to fix these problems because they threaten the stability of your build.\n[[1;33mWARNING[m] \n[[1;33mWARNING[m] For this reason, future Maven versions might no longer support building such malformed projects.\n[[1;33mWARNING[m] \n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--------------------< [0;36mcom.jiaparts:jiaparts-wxsdk[0;1m >---------------------[m\n[[1;34mINFO[m] [1mBuilding jiaparts-wxsdk 0.0.1-SNAPSHOT[m\n[[1;34mINFO[m] [1m--------------------------------[ jar ]---------------------------------[m\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-clean-plugin:2.5:clean[m [1m(default-clean)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Deleting /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-resources-plugin:2.6:resources[m [1m(default-resources)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Using \'UTF-8\' encoding to copy filtered resources.\n[[1;34mINFO[m] Copying 2 resources\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-compiler-plugin:3.1:compile[m [1m(default-compile)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Changes detected - recompiling the module!\n[[1;34mINFO[m] Compiling 47 source files to /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/classes\n[[1;33mWARNING[m] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/UploadImgResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[[1;33mWARNING[m] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/AddMaterialResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[[1;33mWARNING[m] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/GetMaterialResp.java:[8,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[[1;33mWARNING[m] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/AddNewsResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-resources-plugin:2.6:testResources[m [1m(default-testResources)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Using \'UTF-8\' encoding to copy filtered resources.\n[[1;34mINFO[m] skip non existing resourceDirectory /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/test/resources\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-compiler-plugin:3.1:testCompile[m [1m(default-testCompile)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Changes detected - recompiling the module!\n[[1;34mINFO[m] Compiling 1 source file to /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/test-classes\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-surefire-plugin:2.18.1:test[m [1m(default-test)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Tests are skipped.\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-jar-plugin:2.4:jar[m [1m(default-jar)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Building jar: /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-install-plugin:2.4:install[m [1m(default-install)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Installing /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar to /home/test_release/.m2/repository/com/jiaparts/jiaparts-wxsdk/0.0.1-SNAPSHOT/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar\n[[1;34mINFO[m] Installing /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/pom.xml to /home/test_release/.m2/repository/com/jiaparts/jiaparts-wxsdk/0.0.1-SNAPSHOT/jiaparts-wxsdk-0.0.1-SNAPSHOT.pom\n[[1;34mINFO[m] [1m------------------------------------------------------------------------[m\n[[1;34mINFO[m] [1;32mBUILD SUCCESS[m\n[[1;34mINFO[m] [1m------------------------------------------------------------------------[m\n[[1;34mINFO[m] Total time:  10.134 s\n[[1;34mINFO[m] Finished at: 2021-03-29T07:37:08Z\n[[1;34mINFO[m] [1m------------------------------------------------------------------------[m\n', '47323', '', '1', '2021-03-29 07:36:55');
INSERT INTO `project_bulid` VALUES ('2', 'jiaparts-wxsdk.jar', '72', '2', '4', '代码更新成功，svn版本号：47390 [[1;34mINFO[m] Scanning for projects...\n[[1;33mWARNING[m] \n[[1;33mWARNING[m] Some problems were encountered while building the effective model for com.jiaparts:jiaparts-wxsdk:jar:0.0.1-SNAPSHOT\n[[1;33mWARNING[m] \'build.plugins.plugin.version\' for org.apache.maven.plugins:maven-compiler-plugin is missing. @ line 102, column 12\n[[1;33mWARNING[m] \n[[1;33mWARNING[m] It is highly recommended to fix these problems because they threaten the stability of your build.\n[[1;33mWARNING[m] \n[[1;33mWARNING[m] For this reason, future Maven versions might no longer support building such malformed projects.\n[[1;33mWARNING[m] \n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--------------------< [0;36mcom.jiaparts:jiaparts-wxsdk[0;1m >---------------------[m\n[[1;34mINFO[m] [1mBuilding jiaparts-wxsdk 0.0.1-SNAPSHOT[m\n[[1;34mINFO[m] [1m--------------------------------[ jar ]---------------------------------[m\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-clean-plugin:2.5:clean[m [1m(default-clean)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Deleting /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-resources-plugin:2.6:resources[m [1m(default-resources)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Using \'UTF-8\' encoding to copy filtered resources.\n[[1;34mINFO[m] Copying 2 resources\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-compiler-plugin:3.1:compile[m [1m(default-compile)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Changes detected - recompiling the module!\n[[1;34mINFO[m] Compiling 47 source files to /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/classes\n[[1;33mWARNING[m] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/UploadImgResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[[1;33mWARNING[m] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/AddMaterialResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[[1;33mWARNING[m] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/GetMaterialResp.java:[8,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[[1;33mWARNING[m] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/AddNewsResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-resources-plugin:2.6:testResources[m [1m(default-testResources)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Using \'UTF-8\' encoding to copy filtered resources.\n[[1;34mINFO[m] skip non existing resourceDirectory /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/test/resources\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-compiler-plugin:3.1:testCompile[m [1m(default-testCompile)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Changes detected - recompiling the module!\n[[1;34mINFO[m] Compiling 1 source file to /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/test-classes\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-surefire-plugin:2.18.1:test[m [1m(default-test)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Tests are skipped.\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-jar-plugin:2.4:jar[m [1m(default-jar)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Building jar: /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-install-plugin:2.4:install[m [1m(default-install)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Installing /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar to /home/test_release/.m2/repository/com/jiaparts/jiaparts-wxsdk/0.0.1-SNAPSHOT/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar\n[[1;34mINFO[m] Installing /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/pom.xml to /home/test_release/.m2/repository/com/jiaparts/jiaparts-wxsdk/0.0.1-SNAPSHOT/jiaparts-wxsdk-0.0.1-SNAPSHOT.pom\n[[1;34mINFO[m] [1m------------------------------------------------------------------------[m\n[[1;34mINFO[m] [1;32mBUILD SUCCESS[m\n[[1;34mINFO[m] [1m------------------------------------------------------------------------[m\n[[1;34mINFO[m] Total time:  11.103 s\n[[1;34mINFO[m] Finished at: 2021-04-01T02:16:36Z\n[[1;34mINFO[m] [1m------------------------------------------------------------------------[m\n', '47390', '', '1', '2021-04-01 02:16:22');
INSERT INTO `project_bulid` VALUES ('3', 'jiaparts-wxsdk.jar', '72', '2', '4', '代码更新成功，svn版本号：47391 [[1;34mINFO[m] Scanning for projects...\n[[1;33mWARNING[m] \n[[1;33mWARNING[m] Some problems were encountered while building the effective model for com.jiaparts:jiaparts-wxsdk:jar:0.0.1-SNAPSHOT\n[[1;33mWARNING[m] \'build.plugins.plugin.version\' for org.apache.maven.plugins:maven-compiler-plugin is missing. @ line 102, column 12\n[[1;33mWARNING[m] \n[[1;33mWARNING[m] It is highly recommended to fix these problems because they threaten the stability of your build.\n[[1;33mWARNING[m] \n[[1;33mWARNING[m] For this reason, future Maven versions might no longer support building such malformed projects.\n[[1;33mWARNING[m] \n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--------------------< [0;36mcom.jiaparts:jiaparts-wxsdk[0;1m >---------------------[m\n[[1;34mINFO[m] [1mBuilding jiaparts-wxsdk 0.0.1-SNAPSHOT[m\n[[1;34mINFO[m] [1m--------------------------------[ jar ]---------------------------------[m\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-clean-plugin:2.5:clean[m [1m(default-clean)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Deleting /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-resources-plugin:2.6:resources[m [1m(default-resources)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Using \'UTF-8\' encoding to copy filtered resources.\n[[1;34mINFO[m] Copying 2 resources\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-compiler-plugin:3.1:compile[m [1m(default-compile)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Changes detected - recompiling the module!\n[[1;34mINFO[m] Compiling 47 source files to /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/classes\n[[1;33mWARNING[m] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/UploadImgResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[[1;33mWARNING[m] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/AddMaterialResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[[1;33mWARNING[m] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/GetMaterialResp.java:[8,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[[1;33mWARNING[m] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/AddNewsResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-resources-plugin:2.6:testResources[m [1m(default-testResources)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Using \'UTF-8\' encoding to copy filtered resources.\n[[1;34mINFO[m] skip non existing resourceDirectory /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/test/resources\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-compiler-plugin:3.1:testCompile[m [1m(default-testCompile)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Changes detected - recompiling the module!\n[[1;34mINFO[m] Compiling 1 source file to /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/test-classes\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-surefire-plugin:2.18.1:test[m [1m(default-test)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Tests are skipped.\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-jar-plugin:2.4:jar[m [1m(default-jar)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Building jar: /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-install-plugin:2.4:install[m [1m(default-install)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Installing /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar to /home/test_release/.m2/repository/com/jiaparts/jiaparts-wxsdk/0.0.1-SNAPSHOT/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar\n[[1;34mINFO[m] Installing /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/pom.xml to /home/test_release/.m2/repository/com/jiaparts/jiaparts-wxsdk/0.0.1-SNAPSHOT/jiaparts-wxsdk-0.0.1-SNAPSHOT.pom\n[[1;34mINFO[m] [1m------------------------------------------------------------------------[m\n[[1;34mINFO[m] [1;32mBUILD SUCCESS[m\n[[1;34mINFO[m] [1m------------------------------------------------------------------------[m\n[[1;34mINFO[m] Total time:  10.302 s\n[[1;34mINFO[m] Finished at: 2021-04-01T02:26:18Z\n[[1;34mINFO[m] [1m------------------------------------------------------------------------[m\n', '47391', '', '1', '2021-04-01 02:26:04');
INSERT INTO `project_bulid` VALUES ('4', 'jiaparts-wxsdk.jar', '72', '2', '3', '代码更新成功，svn版本号：47391', '47391', '', '1', '2021-04-01 02:31:29');
INSERT INTO `project_bulid` VALUES ('5', 'jiaparts-wxsdk.jar', '72', '2', '3', '代码更新成功，svn版本号：47391', '47391', '', '1', '2021-04-01 02:35:09');
INSERT INTO `project_bulid` VALUES ('6', 'jiaparts-wxsdk.jar', '72', '2', '4', '代码更新成功，svn版本号：47391 [\'[\\x1b[1;34mINFO\\x1b[m] Scanning for projects...\\n\', \'[\\x1b[1;33mWARNING\\x1b[m] \\n\', \'[\\x1b[1;33mWARNING\\x1b[m] Some problems were encountered while building the effective model for com.jiaparts:jiaparts-wxsdk:jar:0.0.1-SNAPSHOT\\n\', \"[\\x1b[1;33mWARNING\\x1b[m] \'build.plugins.plugin.version\' for org.apache.maven.plugins:maven-compiler-plugin is missing. @ line 102, column 12\\n\", \'[\\x1b[1;33mWARNING\\x1b[m] \\n\', \'[\\x1b[1;33mWARNING\\x1b[m] It is highly recommended to fix these problems because they threaten the stability of your build.\\n\', \'[\\x1b[1;33mWARNING\\x1b[m] \\n\', \'[\\x1b[1;33mWARNING\\x1b[m] For this reason, future Maven versions might no longer support building such malformed projects.\\n\', \'[\\x1b[1;33mWARNING\\x1b[m] \\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\x1b[1m--------------------< \\x1b[0;36mcom.jiaparts:jiaparts-wxsdk\\x1b[0;1m >---------------------\\x1b[m\\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\x1b[1mBuilding jiaparts-wxsdk 0.0.1-SNAPSHOT\\x1b[m\\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\x1b[1m--------------------------------[ jar ]---------------------------------\\x1b[m\\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\x1b[1m--- \\x1b[0;32mmaven-clean-plugin:2.5:clean\\x1b[m \\x1b[1m(default-clean)\\x1b[m @ \\x1b[36mjiaparts-wxsdk\\x1b[0;1m ---\\x1b[m\\n\', \'[\\x1b[1;34mINFO\\x1b[m] Deleting /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target\\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\x1b[1m--- \\x1b[0;32mmaven-resources-plugin:2.6:resources\\x1b[m \\x1b[1m(default-resources)\\x1b[m @ \\x1b[36mjiaparts-wxsdk\\x1b[0;1m ---\\x1b[m\\n\', \"[\\x1b[1;34mINFO\\x1b[m] Using \'UTF-8\' encoding to copy filtered resources.\\n\", \'[\\x1b[1;34mINFO\\x1b[m] Copying 2 resources\\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\x1b[1m--- \\x1b[0;32mmaven-compiler-plugin:3.1:compile\\x1b[m \\x1b[1m(default-compile)\\x1b[m @ \\x1b[36mjiaparts-wxsdk\\x1b[0;1m ---\\x1b[m\\n\', \'[\\x1b[1;34mINFO\\x1b[m] Changes detected - recompiling the module!\\n\', \'[\\x1b[1;34mINFO\\x1b[m] Compiling 47 source files to /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/classes\\n\', \"[\\x1b[1;33mWARNING\\x1b[m] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/UploadImgResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\\n\", \"[\\x1b[1;33mWARNING\\x1b[m] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/AddMaterialResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\\n\", \"[\\x1b[1;33mWARNING\\x1b[m] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/GetMaterialResp.java:[8,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\\n\", \"[\\x1b[1;33mWARNING\\x1b[m] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/AddNewsResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\\n\", \'[\\x1b[1;34mINFO\\x1b[m] \\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\x1b[1m--- \\x1b[0;32mmaven-resources-plugin:2.6:testResources\\x1b[m \\x1b[1m(default-testResources)\\x1b[m @ \\x1b[36mjiaparts-wxsdk\\x1b[0;1m ---\\x1b[m\\n\', \"[\\x1b[1;34mINFO\\x1b[m] Using \'UTF-8\' encoding to copy filtered resources.\\n\", \'[\\x1b[1;34mINFO\\x1b[m] skip non existing resourceDirectory /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/test/resources\\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\x1b[1m--- \\x1b[0;32mmaven-compiler-plugin:3.1:testCompile\\x1b[m \\x1b[1m(default-testCompile)\\x1b[m @ \\x1b[36mjiaparts-wxsdk\\x1b[0;1m ---\\x1b[m\\n\', \'[\\x1b[1;34mINFO\\x1b[m] Changes detected - recompiling the module!\\n\', \'[\\x1b[1;34mINFO\\x1b[m] Compiling 1 source file to /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/test-classes\\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\x1b[1m--- \\x1b[0;32mmaven-surefire-plugin:2.18.1:test\\x1b[m \\x1b[1m(default-test)\\x1b[m @ \\x1b[36mjiaparts-wxsdk\\x1b[0;1m ---\\x1b[m\\n\', \'[\\x1b[1;34mINFO\\x1b[m] Tests are skipped.\\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\x1b[1m--- \\x1b[0;32mmaven-jar-plugin:2.4:jar\\x1b[m \\x1b[1m(default-jar)\\x1b[m @ \\x1b[36mjiaparts-wxsdk\\x1b[0;1m ---\\x1b[m\\n\', \'[\\x1b[1;34mINFO\\x1b[m] Building jar: /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar\\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\x1b[1m--- \\x1b[0;32mmaven-install-plugin:2.4:install\\x1b[m \\x1b[1m(default-install)\\x1b[m @ \\x1b[36mjiaparts-wxsdk\\x1b[0;1m ---\\x1b[m\\n\', \'[\\x1b[1;34mINFO\\x1b[m] Installing /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar to /home/test_release/.m2/repository/com/jiaparts/jiaparts-wxsdk/0.0.1-SNAPSHOT/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar\\n\', \'[\\x1b[1;34mINFO\\x1b[m] Installing /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/pom.xml to /home/test_release/.m2/repository/com/jiaparts/jiaparts-wxsdk/0.0.1-SNAPSHOT/jiaparts-wxsdk-0.0.1-SNAPSHOT.pom\\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\x1b[1m------------------------------------------------------------------------\\x1b[m\\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\x1b[1;32mBUILD SUCCESS\\x1b[m\\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\x1b[1m------------------------------------------------------------------------\\x1b[m\\n\', \'[\\x1b[1;34mINFO\\x1b[m] Total time:  10.162 s\\n\', \'[\\x1b[1;34mINFO\\x1b[m] Finished at: 2021-04-01T02:37:52Z\\n\', \'[\\x1b[1;34mINFO\\x1b[m] \\x1b[1m------------------------------------------------------------------------\\x1b[m\\n\']', '47391', '', '1', '2021-04-01 02:37:39');
INSERT INTO `project_bulid` VALUES ('7', 'jiaparts-wxsdk.jar', '72', '2', '4', '代码更新成功，svn版本号：47391 [[1;34mINFO[m] Scanning for projects...\n[[1;33mWARNING[m] \n[[1;33mWARNING[m] Some problems were encountered while building the effective model for com.jiaparts:jiaparts-wxsdk:jar:0.0.1-SNAPSHOT\n[[1;33mWARNING[m] \'build.plugins.plugin.version\' for org.apache.maven.plugins:maven-compiler-plugin is missing. @ line 102, column 12\n[[1;33mWARNING[m] \n[[1;33mWARNING[m] It is highly recommended to fix these problems because they threaten the stability of your build.\n[[1;33mWARNING[m] \n[[1;33mWARNING[m] For this reason, future Maven versions might no longer support building such malformed projects.\n[[1;33mWARNING[m] \n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--------------------< [0;36mcom.jiaparts:jiaparts-wxsdk[0;1m >---------------------[m\n[[1;34mINFO[m] [1mBuilding jiaparts-wxsdk 0.0.1-SNAPSHOT[m\n[[1;34mINFO[m] [1m--------------------------------[ jar ]---------------------------------[m\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-clean-plugin:2.5:clean[m [1m(default-clean)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Deleting /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-resources-plugin:2.6:resources[m [1m(default-resources)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Using \'UTF-8\' encoding to copy filtered resources.\n[[1;34mINFO[m] Copying 2 resources\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-compiler-plugin:3.1:compile[m [1m(default-compile)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Changes detected - recompiling the module!\n[[1;34mINFO[m] Compiling 47 source files to /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/classes\n[[1;33mWARNING[m] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/UploadImgResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[[1;33mWARNING[m] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/AddMaterialResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[[1;33mWARNING[m] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/GetMaterialResp.java:[8,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[[1;33mWARNING[m] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/AddNewsResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-resources-plugin:2.6:testResources[m [1m(default-testResources)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Using \'UTF-8\' encoding to copy filtered resources.\n[[1;34mINFO[m] skip non existing resourceDirectory /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/test/resources\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-compiler-plugin:3.1:testCompile[m [1m(default-testCompile)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Changes detected - recompiling the module!\n[[1;34mINFO[m] Compiling 1 source file to /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/test-classes\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-surefire-plugin:2.18.1:test[m [1m(default-test)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Tests are skipped.\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-jar-plugin:2.4:jar[m [1m(default-jar)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Building jar: /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar\n[[1;34mINFO[m] \n[[1;34mINFO[m] [1m--- [0;32mmaven-install-plugin:2.4:install[m [1m(default-install)[m @ [36mjiaparts-wxsdk[0;1m ---[m\n[[1;34mINFO[m] Installing /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar to /home/test_release/.m2/repository/com/jiaparts/jiaparts-wxsdk/0.0.1-SNAPSHOT/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar\n[[1;34mINFO[m] Installing /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/pom.xml to /home/test_release/.m2/repository/com/jiaparts/jiaparts-wxsdk/0.0.1-SNAPSHOT/jiaparts-wxsdk-0.0.1-SNAPSHOT.pom\n[[1;34mINFO[m] [1m------------------------------------------------------------------------[m\n[[1;34mINFO[m] [1;32mBUILD SUCCESS[m\n[[1;34mINFO[m] [1m------------------------------------------------------------------------[m\n[[1;34mINFO[m] Total time:  10.304 s\n[[1;34mINFO[m] Finished at: 2021-04-01T02:40:12Z\n[[1;34mINFO[m] [1m------------------------------------------------------------------------[m\n', '47391', '', '1', '2021-04-01 02:39:59');
INSERT INTO `project_bulid` VALUES ('8', 'jiaparts-wxsdk.jar', '72', '2', '4', '代码更新成功，svn版本号：47391 [INFO] Scanning for projects...\n[[1;33mWARNING] \n[[1;33mWARNING] Some problems were encountered while building the effective model for com.jiaparts:jiaparts-wxsdk:jar:0.0.1-SNAPSHOT\n[[1;33mWARNING] \'build.plugins.plugin.version\' for org.apache.maven.plugins:maven-compiler-plugin is missing. @ line 102, column 12\n[[1;33mWARNING] \n[[1;33mWARNING] It is highly recommended to fix these problems because they threaten the stability of your build.\n[[1;33mWARNING] \n[[1;33mWARNING] For this reason, future Maven versions might no longer support building such malformed projects.\n[[1;33mWARNING] \n[INFO] \n[INFO] [1m--------------------< [0;36mcom.jiaparts:jiaparts-wxsdk[0;1m >---------------------\n[INFO] [1mBuilding jiaparts-wxsdk 0.0.1-SNAPSHOT\n[INFO] [1m--------------------------------[ jar ]---------------------------------\n[INFO] \n[INFO] [1m--- [0;32mmaven-clean-plugin:2.5:clean [1m(default-clean) @ [36mjiaparts-wxsdk[0;1m ---\n[INFO] Deleting /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target\n[INFO] \n[INFO] [1m--- [0;32mmaven-resources-plugin:2.6:resources [1m(default-resources) @ [36mjiaparts-wxsdk[0;1m ---\n[INFO] Using \'UTF-8\' encoding to copy filtered resources.\n[INFO] Copying 2 resources\n[INFO] \n[INFO] [1m--- [0;32mmaven-compiler-plugin:3.1:compile [1m(default-compile) @ [36mjiaparts-wxsdk[0;1m ---\n[INFO] Changes detected - recompiling the module!\n[INFO] Compiling 47 source files to /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/classes\n[[1;33mWARNING] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/UploadImgResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[[1;33mWARNING] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/AddMaterialResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[[1;33mWARNING] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/GetMaterialResp.java:[8,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[[1;33mWARNING] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/AddNewsResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[INFO] \n[INFO] [1m--- [0;32mmaven-resources-plugin:2.6:testResources [1m(default-testResources) @ [36mjiaparts-wxsdk[0;1m ---\n[INFO] Using \'UTF-8\' encoding to copy filtered resources.\n[INFO] skip non existing resourceDirectory /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/test/resources\n[INFO] \n[INFO] [1m--- [0;32mmaven-compiler-plugin:3.1:testCompile [1m(default-testCompile) @ [36mjiaparts-wxsdk[0;1m ---\n[INFO] Changes detected - recompiling the module!\n[INFO] Compiling 1 source file to /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/test-classes\n[INFO] \n[INFO] [1m--- [0;32mmaven-surefire-plugin:2.18.1:test [1m(default-test) @ [36mjiaparts-wxsdk[0;1m ---\n[INFO] Tests are skipped.\n[INFO] \n[INFO] [1m--- [0;32mmaven-jar-plugin:2.4:jar [1m(default-jar) @ [36mjiaparts-wxsdk[0;1m ---\n[INFO] Building jar: /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar\n[INFO] \n[INFO] [1m--- [0;32mmaven-install-plugin:2.4:install [1m(default-install) @ [36mjiaparts-wxsdk[0;1m ---\n[INFO] Installing /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar to /home/test_release/.m2/repository/com/jiaparts/jiaparts-wxsdk/0.0.1-SNAPSHOT/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar\n[INFO] Installing /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/pom.xml to /home/test_release/.m2/repository/com/jiaparts/jiaparts-wxsdk/0.0.1-SNAPSHOT/jiaparts-wxsdk-0.0.1-SNAPSHOT.pom\n[INFO] [1m------------------------------------------------------------------------\n[INFO] [1;32mBUILD SUCCESS\n[INFO] [1m------------------------------------------------------------------------\n[INFO] Total time:  11.456 s\n[INFO] Finished at: 2021-04-01T02:44:20Z\n[INFO] [1m------------------------------------------------------------------------\n', '47391', '', '1', '2021-04-01 02:44:05');
INSERT INTO `project_bulid` VALUES ('9', 'jiaparts-wxsdk.jar', '72', '2', '4', '代码更新成功，svn版本号：47392 [INFO] Scanning for projects...\n[WARNING] \n[WARNING] Some problems were encountered while building the effective model for com.jiaparts:jiaparts-wxsdk:jar:0.0.1-SNAPSHOT\n[WARNING] \'build.plugins.plugin.version\' for org.apache.maven.plugins:maven-compiler-plugin is missing. @ line 102, column 12\n[WARNING] \n[WARNING] It is highly recommended to fix these problems because they threaten the stability of your build.\n[WARNING] \n[WARNING] For this reason, future Maven versions might no longer support building such malformed projects.\n[WARNING] \n[INFO] \n[INFO] [1m--------------------< [0;36mcom.jiaparts:jiaparts-wxsdk[0;1m >---------------------\n[INFO] [1mBuilding jiaparts-wxsdk 0.0.1-SNAPSHOT\n[INFO] [1m--------------------------------[ jar ]---------------------------------\n[INFO] \n[INFO] [1m--- [0;32mmaven-clean-plugin:2.5:clean [1m(default-clean) @ [36mjiaparts-wxsdk[0;1m ---\n[INFO] Deleting /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target\n[INFO] \n[INFO] [1m--- [0;32mmaven-resources-plugin:2.6:resources [1m(default-resources) @ [36mjiaparts-wxsdk[0;1m ---\n[INFO] Using \'UTF-8\' encoding to copy filtered resources.\n[INFO] Copying 2 resources\n[INFO] \n[INFO] [1m--- [0;32mmaven-compiler-plugin:3.1:compile [1m(default-compile) @ [36mjiaparts-wxsdk[0;1m ---\n[INFO] Changes detected - recompiling the module!\n[INFO] Compiling 47 source files to /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/classes\n[WARNING] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/UploadImgResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[WARNING] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/AddMaterialResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[WARNING] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/GetMaterialResp.java:[8,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[WARNING] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/AddNewsResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[INFO] \n[INFO] [1m--- [0;32mmaven-resources-plugin:2.6:testResources [1m(default-testResources) @ [36mjiaparts-wxsdk[0;1m ---\n[INFO] Using \'UTF-8\' encoding to copy filtered resources.\n[INFO] skip non existing resourceDirectory /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/test/resources\n[INFO] \n[INFO] [1m--- [0;32mmaven-compiler-plugin:3.1:testCompile [1m(default-testCompile) @ [36mjiaparts-wxsdk[0;1m ---\n[INFO] Changes detected - recompiling the module!\n[INFO] Compiling 1 source file to /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/test-classes\n[INFO] \n[INFO] [1m--- [0;32mmaven-surefire-plugin:2.18.1:test [1m(default-test) @ [36mjiaparts-wxsdk[0;1m ---\n[INFO] Tests are skipped.\n[INFO] \n[INFO] [1m--- [0;32mmaven-jar-plugin:2.4:jar [1m(default-jar) @ [36mjiaparts-wxsdk[0;1m ---\n[INFO] Building jar: /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar\n[INFO] \n[INFO] [1m--- [0;32mmaven-install-plugin:2.4:install [1m(default-install) @ [36mjiaparts-wxsdk[0;1m ---\n[INFO] Installing /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar to /home/test_release/.m2/repository/com/jiaparts/jiaparts-wxsdk/0.0.1-SNAPSHOT/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar\n[INFO] Installing /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/pom.xml to /home/test_release/.m2/repository/com/jiaparts/jiaparts-wxsdk/0.0.1-SNAPSHOT/jiaparts-wxsdk-0.0.1-SNAPSHOT.pom\n[INFO] [1m------------------------------------------------------------------------\n[INFO] [1;32mBUILD SUCCESS\n[INFO] [1m------------------------------------------------------------------------\n[INFO] Total time:  10.082 s\n[INFO] Finished at: 2021-04-01T02:46:59Z\n[INFO] [1m------------------------------------------------------------------------\n', '47392', '', '1', '2021-04-01 02:46:46');
INSERT INTO `project_bulid` VALUES ('10', 'jiaparts-wxsdk.jar', '72', '2', '4', '代码更新成功，svn版本号：47392 [INFO] Scanning for projects...\n[WARNING] \n[WARNING] Some problems were encountered while building the effective model for com.jiaparts:jiaparts-wxsdk:jar:0.0.1-SNAPSHOT\n[WARNING] \'build.plugins.plugin.version\' for org.apache.maven.plugins:maven-compiler-plugin is missing. @ line 102, column 12\n[WARNING] \n[WARNING] It is highly recommended to fix these problems because they threaten the stability of your build.\n[WARNING] \n[WARNING] For this reason, future Maven versions might no longer support building such malformed projects.\n[WARNING] \n[INFO] \n[INFO] --------------------< [0;36mcom.jiaparts:jiaparts-wxsdk >---------------------\n[INFO] Building jiaparts-wxsdk 0.0.1-SNAPSHOT\n[INFO] --------------------------------[ jar ]---------------------------------\n[INFO] \n[INFO] --- [0;32mmaven-clean-plugin:2.5:clean (default-clean) @ jiaparts-wxsdk ---\n[INFO] Deleting /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target\n[INFO] \n[INFO] --- [0;32mmaven-resources-plugin:2.6:resources (default-resources) @ jiaparts-wxsdk ---\n[INFO] Using \'UTF-8\' encoding to copy filtered resources.\n[INFO] Copying 2 resources\n[INFO] \n[INFO] --- [0;32mmaven-compiler-plugin:3.1:compile (default-compile) @ jiaparts-wxsdk ---\n[INFO] Changes detected - recompiling the module!\n[INFO] Compiling 47 source files to /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/classes\n[WARNING] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/UploadImgResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[WARNING] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/AddMaterialResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[WARNING] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/GetMaterialResp.java:[8,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[WARNING] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/AddNewsResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[INFO] \n[INFO] --- [0;32mmaven-resources-plugin:2.6:testResources (default-testResources) @ jiaparts-wxsdk ---\n[INFO] Using \'UTF-8\' encoding to copy filtered resources.\n[INFO] skip non existing resourceDirectory /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/test/resources\n[INFO] \n[INFO] --- [0;32mmaven-compiler-plugin:3.1:testCompile (default-testCompile) @ jiaparts-wxsdk ---\n[INFO] Changes detected - recompiling the module!\n[INFO] Compiling 1 source file to /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/test-classes\n[INFO] \n[INFO] --- [0;32mmaven-surefire-plugin:2.18.1:test (default-test) @ jiaparts-wxsdk ---\n[INFO] Tests are skipped.\n[INFO] \n[INFO] --- [0;32mmaven-jar-plugin:2.4:jar (default-jar) @ jiaparts-wxsdk ---\n[INFO] Building jar: /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar\n[INFO] \n[INFO] --- [0;32mmaven-install-plugin:2.4:install (default-install) @ jiaparts-wxsdk ---\n[INFO] Installing /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar to /home/test_release/.m2/repository/com/jiaparts/jiaparts-wxsdk/0.0.1-SNAPSHOT/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar\n[INFO] Installing /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/pom.xml to /home/test_release/.m2/repository/com/jiaparts/jiaparts-wxsdk/0.0.1-SNAPSHOT/jiaparts-wxsdk-0.0.1-SNAPSHOT.pom\n[INFO] ------------------------------------------------------------------------\n[INFO] [1;32mBUILD SUCCESS\n[INFO] ------------------------------------------------------------------------\n[INFO] Total time:  9.985 s\n[INFO] Finished at: 2021-04-01T02:49:53Z\n[INFO] ------------------------------------------------------------------------\n', '47392', '', '1', '2021-04-01 02:49:40');
INSERT INTO `project_bulid` VALUES ('11', 'jiaparts-wxsdk.jar', '72', '2', '4', '代码更新成功，svn版本号：47394 [INFO] Scanning for projects...\n[WARNING] \n[WARNING] Some problems were encountered while building the effective model for com.jiaparts:jiaparts-wxsdk:jar:0.0.1-SNAPSHOT\n[WARNING] \'build.plugins.plugin.version\' for org.apache.maven.plugins:maven-compiler-plugin is missing. @ line 102, column 12\n[WARNING] \n[WARNING] It is highly recommended to fix these problems because they threaten the stability of your build.\n[WARNING] \n[WARNING] For this reason, future Maven versions might no longer support building such malformed projects.\n[WARNING] \n[INFO] \n[INFO] --------------------< com.jiaparts:jiaparts-wxsdk >---------------------\n[INFO] Building jiaparts-wxsdk 0.0.1-SNAPSHOT\n[INFO] --------------------------------[ jar ]---------------------------------\n[INFO] \n[INFO] --- maven-clean-plugin:2.5:clean (default-clean) @ jiaparts-wxsdk ---\n[INFO] Deleting /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target\n[INFO] \n[INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ jiaparts-wxsdk ---\n[INFO] Using \'UTF-8\' encoding to copy filtered resources.\n[INFO] Copying 2 resources\n[INFO] \n[INFO] --- maven-compiler-plugin:3.1:compile (default-compile) @ jiaparts-wxsdk ---\n[INFO] Changes detected - recompiling the module!\n[INFO] Compiling 47 source files to /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/classes\n[WARNING] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/UploadImgResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[WARNING] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/AddMaterialResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[WARNING] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/GetMaterialResp.java:[8,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[WARNING] /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/main/java/com/jiaparts/wxsdk/model/AddNewsResp.java:[5,1] Generating equals/hashCode implementation but without a call to superclass, even though this class does not extend java.lang.Object. If this is intentional, add \'@EqualsAndHashCode(callSuper=false)\' to your type.\n[INFO] \n[INFO] --- maven-resources-plugin:2.6:testResources (default-testResources) @ jiaparts-wxsdk ---\n[INFO] Using \'UTF-8\' encoding to copy filtered resources.\n[INFO] skip non existing resourceDirectory /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/src/test/resources\n[INFO] \n[INFO] --- maven-compiler-plugin:3.1:testCompile (default-testCompile) @ jiaparts-wxsdk ---\n[INFO] Changes detected - recompiling the module!\n[INFO] Compiling 1 source file to /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/test-classes\n[INFO] \n[INFO] --- maven-surefire-plugin:2.18.1:test (default-test) @ jiaparts-wxsdk ---\n[INFO] Tests are skipped.\n[INFO] \n[INFO] --- maven-jar-plugin:2.4:jar (default-jar) @ jiaparts-wxsdk ---\n[INFO] Building jar: /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar\n[INFO] \n[INFO] --- maven-install-plugin:2.4:install (default-install) @ jiaparts-wxsdk ---\n[INFO] Installing /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/target/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar to /home/test_release/.m2/repository/com/jiaparts/jiaparts-wxsdk/0.0.1-SNAPSHOT/jiaparts-wxsdk-0.0.1-SNAPSHOT.jar\n[INFO] Installing /jpdata/test_workspace/jiaparts-wxsdk/jiaparts-wxsdk/pom.xml to /home/test_release/.m2/repository/com/jiaparts/jiaparts-wxsdk/0.0.1-SNAPSHOT/jiaparts-wxsdk-0.0.1-SNAPSHOT.pom\n[INFO] ------------------------------------------------------------------------\n[INFO] BUILD SUCCESS\n[INFO] ------------------------------------------------------------------------\n[INFO] Total time:  9.725 s\n[INFO] Finished at: 2021-04-01T02:53:51Z\n[INFO] ------------------------------------------------------------------------\n', '47394', '', '1', '2021-04-01 02:53:38');

-- ----------------------------
-- Table structure for project_environment
-- ----------------------------
DROP TABLE IF EXISTS `project_environment`;
CREATE TABLE `project_environment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) NOT NULL COMMENT 'project_id',
  `environment_id` int(11) NOT NULL COMMENT 'environment_id',
  `dir_publish` varchar(255) DEFAULT NULL COMMENT '应用发布目录',
  `log_name` varchar(255) DEFAULT NULL COMMENT '日志文件名',
  `log_type` int(2) DEFAULT '1' COMMENT '日志名称类型 1:自定义 2:系统规则',
  `log_path` varchar(255) DEFAULT NULL COMMENT '日志目录',
  `podname` varchar(255) DEFAULT NULL COMMENT '容器名称',
  `file_conf` varchar(255) DEFAULT NULL COMMENT '配置文件名',
  `pod_log_path` varchar(255) DEFAULT NULL COMMENT '容器里日志路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='服务器所有组件配置表';

-- ----------------------------
-- Records of project_environment
-- ----------------------------
INSERT INTO `project_environment` VALUES ('11', '21', '1', '/jpdata/kubernetes/unl/unl-jp-pjj-core/webapps/', 'catalina.out', '1', '/jpdata/kubernetes/logs/unl/unl-jp-pjj-core', 'unl-jp-pjj-core', 'application.yml', '/usr/local/tomcat/logs');
INSERT INTO `project_environment` VALUES ('13', '38', '1', '/jpdata/kubernetes/unl/jp-szt-web-1/nginx/www/', null, null, '', '', 'constant.php', '');
INSERT INTO `project_environment` VALUES ('14', '39', '1', '/jpdata/kubernetes/unl/jp-mml-syj-core/webapps', 'catalina.out', '1', '/jpdata/kubernetes/logs/unl/jp-mml-syj-core', 'jp-mml-syj-core', 'application.yml', '/usr/local/tomcat/logs');
INSERT INTO `project_environment` VALUES ('15', '40', '1', '/jpdata/kubernetes/unl/jp-mml-syj-core-2/webapps', 'catalina.out', '1', '/jpdata/kubernetes/logs/unl/jp-mml-syj-core-2', 'jp-mml-syj-core-2', 'application.yml', '/usr/local/tomcat/logs');
INSERT INTO `project_environment` VALUES ('16', '43', '1', '/jpdata/kubernetes/unl/jp-mmlbk-web/www', null, null, '', '', '', '');
INSERT INTO `project_environment` VALUES ('17', '41', '1', '/jpdata/kubernetes/unl/jp-slwWeb-web-1/jp-slwWeb-web', null, null, '', 'jp-slw-web-web-1', '', null);
INSERT INTO `project_environment` VALUES ('18', '44', '1', '/jpdata/kubernetes/unl/jp-pjj-web-1/nginx/www/', null, null, '', '', '', null);
INSERT INTO `project_environment` VALUES ('19', '42', '1', '/jpdata/kubernetes/unl/jp-syjShare-web-1/jp-syjShare-web', null, null, '', 'jp-syjshare-web-1', '', null);
INSERT INTO `project_environment` VALUES ('20', '45', '1', '/jpdata/kubernetes/unl/jp-fzt-wx-web-1/jp-fztWx-web', null, null, '', 'jp-fzt-wx-web-1', '', null);
INSERT INTO `project_environment` VALUES ('21', '46', '1', '/jpdata/kubernetes/unl/jp-oc-jsj-core-2/webapps', 'catalina.out', '1', '/jpdata/kubernetes/logs/unl/jp-oc-jsj-core-2', 'jp-oc-jsj-core-2', 'application.yml', '/usr/local/tomcat/logs');
INSERT INTO `project_environment` VALUES ('22', '47', '1', '/jpdata/kubernetes/unl/jp-syj-web/nginx/www', null, null, '', 'jp-syj-web', '', null);
INSERT INTO `project_environment` VALUES ('23', '48', '1', '/jpdata/kubernetes/unl/vue-server/nginx/www', null, null, '', 'jp-vue', '', null);
INSERT INTO `project_environment` VALUES ('24', '49', '1', '/jpdata/kubernetes/guanwang/nginx/www', null, null, '', 'shengyj-nginx', '', null);
INSERT INTO `project_environment` VALUES ('25', '50', '1', '/jpdata/kubernetes/unl/jp-mml-web/nginx/www', null, null, '', 'jp-mml-web', '', null);
INSERT INTO `project_environment` VALUES ('26', '51', '1', '/jpdata/kubernetes/pqs/nginx/www', null, null, '', '', '', null);
INSERT INTO `project_environment` VALUES ('27', '52', '1', '/jpdata/kubernetes/unl/unl-jp-wx-api/webapps', 'catalina.out', '1', '/jpdata/kubernetes/logs/unl/unl-jp-wx-api', 'unl-jp-wx-api', 'application.yml', '/usr/local/tomcat/logs');
INSERT INTO `project_environment` VALUES ('28', '53', '1', '/jpdata/kubernetes/unl/jp-backend-core-1/webapps', 'catalina.out', '1', '/jpdata/kubernetes/logs/unl/jp-backend-core-1', 'jp-backend-core-1', 'application.yml', '/usr/local/tomcat/logs');
INSERT INTO `project_environment` VALUES ('29', '54', '1', '/jpdata/kubernetes/unl/jp-mml-jsj-core-1/webapps', 'catalina.out', '1', '/jpdata/kubernetes/logs/unl/jp-mml-jsj-core-1', 'jp-mml-jsj-core-1', 'application.yml', '/usr/local/tomcat/logs');
INSERT INTO `project_environment` VALUES ('30', '55', '1', '/jpdata/kubernetes/unl/jp-oc-jsj-core-1/webapps', 'catalina.out', '1', '/jpdata/kubernetes/logs/unl/jp-oc-jsj-core-1', 'jp-oc-jsj-core-1', 'application.yml', '/usr/local/tomcat/logs');
INSERT INTO `project_environment` VALUES ('31', '56', '1', '/jpdata/kubernetes/unl/jp-xgj-core/webapps', 'catalina.out', '1', '/jpdata/kubernetes/logs/unl/jp-xgj-core', 'jp-xgj-core', 'application.yml', '/usr/local/tomcat/logs');
INSERT INTO `project_environment` VALUES ('32', '57', '1', '/jpdata/kubernetes/pqs/qpscore/webapps', 'catalina.out', '1', '/jpdata/kubernetes/logs/pqs/qpscore', 'pqs-core', 'application.yml', '/usr/local/tomcat/logs');
INSERT INTO `project_environment` VALUES ('33', '58', '1', '/jpdata/kubernetes/unl/jp-jsjjm-web-1/nginx/www/', null, null, '', '', '', null);
INSERT INTO `project_environment` VALUES ('34', '59', '1', '/jpdata/kubernetes/unl/unl-support-api/webapps', '', '2', '/jpdata/kubernetes/logs/unl/unl-support-api', 'unl-support-api', '', '/app/tomcat/logs');
INSERT INTO `project_environment` VALUES ('35', '60', '1', '/jpdata/kubernetes/unl/jp-jsc-jm-core-1/webapps/', 'catalina.out', '1', '/jpdata/kubernetes/logs/unl/jp-jsc-jm-core-1', 'jp-jsc-jm-core-1', 'application.yml', '/usr/local/tomcat/logs');
INSERT INTO `project_environment` VALUES ('36', '61', '1', '/jpdata/kubernetes/unl/jp-jsjxz-web-1/nginx/www/', null, null, '', 'jp-jsjxz-web-1', '', null);
INSERT INTO `project_environment` VALUES ('37', '62', '1', '/jpdata/kubernetes/unl/unl-jp-jsc-gw-core/webapps/', 'catalina.out', '1', '/jpdata/kubernetes/logs/unl/unl-jp-jsc-gw-core', 'unl-jp-jsc-gw-core', 'application.yml', '/usr/local/tomcat/logs');
INSERT INTO `project_environment` VALUES ('38', '63', '1', '/jpdata/kubernetes/unl/jp-buyer-wx-web-1/jp-buyerWx-web', null, null, '', 'jp-buyer-wx-web-1', '', null);
INSERT INTO `project_environment` VALUES ('40', '67', '1', '/jpdata/kubernetes/unl/unl-jp-jsc-core/webapps/', 'catalina.out', '1', '/jpdata/kubernetes/logs/unl/unl-jp-jsc-core', 'unl-jp-jsc-core', 'application.yml', '/usr/local/tomcat/logs');
INSERT INTO `project_environment` VALUES ('41', '68', '1', '/jpdata/kubernetes/unl/unl-jp-erp-core/webapps/', 'catalina.out', '1', '/jpdata/kubernetes/logs/unl/unl-jp-erp-core', 'unl-jp-erp-core', 'application.yml', '/usr/local/tomcat/logs');
INSERT INTO `project_environment` VALUES ('42', '69', '1', '/jpdata/kubernetes/unl/jp-fht-wap-web-1/jp-fht-wap-web', null, null, '', 'jp-fht-wap-web-1', '', null);
INSERT INTO `project_environment` VALUES ('43', '71', '1', '/jpdata/kubernetes/unl/jp-wx-web-1/jp-wx-web', null, null, '', 'jp-wx-web-1', '', '/jpdata/logs');
INSERT INTO `project_environment` VALUES ('50', '70', '1', '/jpdata/kubernetes/bns/bnscore/webapps', '', '2', '/jpdata/kubernetes/logs/bns/bnscore', 'bnscore-dm', '', '/app/tomcat/logs');
INSERT INTO `project_environment` VALUES ('51', '73', '1', '/jpdata/kubernetes/sfj/sfjcore/webapps', '', '2', '/jpdata/kubernetes/logs/sfj/sfjcore', 'sfjcore', '', '/app/tomcat/logs');

-- ----------------------------
-- Table structure for project_publish
-- ----------------------------
DROP TABLE IF EXISTS `project_publish`;
CREATE TABLE `project_publish` (
  `id` int(11) NOT NULL COMMENT 'id',
  `version_id` int(11) NOT NULL COMMENT 'version_id',
  `environment_id` int(11) NOT NULL COMMENT 'environment_id',
  `create_uid` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组件发布历史';

-- ----------------------------
-- Records of project_publish
-- ----------------------------

-- ----------------------------
-- Table structure for proversion
-- ----------------------------
DROP TABLE IF EXISTS `proversion`;
CREATE TABLE `proversion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `product_id` int(11) DEFAULT NULL COMMENT 'product_id',
  `version` varchar(11) DEFAULT NULL COMMENT '产品版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='产品版本表';

-- ----------------------------
-- Records of proversion
-- ----------------------------
INSERT INTO `proversion` VALUES ('4', '5', '2.8');
INSERT INTO `proversion` VALUES ('5', '5', '2.9');
INSERT INTO `proversion` VALUES ('6', '10', '3.8.0');
INSERT INTO `proversion` VALUES ('7', '9', '1.2.1');
INSERT INTO `proversion` VALUES ('8', '10', '3.7.5');
INSERT INTO `proversion` VALUES ('9', '10', '3.8.1');
INSERT INTO `proversion` VALUES ('10', '8', '1.5.0');
INSERT INTO `proversion` VALUES ('11', '13', '3.0.0');
INSERT INTO `proversion` VALUES ('12', '9', '1.2.2');
INSERT INTO `proversion` VALUES ('13', '15', '3.8.1');
INSERT INTO `proversion` VALUES ('14', '13', '3.1.0');
INSERT INTO `proversion` VALUES ('15', '10', '3.8.2');
INSERT INTO `proversion` VALUES ('16', '15', '3.8.2');
INSERT INTO `proversion` VALUES ('17', '16', '3.0.6');
INSERT INTO `proversion` VALUES ('18', '8', '1.6.0');
INSERT INTO `proversion` VALUES ('19', '10', '3.8.3');
INSERT INTO `proversion` VALUES ('20', '9', '2.0');
INSERT INTO `proversion` VALUES ('21', '13', '3.1.1');
INSERT INTO `proversion` VALUES ('22', '9', '2.1.0');
INSERT INTO `proversion` VALUES ('23', '10', '3.8.4');
INSERT INTO `proversion` VALUES ('24', '10', '3.8.5');
INSERT INTO `proversion` VALUES ('25', '13', '3.1.2');
INSERT INTO `proversion` VALUES ('26', '9', '2.1.1');
INSERT INTO `proversion` VALUES ('27', '10', '3.8.6');
INSERT INTO `proversion` VALUES ('28', '9', '2.1.2');
INSERT INTO `proversion` VALUES ('29', '16', '3.0.9');
INSERT INTO `proversion` VALUES ('30', '5', '2.10');
INSERT INTO `proversion` VALUES ('31', '10', '3.8.7');
INSERT INTO `proversion` VALUES ('32', '9', '2.2.1');

-- ----------------------------
-- Table structure for proversion_record
-- ----------------------------
DROP TABLE IF EXISTS `proversion_record`;
CREATE TABLE `proversion_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `datenumber` varchar(20) DEFAULT NULL COMMENT '上传序号',
  `proversion_id` int(11) DEFAULT NULL COMMENT 'proversion_id',
  `project_name` varchar(255) DEFAULT NULL COMMENT '组件名称',
  `package_name` varchar(255) DEFAULT NULL COMMENT '包名',
  `package_type` int(10) DEFAULT NULL COMMENT '包类型（1全量，2增量）',
  `ftp_path` varchar(255) DEFAULT NULL COMMENT 'ftp路径',
  `folder_name_num` varchar(255) DEFAULT NULL COMMENT '按日期生成的叠加目录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8 COMMENT='产品版本发布记录';

-- ----------------------------
-- Records of proversion_record
-- ----------------------------
INSERT INTO `proversion_record` VALUES ('75', '3.8.0_20210220_1', '6', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.0/publish/20210220_1/java', null);
INSERT INTO `proversion_record` VALUES ('76', '1.2.1_20210222_1', '7', 'jp-jsjjm-web-1', 'jp-jsjjm-web-1_jm_update_6050_6056_202102221017.tar.gz', '2', '/projects/jiaoshoujia_jm/1.2.1/publish/20210222_1/web', null);
INSERT INTO `proversion_record` VALUES ('77', '2.8_20210224_1', '4', 'jp-szt-web-1', 'jp-szt-web-1_szt_update_616_618_202102231602.tar.gz', '2', '/projects/piaojujia/2.8/publish/20210224_1/web', null);
INSERT INTO `proversion_record` VALUES ('78', '2.8_20210224_1', '4', 'jp-pjj-core-1', 'jp-pjj-core-1.war', '1', '/projects/piaojujia/2.8/publish/20210224_1/java', null);
INSERT INTO `proversion_record` VALUES ('79', '3.7.5_20210224_1', '8', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1_update_20210224_04.zip', '2', '/projects/jiaoshoujia_pt//3.7.5/publish/20210224_1/java', null);
INSERT INTO `proversion_record` VALUES ('80', '3.8.0_20210226_1', '6', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.0/publish/20210226_1/java', null);
INSERT INTO `proversion_record` VALUES ('81', '3.8.0_20210226_1', '6', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_6040_6081_202102261041.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.0/publish/20210226_1/web', null);
INSERT INTO `proversion_record` VALUES ('82', '3.8.0_20210226_1', '6', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_jkb_update_5839_6079_202102260949.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.0/publish/20210226_1/web', null);
INSERT INTO `proversion_record` VALUES ('83', '2.9_20210226_1', '5', 'jp-szt-web-1', 'jp-szt-web-1_php_update_609_620_202102260932.tar.gz', '2', '/projects/piaojujia/2.9/publish/20210226_1/web', null);
INSERT INTO `proversion_record` VALUES ('84', '2.9_20210226_1', '5', 'jp-szt-web-1', 'jp-szt-web-1_jxc_update_616_621_202102261346.tar.gz', '2', '/projects/piaojujia/2.9/publish/20210226_1/web', null);
INSERT INTO `proversion_record` VALUES ('85', '3.8.0_20210226_2', '6', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.0/publish/20210226_2/java', null);
INSERT INTO `proversion_record` VALUES ('86', '3.8.0_20210226_2', '6', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_6040_6085_202102261357.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.0/publish/20210226_2/web', null);
INSERT INTO `proversion_record` VALUES ('87', '3.8.0_20210226_2', '6', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_jkb_update_5839_6085_202102261358.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.0/publish/20210226_2/web', null);
INSERT INTO `proversion_record` VALUES ('88', '3.8.0_20210226_3', '6', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.0/publish/20210226_3/java', null);
INSERT INTO `proversion_record` VALUES ('89', '3.8.0_20210226_4', '6', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_jkb_update_5839_6086_202102261501.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.0/publish/20210226_4/web', null);
INSERT INTO `proversion_record` VALUES ('90', '3.8.0_20210226_4', '6', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.0/publish/20210226_4/java', null);
INSERT INTO `proversion_record` VALUES ('91', '3.8.0_20210226_4', '6', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_jkb_update_5839_6086_202102261501.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.0/publish/20210226_4/web', null);
INSERT INTO `proversion_record` VALUES ('93', '3.8.0_20210226_5', '6', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_6040_6091_202102261756.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.0/publish/20210226_5/web', null);
INSERT INTO `proversion_record` VALUES ('94', '3.8.0_20210226_5', '6', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_jkb_update_5839_6091_202102261756.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.0/publish/20210226_5/web', null);
INSERT INTO `proversion_record` VALUES ('95', '2.9_20210301_1', '5', 'jp-szt-web-1', 'jp-szt-web-1_jxc_update_616_623_202102261659.tar.gz', '2', '/projects/piaojujia/2.9/publish/20210301_1/web', null);
INSERT INTO `proversion_record` VALUES ('96', '2.9_20210301_2', '5', 'jp-szt-web-1', 'jp-szt-web-1_jxc_update_623_626_202103011658.tar.gz', '2', '/projects/piaojujia/2.9/publish/20210301_2/web', null);
INSERT INTO `proversion_record` VALUES ('97', '3.8.1_20210302_1', '9', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1_update_20210302_01.zip', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210302_1/java', null);
INSERT INTO `proversion_record` VALUES ('98', '1.5.0_20210302_1', '10', 'jp-mml-syj-core-2', 'jp-mml-syj-core-2.war', '1', '/projects/mml_shengyijia/1.5.0/publish/20210302_1/java', null);
INSERT INTO `proversion_record` VALUES ('99', '1.5.0_20210302_1', '10', 'jp-oc-jsj-core-2', 'jp-oc-jsj-core-2.war', '1', '/projects/mml_shengyijia/1.5.0/publish/20210302_1/java', null);
INSERT INTO `proversion_record` VALUES ('100', '3.8.1_20210302_2', '9', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.1/publish/20210302_2/java', null);
INSERT INTO `proversion_record` VALUES ('101', '3.8.1_20210302_2', '9', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_6090_6094_202103011544.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210302_2/web', null);
INSERT INTO `proversion_record` VALUES ('102', '3.8.1_20210302_2', '9', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_jkb_update_6090_6096_202103011640.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210302_2/web', null);
INSERT INTO `proversion_record` VALUES ('103', '1.5.0_20210302_2', '10', 'jp-slwWeb-web-1', 'jp-slwWeb-web-1_update_1247_1263_202102231524.tar.gz', '2', '/projects/mml_shengyijia/1.5.0/publish/20210302_2/web', null);
INSERT INTO `proversion_record` VALUES ('104', '1.5.0_20210302_2', '10', 'jp-mml-syj-core-2', 'jp-mml-syj-core-2.war', '1', '/projects/mml_shengyijia/1.5.0/publish/20210302_2/java', null);
INSERT INTO `proversion_record` VALUES ('105', '1.5.0_20210302_2', '10', 'jp-oc-jsj-core-2', 'jp-oc-jsj-core-2.war', '1', '/projects/mml_shengyijia/1.5.0/publish/20210302_2/java', null);
INSERT INTO `proversion_record` VALUES ('106', '1.5.0_20210302_3', '10', 'jp-mml-syj-core-2', 'jp-mml-syj-core-2.war', '1', '/projects/mml_shengyijia/1.5.0/publish/20210302_3/java', null);
INSERT INTO `proversion_record` VALUES ('107', '2.9_20210302_1', '5', 'jp-szt-web-1', 'jp-szt-web-1_jxc_update_623_626_202103011658.tar.gz', '2', '/projects/piaojujia/2.9/publish/20210302_1/web', '20210302_1');
INSERT INTO `proversion_record` VALUES ('108', '1.5.0_20210303_1', '10', 'jp-slwWeb-web-1', 'jp-slwWeb-web-1_update_1247_1287_202103031033.tar.gz', '2', '/projects/mml_shengyijia/1.5.0/publish/20210303_1/web', '20210303_1');
INSERT INTO `proversion_record` VALUES ('109', '1.5.0_20210303_2', '10', 'jp-mml-syj-core-2', 'jp-mml-syj-core-2.war', '1', '/projects/mml_shengyijia/1.5.0/publish/20210303_2/java', '20210303_2');
INSERT INTO `proversion_record` VALUES ('110', '3.0.0_20210303_1', '11', 'jp-jsc-core-1', 'jp-jsc-core-1_update_20210303_01.zip', '2', '/projects/jiaoshoujia_xz//3.0.0/publish/20210303_1/java', '20210303_1');
INSERT INTO `proversion_record` VALUES ('111', '3.0.0_20210303_2', '11', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_php_update_5850_6099_202103021613.tar.gz', '2', '/projects/jiaoshoujia_xz//3.0.0/publish/20210303_2/web', '20210303_2');
INSERT INTO `proversion_record` VALUES ('112', '3.0.0_20210303_2', '11', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_jsj_update_5850_6099_202103021612.tar.gz', '2', '/projects/jiaoshoujia_xz//3.0.0/publish/20210303_2/web', '20210303_2');
INSERT INTO `proversion_record` VALUES ('113', '1.2.2_20210303_1', '12', 'jp-jsjjm-web-1', 'jp-jsjjm-web-1_jm_update_6050_6098_202103021612.tar.gz', '2', '/projects/jiaoshoujia_jm/1.2.2/publish/20210303_1/web', '20210303_1');
INSERT INTO `proversion_record` VALUES ('114', '1.2.2_20210303_1', '12', 'jp-jsc-jm-core-1', 'jp-jsc-jm-core-1.war', '1', '/projects/jiaoshoujia_jm/1.2.2/publish/20210303_1/java', '20210303_1');
INSERT INTO `proversion_record` VALUES ('115', '2.9_20210304_1', '5', 'jp-szt-web-1', 'jp-szt-web-1_jxc_update_623_628_202103031553.tar.gz', '2', '/projects/piaojujia/2.9/publish/20210304_1/web', '20210304_1');
INSERT INTO `proversion_record` VALUES ('116', '2.9_20210304_1', '5', 'jp-pjj-core-1', 'jp-pjj-core-1_update_20210302_1.zip', '2', '/projects/piaojujia/2.9/publish/20210304_1/java', '20210304_1');
INSERT INTO `proversion_record` VALUES ('117', '1.5.0_20210304_2', '10', 'jp-mml-syj-core-2', 'jp-mml-syj-core-2.war', '1', '/projects/mml_shengyijia/1.5.0/publish/20210304_2/java', '20210304_2');
INSERT INTO `proversion_record` VALUES ('118', '3.8.1_20210305_1', '9', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.1/publish/20210305_1/java', '20210305_1');
INSERT INTO `proversion_record` VALUES ('119', '3.8.1_20210305_1', '9', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_php_update_5850_6099_202103021613.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210305_1/web', '20210305_1');
INSERT INTO `proversion_record` VALUES ('120', '3.8.1_20210305_2', '9', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.1/publish/20210305_2/java', '20210305_2');
INSERT INTO `proversion_record` VALUES ('121', '2.9_20210309_1', '5', 'jp-szt-web-1', 'jp-szt-web-1_php_update_609_644_202103090932.tar.gz', '2', '/projects/piaojujia/2.9/publish/20210309_1/web', '20210309_1');
INSERT INTO `proversion_record` VALUES ('122', '3.8.1_20210310_1', '13', 'jp-fht-wap-web-1', 'jp-fht-wap-web-1_update_1260_1297_202103051058.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210310_1/web', '20210310_1');
INSERT INTO `proversion_record` VALUES ('123', '2.9_20210310_1', '5', 'jp-szt-web-1', 'jp-szt-web-1_php_update_644_647_202103101337.tar.gz', '2', '/projects/piaojujia/2.9/publish/20210310_1/web', '20210310_1');
INSERT INTO `proversion_record` VALUES ('124', '3.8.1_20210311_1', '9', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.1/publish/20210311_1/java', '20210311_1');
INSERT INTO `proversion_record` VALUES ('125', '3.8.1_20210311_1', '9', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_php_update_6040_6123_202103110949.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210311_1/web', '20210311_1');
INSERT INTO `proversion_record` VALUES ('126', '3.8.1_20210311_1', '9', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_6090_6123_202103110949.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210311_1/web', '20210311_1');
INSERT INTO `proversion_record` VALUES ('127', '3.8.1_20210311_1', '9', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_sfh_update_5870_6123_202103110949.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210311_1/web', '20210311_1');
INSERT INTO `proversion_record` VALUES ('128', '3.8.1_20210311_1', '9', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_jsjprint_update_5930_6112_202103091620.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210311_1/web', '20210311_1');
INSERT INTO `proversion_record` VALUES ('129', '3.8.1_20210311_2', '13', 'jp-fht-wap-web-1', 'jp-fht-wap-web-1_update_1260_1297_202103051058.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210311_2/web', '20210311_2');
INSERT INTO `proversion_record` VALUES ('130', '2.9_20210311_1', '5', 'jp-szt-web-1', 'jp-szt-web-1_php_update_647_650_202103111050.tar.gz', '2', '/projects/piaojujia/2.9/publish/20210311_1/web', '20210311_1');
INSERT INTO `proversion_record` VALUES ('131', '3.8.1_20210311_2', '9', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.1/publish/20210311_2/java', '20210311_2');
INSERT INTO `proversion_record` VALUES ('132', '3.8.1_20210311_2', '9', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_php_update_6040_6123_202103111115.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210311_2/web', '20210311_2');
INSERT INTO `proversion_record` VALUES ('133', '3.8.1_20210311_2', '9', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_6090_6123_202103110949.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210311_2/web', '20210311_2');
INSERT INTO `proversion_record` VALUES ('134', '3.8.1_20210311_2', '9', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_sfh_update_5870_6123_202103110949.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210311_2/web', '20210311_2');
INSERT INTO `proversion_record` VALUES ('135', '3.8.1_20210311_2', '9', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_jsjprint_update_5930_6126_202103111507.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210311_2/web', '20210311_2');
INSERT INTO `proversion_record` VALUES ('136', '3.8.1_20210311_3', '13', 'jp-fht-wap-web-1', 'jp-fht-wap-web-1_update_1260_1299_202103111114.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210311_3/web', '20210311_3');
INSERT INTO `proversion_record` VALUES ('137', '3.8.1_20210312_1', '9', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.1/publish/20210312_1/java', '20210312_1');
INSERT INTO `proversion_record` VALUES ('138', '3.8.1_20210312_2', '13', 'jp-fht-wap-web-1', 'jp-fht-wap-web-1_update_1260_1309_202103120953.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210312_2/web', '20210312_2');
INSERT INTO `proversion_record` VALUES ('139', '3.8.1_20210312_3', '9', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.1/publish/20210312_3/java', '20210312_3');
INSERT INTO `proversion_record` VALUES ('140', '3.8.1_20210312_4', '9', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_php_update_6040_6141_202103121650.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210312_4/web', '20210312_4');
INSERT INTO `proversion_record` VALUES ('141', '3.8.1_20210312_4', '9', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_6090_6140_202103121638.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210312_4/web', '20210312_4');
INSERT INTO `proversion_record` VALUES ('142', '3.8.1_20210312_4', '9', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_jsjprint_update_5930_6140_202103121639.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210312_4/web', '20210312_4');
INSERT INTO `proversion_record` VALUES ('143', '3.8.1_20210312_4', '9', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_sfh_update_5870_6140_202103121639.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210312_4/web', '20210312_4');
INSERT INTO `proversion_record` VALUES ('144', '3.8.1_20210312_5', '13', 'jp-fht-wap-web-1', 'jp-fht-wap-web-1_update_1260_1309_202103120953.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210312_5/web', '20210312_5');
INSERT INTO `proversion_record` VALUES ('145', '1.5.0_20210312_1', '10', 'jp-mml-syj-core-2', 'jp-mml-syj-core-2.war', '1', '/projects/mml_shengyijia/1.5.0/publish/20210312_1/java', '20210312_1');
INSERT INTO `proversion_record` VALUES ('146', '3.8.1_20210312_5', '9', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.1/publish/20210312_5/java', '20210312_5');
INSERT INTO `proversion_record` VALUES ('147', '3.8.1_20210312_6', '9', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.1/publish/20210312_6/java', '20210312_6');
INSERT INTO `proversion_record` VALUES ('148', '3.8.1_20210312_7', '9', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.1/publish/20210312_7/java', '20210312_7');
INSERT INTO `proversion_record` VALUES ('149', '3.8.1_20210312_7', '9', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_6090_6142_202103122038.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210312_7/web', '20210312_7');
INSERT INTO `proversion_record` VALUES ('150', '3.8.1_20210312_8', '13', 'jp-fht-wap-web-1', 'jp-fht-wap-web-1_update_1260_1315_202103122100.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210312_8/web', '20210312_8');
INSERT INTO `proversion_record` VALUES ('151', '3.8.1_20210312_6', '9', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1_update_20210302_01.zip', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210312_6/java', '20210312_6');
INSERT INTO `proversion_record` VALUES ('152', '3.8.1_20210312_6', '9', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1_update_20210312_32.zip', '2', '/projects/jiaoshoujia_pt//3.8.1/publish/20210312_6/java', '20210312_6');
INSERT INTO `proversion_record` VALUES ('153', '3.1.0_20210317_1', '14', 'jp-jsc-core-1', 'jp-jsc-core-1_update_20210316_05.zip', '2', '/projects/jiaoshoujia_xz//3.1.0/publish/20210317_1/java', '20210317_1');
INSERT INTO `proversion_record` VALUES ('154', '3.1.0_20210317_1', '14', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_php_update_6040_6141_202103121650.tar.gz', '2', '/projects/jiaoshoujia_xz//3.1.0/publish/20210317_1/web', '20210317_1');
INSERT INTO `proversion_record` VALUES ('155', '3.1.0_20210317_1', '14', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_jsj_update_6090_6144_202103161108.tar.gz', '2', '/projects/jiaoshoujia_xz//3.1.0/publish/20210317_1/web', '20210317_1');
INSERT INTO `proversion_record` VALUES ('156', '3.8.2_20210323_1', '15', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.2/publish/20210323_1/java', '20210323_1');
INSERT INTO `proversion_record` VALUES ('157', '3.8.2_20210323_1', '15', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_6140_6161_202103221705.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210323_1/web', '20210323_1');
INSERT INTO `proversion_record` VALUES ('158', '3.8.2_20210323_1', '15', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_sfh_update_6140_6161_202103221705.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210323_1/web', '20210323_1');
INSERT INTO `proversion_record` VALUES ('159', '3.8.2_20210323_2', '15', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.2/publish/20210323_2/java', '20210323_2');
INSERT INTO `proversion_record` VALUES ('160', '3.8.2_20210323_2', '15', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_6140_6161_202103221705.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210323_2/web', '20210323_2');
INSERT INTO `proversion_record` VALUES ('161', '3.8.2_20210323_2', '15', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_sfh_update_6140_6161_202103221705.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210323_2/web', '20210323_2');
INSERT INTO `proversion_record` VALUES ('168', '2.9_20210323_1', '5', 'jp-pjj-core-1', 'jp-pjj-core-1_update_20210323_1.zip', '2', '/projects/piaojujia/2.9/publish/20210323_1/java', '20210323_1');
INSERT INTO `proversion_record` VALUES ('169', '3.8.2_20210323_2', '15', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.2/publish/20210323_2/java', '20210323_2');
INSERT INTO `proversion_record` VALUES ('170', '2.9_20210323_2', '5', 'jp-szt-web-1', 'jp-szt-web-1_szt_update_618_652_202103231617.tar.gz', '2', '/projects/piaojujia/2.9/publish/20210323_2/web', '20210323_2');
INSERT INTO `proversion_record` VALUES ('174', '3.8.2_20210323_3', '15', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.2/publish/20210323_3/java', '20210323_3');
INSERT INTO `proversion_record` VALUES ('175', '3.8.2_20210323_4', '15', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_6140_6166_202103231639.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210323_4/web', '20210323_4');
INSERT INTO `proversion_record` VALUES ('176', '3.8.2_20210323_4', '15', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_sfh_update_6140_6166_202103231639.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210323_4/web', '20210323_4');
INSERT INTO `proversion_record` VALUES ('177', '3.8.2_20210323_4', '15', 'jp-fht-wap-web-1', 'jp-fht-wap-web-1_update_1310_1330_202103231641.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210323_4/web', '20210323_4');
INSERT INTO `proversion_record` VALUES ('178', '3.8.2_20210323_5', '15', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_6140_6168_202103231733.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210323_5/web', '20210323_5');
INSERT INTO `proversion_record` VALUES ('179', '3.8.2_20210323_5', '15', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_sfh_update_6140_6168_202103231733.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210323_5/web', '20210323_5');
INSERT INTO `proversion_record` VALUES ('180', '3.8.2_20210323_5', '15', 'jp-fht-wap-web-1', 'jp-fht-wap-web-1_update_1310_1332_202103231734.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210323_5/web', '20210323_5');
INSERT INTO `proversion_record` VALUES ('181', '3.8.2_20210324_1', '15', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.2/publish/20210324_1/java', '20210324_1');
INSERT INTO `proversion_record` VALUES ('182', '3.8.2_20210324_1', '15', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_6140_6172_202103241021.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210324_1/web', '20210324_1');
INSERT INTO `proversion_record` VALUES ('183', '3.8.2_20210324_1', '15', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_sfh_update_6140_6172_202103241021.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210324_1/web', '20210324_1');
INSERT INTO `proversion_record` VALUES ('184', '3.8.2_20210324_1', '15', 'jp-fht-wap-web-1', 'jp-fht-wap-web-1_update_1310_1332_202103231734.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210324_1/web', '20210324_1');
INSERT INTO `proversion_record` VALUES ('185', '3.8.2_20210325_1', '15', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.2/publish/20210325_1/java', '20210325_1');
INSERT INTO `proversion_record` VALUES ('186', '3.8.2_20210325_1', '15', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_php_update_6140_6179_202103241531.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210325_1/web', '20210325_1');
INSERT INTO `proversion_record` VALUES ('187', '3.8.2_20210325_1', '15', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_6140_6181_202103250956.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210325_1/web', '20210325_1');
INSERT INTO `proversion_record` VALUES ('188', '3.8.2_20210325_1', '15', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_sfh_update_6140_6181_202103250956.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210325_1/web', '20210325_1');
INSERT INTO `proversion_record` VALUES ('189', '3.8.2_20210325_1', '15', 'jp-fht-wap-web-1', 'jp-fht-wap-web-1_update_1310_1354_202103241531.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210325_1/web', '20210325_1');
INSERT INTO `proversion_record` VALUES ('190', '3.8.2_20210325_2', '15', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.2/publish/20210325_2/java', '20210325_2');
INSERT INTO `proversion_record` VALUES ('191', '3.8.2_20210325_2', '15', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_6140_6185_202103251815.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210325_2/web', '20210325_2');
INSERT INTO `proversion_record` VALUES ('192', '3.8.2_20210325_2', '15', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_sfh_update_6140_6185_202103251815.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210325_2/web', '20210325_2');
INSERT INTO `proversion_record` VALUES ('193', '3.8.2_20210325_2', '15', 'jp-fht-wap-web-1', 'jp-fht-wap-web-1_update_1310_1378_202103251916.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210325_2/web', '20210325_2');
INSERT INTO `proversion_record` VALUES ('194', '3.8.2_20210326_1', '15', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.2/publish/20210326_1/java', '20210326_1');
INSERT INTO `proversion_record` VALUES ('195', '3.8.2_20210326_1', '15', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_6140_6195_202103261909.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210326_1/web', '20210326_1');
INSERT INTO `proversion_record` VALUES ('196', '3.8.2_20210326_1', '15', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_sfh_update_6140_6195_202103261909.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210326_1/web', '20210326_1');
INSERT INTO `proversion_record` VALUES ('197', '3.8.2_20210326_1', '15', 'jp-fht-wap-web-1', 'jp-fht-wap-web-1_update_1310_1382_202103261008.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210326_1/web', '20210326_1');
INSERT INTO `proversion_record` VALUES ('198', '3.8.2_20210326_2', '15', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.2/publish/20210326_2/java', '20210326_2');
INSERT INTO `proversion_record` VALUES ('199', '3.8.2_20210326_2', '15', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_sfh_update_6140_6197_202103262033.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.2/publish/20210326_2/web', '20210326_2');
INSERT INTO `proversion_record` VALUES ('200', '3.0.6_20210329_1', '17', 'jp-bns-core-1', 'jp-bns-core-1_update_20210329_02.zip', '2', '/projects/BNS/3.0.6/publish/20210329_1/java', '20210329_1');
INSERT INTO `proversion_record` VALUES ('201', '1.6.0_20210331_1', '18', 'jp-mml-syj-core-2', 'jp-mml-syj-core-2.war', '1', '/projects/mml_shengyijia/1.6.0/publish/20210331_1/java', '20210331_1');
INSERT INTO `proversion_record` VALUES ('202', '1.6.0_20210331_1', '18', 'jp-oc-jsj-core-2', 'jp-oc-jsj-core-2.war', '1', '/projects/mml_shengyijia/1.6.0/publish/20210331_1/java', '20210331_1');
INSERT INTO `proversion_record` VALUES ('203', '1.6.0_20210331_1', '18', 'jp-wx-api-1', 'jp-wx-api-1.war', '1', '/projects/mml_shengyijia/1.6.0/publish/20210331_1/java', '20210331_1');
INSERT INTO `proversion_record` VALUES ('204', '1.6.0_20210331_1', '18', 'jp-backend-core-1', 'jp-backend-core-1.war', '1', '/projects/mml_shengyijia/1.6.0/publish/20210331_1/java', '20210331_1');
INSERT INTO `proversion_record` VALUES ('205', '1.6.0_20210331_1', '18', 'jp-slwWeb-web-1', 'jp-slwWeb-web-1_update_1263_1393_202103301406.tar.gz', '2', '/projects/mml_shengyijia/1.6.0/publish/20210331_1/web', '20210331_1');
INSERT INTO `proversion_record` VALUES ('206', '1.6.0_20210331_1', '18', 'jp-vue-web-1', 'jp-vue-web-1_update_36099_37279_202103261814.tar.gz', '2', '/projects/mml_shengyijia/1.6.0/publish/20210331_1/web', '20210331_1');
INSERT INTO `proversion_record` VALUES ('207', '1.6.0_20210331_1', '18', 'jp-mml-web-1', 'jp-mml-web-1_common_update_5732_6181_202103251019.tar.gz', '2', '/projects/mml_shengyijia/1.6.0/publish/20210331_1/web', '20210331_1');
INSERT INTO `proversion_record` VALUES ('208', '1.6.0_20210331_1', '18', 'jp-mmlbk-web-1', 'jp-mmlbk-web-1_update_1944_1962_202103301446.tar.gz', '2', '/projects/mml_shengyijia/1.6.0/publish/20210331_1/web', '20210331_1');
INSERT INTO `proversion_record` VALUES ('209', '1.6.0_20210331_1', '18', 'jp-mmlbk-web-1', 'jp-mmlbk-web-1_syj_update_1944_1955_202103231355.tar.gz', '2', '/projects/mml_shengyijia/1.6.0/publish/20210331_1/web', '20210331_1');
INSERT INTO `proversion_record` VALUES ('210', '2.9_20210331_1', '5', 'jp-szt-web-1', 'jp-szt-web-1_szt_update_652_667_202103311431.tar.gz', '2', '/projects/piaojujia/2.9/publish/20210331_1/web', '20210331_1');
INSERT INTO `proversion_record` VALUES ('211', '2.9_20210331_1', '5', 'jp-szt-web-1', 'jp-szt-web-1_php_update_650_655_202103241732.tar.gz', '2', '/projects/piaojujia/2.9/publish/20210331_1/web', '20210331_1');
INSERT INTO `proversion_record` VALUES ('212', '2.9_20210331_1', '5', 'jp-pjj-core-1', 'jp-pjj-core-1.war', '1', '/projects/piaojujia/2.9/publish/20210331_1/java', '20210331_1');
INSERT INTO `proversion_record` VALUES ('213', '1.6.0_20210331_2', '18', 'jp-mml-syj-core-2', 'jp-mml-syj-core-2.war', '1', '/projects/mml_shengyijia/1.6.0/publish/20210331_2/java', '20210331_2');
INSERT INTO `proversion_record` VALUES ('214', '2.9_20210331_2', '5', 'jp-szt-web-1', 'jp-szt-web-1_szt_update_652_669_202103311658.tar.gz', '2', '/projects/piaojujia/2.9/publish/20210331_2/web', '20210331_2');
INSERT INTO `proversion_record` VALUES ('215', '2.9_20210331_2', '5', 'jp-pjj-core-1', 'jp-pjj-core-1.war', '1', '/projects/piaojujia/2.9/publish/20210331_2/java', '20210331_2');
INSERT INTO `proversion_record` VALUES ('216', '2.9_20210401_1', '5', 'jp-szt-web-1', 'jp-szt-web-1_szt_update_652_672_202104011419.tar.gz', '2', '/projects/piaojujia/2.9/publish/20210401_1/web', '20210401_1');
INSERT INTO `proversion_record` VALUES ('217', '2.9_20210401_2', '5', 'jp-pjj-core-1', 'jp-pjj-core-1.war', '1', '/projects/piaojujia/2.9/publish/20210401_2/java', '20210401_2');
INSERT INTO `proversion_record` VALUES ('218', '3.8.3_20210402_1', '19', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.3/publish/20210402_1/java', '20210402_1');
INSERT INTO `proversion_record` VALUES ('219', '3.8.3_20210402_1', '19', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_6195_6234_202104022023.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.3/publish/20210402_1/web', '20210402_1');
INSERT INTO `proversion_record` VALUES ('220', '3.8.3_20210402_1', '19', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_sfh_update_6195_6236_202104022143.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.3/publish/20210402_1/web', '20210402_1');
INSERT INTO `proversion_record` VALUES ('221', '3.8.3_20210402_1', '19', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_jsjprint_update_6140_6238_202104022209.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.3/publish/20210402_1/web', '20210402_1');
INSERT INTO `proversion_record` VALUES ('222', '3.8.3_20210402_1', '19', 'jp-fht-wap-web-1', 'jp-fht-wap-web-1_update_1380_1407_202104022221.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.3/publish/20210402_1/web', '20210402_1');
INSERT INTO `proversion_record` VALUES ('223', '2.0_20210402_1', '20', 'jp-jsjjm-web-1', 'jp-jsjjm-web-1_jm_update_6090_6232_202104021729.tar.gz', '2', '/projects/jiaoshoujia_jm/2.0/publish/20210402_1/web', '20210402_1');
INSERT INTO `proversion_record` VALUES ('224', '2.0_20210402_1', '20', 'jp-jsc-jm-core-1', 'jp-jsc-jm-core-1.war', '1', '/projects/jiaoshoujia_jm/2.0/publish/20210402_1/java', '20210402_1');
INSERT INTO `proversion_record` VALUES ('225', '2.9_20210406_1', '5', 'jp-szt-web-1', 'jp-szt-web-1_szt_update_652_673_202104061347.tar.gz', '2', '/projects/piaojujia/2.9/publish/20210406_1/web', '20210406_1');
INSERT INTO `proversion_record` VALUES ('226', '2.9_20210406_1', '5', 'jp-pjj-core-1', 'jp-pjj-core-1.war', '1', '/projects/piaojujia/2.9/publish/20210406_1/java', '20210406_1');
INSERT INTO `proversion_record` VALUES ('227', '2.9_20210406_2', '5', 'jp-szt-web-1', 'jp-szt-web-1_szt_update_652_674_202104061553.tar.gz', '2', '/projects/piaojujia/2.9/publish/20210406_2/web', '20210406_2');
INSERT INTO `proversion_record` VALUES ('228', '2.9_20210407_1', '5', 'jp-szt-web-1', 'jp-szt-web-1_szt_update_674_675_202104071134.tar.gz', '2', '/projects/piaojujia/2.9/publish/20210407_1/web', '20210407_1');
INSERT INTO `proversion_record` VALUES ('229', '2.9_20210407_1', '5', 'jp-pjj-core-1', 'jp-pjj-core-1_update_20210407_1.zip', '2', '/projects/piaojujia/2.9/publish/20210407_1/java', '20210407_1');
INSERT INTO `proversion_record` VALUES ('230', '3.1.1_20210407_1', '21', 'jp-jsc-core-1', 'jp-jsc-core-1_update_20210406_02.zip', '2', '/projects/jiaoshoujia_xz//3.1.1/publish/20210407_1/java', '20210407_1');
INSERT INTO `proversion_record` VALUES ('231', '2.1.0_20210407_1', '22', 'jp-jsc-jm-core-1', 'jp-jsc-jm-core-1.war', '1', '/projects/jiaoshoujia_jm/2.1.0/publish/20210407_1/java', '20210407_1');
INSERT INTO `proversion_record` VALUES ('232', '3.8.4_20210407_1', '23', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.4/publish/20210407_1/java', '20210407_1');
INSERT INTO `proversion_record` VALUES ('233', '3.8.4_20210407_1', '23', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_6230_6245_202104071721.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.4/publish/20210407_1/web', '20210407_1');
INSERT INTO `proversion_record` VALUES ('234', '3.8.4_20210407_1', '23', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_sfh_update_6230_6240_202104061422.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.4/publish/20210407_1/web', '20210407_1');
INSERT INTO `proversion_record` VALUES ('235', '3.8.4_20210407_1', '23', 'jp-fht-wap-web-1', 'jp-fht-wap-web-1_update_1400_1413_202104071840.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.4/publish/20210407_1/web', '20210407_1');
INSERT INTO `proversion_record` VALUES ('236', '2.1.0_20210407_2', '22', 'jp-jsc-jm-core-1', 'jp-jsc-jm-core-1.war', '1', '/projects/jiaoshoujia_jm/2.1.0/publish/20210407_2/java', '20210407_2');
INSERT INTO `proversion_record` VALUES ('237', '3.8.4_20210407_2', '23', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.4/publish/20210407_2/java', '20210407_2');
INSERT INTO `proversion_record` VALUES ('238', '2.9_20210408_1', '5', 'jp-pjj-core-1', 'jp-pjj-core-1_update_20210408_1.zip', '2', '/projects/piaojujia/2.9/publish/20210408_1/java', '20210408_1');
INSERT INTO `proversion_record` VALUES ('239', '3.8.5_20210409_1', '24', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_6230_6249_202104091023.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.5/publish/20210409_1/web', '20210409_1');
INSERT INTO `proversion_record` VALUES ('240', '3.8.5_20210409_1', '24', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_sfh_update_6230_6252_202104091503.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.5/publish/20210409_1/web', '20210409_1');
INSERT INTO `proversion_record` VALUES ('241', '3.8.5_20210409_2', '24', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.5/publish/20210409_2/java', '20210409_2');
INSERT INTO `proversion_record` VALUES ('242', '3.8.5_20210409_2', '24', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_6230_6249_202104091023.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.5/publish/20210409_2/web', '20210409_2');
INSERT INTO `proversion_record` VALUES ('243', '3.8.5_20210409_2', '24', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_sfh_update_6230_6252_202104091503.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.5/publish/20210409_2/web', '20210409_2');
INSERT INTO `proversion_record` VALUES ('244', '3.1.2_20210413_1', '25', 'jp-jsc-core-1', 'jp-jsc-core-1_update_20210412_02.zip', '2', '/projects/jiaoshoujia_xz//3.1.2/publish/20210413_1/java', '20210413_1');
INSERT INTO `proversion_record` VALUES ('245', '2.1.1_20210413_1', '26', 'jp-jsjjm-web-1', 'jp-jsjjm-web-1_jm_update_6230_6259_202104121644.tar.gz', '2', '/projects/jiaoshoujia_jm/2.1.1/publish/20210413_1/web', '20210413_1');
INSERT INTO `proversion_record` VALUES ('246', '3.8.5_20210413_1', '24', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.5/publish/20210413_1/java', '20210413_1');
INSERT INTO `proversion_record` VALUES ('247', '3.8.5_20210413_1', '24', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_php_update_6170_6264_202104131120.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.5/publish/20210413_1/web', '20210413_1');
INSERT INTO `proversion_record` VALUES ('248', '3.8.5_20210413_1', '24', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_sfh_update_6230_6266_202104131610.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.5/publish/20210413_1/web', '20210413_1');
INSERT INTO `proversion_record` VALUES ('249', '3.8.5_20210413_1', '24', 'jp-fht-wap-web-1', 'jp-fht-wap-web-1_update_1410_1423_202104131355.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.5/publish/20210413_1/web', '20210413_1');
INSERT INTO `proversion_record` VALUES ('250', '3.8.5_20210413_2', '24', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.5/publish/20210413_2/java', '20210413_2');
INSERT INTO `proversion_record` VALUES ('251', '3.8.5_20210413_2', '24', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_php_update_6170_6264_202104131120.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.5/publish/20210413_2/web', '20210413_2');
INSERT INTO `proversion_record` VALUES ('252', '3.8.5_20210413_2', '24', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_sfh_update_6230_6267_202104131635.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.5/publish/20210413_2/web', '20210413_2');
INSERT INTO `proversion_record` VALUES ('253', '3.8.5_20210413_2', '24', 'jp-fht-wap-web-1', 'jp-fht-wap-web-1_update_1410_1423_202104131355.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.5/publish/20210413_2/web', '20210413_2');
INSERT INTO `proversion_record` VALUES ('254', '1.6.0_20210413_1', '18', 'jiaparts-support-api', 'jiaparts-support-api_update_20210413.zip', '2', '/projects/mml_shengyijia/1.6.0/publish/20210413_1/java', '20210413_1');
INSERT INTO `proversion_record` VALUES ('255', '3.8.5_20210413_3', '24', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_php_update_6170_6268_202104131737.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.5/publish/20210413_3/web', '20210413_3');
INSERT INTO `proversion_record` VALUES ('256', '3.8.5_20210413_3', '24', 'jp-fht-wap-web-1', 'jp-fht-wap-web-1_update_1410_1427_202104131702.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.5/publish/20210413_3/web', '20210413_3');
INSERT INTO `proversion_record` VALUES ('257', '3.8.6_20210416_1', '27', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.6/publish/20210416_1/java', '20210416_1');
INSERT INTO `proversion_record` VALUES ('258', '2.1.2_20210416_1', '28', 'jp-jsjjm-web-1', 'jp-jsjjm-web-1_jm_update_6230_6270_202104151025.tar.gz', '2', '/projects/jiaoshoujia_jm/2.1.2/publish/20210416_1/web', '20210416_1');
INSERT INTO `proversion_record` VALUES ('259', '3.8.6_20210416_2', '27', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_fht_update_5230_6274_202104151114.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.6/publish/20210416_2/web', '20210416_2');
INSERT INTO `proversion_record` VALUES ('260', '3.8.6_20210416_2', '27', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_sfh_update_6230_6275_202104151401.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.6/publish/20210416_2/web', '20210416_2');
INSERT INTO `proversion_record` VALUES ('261', '3.8.6_20210416_2', '27', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_jsjprint_update_6238_6269_202104150938.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.6/publish/20210416_2/web', '20210416_2');
INSERT INTO `proversion_record` VALUES ('262', '3.8.6_20210416_2', '27', 'jp-fht-wap-web-1', 'jp-fht-wap-web-1_update_1420_1450_202104161053.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.6/publish/20210416_2/web', '20210416_2');
INSERT INTO `proversion_record` VALUES ('263', '3.0.9_20210419_1', '29', 'jp-bns-core-1', 'jp-bns-core-1_update_20210409_01.zip', '2', '/projects/BNS/3.0.9/publish/20210419_1/java', '20210419_1');
INSERT INTO `proversion_record` VALUES ('264', '3.8.7_20210421_1', '31', 'jp-jsc-gw-core-1', 'jp-jsc-gw-core-1.war', '1', '/projects/jiaoshoujia_pt//3.8.7/publish/20210421_1/java', '20210421_1');
INSERT INTO `proversion_record` VALUES ('265', '3.8.7_20210421_1', '31', 'jp-jsjxz-web-1', 'jp-jsjxz-web-1_sfh_update_6260_6279_202104201748.tar.gz', '2', '/projects/jiaoshoujia_pt//3.8.7/publish/20210421_1/web', '20210421_1');
INSERT INTO `proversion_record` VALUES ('266', '2.2.1_20210422_1', '32', 'jp-jsjjm-web-1', 'jp-jsjjm-web-1_jm_update_6260_6281_202104211705.tar.gz', '2', '/projects/jiaoshoujia_jm/2.2.1/publish/20210422_1/web', '20210422_1');
INSERT INTO `proversion_record` VALUES ('267', '2.2.1_20210422_1', '32', 'jp-jsc-jm-core-1', 'jp-jsc-jm-core-1.war', '1', '/projects/jiaoshoujia_jm/2.2.1/publish/20210422_1/java', '20210422_1');
INSERT INTO `proversion_record` VALUES ('268', '2.2.1_20210425_1', '32', 'jp-jsjjm-web-1', 'jp-jsjjm-web-1_jm_update_6260_6288_202104251500.tar.gz', '2', '/projects/jiaoshoujia_jm/2.2.1/publish/20210425_1/web', '20210425_1');
INSERT INTO `proversion_record` VALUES ('269', '2.2.1_20210425_1', '32', 'jp-jsc-jm-core-1', 'jp-jsc-jm-core-1.war', '1', '/projects/jiaoshoujia_jm/2.2.1/publish/20210425_1/java', '20210425_1');
INSERT INTO `proversion_record` VALUES ('270', '2.2.1_20210426_1', '32', 'jp-jsjjm-web-1', 'jp-jsjjm-web-1_php_update_6050_6290_202104251713.tar.gz', '2', '/projects/jiaoshoujia_jm/2.2.1/publish/20210426_1/web', '20210426_1');
INSERT INTO `proversion_record` VALUES ('271', '2.2.1_20210426_1', '32', 'jp-jsjjm-web-1', 'jp-jsjjm-web-1_jm_update_6260_6293_202104261053.tar.gz', '2', '/projects/jiaoshoujia_jm/2.2.1/publish/20210426_1/web', '20210426_1');
INSERT INTO `proversion_record` VALUES ('272', '2.2.1_20210426_2', '32', 'jp-jsjjm-web-1', 'jp-jsjjm-web-1_php_update_6050_6290_202104251713.tar.gz', '2', '/projects/jiaoshoujia_jm/2.2.1/publish/20210426_2/web', '20210426_2');
INSERT INTO `proversion_record` VALUES ('273', '2.2.1_20210426_2', '32', 'jp-jsjjm-web-1', 'jp-jsjjm-web-1_jm_update_6260_6293_202104261053.tar.gz', '2', '/projects/jiaoshoujia_jm/2.2.1/publish/20210426_2/web', '20210426_2');
INSERT INTO `proversion_record` VALUES ('274', '2.2.1_20210426_2', '32', 'jp-jsc-jm-core-1', 'jp-jsc-jm-core-1.war', '1', '/projects/jiaoshoujia_jm/2.2.1/publish/20210426_2/java', '20210426_2');
INSERT INTO `proversion_record` VALUES ('275', '2.10_20210427_1', '30', 'jp-szt-web-1', 'jp-szt-web-1_szt_update_675_695_202104261810.tar.gz', '2', '/projects/piaojujia/2.10/publish/20210427_1/web', '20210427_1');
INSERT INTO `proversion_record` VALUES ('276', '2.10_20210427_1', '30', 'jp-pjj-core-1', 'jp-pjj-core-1.war', '1', '/projects/piaojujia/2.10/publish/20210427_1/java', '20210427_1');
INSERT INTO `proversion_record` VALUES ('277', '2.2.1_20210427_1', '32', 'jp-jsjjm-web-1', 'jp-jsjjm-web-1_php_update_6050_6293_202104261140.tar.gz', '2', '/projects/jiaoshoujia_jm/2.2.1/publish/20210427_1/web', '20210427_1');
INSERT INTO `proversion_record` VALUES ('278', '2.2.1_20210427_1', '32', 'jp-jsc-jm-core-1', 'jp-jsc-jm-core-1.war', '1', '/projects/jiaoshoujia_jm/2.2.1/publish/20210427_1/java', '20210427_1');
INSERT INTO `proversion_record` VALUES ('279', '2.2.1_20210427_2', '32', 'jp-jsc-jm-core-1', 'jp-jsc-jm-core-1.war', '1', '/projects/jiaoshoujia_jm/2.2.1/publish/20210427_2/java', '20210427_2');
INSERT INTO `proversion_record` VALUES ('280', '2.10_20210427_2', '30', 'jp-pjj-core-1', 'jp-pjj-core-1.war', '1', '/projects/piaojujia/2.10/publish/20210427_2/java', '20210427_2');
INSERT INTO `proversion_record` VALUES ('281', '2.2.1_20210428_1', '32', 'jp-jsjjm-web-1', 'jp-jsjjm-web-1_jm_update_6260_6299_202104271809.tar.gz', '2', '/projects/jiaoshoujia_jm/2.2.1/publish/20210428_1/web', '20210428_1');
INSERT INTO `proversion_record` VALUES ('282', '2.2.1_20210428_1', '32', 'jp-jsc-jm-core-1', 'jp-jsc-jm-core-1.war', '1', '/projects/jiaoshoujia_jm/2.2.1/publish/20210428_1/java', '20210428_1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员');
INSERT INTO `role` VALUES ('2', '测试');
INSERT INTO `role` VALUES ('3', '其他');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '姓名',
  `type` int(11) DEFAULT NULL COMMENT '用户类型(0管理员，1开发，2测试)',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，0:禁用 1:正常''',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '79SCE/UkSn7CA/s729yNUA==', '超级管理员', '0', '1', '2020-12-16 17:27:31');

-- ----------------------------
-- Table structure for user_product
-- ----------------------------
DROP TABLE IF EXISTS `user_product`;
CREATE TABLE `user_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT 'user.id',
  `product_id` int(11) NOT NULL COMMENT 'product.id',
  `user_type` int(11) NOT NULL DEFAULT '1' COMMENT '用户类型：1测试，2开发，3其他',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户_产品关联表';

-- ----------------------------
-- Records of user_product
-- ----------------------------

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT 'user_id',
  `role_id` int(11) DEFAULT NULL COMMENT 'role_id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户角色关联表';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
