/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : finecar

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-05-31 22:36:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fc_admin_access
-- ----------------------------
DROP TABLE IF EXISTS `fc_admin_access`;
CREATE TABLE `fc_admin_access` (
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '模型名称',
  `group` varchar(16) NOT NULL DEFAULT '' COMMENT '权限分组标识',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `nid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '授权节点id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='统一授权表';

-- ----------------------------
-- Records of fc_admin_access
-- ----------------------------

-- ----------------------------
-- Table structure for fc_admin_action
-- ----------------------------
DROP TABLE IF EXISTS `fc_admin_action`;
CREATE TABLE `fc_admin_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '所属模块名',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '行为标题',
  `remark` varchar(128) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='系统行为表';

-- ----------------------------
-- Records of fc_admin_action
-- ----------------------------
INSERT INTO `fc_admin_action` VALUES ('1', 'user', 'user_add', '添加用户', '添加用户', '', '[user|get_nickname] 添加了用户：[record|get_nickname]', '1', '1480156399', '1480163853');
INSERT INTO `fc_admin_action` VALUES ('2', 'user', 'user_edit', '编辑用户', '编辑用户', '', '[user|get_nickname] 编辑了用户：[details]', '1', '1480164578', '1480297748');
INSERT INTO `fc_admin_action` VALUES ('3', 'user', 'user_delete', '删除用户', '删除用户', '', '[user|get_nickname] 删除了用户：[details]', '1', '1480168582', '1480168616');
INSERT INTO `fc_admin_action` VALUES ('4', 'user', 'user_enable', '启用用户', '启用用户', '', '[user|get_nickname] 启用了用户：[details]', '1', '1480169185', '1480169185');
INSERT INTO `fc_admin_action` VALUES ('5', 'user', 'user_disable', '禁用用户', '禁用用户', '', '[user|get_nickname] 禁用了用户：[details]', '1', '1480169214', '1480170581');
INSERT INTO `fc_admin_action` VALUES ('6', 'user', 'user_access', '用户授权', '用户授权', '', '[user|get_nickname] 对用户：[record|get_nickname] 进行了授权操作。详情：[details]', '1', '1480221441', '1480221563');
INSERT INTO `fc_admin_action` VALUES ('7', 'user', 'role_add', '添加角色', '添加角色', '', '[user|get_nickname] 添加了角色：[details]', '1', '1480251473', '1480251473');
INSERT INTO `fc_admin_action` VALUES ('8', 'user', 'role_edit', '编辑角色', '编辑角色', '', '[user|get_nickname] 编辑了角色：[details]', '1', '1480252369', '1480252369');
INSERT INTO `fc_admin_action` VALUES ('9', 'user', 'role_delete', '删除角色', '删除角色', '', '[user|get_nickname] 删除了角色：[details]', '1', '1480252580', '1480252580');
INSERT INTO `fc_admin_action` VALUES ('10', 'user', 'role_enable', '启用角色', '启用角色', '', '[user|get_nickname] 启用了角色：[details]', '1', '1480252620', '1480252620');
INSERT INTO `fc_admin_action` VALUES ('11', 'user', 'role_disable', '禁用角色', '禁用角色', '', '[user|get_nickname] 禁用了角色：[details]', '1', '1480252651', '1480252651');
INSERT INTO `fc_admin_action` VALUES ('12', 'user', 'attachment_enable', '启用附件', '启用附件', '', '[user|get_nickname] 启用了附件：附件ID([details])', '1', '1480253226', '1480253332');
INSERT INTO `fc_admin_action` VALUES ('13', 'user', 'attachment_disable', '禁用附件', '禁用附件', '', '[user|get_nickname] 禁用了附件：附件ID([details])', '1', '1480253267', '1480253340');
INSERT INTO `fc_admin_action` VALUES ('14', 'user', 'attachment_delete', '删除附件', '删除附件', '', '[user|get_nickname] 删除了附件：附件ID([details])', '1', '1480253323', '1480253323');
INSERT INTO `fc_admin_action` VALUES ('15', 'admin', 'config_add', '添加配置', '添加配置', '', '[user|get_nickname] 添加了配置，[details]', '1', '1480296196', '1480296196');
INSERT INTO `fc_admin_action` VALUES ('16', 'admin', 'config_edit', '编辑配置', '编辑配置', '', '[user|get_nickname] 编辑了配置：[details]', '1', '1480296960', '1480296960');
INSERT INTO `fc_admin_action` VALUES ('17', 'admin', 'config_enable', '启用配置', '启用配置', '', '[user|get_nickname] 启用了配置：[details]', '1', '1480298479', '1480298479');
INSERT INTO `fc_admin_action` VALUES ('18', 'admin', 'config_disable', '禁用配置', '禁用配置', '', '[user|get_nickname] 禁用了配置：[details]', '1', '1480298506', '1480298506');
INSERT INTO `fc_admin_action` VALUES ('19', 'admin', 'config_delete', '删除配置', '删除配置', '', '[user|get_nickname] 删除了配置：[details]', '1', '1480298532', '1480298532');
INSERT INTO `fc_admin_action` VALUES ('20', 'admin', 'database_export', '备份数据库', '备份数据库', '', '[user|get_nickname] 备份了数据库：[details]', '1', '1480298946', '1480298946');
INSERT INTO `fc_admin_action` VALUES ('21', 'admin', 'database_import', '还原数据库', '还原数据库', '', '[user|get_nickname] 还原了数据库：[details]', '1', '1480301990', '1480302022');
INSERT INTO `fc_admin_action` VALUES ('22', 'admin', 'database_optimize', '优化数据表', '优化数据表', '', '[user|get_nickname] 优化了数据表：[details]', '1', '1480302616', '1480302616');
INSERT INTO `fc_admin_action` VALUES ('23', 'admin', 'database_repair', '修复数据表', '修复数据表', '', '[user|get_nickname] 修复了数据表：[details]', '1', '1480302798', '1480302798');
INSERT INTO `fc_admin_action` VALUES ('24', 'admin', 'database_backup_delete', '删除数据库备份', '删除数据库备份', '', '[user|get_nickname] 删除了数据库备份：[details]', '1', '1480302870', '1480302870');
INSERT INTO `fc_admin_action` VALUES ('25', 'admin', 'hook_add', '添加钩子', '添加钩子', '', '[user|get_nickname] 添加了钩子：[details]', '1', '1480303198', '1480303198');
INSERT INTO `fc_admin_action` VALUES ('26', 'admin', 'hook_edit', '编辑钩子', '编辑钩子', '', '[user|get_nickname] 编辑了钩子：[details]', '1', '1480303229', '1480303229');
INSERT INTO `fc_admin_action` VALUES ('27', 'admin', 'hook_delete', '删除钩子', '删除钩子', '', '[user|get_nickname] 删除了钩子：[details]', '1', '1480303264', '1480303264');
INSERT INTO `fc_admin_action` VALUES ('28', 'admin', 'hook_enable', '启用钩子', '启用钩子', '', '[user|get_nickname] 启用了钩子：[details]', '1', '1480303294', '1480303294');
INSERT INTO `fc_admin_action` VALUES ('29', 'admin', 'hook_disable', '禁用钩子', '禁用钩子', '', '[user|get_nickname] 禁用了钩子：[details]', '1', '1480303409', '1480303409');
INSERT INTO `fc_admin_action` VALUES ('30', 'admin', 'menu_add', '添加节点', '添加节点', '', '[user|get_nickname] 添加了节点：[details]', '1', '1480305468', '1480305468');
INSERT INTO `fc_admin_action` VALUES ('31', 'admin', 'menu_edit', '编辑节点', '编辑节点', '', '[user|get_nickname] 编辑了节点：[details]', '1', '1480305513', '1480305513');
INSERT INTO `fc_admin_action` VALUES ('32', 'admin', 'menu_delete', '删除节点', '删除节点', '', '[user|get_nickname] 删除了节点：[details]', '1', '1480305562', '1480305562');
INSERT INTO `fc_admin_action` VALUES ('33', 'admin', 'menu_enable', '启用节点', '启用节点', '', '[user|get_nickname] 启用了节点：[details]', '1', '1480305630', '1480305630');
INSERT INTO `fc_admin_action` VALUES ('34', 'admin', 'menu_disable', '禁用节点', '禁用节点', '', '[user|get_nickname] 禁用了节点：[details]', '1', '1480305659', '1480305659');
INSERT INTO `fc_admin_action` VALUES ('35', 'admin', 'module_install', '安装模块', '安装模块', '', '[user|get_nickname] 安装了模块：[details]', '1', '1480307558', '1480307558');
INSERT INTO `fc_admin_action` VALUES ('36', 'admin', 'module_uninstall', '卸载模块', '卸载模块', '', '[user|get_nickname] 卸载了模块：[details]', '1', '1480307588', '1480307588');
INSERT INTO `fc_admin_action` VALUES ('37', 'admin', 'module_enable', '启用模块', '启用模块', '', '[user|get_nickname] 启用了模块：[details]', '1', '1480307618', '1480307618');
INSERT INTO `fc_admin_action` VALUES ('38', 'admin', 'module_disable', '禁用模块', '禁用模块', '', '[user|get_nickname] 禁用了模块：[details]', '1', '1480307653', '1480307653');
INSERT INTO `fc_admin_action` VALUES ('39', 'admin', 'module_export', '导出模块', '导出模块', '', '[user|get_nickname] 导出了模块：[details]', '1', '1480307682', '1480307682');
INSERT INTO `fc_admin_action` VALUES ('40', 'admin', 'packet_install', '安装数据包', '安装数据包', '', '[user|get_nickname] 安装了数据包：[details]', '1', '1480308342', '1480308342');
INSERT INTO `fc_admin_action` VALUES ('41', 'admin', 'packet_uninstall', '卸载数据包', '卸载数据包', '', '[user|get_nickname] 卸载了数据包：[details]', '1', '1480308372', '1480308372');
INSERT INTO `fc_admin_action` VALUES ('42', 'admin', 'system_config_update', '更新系统设置', '更新系统设置', '', '[user|get_nickname] 更新了系统设置：[details]', '1', '1480309555', '1480309642');

-- ----------------------------
-- Table structure for fc_admin_attachment
-- ----------------------------
DROP TABLE IF EXISTS `fc_admin_attachment`;
CREATE TABLE `fc_admin_attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `module` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名，由哪个模块上传的',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文件链接',
  `mime` varchar(128) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `ext` char(8) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT 'sha1 散列值',
  `driver` varchar(16) NOT NULL DEFAULT 'local' COMMENT '上传驱动',
  `download` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `width` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '图片宽度',
  `height` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '图片高度',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of fc_admin_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for fc_admin_config
-- ----------------------------
DROP TABLE IF EXISTS `fc_admin_config`;
CREATE TABLE `fc_admin_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '标题',
  `group` varchar(32) NOT NULL DEFAULT '' COMMENT '配置分组',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '类型',
  `value` text NOT NULL COMMENT '配置值',
  `options` text NOT NULL COMMENT '配置项',
  `tips` varchar(256) NOT NULL DEFAULT '' COMMENT '配置提示',
  `ajax_url` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框ajax地址',
  `next_items` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框的下级下拉框名，多个以逗号隔开',
  `param` varchar(32) NOT NULL DEFAULT '' COMMENT '联动下拉框请求参数名',
  `format` varchar(32) NOT NULL DEFAULT '' COMMENT '格式，用于格式文本',
  `table` varchar(32) NOT NULL DEFAULT '' COMMENT '表名，只用于快速联动类型',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '2' COMMENT '联动级别，只用于快速联动类型',
  `key` varchar(32) NOT NULL DEFAULT '' COMMENT '键字段，只用于快速联动类型',
  `option` varchar(32) NOT NULL DEFAULT '' COMMENT '值字段，只用于快速联动类型',
  `pid` varchar(32) NOT NULL DEFAULT '' COMMENT '父级id字段，只用于快速联动类型',
  `ak` varchar(32) NOT NULL DEFAULT '' COMMENT '百度地图appkey',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0禁用，1启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of fc_admin_config
-- ----------------------------
INSERT INTO `fc_admin_config` VALUES ('1', 'web_site_status', '站点开关', 'base', 'switch', '1', '', '站点关闭后将不能访问，后台可正常登录', '', '', '', '', '', '2', '', '', '', '', '1475240395', '1477403914', '1', '1');
INSERT INTO `fc_admin_config` VALUES ('2', 'web_site_title', '站点标题', 'base', 'text', '第一好车', '', '调用方式：<code>config(\'web_site_title\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475240646', '1477710341', '2', '1');
INSERT INTO `fc_admin_config` VALUES ('3', 'web_site_slogan', '站点标语', 'base', 'text', '第一好车', '', '站点口号，调用方式：<code>config(\'web_site_slogan\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475240994', '1477710357', '3', '1');
INSERT INTO `fc_admin_config` VALUES ('4', 'web_site_logo', '站点LOGO', 'base', 'image', '', '', '', '', '', '', '', '', '2', '', '', '', '', '1475241067', '1475241067', '4', '1');
INSERT INTO `fc_admin_config` VALUES ('5', 'web_site_description', '站点描述', 'base', 'textarea', '', '', '网站描述，有利于搜索引擎抓取相关信息', '', '', '', '', '', '2', '', '', '', '', '1475241186', '1475241186', '6', '1');
INSERT INTO `fc_admin_config` VALUES ('6', 'web_site_keywords', '站点关键词', 'base', 'text', '海豚PHP、PHP开发框架、后台框架', '', '网站搜索引擎关键字', '', '', '', '', '', '2', '', '', '', '', '1475241328', '1475241328', '7', '1');
INSERT INTO `fc_admin_config` VALUES ('7', 'web_site_copyright', '版权信息', 'base', 'text', 'Copyright © 2015-2017 DolphinPHP All rights reserved.', '', '调用方式：<code>config(\'web_site_copyright\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475241416', '1477710383', '8', '1');
INSERT INTO `fc_admin_config` VALUES ('8', 'web_site_icp', '备案信息', 'base', 'text', '', '', '调用方式：<code>config(\'web_site_icp\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475241441', '1477710441', '9', '1');
INSERT INTO `fc_admin_config` VALUES ('9', 'web_site_statistics', '站点统计', 'base', 'textarea', '', '', '网站统计代码，支持百度、Google、cnzz等，调用方式：<code>config(\'web_site_statistics\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475241498', '1477710455', '10', '1');
INSERT INTO `fc_admin_config` VALUES ('10', 'config_group', '配置分组', 'system', 'array', 'base:基本\r\nsystem:系统\r\nupload:上传\r\ndevelop:开发\r\ndatabase:数据库', '', '', '', '', '', '', '', '2', '', '', '', '', '1475241716', '1477649446', '100', '1');
INSERT INTO `fc_admin_config` VALUES ('11', 'form_item_type', '配置类型', 'system', 'array', 'text:单行文本\r\ntextarea:多行文本\r\nstatic:静态文本\r\npassword:密码\r\ncheckbox:复选框\r\nradio:单选按钮\r\ndate:日期\r\ndatetime:日期+时间\r\nhidden:隐藏\r\nswitch:开关\r\narray:数组\r\nselect:下拉框\r\nlinkage:普通联动下拉框\r\nlinkages:快速联动下拉框\r\nimage:单张图片\r\nimages:多张图片\r\nfile:单个文件\r\nfiles:多个文件\r\nueditor:UEditor 编辑器\r\nwangeditor:wangEditor 编辑器\r\neditormd:markdown 编辑器\r\nckeditor:ckeditor 编辑器\r\nicon:字体图标\r\ntags:标签\r\nnumber:数字\r\nbmap:百度地图\r\ncolorpicker:取色器\r\njcrop:图片裁剪\r\nmasked:格式文本\r\nrange:范围\r\ntime:时间', '', '', '', '', '', '', '', '2', '', '', '', '', '1475241835', '1495853193', '100', '1');
INSERT INTO `fc_admin_config` VALUES ('12', 'upload_file_size', '文件上传大小限制', 'upload', 'text', '0', '', '0为不限制大小，单位：kb', '', '', '', '', '', '2', '', '', '', '', '1475241897', '1477663520', '100', '1');
INSERT INTO `fc_admin_config` VALUES ('13', 'upload_file_ext', '允许上传的文件后缀', 'upload', 'tags', 'doc,docx,xls,xlsx,ppt,pptx,pdf,wps,txt,rar,zip,gz,bz2,7z', '', '多个后缀用逗号隔开，不填写则不限制类型', '', '', '', '', '', '2', '', '', '', '', '1475241975', '1477649489', '100', '1');
INSERT INTO `fc_admin_config` VALUES ('14', 'upload_image_size', '图片上传大小限制', 'upload', 'text', '0', '', '0为不限制大小，单位：kb', '', '', '', '', '', '2', '', '', '', '', '1475242015', '1477663529', '100', '1');
INSERT INTO `fc_admin_config` VALUES ('15', 'upload_image_ext', '允许上传的图片后缀', 'upload', 'tags', 'gif,jpg,jpeg,bmp,png', '', '多个后缀用逗号隔开，不填写则不限制类型', '', '', '', '', '', '2', '', '', '', '', '1475242056', '1477649506', '100', '1');
INSERT INTO `fc_admin_config` VALUES ('16', 'list_rows', '分页数量', 'system', 'number', '20', '', '每页的记录数', '', '', '', '', '', '2', '', '', '', '', '1475242066', '1476074507', '101', '1');
INSERT INTO `fc_admin_config` VALUES ('17', 'system_color', '后台配色方案', 'system', 'radio', 'default', 'default:Default\r\namethyst:Amethyst\r\ncity:City\r\nflat:Flat\r\nmodern:Modern\r\nsmooth:Smooth', '', '', '', '', '', '', '2', '', '', '', '', '1475250066', '1477316689', '102', '1');
INSERT INTO `fc_admin_config` VALUES ('18', 'develop_mode', '开发模式', 'develop', 'radio', '1', '0:关闭\r\n1:开启', '', '', '', '', '', '', '2', '', '', '', '', '1476864205', '1476864231', '100', '1');
INSERT INTO `fc_admin_config` VALUES ('19', 'app_trace', '显示页面Trace', 'develop', 'radio', '0', '0:否\r\n1:是', '', '', '', '', '', '', '2', '', '', '', '', '1476866355', '1476866355', '100', '1');
INSERT INTO `fc_admin_config` VALUES ('21', 'data_backup_path', '数据库备份根路径', 'database', 'text', '../data/', '', '路径必须以 / 结尾', '', '', '', '', '', '2', '', '', '', '', '1477017745', '1477018467', '100', '1');
INSERT INTO `fc_admin_config` VALUES ('22', 'data_backup_part_size', '数据库备份卷大小', 'database', 'text', '20971520', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '', '', '', '', '', '2', '', '', '', '', '1477017886', '1477017886', '100', '1');
INSERT INTO `fc_admin_config` VALUES ('23', 'data_backup_compress', '数据库备份文件是否启用压缩', 'database', 'radio', '1', '0:否\r\n1:是', '压缩备份文件需要PHP环境支持 <code>gzopen</code>, <code>gzwrite</code>函数', '', '', '', '', '', '2', '', '', '', '', '1477017978', '1477018172', '100', '1');
INSERT INTO `fc_admin_config` VALUES ('24', 'data_backup_compress_level', '数据库备份文件压缩级别', 'database', 'radio', '9', '1:最低\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '', '', '', '', '', '2', '', '', '', '', '1477018083', '1477018083', '100', '1');
INSERT INTO `fc_admin_config` VALUES ('25', 'top_menu_max', '顶部导航模块数量', 'system', 'text', '10', '', '设置顶部导航默认显示的模块数量', '', '', '', '', '', '2', '', '', '', '', '1477579289', '1477579289', '103', '1');
INSERT INTO `fc_admin_config` VALUES ('26', 'web_site_logo_text', '站点LOGO文字', 'base', 'image', '', '', '', '', '', '', '', '', '2', '', '', '', '', '1477620643', '1477620643', '5', '1');
INSERT INTO `fc_admin_config` VALUES ('27', 'upload_image_thumb', '缩略图尺寸', 'upload', 'text', '', '', '不填写则不生成缩略图，如需生成 <code>300x300</code> 的缩略图，则填写 <code>300,300</code> ，请注意，逗号必须是英文逗号', '', '', '', '', '', '2', '', '', '', '', '1477644150', '1477649513', '100', '1');
INSERT INTO `fc_admin_config` VALUES ('28', 'upload_image_thumb_type', '缩略图裁剪类型', 'upload', 'radio', '1', '1:等比例缩放\r\n2:缩放后填充\r\n3:居中裁剪\r\n4:左上角裁剪\r\n5:右下角裁剪\r\n6:固定尺寸缩放', '该项配置只有在启用生成缩略图时才生效', '', '', '', '', '', '2', '', '', '', '', '1477646271', '1477649521', '100', '1');
INSERT INTO `fc_admin_config` VALUES ('29', 'upload_thumb_water', '添加水印', 'upload', 'switch', '0', '', '', '', '', '', '', '', '2', '', '', '', '', '1477649648', '1477649648', '100', '1');
INSERT INTO `fc_admin_config` VALUES ('30', 'upload_thumb_water_pic', '水印图片', 'upload', 'image', '', '', '只有开启水印功能才生效', '', '', '', '', '', '2', '', '', '', '', '1477656390', '1477656390', '100', '1');
INSERT INTO `fc_admin_config` VALUES ('31', 'upload_thumb_water_position', '水印位置', 'upload', 'radio', '9', '1:左上角\r\n2:上居中\r\n3:右上角\r\n4:左居中\r\n5:居中\r\n6:右居中\r\n7:左下角\r\n8:下居中\r\n9:右下角', '只有开启水印功能才生效', '', '', '', '', '', '2', '', '', '', '', '1477656528', '1477656528', '100', '1');
INSERT INTO `fc_admin_config` VALUES ('32', 'upload_thumb_water_alpha', '水印透明度', 'upload', 'text', '50', '', '请输入0~100之间的数字，数字越小，透明度越高', '', '', '', '', '', '2', '', '', '', '', '1477656714', '1477661309', '100', '1');
INSERT INTO `fc_admin_config` VALUES ('33', 'wipe_cache_type', '清除缓存类型', 'system', 'checkbox', 'TEMP_PATH', 'TEMP_PATH:应用缓存\r\nLOG_PATH:应用日志\r\nCACHE_PATH:项目模板缓存', '清除缓存时，要删除的缓存类型', '', '', '', '', '', '2', '', '', '', '', '1477727305', '1477727305', '100', '1');
INSERT INTO `fc_admin_config` VALUES ('34', 'captcha_signin', '后台验证码开关', 'system', 'switch', '0', '', '后台登录时是否需要验证码', '', '', '', '', '', '2', '', '', '', '', '1478771958', '1478771958', '99', '1');
INSERT INTO `fc_admin_config` VALUES ('35', 'home_default_module', '前台默认模块', 'system', 'select', 'index', '', '前台默认访问的模块，该模块必须有Index控制器和index方法', '', '', '', '', '', '0', '', '', '', '', '1486714723', '1486715620', '104', '1');
INSERT INTO `fc_admin_config` VALUES ('36', 'minify_status', '开启minify', 'system', 'switch', '0', '', '开启minify会压缩合并js、css文件，可以减少资源请求次数，如果不支持minify，可关闭', '', '', '', '', '', '0', '', '', '', '', '1487035843', '1487035843', '99', '1');
INSERT INTO `fc_admin_config` VALUES ('37', 'upload_driver', '上传驱动', 'upload', 'radio', 'local', 'local:本地', '图片或文件上传驱动', '', '', '', '', '', '0', '', '', '', '', '1501488567', '1501490821', '100', '1');
INSERT INTO `fc_admin_config` VALUES ('38', 'system_log', '系统日志', 'system', 'switch', '1', '', '是否开启系统日志功能', '', '', '', '', '', '0', '', '', '', '', '1512635391', '1512635391', '99', '1');
INSERT INTO `fc_admin_config` VALUES ('39', 'asset_version', '资源版本号', 'develop', 'text', '20180327', '', '可通过修改版号强制用户更新静态文件', '', '', '', '', '', '0', '', '', '', '', '1522143239', '1522143239', '100', '1');

-- ----------------------------
-- Table structure for fc_admin_hook
-- ----------------------------
DROP TABLE IF EXISTS `fc_admin_hook`;
CREATE TABLE `fc_admin_hook` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `plugin` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子来自哪个插件',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子描述',
  `system` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统钩子',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='钩子表';

-- ----------------------------
-- Records of fc_admin_hook
-- ----------------------------
INSERT INTO `fc_admin_hook` VALUES ('1', 'admin_index', '', '后台首页', '1', '1468174214', '1477757518', '1');
INSERT INTO `fc_admin_hook` VALUES ('2', 'plugin_index_tab_list', '', '插件扩展tab钩子', '1', '1468174214', '1468174214', '1');
INSERT INTO `fc_admin_hook` VALUES ('3', 'module_index_tab_list', '', '模块扩展tab钩子', '1', '1468174214', '1468174214', '1');
INSERT INTO `fc_admin_hook` VALUES ('4', 'page_tips', '', '每个页面的提示', '1', '1468174214', '1468174214', '1');
INSERT INTO `fc_admin_hook` VALUES ('5', 'signin_footer', '', '登录页面底部钩子', '1', '1479269315', '1479269315', '1');
INSERT INTO `fc_admin_hook` VALUES ('6', 'signin_captcha', '', '登录页面验证码钩子', '1', '1479269315', '1479269315', '1');
INSERT INTO `fc_admin_hook` VALUES ('7', 'signin', '', '登录控制器钩子', '1', '1479386875', '1479386875', '1');
INSERT INTO `fc_admin_hook` VALUES ('8', 'upload_attachment', '', '附件上传钩子', '1', '1501493808', '1501493808', '1');
INSERT INTO `fc_admin_hook` VALUES ('9', 'page_plugin_js', '', '页面插件js钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `fc_admin_hook` VALUES ('10', 'page_plugin_css', '', '页面插件css钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `fc_admin_hook` VALUES ('11', 'signin_sso', '', '单点登录钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `fc_admin_hook` VALUES ('12', 'signout_sso', '', '单点退出钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `fc_admin_hook` VALUES ('13', 'user_add', '', '添加用户钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `fc_admin_hook` VALUES ('14', 'user_edit', '', '编辑用户钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `fc_admin_hook` VALUES ('15', 'user_delete', '', '删除用户钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `fc_admin_hook` VALUES ('16', 'user_enable', '', '启用用户钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `fc_admin_hook` VALUES ('17', 'user_disable', '', '禁用用户钩子', '1', '1503633591', '1503633591', '1');

-- ----------------------------
-- Table structure for fc_admin_hook_plugin
-- ----------------------------
DROP TABLE IF EXISTS `fc_admin_hook_plugin`;
CREATE TABLE `fc_admin_hook_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子id',
  `plugin` varchar(32) NOT NULL DEFAULT '' COMMENT '插件标识',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='钩子-插件对应表';

-- ----------------------------
-- Records of fc_admin_hook_plugin
-- ----------------------------
INSERT INTO `fc_admin_hook_plugin` VALUES ('1', 'admin_index', 'SystemInfo', '1477757503', '1477757503', '1', '1');
INSERT INTO `fc_admin_hook_plugin` VALUES ('2', 'admin_index', 'DevTeam', '1477755780', '1477755780', '2', '1');

-- ----------------------------
-- Table structure for fc_admin_icon
-- ----------------------------
DROP TABLE IF EXISTS `fc_admin_icon`;
CREATE TABLE `fc_admin_icon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '图标名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图标css地址',
  `prefix` varchar(32) NOT NULL DEFAULT '' COMMENT '图标前缀',
  `font_family` varchar(32) NOT NULL DEFAULT '' COMMENT '字体名',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图标表';

-- ----------------------------
-- Records of fc_admin_icon
-- ----------------------------

-- ----------------------------
-- Table structure for fc_admin_icon_list
-- ----------------------------
DROP TABLE IF EXISTS `fc_admin_icon_list`;
CREATE TABLE `fc_admin_icon_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `icon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属图标id',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '图标标题',
  `class` varchar(255) NOT NULL DEFAULT '' COMMENT '图标类名',
  `code` varchar(128) NOT NULL DEFAULT '' COMMENT '图标关键词',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='详细图标列表';

-- ----------------------------
-- Records of fc_admin_icon_list
-- ----------------------------

-- ----------------------------
-- Table structure for fc_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `fc_admin_log`;
CREATE TABLE `fc_admin_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` longtext NOT NULL COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of fc_admin_log
-- ----------------------------
INSERT INTO `fc_admin_log` VALUES ('1', '42', '1', '0', 'admin_config', '0', '超级管理员 更新了系统设置：分组(system)', '1', '1526908305');
INSERT INTO `fc_admin_log` VALUES ('2', '35', '1', '0', 'admin_module', '0', '超级管理员 安装了模块：好车', '1', '1526974874');
INSERT INTO `fc_admin_log` VALUES ('3', '30', '1', '0', 'admin_menu', '236', '超级管理员 添加了节点：所属模块(manage),所属节点ID(0),节点标题(好车),节点链接(manage/index/index)', '1', '1526974986');
INSERT INTO `fc_admin_log` VALUES ('4', '30', '1', '0', 'admin_menu', '237', '超级管理员 添加了节点：所属模块(manage),所属节点ID(236),节点标题(用户管理),节点链接()', '1', '1526975057');
INSERT INTO `fc_admin_log` VALUES ('5', '30', '1', '0', 'admin_menu', '238', '超级管理员 添加了节点：所属模块(manage),所属节点ID(237),节点标题(用户列表),节点链接(manage/user/index)', '1', '1526975105');
INSERT INTO `fc_admin_log` VALUES ('6', '30', '1', '0', 'admin_menu', '239', '超级管理员 添加了节点：所属模块(manage),所属节点ID(236),节点标题(管理首页),节点链接(manage/index/index)', '1', '1526975297');
INSERT INTO `fc_admin_log` VALUES ('7', '30', '1', '0', 'admin_menu', '240', '超级管理员 添加了节点：所属模块(manage),所属节点ID(238),节点标题(导出),节点链接(manage/user/export)', '1', '1527000768');
INSERT INTO `fc_admin_log` VALUES ('8', '30', '1', '0', 'admin_menu', '241', '超级管理员 添加了节点：所属模块(manage),所属节点ID(236),节点标题(商户管理),节点链接()', '1', '1527068680');
INSERT INTO `fc_admin_log` VALUES ('9', '30', '1', '0', 'admin_menu', '242', '超级管理员 添加了节点：所属模块(manage),所属节点ID(241),节点标题(商户开立),节点链接(manage/merchant/add)', '1', '1527068744');
INSERT INTO `fc_admin_log` VALUES ('10', '30', '1', '0', 'admin_menu', '243', '超级管理员 添加了节点：所属模块(manage),所属节点ID(241),节点标题(商户列表),节点链接(manage/merchant/index)', '1', '1527068773');
INSERT INTO `fc_admin_log` VALUES ('11', '30', '1', '0', 'admin_menu', '244', '超级管理员 添加了节点：所属模块(manage),所属节点ID(243),节点标题(导出),节点链接(manage/merchant/export)', '1', '1527068802');
INSERT INTO `fc_admin_log` VALUES ('12', '7', '1', '0', 'admin_role', '2', '超级管理员 添加了角色：商户', '1', '1527074536');
INSERT INTO `fc_admin_log` VALUES ('13', '7', '1', '0', 'admin_role', '3', '超级管理员 添加了角色：管理员', '1', '1527076385');
INSERT INTO `fc_admin_log` VALUES ('14', '1', '1', '0', 'admin_user', '2', '超级管理员 添加了用户：第一好车', '1', '1527076428');
INSERT INTO `fc_admin_log` VALUES ('15', '30', '1', '0', 'admin_menu', '245', '超级管理员 添加了节点：所属模块(manage),所属节点ID(243),节点标题(开通),节点链接(manage/merchant/enable)', '1', '1527086514');
INSERT INTO `fc_admin_log` VALUES ('16', '30', '1', '0', 'admin_menu', '246', '超级管理员 添加了节点：所属模块(manage),所属节点ID(243),节点标题(冻结),节点链接(manage/merchant/disable)', '1', '1527086562');
INSERT INTO `fc_admin_log` VALUES ('17', '30', '1', '0', 'admin_menu', '247', '超级管理员 添加了节点：所属模块(manage),所属节点ID(243),节点标题(修改),节点链接(manage/merchant/edit)', '1', '1527087052');
INSERT INTO `fc_admin_log` VALUES ('18', '30', '1', '0', 'admin_menu', '248', '超级管理员 添加了节点：所属模块(manage),所属节点ID(243),节点标题(详情),节点链接(manage/merchant/edit)', '1', '1527087066');
INSERT INTO `fc_admin_log` VALUES ('19', '31', '1', '0', 'admin_menu', '248', '超级管理员 编辑了节点：节点ID(248)', '1', '1527087860');
INSERT INTO `fc_admin_log` VALUES ('20', '42', '1', '0', 'admin_config', '0', '超级管理员 更新了系统设置：分组(system)', '1', '1527177481');
INSERT INTO `fc_admin_log` VALUES ('21', '8', '1', '0', 'admin_role', '3', '超级管理员 编辑了角色：管理员', '1', '1527177502');
INSERT INTO `fc_admin_log` VALUES ('22', '30', '1', '0', 'admin_menu', '249', '超级管理员 添加了节点：所属模块(manage),所属节点ID(236),节点标题(车源管理),节点链接()', '1', '1527239468');
INSERT INTO `fc_admin_log` VALUES ('23', '30', '1', '0', 'admin_menu', '250', '超级管理员 添加了节点：所属模块(manage),所属节点ID(249),节点标题(发布车源),节点链接(manage/carsource/add)', '1', '1527239493');
INSERT INTO `fc_admin_log` VALUES ('24', '30', '1', '0', 'admin_menu', '251', '超级管理员 添加了节点：所属模块(manage),所属节点ID(249),节点标题(车源列表),节点链接(manage/carsource/index)', '1', '1527332683');
INSERT INTO `fc_admin_log` VALUES ('25', '30', '1', '0', 'admin_menu', '252', '超级管理员 添加了节点：所属模块(manage),所属节点ID(251),节点标题(修改),节点链接(manage/carsource/edit)', '1', '1527332711');
INSERT INTO `fc_admin_log` VALUES ('26', '30', '1', '0', 'admin_menu', '253', '超级管理员 添加了节点：所属模块(manage),所属节点ID(251),节点标题(详情),节点链接(manage/carsource/look)', '1', '1527338850');
INSERT INTO `fc_admin_log` VALUES ('27', '30', '1', '0', 'admin_menu', '254', '超级管理员 添加了节点：所属模块(manage),所属节点ID(251),节点标题(审核通过),节点链接(manage/carsource/enable)', '1', '1527356177');
INSERT INTO `fc_admin_log` VALUES ('28', '30', '1', '0', 'admin_menu', '255', '超级管理员 添加了节点：所属模块(manage),所属节点ID(251),节点标题(拒绝),节点链接(manage/carsource/disable)', '1', '1527356198');
INSERT INTO `fc_admin_log` VALUES ('29', '30', '1', '0', 'admin_menu', '256', '超级管理员 添加了节点：所属模块(manage),所属节点ID(251),节点标题(上架),节点链接(manage/carsource/upstock)', '1', '1527356219');
INSERT INTO `fc_admin_log` VALUES ('30', '30', '1', '0', 'admin_menu', '257', '超级管理员 添加了节点：所属模块(manage),所属节点ID(251),节点标题(下架),节点链接(manage/carsource/downstock)', '1', '1527356235');
INSERT INTO `fc_admin_log` VALUES ('31', '30', '1', '0', 'admin_menu', '258', '超级管理员 添加了节点：所属模块(manage),所属节点ID(251),节点标题(退库),节点链接(manage/carsource/outstock)', '1', '1527356260');
INSERT INTO `fc_admin_log` VALUES ('32', '30', '1', '0', 'admin_menu', '259', '超级管理员 添加了节点：所属模块(manage),所属节点ID(251),节点标题(打印价签),节点链接(manage/carsource/printig)', '1', '1527356306');
INSERT INTO `fc_admin_log` VALUES ('33', '42', '1', '0', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1527363207');
INSERT INTO `fc_admin_log` VALUES ('34', '8', '1', '0', 'admin_role', '3', '超级管理员 编辑了角色：管理员', '1', '1527363320');
INSERT INTO `fc_admin_log` VALUES ('35', '8', '1', '0', 'admin_role', '2', '超级管理员 编辑了角色：商户', '1', '1527363352');
INSERT INTO `fc_admin_log` VALUES ('36', '2', '1', '0', 'admin_user', '1', '超级管理员 编辑了用户：超级管理员', '1', '1527364671');
INSERT INTO `fc_admin_log` VALUES ('37', '8', '1', '0', 'admin_role', '2', '超级管理员 编辑了角色：商户', '1', '1527364762');
INSERT INTO `fc_admin_log` VALUES ('38', '8', '1', '0', 'admin_role', '2', '超级管理员 编辑了角色：商户', '1', '1527364778');
INSERT INTO `fc_admin_log` VALUES ('39', '8', '1', '0', 'admin_role', '3', '超级管理员 编辑了角色：管理员', '1', '1527364787');
INSERT INTO `fc_admin_log` VALUES ('40', '30', '1', '0', 'admin_menu', '260', '超级管理员 添加了节点：所属模块(manage),所属节点ID(236),节点标题(客户管理),节点链接()', '1', '1527492673');
INSERT INTO `fc_admin_log` VALUES ('41', '30', '1', '0', 'admin_menu', '261', '超级管理员 添加了节点：所属模块(manage),所属节点ID(260),节点标题(客户列表),节点链接(manage/customer/index)', '1', '1527492743');
INSERT INTO `fc_admin_log` VALUES ('42', '30', '1', '0', 'admin_menu', '262', '超级管理员 添加了节点：所属模块(manage),所属节点ID(260),节点标题(新建客户),节点链接(manage/customer/add)', '1', '1527492766');
INSERT INTO `fc_admin_log` VALUES ('43', '30', '1', '0', 'admin_menu', '263', '超级管理员 添加了节点：所属模块(manage),所属节点ID(261),节点标题(修改),节点链接(manage/customer/edit)', '1', '1527520545');
INSERT INTO `fc_admin_log` VALUES ('44', '30', '1', '0', 'admin_menu', '264', '超级管理员 添加了节点：所属模块(manage),所属节点ID(261),节点标题(详情),节点链接(manage/customer/look)', '1', '1527522909');
INSERT INTO `fc_admin_log` VALUES ('45', '30', '1', '0', 'admin_menu', '265', '超级管理员 添加了节点：所属模块(manage),所属节点ID(261),节点标题(转交),节点链接(manage/customer/deliver)', '1', '1527526696');
INSERT INTO `fc_admin_log` VALUES ('46', '30', '1', '0', 'admin_menu', '266', '超级管理员 添加了节点：所属模块(manage),所属节点ID(261),节点标题(导出),节点链接(manage/customer/export)', '1', '1527526734');
INSERT INTO `fc_admin_log` VALUES ('47', '8', '1', '0', 'admin_role', '2', '超级管理员 编辑了角色：商户', '1', '1527589675');
INSERT INTO `fc_admin_log` VALUES ('48', '8', '1', '0', 'admin_role', '3', '超级管理员 编辑了角色：管理员', '1', '1527589688');
INSERT INTO `fc_admin_log` VALUES ('49', '30', '1', '0', 'admin_menu', '267', '超级管理员 添加了节点：所属模块(manage),所属节点ID(236),节点标题(订单管理),节点链接()', '1', '1527596806');
INSERT INTO `fc_admin_log` VALUES ('50', '30', '1', '0', 'admin_menu', '268', '超级管理员 添加了节点：所属模块(manage),所属节点ID(267),节点标题(订单列表),节点链接(manage/order/index)', '1', '1527596837');
INSERT INTO `fc_admin_log` VALUES ('51', '30', '1', '0', 'admin_menu', '269', '超级管理员 添加了节点：所属模块(manage),所属节点ID(267),节点标题(创建订单),节点链接(manage/order/add)', '1', '1527596864');
INSERT INTO `fc_admin_log` VALUES ('52', '30', '1', '0', 'admin_menu', '270', '超级管理员 添加了节点：所属模块(manage),所属节点ID(268),节点标题(修改),节点链接(manage/order/edit)', '1', '1527596893');
INSERT INTO `fc_admin_log` VALUES ('53', '30', '1', '0', 'admin_menu', '271', '超级管理员 添加了节点：所属模块(manage),所属节点ID(268),节点标题(详情),节点链接(manage/order/look)', '1', '1527596910');
INSERT INTO `fc_admin_log` VALUES ('54', '30', '1', '0', 'admin_menu', '272', '超级管理员 添加了节点：所属模块(manage),所属节点ID(236),节点标题(个人卖车信息管理),节点链接()', '1', '1527750395');
INSERT INTO `fc_admin_log` VALUES ('55', '30', '1', '0', 'admin_menu', '273', '超级管理员 添加了节点：所属模块(manage),所属节点ID(272),节点标题(个人卖车信息列表),节点链接(manage/sellcar/index)', '1', '1527750448');
INSERT INTO `fc_admin_log` VALUES ('56', '30', '1', '0', 'admin_menu', '274', '超级管理员 添加了节点：所属模块(manage),所属节点ID(273),节点标题(详情),节点链接(manage/sellcar/look)', '1', '1527750493');
INSERT INTO `fc_admin_log` VALUES ('57', '30', '1', '0', 'admin_menu', '275', '超级管理员 添加了节点：所属模块(manage),所属节点ID(236),节点标题(估价管理),节点链接()', '1', '1527750621');
INSERT INTO `fc_admin_log` VALUES ('58', '30', '1', '0', 'admin_menu', '276', '超级管理员 添加了节点：所属模块(manage),所属节点ID(275),节点标题(估价列表),节点链接(manage/evaluate/index)', '1', '1527750704');
INSERT INTO `fc_admin_log` VALUES ('59', '30', '1', '0', 'admin_menu', '277', '超级管理员 添加了节点：所属模块(manage),所属节点ID(236),节点标题(营销管理),节点链接()', '1', '1527750885');
INSERT INTO `fc_admin_log` VALUES ('60', '30', '1', '0', 'admin_menu', '278', '超级管理员 添加了节点：所属模块(manage),所属节点ID(236),节点标题(反馈管理),节点链接()', '1', '1527750946');
INSERT INTO `fc_admin_log` VALUES ('61', '30', '1', '0', 'admin_menu', '279', '超级管理员 添加了节点：所属模块(manage),所属节点ID(278),节点标题(反馈列表),节点链接(manage/feedback/index)', '1', '1527750973');
INSERT INTO `fc_admin_log` VALUES ('62', '30', '1', '0', 'admin_menu', '280', '超级管理员 添加了节点：所属模块(manage),所属节点ID(236),节点标题(分期管理),节点链接()', '1', '1527751076');
INSERT INTO `fc_admin_log` VALUES ('63', '30', '1', '0', 'admin_menu', '281', '超级管理员 添加了节点：所属模块(manage),所属节点ID(280),节点标题(分期列表),节点链接(manage/bystage/index)', '1', '1527751144');
INSERT INTO `fc_admin_log` VALUES ('64', '30', '1', '0', 'admin_menu', '282', '超级管理员 添加了节点：所属模块(manage),所属节点ID(281),节点标题(修改),节点链接(manage/bystage/edit)', '1', '1527751173');
INSERT INTO `fc_admin_log` VALUES ('65', '31', '1', '0', 'admin_menu', '281', '超级管理员 编辑了节点：节点ID(281)', '1', '1527758669');
INSERT INTO `fc_admin_log` VALUES ('66', '31', '1', '0', 'admin_menu', '282', '超级管理员 编辑了节点：节点ID(282)', '1', '1527758678');
INSERT INTO `fc_admin_log` VALUES ('67', '30', '1', '0', 'admin_menu', '283', '超级管理员 添加了节点：所属模块(manage),所属节点ID(277),节点标题(Banner列表),节点链接(manage/banner/index)', '1', '1527770514');
INSERT INTO `fc_admin_log` VALUES ('68', '30', '1', '0', 'admin_menu', '284', '超级管理员 添加了节点：所属模块(manage),所属节点ID(277),节点标题(添加Banner),节点链接(manage/banner/add)', '1', '1527770550');
INSERT INTO `fc_admin_log` VALUES ('69', '30', '1', '0', 'admin_menu', '285', '超级管理员 添加了节点：所属模块(manage),所属节点ID(283),节点标题(修改),节点链接(manage/banner/edit)', '1', '1527770595');
INSERT INTO `fc_admin_log` VALUES ('70', '30', '1', '0', 'admin_menu', '286', '超级管理员 添加了节点：所属模块(manage),所属节点ID(283),节点标题(删除),节点链接(manage/banner/delete)', '1', '1527770619');
INSERT INTO `fc_admin_log` VALUES ('71', '30', '1', '0', 'admin_menu', '287', '超级管理员 添加了节点：所属模块(manage),所属节点ID(283),节点标题(manage/banner/move),节点链接(移动)', '1', '1527771879');
INSERT INTO `fc_admin_log` VALUES ('72', '31', '1', '0', 'admin_menu', '287', '超级管理员 编辑了节点：节点ID(287)', '1', '1527771894');
INSERT INTO `fc_admin_log` VALUES ('73', '8', '1', '0', 'admin_role', '3', '超级管理员 编辑了角色：管理员', '1', '1527776383');
INSERT INTO `fc_admin_log` VALUES ('74', '8', '1', '0', 'admin_role', '3', '超级管理员 编辑了角色：管理员', '1', '1527777341');

-- ----------------------------
-- Table structure for fc_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `fc_admin_menu`;
CREATE TABLE `fc_admin_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级菜单id',
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '模块名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '菜单标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url_type` varchar(16) NOT NULL DEFAULT '' COMMENT '链接类型（link：外链，module：模块）',
  `url_value` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `url_target` varchar(16) NOT NULL DEFAULT '_self' COMMENT '链接打开方式：_blank,_self',
  `online_hide` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '网站上线后是否隐藏',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `system_menu` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统菜单，系统菜单不可删除',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `params` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=288 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of fc_admin_menu
-- ----------------------------
INSERT INTO `fc_admin_menu` VALUES ('1', '0', 'admin', '首页', 'fa fa-fw fa-home', 'module_admin', 'admin/index/index', '_self', '0', '1467617722', '1477710540', '1', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('2', '1', 'admin', '快捷操作', 'fa fa-fw fa-folder-open-o', 'module_admin', '', '_self', '0', '1467618170', '1477710695', '1', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('3', '2', 'admin', '清空缓存', 'fa fa-fw fa-trash-o', 'module_admin', 'admin/index/wipecache', '_self', '0', '1467618273', '1489049773', '3', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('4', '0', 'admin', '系统', 'fa fa-fw fa-gear', 'module_admin', 'admin/system/index', '_self', '0', '1467618361', '1477710540', '2', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('5', '4', 'admin', '系统功能', 'si si-wrench', 'module_admin', '', '_self', '0', '1467618441', '1477710695', '1', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('6', '5', 'admin', '系统设置', 'fa fa-fw fa-wrench', 'module_admin', 'admin/system/index', '_self', '0', '1467618490', '1477710695', '1', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('7', '5', 'admin', '配置管理', 'fa fa-fw fa-gears', 'module_admin', 'admin/config/index', '_self', '0', '1467618618', '1477710695', '2', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('8', '7', 'admin', '新增', '', 'module_admin', 'admin/config/add', '_self', '0', '1467618648', '1477710695', '1', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('9', '7', 'admin', '编辑', '', 'module_admin', 'admin/config/edit', '_self', '0', '1467619566', '1477710695', '2', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('10', '7', 'admin', '删除', '', 'module_admin', 'admin/config/delete', '_self', '0', '1467619583', '1477710695', '3', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('11', '7', 'admin', '启用', '', 'module_admin', 'admin/config/enable', '_self', '0', '1467619609', '1477710695', '4', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('12', '7', 'admin', '禁用', '', 'module_admin', 'admin/config/disable', '_self', '0', '1467619637', '1477710695', '5', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('13', '5', 'admin', '节点管理', 'fa fa-fw fa-bars', 'module_admin', 'admin/menu/index', '_self', '0', '1467619882', '1477710695', '3', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('14', '13', 'admin', '新增', '', 'module_admin', 'admin/menu/add', '_self', '0', '1467619902', '1477710695', '1', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('15', '13', 'admin', '编辑', '', 'module_admin', 'admin/menu/edit', '_self', '0', '1467620331', '1477710695', '2', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('16', '13', 'admin', '删除', '', 'module_admin', 'admin/menu/delete', '_self', '0', '1467620363', '1477710695', '3', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('17', '13', 'admin', '启用', '', 'module_admin', 'admin/menu/enable', '_self', '0', '1467620386', '1477710695', '4', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('18', '13', 'admin', '禁用', '', 'module_admin', 'admin/menu/disable', '_self', '0', '1467620404', '1477710695', '5', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('19', '68', 'user', '权限管理', 'fa fa-fw fa-key', 'module_admin', '', '_self', '0', '1467688065', '1477710702', '1', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('20', '19', 'user', '用户管理', 'fa fa-fw fa-user', 'module_admin', 'user/index/index', '_self', '0', '1467688137', '1477710702', '1', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('21', '20', 'user', '新增', '', 'module_admin', 'user/index/add', '_self', '0', '1467688177', '1477710702', '1', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('22', '20', 'user', '编辑', '', 'module_admin', 'user/index/edit', '_self', '0', '1467688202', '1477710702', '2', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('23', '20', 'user', '删除', '', 'module_admin', 'user/index/delete', '_self', '0', '1467688219', '1477710702', '3', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('24', '20', 'user', '启用', '', 'module_admin', 'user/index/enable', '_self', '0', '1467688238', '1477710702', '4', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('25', '20', 'user', '禁用', '', 'module_admin', 'user/index/disable', '_self', '0', '1467688256', '1477710702', '5', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('211', '64', 'admin', '日志详情', '', 'module_admin', 'admin/log/details', '_self', '0', '1480299320', '1480299320', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('32', '4', 'admin', '扩展中心', 'si si-social-dropbox', 'module_admin', '', '_self', '0', '1467688853', '1477710695', '2', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('33', '32', 'admin', '模块管理', 'fa fa-fw fa-th-large', 'module_admin', 'admin/module/index', '_self', '0', '1467689008', '1477710695', '1', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('34', '33', 'admin', '导入', '', 'module_admin', 'admin/module/import', '_self', '0', '1467689153', '1477710695', '1', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('35', '33', 'admin', '导出', '', 'module_admin', 'admin/module/export', '_self', '0', '1467689173', '1477710695', '2', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('36', '33', 'admin', '安装', '', 'module_admin', 'admin/module/install', '_self', '0', '1467689192', '1477710695', '3', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('37', '33', 'admin', '卸载', '', 'module_admin', 'admin/module/uninstall', '_self', '0', '1467689241', '1477710695', '4', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('38', '33', 'admin', '启用', '', 'module_admin', 'admin/module/enable', '_self', '0', '1467689294', '1477710695', '5', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('39', '33', 'admin', '禁用', '', 'module_admin', 'admin/module/disable', '_self', '0', '1467689312', '1477710695', '6', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('40', '33', 'admin', '更新', '', 'module_admin', 'admin/module/update', '_self', '0', '1467689341', '1477710695', '7', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('41', '32', 'admin', '插件管理', 'fa fa-fw fa-puzzle-piece', 'module_admin', 'admin/plugin/index', '_self', '0', '1467689527', '1477710695', '2', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('42', '41', 'admin', '导入', '', 'module_admin', 'admin/plugin/import', '_self', '0', '1467689650', '1477710695', '1', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('43', '41', 'admin', '导出', '', 'module_admin', 'admin/plugin/export', '_self', '0', '1467689665', '1477710695', '2', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('44', '41', 'admin', '安装', '', 'module_admin', 'admin/plugin/install', '_self', '0', '1467689680', '1477710695', '3', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('45', '41', 'admin', '卸载', '', 'module_admin', 'admin/plugin/uninstall', '_self', '0', '1467689700', '1477710695', '4', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('46', '41', 'admin', '启用', '', 'module_admin', 'admin/plugin/enable', '_self', '0', '1467689730', '1477710695', '5', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('47', '41', 'admin', '禁用', '', 'module_admin', 'admin/plugin/disable', '_self', '0', '1467689747', '1477710695', '6', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('48', '41', 'admin', '设置', '', 'module_admin', 'admin/plugin/config', '_self', '0', '1467689789', '1477710695', '7', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('49', '41', 'admin', '管理', '', 'module_admin', 'admin/plugin/manage', '_self', '0', '1467689846', '1477710695', '8', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('50', '5', 'admin', '附件管理', 'fa fa-fw fa-cloud-upload', 'module_admin', 'admin/attachment/index', '_self', '0', '1467690161', '1477710695', '4', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('51', '70', 'admin', '文件上传', '', 'module_admin', 'admin/attachment/upload', '_self', '0', '1467690240', '1489049773', '1', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('52', '50', 'admin', '下载', '', 'module_admin', 'admin/attachment/download', '_self', '0', '1467690334', '1477710695', '2', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('53', '50', 'admin', '启用', '', 'module_admin', 'admin/attachment/enable', '_self', '0', '1467690352', '1477710695', '3', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('54', '50', 'admin', '禁用', '', 'module_admin', 'admin/attachment/disable', '_self', '0', '1467690369', '1477710695', '4', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('55', '50', 'admin', '删除', '', 'module_admin', 'admin/attachment/delete', '_self', '0', '1467690396', '1477710695', '5', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('56', '41', 'admin', '删除', '', 'module_admin', 'admin/plugin/delete', '_self', '0', '1467858065', '1477710695', '11', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('57', '41', 'admin', '编辑', '', 'module_admin', 'admin/plugin/edit', '_self', '0', '1467858092', '1477710695', '10', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('60', '41', 'admin', '新增', '', 'module_admin', 'admin/plugin/add', '_self', '0', '1467858421', '1477710695', '9', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('61', '41', 'admin', '执行', '', 'module_admin', 'admin/plugin/execute', '_self', '0', '1467879016', '1477710695', '14', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('62', '13', 'admin', '保存', '', 'module_admin', 'admin/menu/save', '_self', '0', '1468073039', '1477710695', '6', '1', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('64', '5', 'admin', '系统日志', 'fa fa-fw fa-book', 'module_admin', 'admin/log/index', '_self', '0', '1476111944', '1477710695', '6', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('65', '5', 'admin', '数据库管理', 'fa fa-fw fa-database', 'module_admin', 'admin/database/index', '_self', '0', '1476111992', '1477710695', '8', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('66', '32', 'admin', '数据包管理', 'fa fa-fw fa-database', 'module_admin', 'admin/packet/index', '_self', '0', '1476112326', '1477710695', '4', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('67', '19', 'user', '角色管理', 'fa fa-fw fa-users', 'module_admin', 'user/role/index', '_self', '0', '1476113025', '1477710702', '3', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('68', '0', 'user', '用户', 'fa fa-fw fa-user', 'module_admin', 'user/index/index', '_self', '0', '1476193348', '1477710540', '3', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('69', '32', 'admin', '钩子管理', 'fa fa-fw fa-anchor', 'module_admin', 'admin/hook/index', '_self', '0', '1476236193', '1477710695', '3', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('70', '2', 'admin', '后台首页', 'fa fa-fw fa-tachometer', 'module_admin', 'admin/index/index', '_self', '0', '1476237472', '1489049773', '1', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('71', '67', 'user', '新增', '', 'module_admin', 'user/role/add', '_self', '0', '1476256935', '1477710702', '1', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('72', '67', 'user', '编辑', '', 'module_admin', 'user/role/edit', '_self', '0', '1476256968', '1477710702', '2', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('73', '67', 'user', '删除', '', 'module_admin', 'user/role/delete', '_self', '0', '1476256993', '1477710702', '3', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('74', '67', 'user', '启用', '', 'module_admin', 'user/role/enable', '_self', '0', '1476257023', '1477710702', '4', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('75', '67', 'user', '禁用', '', 'module_admin', 'user/role/disable', '_self', '0', '1476257046', '1477710702', '5', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('76', '20', 'user', '授权', '', 'module_admin', 'user/index/access', '_self', '0', '1476375187', '1477710702', '6', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('77', '69', 'admin', '新增', '', 'module_admin', 'admin/hook/add', '_self', '0', '1476668971', '1477710695', '1', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('78', '69', 'admin', '编辑', '', 'module_admin', 'admin/hook/edit', '_self', '0', '1476669006', '1477710695', '2', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('79', '69', 'admin', '删除', '', 'module_admin', 'admin/hook/delete', '_self', '0', '1476669375', '1477710695', '3', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('80', '69', 'admin', '启用', '', 'module_admin', 'admin/hook/enable', '_self', '0', '1476669427', '1477710695', '4', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('81', '69', 'admin', '禁用', '', 'module_admin', 'admin/hook/disable', '_self', '0', '1476669564', '1477710695', '5', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('183', '66', 'admin', '安装', '', 'module_admin', 'admin/packet/install', '_self', '0', '1476851362', '1477710695', '1', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('184', '66', 'admin', '卸载', '', 'module_admin', 'admin/packet/uninstall', '_self', '0', '1476851382', '1477710695', '2', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('185', '5', 'admin', '行为管理', 'fa fa-fw fa-bug', 'module_admin', 'admin/action/index', '_self', '0', '1476882441', '1477710695', '7', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('186', '185', 'admin', '新增', '', 'module_admin', 'admin/action/add', '_self', '0', '1476884439', '1477710695', '1', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('187', '185', 'admin', '编辑', '', 'module_admin', 'admin/action/edit', '_self', '0', '1476884464', '1477710695', '2', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('188', '185', 'admin', '启用', '', 'module_admin', 'admin/action/enable', '_self', '0', '1476884493', '1477710695', '3', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('189', '185', 'admin', '禁用', '', 'module_admin', 'admin/action/disable', '_self', '0', '1476884534', '1477710695', '4', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('190', '185', 'admin', '删除', '', 'module_admin', 'admin/action/delete', '_self', '0', '1476884551', '1477710695', '5', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('191', '65', 'admin', '备份数据库', '', 'module_admin', 'admin/database/export', '_self', '0', '1476972746', '1477710695', '1', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('192', '65', 'admin', '还原数据库', '', 'module_admin', 'admin/database/import', '_self', '0', '1476972772', '1477710695', '2', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('193', '65', 'admin', '优化表', '', 'module_admin', 'admin/database/optimize', '_self', '0', '1476972800', '1477710695', '3', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('194', '65', 'admin', '修复表', '', 'module_admin', 'admin/database/repair', '_self', '0', '1476972825', '1477710695', '4', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('195', '65', 'admin', '删除备份', '', 'module_admin', 'admin/database/delete', '_self', '0', '1476973457', '1477710695', '5', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('210', '41', 'admin', '快速编辑', '', 'module_admin', 'admin/plugin/quickedit', '_self', '0', '1477713981', '1477713981', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('209', '185', 'admin', '快速编辑', '', 'module_admin', 'admin/action/quickedit', '_self', '0', '1477713939', '1477713939', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('208', '7', 'admin', '快速编辑', '', 'module_admin', 'admin/config/quickedit', '_self', '0', '1477713808', '1477713808', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('207', '69', 'admin', '快速编辑', '', 'module_admin', 'admin/hook/quickedit', '_self', '0', '1477713770', '1477713770', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('212', '2', 'admin', '个人设置', 'fa fa-fw fa-user', 'module_admin', 'admin/index/profile', '_self', '0', '1489049767', '1489049773', '2', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('213', '70', 'admin', '检查版本更新', '', 'module_admin', 'admin/index/checkupdate', '_self', '0', '1490588610', '1490588610', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('214', '68', 'user', '消息管理', 'fa fa-fw fa-comments-o', 'module_admin', '', '_self', '0', '1520492129', '1520492129', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('215', '214', 'user', '消息列表', 'fa fa-fw fa-th-list', 'module_admin', 'user/message/index', '_self', '0', '1520492195', '1520492195', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('216', '215', 'user', '新增', '', 'module_admin', 'user/message/add', '_self', '0', '1520492195', '1520492195', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('217', '215', 'user', '编辑', '', 'module_admin', 'user/message/edit', '_self', '0', '1520492195', '1520492195', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('218', '215', 'user', '删除', '', 'module_admin', 'user/message/delete', '_self', '0', '1520492195', '1520492195', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('219', '215', 'user', '启用', '', 'module_admin', 'user/message/enable', '_self', '0', '1520492195', '1520492195', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('220', '215', 'user', '禁用', '', 'module_admin', 'user/message/disable', '_self', '0', '1520492195', '1520492195', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('221', '215', 'user', '快速编辑', '', 'module_admin', 'user/message/quickedit', '_self', '0', '1520492195', '1520492195', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('222', '2', 'admin', '消息中心', 'fa fa-fw fa-comments-o', 'module_admin', 'admin/message/index', '_self', '0', '1520495992', '1520496254', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('223', '222', 'admin', '删除', '', 'module_admin', 'admin/message/delete', '_self', '0', '1520495992', '1520496263', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('224', '222', 'admin', '启用', '', 'module_admin', 'admin/message/enable', '_self', '0', '1520495992', '1520496270', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('225', '32', 'admin', '图标管理', 'fa fa-fw fa-tint', 'module_admin', 'admin/icon/index', '_self', '0', '1520908295', '1520908295', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('226', '225', 'admin', '新增', '', 'module_admin', 'admin/icon/add', '_self', '0', '1520908295', '1520908295', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('227', '225', 'admin', '编辑', '', 'module_admin', 'admin/icon/edit', '_self', '0', '1520908295', '1520908295', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('228', '225', 'admin', '删除', '', 'module_admin', 'admin/icon/delete', '_self', '0', '1520908295', '1520908295', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('229', '225', 'admin', '启用', '', 'module_admin', 'admin/icon/enable', '_self', '0', '1520908295', '1520908295', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('230', '225', 'admin', '禁用', '', 'module_admin', 'admin/icon/disable', '_self', '0', '1520908295', '1520908295', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('231', '225', 'admin', '快速编辑', '', 'module_admin', 'admin/icon/quickedit', '_self', '0', '1520908295', '1520908295', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('232', '225', 'admin', '图标列表', '', 'module_admin', 'admin/icon/items', '_self', '0', '1520923368', '1520923368', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('233', '225', 'admin', '更新图标', '', 'module_admin', 'admin/icon/reload', '_self', '0', '1520931908', '1520931908', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('234', '20', 'user', '快速编辑', '', 'module_admin', 'user/index/quickedit', '_self', '0', '1526028258', '1526028258', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('235', '67', 'user', '快速编辑', '', 'module_admin', 'user/role/quickedit', '_self', '0', '1526028282', '1526028282', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('236', '0', 'manage', '好车', 'fa fa-fw fa-cab', 'module_admin', 'manage/index/index', '_self', '0', '1526974986', '1526974986', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('237', '236', 'manage', '用户管理', 'fa fa-fw fa-user', 'module_admin', '', '_self', '0', '1526975057', '1527332689', '2', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('238', '237', 'manage', '用户列表', 'fa fa-fw fa-list', 'module_admin', 'manage/user/index', '_self', '0', '1526975105', '1527332689', '1', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('239', '236', 'manage', '管理首页', 'fa fa-fw fa-home', 'module_admin', 'manage/index/index', '_self', '0', '1526975297', '1527332689', '1', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('240', '238', 'manage', '导出', '', 'module_admin', 'manage/user/export', '_self', '0', '1527000768', '1527332689', '1', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('241', '236', 'manage', '商户管理', 'fa fa-fw fa-user-secret', 'module_admin', '', '_self', '0', '1527068680', '1527332689', '3', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('242', '241', 'manage', '商户开立', 'fa fa-fw fa-list', 'module_admin', 'manage/merchant/add', '_self', '0', '1527068744', '1527332689', '2', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('243', '241', 'manage', '商户列表', 'fa fa-fw fa-list', 'module_admin', 'manage/merchant/index', '_self', '0', '1527068773', '1527332689', '1', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('244', '243', 'manage', '导出', '', 'module_admin', 'manage/merchant/export', '_self', '0', '1527068802', '1527332689', '1', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('245', '243', 'manage', '开通', '', 'module_admin', 'manage/merchant/enable', '_self', '0', '1527086514', '1527332689', '2', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('246', '243', 'manage', '冻结', '', 'module_admin', 'manage/merchant/disable', '_self', '0', '1527086562', '1527332689', '3', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('247', '243', 'manage', '修改', '', 'module_admin', 'manage/merchant/edit', '_self', '0', '1527087052', '1527332689', '4', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('248', '243', 'manage', '详情', '', 'module_admin', 'manage/merchant/look', '_self', '0', '1527087066', '1527332689', '5', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('249', '236', 'manage', '车源管理', 'fa fa-fw fa-car', 'module_admin', '', '_self', '0', '1527239468', '1527332689', '4', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('250', '249', 'manage', '发布车源', 'fa fa-fw fa-list', 'module_admin', 'manage/carsource/add', '_self', '0', '1527239493', '1527332689', '2', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('251', '249', 'manage', '车源列表', 'fa fa-fw fa-list', 'module_admin', 'manage/carsource/index', '_self', '0', '1527332683', '1527332689', '1', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('252', '251', 'manage', '修改', '', 'module_admin', 'manage/carsource/edit', '_self', '0', '1527332711', '1527332711', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('253', '251', 'manage', '详情', '', 'module_admin', 'manage/carsource/look', '_self', '0', '1527338850', '1527338850', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('254', '251', 'manage', '审核通过', '', 'module_admin', 'manage/carsource/enable', '_self', '0', '1527356177', '1527356177', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('255', '251', 'manage', '拒绝', '', 'module_admin', 'manage/carsource/disable', '_self', '0', '1527356199', '1527356199', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('256', '251', 'manage', '上架', '', 'module_admin', 'manage/carsource/upstock', '_self', '0', '1527356219', '1527356219', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('257', '251', 'manage', '下架', '', 'module_admin', 'manage/carsource/downstock', '_self', '0', '1527356236', '1527356236', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('258', '251', 'manage', '退库', '', 'module_admin', 'manage/carsource/outstock', '_self', '0', '1527356260', '1527356260', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('259', '251', 'manage', '打印价签', '', 'module_admin', 'manage/carsource/printig', '_self', '0', '1527356307', '1527356307', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('260', '236', 'manage', '客户管理', 'fa fa-fw fa-user-o', 'module_admin', '', '_self', '0', '1527492673', '1527492673', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('261', '260', 'manage', '客户列表', 'fa fa-fw fa-list', 'module_admin', 'manage/customer/index', '_self', '0', '1527492743', '1527492743', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('262', '260', 'manage', '新建客户', 'fa fa-fw fa-list', 'module_admin', 'manage/customer/add', '_self', '0', '1527492766', '1527492766', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('263', '261', 'manage', '修改', '', 'module_admin', 'manage/customer/edit', '_self', '0', '1527520545', '1527520545', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('264', '261', 'manage', '详情', '', 'module_admin', 'manage/customer/look', '_self', '0', '1527522909', '1527522909', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('265', '261', 'manage', '转交', '', 'module_admin', 'manage/customer/deliver', '_self', '0', '1527526696', '1527526696', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('266', '261', 'manage', '导出', '', 'module_admin', 'manage/customer/export', '_self', '0', '1527526735', '1527526735', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('267', '236', 'manage', '订单管理', 'glyphicon glyphicon-list-alt', 'module_admin', '', '_self', '0', '1527596806', '1527596806', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('268', '267', 'manage', '订单列表', 'fa fa-fw fa-list', 'module_admin', 'manage/order/index', '_self', '0', '1527596838', '1527596838', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('269', '267', 'manage', '创建订单', 'fa fa-fw fa-list', 'module_admin', 'manage/order/add', '_self', '0', '1527596864', '1527596864', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('270', '268', 'manage', '修改', '', 'module_admin', 'manage/order/edit', '_self', '0', '1527596893', '1527596893', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('271', '268', 'manage', '详情', '', 'module_admin', 'manage/order/look', '_self', '0', '1527596910', '1527596910', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('272', '236', 'manage', '个人卖车信息管理', 'fa fa-fw fa-sellsy', 'module_admin', '', '_self', '0', '1527750395', '1527750395', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('273', '272', 'manage', '个人卖车信息列表', 'fa fa-fw fa-list', 'module_admin', 'manage/sellcar/index', '_self', '0', '1527750448', '1527750448', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('274', '273', 'manage', '详情', '', 'module_admin', 'manage/sellcar/look', '_self', '0', '1527750493', '1527750493', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('275', '236', 'manage', '估价管理', 'fa fa-fw fa-money', 'module_admin', '', '_self', '0', '1527750621', '1527750621', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('276', '275', 'manage', '估价列表', 'fa fa-fw fa-list', 'module_admin', 'manage/evaluate/index', '_self', '0', '1527750704', '1527750704', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('277', '236', 'manage', '营销管理', 'fa fa-fw fa-stack-overflow', 'module_admin', '', '_self', '0', '1527750885', '1527750885', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('278', '236', 'manage', '反馈管理', 'fa fa-fw fa-commenting-o', 'module_admin', '', '_self', '0', '1527750946', '1527750946', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('279', '278', 'manage', '反馈列表', 'fa fa-fw fa-list', 'module_admin', 'manage/feedback/index', '_self', '0', '1527750973', '1527750973', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('280', '236', 'manage', '分期管理', 'fa fa-fw fa-ioxhost', 'module_admin', '', '_self', '0', '1527751076', '1527751076', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('281', '280', 'manage', '贷款利率', 'fa fa-fw fa-list', 'module_admin', 'manage/lendingrate/index', '_self', '0', '1527751144', '1527758669', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('282', '281', 'manage', '修改', '', 'module_admin', 'manage/lendingrate/edit', '_self', '0', '1527751173', '1527758679', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('283', '277', 'manage', 'Banner列表', 'fa fa-fw fa-list', 'module_admin', 'manage/banner/index', '_self', '0', '1527770514', '1527770514', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('284', '277', 'manage', '添加Banner', 'fa fa-fw fa-list', 'module_admin', 'manage/banner/add', '_self', '0', '1527770550', '1527770550', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('285', '283', 'manage', '修改', '', 'module_admin', 'manage/banner/edit', '_self', '0', '1527770595', '1527770595', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('286', '283', 'manage', '删除', '', 'module_admin', 'manage/banner/delete', '_self', '0', '1527770619', '1527770619', '100', '0', '1', '');
INSERT INTO `fc_admin_menu` VALUES ('287', '283', 'manage', '移动', '', 'module_admin', 'manage/banner/move', '_self', '0', '1527771879', '1527771894', '100', '0', '1', '');

-- ----------------------------
-- Table structure for fc_admin_message
-- ----------------------------
DROP TABLE IF EXISTS `fc_admin_message`;
CREATE TABLE `fc_admin_message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid_receive` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '接收消息的用户id',
  `uid_send` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发送消息的用户id',
  `type` varchar(128) NOT NULL DEFAULT '' COMMENT '消息分类',
  `content` text NOT NULL COMMENT '消息内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `read_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '阅读时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消息表';

-- ----------------------------
-- Records of fc_admin_message
-- ----------------------------

-- ----------------------------
-- Table structure for fc_admin_module
-- ----------------------------
DROP TABLE IF EXISTS `fc_admin_module`;
CREATE TABLE `fc_admin_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名称（标识）',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '模块标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `description` text NOT NULL COMMENT '描述',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者主页',
  `config` text COMMENT '配置信息',
  `access` text COMMENT '授权配置',
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) NOT NULL DEFAULT '' COMMENT '模块唯一标识符',
  `system_module` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统模块',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='模块表';

-- ----------------------------
-- Records of fc_admin_module
-- ----------------------------
INSERT INTO `fc_admin_module` VALUES ('1', 'admin', '系统', 'fa fa-fw fa-gear', '系统模块，DolphinPHP的核心模块', 'DolphinPHP', 'http://www.dolphinphp.com', '', '', '1.0.0', 'admin.dolphinphp.module', '1', '1468204902', '1468204902', '100', '1');
INSERT INTO `fc_admin_module` VALUES ('2', 'user', '用户', 'fa fa-fw fa-user', '用户模块，DolphinPHP自带模块', 'DolphinPHP', 'http://www.dolphinphp.com', '', '', '1.0.0', 'user.dolphinphp.module', '1', '1468204902', '1468204902', '100', '1');
INSERT INTO `fc_admin_module` VALUES ('3', 'manage', '好车', '', '好车模块', 'DuJun', '', null, null, '1.0.0', 'manage.djmanage.module', '0', '1526974874', '1526974874', '100', '1');

-- ----------------------------
-- Table structure for fc_admin_packet
-- ----------------------------
DROP TABLE IF EXISTS `fc_admin_packet`;
CREATE TABLE `fc_admin_packet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '数据包名',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '数据包标题',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者url',
  `version` varchar(16) NOT NULL,
  `tables` text NOT NULL COMMENT '数据表名',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='数据包表';

-- ----------------------------
-- Records of fc_admin_packet
-- ----------------------------

-- ----------------------------
-- Table structure for fc_admin_plugin
-- ----------------------------
DROP TABLE IF EXISTS `fc_admin_plugin`;
CREATE TABLE `fc_admin_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '插件名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '插件标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `description` text NOT NULL COMMENT '插件描述',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者主页',
  `config` text NOT NULL COMMENT '配置信息',
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) NOT NULL DEFAULT '' COMMENT '插件唯一标识符',
  `admin` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of fc_admin_plugin
-- ----------------------------
INSERT INTO `fc_admin_plugin` VALUES ('1', 'SystemInfo', '系统环境信息', 'fa fa-fw fa-info-circle', '在后台首页显示服务器信息', '蔡伟明', 'http://www.caiweiming.com', '{\"display\":\"1\",\"width\":\"6\"}', '1.0.0', 'system_info.ming.plugin', '0', '1477757503', '1477757503', '100', '1');
INSERT INTO `fc_admin_plugin` VALUES ('2', 'DevTeam', '开发团队成员信息', 'fa fa-fw fa-users', '开发团队成员信息', '蔡伟明', 'http://www.caiweiming.com', '{\"display\":\"1\",\"width\":\"6\"}', '1.0.0', 'dev_team.ming.plugin', '0', '1477755780', '1477755780', '100', '1');

-- ----------------------------
-- Table structure for fc_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `fc_admin_role`;
CREATE TABLE `fc_admin_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级角色',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '角色描述',
  `menu_auth` text NOT NULL COMMENT '菜单权限',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `access` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否可登录后台',
  `default_module` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '默认访问模块',
  `merchant_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商户ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of fc_admin_role
-- ----------------------------
INSERT INTO `fc_admin_role` VALUES ('1', '0', '超级管理员', '系统默认创建的角色，拥有最高权限', '', '0', '1476270000', '1468117612', '1', '1', '0', '0');
INSERT INTO `fc_admin_role` VALUES ('2', '0', '商户', '车商', '[\"1\",\"2\",\"3\",\"212\",\"236\",\"249\",\"250\",\"251\",\"252\",\"253\",\"256\",\"257\",\"258\",\"259\",\"260\",\"261\",\"262\",\"263\",\"264\",\"266\"]', '100', '1527074536', '1527589676', '1', '1', '236', '0');
INSERT INTO `fc_admin_role` VALUES ('3', '0', '管理员', '', '[\"1\",\"2\",\"3\",\"212\",\"236\",\"237\",\"238\",\"239\",\"240\",\"241\",\"242\",\"243\",\"244\",\"245\",\"246\",\"247\",\"248\",\"249\",\"250\",\"251\",\"252\",\"253\",\"254\",\"255\",\"256\",\"257\",\"258\",\"259\",\"260\",\"261\",\"262\",\"263\",\"264\",\"265\",\"266\",\"267\",\"268\",\"269\",\"270\",\"271\",\"277\",\"283\",\"284\",\"285\",\"286\",\"287\"]', '100', '1527076385', '1527777341', '1', '1', '236', '0');

-- ----------------------------
-- Table structure for fc_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `fc_admin_user`;
CREATE TABLE `fc_admin_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(96) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `email_bind` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否绑定邮箱地址',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `mobile_bind` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否绑定手机号码',
  `avatar` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '头像',
  `money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `role` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `group` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '部门id',
  `signup_ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '注册ip',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次登录时间',
  `last_login_ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '登录ip',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态：0禁用，1启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of fc_admin_user
-- ----------------------------
INSERT INTO `fc_admin_user` VALUES ('1', 'admin', '超级管理员', '$2y$10$N6wHeObAZFx.H9DL1jwenujVi/t97v7aNFMUA0GDxuiobMxVwPpEi', '', '0', '', '0', '0', '0.00', '0', '1', '0', '0', '1476065410', '1527776436', '1527776436', '0', '100', '1');
INSERT INTO `fc_admin_user` VALUES ('2', 'finecar', '第一好车', '$2y$10$8Bwp7x2nG4GWhnMLYQOQiufn6PoSIX0W0UIDu2fbp0sr3juGtQIh.', '', '0', '', '0', '0', '0.00', '0', '3', '0', '0', '1527076428', '1527776400', '1527776400', '0', '100', '1');
INSERT INTO `fc_admin_user` VALUES ('7', 'dujun12342', 'dujun12342', '$2y$10$8Bwp7x2nG4GWhnMLYQOQiufn6PoSIX0W0UIDu2fbp0sr3juGtQIh.', '', '0', '', '0', '0', '0.00', '0', '2', '0', '0', '1527078997', '1527176013', '0', '0', '100', '1');
INSERT INTO `fc_admin_user` VALUES ('6', 'dujun123456', 'dujun123', '$2y$10$8Bwp7x2nG4GWhnMLYQOQiufn6PoSIX0W0UIDu2fbp0sr3juGtQIh.', '', '0', '', '0', '0', '0.00', '0', '2', '0', '0', '1527078997', '1527364802', '1527364802', '0', '100', '1');

-- ----------------------------
-- Table structure for fc_banners
-- ----------------------------
DROP TABLE IF EXISTS `fc_banners`;
CREATE TABLE `fc_banners` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `terminal` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '展示端 0小程序 1pc',
  `img` varchar(1000) NOT NULL DEFAULT '' COMMENT '图片',
  `brand` varchar(1000) NOT NULL DEFAULT '' COMMENT '对应品牌',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '描述',
  `position` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '位置 0首页banner位',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `runner_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作者ID',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='banner';

-- ----------------------------
-- Records of fc_banners
-- ----------------------------
INSERT INTO `fc_banners` VALUES ('1', '0', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/20180531204720V628alXYE6rPUV1Q7aMrfvFRB1.jpg', '中国华为', '华为华为华为华为华为华为', '0', '3', '1', '1527770856');
INSERT INTO `fc_banners` VALUES ('2', '1', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/201805312047582c7MH5GK1HJNb0B0FKI4C4cNqi.jpg', '中国华为', '好吧', '0', '4', '1', '1527770891');
INSERT INTO `fc_banners` VALUES ('3', '0', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/20180531204720V628alXYE6rPUV1Q7aMrfvFRB1.jpg', '中国华为', '华为华为华为华为华为华为1', '0', '1', '1', '1527770856');
INSERT INTO `fc_banners` VALUES ('4', '1', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/201805312047582c7MH5GK1HJNb0B0FKI4C4cNqi.jpg', '中国华为', '好吧1', '0', '1', '1', '1527770891');
INSERT INTO `fc_banners` VALUES ('5', '0', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/20180531204720V628alXYE6rPUV1Q7aMrfvFRB1.jpg', '中国华为', '华为华为华为华为华为华为2', '0', '5', '1', '1527770856');
INSERT INTO `fc_banners` VALUES ('6', '1', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/201805312047582c7MH5GK1HJNb0B0FKI4C4cNqi.jpg', '中国华为', '好吧2', '0', '3', '1', '1527770891');
INSERT INTO `fc_banners` VALUES ('7', '0', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/20180531222202PVc33zQcy1iMoLNHDGG3dTMooF.png', '中国华为', '华为华为华为华为华为华为3', '0', '4', '1', '1527776523');
INSERT INTO `fc_banners` VALUES ('8', '1', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/201805312047582c7MH5GK1HJNb0B0FKI4C4cNqi.jpg', '中国华为', '好吧4', '0', '5', '1', '1527770891');
INSERT INTO `fc_banners` VALUES ('11', '0', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/20180531222557CgsJXbGDNeX9tGCSzrESJush7q.png', 'safsafa', 'fqwqfefw', '0', '2', '1', '1527776763');

-- ----------------------------
-- Table structure for fc_car_sources
-- ----------------------------
DROP TABLE IF EXISTS `fc_car_sources`;
CREATE TABLE `fc_car_sources` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(50) NOT NULL DEFAULT '' COMMENT '车源号',
  `driving_img` varchar(1000) NOT NULL DEFAULT '' COMMENT '行驶证照片',
  `vin_no` varchar(50) NOT NULL DEFAULT '' COMMENT '车架号',
  `brand_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `serie_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '车系id',
  `model_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '型号id',
  `install_config` varchar(2000) NOT NULL DEFAULT '' COMMENT '加装配置',
  `price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '单位：百  价格',
  `color` varchar(255) NOT NULL DEFAULT '' COMMENT '颜色',
  `is_oncard` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否上牌',
  `maintain` varchar(255) NOT NULL DEFAULT '' COMMENT '定期保养',
  `plate_province_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '车牌所在省',
  `plate_city_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '车牌所在市',
  `mileage` varchar(10) NOT NULL DEFAULT '' COMMENT '表显里程',
  `first_plate_at` varchar(50) NOT NULL DEFAULT '' COMMENT '首次上牌时间',
  `year_check_at` varchar(50) NOT NULL DEFAULT '' COMMENT '年检有效期至',
  `insurance_at` varchar(50) NOT NULL DEFAULT '' COMMENT '保险有效期至',
  `out_factory_at` varchar(50) NOT NULL DEFAULT '' COMMENT '出厂日期',
  `guid_price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新手指导价 单位：百',
  `transfer_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '过户次数',
  `key_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '钥匙数量',
  `inner_color` varchar(255) NOT NULL DEFAULT '' COMMENT '内饰颜色',
  `car_condition` varchar(2000) NOT NULL DEFAULT '' COMMENT '车况介绍',
  `imgs` text NOT NULL COMMENT '车源图片',
  `check_result` text NOT NULL COMMENT '检测结论',
  `option_ids` text NOT NULL COMMENT '检测报告选项id',
  `stock_state` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '库存状态 0未上架 1已上架 2已预订 3已出售 4已退库',
  `audit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0待审核 1审核通过 2审核未通过',
  `audit_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间 即审核时间',
  `runner_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `merchant_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商户ID',
  PRIMARY KEY (`id`),
  KEY `runner_id` (`runner_id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='车源';

-- ----------------------------
-- Records of fc_car_sources
-- ----------------------------
INSERT INTO `fc_car_sources` VALUES ('1', 'HC20180526001', '', 'WH32525', '0', '0', '0', '加装配置加装配置加装配置加装配置', '4294967295', '香槟色', '0', '非4S店定期保养', '28', '346', '1.0', '2018-05-17', '2018-05-15', '2018-05-05', '2018-04-30', '4294967295', '2', '3', '', '车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍', 'https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500', '车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论', '14,2,1,15,30,23,43,35,34,44,49,63,51,50,65,83,71,70,85,94,87,104,133,126,135,140,144,141,160,154,153,169,167', '4', '1', '1527326434', '1', '1527326434', '4');
INSERT INTO `fc_car_sources` VALUES ('2', 'HC20180526002', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/7d74e501bea507bbe06b8e0181a19bc1.png', 'WH32525', '0', '0', '0', '加装配置加装配置加装配置加装配置', '4294967295', '香槟色', '0', '非4S店定期保养', '0', '0', '1.0', '2018-05-17', '2018-05-15', '2018-05-05', '2018-04-30', '4294967295', '2', '3', '其它', '车况介绍车况介绍车况介绍车况介绍车况介绍', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/6e6e2019bf4c2c687137c19a8afc0ff8.jpg,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/9212b9bce080dc1e5c55602985628196.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/ea34fd9d73030558b8ef5e90a5432468.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/0d9c5981eee361b6c65012126e009b18.jpg,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/28105648fcb1b1d65913623e2afb6edb.jpg,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/810106bb700a1b08b7a06ec2e1cecd6f.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/ab19c2243af2052b3eaf4374f3ed6d77.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/e14fc873a5a12e9c5e3c026989475d16.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/2fe78f21dcbb24f84a73716c42fa0dfb.jpg,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/48b2e56d8ba22b7297b561da9c146639.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/251eb4866b330d46513960583793d631.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/52b55dd1e305bd115127041359e1f5c2.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/dfdd5f30a01f23921a08ff1a0a19c7f2.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/1e198cfb1c703fdf55b86e1273fcd8c6.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/74815871f714d7bd31f8676aca63047e.png', '车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论', '14,2,1,15,30,23,43,35,34,44,49,63,51,50,65,83,71,70,85,94,87,104,133,126,135,140,144,141,163,161,153,165,169,167', '4', '2', '1527326503', '1', '1527326503', '4');
INSERT INTO `fc_car_sources` VALUES ('4', 'HC20180526004', '', 'WH32525', '0', '0', '0', '加装配置加装配置加装配置加装配置', '22520', '香槟色', '0', '非4S店定期保养', '0', '0', '1.0', '2018-05-17', '2018-05-15', '2018-05-05', '2018-04-30', '2321320', '2', '3', '其它', '车况介绍车况介绍车况介绍车况介绍车况介绍', 'https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500', '车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论', '14,2,1,15,30,23,43,35,34,44,49,63,51,50,65,83,71,70,85,94,87,104,133,126,135,140,144,141,163,161,153,165,169,167', '4', '1', '1527326503', '1', '1527326503', '4');
INSERT INTO `fc_car_sources` VALUES ('3', 'HC20180526001', '', 'WH32525', '0', '0', '0', '加装配置加装配置加装配置加装配置', '4294967295', '香槟色', '0', '非4S店定期保养', '28', '346', '1.0', '2018-05-17', '2018-05-15', '2018-05-05', '2018-04-30', '4294967295', '2', '3', '', '车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍', 'https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500', '车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论', '14,2,1,15,30,23,43,35,34,44,49,63,51,50,65,83,71,70,85,94,87,104,133,126,135,140,144,141,160,154,153,169,167', '4', '1', '1527326434', '1', '1527326434', '4');
INSERT INTO `fc_car_sources` VALUES ('5', 'HC20180526005', '', 'WH32525', '0', '0', '0', '加装配置加装配置加装配置加装配置', '4294967295', '香槟色', '0', '非4S店定期保养', '28', '346', '1.0', '2018-05-17', '2018-05-15', '2018-05-05', '2018-04-30', '4294967295', '2', '3', '', '车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍', 'https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500', '车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论', '14,2,1,15,30,23,43,35,34,44,49,63,51,50,65,83,71,70,85,94,87,104,133,126,135,140,144,141,160,154,153,169,167', '4', '1', '1527326434', '1', '1527326434', '4');
INSERT INTO `fc_car_sources` VALUES ('6', 'HC20180526006', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/7d74e501bea507bbe06b8e0181a19bc1.png', 'WH32525', '0', '0', '0', '加装配置加装配置加装配置加装配置', '4294967295', '香槟色', '0', '非4S店定期保养', '0', '0', '1.0', '2018-05-17', '2018-05-15', '2018-05-05', '2018-04-30', '4294967295', '2', '3', '其它', '车况介绍车况介绍车况介绍车况介绍车况介绍', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/6e6e2019bf4c2c687137c19a8afc0ff8.jpg,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/9212b9bce080dc1e5c55602985628196.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/ea34fd9d73030558b8ef5e90a5432468.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/0d9c5981eee361b6c65012126e009b18.jpg,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/28105648fcb1b1d65913623e2afb6edb.jpg,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/810106bb700a1b08b7a06ec2e1cecd6f.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/ab19c2243af2052b3eaf4374f3ed6d77.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/e14fc873a5a12e9c5e3c026989475d16.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/2fe78f21dcbb24f84a73716c42fa0dfb.jpg,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/48b2e56d8ba22b7297b561da9c146639.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/251eb4866b330d46513960583793d631.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/52b55dd1e305bd115127041359e1f5c2.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/dfdd5f30a01f23921a08ff1a0a19c7f2.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/1e198cfb1c703fdf55b86e1273fcd8c6.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/74815871f714d7bd31f8676aca63047e.png', '车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论', '14,2,1,15,30,23,43,35,34,44,49,63,51,50,65,83,71,70,85,94,87,104,133,126,135,140,144,141,163,161,153,165,169,167', '4', '2', '1527326503', '1', '1527326503', '4');
INSERT INTO `fc_car_sources` VALUES ('7', 'HC20180526007', '', 'WH32525', '0', '0', '0', '加装配置加装配置加装配置加装配置', '22520', '香槟色', '0', '非4S店定期保养', '0', '0', '1.0', '2018-05-17', '2018-05-15', '2018-05-05', '2018-04-30', '2321320', '2', '3', '其它', '车况介绍车况介绍车况介绍车况介绍车况介绍', 'https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500', '车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论', '14,2,1,15,30,23,43,35,34,44,49,63,51,50,65,83,71,70,85,94,87,104,133,126,135,140,144,141,163,161,153,165,169,167', '4', '1', '1527929503', '1', '1527326503', '4');
INSERT INTO `fc_car_sources` VALUES ('8', 'HC20180526008', '', 'WH32525', '0', '0', '0', '加装配置加装配置加装配置加装配置', '4294967295', '香槟色', '0', '非4S店定期保养', '28', '346', '1.0', '2018-05-17', '2018-05-15', '2018-05-05', '2018-04-30', '4294967295', '2', '3', '', '车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍', 'https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500', '车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论', '14,2,1,15,30,23,43,35,34,44,49,63,51,50,65,83,71,70,85,94,87,104,133,126,135,140,144,141,160,154,153,169,167', '4', '1', '1527326434', '1', '1527326434', '4');
INSERT INTO `fc_car_sources` VALUES ('9', 'HC20180526001', '', 'WH32525', '0', '0', '0', '加装配置加装配置加装配置加装配置', '4294967295', '香槟色', '0', '非4S店定期保养', '28', '346', '1.0', '2018-05-17', '2018-05-15', '2018-05-05', '2018-04-30', '4294967295', '2', '3', '', '车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍', 'https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500', '车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论', '14,2,1,15,30,23,43,35,34,44,49,63,51,50,65,83,71,70,85,94,87,104,133,126,135,140,144,141,160,154,153,169,167', '4', '1', '1527326434', '1', '1527326434', '4');
INSERT INTO `fc_car_sources` VALUES ('10', 'HC20180526002', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/7d74e501bea507bbe06b8e0181a19bc1.png', 'WH32525', '0', '0', '0', '加装配置加装配置加装配置加装配置', '4294967295', '香槟色', '0', '非4S店定期保养', '0', '0', '1.0', '2018-05-17', '2018-05-15', '2018-05-05', '2018-04-30', '4294967295', '2', '3', '其它', '车况介绍车况介绍车况介绍车况介绍车况介绍', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/6e6e2019bf4c2c687137c19a8afc0ff8.jpg,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/9212b9bce080dc1e5c55602985628196.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/ea34fd9d73030558b8ef5e90a5432468.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/0d9c5981eee361b6c65012126e009b18.jpg,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/28105648fcb1b1d65913623e2afb6edb.jpg,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/810106bb700a1b08b7a06ec2e1cecd6f.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/ab19c2243af2052b3eaf4374f3ed6d77.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/e14fc873a5a12e9c5e3c026989475d16.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/2fe78f21dcbb24f84a73716c42fa0dfb.jpg,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/48b2e56d8ba22b7297b561da9c146639.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/251eb4866b330d46513960583793d631.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/52b55dd1e305bd115127041359e1f5c2.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/dfdd5f30a01f23921a08ff1a0a19c7f2.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/1e198cfb1c703fdf55b86e1273fcd8c6.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/74815871f714d7bd31f8676aca63047e.png', '车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论', '14,2,1,15,30,23,43,35,34,44,49,63,51,50,65,83,71,70,85,94,87,104,133,126,135,140,144,141,163,161,153,165,169,167', '4', '2', '1527326503', '1', '1527326503', '4');
INSERT INTO `fc_car_sources` VALUES ('11', 'HC20180526004', '', 'WH32525', '0', '0', '0', '加装配置加装配置加装配置加装配置', '22520', '香槟色', '0', '非4S店定期保养', '0', '0', '1.0', '2018-05-17', '2018-05-15', '2018-05-05', '2018-04-30', '2321320', '2', '3', '其它', '车况介绍车况介绍车况介绍车况介绍车况介绍', 'https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500', '车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论', '14,2,1,15,30,23,43,35,34,44,49,63,51,50,65,83,71,70,85,94,87,104,133,126,135,140,144,141,163,161,153,165,169,167', '4', '1', '1527326503', '1', '1527326503', '4');
INSERT INTO `fc_car_sources` VALUES ('12', 'HC20180526001', '', 'WH32525', '0', '0', '0', '加装配置加装配置加装配置加装配置', '4294967295', '香槟色', '0', '非4S店定期保养', '28', '346', '1.0', '2018-05-17', '2018-05-15', '2018-05-05', '2018-04-30', '4294967295', '2', '3', '', '车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍', 'https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500', '车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论', '14,2,1,15,30,23,43,35,34,44,49,63,51,50,65,83,71,70,85,94,87,104,133,126,135,140,144,141,160,154,153,169,167', '4', '1', '1527326434', '1', '1527326434', '4');
INSERT INTO `fc_car_sources` VALUES ('13', 'HC20180526005', '', 'WH32525', '0', '0', '0', '加装配置加装配置加装配置加装配置', '4294967295', '香槟色', '0', '非4S店定期保养', '28', '346', '1.0', '2018-05-17', '2018-05-15', '2018-05-05', '2018-04-30', '4294967295', '2', '3', '', '车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍', 'https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500', '车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论', '14,2,1,15,30,23,43,35,34,44,49,63,51,50,65,83,71,70,85,94,87,104,133,126,135,140,144,141,160,154,153,169,167', '4', '1', '1527326434', '1', '1527326434', '4');
INSERT INTO `fc_car_sources` VALUES ('14', 'HC20180526006', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/7d74e501bea507bbe06b8e0181a19bc1.png', 'WH32525', '0', '0', '0', '加装配置加装配置加装配置加装配置', '4294967295', '香槟色', '0', '非4S店定期保养', '0', '0', '1.0', '2018-05-17', '2018-05-15', '2018-05-05', '2018-04-30', '4294967295', '2', '3', '其它', '车况介绍车况介绍车况介绍车况介绍车况介绍', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/6e6e2019bf4c2c687137c19a8afc0ff8.jpg,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/9212b9bce080dc1e5c55602985628196.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/ea34fd9d73030558b8ef5e90a5432468.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/0d9c5981eee361b6c65012126e009b18.jpg,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/28105648fcb1b1d65913623e2afb6edb.jpg,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/810106bb700a1b08b7a06ec2e1cecd6f.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/ab19c2243af2052b3eaf4374f3ed6d77.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/e14fc873a5a12e9c5e3c026989475d16.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/2fe78f21dcbb24f84a73716c42fa0dfb.jpg,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/48b2e56d8ba22b7297b561da9c146639.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/251eb4866b330d46513960583793d631.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/52b55dd1e305bd115127041359e1f5c2.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/dfdd5f30a01f23921a08ff1a0a19c7f2.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/1e198cfb1c703fdf55b86e1273fcd8c6.png,http://bestcar1.oss-cn-hangzhou.aliyuncs.com/74815871f714d7bd31f8676aca63047e.png', '车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论', '14,2,1,15,30,23,43,35,34,44,49,63,51,50,65,83,71,70,85,94,87,104,133,126,135,140,144,141,163,161,153,165,169,167', '4', '2', '1527326503', '1', '1527326503', '4');
INSERT INTO `fc_car_sources` VALUES ('15', 'HC20180526007', '', 'WH32525', '0', '0', '0', '加装配置加装配置加装配置加装配置', '22520', '香槟色', '0', '非4S店定期保养', '0', '0', '1.0', '2018-05-17', '2018-05-15', '2018-05-05', '2018-04-30', '2321320', '2', '3', '其它', '车况介绍车况介绍车况介绍车况介绍车况介绍', 'https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500', '车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论', '14,2,1,15,30,23,43,35,34,44,49,63,51,50,65,83,71,70,85,94,87,104,133,126,135,140,144,141,163,161,153,165,169,167', '4', '1', '1527326503', '1', '1527326503', '4');
INSERT INTO `fc_car_sources` VALUES ('16', 'HC20180526008', '', 'WH32525', '0', '0', '0', '加装配置加装配置加装配置加装配置', '4294967295', '香槟色', '0', '非4S店定期保养', '28', '346', '1.0', '2018-05-17', '2018-05-15', '2018-05-05', '2018-04-30', '4294967295', '2', '3', '', '车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍车况介绍', 'https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500,https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500', '车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论车源检测结论', '14,2,1,15,30,23,43,35,34,44,49,63,51,50,65,83,71,70,85,94,87,104,133,126,135,140,144,141,160,154,153,169,167', '4', '1', '1527326434', '1', '1527326434', '4');

-- ----------------------------
-- Table structure for fc_check_report_options
-- ----------------------------
DROP TABLE IF EXISTS `fc_check_report_options`;
CREATE TABLE `fc_check_report_options` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '级别',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 COMMENT='检测报告选项';

-- ----------------------------
-- Records of fc_check_report_options
-- ----------------------------
INSERT INTO `fc_check_report_options` VALUES ('1', '0', '事故排查', '1', '100');
INSERT INTO `fc_check_report_options` VALUES ('2', '1', '排除重大事故', '2', '100');
INSERT INTO `fc_check_report_options` VALUES ('3', '2', '左前减震器座', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('4', '2', '右前减震器座', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('5', '2', '左前纵梁', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('6', '2', '右前纵梁', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('7', '2', '防火墙', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('8', '2', '右A柱', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('9', '2', '右B柱', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('10', '2', '右侧顶边梁', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('11', '2', '左C柱', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('12', '2', '右D柱', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('13', '2', '右后翼子板内衬', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('14', '2', '左后翼子板内衬', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('15', '2', '后备箱底板', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('16', '2', '右后纵梁', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('17', '2', '左后纵梁', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('18', '2', '左D柱', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('19', '2', '左C柱', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('20', '2', '左侧顶边梁', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('21', '2', '左B柱', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('22', '2', '左A柱', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('23', '1', '排除水泡火烧', '2', '100');
INSERT INTO `fc_check_report_options` VALUES ('24', '23', '机舱保险盒', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('25', '23', '防火墙隔音棉', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('26', '23', '发动机主线束', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('27', '23', '座椅滑轨及固定螺丝', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('28', '23', '车内线束', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('29', '23', '安全带底部', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('30', '23', '全车座椅坐垫', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('31', '23', '全车地毯地胶', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('32', '23', '烟灰缸底座', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('33', '23', '转向柱', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('34', '0', '轻微碰撞', '1', '100');
INSERT INTO `fc_check_report_options` VALUES ('35', '34', '轻微碰撞', '2', '100');
INSERT INTO `fc_check_report_options` VALUES ('36', '35', '前防撞梁', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('37', '35', '水箱框架', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('38', '35', '左前大灯框架', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('39', '35', '右前大灯框架', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('40', '35', '左前翼子板内衬', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('41', '35', '右前翼子板内衬', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('42', '35', '右侧底大边', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('43', '35', '右侧驾驶舱底板', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('44', '35', '右侧尾灯框架', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('45', '35', '左侧尾灯框架', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('46', '35', '后围板', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('47', '35', '后防撞梁', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('48', '35', '左侧底大边', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('49', '35', '左侧驾驶舱底板', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('50', '0', '易损耗部件', '1', '100');
INSERT INTO `fc_check_report_options` VALUES ('51', '50', '易损耗部件', '2', '100');
INSERT INTO `fc_check_report_options` VALUES ('52', '51', '左前减震器', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('53', '51', '气门室盖垫', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('54', '51', '发动机油底壳', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('55', '51', '防冻液液面', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('56', '51', '机油液面', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('57', '51', '电瓶（极柱）', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('58', '51', '主动油壶', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('59', '51', '助力油壶', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('60', '51', '转向助力泵', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('61', '51', '水箱水管', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('62', '51', '水箱', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('63', '51', '冰凝器', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('64', '51', '发动机外围皮带', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('65', '51', '发动机缸垫', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('66', '51', '变速箱油底壳', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('67', '51', '右前减震器', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('68', '51', '右后减震器', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('69', '51', '左后减震器', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('70', '0', '常用功能', '1', '100');
INSERT INTO `fc_check_report_options` VALUES ('71', '70', '安全系统', '2', '100');
INSERT INTO `fc_check_report_options` VALUES ('72', '71', '驾驶座安全气囊', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('73', '71', '副驾驶安全气囊', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('74', '71', '前排侧气囊', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('75', '71', '后排侧气囊', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('76', '71', '前排头部气囊', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('77', '71', '后排头部气囊', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('78', '71', '胎压监测', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('79', '71', '中控锁', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('80', '71', '儿童座椅接口', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('81', '71', '无钥匙启动', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('82', '71', '无钥匙进入系统', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('83', '71', '遥控钥匙', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('84', '71', '防抱死系统（ABS）', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('85', '71', '车身稳定控制（EPS）', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('86', '71', '电子驻车制动', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('87', '70', '外部配置', '2', '100');
INSERT INTO `fc_check_report_options` VALUES ('88', '87', '左前轮毂', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('89', '87', '左前轮胎', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('90', '87', '前挡风玻璃', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('91', '87', '右前轮毂', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('92', '87', '右前轮胎', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('93', '87', '右后轮毂', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('94', '87', '右后轮胎', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('95', '87', '后挡风玻璃', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('96', '87', '左后轮毂', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('97', '87', '左后轮胎', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('98', '87', '全景天窗', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('99', '87', '感应雨刷', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('100', '87', '后雨刷', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('101', '87', '前电动车窗', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('102', '87', '后电动车窗', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('103', '87', '后视镜电动调节', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('104', '87', '后视镜电动折叠', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('105', '87', '后视镜加热', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('106', '87', '电动吸合门', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('107', '87', '后排侧遮阳帘', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('108', '87', '感应后备厢', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('109', '87', '电动天窗', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('110', '70', '内部配置', '2', '100');
INSERT INTO `fc_check_report_options` VALUES ('111', '110', '皮质座椅', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('112', '110', '前排座椅加热', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('113', '110', '座椅通风', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('114', '110', '驾驶座座椅电动调节', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('115', '110', '多功能方向盘', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('116', '110', '定速巡航', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('117', '110', 'GPS导航', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('118', '110', '倒车雷达', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('119', '110', '倒车影像系统', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('120', '110', '手动空调', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('121', '110', '自动空调', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('122', '110', 'HUD抬头显示', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('123', '110', 'HUD抬头显示', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('124', '110', '后排座椅加热', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('125', '110', '空调', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('126', '70', '灯光系统', '2', '100');
INSERT INTO `fc_check_report_options` VALUES ('127', '126', '近光灯', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('128', '126', '远光灯', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('129', '126', '前转向灯', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('130', '126', '前雾灯', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('131', '126', '后转向灯', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('132', '126', '刹车灯', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('133', '126', '倒车灯', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('134', '126', '后雾灯', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('135', '126', '大灯高度可调', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('136', '126', '大灯清洗', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('137', '126', '室内顶灯', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('138', '126', '氙气大灯', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('139', '126', 'LED大灯', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('140', '126', '自动灯头', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('141', '70', '高科技配置', '2', '100');
INSERT INTO `fc_check_report_options` VALUES ('142', '141', '车道偏离预警系统', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('143', '141', '自动泊车', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('144', '141', '盲点辅助系统', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('145', '141', '全景摄像头', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('146', '141', '发动机自动启停', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('147', '70', '随车工具', '2', '100');
INSERT INTO `fc_check_report_options` VALUES ('148', '147', '千斤顶', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('149', '147', '灭火器', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('150', '147', '三角警示标', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('151', '147', '维修工具包', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('152', '147', '备胎', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('153', '0', '启动检测', '1', '100');
INSERT INTO `fc_check_report_options` VALUES ('154', '153', '仪表台指示灯', '2', '100');
INSERT INTO `fc_check_report_options` VALUES ('155', '154', '调表车', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('156', '154', '制动系统指示灯', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('157', '154', '安全气囊故障灯', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('158', '154', '车身稳定系统故障灯', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('159', '154', '发动机故障灯', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('160', '154', '变速箱故障灯', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('161', '153', '发动机状态', '2', '100');
INSERT INTO `fc_check_report_options` VALUES ('162', '161', '发动机总成', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('163', '161', '启动', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('164', '161', '怠速', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('165', '161', '发动机抖动', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('166', '161', '尾气', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('167', '153', '变速箱状态', '2', '100');
INSERT INTO `fc_check_report_options` VALUES ('168', '167', '变速箱总成', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('169', '167', '变速箱挂挡', '3', '100');
INSERT INTO `fc_check_report_options` VALUES ('170', '167', '转向', '3', '100');

-- ----------------------------
-- Table structure for fc_configs
-- ----------------------------
DROP TABLE IF EXISTS `fc_configs`;
CREATE TABLE `fc_configs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `value` text NOT NULL COMMENT '值',
  `tips` varchar(1000) NOT NULL DEFAULT '' COMMENT '提示',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='配置项';

-- ----------------------------
-- Records of fc_configs
-- ----------------------------
INSERT INTO `fc_configs` VALUES ('1', 'oss_upload_file_clear_run', '正在清除oss无效文件', '0', '是否正在清除oss无效文件，若是，这不能向oss上传文件');

-- ----------------------------
-- Table structure for fc_customers
-- ----------------------------
DROP TABLE IF EXISTS `fc_customers`;
CREATE TABLE `fc_customers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '姓名',
  `mobile` varchar(30) NOT NULL DEFAULT '' COMMENT '联系电话',
  `sex` varchar(30) NOT NULL DEFAULT '' COMMENT '性别',
  `province_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所在省',
  `city_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所在城市',
  `car_source_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '意向车源',
  `defind_model` varchar(1000) NOT NULL DEFAULT '' COMMENT '手动输入的车型',
  `source` varchar(100) NOT NULL DEFAULT '' COMMENT '来源',
  `state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '-1 战败 0未到店 1已到店 2已预订 3已成交  ',
  `remark` varchar(2000) NOT NULL DEFAULT '' COMMENT '简介',
  `merchant_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属车商',
  `runner_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作者',
  `follow_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后跟进时间',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`) USING BTREE,
  KEY `car_source_id` (`car_source_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='客户';

-- ----------------------------
-- Records of fc_customers
-- ----------------------------
INSERT INTO `fc_customers` VALUES ('1', '张先生说', '18353621790', '男', '21', '277', '0', 'qweq', '朋友介绍', '1', '哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比哈比', '4', '1', '1527494586', '1527494586');
INSERT INTO `fc_customers` VALUES ('2', '张先生说', '18353621790', '男', '27', '343', '1', '', '朋友介绍', '2', '哈比', '5', '1', '1527494586', '1527494649');
INSERT INTO `fc_customers` VALUES ('3', '都可开始看开始看', '18353621792', '女', '22', '296', '7', '', '主动预约', '1', '物权法', '5', '1', '1527494586', '1527515884');
INSERT INTO `fc_customers` VALUES ('4', '哪些人撒', '18353621790', '女', '21', '276', '0', '萨法', '主动预约', '2', '人人去', '5', '1', '1527494586', '1527518978');

-- ----------------------------
-- Table structure for fc_evaluates
-- ----------------------------
DROP TABLE IF EXISTS `fc_evaluates`;
CREATE TABLE `fc_evaluates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(30) NOT NULL DEFAULT '' COMMENT '联系电话',
  `province_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所在省份',
  `city_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所在市区',
  `area_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所在区县',
  `brand_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `serie_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '车系id',
  `model_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '型号id',
  `mileage` varchar(10) NOT NULL DEFAULT '' COMMENT '行驶里程（万公里）',
  `plate_at` varchar(30) NOT NULL DEFAULT '' COMMENT '上牌时间',
  `evaluate_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '估价时间',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='估价';

-- ----------------------------
-- Records of fc_evaluates
-- ----------------------------
INSERT INTO `fc_evaluates` VALUES ('1', '18353624568', '19', '266', '2232', '0', '0', '0', '2.3', '2017-12-12', '1527078997', '1527078997');
INSERT INTO `fc_evaluates` VALUES ('2', '18353524568', '19', '266', '2232', '0', '0', '0', '5.3', '2017-11-12', '1527778997', '1527778997');

-- ----------------------------
-- Table structure for fc_feedbacks
-- ----------------------------
DROP TABLE IF EXISTS `fc_feedbacks`;
CREATE TABLE `fc_feedbacks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `content` text NOT NULL COMMENT '反馈内容',
  `feedback_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '反馈时间',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='反馈';

-- ----------------------------
-- Records of fc_feedbacks
-- ----------------------------
INSERT INTO `fc_feedbacks` VALUES ('1', '1', '不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好', '1527078997', '1527078997');
INSERT INTO `fc_feedbacks` VALUES ('2', '1', '不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好不好', '1527078997', '1527078997');

-- ----------------------------
-- Table structure for fc_lending_rates
-- ----------------------------
DROP TABLE IF EXISTS `fc_lending_rates`;
CREATE TABLE `fc_lending_rates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `term` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '贷款期限（月）',
  `rate` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '贷款利率  取数据后除以100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='贷款利率';

-- ----------------------------
-- Records of fc_lending_rates
-- ----------------------------
INSERT INTO `fc_lending_rates` VALUES ('1', '12', '2');
INSERT INTO `fc_lending_rates` VALUES ('2', '24', '640');
INSERT INTO `fc_lending_rates` VALUES ('3', '36', '645');

-- ----------------------------
-- Table structure for fc_logs
-- ----------------------------
DROP TABLE IF EXISTS `fc_logs`;
CREATE TABLE `fc_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(50) NOT NULL DEFAULT '' COMMENT '模块名',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '具体操作',
  `runner_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作者',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `runner_id` (`runner_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COMMENT='日志';

-- ----------------------------
-- Records of fc_logs
-- ----------------------------
INSERT INTO `fc_logs` VALUES ('1', '商户管理', '导出', '1', '1527175404');
INSERT INTO `fc_logs` VALUES ('2', '商户管理', '导出', '1', '1527175614');
INSERT INTO `fc_logs` VALUES ('3', '商户管理', '商户更新', '1', '1527175966');
INSERT INTO `fc_logs` VALUES ('4', '商户管理', '商户更新', '1', '1527175987');
INSERT INTO `fc_logs` VALUES ('5', '商户管理', '商户更新', '1', '1527176005');
INSERT INTO `fc_logs` VALUES ('6', '商户管理', '商户更新', '1', '1527176013');
INSERT INTO `fc_logs` VALUES ('7', '商户管理', '导出', '2', '1527177642');
INSERT INTO `fc_logs` VALUES ('8', '用户管理', '导出', '2', '1527177704');
INSERT INTO `fc_logs` VALUES ('9', '车源管理', '发布车源', '1', '1527326503');
INSERT INTO `fc_logs` VALUES ('10', '车源管理', '发布车源', '1', '1527327346');
INSERT INTO `fc_logs` VALUES ('11', '商户管理', '商户冻结', '1', '1527330254');
INSERT INTO `fc_logs` VALUES ('12', '商户管理', '商户开通', '1', '1527330256');
INSERT INTO `fc_logs` VALUES ('13', '商户管理', '商户冻结', '1', '1527330258');
INSERT INTO `fc_logs` VALUES ('14', '商户管理', '商户开通', '1', '1527330260');
INSERT INTO `fc_logs` VALUES ('15', '商户管理', '商户冻结', '1', '1527330275');
INSERT INTO `fc_logs` VALUES ('16', '商户管理', '商户开通', '1', '1527330276');
INSERT INTO `fc_logs` VALUES ('17', '车源管理', '修改车源', '1', '1527336785');
INSERT INTO `fc_logs` VALUES ('18', '车源管理', '修改车源', '1', '1527337735');
INSERT INTO `fc_logs` VALUES ('19', '车源管理', '修改车源', '1', '1527337742');
INSERT INTO `fc_logs` VALUES ('20', '车源管理', '修改车源', '1', '1527338449');
INSERT INTO `fc_logs` VALUES ('21', '车源管理', '修改车源', '1', '1527338562');
INSERT INTO `fc_logs` VALUES ('22', '车源管理', '商户冻结', '1', '1527356043');
INSERT INTO `fc_logs` VALUES ('23', '车源管理', '商户冻结', '1', '1527356319');
INSERT INTO `fc_logs` VALUES ('24', '车源管理', '商户审核通过', '1', '1527356327');
INSERT INTO `fc_logs` VALUES ('25', '车源管理', '车源审核通过', '1', '1527356834');
INSERT INTO `fc_logs` VALUES ('26', '车源管理', '车源拒绝', '1', '1527356842');
INSERT INTO `fc_logs` VALUES ('27', '车源管理', '车源审核通过', '1', '1527356875');
INSERT INTO `fc_logs` VALUES ('28', '车源管理', '车源审核通过', '1', '1527356919');
INSERT INTO `fc_logs` VALUES ('29', '车源管理', '车源下架', '1', '1527357682');
INSERT INTO `fc_logs` VALUES ('30', '车源管理', '车源上架', '1', '1527357692');
INSERT INTO `fc_logs` VALUES ('31', '车源管理', '车源下架', '1', '1527357696');
INSERT INTO `fc_logs` VALUES ('32', '车源管理', '车源退库', '1', '1527357701');
INSERT INTO `fc_logs` VALUES ('33', '商户管理', '商户冻结', '1', '1527358123');
INSERT INTO `fc_logs` VALUES ('34', '商户管理', '商户开通', '1', '1527358128');
INSERT INTO `fc_logs` VALUES ('35', '车源管理', '车源拒绝', '1', '1527358252');
INSERT INTO `fc_logs` VALUES ('36', '车源管理', '车源下架', '1', '1527358259');
INSERT INTO `fc_logs` VALUES ('37', '车源管理', '修改车源', '2', '1527364380');
INSERT INTO `fc_logs` VALUES ('38', '车源管理', '车源下架', '1', '1527404129');
INSERT INTO `fc_logs` VALUES ('39', '用户管理', '导出', '2', '1527405442');
INSERT INTO `fc_logs` VALUES ('40', '车源管理', '车源上架', '2', '1527407108');
INSERT INTO `fc_logs` VALUES ('41', '商户管理', '导出', '2', '1527423016');
INSERT INTO `fc_logs` VALUES ('42', '商户管理', '商户冻结', '2', '1527423036');
INSERT INTO `fc_logs` VALUES ('43', '商户管理', '商户冻结', '2', '1527423039');
INSERT INTO `fc_logs` VALUES ('44', '商户管理', '商户开通', '2', '1527423043');
INSERT INTO `fc_logs` VALUES ('45', '车源管理', '车源下架', '2', '1527423546');
INSERT INTO `fc_logs` VALUES ('46', '车源管理', '车源退库', '2', '1527423550');
INSERT INTO `fc_logs` VALUES ('47', '车源管理', '车源退库', '2', '1527423582');
INSERT INTO `fc_logs` VALUES ('48', '车源管理', '修改车源', '2', '1527440307');
INSERT INTO `fc_logs` VALUES ('49', '车源管理', '修改车源', '2', '1527440383');
INSERT INTO `fc_logs` VALUES ('50', '车源管理', '修改车源', '2', '1527440412');
INSERT INTO `fc_logs` VALUES ('51', '车源管理', '修改车源', '2', '1527440431');
INSERT INTO `fc_logs` VALUES ('52', '车源管理', '修改车源', '2', '1527440439');
INSERT INTO `fc_logs` VALUES ('53', '车源管理', '修改车源', '2', '1527440481');
INSERT INTO `fc_logs` VALUES ('54', '车源管理', '修改车源', '2', '1527440495');
INSERT INTO `fc_logs` VALUES ('55', '车源管理', '修改车源', '2', '1527441314');
INSERT INTO `fc_logs` VALUES ('56', '车源管理', '修改车源', '1', '1527490746');
INSERT INTO `fc_logs` VALUES ('57', '车源管理', '修改车源', '1', '1527490754');
INSERT INTO `fc_logs` VALUES ('58', '客户管理', '新建客户', '1', '1527494649');
INSERT INTO `fc_logs` VALUES ('59', '客户管理', '新建客户', '1', '1527515884');
INSERT INTO `fc_logs` VALUES ('60', '客户管理', '新建客户', '1', '1527518978');
INSERT INTO `fc_logs` VALUES ('61', '客户管理', '修改客户', '1', '1527521300');
INSERT INTO `fc_logs` VALUES ('62', '客户管理', '修改客户', '1', '1527521392');
INSERT INTO `fc_logs` VALUES ('63', '客户管理', '修改客户', '1', '1527521667');
INSERT INTO `fc_logs` VALUES ('64', '客户管理', '修改客户', '1', '1527521726');
INSERT INTO `fc_logs` VALUES ('65', '客户管理', '修改客户', '1', '1527523253');
INSERT INTO `fc_logs` VALUES ('66', '客户管理', '修改客户', '1', '1527523304');
INSERT INTO `fc_logs` VALUES ('67', '客户管理', '修改客户', '1', '1527523371');
INSERT INTO `fc_logs` VALUES ('68', '客户管理', '修改客户', '1', '1527523870');
INSERT INTO `fc_logs` VALUES ('69', '客户管理', '修改客户', '1', '1527523917');
INSERT INTO `fc_logs` VALUES ('70', '客户管理', '修改客户', '1', '1527524102');
INSERT INTO `fc_logs` VALUES ('71', '客户管理', '导出', '1', '1527527379');
INSERT INTO `fc_logs` VALUES ('72', '客户管理', '导出', '1', '1527527395');
INSERT INTO `fc_logs` VALUES ('73', '客户管理', '转交客户', '1', '1527589284');
INSERT INTO `fc_logs` VALUES ('74', '客户管理', '转交客户', '1', '1527589294');
INSERT INTO `fc_logs` VALUES ('75', '客户管理', '转交客户', '1', '1527589301');
INSERT INTO `fc_logs` VALUES ('76', '客户管理', '转交客户', '1', '1527589307');
INSERT INTO `fc_logs` VALUES ('77', '客户管理', '转交客户', '1', '1527589316');
INSERT INTO `fc_logs` VALUES ('78', '客户管理', '转交客户', '1', '1527589322');
INSERT INTO `fc_logs` VALUES ('79', '客户管理', '转交客户', '1', '1527589388');
INSERT INTO `fc_logs` VALUES ('80', '客户管理', '转交客户', '1', '1527589421');
INSERT INTO `fc_logs` VALUES ('81', '客户管理', '转交客户', '1', '1527589428');
INSERT INTO `fc_logs` VALUES ('82', '客户管理', '转交客户', '1', '1527589436');
INSERT INTO `fc_logs` VALUES ('83', '客户管理', '转交客户', '1', '1527589481');
INSERT INTO `fc_logs` VALUES ('84', '客户管理', '转交客户', '1', '1527589517');
INSERT INTO `fc_logs` VALUES ('85', '客户管理', '转交客户', '1', '1527589554');
INSERT INTO `fc_logs` VALUES ('86', '客户管理', '转交客户', '1', '1527589561');
INSERT INTO `fc_logs` VALUES ('87', '客户管理', '转交客户', '1', '1527589569');
INSERT INTO `fc_logs` VALUES ('88', '客户管理', '转交客户', '1', '1527589601');
INSERT INTO `fc_logs` VALUES ('89', '客户管理', '转交客户', '1', '1527589608');
INSERT INTO `fc_logs` VALUES ('90', '客户管理', '转交客户', '1', '1527589613');
INSERT INTO `fc_logs` VALUES ('91', '客户管理', '转交客户', '1', '1527589620');
INSERT INTO `fc_logs` VALUES ('92', '客户管理', '转交客户', '1', '1527589631');
INSERT INTO `fc_logs` VALUES ('93', '客户管理', '转交客户', '1', '1527589637');
INSERT INTO `fc_logs` VALUES ('94', '客户管理', '转交客户', '1', '1527589643');
INSERT INTO `fc_logs` VALUES ('95', '客户管理', '转交客户', '1', '1527589652');
INSERT INTO `fc_logs` VALUES ('96', '客户管理', '修改客户', '1', '1527590966');
INSERT INTO `fc_logs` VALUES ('97', '客户管理', '导出', '1', '1527591095');
INSERT INTO `fc_logs` VALUES ('98', '订单管理', '新建订单', '1', '1527603046');
INSERT INTO `fc_logs` VALUES ('99', '订单管理', '修改订单', '1', '1527605023');
INSERT INTO `fc_logs` VALUES ('100', '订单管理', '修改订单', '1', '1527605077');
INSERT INTO `fc_logs` VALUES ('101', '订单管理', '修改订单', '1', '1527605094');
INSERT INTO `fc_logs` VALUES ('102', '订单管理', '修改订单', '1', '1527605103');
INSERT INTO `fc_logs` VALUES ('103', '订单管理', '修改订单', '1', '1527605410');
INSERT INTO `fc_logs` VALUES ('104', '订单管理', '修改订单', '1', '1527605434');
INSERT INTO `fc_logs` VALUES ('105', '订单管理', '修改订单', '1', '1527605442');
INSERT INTO `fc_logs` VALUES ('106', '订单管理', '修改订单', '1', '1527605458');
INSERT INTO `fc_logs` VALUES ('107', '订单管理', '新建订单', '1', '1527606475');
INSERT INTO `fc_logs` VALUES ('108', '订单管理', '修改订单', '1', '1527606663');
INSERT INTO `fc_logs` VALUES ('109', '订单管理', '新建订单', '1', '1527690298');
INSERT INTO `fc_logs` VALUES ('110', '分期管理', '修改贷款利率', '1', '1527761805');
INSERT INTO `fc_logs` VALUES ('111', '分期管理', '修改贷款利率', '1', '1527767742');
INSERT INTO `fc_logs` VALUES ('112', '营销管理', '添加Banner', '1', '1527770856');
INSERT INTO `fc_logs` VALUES ('113', '营销管理', '添加Banner', '1', '1527770891');
INSERT INTO `fc_logs` VALUES ('114', '营销管理', '添加Banner', '1', '1527771314');
INSERT INTO `fc_logs` VALUES ('115', '营销管理', '修改Banner', '1', '1527771379');
INSERT INTO `fc_logs` VALUES ('116', '营销管理', '修改Banner', '1', '1527771425');
INSERT INTO `fc_logs` VALUES ('117', '营销管理', '删除Banner', '1', '1527771774');
INSERT INTO `fc_logs` VALUES ('118', '营销管理', '下移Banner', '1', '1527775389');
INSERT INTO `fc_logs` VALUES ('119', '营销管理', '下移Banner', '1', '1527776153');
INSERT INTO `fc_logs` VALUES ('120', '营销管理', '下移Banner', '1', '1527776175');
INSERT INTO `fc_logs` VALUES ('121', '营销管理', '下移Banner', '1', '1527776185');
INSERT INTO `fc_logs` VALUES ('122', '营销管理', '下移Banner', '1', '1527776192');
INSERT INTO `fc_logs` VALUES ('123', '营销管理', '下移Banner', '1', '1527776196');
INSERT INTO `fc_logs` VALUES ('124', '营销管理', '上移Banner', '1', '1527776200');
INSERT INTO `fc_logs` VALUES ('125', '营销管理', '上移Banner', '1', '1527776207');
INSERT INTO `fc_logs` VALUES ('126', '营销管理', '下移Banner', '1', '1527776212');
INSERT INTO `fc_logs` VALUES ('127', '营销管理', '上移Banner', '1', '1527776233');
INSERT INTO `fc_logs` VALUES ('128', '营销管理', '下移Banner', '1', '1527776236');
INSERT INTO `fc_logs` VALUES ('129', '营销管理', '下移Banner', '1', '1527776240');
INSERT INTO `fc_logs` VALUES ('130', '营销管理', '下移Banner', '1', '1527776251');
INSERT INTO `fc_logs` VALUES ('131', '营销管理', '上移Banner', '1', '1527776254');
INSERT INTO `fc_logs` VALUES ('132', '营销管理', '下移Banner', '1', '1527776262');
INSERT INTO `fc_logs` VALUES ('133', '营销管理', '下移Banner', '1', '1527776264');
INSERT INTO `fc_logs` VALUES ('134', '营销管理', '下移Banner', '1', '1527776267');
INSERT INTO `fc_logs` VALUES ('135', '营销管理', '上移Banner', '1', '1527776483');
INSERT INTO `fc_logs` VALUES ('136', '营销管理', '修改Banner', '1', '1527776523');
INSERT INTO `fc_logs` VALUES ('137', '营销管理', '下移Banner', '1', '1527776537');
INSERT INTO `fc_logs` VALUES ('138', '营销管理', '下移Banner', '1', '1527776541');
INSERT INTO `fc_logs` VALUES ('139', '营销管理', '上移Banner', '1', '1527776545');
INSERT INTO `fc_logs` VALUES ('140', '营销管理', '添加Banner', '1', '1527776763');
INSERT INTO `fc_logs` VALUES ('141', '营销管理', '下移Banner', '1', '1527776818');

-- ----------------------------
-- Table structure for fc_merchants
-- ----------------------------
DROP TABLE IF EXISTS `fc_merchants`;
CREATE TABLE `fc_merchants` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(50) NOT NULL DEFAULT '' COMMENT '商户号',
  `company_name` varchar(255) NOT NULL DEFAULT '' COMMENT '公司名称',
  `shop_name` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `contract_no` varchar(255) NOT NULL DEFAULT '' COMMENT '合同编号',
  `contract_valid_start` varchar(50) NOT NULL DEFAULT '' COMMENT '合同有效期开始日期',
  `contract_valid_end` varchar(50) NOT NULL DEFAULT '' COMMENT '合同有效截止日期',
  `licence_type` varchar(50) NOT NULL DEFAULT '' COMMENT '证照类型',
  `licence_no` varchar(50) NOT NULL DEFAULT '' COMMENT '证照号码',
  `licence_province_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执照所在省份',
  `licence_city_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执照所在市区',
  `licence_area_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执照所在区县',
  `licence_address` varchar(1000) NOT NULL DEFAULT '' COMMENT '执照详细地址',
  `licence_img` varchar(1000) NOT NULL DEFAULT '' COMMENT '执照照片',
  `licence_valid_start` varchar(50) NOT NULL DEFAULT '' COMMENT '执照有效期开始日期',
  `licence_valid_end` varchar(50) NOT NULL DEFAULT '' COMMENT '执照有效截止日期',
  `work_address` varchar(1000) NOT NULL DEFAULT '' COMMENT '办公地址',
  `custom_tel` varchar(30) NOT NULL DEFAULT '' COMMENT '客服电话',
  `corporation_name` varchar(50) NOT NULL DEFAULT '' COMMENT '法人姓名',
  `mobile` varchar(30) NOT NULL DEFAULT '' COMMENT '联系电话',
  `identcard_no` varchar(30) NOT NULL DEFAULT '' COMMENT '身份证号',
  `identcard_front_img` varchar(1000) NOT NULL DEFAULT '' COMMENT '身份证正面照片',
  `identcard_back_img` varchar(1000) NOT NULL DEFAULT '' COMMENT '身份证背面照片',
  `businesser_name` varchar(50) NOT NULL DEFAULT '' COMMENT '业务负责人姓名',
  `businesser_tel` varchar(30) NOT NULL DEFAULT '' COMMENT '业务负责人座机',
  `businesser_mobile` varchar(30) NOT NULL DEFAULT '' COMMENT '业务负责人手机',
  `businesser_email` varchar(255) NOT NULL DEFAULT '' COMMENT '业务负责人邮箱',
  `financer_name` varchar(50) NOT NULL DEFAULT '' COMMENT '财务负责人姓名',
  `financer_tel` varchar(30) NOT NULL DEFAULT '' COMMENT '财务负责人座机',
  `financer_mobile` varchar(30) NOT NULL DEFAULT '' COMMENT '财务负责人手机',
  `financer_email` varchar(255) NOT NULL DEFAULT '' COMMENT '财务负责人邮箱',
  `imgs` text NOT NULL COMMENT '车行照片',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '登录账号',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0：冻结 1：开通',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `runner_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作者ID',
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `runner_id` (`runner_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='商户';

-- ----------------------------
-- Records of fc_merchants
-- ----------------------------
INSERT INTO `fc_merchants` VALUES ('5', 'H0005', '好车', '好车店铺1', '123456789', '2018-05-16', '2018-05-18', '工商营业执照', '123456789', '19', '266', '2232', '二龙村', '', '2018-05-17', '2018-06-01', '二龙村三家塘', '123456789', '杜某某', '123456789', '123456789123456789', 'https://a.suiship.com/UHDqKahUjOxvfvKO1s0LCL24F07CwtyjiiHRpgF4FeAUOnWa1eDLg0n6TbMP5A6b.jpg?imageView2/2/w/500', '', '陈某某', '010-123456789', '123456789', 'scdujun@qq.com', '多某某', '101-123456789', '123456789', '7549233@qq.com', 'https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500', '6', '1', '1527078997', '1');
INSERT INTO `fc_merchants` VALUES ('4', 'H0004', '好车', '好车店铺2', '123456789', '2018-05-16', '2018-05-18', '工商营业执照', '123456789', '19', '266', '2232', '二龙村', '', '2018-05-17', '2018-06-01', '二龙村三家塘', '123456789', '杜某某', '123456789', '123456789123456789', 'https://a.suiship.com/UHDqKahUjOxvfvKO1s0LCL24F07CwtyjiiHRpgF4FeAUOnWa1eDLg0n6TbMP5A6b.jpg?imageView2/2/w/500', '', '陈某某', '010-123456789', '123456789', 'scdujun@qq.com', '多某某', '101-123456789', '123456789', '7549233@qq.com', 'https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500', '6', '0', '1527078997', '1');

-- ----------------------------
-- Table structure for fc_orders
-- ----------------------------
DROP TABLE IF EXISTS `fc_orders`;
CREATE TABLE `fc_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(30) NOT NULL DEFAULT '' COMMENT '订单号',
  `customer_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '客户ID',
  `car_source_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '意向车源',
  `defind_model` varchar(1000) NOT NULL DEFAULT '' COMMENT '手动输入的车型',
  `amount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '总额 单位百',
  `earnest` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '定金 单位百',
  `paid_at` date NOT NULL COMMENT '付款日期',
  `paid_type` varchar(50) NOT NULL DEFAULT '' COMMENT '付款方式',
  `contract_img` varchar(1000) NOT NULL DEFAULT '' COMMENT '合同扫描件',
  `state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0已预订 1已成交 -1已违约',
  `sale_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '销售人员',
  `remark` varchar(2000) NOT NULL DEFAULT '' COMMENT '备注',
  `merchant_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `runner_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作者ID',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `merchant_id` (`merchant_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='订单';

-- ----------------------------
-- Records of fc_orders
-- ----------------------------
INSERT INTO `fc_orders` VALUES ('1', '20180259112356002', '1', '0', 'fwe', '2147483648', '250002', '2018-05-11', '按揭', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/0a24251da58936374f1d6be6547af6cb.jpg', '0', '2', '是这样吗', '1', '1', '1527602840');
INSERT INTO `fc_orders` VALUES ('2', '20180259112356102', '1', '0', 'fwe', '2147483648', '250002', '2018-05-11', '全款', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/66822fbee48292fbb46818192987b4e0.jpg', '-1', '2', '', '1', '1', '1527602848');
INSERT INTO `fc_orders` VALUES ('3', '20180259112356022', '1', '0', 'fwe', '2147483648', '250002', '2018-05-11', '全款', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/66822fbee48292fbb46818192987b4e0.jpg', '-1', '2', 'ew', '1', '1', '1527602890');
INSERT INTO `fc_orders` VALUES ('4', '20180259112356003', '4', '0', 'fwe', '2147483648', '2147483648', '2018-03-07', '按揭', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/66822fbee48292fbb46818192987b4e0.jpg', '-1', '2', 'ewwq访问二无若翁热无热无若无', '4', '1', '1527603046');
INSERT INTO `fc_orders` VALUES ('5', '20180529230755566', '3', '0', '而分为', '24212400', '534200', '2018-05-17', '全款', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/abf4ca577598c88594dac6e8f80413ac.jpg', '0', '1', '哈哈哈哈哈哈哈哈或哈哈哈哈哈哈哈哈或哈哈哈哈哈哈哈哈或哈哈哈哈哈哈哈哈或哈哈哈哈哈哈哈哈或哈哈哈哈哈哈哈哈或哈哈哈哈哈哈哈哈或哈哈哈哈哈哈哈哈或哈哈哈哈哈哈哈哈或', '3', '1', '1527606475');
INSERT INTO `fc_orders` VALUES ('6', '20180530222458339', '1', '6', '', '124142100', '124142100', '2018-05-10', '全款', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/5be191f356e8a71c25ee9bb768f7528d.jpg', '0', '7', '12414211241421', '1', '1', '1527690298');

-- ----------------------------
-- Table structure for fc_oss_files
-- ----------------------------
DROP TABLE IF EXISTS `fc_oss_files`;
CREATE TABLE `fc_oss_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bucket` varchar(100) NOT NULL DEFAULT '' COMMENT '存储空间',
  `object` varchar(1000) NOT NULL DEFAULT '' COMMENT '文件对象',
  `url` varchar(1000) NOT NULL DEFAULT '' COMMENT '文件地址',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='oss文件';

-- ----------------------------
-- Records of fc_oss_files
-- ----------------------------
INSERT INTO `fc_oss_files` VALUES ('1', 'bestcar1', '4bda9aaf081714cd638ea3f57a63308d.png', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/4bda9aaf081714cd638ea3f57a63308d.png', '1527766414');
INSERT INTO `fc_oss_files` VALUES ('2', 'bestcar1', '201805311934365b0fddccd539b.jpg', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/201805311934365b0fddccd539b.jpg', '1527766476');
INSERT INTO `fc_oss_files` VALUES ('3', 'bestcar1', '20180531194115sly7wlw6ticlEVZD.jpg', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/20180531194115sly7wlw6ticlEVZD.jpg', '1527766875');
INSERT INTO `fc_oss_files` VALUES ('4', 'bestcar1', '20180531194137UJXkNKj7ngkvchZe.jpg', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/20180531194137UJXkNKj7ngkvchZe.jpg', '1527766897');
INSERT INTO `fc_oss_files` VALUES ('5', 'bestcar1', '20180531194152W3gXBUBc3PzsczH4.png', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/20180531194152W3gXBUBc3PzsczH4.png', '1527766912');
INSERT INTO `fc_oss_files` VALUES ('6', 'bestcar1', '20180531194221ciD1NKQh0FZ4vqVmtd56Ia13RS.png', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/20180531194221ciD1NKQh0FZ4vqVmtd56Ia13RS.png', '1527766941');
INSERT INTO `fc_oss_files` VALUES ('7', 'bestcar1', '20180531194405y7z8r9rHfWJWnyaOT5EJSoLDzu.jpg', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/20180531194405y7z8r9rHfWJWnyaOT5EJSoLDzu.jpg', '1527767045');
INSERT INTO `fc_oss_files` VALUES ('8', 'bestcar1', '20180531194559ohSMXRe7uQmm1T7lIbGoOfFjyJ.png', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/20180531194559ohSMXRe7uQmm1T7lIbGoOfFjyJ.png', '1527767159');
INSERT INTO `fc_oss_files` VALUES ('9', 'bestcar1', '20180531194831Qg62XHY11Azwnr8AfpzBcCZuNp.png', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/20180531194831Qg62XHY11Azwnr8AfpzBcCZuNp.png', '1527767311');
INSERT INTO `fc_oss_files` VALUES ('10', 'bestcar1', '20180531204720V628alXYE6rPUV1Q7aMrfvFRB1.jpg', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/20180531204720V628alXYE6rPUV1Q7aMrfvFRB1.jpg', '1527770840');
INSERT INTO `fc_oss_files` VALUES ('11', 'bestcar1', '201805312047582c7MH5GK1HJNb0B0FKI4C4cNqi.jpg', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/201805312047582c7MH5GK1HJNb0B0FKI4C4cNqi.jpg', '1527770878');
INSERT INTO `fc_oss_files` VALUES ('12', 'bestcar1', '20180531205506LIo07N01MyaCuWpyIssHUjIuaL.png', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/20180531205506LIo07N01MyaCuWpyIssHUjIuaL.png', '1527771306');
INSERT INTO `fc_oss_files` VALUES ('13', 'bestcar1', '201805312056164WhtKEBLb3Fb3NPSwQIYSVjQXx.png', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/201805312056164WhtKEBLb3Fb3NPSwQIYSVjQXx.png', '1527771376');
INSERT INTO `fc_oss_files` VALUES ('14', 'bestcar1', '20180531205702Rb6kaJeiwpad0rCCBFlBDKMbd3.png', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/20180531205702Rb6kaJeiwpad0rCCBFlBDKMbd3.png', '1527771422');
INSERT INTO `fc_oss_files` VALUES ('15', 'bestcar1', '20180531222202PVc33zQcy1iMoLNHDGG3dTMooF.png', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/20180531222202PVc33zQcy1iMoLNHDGG3dTMooF.png', '1527776522');
INSERT INTO `fc_oss_files` VALUES ('16', 'bestcar1', '20180531222557CgsJXbGDNeX9tGCSzrESJush7q.png', 'http://bestcar1.oss-cn-hangzhou.aliyuncs.com/20180531222557CgsJXbGDNeX9tGCSzrESJush7q.png', '1527776757');

-- ----------------------------
-- Table structure for fc_regions
-- ----------------------------
DROP TABLE IF EXISTS `fc_regions`;
CREATE TABLE `fc_regions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID',
  `name` varchar(40) NOT NULL COMMENT '名称',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '区域级别,0国家，1省份，2城市，3区县',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` int(11) unsigned NOT NULL COMMENT '创建时间',
  `updated_at` int(11) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `region_type` (`level`)
) ENGINE=MyISAM AUTO_INCREMENT=3433 DEFAULT CHARSET=utf8 COMMENT='地区';

-- ----------------------------
-- Records of fc_regions
-- ----------------------------
INSERT INTO `fc_regions` VALUES ('1', '0', '中国', '0', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2', '1', '北京', '1', '1', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3', '1', '安徽', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('4', '1', '福建', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('5', '1', '甘肃', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('6', '1', '广东', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('7', '1', '广西', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('8', '1', '贵州', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('9', '1', '海南', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('10', '1', '河北', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('11', '1', '河南', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('12', '1', '黑龙江', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('13', '1', '湖北', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('14', '1', '湖南', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('15', '1', '吉林', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('16', '1', '江苏', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('17', '1', '江西', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('18', '1', '辽宁', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('19', '1', '内蒙古', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('20', '1', '宁夏', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('21', '1', '青海', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('22', '1', '山东', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('23', '1', '山西', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('24', '1', '陕西', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('25', '1', '上海', '1', '2', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('26', '1', '四川', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('27', '1', '天津', '1', '3', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('28', '1', '西藏', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('29', '1', '新疆', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('30', '1', '云南', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('31', '1', '浙江', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('32', '1', '重庆', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('33', '1', '香港', '1', '4', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('34', '1', '澳门', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('35', '1', '台湾', '1', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('36', '3', '安庆', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('37', '3', '蚌埠', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('38', '3', '巢湖', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('39', '3', '池州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('40', '3', '滁州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('41', '3', '阜阳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('42', '3', '淮北', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('43', '3', '淮南', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('44', '3', '黄山', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('45', '3', '六安', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('46', '3', '马鞍山', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('47', '3', '宿州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('48', '3', '铜陵', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('49', '3', '芜湖', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('50', '3', '宣城', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('51', '3', '亳州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('52', '2', '北京', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('53', '4', '福州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('54', '4', '龙岩', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('55', '4', '南平', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('56', '4', '宁德', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('57', '4', '莆田', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('58', '4', '泉州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('59', '4', '三明', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('60', '4', '厦门', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('61', '4', '漳州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('62', '5', '兰州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('63', '5', '白银', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('64', '5', '定西', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('65', '5', '甘南', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('66', '5', '嘉峪关', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('67', '5', '金昌', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('68', '5', '酒泉', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('69', '5', '临夏', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('70', '5', '陇南', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('71', '5', '平凉', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('72', '5', '庆阳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('73', '5', '天水', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('74', '5', '武威', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('75', '5', '张掖', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('76', '6', '广州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('77', '6', '深圳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('78', '6', '潮州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('79', '6', '东莞', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('80', '6', '佛山', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('81', '6', '河源', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('82', '6', '惠州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('83', '6', '江门', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('84', '6', '揭阳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('85', '6', '茂名', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('86', '6', '梅州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('87', '6', '清远', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('88', '6', '汕头', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('89', '6', '汕尾', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('90', '6', '韶关', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('91', '6', '阳江', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('92', '6', '云浮', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('93', '6', '湛江', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('94', '6', '肇庆', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('95', '6', '中山', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('96', '6', '珠海', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('97', '7', '南宁', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('98', '7', '桂林', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('99', '7', '百色', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('100', '7', '北海', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('101', '7', '崇左', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('102', '7', '防城港', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('103', '7', '贵港', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('104', '7', '河池', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('105', '7', '贺州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('106', '7', '来宾', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('107', '7', '柳州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('108', '7', '钦州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('109', '7', '梧州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('110', '7', '玉林', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('111', '8', '贵阳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('112', '8', '安顺', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('113', '8', '毕节', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('114', '8', '六盘水', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('115', '8', '黔东南', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('116', '8', '黔南', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('117', '8', '黔西南', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('118', '8', '铜仁', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('119', '8', '遵义', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('120', '9', '海口', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('121', '9', '三亚', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('122', '9', '白沙', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('123', '9', '保亭', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('124', '9', '昌江', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('125', '9', '澄迈县', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('126', '9', '定安县', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('127', '9', '东方', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('128', '9', '乐东', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('129', '9', '临高县', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('130', '9', '陵水', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('131', '9', '琼海', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('132', '9', '琼中', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('133', '9', '屯昌县', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('134', '9', '万宁', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('135', '9', '文昌', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('136', '9', '五指山', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('137', '9', '儋州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('138', '10', '石家庄', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('139', '10', '保定', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('140', '10', '沧州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('141', '10', '承德', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('142', '10', '邯郸', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('143', '10', '衡水', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('144', '10', '廊坊', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('145', '10', '秦皇岛', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('146', '10', '唐山', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('147', '10', '邢台', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('148', '10', '张家口', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('149', '11', '郑州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('150', '11', '洛阳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('151', '11', '开封', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('152', '11', '安阳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('153', '11', '鹤壁', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('154', '11', '济源', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('155', '11', '焦作', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('156', '11', '南阳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('157', '11', '平顶山', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('158', '11', '三门峡', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('159', '11', '商丘', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('160', '11', '新乡', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('161', '11', '信阳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('162', '11', '许昌', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('163', '11', '周口', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('164', '11', '驻马店', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('165', '11', '漯河', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('166', '11', '濮阳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('167', '12', '哈尔滨', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('168', '12', '大庆', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('169', '12', '大兴安岭', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('170', '12', '鹤岗', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('171', '12', '黑河', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('172', '12', '鸡西', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('173', '12', '佳木斯', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('174', '12', '牡丹江', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('175', '12', '七台河', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('176', '12', '齐齐哈尔', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('177', '12', '双鸭山', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('178', '12', '绥化', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('179', '12', '伊春', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('180', '13', '武汉', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('181', '13', '仙桃', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('182', '13', '鄂州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('183', '13', '黄冈', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('184', '13', '黄石', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('185', '13', '荆门', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('186', '13', '荆州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('187', '13', '潜江', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('188', '13', '神农架林区', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('189', '13', '十堰', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('190', '13', '随州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('191', '13', '天门', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('192', '13', '咸宁', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('193', '13', '襄樊', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('194', '13', '孝感', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('195', '13', '宜昌', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('196', '13', '恩施', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('197', '14', '长沙', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('198', '14', '张家界', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('199', '14', '常德', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('200', '14', '郴州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('201', '14', '衡阳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('202', '14', '怀化', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('203', '14', '娄底', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('204', '14', '邵阳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('205', '14', '湘潭', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('206', '14', '湘西', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('207', '14', '益阳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('208', '14', '永州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('209', '14', '岳阳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('210', '14', '株洲', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('211', '15', '长春', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('212', '15', '吉林', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('213', '15', '白城', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('214', '15', '白山', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('215', '15', '辽源', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('216', '15', '四平', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('217', '15', '松原', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('218', '15', '通化', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('219', '15', '延边', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('220', '16', '南京', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('221', '16', '苏州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('222', '16', '无锡', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('223', '16', '常州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('224', '16', '淮安', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('225', '16', '连云港', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('226', '16', '南通', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('227', '16', '宿迁', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('228', '16', '泰州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('229', '16', '徐州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('230', '16', '盐城', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('231', '16', '扬州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('232', '16', '镇江', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('233', '17', '南昌', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('234', '17', '抚州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('235', '17', '赣州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('236', '17', '吉安', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('237', '17', '景德镇', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('238', '17', '九江', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('239', '17', '萍乡', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('240', '17', '上饶', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('241', '17', '新余', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('242', '17', '宜春', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('243', '17', '鹰潭', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('244', '18', '沈阳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('245', '18', '大连', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('246', '18', '鞍山', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('247', '18', '本溪', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('248', '18', '朝阳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('249', '18', '丹东', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('250', '18', '抚顺', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('251', '18', '阜新', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('252', '18', '葫芦岛', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('253', '18', '锦州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('254', '18', '辽阳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('255', '18', '盘锦', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('256', '18', '铁岭', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('257', '18', '营口', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('258', '19', '呼和浩特', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('259', '19', '阿拉善盟', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('260', '19', '巴彦淖尔盟', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('261', '19', '包头', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('262', '19', '赤峰', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('263', '19', '鄂尔多斯', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('264', '19', '呼伦贝尔', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('265', '19', '通辽', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('266', '19', '乌海', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('267', '19', '乌兰察布市', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('268', '19', '锡林郭勒盟', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('269', '19', '兴安盟', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('270', '20', '银川', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('271', '20', '固原', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('272', '20', '石嘴山', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('273', '20', '吴忠', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('274', '20', '中卫', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('275', '21', '西宁', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('276', '21', '果洛', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('277', '21', '海北', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('278', '21', '海东', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('279', '21', '海南', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('280', '21', '海西', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('281', '21', '黄南', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('282', '21', '玉树', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('283', '22', '济南', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('284', '22', '青岛', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('285', '22', '滨州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('286', '22', '德州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('287', '22', '东营', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('288', '22', '菏泽', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('289', '22', '济宁', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('290', '22', '莱芜', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('291', '22', '聊城', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('292', '22', '临沂', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('293', '22', '日照', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('294', '22', '泰安', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('295', '22', '威海', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('296', '22', '潍坊', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('297', '22', '烟台', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('298', '22', '枣庄', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('299', '22', '淄博', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('300', '23', '太原', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('301', '23', '长治', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('302', '23', '大同', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('303', '23', '晋城', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('304', '23', '晋中', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('305', '23', '临汾', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('306', '23', '吕梁', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('307', '23', '朔州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('308', '23', '忻州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('309', '23', '阳泉', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('310', '23', '运城', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('311', '24', '西安', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('312', '24', '安康', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('313', '24', '宝鸡', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('314', '24', '汉中', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('315', '24', '商洛', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('316', '24', '铜川', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('317', '24', '渭南', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('318', '24', '咸阳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('319', '24', '延安', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('320', '24', '榆林', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('321', '25', '上海', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('322', '26', '成都', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('323', '26', '绵阳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('324', '26', '阿坝', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('325', '26', '巴中', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('326', '26', '达州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('327', '26', '德阳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('328', '26', '甘孜', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('329', '26', '广安', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('330', '26', '广元', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('331', '26', '乐山', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('332', '26', '凉山', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('333', '26', '眉山', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('334', '26', '南充', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('335', '26', '内江', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('336', '26', '攀枝花', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('337', '26', '遂宁', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('338', '26', '雅安', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('339', '26', '宜宾', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('340', '26', '资阳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('341', '26', '自贡', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('342', '26', '泸州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('343', '27', '天津', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('344', '28', '拉萨', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('345', '28', '阿里', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('346', '28', '昌都', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('347', '28', '林芝', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('348', '28', '那曲', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('349', '28', '日喀则', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('350', '28', '山南', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('351', '29', '乌鲁木齐', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('352', '29', '阿克苏', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('353', '29', '阿拉尔', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('354', '29', '巴音郭楞', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('355', '29', '博尔塔拉', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('356', '29', '昌吉', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('357', '29', '哈密', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('358', '29', '和田', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('359', '29', '喀什', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('360', '29', '克拉玛依', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('361', '29', '克孜勒苏', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('362', '29', '石河子', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('363', '29', '图木舒克', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('364', '29', '吐鲁番', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('365', '29', '五家渠', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('366', '29', '伊犁', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('367', '30', '昆明', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('368', '30', '怒江', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('369', '30', '普洱', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('370', '30', '丽江', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('371', '30', '保山', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('372', '30', '楚雄', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('373', '30', '大理', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('374', '30', '德宏', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('375', '30', '迪庆', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('376', '30', '红河', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('377', '30', '临沧', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('378', '30', '曲靖', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('379', '30', '文山', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('380', '30', '西双版纳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('381', '30', '玉溪', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('382', '30', '昭通', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('383', '31', '杭州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('384', '31', '湖州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('385', '31', '嘉兴', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('386', '31', '金华', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('387', '31', '丽水', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('388', '31', '宁波', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('389', '31', '绍兴', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('390', '31', '台州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('391', '31', '温州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('392', '31', '舟山', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('393', '31', '衢州', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('394', '32', '重庆', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('395', '33', '香港', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('396', '34', '澳门', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('397', '35', '台湾', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('398', '36', '迎江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('399', '36', '大观区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('400', '36', '宜秀区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('401', '36', '桐城市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('402', '36', '怀宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('403', '36', '枞阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('404', '36', '潜山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('405', '36', '太湖县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('406', '36', '宿松县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('407', '36', '望江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('408', '36', '岳西县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('409', '37', '中市区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('410', '37', '东市区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('411', '37', '西市区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('412', '37', '郊区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('413', '37', '怀远县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('414', '37', '五河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('415', '37', '固镇县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('416', '38', '居巢区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('417', '38', '庐江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('418', '38', '无为县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('419', '38', '含山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('420', '38', '和县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('421', '39', '贵池区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('422', '39', '东至县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('423', '39', '石台县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('424', '39', '青阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('425', '40', '琅琊区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('426', '40', '南谯区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('427', '40', '天长市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('428', '40', '明光市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('429', '40', '来安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('430', '40', '全椒县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('431', '40', '定远县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('432', '40', '凤阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('433', '41', '蚌山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('434', '41', '龙子湖区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('435', '41', '禹会区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('436', '41', '淮上区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('437', '41', '颍州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('438', '41', '颍东区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('439', '41', '颍泉区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('440', '41', '界首市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('441', '41', '临泉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('442', '41', '太和县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('443', '41', '阜南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('444', '41', '颖上县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('445', '42', '相山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('446', '42', '杜集区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('447', '42', '烈山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('448', '42', '濉溪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('449', '43', '田家庵区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('450', '43', '大通区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('451', '43', '谢家集区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('452', '43', '八公山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('453', '43', '潘集区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('454', '43', '凤台县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('455', '44', '屯溪区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('456', '44', '黄山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('457', '44', '徽州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('458', '44', '歙县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('459', '44', '休宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('460', '44', '黟县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('461', '44', '祁门县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('462', '45', '金安区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('463', '45', '裕安区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('464', '45', '寿县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('465', '45', '霍邱县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('466', '45', '舒城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('467', '45', '金寨县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('468', '45', '霍山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('469', '46', '雨山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('470', '46', '花山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('471', '46', '金家庄区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('472', '46', '当涂县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('473', '47', '', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('474', '47', '砀山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('475', '47', '萧县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('476', '47', '灵璧县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('477', '47', '泗县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('478', '48', '铜官山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('479', '48', '狮子山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('480', '48', '郊区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('481', '48', '铜陵县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('482', '49', '镜湖区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('483', '49', '弋江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('484', '49', '鸠江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('485', '49', '三山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('486', '49', '芜湖县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('487', '49', '繁昌县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('488', '49', '南陵县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('489', '50', '宣州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('490', '50', '宁国市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('491', '50', '郎溪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('492', '50', '广德县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('493', '50', '泾县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('494', '50', '绩溪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('495', '50', '旌德县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('496', '51', '涡阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('497', '51', '蒙城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('498', '51', '利辛县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('499', '51', '谯城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('500', '52', '东城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('501', '52', '西城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('502', '52', '海淀区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('503', '52', '朝阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('504', '52', '崇文区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('505', '52', '宣武区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('506', '52', '丰台区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('507', '52', '石景山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('508', '52', '房山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('509', '52', '门头沟区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('510', '52', '通州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('511', '52', '顺义区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('512', '52', '昌平区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('513', '52', '怀柔区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('514', '52', '平谷区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('515', '52', '大兴区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('516', '52', '密云县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('517', '52', '延庆县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('518', '53', '鼓楼区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('519', '53', '台江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('520', '53', '仓山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('521', '53', '马尾区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('522', '53', '晋安区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('523', '53', '福清市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('524', '53', '长乐市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('525', '53', '闽侯县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('526', '53', '连江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('527', '53', '罗源县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('528', '53', '闽清县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('529', '53', '永泰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('530', '53', '平潭县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('531', '54', '新罗区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('532', '54', '漳平市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('533', '54', '长汀县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('534', '54', '永定县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('535', '54', '上杭县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('536', '54', '武平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('537', '54', '连城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('538', '55', '延平区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('539', '55', '邵武市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('540', '55', '武夷山市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('541', '55', '建瓯市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('542', '55', '建阳市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('543', '55', '顺昌县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('544', '55', '浦城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('545', '55', '光泽县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('546', '55', '松溪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('547', '55', '政和县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('548', '56', '蕉城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('549', '56', '福安市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('550', '56', '福鼎市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('551', '56', '霞浦县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('552', '56', '古田县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('553', '56', '屏南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('554', '56', '寿宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('555', '56', '周宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('556', '56', '柘荣县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('557', '57', '城厢区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('558', '57', '涵江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('559', '57', '荔城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('560', '57', '秀屿区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('561', '57', '仙游县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('562', '58', '鲤城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('563', '58', '丰泽区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('564', '58', '洛江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('565', '58', '清', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('566', '58', '泉港区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('567', '58', '石狮市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('568', '58', '晋江市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('569', '58', '南安市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('570', '58', '惠安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('571', '58', '安溪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('572', '58', '永春县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('573', '58', '德化县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('574', '58', '金门县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('575', '59', '梅列区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('576', '59', '三元区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('577', '59', '永安市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('578', '59', '明溪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('579', '59', '清流县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('580', '59', '宁化县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('581', '59', '大田县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('582', '59', '尤溪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('583', '59', '沙县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('584', '59', '将乐县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('585', '59', '泰宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('586', '59', '建宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('587', '60', '思明区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('588', '60', '海沧区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('589', '60', '湖里区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('590', '60', '集美区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('591', '60', '同安区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('592', '60', '翔安区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('593', '61', '芗城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('594', '61', '龙文区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('595', '61', '龙海市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('596', '61', '云霄县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('597', '61', '漳浦县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('598', '61', '诏安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('599', '61', '长泰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('600', '61', '东山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('601', '61', '南靖县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('602', '61', '平和县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('603', '61', '华安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('604', '62', '皋兰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('605', '62', '城关区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('606', '62', '七里河区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('607', '62', '西固区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('608', '62', '安宁区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('609', '62', '红古区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('610', '62', '永登县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('611', '62', '榆中县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('612', '63', '白银区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('613', '63', '平川区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('614', '63', '会宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('615', '63', '景泰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('616', '63', '靖远县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('617', '64', '临洮县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('618', '64', '陇西县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('619', '64', '通渭县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('620', '64', '渭源县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('621', '64', '漳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('622', '64', '岷县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('623', '64', '安定区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('624', '64', '安定区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('625', '65', '合作市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('626', '65', '临潭县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('627', '65', '卓尼县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('628', '65', '舟曲县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('629', '65', '迭部县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('630', '65', '玛曲县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('631', '65', '碌曲县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('632', '65', '夏河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('633', '66', '嘉峪关市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('634', '67', '金川区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('635', '67', '永昌县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('636', '68', '肃州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('637', '68', '玉门市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('638', '68', '敦煌市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('639', '68', '金塔县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('640', '68', '瓜州县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('641', '68', '肃北', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('642', '68', '阿克塞', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('643', '69', '临夏市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('644', '69', '临夏县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('645', '69', '康乐县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('646', '69', '永靖县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('647', '69', '广河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('648', '69', '和政县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('649', '69', '东乡族自治县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('650', '69', '积石山', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('651', '70', '成县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('652', '70', '徽县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('653', '70', '康县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('654', '70', '礼县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('655', '70', '两当县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('656', '70', '文县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('657', '70', '西和县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('658', '70', '宕昌县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('659', '70', '武都区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('660', '71', '崇信县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('661', '71', '华亭县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('662', '71', '静宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('663', '71', '灵台县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('664', '71', '崆峒区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('665', '71', '庄浪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('666', '71', '泾川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('667', '72', '合水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('668', '72', '华池县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('669', '72', '环县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('670', '72', '宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('671', '72', '庆城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('672', '72', '西峰区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('673', '72', '镇原县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('674', '72', '正宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('675', '73', '甘谷县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('676', '73', '秦安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('677', '73', '清水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('678', '73', '秦州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('679', '73', '麦积区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('680', '73', '武山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('681', '73', '张家川', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('682', '74', '古浪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('683', '74', '民勤县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('684', '74', '天祝', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('685', '74', '凉州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('686', '75', '高台县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('687', '75', '临泽县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('688', '75', '民乐县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('689', '75', '山丹县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('690', '75', '肃南', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('691', '75', '甘州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('692', '76', '从化市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('693', '76', '天河区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('694', '76', '东山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('695', '76', '白云区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('696', '76', '海珠区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('697', '76', '荔湾区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('698', '76', '越秀区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('699', '76', '黄埔区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('700', '76', '番禺区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('701', '76', '花都区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('702', '76', '增城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('703', '76', '从化区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('704', '76', '市郊', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('705', '77', '福田区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('706', '77', '罗湖区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('707', '77', '南山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('708', '77', '宝安区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('709', '77', '龙岗区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('710', '77', '盐田区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('711', '78', '湘桥区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('712', '78', '潮安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('713', '78', '饶平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('714', '79', '南城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('715', '79', '东城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('716', '79', '万江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('717', '79', '莞城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('718', '79', '石龙镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('719', '79', '虎门镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('720', '79', '麻涌镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('721', '79', '道', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('722', '79', '石碣镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('723', '79', '沙田镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('724', '79', '望牛墩镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('725', '79', '洪梅镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('726', '79', '茶山镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('727', '79', '寮步镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('728', '79', '大岭山镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('729', '79', '大朗镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('730', '79', '黄江镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('731', '79', '樟木头', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('732', '79', '凤岗镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('733', '79', '塘厦镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('734', '79', '谢岗镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('735', '79', '厚街镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('736', '79', '清溪镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('737', '79', '常平镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('738', '79', '桥头镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('739', '79', '横沥镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('740', '79', '东坑镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('741', '79', '企石镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('742', '79', '石排镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('743', '79', '长安镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('744', '79', '中堂镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('745', '79', '高', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('746', '80', '禅城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('747', '80', '南海区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('748', '80', '顺德区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('749', '80', '三水区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('750', '80', '高明区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('751', '81', '东源县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('752', '81', '和平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('753', '81', '源城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('754', '81', '连平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('755', '81', '龙川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('756', '81', '紫金县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('757', '82', '惠阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('758', '82', '惠城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('759', '82', '大亚湾', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('760', '82', '博罗县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('761', '82', '惠东县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('762', '82', '龙门县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('763', '83', '江海区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('764', '83', '蓬江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('765', '83', '新会区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('766', '83', '台山市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('767', '83', '开平市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('768', '83', '鹤山市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('769', '83', '恩平市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('770', '84', '榕城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('771', '84', '普宁市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('772', '84', '揭东县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('773', '84', '揭西县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('774', '84', '惠来县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('775', '85', '茂南区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('776', '85', '茂港区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('777', '85', '高州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('778', '85', '化州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('779', '85', '信宜市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('780', '85', '电白县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('781', '86', '梅县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('782', '86', '梅江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('783', '86', '兴宁市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('784', '86', '大埔县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('785', '86', '丰顺县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('786', '86', '五华县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('787', '86', '平远县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('788', '86', '蕉岭县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('789', '87', '清城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('790', '87', '英德市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('791', '87', '连州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('792', '87', '佛冈县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('793', '87', '阳山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('794', '87', '清新县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('795', '87', '连山', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('796', '87', '连南', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('797', '88', '南澳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('798', '88', '潮阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('799', '88', '澄海区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('800', '88', '龙湖区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('801', '88', '金平区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('802', '88', '濠江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('803', '88', '潮南区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('804', '89', '城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('805', '89', '陆丰市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('806', '89', '海丰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('807', '89', '陆河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('808', '90', '曲江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('809', '90', '浈江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('810', '90', '武江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('811', '90', '曲江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('812', '90', '乐昌市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('813', '90', '南雄市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('814', '90', '始兴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('815', '90', '仁化县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('816', '90', '翁源县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('817', '90', '新丰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('818', '90', '乳源', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('819', '91', '江城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('820', '91', '阳春市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('821', '91', '阳西县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('822', '91', '阳东县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('823', '92', '云城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('824', '92', '罗定市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('825', '92', '新兴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('826', '92', '郁南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('827', '92', '云安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('828', '93', '赤坎区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('829', '93', '霞山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('830', '93', '坡头区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('831', '93', '麻章区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('832', '93', '廉江市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('833', '93', '雷州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('834', '93', '吴川市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('835', '93', '遂溪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('836', '93', '徐闻县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('837', '94', '肇庆市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('838', '94', '高要市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('839', '94', '四会市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('840', '94', '广宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('841', '94', '怀集县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('842', '94', '封开县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('843', '94', '德庆县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('844', '95', '石岐街道', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('845', '95', '东区街道', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('846', '95', '西区街道', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('847', '95', '环城街道', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('848', '95', '中山港街道', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('849', '95', '五桂山街道', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('850', '96', '香洲区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('851', '96', '斗门区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('852', '96', '金湾区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('853', '97', '邕宁区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('854', '97', '青秀区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('855', '97', '兴宁区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('856', '97', '良庆区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('857', '97', '西乡塘区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('858', '97', '江南区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('859', '97', '武鸣县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('860', '97', '隆安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('861', '97', '马山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('862', '97', '上林县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('863', '97', '宾阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('864', '97', '横县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('865', '98', '秀峰区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('866', '98', '叠彩区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('867', '98', '象山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('868', '98', '七星区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('869', '98', '雁山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('870', '98', '阳朔县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('871', '98', '临桂县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('872', '98', '灵川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('873', '98', '全州县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('874', '98', '平乐县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('875', '98', '兴安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('876', '98', '灌阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('877', '98', '荔浦县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('878', '98', '资源县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('879', '98', '永福县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('880', '98', '龙胜', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('881', '98', '恭城', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('882', '99', '右江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('883', '99', '凌云县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('884', '99', '平果县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('885', '99', '西林县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('886', '99', '乐业县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('887', '99', '德保县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('888', '99', '田林县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('889', '99', '田阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('890', '99', '靖西县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('891', '99', '田东县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('892', '99', '那坡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('893', '99', '隆林', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('894', '100', '海城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('895', '100', '银海区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('896', '100', '铁山港区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('897', '100', '合浦县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('898', '101', '江州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('899', '101', '凭祥市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('900', '101', '宁明县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('901', '101', '扶绥县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('902', '101', '龙州县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('903', '101', '大新县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('904', '101', '天等县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('905', '102', '港口区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('906', '102', '防城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('907', '102', '东兴市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('908', '102', '上思县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('909', '103', '港北区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('910', '103', '港南区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('911', '103', '覃塘区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('912', '103', '桂平市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('913', '103', '平南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('914', '104', '金城江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('915', '104', '宜州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('916', '104', '天峨县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('917', '104', '凤山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('918', '104', '南丹县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('919', '104', '东兰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('920', '104', '都安', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('921', '104', '罗城', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('922', '104', '巴马', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('923', '104', '环江', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('924', '104', '大化', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('925', '105', '八步区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('926', '105', '钟山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('927', '105', '昭平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('928', '105', '富川', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('929', '106', '兴宾区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('930', '106', '合山市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('931', '106', '象州县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('932', '106', '武宣县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('933', '106', '忻城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('934', '106', '金秀', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('935', '107', '城中区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('936', '107', '鱼峰区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('937', '107', '柳北区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('938', '107', '柳南区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('939', '107', '柳江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('940', '107', '柳城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('941', '107', '鹿寨县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('942', '107', '融安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('943', '107', '融水', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('944', '107', '三江', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('945', '108', '钦南区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('946', '108', '钦北区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('947', '108', '灵山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('948', '108', '浦北县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('949', '109', '万秀区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('950', '109', '蝶山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('951', '109', '长洲区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('952', '109', '岑溪市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('953', '109', '苍梧县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('954', '109', '藤县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('955', '109', '蒙山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('956', '110', '玉州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('957', '110', '北流市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('958', '110', '容县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('959', '110', '陆川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('960', '110', '博白县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('961', '110', '兴业县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('962', '111', '南明区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('963', '111', '云岩区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('964', '111', '花溪区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('965', '111', '乌当区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('966', '111', '白云区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('967', '111', '小河区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('968', '111', '金阳新区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('969', '111', '新天园区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('970', '111', '清镇市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('971', '111', '开阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('972', '111', '修文县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('973', '111', '息烽县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('974', '112', '西秀区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('975', '112', '关岭', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('976', '112', '镇宁', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('977', '112', '紫云', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('978', '112', '平坝县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('979', '112', '普定县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('980', '113', '毕节市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('981', '113', '大方县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('982', '113', '黔西县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('983', '113', '金沙县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('984', '113', '织金县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('985', '113', '纳雍县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('986', '113', '赫章县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('987', '113', '威宁', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('988', '114', '钟山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('989', '114', '六枝特区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('990', '114', '水城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('991', '114', '盘县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('992', '115', '凯里市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('993', '115', '黄平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('994', '115', '施秉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('995', '115', '三穗县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('996', '115', '镇远县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('997', '115', '岑巩县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('998', '115', '天柱县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('999', '115', '锦屏县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1000', '115', '剑河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1001', '115', '台江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1002', '115', '黎平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1003', '115', '榕江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1004', '115', '从江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1005', '115', '雷山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1006', '115', '麻江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1007', '115', '丹寨县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1008', '116', '都匀市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1009', '116', '福泉市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1010', '116', '荔波县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1011', '116', '贵定县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1012', '116', '瓮安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1013', '116', '独山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1014', '116', '平塘县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1015', '116', '罗甸县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1016', '116', '长顺县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1017', '116', '龙里县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1018', '116', '惠水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1019', '116', '三都', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1020', '117', '兴义市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1021', '117', '兴仁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1022', '117', '普安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1023', '117', '晴隆县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1024', '117', '贞丰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1025', '117', '望谟县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1026', '117', '册亨县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1027', '117', '安龙县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1028', '118', '铜仁市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1029', '118', '江口县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1030', '118', '石阡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1031', '118', '思南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1032', '118', '德江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1033', '118', '玉屏', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1034', '118', '印江', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1035', '118', '沿河', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1036', '118', '松桃', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1037', '118', '万山特区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1038', '119', '红花岗区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1039', '119', '务川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1040', '119', '道真县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1041', '119', '汇川区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1042', '119', '赤水市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1043', '119', '仁怀市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1044', '119', '遵义县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1045', '119', '桐梓县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1046', '119', '绥阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1047', '119', '正安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1048', '119', '凤冈县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1049', '119', '湄潭县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1050', '119', '余庆县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1051', '119', '习水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1052', '119', '道真', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1053', '119', '务川', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1054', '120', '秀英区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1055', '120', '龙华区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1056', '120', '琼山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1057', '120', '美兰区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1058', '137', '市区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1059', '137', '洋浦开发区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1060', '137', '那大镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1061', '137', '王五镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1062', '137', '雅星镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1063', '137', '大成镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1064', '137', '中和镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1065', '137', '峨蔓镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1066', '137', '南丰镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1067', '137', '白马井镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1068', '137', '兰洋镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1069', '137', '和庆镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1070', '137', '海头镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1071', '137', '排浦镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1072', '137', '东成镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1073', '137', '光村镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1074', '137', '木棠镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1075', '137', '新州镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1076', '137', '三都镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1077', '137', '其他', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1078', '138', '长安区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1079', '138', '桥东区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1080', '138', '桥西区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1081', '138', '新华区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1082', '138', '裕华区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1083', '138', '井陉矿区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1084', '138', '高新区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1085', '138', '辛集市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1086', '138', '藁城市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1087', '138', '晋州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1088', '138', '新乐市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1089', '138', '鹿泉市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1090', '138', '井陉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1091', '138', '正定县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1092', '138', '栾城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1093', '138', '行唐县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1094', '138', '灵寿县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1095', '138', '高邑县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1096', '138', '深泽县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1097', '138', '赞皇县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1098', '138', '无极县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1099', '138', '平山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1100', '138', '元氏县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1101', '138', '赵县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1102', '139', '新市区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1103', '139', '南市区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1104', '139', '北市区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1105', '139', '涿州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1106', '139', '定州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1107', '139', '安国市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1108', '139', '高碑店市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1109', '139', '满城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1110', '139', '清苑县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1111', '139', '涞水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1112', '139', '阜平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1113', '139', '徐水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1114', '139', '定兴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1115', '139', '唐县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1116', '139', '高阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1117', '139', '容城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1118', '139', '涞源县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1119', '139', '望都县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1120', '139', '安新县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1121', '139', '易县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1122', '139', '曲阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1123', '139', '蠡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1124', '139', '顺平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1125', '139', '博野县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1126', '139', '雄县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1127', '140', '运河区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1128', '140', '新华区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1129', '140', '泊头市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1130', '140', '任丘市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1131', '140', '黄骅市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1132', '140', '河间市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1133', '140', '沧县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1134', '140', '青县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1135', '140', '东光县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1136', '140', '海兴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1137', '140', '盐山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1138', '140', '肃宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1139', '140', '南皮县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1140', '140', '吴桥县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1141', '140', '献县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1142', '140', '孟村', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1143', '141', '双桥区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1144', '141', '双滦区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1145', '141', '鹰手营子矿区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1146', '141', '承德县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1147', '141', '兴隆县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1148', '141', '平泉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1149', '141', '滦平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1150', '141', '隆化县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1151', '141', '丰宁', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1152', '141', '宽城', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1153', '141', '围场', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1154', '142', '从台区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1155', '142', '复兴区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1156', '142', '邯山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1157', '142', '峰峰矿区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1158', '142', '武安市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1159', '142', '邯郸县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1160', '142', '临漳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1161', '142', '成安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1162', '142', '大名县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1163', '142', '涉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1164', '142', '磁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1165', '142', '肥乡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1166', '142', '永年县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1167', '142', '邱县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1168', '142', '鸡泽县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1169', '142', '广平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1170', '142', '馆陶县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1171', '142', '魏县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1172', '142', '曲周县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1173', '143', '桃城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1174', '143', '冀州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1175', '143', '深州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1176', '143', '枣强县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1177', '143', '武邑县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1178', '143', '武强县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1179', '143', '饶阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1180', '143', '安平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1181', '143', '故城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1182', '143', '景县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1183', '143', '阜城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1184', '144', '安次区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1185', '144', '广阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1186', '144', '霸州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1187', '144', '三河市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1188', '144', '固安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1189', '144', '永清县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1190', '144', '香河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1191', '144', '大城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1192', '144', '文安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1193', '144', '大厂', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1194', '145', '海港区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1195', '145', '山海关区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1196', '145', '北戴河区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1197', '145', '昌黎县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1198', '145', '抚宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1199', '145', '卢龙县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1200', '145', '青龙', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1201', '146', '路北区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1202', '146', '路南区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1203', '146', '古冶区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1204', '146', '开平区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1205', '146', '丰南区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1206', '146', '丰润区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1207', '146', '遵化市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1208', '146', '迁安市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1209', '146', '滦县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1210', '146', '滦南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1211', '146', '乐亭县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1212', '146', '迁西县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1213', '146', '玉田县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1214', '146', '唐海县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1215', '147', '桥东区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1216', '147', '桥西区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1217', '147', '南宫市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1218', '147', '沙河市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1219', '147', '邢台县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1220', '147', '临城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1221', '147', '内丘县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1222', '147', '柏乡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1223', '147', '隆尧县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1224', '147', '任县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1225', '147', '南和县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1226', '147', '宁晋县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1227', '147', '巨鹿县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1228', '147', '新河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1229', '147', '广宗县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1230', '147', '平乡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1231', '147', '威县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1232', '147', '清河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1233', '147', '临西县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1234', '148', '桥西区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1235', '148', '桥东区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1236', '148', '宣化区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1237', '148', '下花园区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1238', '148', '宣化县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1239', '148', '张北县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1240', '148', '康保县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1241', '148', '沽源县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1242', '148', '尚义县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1243', '148', '蔚县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1244', '148', '阳原县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1245', '148', '怀安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1246', '148', '万全县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1247', '148', '怀来县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1248', '148', '涿鹿县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1249', '148', '赤城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1250', '148', '崇礼县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1251', '149', '金水区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1252', '149', '邙山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1253', '149', '二七区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1254', '149', '管城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1255', '149', '中原区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1256', '149', '上街区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1257', '149', '惠济区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1258', '149', '郑东新区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1259', '149', '经济技术开发区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1260', '149', '高新开发区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1261', '149', '出口加工区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1262', '149', '巩义市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1263', '149', '荥阳市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1264', '149', '新密市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1265', '149', '新郑市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1266', '149', '登封市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1267', '149', '中牟县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1268', '150', '西工区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1269', '150', '老城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1270', '150', '涧西区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1271', '150', '', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1272', '150', '洛龙区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1273', '150', '吉利区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1274', '150', '偃师市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1275', '150', '孟津县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1276', '150', '新安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1277', '150', '栾川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1278', '150', '嵩县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1279', '150', '汝阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1280', '150', '宜阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1281', '150', '洛宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1282', '150', '伊川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1283', '151', '鼓楼区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1284', '151', '龙亭区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1285', '151', '顺河回族区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1286', '151', '金明区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1287', '151', '禹王台区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1288', '151', '杞县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1289', '151', '通许县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1290', '151', '尉氏县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1291', '151', '开封县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1292', '151', '兰考县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1293', '152', '北关区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1294', '152', '文峰区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1295', '152', '殷都区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1296', '152', '龙安区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1297', '152', '林州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1298', '152', '安阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1299', '152', '汤阴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1300', '152', '滑县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1301', '152', '内黄县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1302', '153', '淇滨区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1303', '153', '山城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1304', '153', '鹤山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1305', '153', '浚县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1306', '153', '淇县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1307', '154', '济源市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1308', '155', '解放区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1309', '155', '中站区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1310', '155', '马村区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1311', '155', '山阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1312', '155', '沁阳市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1313', '155', '孟州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1314', '155', '修武县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1315', '155', '博爱县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1316', '155', '武陟县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1317', '155', '温县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1318', '156', '卧龙区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1319', '156', '宛城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1320', '156', '邓州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1321', '156', '南召县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1322', '156', '方城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1323', '156', '西峡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1324', '156', '镇平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1325', '156', '内乡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1326', '156', '淅川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1327', '156', '社旗县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1328', '156', '唐河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1329', '156', '新野县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1330', '156', '桐柏县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1331', '157', '新华区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1332', '157', '卫东区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1333', '157', '湛河区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1334', '157', '石龙区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1335', '157', '舞钢市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1336', '157', '汝州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1337', '157', '宝丰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1338', '157', '叶县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1339', '157', '鲁山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1340', '157', '郏县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1341', '158', '湖滨区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1342', '158', '义马市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1343', '158', '灵宝市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1344', '158', '渑池县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1345', '158', '陕县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1346', '158', '卢氏县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1347', '159', '梁园区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1348', '159', '睢阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1349', '159', '永城市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1350', '159', '民权县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1351', '159', '睢县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1352', '159', '宁陵县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1353', '159', '虞城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1354', '159', '柘城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1355', '159', '夏邑县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1356', '160', '卫滨区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1357', '160', '红旗区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1358', '160', '凤泉区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1359', '160', '牧野区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1360', '160', '卫辉市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1361', '160', '辉县市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1362', '160', '新乡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1363', '160', '获嘉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1364', '160', '原阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1365', '160', '延津县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1366', '160', '封丘县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1367', '160', '长垣县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1368', '161', '', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1369', '161', '平桥区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1370', '161', '罗山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1371', '161', '光山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1372', '161', '新县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1373', '161', '商城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1374', '161', '固始县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1375', '161', '潢川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1376', '161', '淮滨县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1377', '161', '息县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1378', '162', '魏都区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1379', '162', '禹州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1380', '162', '长葛市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1381', '162', '许昌县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1382', '162', '鄢陵县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1383', '162', '襄城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1384', '163', '川汇区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1385', '163', '项城市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1386', '163', '扶沟县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1387', '163', '西华县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1388', '163', '商水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1389', '163', '沈丘县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1390', '163', '郸城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1391', '163', '淮阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1392', '163', '太康县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1393', '163', '鹿邑县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1394', '164', '驿城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1395', '164', '西平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1396', '164', '上蔡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1397', '164', '平舆县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1398', '164', '正阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1399', '164', '确山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1400', '164', '泌阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1401', '164', '汝南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1402', '164', '遂平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1403', '164', '新蔡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1404', '165', '郾城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1405', '165', '源汇区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1406', '165', '召陵区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1407', '165', '舞阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1408', '165', '临颍县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1409', '166', '华龙区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1410', '166', '清丰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1411', '166', '南乐县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1412', '166', '范县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1413', '166', '台前县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1414', '166', '濮阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1415', '167', '道里区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1416', '167', '南岗区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1417', '167', '动力区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1418', '167', '平房区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1419', '167', '香坊区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1420', '167', '太平区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1421', '167', '道外区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1422', '167', '阿城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1423', '167', '呼兰区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1424', '167', '松北区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1425', '167', '尚志市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1426', '167', '双城市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1427', '167', '五常市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1428', '167', '方正县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1429', '167', '宾县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1430', '167', '依兰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1431', '167', '巴彦县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1432', '167', '通河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1433', '167', '木兰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1434', '167', '延寿县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1435', '168', '萨尔图区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1436', '168', '红岗区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1437', '168', '龙凤区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1438', '168', '让胡路区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1439', '168', '大同区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1440', '168', '肇州县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1441', '168', '肇源县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1442', '168', '林甸县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1443', '168', '杜尔伯特', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1444', '169', '呼玛县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1445', '169', '漠河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1446', '169', '塔河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1447', '170', '兴山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1448', '170', '工农区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1449', '170', '南山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1450', '170', '兴安区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1451', '170', '向阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1452', '170', '东山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1453', '170', '萝北县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1454', '170', '绥滨县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1455', '171', '爱辉区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1456', '171', '五大连池市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1457', '171', '北安市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1458', '171', '嫩江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1459', '171', '逊克县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1460', '171', '孙吴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1461', '172', '鸡冠区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1462', '172', '恒山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1463', '172', '城子河区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1464', '172', '滴道区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1465', '172', '梨树区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1466', '172', '虎林市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1467', '172', '密山市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1468', '172', '鸡东县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1469', '173', '前进区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1470', '173', '郊区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1471', '173', '向阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1472', '173', '东风区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1473', '173', '同江市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1474', '173', '富锦市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1475', '173', '桦南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1476', '173', '桦川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1477', '173', '汤原县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1478', '173', '抚远县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1479', '174', '爱民区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1480', '174', '东安区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1481', '174', '阳明区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1482', '174', '西安区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1483', '174', '绥芬河市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1484', '174', '海林市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1485', '174', '宁安市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1486', '174', '穆棱市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1487', '174', '东宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1488', '174', '林口县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1489', '175', '桃山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1490', '175', '新兴区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1491', '175', '茄子河区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1492', '175', '勃利县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1493', '176', '龙沙区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1494', '176', '昂昂溪区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1495', '176', '铁峰区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1496', '176', '建华区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1497', '176', '富拉尔基区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1498', '176', '碾子山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1499', '176', '梅里斯达斡尔区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1500', '176', '讷河市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1501', '176', '龙江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1502', '176', '依安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1503', '176', '泰来县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1504', '176', '甘南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1505', '176', '富裕县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1506', '176', '克山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1507', '176', '克东县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1508', '176', '拜泉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1509', '177', '尖山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1510', '177', '岭东区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1511', '177', '四方台区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1512', '177', '宝山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1513', '177', '集贤县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1514', '177', '友谊县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1515', '177', '宝清县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1516', '177', '饶河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1517', '178', '北林区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1518', '178', '安达市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1519', '178', '肇东市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1520', '178', '海伦市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1521', '178', '望奎县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1522', '178', '兰西县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1523', '178', '青冈县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1524', '178', '庆安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1525', '178', '明水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1526', '178', '绥棱县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1527', '179', '伊春区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1528', '179', '带岭区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1529', '179', '南岔区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1530', '179', '金山屯区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1531', '179', '西林区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1532', '179', '美溪区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1533', '179', '乌马河区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1534', '179', '翠峦区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1535', '179', '友好区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1536', '179', '上甘岭区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1537', '179', '五营区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1538', '179', '红星区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1539', '179', '新青区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1540', '179', '汤旺河区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1541', '179', '乌伊岭区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1542', '179', '铁力市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1543', '179', '嘉荫县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1544', '180', '江岸区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1545', '180', '武昌区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1546', '180', '江汉区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1547', '180', '', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1548', '180', '汉阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1549', '180', '青山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1550', '180', '洪山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1551', '180', '东西湖区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1552', '180', '汉南区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1553', '180', '蔡甸区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1554', '180', '江夏区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1555', '180', '黄陂区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1556', '180', '新洲区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1557', '180', '经济开发区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1558', '181', '仙桃市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1559', '182', '鄂城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1560', '182', '华容区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1561', '182', '梁子湖区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1562', '183', '黄州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1563', '183', '麻城市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1564', '183', '武穴市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1565', '183', '团风县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1566', '183', '红安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1567', '183', '罗田县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1568', '183', '英山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1569', '183', '浠水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1570', '183', '蕲春县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1571', '183', '黄梅县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1572', '184', '黄石港区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1573', '184', '西塞山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1574', '184', '下陆区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1575', '184', '铁山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1576', '184', '大冶市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1577', '184', '阳新县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1578', '185', '东宝区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1579', '185', '掇刀区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1580', '185', '钟祥市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1581', '185', '京山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1582', '185', '沙洋县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1583', '186', '沙市区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1584', '186', '荆州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1585', '186', '石首市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1586', '186', '洪湖市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1587', '186', '松滋市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1588', '186', '公安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1589', '186', '监利县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1590', '186', '江陵县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1591', '187', '潜江市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1592', '188', '神农架林区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1593', '189', '张湾区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1594', '189', '茅箭区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1595', '189', '丹江口市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1596', '189', '郧县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1597', '189', '郧西县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1598', '189', '竹山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1599', '189', '竹溪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1600', '189', '房县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1601', '190', '曾都区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1602', '190', '广水市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1603', '191', '天门市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1604', '192', '咸安区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1605', '192', '赤壁市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1606', '192', '嘉鱼县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1607', '192', '通城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1608', '192', '崇阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1609', '192', '通山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1610', '193', '襄城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1611', '193', '樊城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1612', '193', '襄阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1613', '193', '老河口市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1614', '193', '枣阳市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1615', '193', '宜城市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1616', '193', '南漳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1617', '193', '谷城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1618', '193', '保康县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1619', '194', '孝南区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1620', '194', '应城市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1621', '194', '安陆市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1622', '194', '汉川市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1623', '194', '孝昌县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1624', '194', '大悟县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1625', '194', '云梦县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1626', '195', '长阳', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1627', '195', '五峰', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1628', '195', '西陵区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1629', '195', '伍家岗区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1630', '195', '点军区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1631', '195', '', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1632', '195', '夷陵区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1633', '195', '宜都市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1634', '195', '当阳市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1635', '195', '枝江市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1636', '195', '远安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1637', '195', '兴山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1638', '195', '秭归县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1639', '196', '恩施市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1640', '196', '利川市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1641', '196', '建始县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1642', '196', '巴东县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1643', '196', '宣恩县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1644', '196', '咸丰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1645', '196', '来凤县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1646', '196', '鹤峰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1647', '197', '岳麓区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1648', '197', '芙蓉区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1649', '197', '天心区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1650', '197', '开福区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1651', '197', '雨花区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1652', '197', '开发区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1653', '197', '浏阳市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1654', '197', '长沙县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1655', '197', '望城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1656', '197', '宁乡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1657', '198', '永定区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1658', '198', '武陵源区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1659', '198', '慈利县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1660', '198', '桑植县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1661', '199', '武陵区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1662', '199', '鼎城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1663', '199', '津市市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1664', '199', '安乡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1665', '199', '汉寿县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1666', '199', '澧县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1667', '199', '临澧县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1668', '199', '桃源县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1669', '199', '石门县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1670', '200', '北湖区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1671', '200', '苏仙区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1672', '200', '资兴市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1673', '200', '桂阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1674', '200', '宜章县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1675', '200', '永兴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1676', '200', '嘉禾县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1677', '200', '临武县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1678', '200', '汝城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1679', '200', '桂东县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1680', '200', '安仁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1681', '201', '雁峰区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1682', '201', '珠晖区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1683', '201', '石鼓区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1684', '201', '蒸湘区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1685', '201', '南岳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1686', '201', '耒阳市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1687', '201', '常宁市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1688', '201', '衡阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1689', '201', '衡南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1690', '201', '衡山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1691', '201', '衡东县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1692', '201', '祁东县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1693', '202', '鹤城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1694', '202', '靖州', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1695', '202', '麻阳', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1696', '202', '通道', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1697', '202', '新晃', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1698', '202', '芷江', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1699', '202', '沅陵县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1700', '202', '辰溪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1701', '202', '溆浦县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1702', '202', '中方县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1703', '202', '会同县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1704', '202', '洪江市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1705', '203', '娄星区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1706', '203', '冷水江市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1707', '203', '涟源市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1708', '203', '双峰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1709', '203', '新化县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1710', '204', '城步', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1711', '204', '双清区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1712', '204', '大祥区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1713', '204', '北塔区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1714', '204', '武冈市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1715', '204', '邵东县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1716', '204', '新邵县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1717', '204', '邵阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1718', '204', '隆回县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1719', '204', '洞口县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1720', '204', '绥宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1721', '204', '新宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1722', '205', '岳塘区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1723', '205', '雨湖区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1724', '205', '湘乡市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1725', '205', '韶山市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1726', '205', '湘潭县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1727', '206', '吉首市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1728', '206', '泸溪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1729', '206', '凤凰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1730', '206', '花垣县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1731', '206', '保靖县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1732', '206', '古丈县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1733', '206', '永顺县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1734', '206', '龙山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1735', '207', '赫山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1736', '207', '资阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1737', '207', '沅江市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1738', '207', '南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1739', '207', '桃江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1740', '207', '安化县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1741', '208', '江华', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1742', '208', '冷水滩区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1743', '208', '零陵区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1744', '208', '祁阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1745', '208', '东安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1746', '208', '双牌县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1747', '208', '道县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1748', '208', '江永县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1749', '208', '宁远县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1750', '208', '蓝山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1751', '208', '新田县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1752', '209', '岳阳楼区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1753', '209', '君山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1754', '209', '云溪区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1755', '209', '汨罗市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1756', '209', '临湘市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1757', '209', '岳阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1758', '209', '华容县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1759', '209', '湘阴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1760', '209', '平江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1761', '210', '天元区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1762', '210', '荷塘区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1763', '210', '芦淞区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1764', '210', '石峰区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1765', '210', '醴陵市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1766', '210', '株洲县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1767', '210', '攸县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1768', '210', '茶陵县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1769', '210', '炎陵县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1770', '211', '朝阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1771', '211', '宽城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1772', '211', '二道区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1773', '211', '南关区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1774', '211', '绿园区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1775', '211', '双阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1776', '211', '净月潭开发区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1777', '211', '高新技术开发区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1778', '211', '经济技术开发区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1779', '211', '汽车产业开发区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1780', '211', '德惠市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1781', '211', '九台市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1782', '211', '榆树市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1783', '211', '农安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1784', '212', '船营区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1785', '212', '昌邑区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1786', '212', '龙潭区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1787', '212', '丰满区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1788', '212', '蛟河市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1789', '212', '桦甸市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1790', '212', '舒兰市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1791', '212', '磐石市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1792', '212', '永吉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1793', '213', '洮北区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1794', '213', '洮南市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1795', '213', '大安市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1796', '213', '镇赉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1797', '213', '通榆县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1798', '214', '江源区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1799', '214', '八道江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1800', '214', '长白', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1801', '214', '临江市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1802', '214', '抚松县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1803', '214', '靖宇县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1804', '215', '龙山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1805', '215', '西安区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1806', '215', '东丰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1807', '215', '东辽县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1808', '216', '铁西区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1809', '216', '铁东区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1810', '216', '伊通', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1811', '216', '公主岭市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1812', '216', '双辽市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1813', '216', '梨树县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1814', '217', '前郭尔罗斯', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1815', '217', '宁江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1816', '217', '长岭县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1817', '217', '乾安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1818', '217', '扶余县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1819', '218', '东昌区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1820', '218', '二道江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1821', '218', '梅河口市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1822', '218', '集安市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1823', '218', '通化县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1824', '218', '辉南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1825', '218', '柳河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1826', '219', '延吉市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1827', '219', '图们市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1828', '219', '敦化市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1829', '219', '珲春市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1830', '219', '龙井市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1831', '219', '和龙市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1832', '219', '安图县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1833', '219', '汪清县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1834', '220', '玄武区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1835', '220', '鼓楼区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1836', '220', '白下区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1837', '220', '建邺区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1838', '220', '秦淮区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1839', '220', '雨花台区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1840', '220', '下关区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1841', '220', '栖霞区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1842', '220', '浦口区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1843', '220', '江宁区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1844', '220', '六合区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1845', '220', '溧水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1846', '220', '高淳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1847', '221', '沧浪区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1848', '221', '金阊区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1849', '221', '平江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1850', '221', '虎丘区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1851', '221', '吴中区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1852', '221', '相城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1853', '221', '园区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1854', '221', '新区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1855', '221', '常熟市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1856', '221', '张家港市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1857', '221', '玉山镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1858', '221', '巴城镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1859', '221', '周市镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1860', '221', '陆家镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1861', '221', '花桥镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1862', '221', '淀山湖镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1863', '221', '张浦镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1864', '221', '周庄镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1865', '221', '千灯镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1866', '221', '锦溪镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1867', '221', '开发区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1868', '221', '吴江市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1869', '221', '太仓市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1870', '222', '崇安区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1871', '222', '北塘区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1872', '222', '南长区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1873', '222', '锡山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1874', '222', '惠山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1875', '222', '滨湖区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1876', '222', '新区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1877', '222', '江阴市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1878', '222', '宜兴市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1879', '223', '天宁区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1880', '223', '钟楼区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1881', '223', '戚墅堰区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1882', '223', '郊区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1883', '223', '新北区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1884', '223', '武进区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1885', '223', '溧阳市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1886', '223', '金坛市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1887', '224', '清河区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1888', '224', '清浦区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1889', '224', '楚州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1890', '224', '淮阴区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1891', '224', '涟水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1892', '224', '洪泽县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1893', '224', '盱眙县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1894', '224', '金湖县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1895', '225', '新浦区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1896', '225', '连云区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1897', '225', '海州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1898', '225', '赣榆县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1899', '225', '东海县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1900', '225', '灌云县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1901', '225', '灌南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1902', '226', '崇川区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1903', '226', '港闸区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1904', '226', '经济开发区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1905', '226', '启东市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1906', '226', '如皋市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1907', '226', '通州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1908', '226', '海门市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1909', '226', '海安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1910', '226', '如东县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1911', '227', '宿城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1912', '227', '宿豫区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1913', '227', '宿豫县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1914', '227', '沭阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1915', '227', '泗阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1916', '227', '泗洪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1917', '228', '海陵区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1918', '228', '高港区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1919', '228', '兴化市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1920', '228', '靖江市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1921', '228', '泰兴市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1922', '228', '姜堰市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1923', '229', '云龙区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1924', '229', '鼓楼区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1925', '229', '九里区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1926', '229', '贾汪区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1927', '229', '泉山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1928', '229', '新沂市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1929', '229', '邳州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1930', '229', '丰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1931', '229', '沛县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1932', '229', '铜山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1933', '229', '睢宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1934', '230', '城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1935', '230', '亭湖区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1936', '230', '盐都区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1937', '230', '盐都县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1938', '230', '东台市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1939', '230', '大丰市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1940', '230', '响水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1941', '230', '滨海县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1942', '230', '阜宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1943', '230', '射阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1944', '230', '建湖县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1945', '231', '广陵区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1946', '231', '维扬区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1947', '231', '邗江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1948', '231', '仪征市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1949', '231', '高邮市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1950', '231', '江都市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1951', '231', '宝应县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1952', '232', '京口区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1953', '232', '润州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1954', '232', '丹徒区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1955', '232', '丹阳市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1956', '232', '扬中市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1957', '232', '句容市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1958', '233', '东湖区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1959', '233', '西湖区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1960', '233', '青云谱区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1961', '233', '湾里区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1962', '233', '青山湖区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1963', '233', '红谷滩新区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1964', '233', '昌北区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1965', '233', '高新区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1966', '233', '南昌县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1967', '233', '新建县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1968', '233', '安义县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1969', '233', '进贤县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1970', '234', '临川区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1971', '234', '南城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1972', '234', '黎川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1973', '234', '南丰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1974', '234', '崇仁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1975', '234', '乐安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1976', '234', '宜黄县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1977', '234', '金溪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1978', '234', '资溪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1979', '234', '东乡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1980', '234', '广昌县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1981', '235', '章贡区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1982', '235', '于都县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1983', '235', '瑞金市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1984', '235', '南康市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1985', '235', '赣县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1986', '235', '信丰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1987', '235', '大余县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1988', '235', '上犹县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1989', '235', '崇义县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1990', '235', '安远县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1991', '235', '龙南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1992', '235', '定南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1993', '235', '全南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1994', '235', '宁都县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1995', '235', '兴国县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1996', '235', '会昌县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1997', '235', '寻乌县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1998', '235', '石城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('1999', '236', '安福县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2000', '236', '吉州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2001', '236', '青原区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2002', '236', '井冈山市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2003', '236', '吉安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2004', '236', '吉水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2005', '236', '峡江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2006', '236', '新干县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2007', '236', '永丰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2008', '236', '泰和县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2009', '236', '遂川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2010', '236', '万安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2011', '236', '永新县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2012', '237', '珠山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2013', '237', '昌江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2014', '237', '乐平市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2015', '237', '浮梁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2016', '238', '浔阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2017', '238', '庐山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2018', '238', '瑞昌市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2019', '238', '九江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2020', '238', '武宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2021', '238', '修水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2022', '238', '永修县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2023', '238', '德安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2024', '238', '星子县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2025', '238', '都昌县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2026', '238', '湖口县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2027', '238', '彭泽县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2028', '239', '安源区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2029', '239', '湘东区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2030', '239', '莲花县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2031', '239', '芦溪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2032', '239', '上栗县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2033', '240', '信州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2034', '240', '德兴市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2035', '240', '上饶县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2036', '240', '广丰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2037', '240', '玉山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2038', '240', '铅山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2039', '240', '横峰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2040', '240', '弋阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2041', '240', '余干县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2042', '240', '波阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2043', '240', '万年县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2044', '240', '婺源县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2045', '241', '渝水区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2046', '241', '分宜县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2047', '242', '袁州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2048', '242', '丰城市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2049', '242', '樟树市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2050', '242', '高安市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2051', '242', '奉新县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2052', '242', '万载县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2053', '242', '上高县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2054', '242', '宜丰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2055', '242', '靖安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2056', '242', '铜鼓县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2057', '243', '月湖区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2058', '243', '贵溪市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2059', '243', '余江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2060', '244', '沈河区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2061', '244', '皇姑区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2062', '244', '和平区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2063', '244', '大东区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2064', '244', '铁西区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2065', '244', '苏家屯区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2066', '244', '东陵区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2067', '244', '沈北新区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2068', '244', '于洪区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2069', '244', '浑南新区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2070', '244', '新民市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2071', '244', '辽中县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2072', '244', '康平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2073', '244', '法库县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2074', '245', '西岗区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2075', '245', '中山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2076', '245', '沙河口区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2077', '245', '甘井子区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2078', '245', '旅顺口区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2079', '245', '金州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2080', '245', '开发区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2081', '245', '瓦房店市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2082', '245', '普兰店市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2083', '245', '庄河市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2084', '245', '长海县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2085', '246', '铁东区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2086', '246', '铁西区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2087', '246', '立山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2088', '246', '千山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2089', '246', '岫岩', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2090', '246', '海城市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2091', '246', '台安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2092', '247', '本溪', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2093', '247', '平山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2094', '247', '明山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2095', '247', '溪湖区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2096', '247', '南芬区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2097', '247', '桓仁', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2098', '248', '双塔区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2099', '248', '龙城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2100', '248', '喀喇沁左翼蒙古族自治县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2101', '248', '北票市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2102', '248', '凌源市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2103', '248', '朝阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2104', '248', '建平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2105', '249', '振兴区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2106', '249', '元宝区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2107', '249', '振安区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2108', '249', '宽甸', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2109', '249', '东港市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2110', '249', '凤城市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2111', '250', '顺城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2112', '250', '新抚区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2113', '250', '东洲区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2114', '250', '望花区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2115', '250', '清原', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2116', '250', '新宾', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2117', '250', '抚顺县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2118', '251', '阜新', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2119', '251', '海州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2120', '251', '新邱区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2121', '251', '太平区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2122', '251', '清河门区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2123', '251', '细河区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2124', '251', '彰武县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2125', '252', '龙港区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2126', '252', '南票区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2127', '252', '连山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2128', '252', '兴城市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2129', '252', '绥中县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2130', '252', '建昌县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2131', '253', '太和区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2132', '253', '古塔区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2133', '253', '凌河区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2134', '253', '凌海市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2135', '253', '北镇市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2136', '253', '黑山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2137', '253', '义县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2138', '254', '白塔区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2139', '254', '文圣区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2140', '254', '宏伟区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2141', '254', '太子河区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2142', '254', '弓长岭区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2143', '254', '灯塔市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2144', '254', '辽阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2145', '255', '双台子区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2146', '255', '兴隆台区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2147', '255', '大洼县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2148', '255', '盘山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2149', '256', '银州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2150', '256', '清河区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2151', '256', '调兵山市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2152', '256', '开原市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2153', '256', '铁岭县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2154', '256', '西丰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2155', '256', '昌图县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2156', '257', '站前区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2157', '257', '西市区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2158', '257', '鲅鱼圈区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2159', '257', '老边区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2160', '257', '盖州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2161', '257', '大石桥市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2162', '258', '回民区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2163', '258', '玉泉区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2164', '258', '新城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2165', '258', '赛罕区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2166', '258', '清水河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2167', '258', '土默特左旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2168', '258', '托克托县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2169', '258', '和林格尔县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2170', '258', '武川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2171', '259', '阿拉善左旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2172', '259', '阿拉善右旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2173', '259', '额济纳旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2174', '260', '临河区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2175', '260', '五原县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2176', '260', '磴口县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2177', '260', '乌拉特前旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2178', '260', '乌拉特中旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2179', '260', '乌拉特后旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2180', '260', '杭锦后旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2181', '261', '昆都仑区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2182', '261', '青山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2183', '261', '东河区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2184', '261', '九原区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2185', '261', '石拐区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2186', '261', '白云矿区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2187', '261', '土默特右旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2188', '261', '固阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2189', '261', '达尔罕茂明安联合旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2190', '262', '红山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2191', '262', '元宝山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2192', '262', '松山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2193', '262', '阿鲁科尔沁旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2194', '262', '巴林左旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2195', '262', '巴林右旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2196', '262', '林西县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2197', '262', '克什克腾旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2198', '262', '翁牛特旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2199', '262', '喀喇沁旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2200', '262', '宁城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2201', '262', '敖汉旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2202', '263', '东胜区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2203', '263', '达拉特旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2204', '263', '准格尔旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2205', '263', '鄂托克前旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2206', '263', '鄂托克旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2207', '263', '杭锦旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2208', '263', '乌审旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2209', '263', '伊金霍洛旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2210', '264', '海拉尔区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2211', '264', '莫力达瓦', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2212', '264', '满洲里市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2213', '264', '牙克石市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2214', '264', '扎兰屯市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2215', '264', '额尔古纳市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2216', '264', '根河市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2217', '264', '阿荣旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2218', '264', '鄂伦春自治旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2219', '264', '鄂温克族自治旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2220', '264', '陈巴尔虎旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2221', '264', '新巴尔虎左旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2222', '264', '新巴尔虎右旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2223', '265', '科尔沁区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2224', '265', '霍林郭勒市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2225', '265', '科尔沁左翼中旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2226', '265', '科尔沁左翼后旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2227', '265', '开鲁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2228', '265', '库伦旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2229', '265', '奈曼旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2230', '265', '扎鲁特旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2231', '266', '海勃湾区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2232', '266', '乌达区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2233', '266', '海南区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2234', '267', '化德县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2235', '267', '集宁区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2236', '267', '丰镇市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2237', '267', '卓资县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2238', '267', '商都县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2239', '267', '兴和县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2240', '267', '凉城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2241', '267', '察哈尔右翼前旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2242', '267', '察哈尔右翼中旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2243', '267', '察哈尔右翼后旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2244', '267', '四子王旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2245', '268', '二连浩特市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2246', '268', '锡林浩特市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2247', '268', '阿巴嘎旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2248', '268', '苏尼特左旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2249', '268', '苏尼特右旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2250', '268', '东乌珠穆沁旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2251', '268', '西乌珠穆沁旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2252', '268', '太仆寺旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2253', '268', '镶黄旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2254', '268', '正镶白旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2255', '268', '正蓝旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2256', '268', '多伦县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2257', '269', '乌兰浩特市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2258', '269', '阿尔山市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2259', '269', '科尔沁右翼前旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2260', '269', '科尔沁右翼中旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2261', '269', '扎赉特旗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2262', '269', '突泉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2263', '270', '西夏区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2264', '270', '金凤区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2265', '270', '兴庆区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2266', '270', '灵武市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2267', '270', '永宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2268', '270', '贺兰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2269', '271', '原州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2270', '271', '海原县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2271', '271', '西吉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2272', '271', '隆德县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2273', '271', '泾源县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2274', '271', '彭阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2275', '272', '惠农县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2276', '272', '大武口区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2277', '272', '惠农区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2278', '272', '陶乐县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2279', '272', '平罗县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2280', '273', '利通区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2281', '273', '中卫县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2282', '273', '青铜峡市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2283', '273', '中宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2284', '273', '盐池县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2285', '273', '同心县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2286', '274', '沙坡头区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2287', '274', '海原县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2288', '274', '中宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2289', '275', '城中区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2290', '275', '城东区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2291', '275', '城西区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2292', '275', '城北区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2293', '275', '湟中县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2294', '275', '湟源县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2295', '275', '大通', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2296', '276', '玛沁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2297', '276', '班玛县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2298', '276', '甘德县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2299', '276', '达日县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2300', '276', '久治县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2301', '276', '玛多县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2302', '277', '海晏县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2303', '277', '祁连县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2304', '277', '刚察县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2305', '277', '门源', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2306', '278', '平安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2307', '278', '乐都县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2308', '278', '民和', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2309', '278', '互助', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2310', '278', '化隆', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2311', '278', '循化', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2312', '279', '共和县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2313', '279', '同德县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2314', '279', '贵德县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2315', '279', '兴海县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2316', '279', '贵南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2317', '280', '德令哈市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2318', '280', '格尔木市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2319', '280', '乌兰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2320', '280', '都兰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2321', '280', '天峻县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2322', '281', '同仁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2323', '281', '尖扎县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2324', '281', '泽库县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2325', '281', '河南蒙古族自治县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2326', '282', '玉树县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2327', '282', '杂多县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2328', '282', '称多县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2329', '282', '治多县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2330', '282', '囊谦县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2331', '282', '曲麻莱县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2332', '283', '市中区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2333', '283', '历下区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2334', '283', '天桥区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2335', '283', '槐荫区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2336', '283', '历城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2337', '283', '长清区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2338', '283', '章丘市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2339', '283', '平阴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2340', '283', '济阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2341', '283', '商河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2342', '284', '市南区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2343', '284', '市北区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2344', '284', '城阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2345', '284', '四方区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2346', '284', '李沧区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2347', '284', '黄岛区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2348', '284', '崂山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2349', '284', '胶州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2350', '284', '即墨市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2351', '284', '平度市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2352', '284', '胶南市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2353', '284', '莱西市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2354', '285', '滨城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2355', '285', '惠民县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2356', '285', '阳信县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2357', '285', '无棣县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2358', '285', '沾化县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2359', '285', '博兴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2360', '285', '邹平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2361', '286', '德城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2362', '286', '陵县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2363', '286', '乐陵市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2364', '286', '禹城市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2365', '286', '宁津县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2366', '286', '庆云县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2367', '286', '临邑县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2368', '286', '齐河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2369', '286', '平原县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2370', '286', '夏津县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2371', '286', '武城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2372', '287', '东营区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2373', '287', '河口区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2374', '287', '垦利县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2375', '287', '利津县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2376', '287', '广饶县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2377', '288', '牡丹区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2378', '288', '曹县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2379', '288', '单县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2380', '288', '成武县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2381', '288', '巨野县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2382', '288', '郓城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2383', '288', '鄄城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2384', '288', '定陶县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2385', '288', '东明县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2386', '289', '市中区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2387', '289', '任城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2388', '289', '曲阜市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2389', '289', '兖州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2390', '289', '邹城市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2391', '289', '微山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2392', '289', '鱼台县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2393', '289', '金乡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2394', '289', '嘉祥县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2395', '289', '汶上县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2396', '289', '泗水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2397', '289', '梁山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2398', '290', '莱城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2399', '290', '钢城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2400', '291', '东昌府区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2401', '291', '临清市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2402', '291', '阳谷县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2403', '291', '莘县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2404', '291', '茌平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2405', '291', '东阿县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2406', '291', '冠县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2407', '291', '高唐县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2408', '292', '兰山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2409', '292', '罗庄区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2410', '292', '河东区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2411', '292', '沂南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2412', '292', '郯城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2413', '292', '沂水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2414', '292', '苍山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2415', '292', '费县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2416', '292', '平邑县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2417', '292', '莒南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2418', '292', '蒙阴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2419', '292', '临沭县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2420', '293', '东港区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2421', '293', '岚山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2422', '293', '五莲县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2423', '293', '莒县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2424', '294', '泰山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2425', '294', '岱岳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2426', '294', '新泰市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2427', '294', '肥城市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2428', '294', '宁阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2429', '294', '东平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2430', '295', '荣成市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2431', '295', '乳山市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2432', '295', '环翠区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2433', '295', '文登市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2434', '296', '潍城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2435', '296', '寒亭区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2436', '296', '坊子区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2437', '296', '奎文区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2438', '296', '青州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2439', '296', '诸城市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2440', '296', '寿光市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2441', '296', '安丘市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2442', '296', '高密市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2443', '296', '昌邑市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2444', '296', '临朐县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2445', '296', '昌乐县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2446', '297', '芝罘区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2447', '297', '福山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2448', '297', '牟平区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2449', '297', '莱山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2450', '297', '开发区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2451', '297', '龙口市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2452', '297', '莱阳市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2453', '297', '莱州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2454', '297', '蓬莱市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2455', '297', '招远市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2456', '297', '栖霞市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2457', '297', '海阳市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2458', '297', '长岛县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2459', '298', '市中区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2460', '298', '山亭区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2461', '298', '峄城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2462', '298', '台儿庄区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2463', '298', '薛城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2464', '298', '滕州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2465', '299', '张店区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2466', '299', '临淄区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2467', '299', '淄川区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2468', '299', '博山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2469', '299', '周村区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2470', '299', '桓台县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2471', '299', '高青县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2472', '299', '沂源县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2473', '300', '杏花岭区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2474', '300', '小店区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2475', '300', '迎泽区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2476', '300', '尖草坪区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2477', '300', '万柏林区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2478', '300', '晋源区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2479', '300', '高新开发区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2480', '300', '民营经济开发区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2481', '300', '经济技术开发区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2482', '300', '清徐县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2483', '300', '阳曲县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2484', '300', '娄烦县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2485', '300', '古交市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2486', '301', '城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2487', '301', '郊区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2488', '301', '沁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2489', '301', '潞城市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2490', '301', '长治县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2491', '301', '襄垣县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2492', '301', '屯留县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2493', '301', '平顺县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2494', '301', '黎城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2495', '301', '壶关县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2496', '301', '长子县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2497', '301', '武乡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2498', '301', '沁源县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2499', '302', '城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2500', '302', '矿区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2501', '302', '南郊区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2502', '302', '新荣区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2503', '302', '阳高县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2504', '302', '天镇县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2505', '302', '广灵县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2506', '302', '灵丘县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2507', '302', '浑源县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2508', '302', '左云县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2509', '302', '大同县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2510', '303', '城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2511', '303', '高平市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2512', '303', '沁水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2513', '303', '阳城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2514', '303', '陵川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2515', '303', '泽州县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2516', '304', '榆次区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2517', '304', '介休市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2518', '304', '榆社县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2519', '304', '左权县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2520', '304', '和顺县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2521', '304', '昔阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2522', '304', '寿阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2523', '304', '太谷县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2524', '304', '祁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2525', '304', '平遥县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2526', '304', '灵石县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2527', '305', '尧都区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2528', '305', '侯马市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2529', '305', '霍州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2530', '305', '曲沃县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2531', '305', '翼城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2532', '305', '襄汾县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2533', '305', '洪洞县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2534', '305', '吉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2535', '305', '安泽县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2536', '305', '浮山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2537', '305', '古县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2538', '305', '乡宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2539', '305', '大宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2540', '305', '隰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2541', '305', '永和县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2542', '305', '蒲县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2543', '305', '汾西县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2544', '306', '离石市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2545', '306', '离石区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2546', '306', '孝义市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2547', '306', '汾阳市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2548', '306', '文水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2549', '306', '交城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2550', '306', '兴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2551', '306', '临县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2552', '306', '柳林县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2553', '306', '石楼县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2554', '306', '岚县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2555', '306', '方山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2556', '306', '中阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2557', '306', '交口县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2558', '307', '朔城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2559', '307', '平鲁区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2560', '307', '山阴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2561', '307', '应县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2562', '307', '右玉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2563', '307', '怀仁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2564', '308', '忻府区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2565', '308', '原平市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2566', '308', '定襄县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2567', '308', '五台县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2568', '308', '代县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2569', '308', '繁峙县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2570', '308', '宁武县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2571', '308', '静乐县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2572', '308', '神池县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2573', '308', '五寨县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2574', '308', '岢岚县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2575', '308', '河曲县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2576', '308', '保德县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2577', '308', '偏关县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2578', '309', '城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2579', '309', '矿区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2580', '309', '郊区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2581', '309', '平定县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2582', '309', '盂县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2583', '310', '盐湖区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2584', '310', '永济市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2585', '310', '河津市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2586', '310', '临猗县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2587', '310', '万荣县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2588', '310', '闻喜县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2589', '310', '稷山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2590', '310', '新绛县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2591', '310', '绛县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2592', '310', '垣曲县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2593', '310', '夏县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2594', '310', '平陆县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2595', '310', '芮城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2596', '311', '莲湖区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2597', '311', '新城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2598', '311', '碑林区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2599', '311', '雁塔区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2600', '311', '灞桥区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2601', '311', '未央区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2602', '311', '阎良区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2603', '311', '临潼区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2604', '311', '长安区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2605', '311', '蓝田县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2606', '311', '周至县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2607', '311', '户县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2608', '311', '高陵县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2609', '312', '汉滨区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2610', '312', '汉阴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2611', '312', '石泉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2612', '312', '宁陕县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2613', '312', '紫阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2614', '312', '岚皋县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2615', '312', '平利县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2616', '312', '镇坪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2617', '312', '旬阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2618', '312', '白河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2619', '313', '陈仓区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2620', '313', '渭滨区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2621', '313', '金台区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2622', '313', '凤翔县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2623', '313', '岐山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2624', '313', '扶风县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2625', '313', '眉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2626', '313', '陇县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2627', '313', '千阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2628', '313', '麟游县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2629', '313', '凤县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2630', '313', '太白县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2631', '314', '汉台区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2632', '314', '南郑县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2633', '314', '城固县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2634', '314', '洋县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2635', '314', '西乡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2636', '314', '勉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2637', '314', '宁强县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2638', '314', '略阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2639', '314', '镇巴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2640', '314', '留坝县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2641', '314', '佛坪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2642', '315', '商州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2643', '315', '洛南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2644', '315', '丹凤县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2645', '315', '商南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2646', '315', '山阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2647', '315', '镇安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2648', '315', '柞水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2649', '316', '耀州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2650', '316', '王益区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2651', '316', '印台区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2652', '316', '宜君县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2653', '317', '临渭区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2654', '317', '韩城市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2655', '317', '华阴市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2656', '317', '华县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2657', '317', '潼关县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2658', '317', '大荔县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2659', '317', '合阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2660', '317', '澄城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2661', '317', '蒲城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2662', '317', '白水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2663', '317', '富平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2664', '318', '秦都区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2665', '318', '渭城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2666', '318', '杨陵区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2667', '318', '兴平市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2668', '318', '三原县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2669', '318', '泾阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2670', '318', '乾县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2671', '318', '礼泉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2672', '318', '永寿县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2673', '318', '彬县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2674', '318', '长武县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2675', '318', '旬邑县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2676', '318', '淳化县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2677', '318', '武功县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2678', '319', '吴起县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2679', '319', '宝塔区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2680', '319', '延长县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2681', '319', '延川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2682', '319', '子长县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2683', '319', '安塞县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2684', '319', '志丹县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2685', '319', '甘泉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2686', '319', '富县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2687', '319', '洛川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2688', '319', '宜川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2689', '319', '黄龙县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2690', '319', '黄陵县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2691', '320', '榆阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2692', '320', '神木县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2693', '320', '府谷县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2694', '320', '横山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2695', '320', '靖边县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2696', '320', '定边县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2697', '320', '绥德县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2698', '320', '米脂县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2699', '320', '佳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2700', '320', '吴堡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2701', '320', '清涧县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2702', '320', '子洲县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2703', '321', '长宁区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2704', '321', '闸北区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2705', '321', '闵行区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2706', '321', '徐汇区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2707', '321', '浦东新区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2708', '321', '杨浦区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2709', '321', '普陀区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2710', '321', '静安区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2711', '321', '卢湾区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2712', '321', '虹口区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2713', '321', '黄浦区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2714', '321', '南汇区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2715', '321', '松江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2716', '321', '嘉定区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2717', '321', '宝山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2718', '321', '青浦区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2719', '321', '金山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2720', '321', '奉贤区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2721', '321', '崇明县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2722', '322', '青羊区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2723', '322', '锦江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2724', '322', '金牛区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2725', '322', '武侯区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2726', '322', '成华区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2727', '322', '龙泉驿区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2728', '322', '青白江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2729', '322', '新都区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2730', '322', '温江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2731', '322', '高新区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2732', '322', '高新西区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2733', '322', '都江堰市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2734', '322', '彭州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2735', '322', '邛崃市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2736', '322', '崇州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2737', '322', '金堂县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2738', '322', '双流县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2739', '322', '郫县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2740', '322', '大邑县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2741', '322', '蒲江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2742', '322', '新津县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2743', '322', '都江堰市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2744', '322', '彭州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2745', '322', '邛崃市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2746', '322', '崇州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2747', '322', '金堂县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2748', '322', '双流县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2749', '322', '郫县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2750', '322', '大邑县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2751', '322', '蒲江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2752', '322', '新津县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2753', '323', '涪城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2754', '323', '游仙区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2755', '323', '江油市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2756', '323', '盐亭县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2757', '323', '三台县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2758', '323', '平武县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2759', '323', '安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2760', '323', '梓潼县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2761', '323', '北川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2762', '324', '马尔康县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2763', '324', '汶川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2764', '324', '理县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2765', '324', '茂县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2766', '324', '松潘县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2767', '324', '九寨沟县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2768', '324', '金川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2769', '324', '小金县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2770', '324', '黑水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2771', '324', '壤塘县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2772', '324', '阿坝县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2773', '324', '若尔盖县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2774', '324', '红原县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2775', '325', '巴州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2776', '325', '通江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2777', '325', '南江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2778', '325', '平昌县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2779', '326', '通川区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2780', '326', '万源市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2781', '326', '达县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2782', '326', '宣汉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2783', '326', '开江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2784', '326', '大竹县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2785', '326', '渠县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2786', '327', '旌阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2787', '327', '广汉市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2788', '327', '什邡市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2789', '327', '绵竹市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2790', '327', '罗江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2791', '327', '中江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2792', '328', '康定县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2793', '328', '丹巴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2794', '328', '泸定县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2795', '328', '炉霍县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2796', '328', '九龙县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2797', '328', '甘孜县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2798', '328', '雅江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2799', '328', '新龙县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2800', '328', '道孚县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2801', '328', '白玉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2802', '328', '理塘县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2803', '328', '德格县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2804', '328', '乡城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2805', '328', '石渠县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2806', '328', '稻城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2807', '328', '色达县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2808', '328', '巴塘县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2809', '328', '得荣县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2810', '329', '广安区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2811', '329', '华蓥市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2812', '329', '岳池县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2813', '329', '武胜县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2814', '329', '邻水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2815', '330', '利州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2816', '330', '元坝区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2817', '330', '朝天区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2818', '330', '旺苍县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2819', '330', '青川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2820', '330', '剑阁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2821', '330', '苍溪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2822', '331', '峨眉山市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2823', '331', '乐山市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2824', '331', '犍为县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2825', '331', '井研县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2826', '331', '夹江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2827', '331', '沐川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2828', '331', '峨边', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2829', '331', '马边', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2830', '332', '西昌市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2831', '332', '盐源县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2832', '332', '德昌县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2833', '332', '会理县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2834', '332', '会东县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2835', '332', '宁南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2836', '332', '普格县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2837', '332', '布拖县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2838', '332', '金阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2839', '332', '昭觉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2840', '332', '喜德县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2841', '332', '冕宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2842', '332', '越西县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2843', '332', '甘洛县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2844', '332', '美姑县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2845', '332', '雷波县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2846', '332', '木里', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2847', '333', '东坡区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2848', '333', '仁寿县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2849', '333', '彭山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2850', '333', '洪雅县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2851', '333', '丹棱县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2852', '333', '青神县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2853', '334', '阆中市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2854', '334', '南部县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2855', '334', '营山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2856', '334', '蓬安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2857', '334', '仪陇县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2858', '334', '顺庆区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2859', '334', '高坪区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2860', '334', '嘉陵区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2861', '334', '西充县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2862', '335', '市中区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2863', '335', '东兴区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2864', '335', '威远县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2865', '335', '资中县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2866', '335', '隆昌县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2867', '336', '东  区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2868', '336', '西  区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2869', '336', '仁和区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2870', '336', '米易县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2871', '336', '盐边县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2872', '337', '船山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2873', '337', '安居区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2874', '337', '蓬溪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2875', '337', '射洪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2876', '337', '大英县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2877', '338', '雨城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2878', '338', '名山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2879', '338', '荥经县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2880', '338', '汉源县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2881', '338', '石棉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2882', '338', '天全县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2883', '338', '芦山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2884', '338', '宝兴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2885', '339', '翠屏区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2886', '339', '宜宾县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2887', '339', '南溪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2888', '339', '江安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2889', '339', '长宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2890', '339', '高县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2891', '339', '珙县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2892', '339', '筠连县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2893', '339', '兴文县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2894', '339', '屏山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2895', '340', '雁江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2896', '340', '简阳市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2897', '340', '安岳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2898', '340', '乐至县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2899', '341', '大安区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2900', '341', '自流井区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2901', '341', '贡井区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2902', '341', '沿滩区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2903', '341', '荣县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2904', '341', '富顺县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2905', '342', '江阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2906', '342', '纳溪区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2907', '342', '龙马潭区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2908', '342', '泸县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2909', '342', '合江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2910', '342', '叙永县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2911', '342', '古蔺县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2912', '343', '和平区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2913', '343', '河西区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2914', '343', '南开区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2915', '343', '河北区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2916', '343', '河东区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2917', '343', '红桥区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2918', '343', '东丽区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2919', '343', '津南区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2920', '343', '西青区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2921', '343', '北辰区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2922', '343', '塘沽区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2923', '343', '汉沽区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2924', '343', '大港区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2925', '343', '武清区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2926', '343', '宝坻区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2927', '343', '经济开发区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2928', '343', '宁河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2929', '343', '静海县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2930', '343', '蓟县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2931', '344', '城关区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2932', '344', '林周县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2933', '344', '当雄县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2934', '344', '尼木县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2935', '344', '曲水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2936', '344', '堆龙德庆县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2937', '344', '达孜县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2938', '344', '墨竹工卡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2939', '345', '噶尔县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2940', '345', '普兰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2941', '345', '札达县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2942', '345', '日土县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2943', '345', '革吉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2944', '345', '改则县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2945', '345', '措勤县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2946', '346', '昌都县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2947', '346', '江达县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2948', '346', '贡觉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2949', '346', '类乌齐县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2950', '346', '丁青县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2951', '346', '察雅县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2952', '346', '八宿县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2953', '346', '左贡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2954', '346', '芒康县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2955', '346', '洛隆县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2956', '346', '边坝县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2957', '347', '林芝县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2958', '347', '工布江达县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2959', '347', '米林县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2960', '347', '墨脱县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2961', '347', '波密县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2962', '347', '察隅县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2963', '347', '朗县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2964', '348', '那曲县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2965', '348', '嘉黎县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2966', '348', '比如县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2967', '348', '聂荣县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2968', '348', '安多县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2969', '348', '申扎县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2970', '348', '索县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2971', '348', '班戈县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2972', '348', '巴青县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2973', '348', '尼玛县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2974', '349', '日喀则市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2975', '349', '南木林县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2976', '349', '江孜县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2977', '349', '定日县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2978', '349', '萨迦县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2979', '349', '拉孜县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2980', '349', '昂仁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2981', '349', '谢通门县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2982', '349', '白朗县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2983', '349', '仁布县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2984', '349', '康马县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2985', '349', '定结县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2986', '349', '仲巴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2987', '349', '亚东县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2988', '349', '吉隆县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2989', '349', '聂拉木县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2990', '349', '萨嘎县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2991', '349', '岗巴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2992', '350', '乃东县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2993', '350', '扎囊县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2994', '350', '贡嘎县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2995', '350', '桑日县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2996', '350', '琼结县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2997', '350', '曲松县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2998', '350', '措美县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('2999', '350', '洛扎县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3000', '350', '加查县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3001', '350', '隆子县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3002', '350', '错那县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3003', '350', '浪卡子县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3004', '351', '天山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3005', '351', '沙依巴克区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3006', '351', '新市区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3007', '351', '水磨沟区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3008', '351', '头屯河区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3009', '351', '达坂城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3010', '351', '米东区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3011', '351', '乌鲁木齐县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3012', '352', '阿克苏市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3013', '352', '温宿县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3014', '352', '库车县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3015', '352', '沙雅县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3016', '352', '新和县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3017', '352', '拜城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3018', '352', '乌什县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3019', '352', '阿瓦提县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3020', '352', '柯坪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3021', '353', '阿拉尔市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3022', '354', '库尔勒市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3023', '354', '轮台县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3024', '354', '尉犁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3025', '354', '若羌县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3026', '354', '且末县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3027', '354', '焉耆', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3028', '354', '和静县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3029', '354', '和硕县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3030', '354', '博湖县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3031', '355', '博乐市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3032', '355', '精河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3033', '355', '温泉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3034', '356', '呼图壁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3035', '356', '米泉市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3036', '356', '昌吉市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3037', '356', '阜康市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3038', '356', '玛纳斯县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3039', '356', '奇台县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3040', '356', '吉木萨尔县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3041', '356', '木垒', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3042', '357', '哈密市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3043', '357', '伊吾县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3044', '357', '巴里坤', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3045', '358', '和田市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3046', '358', '和田县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3047', '358', '墨玉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3048', '358', '皮山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3049', '358', '洛浦县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3050', '358', '策勒县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3051', '358', '于田县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3052', '358', '民丰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3053', '359', '喀什市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3054', '359', '疏附县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3055', '359', '疏勒县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3056', '359', '英吉沙县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3057', '359', '泽普县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3058', '359', '莎车县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3059', '359', '叶城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3060', '359', '麦盖提县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3061', '359', '岳普湖县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3062', '359', '伽师县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3063', '359', '巴楚县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3064', '359', '塔什库尔干', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3065', '360', '克拉玛依市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3066', '361', '阿图什市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3067', '361', '阿克陶县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3068', '361', '阿合奇县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3069', '361', '乌恰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3070', '362', '石河子市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3071', '363', '图木舒克市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3072', '364', '吐鲁番市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3073', '364', '鄯善县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3074', '364', '托克逊县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3075', '365', '五家渠市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3076', '366', '阿勒泰市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3077', '366', '布克赛尔', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3078', '366', '伊宁市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3079', '366', '布尔津县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3080', '366', '奎屯市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3081', '366', '乌苏市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3082', '366', '额敏县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3083', '366', '富蕴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3084', '366', '伊宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3085', '366', '福海县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3086', '366', '霍城县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3087', '366', '沙湾县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3088', '366', '巩留县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3089', '366', '哈巴河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3090', '366', '托里县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3091', '366', '青河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3092', '366', '新源县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3093', '366', '裕民县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3094', '366', '和布克赛尔', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3095', '366', '吉木乃县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3096', '366', '昭苏县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3097', '366', '特克斯县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3098', '366', '尼勒克县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3099', '366', '察布查尔', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3100', '367', '盘龙区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3101', '367', '五华区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3102', '367', '官渡区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3103', '367', '西山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3104', '367', '东川区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3105', '367', '安宁市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3106', '367', '呈贡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3107', '367', '晋宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3108', '367', '富民县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3109', '367', '宜良县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3110', '367', '嵩明县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3111', '367', '石林县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3112', '367', '禄劝', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3113', '367', '寻甸', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3114', '368', '兰坪', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3115', '368', '泸水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3116', '368', '福贡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3117', '368', '贡山', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3118', '369', '宁洱', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3119', '369', '思茅区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3120', '369', '墨江', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3121', '369', '景东', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3122', '369', '景谷', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3123', '369', '镇沅', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3124', '369', '江城', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3125', '369', '孟连', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3126', '369', '澜沧', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3127', '369', '西盟', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3128', '370', '古城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3129', '370', '宁蒗', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3130', '370', '玉龙', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3131', '370', '永胜县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3132', '370', '华坪县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3133', '371', '隆阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3134', '371', '施甸县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3135', '371', '腾冲县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3136', '371', '龙陵县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3137', '371', '昌宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3138', '372', '楚雄市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3139', '372', '双柏县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3140', '372', '牟定县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3141', '372', '南华县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3142', '372', '姚安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3143', '372', '大姚县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3144', '372', '永仁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3145', '372', '元谋县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3146', '372', '武定县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3147', '372', '禄丰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3148', '373', '大理市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3149', '373', '祥云县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3150', '373', '宾川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3151', '373', '弥渡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3152', '373', '永平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3153', '373', '云龙县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3154', '373', '洱源县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3155', '373', '剑川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3156', '373', '鹤庆县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3157', '373', '漾濞', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3158', '373', '南涧', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3159', '373', '巍山', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3160', '374', '潞西市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3161', '374', '瑞丽市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3162', '374', '梁河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3163', '374', '盈江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3164', '374', '陇川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3165', '375', '香格里拉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3166', '375', '德钦县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3167', '375', '维西', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3168', '376', '泸西县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3169', '376', '蒙自县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3170', '376', '个旧市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3171', '376', '开远市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3172', '376', '绿春县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3173', '376', '建水县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3174', '376', '石屏县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3175', '376', '弥勒县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3176', '376', '元阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3177', '376', '红河县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3178', '376', '金平', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3179', '376', '河口', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3180', '376', '屏边', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3181', '377', '临翔区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3182', '377', '凤庆县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3183', '377', '云县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3184', '377', '永德县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3185', '377', '镇康县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3186', '377', '双江', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3187', '377', '耿马', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3188', '377', '沧源', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3189', '378', '麒麟区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3190', '378', '宣威市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3191', '378', '马龙县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3192', '378', '陆良县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3193', '378', '师宗县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3194', '378', '罗平县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3195', '378', '富源县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3196', '378', '会泽县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3197', '378', '沾益县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3198', '379', '文山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3199', '379', '砚山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3200', '379', '西畴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3201', '379', '麻栗坡县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3202', '379', '马关县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3203', '379', '丘北县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3204', '379', '广南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3205', '379', '富宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3206', '380', '景洪市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3207', '380', '勐海县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3208', '380', '勐腊县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3209', '381', '红塔区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3210', '381', '江川县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3211', '381', '澄江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3212', '381', '通海县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3213', '381', '华宁县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3214', '381', '易门县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3215', '381', '峨山', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3216', '381', '新平', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3217', '381', '元江', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3218', '382', '昭阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3219', '382', '鲁甸县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3220', '382', '巧家县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3221', '382', '盐津县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3222', '382', '大关县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3223', '382', '永善县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3224', '382', '绥江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3225', '382', '镇雄县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3226', '382', '彝良县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3227', '382', '威信县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3228', '382', '水富县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3229', '383', '西湖区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3230', '383', '上城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3231', '383', '下城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3232', '383', '拱墅区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3233', '383', '滨江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3234', '383', '江干区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3235', '383', '萧山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3236', '383', '余杭区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3237', '383', '市郊', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3238', '383', '建德市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3239', '383', '富阳市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3240', '383', '临安市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3241', '383', '桐庐县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3242', '383', '淳安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3243', '384', '吴兴区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3244', '384', '南浔区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3245', '384', '德清县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3246', '384', '长兴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3247', '384', '安吉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3248', '385', '南湖区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3249', '385', '秀洲区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3250', '385', '海宁市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3251', '385', '嘉善县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3252', '385', '平湖市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3253', '385', '桐乡市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3254', '385', '海盐县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3255', '386', '婺城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3256', '386', '金东区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3257', '386', '兰溪市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3258', '386', '市区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3259', '386', '佛堂镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3260', '386', '上溪镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3261', '386', '义亭镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3262', '386', '大陈镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3263', '386', '苏溪镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3264', '386', '赤岸镇', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3265', '386', '东阳市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3266', '386', '永康市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3267', '386', '武义县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3268', '386', '浦江县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3269', '386', '磐安县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3270', '387', '莲都区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3271', '387', '龙泉市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3272', '387', '青田县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3273', '387', '缙云县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3274', '387', '遂昌县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3275', '387', '松阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3276', '387', '云和县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3277', '387', '庆元县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3278', '387', '景宁', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3279', '388', '海曙区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3280', '388', '江东区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3281', '388', '江北区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3282', '388', '镇海区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3283', '388', '北仑区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3284', '388', '鄞州区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3285', '388', '余姚市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3286', '388', '慈溪市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3287', '388', '奉化市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3288', '388', '象山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3289', '388', '宁海县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3290', '389', '越城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3291', '389', '上虞市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3292', '389', '嵊州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3293', '389', '绍兴县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3294', '389', '新昌县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3295', '389', '诸暨市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3296', '390', '椒江区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3297', '390', '黄岩区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3298', '390', '路桥区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3299', '390', '温岭市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3300', '390', '临海市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3301', '390', '玉环县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3302', '390', '三门县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3303', '390', '天台县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3304', '390', '仙居县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3305', '391', '鹿城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3306', '391', '龙湾区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3307', '391', '瓯海区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3308', '391', '瑞安市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3309', '391', '乐清市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3310', '391', '洞头县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3311', '391', '永嘉县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3312', '391', '平阳县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3313', '391', '苍南县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3314', '391', '文成县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3315', '391', '泰顺县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3316', '392', '定海区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3317', '392', '普陀区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3318', '392', '岱山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3319', '392', '嵊泗县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3320', '393', '衢州市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3321', '393', '江山市', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3322', '393', '常山县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3323', '393', '开化县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3324', '393', '龙游县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3325', '394', '合川区', '3', '13', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3326', '394', '江津区', '3', '14', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3327', '394', '南川区', '3', '15', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3328', '394', '永川区', '3', '16', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3329', '394', '南岸区', '3', '1', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3330', '394', '渝北区', '3', '6', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3331', '394', '万盛区', '3', '40', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3332', '394', '大渡口区', '3', '8', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3333', '394', '万州区', '3', '17', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3334', '394', '北碚区', '3', '9', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3335', '394', '沙坪坝区', '3', '5', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3336', '394', '巴南区', '3', '7', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3337', '394', '涪陵区', '3', '11', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3338', '394', '江北区', '3', '3', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3339', '394', '九龙坡区', '3', '4', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3340', '394', '渝中区', '3', '2', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3341', '394', '黔江区', '3', '18', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3342', '394', '长寿区', '3', '12', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3343', '394', '双桥区', '3', '39', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3344', '394', '綦江县', '3', '21', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3345', '394', '潼南县', '3', '20', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3346', '394', '铜梁县', '3', '23', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3347', '394', '大足县', '3', '24', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3348', '394', '荣昌县', '3', '25', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3349', '394', '璧山县', '3', '10', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3350', '394', '垫江县', '3', '22', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3351', '394', '武隆县', '3', '19', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3352', '394', '丰都县', '3', '27', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3353', '394', '城口县', '3', '38', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3354', '394', '梁平县', '3', '37', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3355', '394', '开县', '3', '26', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3356', '394', '巫溪县', '3', '36', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3357', '394', '巫山县', '3', '35', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3358', '394', '奉节县', '3', '34', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3359', '394', '云阳县', '3', '33', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3360', '394', '忠县', '3', '30', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3361', '394', '石柱', '3', '28', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3362', '394', '彭水', '3', '29', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3363', '394', '酉阳', '3', '32', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3364', '394', '秀山', '3', '31', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3365', '395', '沙田区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3366', '395', '东区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3367', '395', '观塘区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3368', '395', '黄大仙区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3369', '395', '九龙城区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3370', '395', '屯门区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3371', '395', '葵青区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3372', '395', '元朗区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3373', '395', '深水', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3374', '395', '西贡区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3375', '395', '大埔区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3376', '395', '湾仔区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3377', '395', '油尖旺区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3378', '395', '北区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3379', '395', '南区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3380', '395', '荃湾区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3381', '395', '中西区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3382', '395', '离岛区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3383', '396', '澳门', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3384', '397', '台北', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3385', '397', '高雄', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3386', '397', '基隆', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3387', '397', '台中', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3388', '397', '台南', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3389', '397', '新竹', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3390', '397', '嘉义', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3391', '397', '宜兰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3392', '397', '桃园县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3393', '397', '苗栗县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3394', '397', '彰化县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3395', '397', '南投县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3396', '397', '云林县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3397', '397', '屏东县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3398', '397', '台东县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3399', '397', '花莲县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3400', '397', '澎湖县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3401', '3', '合肥', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3402', '3401', '庐阳区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3403', '3401', '瑶海区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3404', '3401', '蜀山区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3405', '3401', '包河区', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3406', '3401', '长丰县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3407', '3401', '肥东县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3408', '3401', '肥西县', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3428', '50000', '未知', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3411', '3410', '吉隆坡', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3412', '3410', '纳闽', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3413', '3410', '布特拉再也', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3414', '3410', '柔佛', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3415', '3410', '吉打', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3416', '3410', '吉兰丹', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3417', '3410', '马六甲', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3418', '3410', '森美兰', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3419', '3410', '彭亨', '3', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3420', '3410', '槟城', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3421', '3410', '霹雳', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3422', '3410', '玻璃市', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3423', '3410', '雪兰莪', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3425', '3410', '登嘉楼', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3426', '3410', '沙巴', '2', '99', '1488782754', '1488782754');
INSERT INTO `fc_regions` VALUES ('3427', '3410', '砂拉越', '2', '99', '1488782754', '1488782754');

-- ----------------------------
-- Table structure for fc_sellcars
-- ----------------------------
DROP TABLE IF EXISTS `fc_sellcars`;
CREATE TABLE `fc_sellcars` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(30) NOT NULL DEFAULT '' COMMENT '联系电话',
  `province_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所在省份',
  `city_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所在市区',
  `area_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所在区县',
  `brand_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `serie_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '车系id',
  `model_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '型号id',
  `displacement` varchar(30) NOT NULL DEFAULT '' COMMENT '排量（升）',
  `mileage` varchar(10) NOT NULL DEFAULT '' COMMENT '行驶里程（万公里）',
  `plate_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上牌时间',
  `imgs` text NOT NULL COMMENT '车辆照片',
  `submit_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '提交时间',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='个人卖车信息';

-- ----------------------------
-- Records of fc_sellcars
-- ----------------------------
INSERT INTO `fc_sellcars` VALUES ('1', '18353621562', '19', '266', '2232', '0', '0', '0', '2.2', '2.0', '1527078997', 'https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500', '1527078997', '1527078997');
INSERT INTO `fc_sellcars` VALUES ('2', '18353622262', '19', '266', '2232', '0', '0', '0', '2.2', '1.2', '1527078997', 'https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500', '1527078997', '1527078997');
INSERT INTO `fc_sellcars` VALUES ('3', '18353621562', '19', '266', '2232', '0', '0', '0', '2.2', '1.5', '1527078997', 'https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500', '1527078997', '1527078997');
INSERT INTO `fc_sellcars` VALUES ('4', '18353622262', '19', '266', '2232', '0', '0', '0', '2.2', '5.6', '1527078997', 'https://a.suiship.com/cQ2V52718BfXdybYIFBWKBW3SRpxuSJ8SR8W08ZkFv9YkHQnA40KH4zoSQjwbLto.jpg?imageView2/2/w/500,https://a.suiship.com/NKc1tglN0WphL91aPr7PQLNWV7WRON4XWm8mAxJkRwqmhO9jG52POkPwXn7PIa3c.jpg?imageView2/2/w/500', '1527078997', '1527078997');

-- ----------------------------
-- Table structure for fc_users
-- ----------------------------
DROP TABLE IF EXISTS `fc_users`;
CREATE TABLE `fc_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `register_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of fc_users
-- ----------------------------
INSERT INTO `fc_users` VALUES ('1', '18353621790', '1476065410', '1476065410');
INSERT INTO `fc_users` VALUES ('2', '1835621562', '1476085410', '1476065410');
INSERT INTO `fc_users` VALUES ('3', '18353621790', '1476065410', '1476065410');
INSERT INTO `fc_users` VALUES ('4', '1835621562', '1476085410', '1476065410');
INSERT INTO `fc_users` VALUES ('5', '18353621790', '1476065410', '1476065410');
INSERT INTO `fc_users` VALUES ('6', '1835621562', '1476085410', '1476065410');
INSERT INTO `fc_users` VALUES ('7', '18353621790', '1476065410', '1476065410');
INSERT INTO `fc_users` VALUES ('8', '1835621562', '1476085410', '1476065410');
INSERT INTO `fc_users` VALUES ('9', '18353621790', '1476065410', '1476065410');
INSERT INTO `fc_users` VALUES ('10', '1835621562', '1476085410', '1476065410');
INSERT INTO `fc_users` VALUES ('11', '18353621790', '1476065410', '1476065410');
INSERT INTO `fc_users` VALUES ('12', '1835621562', '1476085410', '1476065410');
INSERT INTO `fc_users` VALUES ('13', '18353621790', '1476065410', '1476065410');
INSERT INTO `fc_users` VALUES ('14', '1835621562', '1476085410', '1476065410');
INSERT INTO `fc_users` VALUES ('15', '18353621790', '1476065410', '1476065410');
INSERT INTO `fc_users` VALUES ('16', '1835621562', '1476085410', '1476065410');
