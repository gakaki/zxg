/*
SQLyog Ultimate v9.20 
MySQL - 5.5.19 : Database - phpcmsv9
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`phpcmsv9` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `phpcmsv9`;

/*Table structure for table `v9_admin` */

DROP TABLE IF EXISTS `v9_admin`;

CREATE TABLE `v9_admin` (
  `userid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `roleid` smallint(5) DEFAULT '0',
  `encrypt` varchar(6) DEFAULT NULL,
  `lastloginip` varchar(15) DEFAULT NULL,
  `lastlogintime` int(10) unsigned DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `card` varchar(255) NOT NULL,
  `lang` varchar(6) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `v9_admin` */

insert  into `v9_admin`(`userid`,`username`,`password`,`roleid`,`encrypt`,`lastloginip`,`lastlogintime`,`email`,`realname`,`card`,`lang`) values (1,'admin','88be2c8ac78fb8ba2cc9e8b18fae34d8',1,'UdBhyl','',0,'admin@admin.com','','','');

/*Table structure for table `v9_admin_panel` */

DROP TABLE IF EXISTS `v9_admin_panel`;

CREATE TABLE `v9_admin_panel` (
  `menuid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(32) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  `datetime` int(10) unsigned DEFAULT '0',
  UNIQUE KEY `userid` (`menuid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_admin_panel` */

/*Table structure for table `v9_admin_role` */

DROP TABLE IF EXISTS `v9_admin_role`;

CREATE TABLE `v9_admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  KEY `listorder` (`listorder`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `v9_admin_role` */

insert  into `v9_admin_role`(`roleid`,`rolename`,`description`,`listorder`,`disabled`) values (1,'超级管理员','超级管理员',0,0),(2,'站点管理员','站点管理员',0,0),(3,'运营总监','运营总监',1,0),(4,'总编','总编',5,0),(5,'编辑','编辑',1,0),(7,'发布人员','发布人员',0,0);

/*Table structure for table `v9_admin_role_priv` */

DROP TABLE IF EXISTS `v9_admin_role_priv`;

CREATE TABLE `v9_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(30) NOT NULL DEFAULT '',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `roleid` (`roleid`,`m`,`c`,`a`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_admin_role_priv` */

/*Table structure for table `v9_attachment` */

DROP TABLE IF EXISTS `v9_attachment`;

CREATE TABLE `v9_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filename` char(50) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uploadip` char(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `authcode` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `authcode` (`authcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_attachment` */

/*Table structure for table `v9_attachment_index` */

DROP TABLE IF EXISTS `v9_attachment_index`;

CREATE TABLE `v9_attachment_index` (
  `keyid` char(30) NOT NULL,
  `aid` char(10) NOT NULL,
  KEY `keyid` (`keyid`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_attachment_index` */

/*Table structure for table `v9_badword` */

DROP TABLE IF EXISTS `v9_badword`;

CREATE TABLE `v9_badword` (
  `badid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `badword` char(20) NOT NULL,
  `level` tinyint(5) NOT NULL DEFAULT '1',
  `replaceword` char(20) NOT NULL DEFAULT '0',
  `lastusetime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`badid`),
  UNIQUE KEY `badword` (`badword`),
  KEY `usetimes` (`replaceword`,`listorder`),
  KEY `hits` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_badword` */

/*Table structure for table `v9_block` */

DROP TABLE IF EXISTS `v9_block`;

CREATE TABLE `v9_block` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `name` char(50) DEFAULT NULL,
  `pos` char(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `data` text,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `pos` (`pos`),
  KEY `type` (`type`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_block` */

/*Table structure for table `v9_block_history` */

DROP TABLE IF EXISTS `v9_block_history`;

CREATE TABLE `v9_block_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blockid` int(10) unsigned DEFAULT '0',
  `data` text,
  `creat_at` int(10) unsigned DEFAULT '0',
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_block_history` */

/*Table structure for table `v9_block_priv` */

DROP TABLE IF EXISTS `v9_block_priv`;

CREATE TABLE `v9_block_priv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `siteid` smallint(5) unsigned DEFAULT '0',
  `blockid` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `blockid` (`blockid`),
  KEY `roleid` (`roleid`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_block_priv` */

/*Table structure for table `v9_cache` */

DROP TABLE IF EXISTS `v9_cache`;

CREATE TABLE `v9_cache` (
  `filename` char(50) NOT NULL,
  `path` char(50) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`filename`,`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_cache` */

/*Table structure for table `v9_category` */

DROP TABLE IF EXISTS `v9_category`;

CREATE TABLE `v9_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext NOT NULL,
  `catname` varchar(30) NOT NULL,
  `style` varchar(5) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `parentdir` varchar(100) NOT NULL,
  `catdir` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sethtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter` varchar(30) NOT NULL,
  `usable_type` varchar(255) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `module` (`module`,`parentid`,`listorder`,`catid`),
  KEY `siteid` (`siteid`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `v9_category` */

insert  into `v9_category`(`catid`,`siteid`,`module`,`type`,`modelid`,`parentid`,`arrparentid`,`child`,`arrchildid`,`catname`,`style`,`image`,`description`,`parentdir`,`catdir`,`url`,`items`,`hits`,`setting`,`listorder`,`ismenu`,`sethtml`,`letter`,`usable_type`) values (1,1,'content',1,0,0,'0',1,'1,2,3,5,162','网站介绍','','','','','about','/html/about/',0,0,'array (\n  \'ishtml\' => \'1\',\n  \'template_list\' => \'default\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'1\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)',1,0,0,'wangzhanjieshao',''),(2,1,'content',1,0,1,'0,1',0,'2','关于我们','','','','about/','aboutus','/html/about/aboutus/',0,0,'array (\n  \'ishtml\' => \'1\',\n  \'template_list\' => \'default\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'关于我们\',\n  \'meta_keywords\' => \'关于我们\',\n  \'meta_description\' => \'关于我们\',\n  \'category_ruleid\' => \'1\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)',1,1,0,'guanyuwomen',''),(3,1,'content',1,0,1,'0,1',0,'3','联系方式','','','','about/','contactus','/html/about/contactus/',0,0,'array (\n  \'ishtml\' => \'1\',\n  \'template_list\' => \'default\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'联系方式\',\n  \'meta_keywords\' => \'联系方式\',\n  \'meta_description\' => \'联系方式\',\n  \'category_ruleid\' => \'1\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)',2,1,0,'lianxifangshi',''),(4,1,'content',1,0,1,'0,1',0,'4','版权声明','','','','about/','copyright','http://test.phpcms.cn/index.php?m=content&c=index&a=lists&catid=4',0,0,'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'default\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'版权声明\',\n  \'meta_keywords\' => \'版权声明\',\n  \'meta_description\' => \'版权声明\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)',3,1,0,'banquanshengming',''),(5,1,'content',1,0,1,'0,1',0,'5','招聘信息','','','','about/','hr','/html/about/hr/',0,0,'array (\n  \'ishtml\' => \'1\',\n  \'template_list\' => \'default\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'1\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)',4,1,0,'zhaopinxinxi','');

/*Table structure for table `v9_category_priv` */

DROP TABLE IF EXISTS `v9_category_priv`;

CREATE TABLE `v9_category_priv` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_category_priv` */

/*Table structure for table `v9_collection_content` */

DROP TABLE IF EXISTS `v9_collection_content`;

CREATE TABLE `v9_collection_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL,
  `title` char(100) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nodeid` (`nodeid`,`siteid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_collection_content` */

/*Table structure for table `v9_collection_history` */

DROP TABLE IF EXISTS `v9_collection_history`;

CREATE TABLE `v9_collection_history` (
  `md5` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_collection_history` */

/*Table structure for table `v9_collection_node` */

DROP TABLE IF EXISTS `v9_collection_node`;

CREATE TABLE `v9_collection_node` (
  `nodeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sourcecharset` varchar(8) NOT NULL,
  `sourcetype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlpage` text NOT NULL,
  `pagesize_start` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pagesize_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `page_base` char(255) NOT NULL,
  `par_num` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `url_contain` char(100) NOT NULL,
  `url_except` char(100) NOT NULL,
  `url_start` char(100) NOT NULL DEFAULT '',
  `url_end` char(100) NOT NULL DEFAULT '',
  `title_rule` char(100) NOT NULL,
  `title_html_rule` text NOT NULL,
  `author_rule` char(100) NOT NULL,
  `author_html_rule` text NOT NULL,
  `comeform_rule` char(100) NOT NULL,
  `comeform_html_rule` text NOT NULL,
  `time_rule` char(100) NOT NULL,
  `time_html_rule` text NOT NULL,
  `content_rule` char(100) NOT NULL,
  `content_html_rule` text NOT NULL,
  `content_page_start` char(100) NOT NULL,
  `content_page_end` char(100) NOT NULL,
  `content_page_rule` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_page` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_nextpage` char(100) NOT NULL,
  `down_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `watermark` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `coll_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `customize_config` text NOT NULL,
  PRIMARY KEY (`nodeid`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_collection_node` */

/*Table structure for table `v9_collection_program` */

DROP TABLE IF EXISTS `v9_collection_program`;

CREATE TABLE `v9_collection_program` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `nodeid` (`nodeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_collection_program` */

/*Table structure for table `v9_content_check` */

DROP TABLE IF EXISTS `v9_content_check`;

CREATE TABLE `v9_content_check` (
  `checkid` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `username` (`username`),
  KEY `checkid` (`checkid`),
  KEY `status` (`status`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_content_check` */

/*Table structure for table `v9_copyfrom` */

DROP TABLE IF EXISTS `v9_copyfrom`;

CREATE TABLE `v9_copyfrom` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sitename` varchar(30) NOT NULL,
  `siteurl` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_copyfrom` */

/*Table structure for table `v9_datacall` */

DROP TABLE IF EXISTS `v9_datacall`;

CREATE TABLE `v9_datacall` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(40) DEFAULT NULL,
  `dis_type` tinyint(1) unsigned DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `action` char(20) DEFAULT NULL,
  `data` text,
  `template` text,
  `cache` mediumint(8) DEFAULT NULL,
  `num` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_datacall` */

/*Table structure for table `v9_dbsource` */

DROP TABLE IF EXISTS `v9_dbsource`;

CREATE TABLE `v9_dbsource` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `host` varchar(20) NOT NULL,
  `port` int(5) NOT NULL DEFAULT '3306',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dbname` varchar(50) NOT NULL,
  `dbtablepre` varchar(30) NOT NULL,
  `charset` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_dbsource` */

/*Table structure for table `v9_download` */

DROP TABLE IF EXISTS `v9_download`;

CREATE TABLE `v9_download` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `systems` varchar(100) NOT NULL DEFAULT 'Win2000/WinXP/Win2003',
  `copytype` varchar(15) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `classtype` varchar(20) NOT NULL DEFAULT '',
  `version` varchar(20) NOT NULL DEFAULT '',
  `filesize` varchar(10) NOT NULL DEFAULT 'Unkown',
  `stars` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_download` */

/*Table structure for table `v9_download_data` */

DROP TABLE IF EXISTS `v9_download_data`;

CREATE TABLE `v9_download_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `downfiles` mediumtext NOT NULL,
  `downfile` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_download_data` */

/*Table structure for table `v9_downservers` */

DROP TABLE IF EXISTS `v9_downservers`;

CREATE TABLE `v9_downservers` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) DEFAULT NULL,
  `siteurl` varchar(255) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_downservers` */

/*Table structure for table `v9_extend_setting` */

DROP TABLE IF EXISTS `v9_extend_setting`;

CREATE TABLE `v9_extend_setting` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `key` char(30) NOT NULL,
  `data` mediumtext,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_extend_setting` */

/*Table structure for table `v9_favorite` */

DROP TABLE IF EXISTS `v9_favorite`;

CREATE TABLE `v9_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `adddate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_favorite` */

/*Table structure for table `v9_hits` */

DROP TABLE IF EXISTS `v9_hits`;

CREATE TABLE `v9_hits` (
  `hitsid` char(30) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `dayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `weekviews` int(10) unsigned NOT NULL DEFAULT '0',
  `monthviews` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hitsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_hits` */

/*Table structure for table `v9_ipbanned` */

DROP TABLE IF EXISTS `v9_ipbanned`;

CREATE TABLE `v9_ipbanned` (
  `ipbannedid` smallint(5) NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL,
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ipbannedid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_ipbanned` */

/*Table structure for table `v9_keylink` */

DROP TABLE IF EXISTS `v9_keylink`;

CREATE TABLE `v9_keylink` (
  `keylinkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `word` char(40) NOT NULL,
  `url` char(100) NOT NULL,
  PRIMARY KEY (`keylinkid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_keylink` */

/*Table structure for table `v9_linkage` */

DROP TABLE IF EXISTS `v9_linkage`;

CREATE TABLE `v9_linkage` (
  `linkageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `child` tinyint(1) NOT NULL,
  `arrchildid` mediumtext NOT NULL,
  `keyid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkageid`,`keyid`),
  KEY `parentid` (`parentid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=3360 DEFAULT CHARSET=utf8;

/*Data for the table `v9_linkage` */

insert  into `v9_linkage`(`linkageid`,`name`,`style`,`parentid`,`child`,`arrchildid`,`keyid`,`listorder`,`description`,`siteid`) values (1,'中国','1',0,0,'',0,0,'',0),(2,'北京市','0',0,0,'',1,0,'',0),(3,'上海市','0',0,0,'',1,0,'',0),(4,'天津市','0',0,0,'',1,0,'',0),(5,'重庆市','0',0,0,'',1,0,'',0),(6,'河北省','0',0,0,'',1,0,'',0),(7,'山西省','0',0,0,'',1,0,'',0),(8,'内蒙古','0',0,0,'',1,0,'',0),(9,'辽宁省','0',0,0,'',1,0,'',0),(10,'吉林省','0',0,0,'',1,0,'',0),(11,'黑龙江省','0',0,0,'',1,0,'',0),(12,'江苏省','0',0,0,'',1,0,'',0),(13,'浙江省','0',0,0,'',1,0,'',0),(14,'安徽省','0',0,0,'',1,0,'',0),(15,'福建省','0',0,0,'',1,0,'',0),(16,'江西省','0',0,0,'',1,0,'',0),(17,'山东省','0',0,0,'',1,0,'',0),(18,'河南省','0',0,0,'',1,0,'',0),(19,'湖北省','0',0,0,'',1,0,'',0),(20,'湖南省','0',0,0,'',1,0,'',0),(21,'广东省','0',0,0,'',1,0,'',0),(22,'广西','0',0,0,'',1,0,'',0),(23,'海南省','0',0,0,'',1,0,'',0),(24,'四川省','0',0,0,'',1,0,'',0),(25,'贵州省','0',0,0,'',1,0,'',0),(26,'云南省','0',0,0,'',1,0,'',0),(27,'西藏','0',0,0,'',1,0,'',0),(28,'陕西省','0',0,0,'',1,0,'',0),(29,'甘肃省','0',0,0,'',1,0,'',0),(30,'青海省','0',0,0,'',1,0,'',0),(31,'宁夏','0',0,0,'',1,0,'',0),(32,'新疆','0',0,0,'',1,0,'',0),(33,'台湾省','0',0,0,'',1,0,'',0),(34,'香港','0',0,0,'',1,0,'',0),(35,'澳门','0',0,0,'',1,0,'',0),(36,'东城区','0',2,0,'',1,0,'',0),(37,'西城区','0',2,0,'',1,0,'',0),(38,'崇文区','0',2,0,'',1,0,'',0),(39,'宣武区','0',2,0,'',1,0,'',0),(40,'朝阳区','0',2,0,'',1,0,'',0),(41,'石景山区','0',2,0,'',1,0,'',0),(42,'海淀区','0',2,0,'',1,0,'',0),(43,'门头沟区','0',2,0,'',1,0,'',0),(44,'房山区','0',2,0,'',1,0,'',0),(45,'通州区','0',2,0,'',1,0,'',0),(46,'顺义区','0',2,0,'',1,0,'',0),(47,'昌平区','0',2,0,'',1,0,'',0),(48,'大兴区','0',2,0,'',1,0,'',0),(49,'怀柔区','0',2,0,'',1,0,'',0),(50,'平谷区','0',2,0,'',1,0,'',0),(51,'密云县','0',2,0,'',1,0,'',0),(52,'延庆县','0',2,0,'',1,0,'',0),(53,'黄浦区','0',3,0,'',1,0,'',0),(54,'卢湾区','0',3,0,'',1,0,'',0),(55,'徐汇区','0',3,0,'',1,0,'',0),(56,'长宁区','0',3,0,'',1,0,'',0),(57,'静安区','0',3,0,'',1,0,'',0),(58,'普陀区','0',3,0,'',1,0,'',0),(59,'闸北区','0',3,0,'',1,0,'',0),(60,'虹口区','0',3,0,'',1,0,'',0),(61,'杨浦区','0',3,0,'',1,0,'',0),(62,'闵行区','0',3,0,'',1,0,'',0),(63,'宝山区','0',3,0,'',1,0,'',0),(64,'嘉定区','0',3,0,'',1,0,'',0),(65,'浦东新区','0',3,0,'',1,0,'',0),(66,'金山区','0',3,0,'',1,0,'',0),(67,'松江区','0',3,0,'',1,0,'',0),(68,'青浦区','0',3,0,'',1,0,'',0),(69,'南汇区','0',3,0,'',1,0,'',0),(70,'奉贤区','0',3,0,'',1,0,'',0),(71,'崇明县','0',3,0,'',1,0,'',0),(72,'和平区','0',4,0,'',1,0,'',0),(73,'河东区','0',4,0,'',1,0,'',0),(74,'河西区','0',4,0,'',1,0,'',0),(75,'南开区','0',4,0,'',1,0,'',0),(76,'河北区','0',4,0,'',1,0,'',0),(77,'红桥区','0',4,0,'',1,0,'',0),(78,'塘沽区','0',4,0,'',1,0,'',0),(79,'汉沽区','0',4,0,'',1,0,'',0),(80,'大港区','0',4,0,'',1,0,'',0),(81,'东丽区','0',4,0,'',1,0,'',0),(82,'西青区','0',4,0,'',1,0,'',0),(83,'津南区','0',4,0,'',1,0,'',0),(84,'北辰区','0',4,0,'',1,0,'',0),(85,'武清区','0',4,0,'',1,0,'',0),(86,'宝坻区','0',4,0,'',1,0,'',0),(87,'宁河县','0',4,0,'',1,0,'',0),(88,'静海县','0',4,0,'',1,0,'',0),(89,'蓟县','0',4,0,'',1,0,'',0),(90,'万州区','0',5,0,'',1,0,'',0),(91,'涪陵区','0',5,0,'',1,0,'',0),(92,'渝中区','0',5,0,'',1,0,'',0),(93,'大渡口区','0',5,0,'',1,0,'',0),(94,'江北区','0',5,0,'',1,0,'',0),(95,'沙坪坝区','0',5,0,'',1,0,'',0),(96,'九龙坡区','0',5,0,'',1,0,'',0),(97,'南岸区','0',5,0,'',1,0,'',0),(98,'北碚区','0',5,0,'',1,0,'',0),(99,'万盛区','0',5,0,'',1,0,'',0),(100,'双桥区','0',5,0,'',1,0,'',0),(101,'渝北区','0',5,0,'',1,0,'',0),(102,'巴南区','0',5,0,'',1,0,'',0),(103,'黔江区','0',5,0,'',1,0,'',0),(104,'长寿区','0',5,0,'',1,0,'',0),(105,'綦江县','0',5,0,'',1,0,'',0),(106,'潼南县','0',5,0,'',1,0,'',0),(107,'铜梁县','0',5,0,'',1,0,'',0),(108,'大足县','0',5,0,'',1,0,'',0),(109,'荣昌县','0',5,0,'',1,0,'',0),(110,'璧山县','0',5,0,'',1,0,'',0),(111,'梁平县','0',5,0,'',1,0,'',0),(112,'城口县','0',5,0,'',1,0,'',0),(113,'丰都县','0',5,0,'',1,0,'',0),(114,'垫江县','0',5,0,'',1,0,'',0),(115,'武隆县','0',5,0,'',1,0,'',0),(116,'忠县','0',5,0,'',1,0,'',0),(117,'开县','0',5,0,'',1,0,'',0),(118,'云阳县','0',5,0,'',1,0,'',0),(119,'奉节县','0',5,0,'',1,0,'',0),(120,'巫山县','0',5,0,'',1,0,'',0),(121,'巫溪县','0',5,0,'',1,0,'',0),(122,'石柱县','0',5,0,'',1,0,'',0),(123,'秀山县','0',5,0,'',1,0,'',0),(124,'酉阳县','0',5,0,'',1,0,'',0),(125,'彭水县','0',5,0,'',1,0,'',0),(126,'江津区','0',5,0,'',1,0,'',0),(127,'合川区','0',5,0,'',1,0,'',0),(128,'永川区','0',5,0,'',1,0,'',0),(129,'南川区','0',5,0,'',1,0,'',0),(130,'石家庄市','0',6,0,'',1,0,'',0),(131,'唐山市','0',6,0,'',1,0,'',0),(132,'秦皇岛市','0',6,0,'',1,0,'',0),(133,'邯郸市','0',6,0,'',1,0,'',0),(134,'邢台市','0',6,0,'',1,0,'',0),(135,'保定市','0',6,0,'',1,0,'',0),(136,'张家口市','0',6,0,'',1,0,'',0),(137,'承德市','0',6,0,'',1,0,'',0),(138,'沧州市','0',6,0,'',1,0,'',0),(139,'廊坊市','0',6,0,'',1,0,'',0),(140,'衡水市','0',6,0,'',1,0,'',0),(141,'太原市','0',7,0,'',1,0,'',0),(142,'大同市','0',7,0,'',1,0,'',0),(143,'阳泉市','0',7,0,'',1,0,'',0),(144,'长治市','0',7,0,'',1,0,'',0),(145,'晋城市','0',7,0,'',1,0,'',0),(146,'朔州市','0',7,0,'',1,0,'',0),(147,'晋中市','0',7,0,'',1,0,'',0),(148,'运城市','0',7,0,'',1,0,'',0),(149,'忻州市','0',7,0,'',1,0,'',0),(150,'临汾市','0',7,0,'',1,0,'',0),(151,'吕梁市','0',7,0,'',1,0,'',0),(152,'呼和浩特市','0',8,0,'',1,0,'',0),(153,'包头市','0',8,0,'',1,0,'',0),(154,'乌海市','0',8,0,'',1,0,'',0),(155,'赤峰市','0',8,0,'',1,0,'',0),(156,'通辽市','0',8,0,'',1,0,'',0),(157,'鄂尔多斯市','0',8,0,'',1,0,'',0),(158,'呼伦贝尔市','0',8,0,'',1,0,'',0),(159,'巴彦淖尔市','0',8,0,'',1,0,'',0),(160,'乌兰察布市','0',8,0,'',1,0,'',0),(161,'兴安盟','0',8,0,'',1,0,'',0),(162,'锡林郭勒盟','0',8,0,'',1,0,'',0),(163,'阿拉善盟','0',8,0,'',1,0,'',0),(164,'沈阳市','0',9,0,'',1,0,'',0),(165,'大连市','0',9,0,'',1,0,'',0),(166,'鞍山市','0',9,0,'',1,0,'',0),(167,'抚顺市','0',9,0,'',1,0,'',0),(168,'本溪市','0',9,0,'',1,0,'',0),(169,'丹东市','0',9,0,'',1,0,'',0),(170,'锦州市','0',9,0,'',1,0,'',0),(171,'营口市','0',9,0,'',1,0,'',0),(172,'阜新市','0',9,0,'',1,0,'',0),(173,'辽阳市','0',9,0,'',1,0,'',0),(174,'盘锦市','0',9,0,'',1,0,'',0),(175,'铁岭市','0',9,0,'',1,0,'',0),(176,'朝阳市','0',9,0,'',1,0,'',0),(177,'葫芦岛市','0',9,0,'',1,0,'',0),(178,'长春市','0',10,0,'',1,0,'',0),(179,'吉林市','0',10,0,'',1,0,'',0),(180,'四平市','0',10,0,'',1,0,'',0),(181,'辽源市','0',10,0,'',1,0,'',0),(182,'通化市','0',10,0,'',1,0,'',0),(183,'白山市','0',10,0,'',1,0,'',0),(184,'松原市','0',10,0,'',1,0,'',0),(185,'白城市','0',10,0,'',1,0,'',0),(186,'延边','0',10,0,'',1,0,'',0),(187,'哈尔滨市','0',11,0,'',1,0,'',0),(188,'齐齐哈尔市','0',11,0,'',1,0,'',0),(189,'鸡西市','0',11,0,'',1,0,'',0),(190,'鹤岗市','0',11,0,'',1,0,'',0),(191,'双鸭山市','0',11,0,'',1,0,'',0),(192,'大庆市','0',11,0,'',1,0,'',0),(193,'伊春市','0',11,0,'',1,0,'',0),(194,'佳木斯市','0',11,0,'',1,0,'',0),(195,'七台河市','0',11,0,'',1,0,'',0),(196,'牡丹江市','0',11,0,'',1,0,'',0),(197,'黑河市','0',11,0,'',1,0,'',0),(198,'绥化市','0',11,0,'',1,0,'',0),(199,'大兴安岭地区','0',11,0,'',1,0,'',0),(200,'南京市','0',12,0,'',1,0,'',0),(201,'无锡市','0',12,0,'',1,0,'',0),(202,'徐州市','0',12,0,'',1,0,'',0),(203,'常州市','0',12,0,'',1,0,'',0),(204,'苏州市','0',12,0,'',1,0,'',0),(205,'南通市','0',12,0,'',1,0,'',0),(206,'连云港市','0',12,0,'',1,0,'',0),(207,'淮安市','0',12,0,'',1,0,'',0),(208,'盐城市','0',12,0,'',1,0,'',0),(209,'扬州市','0',12,0,'',1,0,'',0),(210,'镇江市','0',12,0,'',1,0,'',0),(211,'泰州市','0',12,0,'',1,0,'',0),(212,'宿迁市','0',12,0,'',1,0,'',0),(213,'杭州市','0',13,0,'',1,0,'',0),(214,'宁波市','0',13,0,'',1,0,'',0),(215,'温州市','0',13,0,'',1,0,'',0),(216,'嘉兴市','0',13,0,'',1,0,'',0),(217,'湖州市','0',13,0,'',1,0,'',0),(218,'绍兴市','0',13,0,'',1,0,'',0),(219,'金华市','0',13,0,'',1,0,'',0),(220,'衢州市','0',13,0,'',1,0,'',0),(221,'舟山市','0',13,0,'',1,0,'',0),(222,'台州市','0',13,0,'',1,0,'',0),(223,'丽水市','0',13,0,'',1,0,'',0),(224,'合肥市','0',14,0,'',1,0,'',0),(225,'芜湖市','0',14,0,'',1,0,'',0),(226,'蚌埠市','0',14,0,'',1,0,'',0),(227,'淮南市','0',14,0,'',1,0,'',0),(228,'马鞍山市','0',14,0,'',1,0,'',0),(229,'淮北市','0',14,0,'',1,0,'',0),(230,'铜陵市','0',14,0,'',1,0,'',0),(231,'安庆市','0',14,0,'',1,0,'',0),(232,'黄山市','0',14,0,'',1,0,'',0),(233,'滁州市','0',14,0,'',1,0,'',0),(234,'阜阳市','0',14,0,'',1,0,'',0),(235,'宿州市','0',14,0,'',1,0,'',0),(236,'巢湖市','0',14,0,'',1,0,'',0),(237,'六安市','0',14,0,'',1,0,'',0),(238,'亳州市','0',14,0,'',1,0,'',0),(239,'池州市','0',14,0,'',1,0,'',0),(240,'宣城市','0',14,0,'',1,0,'',0),(241,'福州市','0',15,0,'',1,0,'',0),(242,'厦门市','0',15,0,'',1,0,'',0),(243,'莆田市','0',15,0,'',1,0,'',0),(244,'三明市','0',15,0,'',1,0,'',0),(245,'泉州市','0',15,0,'',1,0,'',0),(246,'漳州市','0',15,0,'',1,0,'',0),(247,'南平市','0',15,0,'',1,0,'',0),(248,'龙岩市','0',15,0,'',1,0,'',0),(249,'宁德市','0',15,0,'',1,0,'',0),(250,'南昌市','0',16,0,'',1,0,'',0),(251,'景德镇市','0',16,0,'',1,0,'',0),(252,'萍乡市','0',16,0,'',1,0,'',0),(253,'九江市','0',16,0,'',1,0,'',0),(254,'新余市','0',16,0,'',1,0,'',0),(255,'鹰潭市','0',16,0,'',1,0,'',0),(256,'赣州市','0',16,0,'',1,0,'',0),(257,'吉安市','0',16,0,'',1,0,'',0),(258,'宜春市','0',16,0,'',1,0,'',0),(259,'抚州市','0',16,0,'',1,0,'',0),(260,'上饶市','0',16,0,'',1,0,'',0),(261,'济南市','0',17,0,'',1,0,'',0),(262,'青岛市','0',17,0,'',1,0,'',0),(263,'淄博市','0',17,0,'',1,0,'',0),(264,'枣庄市','0',17,0,'',1,0,'',0),(265,'东营市','0',17,0,'',1,0,'',0),(266,'烟台市','0',17,0,'',1,0,'',0),(267,'潍坊市','0',17,0,'',1,0,'',0),(268,'济宁市','0',17,0,'',1,0,'',0),(269,'泰安市','0',17,0,'',1,0,'',0),(270,'威海市','0',17,0,'',1,0,'',0),(271,'日照市','0',17,0,'',1,0,'',0),(272,'莱芜市','0',17,0,'',1,0,'',0),(273,'临沂市','0',17,0,'',1,0,'',0),(274,'德州市','0',17,0,'',1,0,'',0),(275,'聊城市','0',17,0,'',1,0,'',0),(276,'滨州市','0',17,0,'',1,0,'',0),(277,'荷泽市','0',17,0,'',1,0,'',0),(278,'郑州市','0',18,0,'',1,0,'',0),(279,'开封市','0',18,0,'',1,0,'',0),(280,'洛阳市','0',18,0,'',1,0,'',0),(281,'平顶山市','0',18,0,'',1,0,'',0),(282,'安阳市','0',18,0,'',1,0,'',0),(283,'鹤壁市','0',18,0,'',1,0,'',0),(284,'新乡市','0',18,0,'',1,0,'',0),(285,'焦作市','0',18,0,'',1,0,'',0),(286,'濮阳市','0',18,0,'',1,0,'',0),(287,'许昌市','0',18,0,'',1,0,'',0),(288,'漯河市','0',18,0,'',1,0,'',0),(289,'三门峡市','0',18,0,'',1,0,'',0),(290,'南阳市','0',18,0,'',1,0,'',0),(291,'商丘市','0',18,0,'',1,0,'',0),(292,'信阳市','0',18,0,'',1,0,'',0),(293,'周口市','0',18,0,'',1,0,'',0),(294,'驻马店市','0',18,0,'',1,0,'',0),(295,'武汉市','0',19,0,'',1,0,'',0),(296,'黄石市','0',19,0,'',1,0,'',0),(297,'十堰市','0',19,0,'',1,0,'',0),(298,'宜昌市','0',19,0,'',1,0,'',0),(299,'襄樊市','0',19,0,'',1,0,'',0),(300,'鄂州市','0',19,0,'',1,0,'',0),(301,'荆门市','0',19,0,'',1,0,'',0),(302,'孝感市','0',19,0,'',1,0,'',0),(303,'荆州市','0',19,0,'',1,0,'',0),(304,'黄冈市','0',19,0,'',1,0,'',0),(305,'咸宁市','0',19,0,'',1,0,'',0),(306,'随州市','0',19,0,'',1,0,'',0),(307,'恩施土家族苗族自治州','0',19,0,'',1,0,'',0),(308,'仙桃市','0',19,0,'',1,0,'',0),(309,'潜江市','0',19,0,'',1,0,'',0),(310,'天门市','0',19,0,'',1,0,'',0),(311,'神农架林区','0',19,0,'',1,0,'',0),(312,'长沙市','0',20,0,'',1,0,'',0),(313,'株洲市','0',20,0,'',1,0,'',0),(314,'湘潭市','0',20,0,'',1,0,'',0),(315,'衡阳市','0',20,0,'',1,0,'',0),(316,'邵阳市','0',20,0,'',1,0,'',0),(317,'岳阳市','0',20,0,'',1,0,'',0),(318,'常德市','0',20,0,'',1,0,'',0),(319,'张家界市','0',20,0,'',1,0,'',0),(320,'益阳市','0',20,0,'',1,0,'',0),(321,'郴州市','0',20,0,'',1,0,'',0),(322,'永州市','0',20,0,'',1,0,'',0),(323,'怀化市','0',20,0,'',1,0,'',0),(324,'娄底市','0',20,0,'',1,0,'',0),(325,'湘西土家族苗族自治州','0',20,0,'',1,0,'',0),(326,'广州市','0',21,0,'',1,0,'',0),(327,'韶关市','0',21,0,'',1,0,'',0),(328,'深圳市','0',21,0,'',1,0,'',0),(329,'珠海市','0',21,0,'',1,0,'',0),(330,'汕头市','0',21,0,'',1,0,'',0),(331,'佛山市','0',21,0,'',1,0,'',0),(332,'江门市','0',21,0,'',1,0,'',0),(333,'湛江市','0',21,0,'',1,0,'',0),(334,'茂名市','0',21,0,'',1,0,'',0),(335,'肇庆市','0',21,0,'',1,0,'',0),(336,'惠州市','0',21,0,'',1,0,'',0),(337,'梅州市','0',21,0,'',1,0,'',0),(338,'汕尾市','0',21,0,'',1,0,'',0),(339,'河源市','0',21,0,'',1,0,'',0),(340,'阳江市','0',21,0,'',1,0,'',0),(341,'清远市','0',21,0,'',1,0,'',0),(342,'东莞市','0',21,0,'',1,0,'',0),(343,'中山市','0',21,0,'',1,0,'',0),(344,'潮州市','0',21,0,'',1,0,'',0),(345,'揭阳市','0',21,0,'',1,0,'',0),(346,'云浮市','0',21,0,'',1,0,'',0),(347,'南宁市','0',22,0,'',1,0,'',0),(348,'柳州市','0',22,0,'',1,0,'',0),(349,'桂林市','0',22,0,'',1,0,'',0),(350,'梧州市','0',22,0,'',1,0,'',0),(351,'北海市','0',22,0,'',1,0,'',0),(352,'防城港市','0',22,0,'',1,0,'',0),(353,'钦州市','0',22,0,'',1,0,'',0),(354,'贵港市','0',22,0,'',1,0,'',0),(355,'玉林市','0',22,0,'',1,0,'',0),(356,'百色市','0',22,0,'',1,0,'',0),(357,'贺州市','0',22,0,'',1,0,'',0),(358,'河池市','0',22,0,'',1,0,'',0),(359,'来宾市','0',22,0,'',1,0,'',0),(360,'崇左市','0',22,0,'',1,0,'',0),(361,'海口市','0',23,0,'',1,0,'',0),(362,'三亚市','0',23,0,'',1,0,'',0),(363,'五指山市','0',23,0,'',1,0,'',0),(364,'琼海市','0',23,0,'',1,0,'',0),(365,'儋州市','0',23,0,'',1,0,'',0),(366,'文昌市','0',23,0,'',1,0,'',0),(367,'万宁市','0',23,0,'',1,0,'',0),(368,'东方市','0',23,0,'',1,0,'',0),(369,'定安县','0',23,0,'',1,0,'',0),(370,'屯昌县','0',23,0,'',1,0,'',0),(371,'澄迈县','0',23,0,'',1,0,'',0),(372,'临高县','0',23,0,'',1,0,'',0),(373,'白沙黎族自治县','0',23,0,'',1,0,'',0),(374,'昌江黎族自治县','0',23,0,'',1,0,'',0),(375,'乐东黎族自治县','0',23,0,'',1,0,'',0),(376,'陵水黎族自治县','0',23,0,'',1,0,'',0),(377,'保亭黎族苗族自治县','0',23,0,'',1,0,'',0),(378,'琼中黎族苗族自治县','0',23,0,'',1,0,'',0),(379,'西沙群岛','0',23,0,'',1,0,'',0),(380,'南沙群岛','0',23,0,'',1,0,'',0),(381,'中沙群岛的岛礁及其海域','0',23,0,'',1,0,'',0),(382,'成都市','0',24,0,'',1,0,'',0),(383,'自贡市','0',24,0,'',1,0,'',0),(384,'攀枝花市','0',24,0,'',1,0,'',0),(385,'泸州市','0',24,0,'',1,0,'',0),(386,'德阳市','0',24,0,'',1,0,'',0),(387,'绵阳市','0',24,0,'',1,0,'',0),(388,'广元市','0',24,0,'',1,0,'',0),(389,'遂宁市','0',24,0,'',1,0,'',0),(390,'内江市','0',24,0,'',1,0,'',0),(391,'乐山市','0',24,0,'',1,0,'',0),(392,'南充市','0',24,0,'',1,0,'',0),(393,'眉山市','0',24,0,'',1,0,'',0),(394,'宜宾市','0',24,0,'',1,0,'',0),(395,'广安市','0',24,0,'',1,0,'',0),(396,'达州市','0',24,0,'',1,0,'',0),(397,'雅安市','0',24,0,'',1,0,'',0),(398,'巴中市','0',24,0,'',1,0,'',0),(399,'资阳市','0',24,0,'',1,0,'',0),(400,'阿坝州','0',24,0,'',1,0,'',0),(401,'甘孜州','0',24,0,'',1,0,'',0),(402,'凉山州','0',24,0,'',1,0,'',0),(403,'贵阳市','0',25,0,'',1,0,'',0),(404,'六盘水市','0',25,0,'',1,0,'',0),(405,'遵义市','0',25,0,'',1,0,'',0),(406,'安顺市','0',25,0,'',1,0,'',0),(407,'铜仁地区','0',25,0,'',1,0,'',0),(408,'黔西南州','0',25,0,'',1,0,'',0),(409,'毕节地区','0',25,0,'',1,0,'',0),(410,'黔东南州','0',25,0,'',1,0,'',0),(411,'黔南州','0',25,0,'',1,0,'',0),(412,'昆明市','0',26,0,'',1,0,'',0),(413,'曲靖市','0',26,0,'',1,0,'',0),(414,'玉溪市','0',26,0,'',1,0,'',0),(415,'保山市','0',26,0,'',1,0,'',0),(416,'昭通市','0',26,0,'',1,0,'',0),(417,'丽江市','0',26,0,'',1,0,'',0),(418,'思茅市','0',26,0,'',1,0,'',0),(419,'临沧市','0',26,0,'',1,0,'',0),(420,'楚雄州','0',26,0,'',1,0,'',0),(421,'红河州','0',26,0,'',1,0,'',0),(422,'文山州','0',26,0,'',1,0,'',0),(423,'西双版纳','0',26,0,'',1,0,'',0),(424,'大理','0',26,0,'',1,0,'',0),(425,'德宏','0',26,0,'',1,0,'',0),(426,'怒江','0',26,0,'',1,0,'',0),(427,'迪庆','0',26,0,'',1,0,'',0),(428,'拉萨市','0',27,0,'',1,0,'',0),(429,'昌都','0',27,0,'',1,0,'',0),(430,'山南','0',27,0,'',1,0,'',0),(431,'日喀则','0',27,0,'',1,0,'',0),(432,'那曲','0',27,0,'',1,0,'',0),(433,'阿里','0',27,0,'',1,0,'',0),(434,'林芝','0',27,0,'',1,0,'',0),(435,'西安市','0',28,0,'',1,0,'',0),(436,'铜川市','0',28,0,'',1,0,'',0),(437,'宝鸡市','0',28,0,'',1,0,'',0),(438,'咸阳市','0',28,0,'',1,0,'',0),(439,'渭南市','0',28,0,'',1,0,'',0),(440,'延安市','0',28,0,'',1,0,'',0),(441,'汉中市','0',28,0,'',1,0,'',0),(442,'榆林市','0',28,0,'',1,0,'',0),(443,'安康市','0',28,0,'',1,0,'',0),(444,'商洛市','0',28,0,'',1,0,'',0),(445,'兰州市','0',29,0,'',1,0,'',0),(446,'嘉峪关市','0',29,0,'',1,0,'',0),(447,'金昌市','0',29,0,'',1,0,'',0),(448,'白银市','0',29,0,'',1,0,'',0),(449,'天水市','0',29,0,'',1,0,'',0),(450,'武威市','0',29,0,'',1,0,'',0),(451,'张掖市','0',29,0,'',1,0,'',0),(452,'平凉市','0',29,0,'',1,0,'',0),(453,'酒泉市','0',29,0,'',1,0,'',0),(454,'庆阳市','0',29,0,'',1,0,'',0),(455,'定西市','0',29,0,'',1,0,'',0),(456,'陇南市','0',29,0,'',1,0,'',0),(457,'临夏州','0',29,0,'',1,0,'',0),(458,'甘州','0',29,0,'',1,0,'',0),(459,'西宁市','0',30,0,'',1,0,'',0),(460,'海东地区','0',30,0,'',1,0,'',0),(461,'海州','0',30,0,'',1,0,'',0),(462,'黄南州','0',30,0,'',1,0,'',0),(463,'海南州','0',30,0,'',1,0,'',0),(464,'果洛州','0',30,0,'',1,0,'',0),(465,'玉树州','0',30,0,'',1,0,'',0),(466,'海西州','0',30,0,'',1,0,'',0),(467,'银川市','0',31,0,'',1,0,'',0),(468,'石嘴山市','0',31,0,'',1,0,'',0),(469,'吴忠市','0',31,0,'',1,0,'',0),(470,'固原市','0',31,0,'',1,0,'',0),(471,'中卫市','0',31,0,'',1,0,'',0),(472,'乌鲁木齐市','0',32,0,'',1,0,'',0),(473,'克拉玛依市','0',32,0,'',1,0,'',0),(474,'吐鲁番地区','0',32,0,'',1,0,'',0),(475,'哈密地区','0',32,0,'',1,0,'',0),(476,'昌吉州','0',32,0,'',1,0,'',0),(477,'博尔州','0',32,0,'',1,0,'',0),(478,'巴音郭楞州','0',32,0,'',1,0,'',0),(479,'阿克苏地区','0',32,0,'',1,0,'',0),(480,'克孜勒苏柯尔克孜自治州','0',32,0,'',1,0,'',0),(481,'喀什地区','0',32,0,'',1,0,'',0),(482,'和田地区','0',32,0,'',1,0,'',0),(483,'伊犁州','0',32,0,'',1,0,'',0),(484,'塔城地区','0',32,0,'',1,0,'',0),(485,'阿勒泰地区','0',32,0,'',1,0,'',0),(486,'石河子市','0',32,0,'',1,0,'',0),(487,'阿拉尔市','0',32,0,'',1,0,'',0),(488,'图木舒克市','0',32,0,'',1,0,'',0),(489,'五家渠市','0',32,0,'',1,0,'',0),(490,'台北市','0',33,0,'',1,0,'',0),(491,'高雄市','0',33,0,'',1,0,'',0),(492,'基隆市','0',33,0,'',1,0,'',0),(493,'新竹市','0',33,0,'',1,0,'',0),(494,'台中市','0',33,0,'',1,0,'',0),(495,'嘉义市','0',33,0,'',1,0,'',0),(496,'台南市','0',33,0,'',1,0,'',0),(497,'台北县','0',33,0,'',1,0,'',0),(498,'桃园县','0',33,0,'',1,0,'',0),(499,'新竹县','0',33,0,'',1,0,'',0),(500,'苗栗县','0',33,0,'',1,0,'',0),(501,'台中县','0',33,0,'',1,0,'',0),(502,'彰化县','0',33,0,'',1,0,'',0),(503,'南投县','0',33,0,'',1,0,'',0),(504,'云林县','0',33,0,'',1,0,'',0),(505,'嘉义县','0',33,0,'',1,0,'',0),(506,'台南县','0',33,0,'',1,0,'',0),(507,'高雄县','0',33,0,'',1,0,'',0),(508,'屏东县','0',33,0,'',1,0,'',0),(509,'宜兰县','0',33,0,'',1,0,'',0),(510,'花莲县','0',33,0,'',1,0,'',0),(511,'台东县','0',33,0,'',1,0,'',0),(512,'澎湖县','0',33,0,'',1,0,'',0),(513,'金门县','0',33,0,'',1,0,'',0),(514,'连江县','0',33,0,'',1,0,'',0),(515,'中西区','0',34,0,'',1,0,'',0),(516,'东区','0',34,0,'',1,0,'',0),(517,'南区','0',34,0,'',1,0,'',0),(518,'湾仔区','0',34,0,'',1,0,'',0),(519,'九龙城区','0',34,0,'',1,0,'',0),(520,'观塘区','0',34,0,'',1,0,'',0),(521,'深水埗区','0',34,0,'',1,0,'',0),(522,'黄大仙区','0',34,0,'',1,0,'',0),(523,'油尖旺区','0',34,0,'',1,0,'',0),(524,'离岛区','0',34,0,'',1,0,'',0),(525,'葵青区','0',34,0,'',1,0,'',0),(526,'北区','0',34,0,'',1,0,'',0),(527,'西贡区','0',34,0,'',1,0,'',0),(528,'沙田区','0',34,0,'',1,0,'',0),(529,'大埔区','0',34,0,'',1,0,'',0),(530,'荃湾区','0',34,0,'',1,0,'',0),(531,'屯门区','0',34,0,'',1,0,'',0),(532,'元朗区','0',34,0,'',1,0,'',0),(533,'花地玛堂区','0',35,0,'',1,0,'',0),(534,'市圣安多尼堂区','0',35,0,'',1,0,'',0),(535,'大堂区','0',35,0,'',1,0,'',0),(536,'望德堂区','0',35,0,'',1,0,'',0),(537,'风顺堂区','0',35,0,'',1,0,'',0),(538,'嘉模堂区','0',35,0,'',1,0,'',0),(539,'圣方济各堂区','0',35,0,'',1,0,'',0),(540,'长安区','0',130,0,'',1,0,'',0),(541,'桥东区','0',130,0,'',1,0,'',0),(542,'桥西区','0',130,0,'',1,0,'',0),(543,'新华区','0',130,0,'',1,0,'',0),(544,'井陉矿区','0',130,0,'',1,0,'',0),(545,'裕华区','0',130,0,'',1,0,'',0),(546,'井陉县','0',130,0,'',1,0,'',0),(547,'正定县','0',130,0,'',1,0,'',0),(548,'栾城县','0',130,0,'',1,0,'',0),(549,'行唐县','0',130,0,'',1,0,'',0),(550,'灵寿县','0',130,0,'',1,0,'',0),(551,'高邑县','0',130,0,'',1,0,'',0),(552,'深泽县','0',130,0,'',1,0,'',0),(553,'赞皇县','0',130,0,'',1,0,'',0),(554,'无极县','0',130,0,'',1,0,'',0),(555,'平山县','0',130,0,'',1,0,'',0),(556,'元氏县','0',130,0,'',1,0,'',0),(557,'赵县','0',130,0,'',1,0,'',0),(558,'辛集市','0',130,0,'',1,0,'',0),(559,'藁城市','0',130,0,'',1,0,'',0),(560,'晋州市','0',130,0,'',1,0,'',0),(561,'新乐市','0',130,0,'',1,0,'',0),(562,'鹿泉市','0',130,0,'',1,0,'',0),(563,'路南区','0',131,0,'',1,0,'',0),(564,'路北区','0',131,0,'',1,0,'',0),(565,'古冶区','0',131,0,'',1,0,'',0),(566,'开平区','0',131,0,'',1,0,'',0),(567,'丰南区','0',131,0,'',1,0,'',0),(568,'丰润区','0',131,0,'',1,0,'',0),(569,'滦县','0',131,0,'',1,0,'',0),(570,'滦南县','0',131,0,'',1,0,'',0),(571,'乐亭县','0',131,0,'',1,0,'',0),(572,'迁西县','0',131,0,'',1,0,'',0),(573,'玉田县','0',131,0,'',1,0,'',0),(574,'唐海县','0',131,0,'',1,0,'',0),(575,'遵化市','0',131,0,'',1,0,'',0),(576,'迁安市','0',131,0,'',1,0,'',0),(577,'海港区','0',132,0,'',1,0,'',0),(578,'山海关区','0',132,0,'',1,0,'',0),(579,'北戴河区','0',132,0,'',1,0,'',0),(580,'青龙县','0',132,0,'',1,0,'',0),(581,'昌黎县','0',132,0,'',1,0,'',0),(582,'抚宁县','0',132,0,'',1,0,'',0),(583,'卢龙县','0',132,0,'',1,0,'',0),(584,'邯山区','0',133,0,'',1,0,'',0),(585,'丛台区','0',133,0,'',1,0,'',0),(586,'复兴区','0',133,0,'',1,0,'',0),(587,'峰峰矿区','0',133,0,'',1,0,'',0),(588,'邯郸县','0',133,0,'',1,0,'',0),(589,'临漳县','0',133,0,'',1,0,'',0),(590,'成安县','0',133,0,'',1,0,'',0),(591,'大名县','0',133,0,'',1,0,'',0),(592,'涉县','0',133,0,'',1,0,'',0),(593,'磁县','0',133,0,'',1,0,'',0),(594,'肥乡县','0',133,0,'',1,0,'',0),(595,'永年县','0',133,0,'',1,0,'',0),(596,'邱县','0',133,0,'',1,0,'',0),(597,'鸡泽县','0',133,0,'',1,0,'',0),(598,'广平县','0',133,0,'',1,0,'',0),(599,'馆陶县','0',133,0,'',1,0,'',0),(600,'魏县','0',133,0,'',1,0,'',0),(601,'曲周县','0',133,0,'',1,0,'',0),(602,'武安市','0',133,0,'',1,0,'',0),(603,'桥东区','0',134,0,'',1,0,'',0),(604,'桥西区','0',134,0,'',1,0,'',0),(605,'邢台县','0',134,0,'',1,0,'',0),(606,'临城县','0',134,0,'',1,0,'',0),(607,'内丘县','0',134,0,'',1,0,'',0),(608,'柏乡县','0',134,0,'',1,0,'',0),(609,'隆尧县','0',134,0,'',1,0,'',0),(610,'任县','0',134,0,'',1,0,'',0),(611,'南和县','0',134,0,'',1,0,'',0),(612,'宁晋县','0',134,0,'',1,0,'',0),(613,'巨鹿县','0',134,0,'',1,0,'',0),(614,'新河县','0',134,0,'',1,0,'',0),(615,'广宗县','0',134,0,'',1,0,'',0),(616,'平乡县','0',134,0,'',1,0,'',0),(617,'威县','0',134,0,'',1,0,'',0),(618,'清河县','0',134,0,'',1,0,'',0),(619,'临西县','0',134,0,'',1,0,'',0),(620,'南宫市','0',134,0,'',1,0,'',0),(621,'沙河市','0',134,0,'',1,0,'',0),(622,'新市区','0',135,0,'',1,0,'',0),(623,'北市区','0',135,0,'',1,0,'',0),(624,'南市区','0',135,0,'',1,0,'',0),(625,'满城县','0',135,0,'',1,0,'',0),(626,'清苑县','0',135,0,'',1,0,'',0),(627,'涞水县','0',135,0,'',1,0,'',0),(628,'阜平县','0',135,0,'',1,0,'',0),(629,'徐水县','0',135,0,'',1,0,'',0),(630,'定兴县','0',135,0,'',1,0,'',0),(631,'唐县','0',135,0,'',1,0,'',0),(632,'高阳县','0',135,0,'',1,0,'',0),(633,'容城县','0',135,0,'',1,0,'',0),(634,'涞源县','0',135,0,'',1,0,'',0),(635,'望都县','0',135,0,'',1,0,'',0),(636,'安新县','0',135,0,'',1,0,'',0),(637,'易县','0',135,0,'',1,0,'',0),(638,'曲阳县','0',135,0,'',1,0,'',0),(639,'蠡县','0',135,0,'',1,0,'',0),(640,'顺平县','0',135,0,'',1,0,'',0),(641,'博野县','0',135,0,'',1,0,'',0),(642,'雄县','0',135,0,'',1,0,'',0),(643,'涿州市','0',135,0,'',1,0,'',0),(644,'定州市','0',135,0,'',1,0,'',0),(645,'安国市','0',135,0,'',1,0,'',0),(646,'高碑店市','0',135,0,'',1,0,'',0),(647,'桥东区','0',136,0,'',1,0,'',0),(648,'桥西区','0',136,0,'',1,0,'',0),(649,'宣化区','0',136,0,'',1,0,'',0),(650,'下花园区','0',136,0,'',1,0,'',0),(651,'宣化县','0',136,0,'',1,0,'',0),(652,'张北县','0',136,0,'',1,0,'',0),(653,'康保县','0',136,0,'',1,0,'',0),(654,'沽源县','0',136,0,'',1,0,'',0),(655,'尚义县','0',136,0,'',1,0,'',0),(656,'蔚县','0',136,0,'',1,0,'',0),(657,'阳原县','0',136,0,'',1,0,'',0),(658,'怀安县','0',136,0,'',1,0,'',0),(659,'万全县','0',136,0,'',1,0,'',0),(660,'怀来县','0',136,0,'',1,0,'',0),(661,'涿鹿县','0',136,0,'',1,0,'',0),(662,'赤城县','0',136,0,'',1,0,'',0),(663,'崇礼县','0',136,0,'',1,0,'',0),(664,'双桥区','0',137,0,'',1,0,'',0),(665,'双滦区','0',137,0,'',1,0,'',0),(666,'鹰手营子矿区','0',137,0,'',1,0,'',0),(667,'承德县','0',137,0,'',1,0,'',0),(668,'兴隆县','0',137,0,'',1,0,'',0),(669,'平泉县','0',137,0,'',1,0,'',0),(670,'滦平县','0',137,0,'',1,0,'',0),(671,'隆化县','0',137,0,'',1,0,'',0),(672,'丰宁县','0',137,0,'',1,0,'',0),(673,'宽城县','0',137,0,'',1,0,'',0),(674,'围场县','0',137,0,'',1,0,'',0),(675,'新华区','0',138,0,'',1,0,'',0),(676,'运河区','0',138,0,'',1,0,'',0),(677,'沧县','0',138,0,'',1,0,'',0),(678,'青县','0',138,0,'',1,0,'',0),(679,'东光县','0',138,0,'',1,0,'',0),(680,'海兴县','0',138,0,'',1,0,'',0),(681,'盐山县','0',138,0,'',1,0,'',0),(682,'肃宁县','0',138,0,'',1,0,'',0),(683,'南皮县','0',138,0,'',1,0,'',0),(684,'吴桥县','0',138,0,'',1,0,'',0),(685,'献县','0',138,0,'',1,0,'',0),(686,'孟村县','0',138,0,'',1,0,'',0),(687,'泊头市','0',138,0,'',1,0,'',0),(688,'任丘市','0',138,0,'',1,0,'',0),(689,'黄骅市','0',138,0,'',1,0,'',0),(690,'河间市','0',138,0,'',1,0,'',0),(691,'安次区','0',139,0,'',1,0,'',0),(692,'广阳区','0',139,0,'',1,0,'',0),(693,'固安县','0',139,0,'',1,0,'',0),(694,'永清县','0',139,0,'',1,0,'',0),(695,'香河县','0',139,0,'',1,0,'',0),(696,'大城县','0',139,0,'',1,0,'',0),(697,'文安县','0',139,0,'',1,0,'',0),(698,'大厂县','0',139,0,'',1,0,'',0),(699,'霸州市','0',139,0,'',1,0,'',0),(700,'三河市','0',139,0,'',1,0,'',0),(701,'桃城区','0',140,0,'',1,0,'',0),(702,'枣强县','0',140,0,'',1,0,'',0),(703,'武邑县','0',140,0,'',1,0,'',0),(704,'武强县','0',140,0,'',1,0,'',0),(705,'饶阳县','0',140,0,'',1,0,'',0),(706,'安平县','0',140,0,'',1,0,'',0),(707,'故城县','0',140,0,'',1,0,'',0),(708,'景县','0',140,0,'',1,0,'',0),(709,'阜城县','0',140,0,'',1,0,'',0),(710,'冀州市','0',140,0,'',1,0,'',0),(711,'深州市','0',140,0,'',1,0,'',0),(712,'小店区','0',141,0,'',1,0,'',0),(713,'迎泽区','0',141,0,'',1,0,'',0),(714,'杏花岭区','0',141,0,'',1,0,'',0),(715,'尖草坪区','0',141,0,'',1,0,'',0),(716,'万柏林区','0',141,0,'',1,0,'',0),(717,'晋源区','0',141,0,'',1,0,'',0),(718,'清徐县','0',141,0,'',1,0,'',0),(719,'阳曲县','0',141,0,'',1,0,'',0),(720,'娄烦县','0',141,0,'',1,0,'',0),(721,'古交市','0',141,0,'',1,0,'',0),(722,'城区','0',142,0,'',1,0,'',0),(723,'矿区','0',142,0,'',1,0,'',0),(724,'南郊区','0',142,0,'',1,0,'',0),(725,'新荣区','0',142,0,'',1,0,'',0),(726,'阳高县','0',142,0,'',1,0,'',0),(727,'天镇县','0',142,0,'',1,0,'',0),(728,'广灵县','0',142,0,'',1,0,'',0),(729,'灵丘县','0',142,0,'',1,0,'',0),(730,'浑源县','0',142,0,'',1,0,'',0),(731,'左云县','0',142,0,'',1,0,'',0),(732,'大同县','0',142,0,'',1,0,'',0),(733,'城区','0',143,0,'',1,0,'',0),(734,'矿区','0',143,0,'',1,0,'',0),(735,'郊区','0',143,0,'',1,0,'',0),(736,'平定县','0',143,0,'',1,0,'',0),(737,'盂县','0',143,0,'',1,0,'',0),(738,'城区','0',144,0,'',1,0,'',0),(739,'郊区','0',144,0,'',1,0,'',0),(740,'长治县','0',144,0,'',1,0,'',0),(741,'襄垣县','0',144,0,'',1,0,'',0),(742,'屯留县','0',144,0,'',1,0,'',0),(743,'平顺县','0',144,0,'',1,0,'',0),(744,'黎城县','0',144,0,'',1,0,'',0),(745,'壶关县','0',144,0,'',1,0,'',0),(746,'长子县','0',144,0,'',1,0,'',0),(747,'武乡县','0',144,0,'',1,0,'',0),(748,'沁县','0',144,0,'',1,0,'',0),(749,'沁源县','0',144,0,'',1,0,'',0),(750,'潞城市','0',144,0,'',1,0,'',0),(751,'城区','0',145,0,'',1,0,'',0),(752,'沁水县','0',145,0,'',1,0,'',0),(753,'阳城县','0',145,0,'',1,0,'',0),(754,'陵川县','0',145,0,'',1,0,'',0),(755,'泽州县','0',145,0,'',1,0,'',0),(756,'高平市','0',145,0,'',1,0,'',0),(757,'朔城区','0',146,0,'',1,0,'',0),(758,'平鲁区','0',146,0,'',1,0,'',0),(759,'山阴县','0',146,0,'',1,0,'',0),(760,'应县','0',146,0,'',1,0,'',0),(761,'右玉县','0',146,0,'',1,0,'',0),(762,'怀仁县','0',146,0,'',1,0,'',0),(763,'榆次区','0',147,0,'',1,0,'',0),(764,'榆社县','0',147,0,'',1,0,'',0),(765,'左权县','0',147,0,'',1,0,'',0),(766,'和顺县','0',147,0,'',1,0,'',0),(767,'昔阳县','0',147,0,'',1,0,'',0),(768,'寿阳县','0',147,0,'',1,0,'',0),(769,'太谷县','0',147,0,'',1,0,'',0),(770,'祁县','0',147,0,'',1,0,'',0),(771,'平遥县','0',147,0,'',1,0,'',0),(772,'灵石县','0',147,0,'',1,0,'',0),(773,'介休市','0',147,0,'',1,0,'',0),(774,'盐湖区','0',148,0,'',1,0,'',0),(775,'临猗县','0',148,0,'',1,0,'',0),(776,'万荣县','0',148,0,'',1,0,'',0),(777,'闻喜县','0',148,0,'',1,0,'',0),(778,'稷山县','0',148,0,'',1,0,'',0),(779,'新绛县','0',148,0,'',1,0,'',0),(780,'绛县','0',148,0,'',1,0,'',0),(781,'垣曲县','0',148,0,'',1,0,'',0),(782,'夏县','0',148,0,'',1,0,'',0),(783,'平陆县','0',148,0,'',1,0,'',0),(784,'芮城县','0',148,0,'',1,0,'',0),(785,'永济市','0',148,0,'',1,0,'',0),(786,'河津市','0',148,0,'',1,0,'',0),(787,'忻府区','0',149,0,'',1,0,'',0),(788,'定襄县','0',149,0,'',1,0,'',0),(789,'五台县','0',149,0,'',1,0,'',0),(790,'代县','0',149,0,'',1,0,'',0),(791,'繁峙县','0',149,0,'',1,0,'',0),(792,'宁武县','0',149,0,'',1,0,'',0),(793,'静乐县','0',149,0,'',1,0,'',0),(794,'神池县','0',149,0,'',1,0,'',0),(795,'五寨县','0',149,0,'',1,0,'',0),(796,'岢岚县','0',149,0,'',1,0,'',0),(797,'河曲县','0',149,0,'',1,0,'',0),(798,'保德县','0',149,0,'',1,0,'',0),(799,'偏关县','0',149,0,'',1,0,'',0),(800,'原平市','0',149,0,'',1,0,'',0),(801,'尧都区','0',150,0,'',1,0,'',0),(802,'曲沃县','0',150,0,'',1,0,'',0),(803,'翼城县','0',150,0,'',1,0,'',0),(804,'襄汾县','0',150,0,'',1,0,'',0),(805,'洪洞县','0',150,0,'',1,0,'',0),(806,'古县','0',150,0,'',1,0,'',0),(807,'安泽县','0',150,0,'',1,0,'',0),(808,'浮山县','0',150,0,'',1,0,'',0),(809,'吉县','0',150,0,'',1,0,'',0),(810,'乡宁县','0',150,0,'',1,0,'',0),(811,'大宁县','0',150,0,'',1,0,'',0),(812,'隰县','0',150,0,'',1,0,'',0),(813,'永和县','0',150,0,'',1,0,'',0),(814,'蒲县','0',150,0,'',1,0,'',0),(815,'汾西县','0',150,0,'',1,0,'',0),(816,'侯马市','0',150,0,'',1,0,'',0),(817,'霍州市','0',150,0,'',1,0,'',0),(818,'离石区','0',151,0,'',1,0,'',0),(819,'文水县','0',151,0,'',1,0,'',0),(820,'交城县','0',151,0,'',1,0,'',0),(821,'兴县','0',151,0,'',1,0,'',0),(822,'临县','0',151,0,'',1,0,'',0),(823,'柳林县','0',151,0,'',1,0,'',0),(824,'石楼县','0',151,0,'',1,0,'',0),(825,'岚县','0',151,0,'',1,0,'',0),(826,'方山县','0',151,0,'',1,0,'',0),(827,'中阳县','0',151,0,'',1,0,'',0),(828,'交口县','0',151,0,'',1,0,'',0),(829,'孝义市','0',151,0,'',1,0,'',0),(830,'汾阳市','0',151,0,'',1,0,'',0),(831,'新城区','0',152,0,'',1,0,'',0),(832,'回民区','0',152,0,'',1,0,'',0),(833,'玉泉区','0',152,0,'',1,0,'',0),(834,'赛罕区','0',152,0,'',1,0,'',0),(835,'土默特左旗','0',152,0,'',1,0,'',0),(836,'托克托县','0',152,0,'',1,0,'',0),(837,'和林格尔县','0',152,0,'',1,0,'',0),(838,'清水河县','0',152,0,'',1,0,'',0),(839,'武川县','0',152,0,'',1,0,'',0),(840,'东河区','0',153,0,'',1,0,'',0),(841,'昆都仑区','0',153,0,'',1,0,'',0),(842,'青山区','0',153,0,'',1,0,'',0),(843,'石拐区','0',153,0,'',1,0,'',0),(844,'白云矿区','0',153,0,'',1,0,'',0),(845,'九原区','0',153,0,'',1,0,'',0),(846,'土默特右旗','0',153,0,'',1,0,'',0),(847,'固阳县','0',153,0,'',1,0,'',0),(848,'达尔罕茂明安联合旗','0',153,0,'',1,0,'',0),(849,'海勃湾区','0',154,0,'',1,0,'',0),(850,'海南区','0',154,0,'',1,0,'',0),(851,'乌达区','0',154,0,'',1,0,'',0),(852,'红山区','0',155,0,'',1,0,'',0),(853,'元宝山区','0',155,0,'',1,0,'',0),(854,'松山区','0',155,0,'',1,0,'',0),(855,'阿鲁科尔沁旗','0',155,0,'',1,0,'',0),(856,'巴林左旗','0',155,0,'',1,0,'',0),(857,'巴林右旗','0',155,0,'',1,0,'',0),(858,'林西县','0',155,0,'',1,0,'',0),(859,'克什克腾旗','0',155,0,'',1,0,'',0),(860,'翁牛特旗','0',155,0,'',1,0,'',0),(861,'喀喇沁旗','0',155,0,'',1,0,'',0),(862,'宁城县','0',155,0,'',1,0,'',0),(863,'敖汉旗','0',155,0,'',1,0,'',0),(864,'科尔沁区','0',156,0,'',1,0,'',0),(865,'科尔沁左翼中旗','0',156,0,'',1,0,'',0),(866,'科尔沁左翼后旗','0',156,0,'',1,0,'',0),(867,'开鲁县','0',156,0,'',1,0,'',0),(868,'库伦旗','0',156,0,'',1,0,'',0),(869,'奈曼旗','0',156,0,'',1,0,'',0),(870,'扎鲁特旗','0',156,0,'',1,0,'',0),(871,'霍林郭勒市','0',156,0,'',1,0,'',0),(872,'东胜区','0',157,0,'',1,0,'',0),(873,'达拉特旗','0',157,0,'',1,0,'',0),(874,'准格尔旗','0',157,0,'',1,0,'',0),(875,'鄂托克前旗','0',157,0,'',1,0,'',0),(876,'鄂托克旗','0',157,0,'',1,0,'',0),(877,'杭锦旗','0',157,0,'',1,0,'',0),(878,'乌审旗','0',157,0,'',1,0,'',0),(879,'伊金霍洛旗','0',157,0,'',1,0,'',0),(880,'海拉尔区','0',158,0,'',1,0,'',0),(881,'阿荣旗','0',158,0,'',1,0,'',0),(882,'莫力达瓦达斡尔族自治旗','0',158,0,'',1,0,'',0),(883,'鄂伦春自治旗','0',158,0,'',1,0,'',0),(884,'鄂温克族自治旗','0',158,0,'',1,0,'',0),(885,'陈巴尔虎旗','0',158,0,'',1,0,'',0),(886,'新巴尔虎左旗','0',158,0,'',1,0,'',0),(887,'新巴尔虎右旗','0',158,0,'',1,0,'',0),(888,'满洲里市','0',158,0,'',1,0,'',0),(889,'牙克石市','0',158,0,'',1,0,'',0),(890,'扎兰屯市','0',158,0,'',1,0,'',0),(891,'额尔古纳市','0',158,0,'',1,0,'',0),(892,'根河市','0',158,0,'',1,0,'',0),(893,'临河区','0',159,0,'',1,0,'',0),(894,'五原县','0',159,0,'',1,0,'',0),(895,'磴口县','0',159,0,'',1,0,'',0),(896,'乌拉特前旗','0',159,0,'',1,0,'',0),(897,'乌拉特中旗','0',159,0,'',1,0,'',0),(898,'乌拉特后旗','0',159,0,'',1,0,'',0),(899,'杭锦后旗','0',159,0,'',1,0,'',0),(900,'集宁区','0',160,0,'',1,0,'',0),(901,'卓资县','0',160,0,'',1,0,'',0),(902,'化德县','0',160,0,'',1,0,'',0),(903,'商都县','0',160,0,'',1,0,'',0),(904,'兴和县','0',160,0,'',1,0,'',0),(905,'凉城县','0',160,0,'',1,0,'',0),(906,'察哈尔右翼前旗','0',160,0,'',1,0,'',0),(907,'察哈尔右翼中旗','0',160,0,'',1,0,'',0),(908,'察哈尔右翼后旗','0',160,0,'',1,0,'',0),(909,'四子王旗','0',160,0,'',1,0,'',0),(910,'丰镇市','0',160,0,'',1,0,'',0),(911,'乌兰浩特市','0',161,0,'',1,0,'',0),(912,'阿尔山市','0',161,0,'',1,0,'',0),(913,'科尔沁右翼前旗','0',161,0,'',1,0,'',0),(914,'科尔沁右翼中旗','0',161,0,'',1,0,'',0),(915,'扎赉特旗','0',161,0,'',1,0,'',0),(916,'突泉县','0',161,0,'',1,0,'',0),(917,'二连浩特市','0',162,0,'',1,0,'',0),(918,'锡林浩特市','0',162,0,'',1,0,'',0),(919,'阿巴嘎旗','0',162,0,'',1,0,'',0),(920,'苏尼特左旗','0',162,0,'',1,0,'',0),(921,'苏尼特右旗','0',162,0,'',1,0,'',0),(922,'东乌珠穆沁旗','0',162,0,'',1,0,'',0),(923,'西乌珠穆沁旗','0',162,0,'',1,0,'',0),(924,'太仆寺旗','0',162,0,'',1,0,'',0),(925,'镶黄旗','0',162,0,'',1,0,'',0),(926,'正镶白旗','0',162,0,'',1,0,'',0),(927,'正蓝旗','0',162,0,'',1,0,'',0),(928,'多伦县','0',162,0,'',1,0,'',0),(929,'阿拉善左旗','0',163,0,'',1,0,'',0),(930,'阿拉善右旗','0',163,0,'',1,0,'',0),(931,'额济纳旗','0',163,0,'',1,0,'',0),(932,'和平区','0',164,0,'',1,0,'',0),(933,'沈河区','0',164,0,'',1,0,'',0),(934,'大东区','0',164,0,'',1,0,'',0),(935,'皇姑区','0',164,0,'',1,0,'',0),(936,'铁西区','0',164,0,'',1,0,'',0),(937,'苏家屯区','0',164,0,'',1,0,'',0),(938,'东陵区','0',164,0,'',1,0,'',0),(939,'新城子区','0',164,0,'',1,0,'',0),(940,'于洪区','0',164,0,'',1,0,'',0),(941,'辽中县','0',164,0,'',1,0,'',0),(942,'康平县','0',164,0,'',1,0,'',0),(943,'法库县','0',164,0,'',1,0,'',0),(944,'新民市','0',164,0,'',1,0,'',0),(945,'中山区','0',165,0,'',1,0,'',0),(946,'西岗区','0',165,0,'',1,0,'',0),(947,'沙河口区','0',165,0,'',1,0,'',0),(948,'甘井子区','0',165,0,'',1,0,'',0),(949,'旅顺口区','0',165,0,'',1,0,'',0),(950,'金州区','0',165,0,'',1,0,'',0),(951,'长海县','0',165,0,'',1,0,'',0),(952,'瓦房店市','0',165,0,'',1,0,'',0),(953,'普兰店市','0',165,0,'',1,0,'',0),(954,'庄河市','0',165,0,'',1,0,'',0),(955,'铁东区','0',166,0,'',1,0,'',0),(956,'铁西区','0',166,0,'',1,0,'',0),(957,'立山区','0',166,0,'',1,0,'',0),(958,'千山区','0',166,0,'',1,0,'',0),(959,'台安县','0',166,0,'',1,0,'',0),(960,'岫岩满族自治县','0',166,0,'',1,0,'',0),(961,'海城市','0',166,0,'',1,0,'',0),(962,'新抚区','0',167,0,'',1,0,'',0),(963,'东洲区','0',167,0,'',1,0,'',0),(964,'望花区','0',167,0,'',1,0,'',0),(965,'顺城区','0',167,0,'',1,0,'',0),(966,'抚顺县','0',167,0,'',1,0,'',0),(967,'新宾满族自治县','0',167,0,'',1,0,'',0),(968,'清原满族自治县','0',167,0,'',1,0,'',0),(969,'平山区','0',168,0,'',1,0,'',0),(970,'溪湖区','0',168,0,'',1,0,'',0),(971,'明山区','0',168,0,'',1,0,'',0),(972,'南芬区','0',168,0,'',1,0,'',0),(973,'本溪满族自治县','0',168,0,'',1,0,'',0),(974,'桓仁满族自治县','0',168,0,'',1,0,'',0),(975,'元宝区','0',169,0,'',1,0,'',0),(976,'振兴区','0',169,0,'',1,0,'',0),(977,'振安区','0',169,0,'',1,0,'',0),(978,'宽甸满族自治县','0',169,0,'',1,0,'',0),(979,'东港市','0',169,0,'',1,0,'',0),(980,'凤城市','0',169,0,'',1,0,'',0),(981,'古塔区','0',170,0,'',1,0,'',0),(982,'凌河区','0',170,0,'',1,0,'',0),(983,'太和区','0',170,0,'',1,0,'',0),(984,'黑山县','0',170,0,'',1,0,'',0),(985,'义县','0',170,0,'',1,0,'',0),(986,'凌海市','0',170,0,'',1,0,'',0),(987,'北镇市','0',170,0,'',1,0,'',0),(988,'站前区','0',171,0,'',1,0,'',0),(989,'西市区','0',171,0,'',1,0,'',0),(990,'鲅鱼圈区','0',171,0,'',1,0,'',0),(991,'老边区','0',171,0,'',1,0,'',0),(992,'盖州市','0',171,0,'',1,0,'',0),(993,'大石桥市','0',171,0,'',1,0,'',0),(994,'海州区','0',172,0,'',1,0,'',0),(995,'新邱区','0',172,0,'',1,0,'',0),(996,'太平区','0',172,0,'',1,0,'',0),(997,'清河门区','0',172,0,'',1,0,'',0),(998,'细河区','0',172,0,'',1,0,'',0),(999,'阜新蒙古族自治县','0',172,0,'',1,0,'',0),(1000,'彰武县','0',172,0,'',1,0,'',0),(1001,'白塔区','0',173,0,'',1,0,'',0),(1002,'文圣区','0',173,0,'',1,0,'',0),(1003,'宏伟区','0',173,0,'',1,0,'',0),(1004,'弓长岭区','0',173,0,'',1,0,'',0),(1005,'太子河区','0',173,0,'',1,0,'',0),(1006,'辽阳县','0',173,0,'',1,0,'',0),(1007,'灯塔市','0',173,0,'',1,0,'',0),(1008,'双台子区','0',174,0,'',1,0,'',0),(1009,'兴隆台区','0',174,0,'',1,0,'',0),(1010,'大洼县','0',174,0,'',1,0,'',0),(1011,'盘山县','0',174,0,'',1,0,'',0),(1012,'银州区','0',175,0,'',1,0,'',0),(1013,'清河区','0',175,0,'',1,0,'',0),(1014,'铁岭县','0',175,0,'',1,0,'',0),(1015,'西丰县','0',175,0,'',1,0,'',0),(1016,'昌图县','0',175,0,'',1,0,'',0),(1017,'调兵山市','0',175,0,'',1,0,'',0),(1018,'开原市','0',175,0,'',1,0,'',0),(1019,'双塔区','0',176,0,'',1,0,'',0),(1020,'龙城区','0',176,0,'',1,0,'',0),(1021,'朝阳县','0',176,0,'',1,0,'',0),(1022,'建平县','0',176,0,'',1,0,'',0),(1023,'喀喇沁左翼蒙古族自治县','0',176,0,'',1,0,'',0),(1024,'北票市','0',176,0,'',1,0,'',0),(1025,'凌源市','0',176,0,'',1,0,'',0),(1026,'连山区','0',177,0,'',1,0,'',0),(1027,'龙港区','0',177,0,'',1,0,'',0),(1028,'南票区','0',177,0,'',1,0,'',0),(1029,'绥中县','0',177,0,'',1,0,'',0),(1030,'建昌县','0',177,0,'',1,0,'',0),(1031,'兴城市','0',177,0,'',1,0,'',0),(1032,'南关区','0',178,0,'',1,0,'',0),(1033,'宽城区','0',178,0,'',1,0,'',0),(1034,'朝阳区','0',178,0,'',1,0,'',0),(1035,'二道区','0',178,0,'',1,0,'',0),(1036,'绿园区','0',178,0,'',1,0,'',0),(1037,'双阳区','0',178,0,'',1,0,'',0),(1038,'农安县','0',178,0,'',1,0,'',0),(1039,'九台市','0',178,0,'',1,0,'',0),(1040,'榆树市','0',178,0,'',1,0,'',0),(1041,'德惠市','0',178,0,'',1,0,'',0),(1042,'昌邑区','0',179,0,'',1,0,'',0),(1043,'龙潭区','0',179,0,'',1,0,'',0),(1044,'船营区','0',179,0,'',1,0,'',0),(1045,'丰满区','0',179,0,'',1,0,'',0),(1046,'永吉县','0',179,0,'',1,0,'',0),(1047,'蛟河市','0',179,0,'',1,0,'',0),(1048,'桦甸市','0',179,0,'',1,0,'',0),(1049,'舒兰市','0',179,0,'',1,0,'',0),(1050,'磐石市','0',179,0,'',1,0,'',0),(1051,'铁西区','0',180,0,'',1,0,'',0),(1052,'铁东区','0',180,0,'',1,0,'',0),(1053,'梨树县','0',180,0,'',1,0,'',0),(1054,'伊通满族自治县','0',180,0,'',1,0,'',0),(1055,'公主岭市','0',180,0,'',1,0,'',0),(1056,'双辽市','0',180,0,'',1,0,'',0),(1057,'龙山区','0',181,0,'',1,0,'',0),(1058,'西安区','0',181,0,'',1,0,'',0),(1059,'东丰县','0',181,0,'',1,0,'',0),(1060,'东辽县','0',181,0,'',1,0,'',0),(1061,'东昌区','0',182,0,'',1,0,'',0),(1062,'二道江区','0',182,0,'',1,0,'',0),(1063,'通化县','0',182,0,'',1,0,'',0),(1064,'辉南县','0',182,0,'',1,0,'',0),(1065,'柳河县','0',182,0,'',1,0,'',0),(1066,'梅河口市','0',182,0,'',1,0,'',0),(1067,'集安市','0',182,0,'',1,0,'',0),(1068,'八道江区','0',183,0,'',1,0,'',0),(1069,'抚松县','0',183,0,'',1,0,'',0),(1070,'靖宇县','0',183,0,'',1,0,'',0),(1071,'长白朝鲜族自治县','0',183,0,'',1,0,'',0),(1072,'江源县','0',183,0,'',1,0,'',0),(1073,'临江市','0',183,0,'',1,0,'',0),(1074,'宁江区','0',184,0,'',1,0,'',0),(1075,'前郭尔罗斯蒙古族自治县','0',184,0,'',1,0,'',0),(1076,'长岭县','0',184,0,'',1,0,'',0),(1077,'乾安县','0',184,0,'',1,0,'',0),(1078,'扶余县','0',184,0,'',1,0,'',0),(1079,'洮北区','0',185,0,'',1,0,'',0),(1080,'镇赉县','0',185,0,'',1,0,'',0),(1081,'通榆县','0',185,0,'',1,0,'',0),(1082,'洮南市','0',185,0,'',1,0,'',0),(1083,'大安市','0',185,0,'',1,0,'',0),(1084,'延吉市','0',186,0,'',1,0,'',0),(1085,'图们市','0',186,0,'',1,0,'',0),(1086,'敦化市','0',186,0,'',1,0,'',0),(1087,'珲春市','0',186,0,'',1,0,'',0),(1088,'龙井市','0',186,0,'',1,0,'',0),(1089,'和龙市','0',186,0,'',1,0,'',0),(1090,'汪清县','0',186,0,'',1,0,'',0),(1091,'安图县','0',186,0,'',1,0,'',0),(1092,'道里区','0',187,0,'',1,0,'',0),(1093,'南岗区','0',187,0,'',1,0,'',0),(1094,'道外区','0',187,0,'',1,0,'',0),(1095,'香坊区','0',187,0,'',1,0,'',0),(1096,'动力区','0',187,0,'',1,0,'',0),(1097,'平房区','0',187,0,'',1,0,'',0),(1098,'松北区','0',187,0,'',1,0,'',0),(1099,'呼兰区','0',187,0,'',1,0,'',0),(1100,'依兰县','0',187,0,'',1,0,'',0),(1101,'方正县','0',187,0,'',1,0,'',0),(1102,'宾县','0',187,0,'',1,0,'',0),(1103,'巴彦县','0',187,0,'',1,0,'',0),(1104,'木兰县','0',187,0,'',1,0,'',0),(1105,'通河县','0',187,0,'',1,0,'',0),(1106,'延寿县','0',187,0,'',1,0,'',0),(1107,'阿城市','0',187,0,'',1,0,'',0),(1108,'双城市','0',187,0,'',1,0,'',0),(1109,'尚志市','0',187,0,'',1,0,'',0),(1110,'五常市','0',187,0,'',1,0,'',0),(1111,'龙沙区','0',188,0,'',1,0,'',0),(1112,'建华区','0',188,0,'',1,0,'',0),(1113,'铁锋区','0',188,0,'',1,0,'',0),(1114,'昂昂溪区','0',188,0,'',1,0,'',0),(1115,'富拉尔基区','0',188,0,'',1,0,'',0),(1116,'碾子山区','0',188,0,'',1,0,'',0),(1117,'梅里斯达斡尔族区','0',188,0,'',1,0,'',0),(1118,'龙江县','0',188,0,'',1,0,'',0),(1119,'依安县','0',188,0,'',1,0,'',0),(1120,'泰来县','0',188,0,'',1,0,'',0),(1121,'甘南县','0',188,0,'',1,0,'',0),(1122,'富裕县','0',188,0,'',1,0,'',0),(1123,'克山县','0',188,0,'',1,0,'',0),(1124,'克东县','0',188,0,'',1,0,'',0),(1125,'拜泉县','0',188,0,'',1,0,'',0),(1126,'讷河市','0',188,0,'',1,0,'',0),(1127,'鸡冠区','0',189,0,'',1,0,'',0),(1128,'恒山区','0',189,0,'',1,0,'',0),(1129,'滴道区','0',189,0,'',1,0,'',0),(1130,'梨树区','0',189,0,'',1,0,'',0),(1131,'城子河区','0',189,0,'',1,0,'',0),(1132,'麻山区','0',189,0,'',1,0,'',0),(1133,'鸡东县','0',189,0,'',1,0,'',0),(1134,'虎林市','0',189,0,'',1,0,'',0),(1135,'密山市','0',189,0,'',1,0,'',0),(1136,'向阳区','0',190,0,'',1,0,'',0),(1137,'工农区','0',190,0,'',1,0,'',0),(1138,'南山区','0',190,0,'',1,0,'',0),(1139,'兴安区','0',190,0,'',1,0,'',0),(1140,'东山区','0',190,0,'',1,0,'',0),(1141,'兴山区','0',190,0,'',1,0,'',0),(1142,'萝北县','0',190,0,'',1,0,'',0),(1143,'绥滨县','0',190,0,'',1,0,'',0),(1144,'尖山区','0',191,0,'',1,0,'',0),(1145,'岭东区','0',191,0,'',1,0,'',0),(1146,'四方台区','0',191,0,'',1,0,'',0),(1147,'宝山区','0',191,0,'',1,0,'',0),(1148,'集贤县','0',191,0,'',1,0,'',0),(1149,'友谊县','0',191,0,'',1,0,'',0),(1150,'宝清县','0',191,0,'',1,0,'',0),(1151,'饶河县','0',191,0,'',1,0,'',0),(1152,'萨尔图区','0',192,0,'',1,0,'',0),(1153,'龙凤区','0',192,0,'',1,0,'',0),(1154,'让胡路区','0',192,0,'',1,0,'',0),(1155,'红岗区','0',192,0,'',1,0,'',0),(1156,'大同区','0',192,0,'',1,0,'',0),(1157,'肇州县','0',192,0,'',1,0,'',0),(1158,'肇源县','0',192,0,'',1,0,'',0),(1159,'林甸县','0',192,0,'',1,0,'',0),(1160,'杜尔伯特蒙古族自治县','0',192,0,'',1,0,'',0),(1161,'伊春区','0',193,0,'',1,0,'',0),(1162,'南岔区','0',193,0,'',1,0,'',0),(1163,'友好区','0',193,0,'',1,0,'',0),(1164,'西林区','0',193,0,'',1,0,'',0),(1165,'翠峦区','0',193,0,'',1,0,'',0),(1166,'新青区','0',193,0,'',1,0,'',0),(1167,'美溪区','0',193,0,'',1,0,'',0),(1168,'金山屯区','0',193,0,'',1,0,'',0),(1169,'五营区','0',193,0,'',1,0,'',0),(1170,'乌马河区','0',193,0,'',1,0,'',0),(1171,'汤旺河区','0',193,0,'',1,0,'',0),(1172,'带岭区','0',193,0,'',1,0,'',0),(1173,'乌伊岭区','0',193,0,'',1,0,'',0),(1174,'红星区','0',193,0,'',1,0,'',0),(1175,'上甘岭区','0',193,0,'',1,0,'',0),(1176,'嘉荫县','0',193,0,'',1,0,'',0),(1177,'铁力市','0',193,0,'',1,0,'',0),(1178,'永红区','0',194,0,'',1,0,'',0),(1179,'向阳区','0',194,0,'',1,0,'',0),(1180,'前进区','0',194,0,'',1,0,'',0),(1181,'东风区','0',194,0,'',1,0,'',0),(1182,'郊区','0',194,0,'',1,0,'',0),(1183,'桦南县','0',194,0,'',1,0,'',0),(1184,'桦川县','0',194,0,'',1,0,'',0),(1185,'汤原县','0',194,0,'',1,0,'',0),(1186,'抚远县','0',194,0,'',1,0,'',0),(1187,'同江市','0',194,0,'',1,0,'',0),(1188,'富锦市','0',194,0,'',1,0,'',0),(1189,'新兴区','0',195,0,'',1,0,'',0),(1190,'桃山区','0',195,0,'',1,0,'',0),(1191,'茄子河区','0',195,0,'',1,0,'',0),(1192,'勃利县','0',195,0,'',1,0,'',0),(1193,'东安区','0',196,0,'',1,0,'',0),(1194,'阳明区','0',196,0,'',1,0,'',0),(1195,'爱民区','0',196,0,'',1,0,'',0),(1196,'西安区','0',196,0,'',1,0,'',0),(1197,'东宁县','0',196,0,'',1,0,'',0),(1198,'林口县','0',196,0,'',1,0,'',0),(1199,'绥芬河市','0',196,0,'',1,0,'',0),(1200,'海林市','0',196,0,'',1,0,'',0),(1201,'宁安市','0',196,0,'',1,0,'',0),(1202,'穆棱市','0',196,0,'',1,0,'',0),(1203,'爱辉区','0',197,0,'',1,0,'',0),(1204,'嫩江县','0',197,0,'',1,0,'',0),(1205,'逊克县','0',197,0,'',1,0,'',0),(1206,'孙吴县','0',197,0,'',1,0,'',0),(1207,'北安市','0',197,0,'',1,0,'',0),(1208,'五大连池市','0',197,0,'',1,0,'',0),(1209,'北林区','0',198,0,'',1,0,'',0),(1210,'望奎县','0',198,0,'',1,0,'',0),(1211,'兰西县','0',198,0,'',1,0,'',0),(1212,'青冈县','0',198,0,'',1,0,'',0),(1213,'庆安县','0',198,0,'',1,0,'',0),(1214,'明水县','0',198,0,'',1,0,'',0),(1215,'绥棱县','0',198,0,'',1,0,'',0),(1216,'安达市','0',198,0,'',1,0,'',0),(1217,'肇东市','0',198,0,'',1,0,'',0),(1218,'海伦市','0',198,0,'',1,0,'',0),(1219,'呼玛县','0',199,0,'',1,0,'',0),(1220,'塔河县','0',199,0,'',1,0,'',0),(1221,'漠河县','0',199,0,'',1,0,'',0),(1222,'玄武区','0',200,0,'',1,0,'',0),(1223,'白下区','0',200,0,'',1,0,'',0),(1224,'秦淮区','0',200,0,'',1,0,'',0),(1225,'建邺区','0',200,0,'',1,0,'',0),(1226,'鼓楼区','0',200,0,'',1,0,'',0),(1227,'下关区','0',200,0,'',1,0,'',0),(1228,'浦口区','0',200,0,'',1,0,'',0),(1229,'栖霞区','0',200,0,'',1,0,'',0),(1230,'雨花台区','0',200,0,'',1,0,'',0),(1231,'江宁区','0',200,0,'',1,0,'',0),(1232,'六合区','0',200,0,'',1,0,'',0),(1233,'溧水县','0',200,0,'',1,0,'',0),(1234,'高淳县','0',200,0,'',1,0,'',0),(1235,'崇安区','0',201,0,'',1,0,'',0),(1236,'南长区','0',201,0,'',1,0,'',0),(1237,'北塘区','0',201,0,'',1,0,'',0),(1238,'锡山区','0',201,0,'',1,0,'',0),(1239,'惠山区','0',201,0,'',1,0,'',0),(1240,'滨湖区','0',201,0,'',1,0,'',0),(1241,'江阴市','0',201,0,'',1,0,'',0),(1242,'宜兴市','0',201,0,'',1,0,'',0),(1243,'鼓楼区','0',202,0,'',1,0,'',0),(1244,'云龙区','0',202,0,'',1,0,'',0),(1245,'九里区','0',202,0,'',1,0,'',0),(1246,'贾汪区','0',202,0,'',1,0,'',0),(1247,'泉山区','0',202,0,'',1,0,'',0),(1248,'丰县','0',202,0,'',1,0,'',0),(1249,'沛县','0',202,0,'',1,0,'',0),(1250,'铜山县','0',202,0,'',1,0,'',0),(1251,'睢宁县','0',202,0,'',1,0,'',0),(1252,'新沂市','0',202,0,'',1,0,'',0),(1253,'邳州市','0',202,0,'',1,0,'',0),(1254,'天宁区','0',203,0,'',1,0,'',0),(1255,'钟楼区','0',203,0,'',1,0,'',0),(1256,'戚墅堰区','0',203,0,'',1,0,'',0),(1257,'新北区','0',203,0,'',1,0,'',0),(1258,'武进区','0',203,0,'',1,0,'',0),(1259,'溧阳市','0',203,0,'',1,0,'',0),(1260,'金坛市','0',203,0,'',1,0,'',0),(1261,'沧浪区','0',204,0,'',1,0,'',0),(1262,'平江区','0',204,0,'',1,0,'',0),(1263,'金阊区','0',204,0,'',1,0,'',0),(1264,'虎丘区','0',204,0,'',1,0,'',0),(1265,'吴中区','0',204,0,'',1,0,'',0),(1266,'相城区','0',204,0,'',1,0,'',0),(1267,'常熟市','0',204,0,'',1,0,'',0),(1268,'张家港市','0',204,0,'',1,0,'',0),(1269,'昆山市','0',204,0,'',1,0,'',0),(1270,'吴江市','0',204,0,'',1,0,'',0),(1271,'太仓市','0',204,0,'',1,0,'',0),(1272,'崇川区','0',205,0,'',1,0,'',0),(1273,'港闸区','0',205,0,'',1,0,'',0),(1274,'海安县','0',205,0,'',1,0,'',0),(1275,'如东县','0',205,0,'',1,0,'',0),(1276,'启东市','0',205,0,'',1,0,'',0),(1277,'如皋市','0',205,0,'',1,0,'',0),(1278,'通州市','0',205,0,'',1,0,'',0),(1279,'海门市','0',205,0,'',1,0,'',0),(1280,'连云区','0',206,0,'',1,0,'',0),(1281,'新浦区','0',206,0,'',1,0,'',0),(1282,'海州区','0',206,0,'',1,0,'',0),(1283,'赣榆县','0',206,0,'',1,0,'',0),(1284,'东海县','0',206,0,'',1,0,'',0),(1285,'灌云县','0',206,0,'',1,0,'',0),(1286,'灌南县','0',206,0,'',1,0,'',0),(1287,'清河区','0',207,0,'',1,0,'',0),(1288,'楚州区','0',207,0,'',1,0,'',0),(1289,'淮阴区','0',207,0,'',1,0,'',0),(1290,'清浦区','0',207,0,'',1,0,'',0),(1291,'涟水县','0',207,0,'',1,0,'',0),(1292,'洪泽县','0',207,0,'',1,0,'',0),(1293,'盱眙县','0',207,0,'',1,0,'',0),(1294,'金湖县','0',207,0,'',1,0,'',0),(1295,'亭湖区','0',208,0,'',1,0,'',0),(1296,'盐都区','0',208,0,'',1,0,'',0),(1297,'响水县','0',208,0,'',1,0,'',0),(1298,'滨海县','0',208,0,'',1,0,'',0),(1299,'阜宁县','0',208,0,'',1,0,'',0),(1300,'射阳县','0',208,0,'',1,0,'',0),(1301,'建湖县','0',208,0,'',1,0,'',0),(1302,'东台市','0',208,0,'',1,0,'',0),(1303,'大丰市','0',208,0,'',1,0,'',0),(1304,'广陵区','0',209,0,'',1,0,'',0),(1305,'邗江区','0',209,0,'',1,0,'',0),(1306,'维扬区','0',209,0,'',1,0,'',0),(1307,'宝应县','0',209,0,'',1,0,'',0),(1308,'仪征市','0',209,0,'',1,0,'',0),(1309,'高邮市','0',209,0,'',1,0,'',0),(1310,'江都市','0',209,0,'',1,0,'',0),(1311,'京口区','0',210,0,'',1,0,'',0),(1312,'润州区','0',210,0,'',1,0,'',0),(1313,'丹徒区','0',210,0,'',1,0,'',0),(1314,'丹阳市','0',210,0,'',1,0,'',0),(1315,'扬中市','0',210,0,'',1,0,'',0),(1316,'句容市','0',210,0,'',1,0,'',0),(1317,'海陵区','0',211,0,'',1,0,'',0),(1318,'高港区','0',211,0,'',1,0,'',0),(1319,'兴化市','0',211,0,'',1,0,'',0),(1320,'靖江市','0',211,0,'',1,0,'',0),(1321,'泰兴市','0',211,0,'',1,0,'',0),(1322,'姜堰市','0',211,0,'',1,0,'',0),(1323,'宿城区','0',212,0,'',1,0,'',0),(1324,'宿豫区','0',212,0,'',1,0,'',0),(1325,'沭阳县','0',212,0,'',1,0,'',0),(1326,'泗阳县','0',212,0,'',1,0,'',0),(1327,'泗洪县','0',212,0,'',1,0,'',0),(1328,'上城区','0',213,0,'',1,0,'',0),(1329,'下城区','0',213,0,'',1,0,'',0),(1330,'江干区','0',213,0,'',1,0,'',0),(1331,'拱墅区','0',213,0,'',1,0,'',0),(1332,'西湖区','0',213,0,'',1,0,'',0),(1333,'滨江区','0',213,0,'',1,0,'',0),(1334,'萧山区','0',213,0,'',1,0,'',0),(1335,'余杭区','0',213,0,'',1,0,'',0),(1336,'桐庐县','0',213,0,'',1,0,'',0),(1337,'淳安县','0',213,0,'',1,0,'',0),(1338,'建德市','0',213,0,'',1,0,'',0),(1339,'富阳市','0',213,0,'',1,0,'',0),(1340,'临安市','0',213,0,'',1,0,'',0),(1341,'海曙区','0',214,0,'',1,0,'',0),(1342,'江东区','0',214,0,'',1,0,'',0),(1343,'江北区','0',214,0,'',1,0,'',0),(1344,'北仑区','0',214,0,'',1,0,'',0),(1345,'镇海区','0',214,0,'',1,0,'',0),(1346,'鄞州区','0',214,0,'',1,0,'',0),(1347,'象山县','0',214,0,'',1,0,'',0),(1348,'宁海县','0',214,0,'',1,0,'',0),(1349,'余姚市','0',214,0,'',1,0,'',0),(1350,'慈溪市','0',214,0,'',1,0,'',0),(1351,'奉化市','0',214,0,'',1,0,'',0),(1352,'鹿城区','0',215,0,'',1,0,'',0),(1353,'龙湾区','0',215,0,'',1,0,'',0),(1354,'瓯海区','0',215,0,'',1,0,'',0),(1355,'洞头县','0',215,0,'',1,0,'',0),(1356,'永嘉县','0',215,0,'',1,0,'',0),(1357,'平阳县','0',215,0,'',1,0,'',0),(1358,'苍南县','0',215,0,'',1,0,'',0),(1359,'文成县','0',215,0,'',1,0,'',0),(1360,'泰顺县','0',215,0,'',1,0,'',0),(1361,'瑞安市','0',215,0,'',1,0,'',0),(1362,'乐清市','0',215,0,'',1,0,'',0),(1363,'秀城区','0',216,0,'',1,0,'',0),(1364,'秀洲区','0',216,0,'',1,0,'',0),(1365,'嘉善县','0',216,0,'',1,0,'',0),(1366,'海盐县','0',216,0,'',1,0,'',0),(1367,'海宁市','0',216,0,'',1,0,'',0),(1368,'平湖市','0',216,0,'',1,0,'',0),(1369,'桐乡市','0',216,0,'',1,0,'',0),(1370,'吴兴区','0',217,0,'',1,0,'',0),(1371,'南浔区','0',217,0,'',1,0,'',0),(1372,'德清县','0',217,0,'',1,0,'',0),(1373,'长兴县','0',217,0,'',1,0,'',0),(1374,'安吉县','0',217,0,'',1,0,'',0),(1375,'越城区','0',218,0,'',1,0,'',0),(1376,'绍兴县','0',218,0,'',1,0,'',0),(1377,'新昌县','0',218,0,'',1,0,'',0),(1378,'诸暨市','0',218,0,'',1,0,'',0),(1379,'上虞市','0',218,0,'',1,0,'',0),(1380,'嵊州市','0',218,0,'',1,0,'',0),(1381,'婺城区','0',219,0,'',1,0,'',0),(1382,'金东区','0',219,0,'',1,0,'',0),(1383,'武义县','0',219,0,'',1,0,'',0),(1384,'浦江县','0',219,0,'',1,0,'',0),(1385,'磐安县','0',219,0,'',1,0,'',0),(1386,'兰溪市','0',219,0,'',1,0,'',0),(1387,'义乌市','0',219,0,'',1,0,'',0),(1388,'东阳市','0',219,0,'',1,0,'',0),(1389,'永康市','0',219,0,'',1,0,'',0),(1390,'柯城区','0',220,0,'',1,0,'',0),(1391,'衢江区','0',220,0,'',1,0,'',0),(1392,'常山县','0',220,0,'',1,0,'',0),(1393,'开化县','0',220,0,'',1,0,'',0),(1394,'龙游县','0',220,0,'',1,0,'',0),(1395,'江山市','0',220,0,'',1,0,'',0),(1396,'定海区','0',221,0,'',1,0,'',0),(1397,'普陀区','0',221,0,'',1,0,'',0),(1398,'岱山县','0',221,0,'',1,0,'',0),(1399,'嵊泗县','0',221,0,'',1,0,'',0),(1400,'椒江区','0',222,0,'',1,0,'',0),(1401,'黄岩区','0',222,0,'',1,0,'',0),(1402,'路桥区','0',222,0,'',1,0,'',0),(1403,'玉环县','0',222,0,'',1,0,'',0),(1404,'三门县','0',222,0,'',1,0,'',0),(1405,'天台县','0',222,0,'',1,0,'',0),(1406,'仙居县','0',222,0,'',1,0,'',0),(1407,'温岭市','0',222,0,'',1,0,'',0),(1408,'临海市','0',222,0,'',1,0,'',0),(1409,'莲都区','0',223,0,'',1,0,'',0),(1410,'青田县','0',223,0,'',1,0,'',0),(1411,'缙云县','0',223,0,'',1,0,'',0),(1412,'遂昌县','0',223,0,'',1,0,'',0),(1413,'松阳县','0',223,0,'',1,0,'',0),(1414,'云和县','0',223,0,'',1,0,'',0),(1415,'庆元县','0',223,0,'',1,0,'',0),(1416,'景宁畲族自治县','0',223,0,'',1,0,'',0),(1417,'龙泉市','0',223,0,'',1,0,'',0),(1418,'瑶海区','0',224,0,'',1,0,'',0),(1419,'庐阳区','0',224,0,'',1,0,'',0),(1420,'蜀山区','0',224,0,'',1,0,'',0),(1421,'包河区','0',224,0,'',1,0,'',0),(1422,'长丰县','0',224,0,'',1,0,'',0),(1423,'肥东县','0',224,0,'',1,0,'',0),(1424,'肥西县','0',224,0,'',1,0,'',0),(1425,'镜湖区','0',225,0,'',1,0,'',0),(1426,'弋江区','0',225,0,'',1,0,'',0),(1427,'鸠江区','0',225,0,'',1,0,'',0),(1428,'三山区','0',225,0,'',1,0,'',0),(1429,'芜湖县','0',225,0,'',1,0,'',0),(1430,'繁昌县','0',225,0,'',1,0,'',0),(1431,'南陵县','0',225,0,'',1,0,'',0),(1432,'龙子湖区','0',226,0,'',1,0,'',0),(1433,'蚌山区','0',226,0,'',1,0,'',0),(1434,'禹会区','0',226,0,'',1,0,'',0),(1435,'淮上区','0',226,0,'',1,0,'',0),(1436,'怀远县','0',226,0,'',1,0,'',0),(1437,'五河县','0',226,0,'',1,0,'',0),(1438,'固镇县','0',226,0,'',1,0,'',0),(1439,'大通区','0',227,0,'',1,0,'',0),(1440,'田家庵区','0',227,0,'',1,0,'',0),(1441,'谢家集区','0',227,0,'',1,0,'',0),(1442,'八公山区','0',227,0,'',1,0,'',0),(1443,'潘集区','0',227,0,'',1,0,'',0),(1444,'凤台县','0',227,0,'',1,0,'',0),(1445,'金家庄区','0',228,0,'',1,0,'',0),(1446,'花山区','0',228,0,'',1,0,'',0),(1447,'雨山区','0',228,0,'',1,0,'',0),(1448,'当涂县','0',228,0,'',1,0,'',0),(1449,'杜集区','0',229,0,'',1,0,'',0),(1450,'相山区','0',229,0,'',1,0,'',0),(1451,'烈山区','0',229,0,'',1,0,'',0),(1452,'濉溪县','0',229,0,'',1,0,'',0),(1453,'铜官山区','0',230,0,'',1,0,'',0),(1454,'狮子山区','0',230,0,'',1,0,'',0),(1455,'郊区','0',230,0,'',1,0,'',0),(1456,'铜陵县','0',230,0,'',1,0,'',0),(1457,'迎江区','0',231,0,'',1,0,'',0),(1458,'大观区','0',231,0,'',1,0,'',0),(1459,'宜秀区','0',231,0,'',1,0,'',0),(1460,'怀宁县','0',231,0,'',1,0,'',0),(1461,'枞阳县','0',231,0,'',1,0,'',0),(1462,'潜山县','0',231,0,'',1,0,'',0),(1463,'太湖县','0',231,0,'',1,0,'',0),(1464,'宿松县','0',231,0,'',1,0,'',0),(1465,'望江县','0',231,0,'',1,0,'',0),(1466,'岳西县','0',231,0,'',1,0,'',0),(1467,'桐城市','0',231,0,'',1,0,'',0),(1468,'屯溪区','0',232,0,'',1,0,'',0),(1469,'黄山区','0',232,0,'',1,0,'',0),(1470,'徽州区','0',232,0,'',1,0,'',0),(1471,'歙县','0',232,0,'',1,0,'',0),(1472,'休宁县','0',232,0,'',1,0,'',0),(1473,'黟县','0',232,0,'',1,0,'',0),(1474,'祁门县','0',232,0,'',1,0,'',0),(1475,'琅琊区','0',233,0,'',1,0,'',0),(1476,'南谯区','0',233,0,'',1,0,'',0),(1477,'来安县','0',233,0,'',1,0,'',0),(1478,'全椒县','0',233,0,'',1,0,'',0),(1479,'定远县','0',233,0,'',1,0,'',0),(1480,'凤阳县','0',233,0,'',1,0,'',0),(1481,'天长市','0',233,0,'',1,0,'',0),(1482,'明光市','0',233,0,'',1,0,'',0),(1483,'颍州区','0',234,0,'',1,0,'',0),(1484,'颍东区','0',234,0,'',1,0,'',0),(1485,'颍泉区','0',234,0,'',1,0,'',0),(1486,'临泉县','0',234,0,'',1,0,'',0),(1487,'太和县','0',234,0,'',1,0,'',0),(1488,'阜南县','0',234,0,'',1,0,'',0),(1489,'颍上县','0',234,0,'',1,0,'',0),(1490,'界首市','0',234,0,'',1,0,'',0),(1491,'埇桥区','0',235,0,'',1,0,'',0),(1492,'砀山县','0',235,0,'',1,0,'',0),(1493,'萧县','0',235,0,'',1,0,'',0),(1494,'灵璧县','0',235,0,'',1,0,'',0),(1495,'泗县','0',235,0,'',1,0,'',0),(1496,'居巢区','0',236,0,'',1,0,'',0),(1497,'庐江县','0',236,0,'',1,0,'',0),(1498,'无为县','0',236,0,'',1,0,'',0),(1499,'含山县','0',236,0,'',1,0,'',0),(1500,'和县','0',236,0,'',1,0,'',0),(1501,'金安区','0',237,0,'',1,0,'',0),(1502,'裕安区','0',237,0,'',1,0,'',0),(1503,'寿县','0',237,0,'',1,0,'',0),(1504,'霍邱县','0',237,0,'',1,0,'',0),(1505,'舒城县','0',237,0,'',1,0,'',0),(1506,'金寨县','0',237,0,'',1,0,'',0),(1507,'霍山县','0',237,0,'',1,0,'',0),(1508,'谯城区','0',238,0,'',1,0,'',0),(1509,'涡阳县','0',238,0,'',1,0,'',0),(1510,'蒙城县','0',238,0,'',1,0,'',0),(1511,'利辛县','0',238,0,'',1,0,'',0),(1512,'贵池区','0',239,0,'',1,0,'',0),(1513,'东至县','0',239,0,'',1,0,'',0),(1514,'石台县','0',239,0,'',1,0,'',0),(1515,'青阳县','0',239,0,'',1,0,'',0),(1516,'宣州区','0',240,0,'',1,0,'',0),(1517,'郎溪县','0',240,0,'',1,0,'',0),(1518,'广德县','0',240,0,'',1,0,'',0),(1519,'泾县','0',240,0,'',1,0,'',0),(1520,'绩溪县','0',240,0,'',1,0,'',0),(1521,'旌德县','0',240,0,'',1,0,'',0),(1522,'宁国市','0',240,0,'',1,0,'',0),(1523,'鼓楼区','0',241,0,'',1,0,'',0),(1524,'台江区','0',241,0,'',1,0,'',0),(1525,'仓山区','0',241,0,'',1,0,'',0),(1526,'马尾区','0',241,0,'',1,0,'',0),(1527,'晋安区','0',241,0,'',1,0,'',0),(1528,'闽侯县','0',241,0,'',1,0,'',0),(1529,'连江县','0',241,0,'',1,0,'',0),(1530,'罗源县','0',241,0,'',1,0,'',0),(1531,'闽清县','0',241,0,'',1,0,'',0),(1532,'永泰县','0',241,0,'',1,0,'',0),(1533,'平潭县','0',241,0,'',1,0,'',0),(1534,'福清市','0',241,0,'',1,0,'',0),(1535,'长乐市','0',241,0,'',1,0,'',0),(1536,'思明区','0',242,0,'',1,0,'',0),(1537,'海沧区','0',242,0,'',1,0,'',0),(1538,'湖里区','0',242,0,'',1,0,'',0),(1539,'集美区','0',242,0,'',1,0,'',0),(1540,'同安区','0',242,0,'',1,0,'',0),(1541,'翔安区','0',242,0,'',1,0,'',0),(1542,'城厢区','0',243,0,'',1,0,'',0),(1543,'涵江区','0',243,0,'',1,0,'',0),(1544,'荔城区','0',243,0,'',1,0,'',0),(1545,'秀屿区','0',243,0,'',1,0,'',0),(1546,'仙游县','0',243,0,'',1,0,'',0),(1547,'梅列区','0',244,0,'',1,0,'',0),(1548,'三元区','0',244,0,'',1,0,'',0),(1549,'明溪县','0',244,0,'',1,0,'',0),(1550,'清流县','0',244,0,'',1,0,'',0),(1551,'宁化县','0',244,0,'',1,0,'',0),(1552,'大田县','0',244,0,'',1,0,'',0),(1553,'尤溪县','0',244,0,'',1,0,'',0),(1554,'沙县','0',244,0,'',1,0,'',0),(1555,'将乐县','0',244,0,'',1,0,'',0),(1556,'泰宁县','0',244,0,'',1,0,'',0),(1557,'建宁县','0',244,0,'',1,0,'',0),(1558,'永安市','0',244,0,'',1,0,'',0),(1559,'鲤城区','0',245,0,'',1,0,'',0),(1560,'丰泽区','0',245,0,'',1,0,'',0),(1561,'洛江区','0',245,0,'',1,0,'',0),(1562,'泉港区','0',245,0,'',1,0,'',0),(1563,'惠安县','0',245,0,'',1,0,'',0),(1564,'安溪县','0',245,0,'',1,0,'',0),(1565,'永春县','0',245,0,'',1,0,'',0),(1566,'德化县','0',245,0,'',1,0,'',0),(1567,'金门县','0',245,0,'',1,0,'',0),(1568,'石狮市','0',245,0,'',1,0,'',0),(1569,'晋江市','0',245,0,'',1,0,'',0),(1570,'南安市','0',245,0,'',1,0,'',0),(1571,'芗城区','0',246,0,'',1,0,'',0),(1572,'龙文区','0',246,0,'',1,0,'',0),(1573,'云霄县','0',246,0,'',1,0,'',0),(1574,'漳浦县','0',246,0,'',1,0,'',0),(1575,'诏安县','0',246,0,'',1,0,'',0),(1576,'长泰县','0',246,0,'',1,0,'',0),(1577,'东山县','0',246,0,'',1,0,'',0),(1578,'南靖县','0',246,0,'',1,0,'',0),(1579,'平和县','0',246,0,'',1,0,'',0),(1580,'华安县','0',246,0,'',1,0,'',0),(1581,'龙海市','0',246,0,'',1,0,'',0),(1582,'延平区','0',247,0,'',1,0,'',0),(1583,'顺昌县','0',247,0,'',1,0,'',0),(1584,'浦城县','0',247,0,'',1,0,'',0),(1585,'光泽县','0',247,0,'',1,0,'',0),(1586,'松溪县','0',247,0,'',1,0,'',0),(1587,'政和县','0',247,0,'',1,0,'',0),(1588,'邵武市','0',247,0,'',1,0,'',0),(1589,'武夷山市','0',247,0,'',1,0,'',0),(1590,'建瓯市','0',247,0,'',1,0,'',0),(1591,'建阳市','0',247,0,'',1,0,'',0),(1592,'新罗区','0',248,0,'',1,0,'',0),(1593,'长汀县','0',248,0,'',1,0,'',0),(1594,'永定县','0',248,0,'',1,0,'',0),(1595,'上杭县','0',248,0,'',1,0,'',0),(1596,'武平县','0',248,0,'',1,0,'',0),(1597,'连城县','0',248,0,'',1,0,'',0),(1598,'漳平市','0',248,0,'',1,0,'',0),(1599,'蕉城区','0',249,0,'',1,0,'',0),(1600,'霞浦县','0',249,0,'',1,0,'',0),(1601,'古田县','0',249,0,'',1,0,'',0),(1602,'屏南县','0',249,0,'',1,0,'',0),(1603,'寿宁县','0',249,0,'',1,0,'',0),(1604,'周宁县','0',249,0,'',1,0,'',0),(1605,'柘荣县','0',249,0,'',1,0,'',0),(1606,'福安市','0',249,0,'',1,0,'',0),(1607,'福鼎市','0',249,0,'',1,0,'',0),(1608,'东湖区','0',250,0,'',1,0,'',0),(1609,'西湖区','0',250,0,'',1,0,'',0),(1610,'青云谱区','0',250,0,'',1,0,'',0),(1611,'湾里区','0',250,0,'',1,0,'',0),(1612,'青山湖区','0',250,0,'',1,0,'',0),(1613,'南昌县','0',250,0,'',1,0,'',0),(1614,'新建县','0',250,0,'',1,0,'',0),(1615,'安义县','0',250,0,'',1,0,'',0),(1616,'进贤县','0',250,0,'',1,0,'',0),(1617,'昌江区','0',251,0,'',1,0,'',0),(1618,'珠山区','0',251,0,'',1,0,'',0),(1619,'浮梁县','0',251,0,'',1,0,'',0),(1620,'乐平市','0',251,0,'',1,0,'',0),(1621,'安源区','0',252,0,'',1,0,'',0),(1622,'湘东区','0',252,0,'',1,0,'',0),(1623,'莲花县','0',252,0,'',1,0,'',0),(1624,'上栗县','0',252,0,'',1,0,'',0),(1625,'芦溪县','0',252,0,'',1,0,'',0),(1626,'庐山区','0',253,0,'',1,0,'',0),(1627,'浔阳区','0',253,0,'',1,0,'',0),(1628,'九江县','0',253,0,'',1,0,'',0),(1629,'武宁县','0',253,0,'',1,0,'',0),(1630,'修水县','0',253,0,'',1,0,'',0),(1631,'永修县','0',253,0,'',1,0,'',0),(1632,'德安县','0',253,0,'',1,0,'',0),(1633,'星子县','0',253,0,'',1,0,'',0),(1634,'都昌县','0',253,0,'',1,0,'',0),(1635,'湖口县','0',253,0,'',1,0,'',0),(1636,'彭泽县','0',253,0,'',1,0,'',0),(1637,'瑞昌市','0',253,0,'',1,0,'',0),(1638,'渝水区','0',254,0,'',1,0,'',0),(1639,'分宜县','0',254,0,'',1,0,'',0),(1640,'月湖区','0',255,0,'',1,0,'',0),(1641,'余江县','0',255,0,'',1,0,'',0),(1642,'贵溪市','0',255,0,'',1,0,'',0),(1643,'章贡区','0',256,0,'',1,0,'',0),(1644,'赣县','0',256,0,'',1,0,'',0),(1645,'信丰县','0',256,0,'',1,0,'',0),(1646,'大余县','0',256,0,'',1,0,'',0),(1647,'上犹县','0',256,0,'',1,0,'',0),(1648,'崇义县','0',256,0,'',1,0,'',0),(1649,'安远县','0',256,0,'',1,0,'',0),(1650,'龙南县','0',256,0,'',1,0,'',0),(1651,'定南县','0',256,0,'',1,0,'',0),(1652,'全南县','0',256,0,'',1,0,'',0),(1653,'宁都县','0',256,0,'',1,0,'',0),(1654,'于都县','0',256,0,'',1,0,'',0),(1655,'兴国县','0',256,0,'',1,0,'',0),(1656,'会昌县','0',256,0,'',1,0,'',0),(1657,'寻乌县','0',256,0,'',1,0,'',0),(1658,'石城县','0',256,0,'',1,0,'',0),(1659,'瑞金市','0',256,0,'',1,0,'',0),(1660,'南康市','0',256,0,'',1,0,'',0),(1661,'吉州区','0',257,0,'',1,0,'',0),(1662,'青原区','0',257,0,'',1,0,'',0),(1663,'吉安县','0',257,0,'',1,0,'',0),(1664,'吉水县','0',257,0,'',1,0,'',0),(1665,'峡江县','0',257,0,'',1,0,'',0),(1666,'新干县','0',257,0,'',1,0,'',0),(1667,'永丰县','0',257,0,'',1,0,'',0),(1668,'泰和县','0',257,0,'',1,0,'',0),(1669,'遂川县','0',257,0,'',1,0,'',0),(1670,'万安县','0',257,0,'',1,0,'',0),(1671,'安福县','0',257,0,'',1,0,'',0),(1672,'永新县','0',257,0,'',1,0,'',0),(1673,'井冈山市','0',257,0,'',1,0,'',0),(1674,'袁州区','0',258,0,'',1,0,'',0),(1675,'奉新县','0',258,0,'',1,0,'',0),(1676,'万载县','0',258,0,'',1,0,'',0),(1677,'上高县','0',258,0,'',1,0,'',0),(1678,'宜丰县','0',258,0,'',1,0,'',0),(1679,'靖安县','0',258,0,'',1,0,'',0),(1680,'铜鼓县','0',258,0,'',1,0,'',0),(1681,'丰城市','0',258,0,'',1,0,'',0),(1682,'樟树市','0',258,0,'',1,0,'',0),(1683,'高安市','0',258,0,'',1,0,'',0),(1684,'临川区','0',259,0,'',1,0,'',0),(1685,'南城县','0',259,0,'',1,0,'',0),(1686,'黎川县','0',259,0,'',1,0,'',0),(1687,'南丰县','0',259,0,'',1,0,'',0),(1688,'崇仁县','0',259,0,'',1,0,'',0),(1689,'乐安县','0',259,0,'',1,0,'',0),(1690,'宜黄县','0',259,0,'',1,0,'',0),(1691,'金溪县','0',259,0,'',1,0,'',0),(1692,'资溪县','0',259,0,'',1,0,'',0),(1693,'东乡县','0',259,0,'',1,0,'',0),(1694,'广昌县','0',259,0,'',1,0,'',0),(1695,'信州区','0',260,0,'',1,0,'',0),(1696,'上饶县','0',260,0,'',1,0,'',0),(1697,'广丰县','0',260,0,'',1,0,'',0),(1698,'玉山县','0',260,0,'',1,0,'',0),(1699,'铅山县','0',260,0,'',1,0,'',0),(1700,'横峰县','0',260,0,'',1,0,'',0),(1701,'弋阳县','0',260,0,'',1,0,'',0),(1702,'余干县','0',260,0,'',1,0,'',0),(1703,'鄱阳县','0',260,0,'',1,0,'',0),(1704,'万年县','0',260,0,'',1,0,'',0),(1705,'婺源县','0',260,0,'',1,0,'',0),(1706,'德兴市','0',260,0,'',1,0,'',0),(1707,'历下区','0',261,0,'',1,0,'',0),(1708,'市中区','0',261,0,'',1,0,'',0),(1709,'槐荫区','0',261,0,'',1,0,'',0),(1710,'天桥区','0',261,0,'',1,0,'',0),(1711,'历城区','0',261,0,'',1,0,'',0),(1712,'长清区','0',261,0,'',1,0,'',0),(1713,'平阴县','0',261,0,'',1,0,'',0),(1714,'济阳县','0',261,0,'',1,0,'',0),(1715,'商河县','0',261,0,'',1,0,'',0),(1716,'章丘市','0',261,0,'',1,0,'',0),(1717,'市南区','0',262,0,'',1,0,'',0),(1718,'市北区','0',262,0,'',1,0,'',0),(1719,'四方区','0',262,0,'',1,0,'',0),(1720,'黄岛区','0',262,0,'',1,0,'',0),(1721,'崂山区','0',262,0,'',1,0,'',0),(1722,'李沧区','0',262,0,'',1,0,'',0),(1723,'城阳区','0',262,0,'',1,0,'',0),(1724,'胶州市','0',262,0,'',1,0,'',0),(1725,'即墨市','0',262,0,'',1,0,'',0),(1726,'平度市','0',262,0,'',1,0,'',0),(1727,'胶南市','0',262,0,'',1,0,'',0),(1728,'莱西市','0',262,0,'',1,0,'',0),(1729,'淄川区','0',263,0,'',1,0,'',0),(1730,'张店区','0',263,0,'',1,0,'',0),(1731,'博山区','0',263,0,'',1,0,'',0),(1732,'临淄区','0',263,0,'',1,0,'',0),(1733,'周村区','0',263,0,'',1,0,'',0),(1734,'桓台县','0',263,0,'',1,0,'',0),(1735,'高青县','0',263,0,'',1,0,'',0),(1736,'沂源县','0',263,0,'',1,0,'',0),(1737,'市中区','0',264,0,'',1,0,'',0),(1738,'薛城区','0',264,0,'',1,0,'',0),(1739,'峄城区','0',264,0,'',1,0,'',0),(1740,'台儿庄区','0',264,0,'',1,0,'',0),(1741,'山亭区','0',264,0,'',1,0,'',0),(1742,'滕州市','0',264,0,'',1,0,'',0),(1743,'东营区','0',265,0,'',1,0,'',0),(1744,'河口区','0',265,0,'',1,0,'',0),(1745,'垦利县','0',265,0,'',1,0,'',0),(1746,'利津县','0',265,0,'',1,0,'',0),(1747,'广饶县','0',265,0,'',1,0,'',0),(1748,'芝罘区','0',266,0,'',1,0,'',0),(1749,'福山区','0',266,0,'',1,0,'',0),(1750,'牟平区','0',266,0,'',1,0,'',0),(1751,'莱山区','0',266,0,'',1,0,'',0),(1752,'长岛县','0',266,0,'',1,0,'',0),(1753,'龙口市','0',266,0,'',1,0,'',0),(1754,'莱阳市','0',266,0,'',1,0,'',0),(1755,'莱州市','0',266,0,'',1,0,'',0),(1756,'蓬莱市','0',266,0,'',1,0,'',0),(1757,'招远市','0',266,0,'',1,0,'',0),(1758,'栖霞市','0',266,0,'',1,0,'',0),(1759,'海阳市','0',266,0,'',1,0,'',0),(1760,'潍城区','0',267,0,'',1,0,'',0),(1761,'寒亭区','0',267,0,'',1,0,'',0),(1762,'坊子区','0',267,0,'',1,0,'',0),(1763,'奎文区','0',267,0,'',1,0,'',0),(1764,'临朐县','0',267,0,'',1,0,'',0),(1765,'昌乐县','0',267,0,'',1,0,'',0),(1766,'青州市','0',267,0,'',1,0,'',0),(1767,'诸城市','0',267,0,'',1,0,'',0),(1768,'寿光市','0',267,0,'',1,0,'',0),(1769,'安丘市','0',267,0,'',1,0,'',0),(1770,'高密市','0',267,0,'',1,0,'',0),(1771,'昌邑市','0',267,0,'',1,0,'',0),(1772,'市中区','0',268,0,'',1,0,'',0),(1773,'任城区','0',268,0,'',1,0,'',0),(1774,'微山县','0',268,0,'',1,0,'',0),(1775,'鱼台县','0',268,0,'',1,0,'',0),(1776,'金乡县','0',268,0,'',1,0,'',0),(1777,'嘉祥县','0',268,0,'',1,0,'',0),(1778,'汶上县','0',268,0,'',1,0,'',0),(1779,'泗水县','0',268,0,'',1,0,'',0),(1780,'梁山县','0',268,0,'',1,0,'',0),(1781,'曲阜市','0',268,0,'',1,0,'',0),(1782,'兖州市','0',268,0,'',1,0,'',0),(1783,'邹城市','0',268,0,'',1,0,'',0),(1784,'泰山区','0',269,0,'',1,0,'',0),(1785,'岱岳区','0',269,0,'',1,0,'',0),(1786,'宁阳县','0',269,0,'',1,0,'',0),(1787,'东平县','0',269,0,'',1,0,'',0),(1788,'新泰市','0',269,0,'',1,0,'',0),(1789,'肥城市','0',269,0,'',1,0,'',0),(1790,'环翠区','0',270,0,'',1,0,'',0),(1791,'文登市','0',270,0,'',1,0,'',0),(1792,'荣成市','0',270,0,'',1,0,'',0),(1793,'乳山市','0',270,0,'',1,0,'',0),(1794,'东港区','0',271,0,'',1,0,'',0),(1795,'岚山区','0',271,0,'',1,0,'',0),(1796,'五莲县','0',271,0,'',1,0,'',0),(1797,'莒县','0',271,0,'',1,0,'',0),(1798,'莱城区','0',272,0,'',1,0,'',0),(1799,'钢城区','0',272,0,'',1,0,'',0),(1800,'兰山区','0',273,0,'',1,0,'',0),(1801,'罗庄区','0',273,0,'',1,0,'',0),(1802,'河东区','0',273,0,'',1,0,'',0),(1803,'沂南县','0',273,0,'',1,0,'',0),(1804,'郯城县','0',273,0,'',1,0,'',0),(1805,'沂水县','0',273,0,'',1,0,'',0),(1806,'苍山县','0',273,0,'',1,0,'',0),(1807,'费县','0',273,0,'',1,0,'',0),(1808,'平邑县','0',273,0,'',1,0,'',0),(1809,'莒南县','0',273,0,'',1,0,'',0),(1810,'蒙阴县','0',273,0,'',1,0,'',0),(1811,'临沭县','0',273,0,'',1,0,'',0),(1812,'德城区','0',274,0,'',1,0,'',0),(1813,'陵县','0',274,0,'',1,0,'',0),(1814,'宁津县','0',274,0,'',1,0,'',0),(1815,'庆云县','0',274,0,'',1,0,'',0),(1816,'临邑县','0',274,0,'',1,0,'',0),(1817,'齐河县','0',274,0,'',1,0,'',0),(1818,'平原县','0',274,0,'',1,0,'',0),(1819,'夏津县','0',274,0,'',1,0,'',0),(1820,'武城县','0',274,0,'',1,0,'',0),(1821,'乐陵市','0',274,0,'',1,0,'',0),(1822,'禹城市','0',274,0,'',1,0,'',0),(1823,'东昌府区','0',275,0,'',1,0,'',0),(1824,'阳谷县','0',275,0,'',1,0,'',0),(1825,'莘县','0',275,0,'',1,0,'',0),(1826,'茌平县','0',275,0,'',1,0,'',0),(1827,'东阿县','0',275,0,'',1,0,'',0),(1828,'冠县','0',275,0,'',1,0,'',0),(1829,'高唐县','0',275,0,'',1,0,'',0),(1830,'临清市','0',275,0,'',1,0,'',0),(1831,'滨城区','0',276,0,'',1,0,'',0),(1832,'惠民县','0',276,0,'',1,0,'',0),(1833,'阳信县','0',276,0,'',1,0,'',0),(1834,'无棣县','0',276,0,'',1,0,'',0),(1835,'沾化县','0',276,0,'',1,0,'',0),(1836,'博兴县','0',276,0,'',1,0,'',0),(1837,'邹平县','0',276,0,'',1,0,'',0),(1838,'牡丹区','0',277,0,'',1,0,'',0),(1839,'曹县','0',277,0,'',1,0,'',0),(1840,'单县','0',277,0,'',1,0,'',0),(1841,'成武县','0',277,0,'',1,0,'',0),(1842,'巨野县','0',277,0,'',1,0,'',0),(1843,'郓城县','0',277,0,'',1,0,'',0),(1844,'鄄城县','0',277,0,'',1,0,'',0),(1845,'定陶县','0',277,0,'',1,0,'',0),(1846,'东明县','0',277,0,'',1,0,'',0),(1847,'中原区','0',278,0,'',1,0,'',0),(1848,'二七区','0',278,0,'',1,0,'',0),(1849,'管城回族区','0',278,0,'',1,0,'',0),(1850,'金水区','0',278,0,'',1,0,'',0),(1851,'上街区','0',278,0,'',1,0,'',0),(1852,'惠济区','0',278,0,'',1,0,'',0),(1853,'中牟县','0',278,0,'',1,0,'',0),(1854,'巩义市','0',278,0,'',1,0,'',0),(1855,'荥阳市','0',278,0,'',1,0,'',0),(1856,'新密市','0',278,0,'',1,0,'',0),(1857,'新郑市','0',278,0,'',1,0,'',0),(1858,'登封市','0',278,0,'',1,0,'',0),(1859,'龙亭区','0',279,0,'',1,0,'',0),(1860,'顺河回族区','0',279,0,'',1,0,'',0),(1861,'鼓楼区','0',279,0,'',1,0,'',0),(1862,'禹王台区','0',279,0,'',1,0,'',0),(1863,'金明区','0',279,0,'',1,0,'',0),(1864,'杞县','0',279,0,'',1,0,'',0),(1865,'通许县','0',279,0,'',1,0,'',0),(1866,'尉氏县','0',279,0,'',1,0,'',0),(1867,'开封县','0',279,0,'',1,0,'',0),(1868,'兰考县','0',279,0,'',1,0,'',0),(1869,'老城区','0',280,0,'',1,0,'',0),(1870,'西工区','0',280,0,'',1,0,'',0),(1871,'廛河回族区','0',280,0,'',1,0,'',0),(1872,'涧西区','0',280,0,'',1,0,'',0),(1873,'吉利区','0',280,0,'',1,0,'',0),(1874,'洛龙区','0',280,0,'',1,0,'',0),(1875,'孟津县','0',280,0,'',1,0,'',0),(1876,'新安县','0',280,0,'',1,0,'',0),(1877,'栾川县','0',280,0,'',1,0,'',0),(1878,'嵩县','0',280,0,'',1,0,'',0),(1879,'汝阳县','0',280,0,'',1,0,'',0),(1880,'宜阳县','0',280,0,'',1,0,'',0),(1881,'洛宁县','0',280,0,'',1,0,'',0),(1882,'伊川县','0',280,0,'',1,0,'',0),(1883,'偃师市','0',280,0,'',1,0,'',0),(1884,'新华区','0',281,0,'',1,0,'',0),(1885,'卫东区','0',281,0,'',1,0,'',0),(1886,'石龙区','0',281,0,'',1,0,'',0),(1887,'湛河区','0',281,0,'',1,0,'',0),(1888,'宝丰县','0',281,0,'',1,0,'',0),(1889,'叶县','0',281,0,'',1,0,'',0),(1890,'鲁山县','0',281,0,'',1,0,'',0),(1891,'郏县','0',281,0,'',1,0,'',0),(1892,'舞钢市','0',281,0,'',1,0,'',0),(1893,'汝州市','0',281,0,'',1,0,'',0),(1894,'文峰区','0',282,0,'',1,0,'',0),(1895,'北关区','0',282,0,'',1,0,'',0),(1896,'殷都区','0',282,0,'',1,0,'',0),(1897,'龙安区','0',282,0,'',1,0,'',0),(1898,'安阳县','0',282,0,'',1,0,'',0),(1899,'汤阴县','0',282,0,'',1,0,'',0),(1900,'滑县','0',282,0,'',1,0,'',0),(1901,'内黄县','0',282,0,'',1,0,'',0),(1902,'林州市','0',282,0,'',1,0,'',0),(1903,'鹤山区','0',283,0,'',1,0,'',0),(1904,'山城区','0',283,0,'',1,0,'',0),(1905,'淇滨区','0',283,0,'',1,0,'',0),(1906,'浚县','0',283,0,'',1,0,'',0),(1907,'淇县','0',283,0,'',1,0,'',0),(1908,'红旗区','0',284,0,'',1,0,'',0),(1909,'卫滨区','0',284,0,'',1,0,'',0),(1910,'凤泉区','0',284,0,'',1,0,'',0),(1911,'牧野区','0',284,0,'',1,0,'',0),(1912,'新乡县','0',284,0,'',1,0,'',0),(1913,'获嘉县','0',284,0,'',1,0,'',0),(1914,'原阳县','0',284,0,'',1,0,'',0),(1915,'延津县','0',284,0,'',1,0,'',0),(1916,'封丘县','0',284,0,'',1,0,'',0),(1917,'长垣县','0',284,0,'',1,0,'',0),(1918,'卫辉市','0',284,0,'',1,0,'',0),(1919,'辉县市','0',284,0,'',1,0,'',0),(1920,'解放区','0',285,0,'',1,0,'',0),(1921,'中站区','0',285,0,'',1,0,'',0),(1922,'马村区','0',285,0,'',1,0,'',0),(1923,'山阳区','0',285,0,'',1,0,'',0),(1924,'修武县','0',285,0,'',1,0,'',0),(1925,'博爱县','0',285,0,'',1,0,'',0),(1926,'武陟县','0',285,0,'',1,0,'',0),(1927,'温县','0',285,0,'',1,0,'',0),(1928,'济源市','0',285,0,'',1,0,'',0),(1929,'沁阳市','0',285,0,'',1,0,'',0),(1930,'孟州市','0',285,0,'',1,0,'',0),(1931,'华龙区','0',286,0,'',1,0,'',0),(1932,'清丰县','0',286,0,'',1,0,'',0),(1933,'南乐县','0',286,0,'',1,0,'',0),(1934,'范县','0',286,0,'',1,0,'',0),(1935,'台前县','0',286,0,'',1,0,'',0),(1936,'濮阳县','0',286,0,'',1,0,'',0),(1937,'魏都区','0',287,0,'',1,0,'',0),(1938,'许昌县','0',287,0,'',1,0,'',0),(1939,'鄢陵县','0',287,0,'',1,0,'',0),(1940,'襄城县','0',287,0,'',1,0,'',0),(1941,'禹州市','0',287,0,'',1,0,'',0),(1942,'长葛市','0',287,0,'',1,0,'',0),(1943,'源汇区','0',288,0,'',1,0,'',0),(1944,'郾城区','0',288,0,'',1,0,'',0),(1945,'召陵区','0',288,0,'',1,0,'',0),(1946,'舞阳县','0',288,0,'',1,0,'',0),(1947,'临颍县','0',288,0,'',1,0,'',0),(1948,'湖滨区','0',289,0,'',1,0,'',0),(1949,'渑池县','0',289,0,'',1,0,'',0),(1950,'陕县','0',289,0,'',1,0,'',0),(1951,'卢氏县','0',289,0,'',1,0,'',0),(1952,'义马市','0',289,0,'',1,0,'',0),(1953,'灵宝市','0',289,0,'',1,0,'',0),(1954,'宛城区','0',290,0,'',1,0,'',0),(1955,'卧龙区','0',290,0,'',1,0,'',0),(1956,'南召县','0',290,0,'',1,0,'',0),(1957,'方城县','0',290,0,'',1,0,'',0),(1958,'西峡县','0',290,0,'',1,0,'',0),(1959,'镇平县','0',290,0,'',1,0,'',0),(1960,'内乡县','0',290,0,'',1,0,'',0),(1961,'淅川县','0',290,0,'',1,0,'',0),(1962,'社旗县','0',290,0,'',1,0,'',0),(1963,'唐河县','0',290,0,'',1,0,'',0),(1964,'新野县','0',290,0,'',1,0,'',0),(1965,'桐柏县','0',290,0,'',1,0,'',0),(1966,'邓州市','0',290,0,'',1,0,'',0),(1967,'梁园区','0',291,0,'',1,0,'',0),(1968,'睢阳区','0',291,0,'',1,0,'',0),(1969,'民权县','0',291,0,'',1,0,'',0),(1970,'睢县','0',291,0,'',1,0,'',0),(1971,'宁陵县','0',291,0,'',1,0,'',0),(1972,'柘城县','0',291,0,'',1,0,'',0),(1973,'虞城县','0',291,0,'',1,0,'',0),(1974,'夏邑县','0',291,0,'',1,0,'',0),(1975,'永城市','0',291,0,'',1,0,'',0),(1976,'浉河区','0',292,0,'',1,0,'',0),(1977,'平桥区','0',292,0,'',1,0,'',0),(1978,'罗山县','0',292,0,'',1,0,'',0),(1979,'光山县','0',292,0,'',1,0,'',0),(1980,'新县','0',292,0,'',1,0,'',0),(1981,'商城县','0',292,0,'',1,0,'',0),(1982,'固始县','0',292,0,'',1,0,'',0),(1983,'潢川县','0',292,0,'',1,0,'',0),(1984,'淮滨县','0',292,0,'',1,0,'',0),(1985,'息县','0',292,0,'',1,0,'',0),(1986,'川汇区','0',293,0,'',1,0,'',0),(1987,'扶沟县','0',293,0,'',1,0,'',0),(1988,'西华县','0',293,0,'',1,0,'',0),(1989,'商水县','0',293,0,'',1,0,'',0),(1990,'沈丘县','0',293,0,'',1,0,'',0),(1991,'郸城县','0',293,0,'',1,0,'',0),(1992,'淮阳县','0',293,0,'',1,0,'',0),(1993,'太康县','0',293,0,'',1,0,'',0),(1994,'鹿邑县','0',293,0,'',1,0,'',0),(1995,'项城市','0',293,0,'',1,0,'',0),(1996,'驿城区','0',294,0,'',1,0,'',0),(1997,'西平县','0',294,0,'',1,0,'',0),(1998,'上蔡县','0',294,0,'',1,0,'',0),(1999,'平舆县','0',294,0,'',1,0,'',0),(2000,'正阳县','0',294,0,'',1,0,'',0),(2001,'确山县','0',294,0,'',1,0,'',0),(2002,'泌阳县','0',294,0,'',1,0,'',0),(2003,'汝南县','0',294,0,'',1,0,'',0),(2004,'遂平县','0',294,0,'',1,0,'',0),(2005,'新蔡县','0',294,0,'',1,0,'',0),(2006,'江岸区','0',295,0,'',1,0,'',0),(2007,'江汉区','0',295,0,'',1,0,'',0),(2008,'硚口区','0',295,0,'',1,0,'',0),(2009,'汉阳区','0',295,0,'',1,0,'',0),(2010,'武昌区','0',295,0,'',1,0,'',0),(2011,'青山区','0',295,0,'',1,0,'',0),(2012,'洪山区','0',295,0,'',1,0,'',0),(2013,'东西湖区','0',295,0,'',1,0,'',0),(2014,'汉南区','0',295,0,'',1,0,'',0),(2015,'蔡甸区','0',295,0,'',1,0,'',0),(2016,'江夏区','0',295,0,'',1,0,'',0),(2017,'黄陂区','0',295,0,'',1,0,'',0),(2018,'新洲区','0',295,0,'',1,0,'',0),(2019,'黄石港区','0',296,0,'',1,0,'',0),(2020,'西塞山区','0',296,0,'',1,0,'',0),(2021,'下陆区','0',296,0,'',1,0,'',0),(2022,'铁山区','0',296,0,'',1,0,'',0),(2023,'阳新县','0',296,0,'',1,0,'',0),(2024,'大冶市','0',296,0,'',1,0,'',0),(2025,'茅箭区','0',297,0,'',1,0,'',0),(2026,'张湾区','0',297,0,'',1,0,'',0),(2027,'郧县','0',297,0,'',1,0,'',0),(2028,'郧西县','0',297,0,'',1,0,'',0),(2029,'竹山县','0',297,0,'',1,0,'',0),(2030,'竹溪县','0',297,0,'',1,0,'',0),(2031,'房县','0',297,0,'',1,0,'',0),(2032,'丹江口市','0',297,0,'',1,0,'',0),(2033,'西陵区','0',298,0,'',1,0,'',0),(2034,'伍家岗区','0',298,0,'',1,0,'',0),(2035,'点军区','0',298,0,'',1,0,'',0),(2036,'猇亭区','0',298,0,'',1,0,'',0),(2037,'夷陵区','0',298,0,'',1,0,'',0),(2038,'远安县','0',298,0,'',1,0,'',0),(2039,'兴山县','0',298,0,'',1,0,'',0),(2040,'秭归县','0',298,0,'',1,0,'',0),(2041,'长阳土家族自治县','0',298,0,'',1,0,'',0),(2042,'五峰土家族自治县','0',298,0,'',1,0,'',0),(2043,'宜都市','0',298,0,'',1,0,'',0),(2044,'当阳市','0',298,0,'',1,0,'',0),(2045,'枝江市','0',298,0,'',1,0,'',0),(2046,'襄城区','0',299,0,'',1,0,'',0),(2047,'樊城区','0',299,0,'',1,0,'',0),(2048,'襄阳区','0',299,0,'',1,0,'',0),(2049,'南漳县','0',299,0,'',1,0,'',0),(2050,'谷城县','0',299,0,'',1,0,'',0),(2051,'保康县','0',299,0,'',1,0,'',0),(2052,'老河口市','0',299,0,'',1,0,'',0),(2053,'枣阳市','0',299,0,'',1,0,'',0),(2054,'宜城市','0',299,0,'',1,0,'',0),(2055,'梁子湖区','0',300,0,'',1,0,'',0),(2056,'华容区','0',300,0,'',1,0,'',0),(2057,'鄂城区','0',300,0,'',1,0,'',0),(2058,'东宝区','0',301,0,'',1,0,'',0),(2059,'掇刀区','0',301,0,'',1,0,'',0),(2060,'京山县','0',301,0,'',1,0,'',0),(2061,'沙洋县','0',301,0,'',1,0,'',0),(2062,'钟祥市','0',301,0,'',1,0,'',0),(2063,'孝南区','0',302,0,'',1,0,'',0),(2064,'孝昌县','0',302,0,'',1,0,'',0),(2065,'大悟县','0',302,0,'',1,0,'',0),(2066,'云梦县','0',302,0,'',1,0,'',0),(2067,'应城市','0',302,0,'',1,0,'',0),(2068,'安陆市','0',302,0,'',1,0,'',0),(2069,'汉川市','0',302,0,'',1,0,'',0),(2070,'沙市区','0',303,0,'',1,0,'',0),(2071,'荆州区','0',303,0,'',1,0,'',0),(2072,'公安县','0',303,0,'',1,0,'',0),(2073,'监利县','0',303,0,'',1,0,'',0),(2074,'江陵县','0',303,0,'',1,0,'',0),(2075,'石首市','0',303,0,'',1,0,'',0),(2076,'洪湖市','0',303,0,'',1,0,'',0),(2077,'松滋市','0',303,0,'',1,0,'',0),(2078,'黄州区','0',304,0,'',1,0,'',0),(2079,'团风县','0',304,0,'',1,0,'',0),(2080,'红安县','0',304,0,'',1,0,'',0),(2081,'罗田县','0',304,0,'',1,0,'',0),(2082,'英山县','0',304,0,'',1,0,'',0),(2083,'浠水县','0',304,0,'',1,0,'',0),(2084,'蕲春县','0',304,0,'',1,0,'',0),(2085,'黄梅县','0',304,0,'',1,0,'',0),(2086,'麻城市','0',304,0,'',1,0,'',0),(2087,'武穴市','0',304,0,'',1,0,'',0),(2088,'咸安区','0',305,0,'',1,0,'',0),(2089,'嘉鱼县','0',305,0,'',1,0,'',0),(2090,'通城县','0',305,0,'',1,0,'',0),(2091,'崇阳县','0',305,0,'',1,0,'',0),(2092,'通山县','0',305,0,'',1,0,'',0),(2093,'赤壁市','0',305,0,'',1,0,'',0),(2094,'曾都区','0',306,0,'',1,0,'',0),(2095,'广水市','0',306,0,'',1,0,'',0),(2096,'恩施市','0',307,0,'',1,0,'',0),(2097,'利川市','0',307,0,'',1,0,'',0),(2098,'建始县','0',307,0,'',1,0,'',0),(2099,'巴东县','0',307,0,'',1,0,'',0),(2100,'宣恩县','0',307,0,'',1,0,'',0),(2101,'咸丰县','0',307,0,'',1,0,'',0),(2102,'来凤县','0',307,0,'',1,0,'',0),(2103,'鹤峰县','0',307,0,'',1,0,'',0),(2104,'芙蓉区','0',312,0,'',1,0,'',0),(2105,'天心区','0',312,0,'',1,0,'',0),(2106,'岳麓区','0',312,0,'',1,0,'',0),(2107,'开福区','0',312,0,'',1,0,'',0),(2108,'雨花区','0',312,0,'',1,0,'',0),(2109,'长沙县','0',312,0,'',1,0,'',0),(2110,'望城县','0',312,0,'',1,0,'',0),(2111,'宁乡县','0',312,0,'',1,0,'',0),(2112,'浏阳市','0',312,0,'',1,0,'',0),(2113,'荷塘区','0',313,0,'',1,0,'',0),(2114,'芦淞区','0',313,0,'',1,0,'',0),(2115,'石峰区','0',313,0,'',1,0,'',0),(2116,'天元区','0',313,0,'',1,0,'',0),(2117,'株洲县','0',313,0,'',1,0,'',0),(2118,'攸县','0',313,0,'',1,0,'',0),(2119,'茶陵县','0',313,0,'',1,0,'',0),(2120,'炎陵县','0',313,0,'',1,0,'',0),(2121,'醴陵市','0',313,0,'',1,0,'',0),(2122,'雨湖区','0',314,0,'',1,0,'',0),(2123,'岳塘区','0',314,0,'',1,0,'',0),(2124,'湘潭县','0',314,0,'',1,0,'',0),(2125,'湘乡市','0',314,0,'',1,0,'',0),(2126,'韶山市','0',314,0,'',1,0,'',0),(2127,'珠晖区','0',315,0,'',1,0,'',0),(2128,'雁峰区','0',315,0,'',1,0,'',0),(2129,'石鼓区','0',315,0,'',1,0,'',0),(2130,'蒸湘区','0',315,0,'',1,0,'',0),(2131,'南岳区','0',315,0,'',1,0,'',0),(2132,'衡阳县','0',315,0,'',1,0,'',0),(2133,'衡南县','0',315,0,'',1,0,'',0),(2134,'衡山县','0',315,0,'',1,0,'',0),(2135,'衡东县','0',315,0,'',1,0,'',0),(2136,'祁东县','0',315,0,'',1,0,'',0),(2137,'耒阳市','0',315,0,'',1,0,'',0),(2138,'常宁市','0',315,0,'',1,0,'',0),(2139,'双清区','0',316,0,'',1,0,'',0),(2140,'大祥区','0',316,0,'',1,0,'',0),(2141,'北塔区','0',316,0,'',1,0,'',0),(2142,'邵东县','0',316,0,'',1,0,'',0),(2143,'新邵县','0',316,0,'',1,0,'',0),(2144,'邵阳县','0',316,0,'',1,0,'',0),(2145,'隆回县','0',316,0,'',1,0,'',0),(2146,'洞口县','0',316,0,'',1,0,'',0),(2147,'绥宁县','0',316,0,'',1,0,'',0),(2148,'新宁县','0',316,0,'',1,0,'',0),(2149,'城步苗族自治县','0',316,0,'',1,0,'',0),(2150,'武冈市','0',316,0,'',1,0,'',0),(2151,'岳阳楼区','0',317,0,'',1,0,'',0),(2152,'云溪区','0',317,0,'',1,0,'',0),(2153,'君山区','0',317,0,'',1,0,'',0),(2154,'岳阳县','0',317,0,'',1,0,'',0),(2155,'华容县','0',317,0,'',1,0,'',0),(2156,'湘阴县','0',317,0,'',1,0,'',0),(2157,'平江县','0',317,0,'',1,0,'',0),(2158,'汨罗市','0',317,0,'',1,0,'',0),(2159,'临湘市','0',317,0,'',1,0,'',0),(2160,'武陵区','0',318,0,'',1,0,'',0),(2161,'鼎城区','0',318,0,'',1,0,'',0),(2162,'安乡县','0',318,0,'',1,0,'',0),(2163,'汉寿县','0',318,0,'',1,0,'',0),(2164,'澧县','0',318,0,'',1,0,'',0),(2165,'临澧县','0',318,0,'',1,0,'',0),(2166,'桃源县','0',318,0,'',1,0,'',0),(2167,'石门县','0',318,0,'',1,0,'',0),(2168,'津市市','0',318,0,'',1,0,'',0),(2169,'永定区','0',319,0,'',1,0,'',0),(2170,'武陵源区','0',319,0,'',1,0,'',0),(2171,'慈利县','0',319,0,'',1,0,'',0),(2172,'桑植县','0',319,0,'',1,0,'',0),(2173,'资阳区','0',320,0,'',1,0,'',0),(2174,'赫山区','0',320,0,'',1,0,'',0),(2175,'南县','0',320,0,'',1,0,'',0),(2176,'桃江县','0',320,0,'',1,0,'',0),(2177,'安化县','0',320,0,'',1,0,'',0),(2178,'沅江市','0',320,0,'',1,0,'',0),(2179,'北湖区','0',321,0,'',1,0,'',0),(2180,'苏仙区','0',321,0,'',1,0,'',0),(2181,'桂阳县','0',321,0,'',1,0,'',0),(2182,'宜章县','0',321,0,'',1,0,'',0),(2183,'永兴县','0',321,0,'',1,0,'',0),(2184,'嘉禾县','0',321,0,'',1,0,'',0),(2185,'临武县','0',321,0,'',1,0,'',0),(2186,'汝城县','0',321,0,'',1,0,'',0),(2187,'桂东县','0',321,0,'',1,0,'',0),(2188,'安仁县','0',321,0,'',1,0,'',0),(2189,'资兴市','0',321,0,'',1,0,'',0),(2190,'零陵区','0',322,0,'',1,0,'',0),(2191,'冷水滩区','0',322,0,'',1,0,'',0),(2192,'祁阳县','0',322,0,'',1,0,'',0),(2193,'东安县','0',322,0,'',1,0,'',0),(2194,'双牌县','0',322,0,'',1,0,'',0),(2195,'道县','0',322,0,'',1,0,'',0),(2196,'江永县','0',322,0,'',1,0,'',0),(2197,'宁远县','0',322,0,'',1,0,'',0),(2198,'蓝山县','0',322,0,'',1,0,'',0),(2199,'新田县','0',322,0,'',1,0,'',0),(2200,'江华瑶族自治县','0',322,0,'',1,0,'',0),(2201,'鹤城区','0',323,0,'',1,0,'',0),(2202,'中方县','0',323,0,'',1,0,'',0),(2203,'沅陵县','0',323,0,'',1,0,'',0),(2204,'辰溪县','0',323,0,'',1,0,'',0),(2205,'溆浦县','0',323,0,'',1,0,'',0),(2206,'会同县','0',323,0,'',1,0,'',0),(2207,'麻阳苗族自治县','0',323,0,'',1,0,'',0),(2208,'新晃侗族自治县','0',323,0,'',1,0,'',0),(2209,'芷江侗族自治县','0',323,0,'',1,0,'',0),(2210,'靖州苗族侗族自治县','0',323,0,'',1,0,'',0),(2211,'通道侗族自治县','0',323,0,'',1,0,'',0),(2212,'洪江市','0',323,0,'',1,0,'',0),(2213,'娄星区','0',324,0,'',1,0,'',0),(2214,'双峰县','0',324,0,'',1,0,'',0),(2215,'新化县','0',324,0,'',1,0,'',0),(2216,'冷水江市','0',324,0,'',1,0,'',0),(2217,'涟源市','0',324,0,'',1,0,'',0),(2218,'吉首市','0',325,0,'',1,0,'',0),(2219,'泸溪县','0',325,0,'',1,0,'',0),(2220,'凤凰县','0',325,0,'',1,0,'',0),(2221,'花垣县','0',325,0,'',1,0,'',0),(2222,'保靖县','0',325,0,'',1,0,'',0),(2223,'古丈县','0',325,0,'',1,0,'',0),(2224,'永顺县','0',325,0,'',1,0,'',0),(2225,'龙山县','0',325,0,'',1,0,'',0),(2226,'荔湾区','0',326,0,'',1,0,'',0),(2227,'越秀区','0',326,0,'',1,0,'',0),(2228,'海珠区','0',326,0,'',1,0,'',0),(2229,'天河区','0',326,0,'',1,0,'',0),(2230,'白云区','0',326,0,'',1,0,'',0),(2231,'黄埔区','0',326,0,'',1,0,'',0),(2232,'番禺区','0',326,0,'',1,0,'',0),(2233,'花都区','0',326,0,'',1,0,'',0),(2234,'南沙区','0',326,0,'',1,0,'',0),(2235,'萝岗区','0',326,0,'',1,0,'',0),(2236,'增城市','0',326,0,'',1,0,'',0),(2237,'从化市','0',326,0,'',1,0,'',0),(2238,'武江区','0',327,0,'',1,0,'',0),(2239,'浈江区','0',327,0,'',1,0,'',0),(2240,'曲江区','0',327,0,'',1,0,'',0),(2241,'始兴县','0',327,0,'',1,0,'',0),(2242,'仁化县','0',327,0,'',1,0,'',0),(2243,'翁源县','0',327,0,'',1,0,'',0),(2244,'乳源瑶族自治县','0',327,0,'',1,0,'',0),(2245,'新丰县','0',327,0,'',1,0,'',0),(2246,'乐昌市','0',327,0,'',1,0,'',0),(2247,'南雄市','0',327,0,'',1,0,'',0),(2248,'罗湖区','0',328,0,'',1,0,'',0),(2249,'福田区','0',328,0,'',1,0,'',0),(2250,'南山区','0',328,0,'',1,0,'',0),(2251,'宝安区','0',328,0,'',1,0,'',0),(2252,'龙岗区','0',328,0,'',1,0,'',0),(2253,'盐田区','0',328,0,'',1,0,'',0),(2254,'香洲区','0',329,0,'',1,0,'',0),(2255,'斗门区','0',329,0,'',1,0,'',0),(2256,'金湾区','0',329,0,'',1,0,'',0),(2257,'龙湖区','0',330,0,'',1,0,'',0),(2258,'金平区','0',330,0,'',1,0,'',0),(2259,'濠江区','0',330,0,'',1,0,'',0),(2260,'潮阳区','0',330,0,'',1,0,'',0),(2261,'潮南区','0',330,0,'',1,0,'',0),(2262,'澄海区','0',330,0,'',1,0,'',0),(2263,'南澳县','0',330,0,'',1,0,'',0),(2264,'禅城区','0',331,0,'',1,0,'',0),(2265,'南海区','0',331,0,'',1,0,'',0),(2266,'顺德区','0',331,0,'',1,0,'',0),(2267,'三水区','0',331,0,'',1,0,'',0),(2268,'高明区','0',331,0,'',1,0,'',0),(2269,'蓬江区','0',332,0,'',1,0,'',0),(2270,'江海区','0',332,0,'',1,0,'',0),(2271,'新会区','0',332,0,'',1,0,'',0),(2272,'台山市','0',332,0,'',1,0,'',0),(2273,'开平市','0',332,0,'',1,0,'',0),(2274,'鹤山市','0',332,0,'',1,0,'',0),(2275,'恩平市','0',332,0,'',1,0,'',0),(2276,'赤坎区','0',333,0,'',1,0,'',0),(2277,'霞山区','0',333,0,'',1,0,'',0),(2278,'坡头区','0',333,0,'',1,0,'',0),(2279,'麻章区','0',333,0,'',1,0,'',0),(2280,'遂溪县','0',333,0,'',1,0,'',0),(2281,'徐闻县','0',333,0,'',1,0,'',0),(2282,'廉江市','0',333,0,'',1,0,'',0),(2283,'雷州市','0',333,0,'',1,0,'',0),(2284,'吴川市','0',333,0,'',1,0,'',0),(2285,'茂南区','0',334,0,'',1,0,'',0),(2286,'茂港区','0',334,0,'',1,0,'',0),(2287,'电白县','0',334,0,'',1,0,'',0),(2288,'高州市','0',334,0,'',1,0,'',0),(2289,'化州市','0',334,0,'',1,0,'',0),(2290,'信宜市','0',334,0,'',1,0,'',0),(2291,'端州区','0',335,0,'',1,0,'',0),(2292,'鼎湖区','0',335,0,'',1,0,'',0),(2293,'广宁县','0',335,0,'',1,0,'',0),(2294,'怀集县','0',335,0,'',1,0,'',0),(2295,'封开县','0',335,0,'',1,0,'',0),(2296,'德庆县','0',335,0,'',1,0,'',0),(2297,'高要市','0',335,0,'',1,0,'',0),(2298,'四会市','0',335,0,'',1,0,'',0),(2299,'惠城区','0',336,0,'',1,0,'',0),(2300,'惠阳区','0',336,0,'',1,0,'',0),(2301,'博罗县','0',336,0,'',1,0,'',0),(2302,'惠东县','0',336,0,'',1,0,'',0),(2303,'龙门县','0',336,0,'',1,0,'',0),(2304,'梅江区','0',337,0,'',1,0,'',0),(2305,'梅县','0',337,0,'',1,0,'',0),(2306,'大埔县','0',337,0,'',1,0,'',0),(2307,'丰顺县','0',337,0,'',1,0,'',0),(2308,'五华县','0',337,0,'',1,0,'',0),(2309,'平远县','0',337,0,'',1,0,'',0),(2310,'蕉岭县','0',337,0,'',1,0,'',0),(2311,'兴宁市','0',337,0,'',1,0,'',0),(2312,'城区','0',338,0,'',1,0,'',0),(2313,'海丰县','0',338,0,'',1,0,'',0),(2314,'陆河县','0',338,0,'',1,0,'',0),(2315,'陆丰市','0',338,0,'',1,0,'',0),(2316,'源城区','0',339,0,'',1,0,'',0),(2317,'紫金县','0',339,0,'',1,0,'',0),(2318,'龙川县','0',339,0,'',1,0,'',0),(2319,'连平县','0',339,0,'',1,0,'',0),(2320,'和平县','0',339,0,'',1,0,'',0),(2321,'东源县','0',339,0,'',1,0,'',0),(2322,'江城区','0',340,0,'',1,0,'',0),(2323,'阳西县','0',340,0,'',1,0,'',0),(2324,'阳东县','0',340,0,'',1,0,'',0),(2325,'阳春市','0',340,0,'',1,0,'',0),(2326,'清城区','0',341,0,'',1,0,'',0),(2327,'佛冈县','0',341,0,'',1,0,'',0),(2328,'阳山县','0',341,0,'',1,0,'',0),(2329,'连山壮族瑶族自治县','0',341,0,'',1,0,'',0),(2330,'连南瑶族自治县','0',341,0,'',1,0,'',0),(2331,'清新县','0',341,0,'',1,0,'',0),(2332,'英德市','0',341,0,'',1,0,'',0),(2333,'连州市','0',341,0,'',1,0,'',0),(2334,'湘桥区','0',344,0,'',1,0,'',0),(2335,'潮安县','0',344,0,'',1,0,'',0),(2336,'饶平县','0',344,0,'',1,0,'',0),(2337,'榕城区','0',345,0,'',1,0,'',0),(2338,'揭东县','0',345,0,'',1,0,'',0),(2339,'揭西县','0',345,0,'',1,0,'',0),(2340,'惠来县','0',345,0,'',1,0,'',0),(2341,'普宁市','0',345,0,'',1,0,'',0),(2342,'云城区','0',346,0,'',1,0,'',0),(2343,'新兴县','0',346,0,'',1,0,'',0),(2344,'郁南县','0',346,0,'',1,0,'',0),(2345,'云安县','0',346,0,'',1,0,'',0),(2346,'罗定市','0',346,0,'',1,0,'',0),(2347,'兴宁区','0',347,0,'',1,0,'',0),(2348,'青秀区','0',347,0,'',1,0,'',0),(2349,'江南区','0',347,0,'',1,0,'',0),(2350,'西乡塘区','0',347,0,'',1,0,'',0),(2351,'良庆区','0',347,0,'',1,0,'',0),(2352,'邕宁区','0',347,0,'',1,0,'',0),(2353,'武鸣县','0',347,0,'',1,0,'',0),(2354,'隆安县','0',347,0,'',1,0,'',0),(2355,'马山县','0',347,0,'',1,0,'',0),(2356,'上林县','0',347,0,'',1,0,'',0),(2357,'宾阳县','0',347,0,'',1,0,'',0),(2358,'横县','0',347,0,'',1,0,'',0),(2359,'城中区','0',348,0,'',1,0,'',0),(2360,'鱼峰区','0',348,0,'',1,0,'',0),(2361,'柳南区','0',348,0,'',1,0,'',0),(2362,'柳北区','0',348,0,'',1,0,'',0),(2363,'柳江县','0',348,0,'',1,0,'',0),(2364,'柳城县','0',348,0,'',1,0,'',0),(2365,'鹿寨县','0',348,0,'',1,0,'',0),(2366,'融安县','0',348,0,'',1,0,'',0),(2367,'融水苗族自治县','0',348,0,'',1,0,'',0),(2368,'三江侗族自治县','0',348,0,'',1,0,'',0),(2369,'秀峰区','0',349,0,'',1,0,'',0),(2370,'叠彩区','0',349,0,'',1,0,'',0),(2371,'象山区','0',349,0,'',1,0,'',0),(2372,'七星区','0',349,0,'',1,0,'',0),(2373,'雁山区','0',349,0,'',1,0,'',0),(2374,'阳朔县','0',349,0,'',1,0,'',0),(2375,'临桂县','0',349,0,'',1,0,'',0),(2376,'灵川县','0',349,0,'',1,0,'',0),(2377,'全州县','0',349,0,'',1,0,'',0),(2378,'兴安县','0',349,0,'',1,0,'',0),(2379,'永福县','0',349,0,'',1,0,'',0),(2380,'灌阳县','0',349,0,'',1,0,'',0),(2381,'龙胜各族自治县','0',349,0,'',1,0,'',0),(2382,'资源县','0',349,0,'',1,0,'',0),(2383,'平乐县','0',349,0,'',1,0,'',0),(2384,'荔蒲县','0',349,0,'',1,0,'',0),(2385,'恭城瑶族自治县','0',349,0,'',1,0,'',0),(2386,'万秀区','0',350,0,'',1,0,'',0),(2387,'蝶山区','0',350,0,'',1,0,'',0),(2388,'长洲区','0',350,0,'',1,0,'',0),(2389,'苍梧县','0',350,0,'',1,0,'',0),(2390,'藤县','0',350,0,'',1,0,'',0),(2391,'蒙山县','0',350,0,'',1,0,'',0),(2392,'岑溪市','0',350,0,'',1,0,'',0),(2393,'海城区','0',351,0,'',1,0,'',0),(2394,'银海区','0',351,0,'',1,0,'',0),(2395,'铁山港区','0',351,0,'',1,0,'',0),(2396,'合浦县','0',351,0,'',1,0,'',0),(2397,'港口区','0',352,0,'',1,0,'',0),(2398,'防城区','0',352,0,'',1,0,'',0),(2399,'上思县','0',352,0,'',1,0,'',0),(2400,'东兴市','0',352,0,'',1,0,'',0),(2401,'钦南区','0',353,0,'',1,0,'',0),(2402,'钦北区','0',353,0,'',1,0,'',0),(2403,'灵山县','0',353,0,'',1,0,'',0),(2404,'浦北县','0',353,0,'',1,0,'',0),(2405,'港北区','0',354,0,'',1,0,'',0),(2406,'港南区','0',354,0,'',1,0,'',0),(2407,'覃塘区','0',354,0,'',1,0,'',0),(2408,'平南县','0',354,0,'',1,0,'',0),(2409,'桂平市','0',354,0,'',1,0,'',0),(2410,'玉州区','0',355,0,'',1,0,'',0),(2411,'容县','0',355,0,'',1,0,'',0),(2412,'陆川县','0',355,0,'',1,0,'',0),(2413,'博白县','0',355,0,'',1,0,'',0),(2414,'兴业县','0',355,0,'',1,0,'',0),(2415,'北流市','0',355,0,'',1,0,'',0),(2416,'右江区','0',356,0,'',1,0,'',0),(2417,'田阳县','0',356,0,'',1,0,'',0),(2418,'田东县','0',356,0,'',1,0,'',0),(2419,'平果县','0',356,0,'',1,0,'',0),(2420,'德保县','0',356,0,'',1,0,'',0),(2421,'靖西县','0',356,0,'',1,0,'',0),(2422,'那坡县','0',356,0,'',1,0,'',0),(2423,'凌云县','0',356,0,'',1,0,'',0),(2424,'乐业县','0',356,0,'',1,0,'',0),(2425,'田林县','0',356,0,'',1,0,'',0),(2426,'西林县','0',356,0,'',1,0,'',0),(2427,'隆林各族自治县','0',356,0,'',1,0,'',0),(2428,'八步区','0',357,0,'',1,0,'',0),(2429,'昭平县','0',357,0,'',1,0,'',0),(2430,'钟山县','0',357,0,'',1,0,'',0),(2431,'富川瑶族自治县','0',357,0,'',1,0,'',0),(2432,'金城江区','0',358,0,'',1,0,'',0),(2433,'南丹县','0',358,0,'',1,0,'',0),(2434,'天峨县','0',358,0,'',1,0,'',0),(2435,'凤山县','0',358,0,'',1,0,'',0),(2436,'东兰县','0',358,0,'',1,0,'',0),(2437,'罗城仫佬族自治县','0',358,0,'',1,0,'',0),(2438,'环江毛南族自治县','0',358,0,'',1,0,'',0),(2439,'巴马瑶族自治县','0',358,0,'',1,0,'',0),(2440,'都安瑶族自治县','0',358,0,'',1,0,'',0),(2441,'大化瑶族自治县','0',358,0,'',1,0,'',0),(2442,'宜州市','0',358,0,'',1,0,'',0),(2443,'兴宾区','0',359,0,'',1,0,'',0),(2444,'忻城县','0',359,0,'',1,0,'',0),(2445,'象州县','0',359,0,'',1,0,'',0),(2446,'武宣县','0',359,0,'',1,0,'',0),(2447,'金秀瑶族自治县','0',359,0,'',1,0,'',0),(2448,'合山市','0',359,0,'',1,0,'',0),(2449,'江洲区','0',360,0,'',1,0,'',0),(2450,'扶绥县','0',360,0,'',1,0,'',0),(2451,'宁明县','0',360,0,'',1,0,'',0),(2452,'龙州县','0',360,0,'',1,0,'',0),(2453,'大新县','0',360,0,'',1,0,'',0),(2454,'天等县','0',360,0,'',1,0,'',0),(2455,'凭祥市','0',360,0,'',1,0,'',0),(2456,'秀英区','0',361,0,'',1,0,'',0),(2457,'龙华区','0',361,0,'',1,0,'',0),(2458,'琼山区','0',361,0,'',1,0,'',0),(2459,'美兰区','0',361,0,'',1,0,'',0),(2460,'锦江区','0',382,0,'',1,0,'',0),(2461,'青羊区','0',382,0,'',1,0,'',0),(2462,'金牛区','0',382,0,'',1,0,'',0),(2463,'武侯区','0',382,0,'',1,0,'',0),(2464,'成华区','0',382,0,'',1,0,'',0),(2465,'龙泉驿区','0',382,0,'',1,0,'',0),(2466,'青白江区','0',382,0,'',1,0,'',0),(2467,'新都区','0',382,0,'',1,0,'',0),(2468,'温江区','0',382,0,'',1,0,'',0),(2469,'金堂县','0',382,0,'',1,0,'',0),(2470,'双流县','0',382,0,'',1,0,'',0),(2471,'郫县','0',382,0,'',1,0,'',0),(2472,'大邑县','0',382,0,'',1,0,'',0),(2473,'蒲江县','0',382,0,'',1,0,'',0),(2474,'新津县','0',382,0,'',1,0,'',0),(2475,'都江堰市','0',382,0,'',1,0,'',0),(2476,'彭州市','0',382,0,'',1,0,'',0),(2477,'邛崃市','0',382,0,'',1,0,'',0),(2478,'崇州市','0',382,0,'',1,0,'',0),(2479,'自流井区','0',383,0,'',1,0,'',0),(2480,'贡井区','0',383,0,'',1,0,'',0),(2481,'大安区','0',383,0,'',1,0,'',0),(2482,'沿滩区','0',383,0,'',1,0,'',0),(2483,'荣县','0',383,0,'',1,0,'',0),(2484,'富顺县','0',383,0,'',1,0,'',0),(2485,'东区','0',384,0,'',1,0,'',0),(2486,'西区','0',384,0,'',1,0,'',0),(2487,'仁和区','0',384,0,'',1,0,'',0),(2488,'米易县','0',384,0,'',1,0,'',0),(2489,'盐边县','0',384,0,'',1,0,'',0),(2490,'江阳区','0',385,0,'',1,0,'',0),(2491,'纳溪区','0',385,0,'',1,0,'',0),(2492,'龙马潭区','0',385,0,'',1,0,'',0),(2493,'泸县','0',385,0,'',1,0,'',0),(2494,'合江县','0',385,0,'',1,0,'',0),(2495,'叙永县','0',385,0,'',1,0,'',0),(2496,'古蔺县','0',385,0,'',1,0,'',0),(2497,'旌阳区','0',386,0,'',1,0,'',0),(2498,'中江县','0',386,0,'',1,0,'',0),(2499,'罗江县','0',386,0,'',1,0,'',0),(2500,'广汉市','0',386,0,'',1,0,'',0),(2501,'什邡市','0',386,0,'',1,0,'',0),(2502,'绵竹市','0',386,0,'',1,0,'',0),(2503,'涪城区','0',387,0,'',1,0,'',0),(2504,'游仙区','0',387,0,'',1,0,'',0),(2505,'三台县','0',387,0,'',1,0,'',0),(2506,'盐亭县','0',387,0,'',1,0,'',0),(2507,'安县','0',387,0,'',1,0,'',0),(2508,'梓潼县','0',387,0,'',1,0,'',0),(2509,'北川羌族自治县','0',387,0,'',1,0,'',0),(2510,'平武县','0',387,0,'',1,0,'',0),(2511,'江油市','0',387,0,'',1,0,'',0),(2512,'市中区','0',388,0,'',1,0,'',0),(2513,'元坝区','0',388,0,'',1,0,'',0),(2514,'朝天区','0',388,0,'',1,0,'',0),(2515,'旺苍县','0',388,0,'',1,0,'',0),(2516,'青川县','0',388,0,'',1,0,'',0),(2517,'剑阁县','0',388,0,'',1,0,'',0),(2518,'苍溪县','0',388,0,'',1,0,'',0),(2519,'船山区','0',389,0,'',1,0,'',0),(2520,'安居区','0',389,0,'',1,0,'',0),(2521,'蓬溪县','0',389,0,'',1,0,'',0),(2522,'射洪县','0',389,0,'',1,0,'',0),(2523,'大英县','0',389,0,'',1,0,'',0),(2524,'市中区','0',390,0,'',1,0,'',0),(2525,'东兴区','0',390,0,'',1,0,'',0),(2526,'威远县','0',390,0,'',1,0,'',0),(2527,'资中县','0',390,0,'',1,0,'',0),(2528,'隆昌县','0',390,0,'',1,0,'',0),(2529,'市中区','0',391,0,'',1,0,'',0),(2530,'沙湾区','0',391,0,'',1,0,'',0),(2531,'五通桥区','0',391,0,'',1,0,'',0),(2532,'金口河区','0',391,0,'',1,0,'',0),(2533,'犍为县','0',391,0,'',1,0,'',0),(2534,'井研县','0',391,0,'',1,0,'',0),(2535,'夹江县','0',391,0,'',1,0,'',0),(2536,'沐川县','0',391,0,'',1,0,'',0),(2537,'峨边彝族自治县','0',391,0,'',1,0,'',0),(2538,'马边彝族自治县','0',391,0,'',1,0,'',0),(2539,'峨眉山市','0',391,0,'',1,0,'',0),(2540,'顺庆区','0',392,0,'',1,0,'',0),(2541,'高坪区','0',392,0,'',1,0,'',0),(2542,'嘉陵区','0',392,0,'',1,0,'',0),(2543,'南部县','0',392,0,'',1,0,'',0),(2544,'营山县','0',392,0,'',1,0,'',0),(2545,'蓬安县','0',392,0,'',1,0,'',0),(2546,'仪陇县','0',392,0,'',1,0,'',0),(2547,'西充县','0',392,0,'',1,0,'',0),(2548,'阆中市','0',392,0,'',1,0,'',0),(2549,'东坡区','0',393,0,'',1,0,'',0),(2550,'仁寿县','0',393,0,'',1,0,'',0),(2551,'彭山县','0',393,0,'',1,0,'',0),(2552,'洪雅县','0',393,0,'',1,0,'',0),(2553,'丹棱县','0',393,0,'',1,0,'',0),(2554,'青神县','0',393,0,'',1,0,'',0),(2555,'翠屏区','0',394,0,'',1,0,'',0),(2556,'宜宾县','0',394,0,'',1,0,'',0),(2557,'南溪县','0',394,0,'',1,0,'',0),(2558,'江安县','0',394,0,'',1,0,'',0),(2559,'长宁县','0',394,0,'',1,0,'',0),(2560,'高县','0',394,0,'',1,0,'',0),(2561,'珙县','0',394,0,'',1,0,'',0),(2562,'筠连县','0',394,0,'',1,0,'',0),(2563,'兴文县','0',394,0,'',1,0,'',0),(2564,'屏山县','0',394,0,'',1,0,'',0),(2565,'广安区','0',395,0,'',1,0,'',0),(2566,'岳池县','0',395,0,'',1,0,'',0),(2567,'武胜县','0',395,0,'',1,0,'',0),(2568,'邻水县','0',395,0,'',1,0,'',0),(2569,'华蓥市','0',395,0,'',1,0,'',0),(2570,'通川区','0',396,0,'',1,0,'',0),(2571,'达县','0',396,0,'',1,0,'',0),(2572,'宣汉县','0',396,0,'',1,0,'',0),(2573,'开江县','0',396,0,'',1,0,'',0),(2574,'大竹县','0',396,0,'',1,0,'',0),(2575,'渠县','0',396,0,'',1,0,'',0),(2576,'万源市','0',396,0,'',1,0,'',0),(2577,'雨城区','0',397,0,'',1,0,'',0),(2578,'名山县','0',397,0,'',1,0,'',0),(2579,'荥经县','0',397,0,'',1,0,'',0),(2580,'汉源县','0',397,0,'',1,0,'',0),(2581,'石棉县','0',397,0,'',1,0,'',0),(2582,'天全县','0',397,0,'',1,0,'',0),(2583,'芦山县','0',397,0,'',1,0,'',0),(2584,'宝兴县','0',397,0,'',1,0,'',0),(2585,'巴州区','0',398,0,'',1,0,'',0),(2586,'通江县','0',398,0,'',1,0,'',0),(2587,'南江县','0',398,0,'',1,0,'',0),(2588,'平昌县','0',398,0,'',1,0,'',0),(2589,'雁江区','0',399,0,'',1,0,'',0),(2590,'安岳县','0',399,0,'',1,0,'',0),(2591,'乐至县','0',399,0,'',1,0,'',0),(2592,'简阳市','0',399,0,'',1,0,'',0),(2593,'汶川县','0',400,0,'',1,0,'',0),(2594,'理县','0',400,0,'',1,0,'',0),(2595,'茂县','0',400,0,'',1,0,'',0),(2596,'松潘县','0',400,0,'',1,0,'',0),(2597,'九寨沟县','0',400,0,'',1,0,'',0),(2598,'金川县','0',400,0,'',1,0,'',0),(2599,'小金县','0',400,0,'',1,0,'',0),(2600,'黑水县','0',400,0,'',1,0,'',0),(2601,'马尔康县','0',400,0,'',1,0,'',0),(2602,'壤塘县','0',400,0,'',1,0,'',0),(2603,'阿坝县','0',400,0,'',1,0,'',0),(2604,'若尔盖县','0',400,0,'',1,0,'',0),(2605,'红原县','0',400,0,'',1,0,'',0),(2606,'康定县','0',401,0,'',1,0,'',0),(2607,'泸定县','0',401,0,'',1,0,'',0),(2608,'丹巴县','0',401,0,'',1,0,'',0),(2609,'九龙县','0',401,0,'',1,0,'',0),(2610,'雅江县','0',401,0,'',1,0,'',0),(2611,'道孚县','0',401,0,'',1,0,'',0),(2612,'炉霍县','0',401,0,'',1,0,'',0),(2613,'甘孜县','0',401,0,'',1,0,'',0),(2614,'新龙县','0',401,0,'',1,0,'',0),(2615,'德格县','0',401,0,'',1,0,'',0),(2616,'白玉县','0',401,0,'',1,0,'',0),(2617,'石渠县','0',401,0,'',1,0,'',0),(2618,'色达县','0',401,0,'',1,0,'',0),(2619,'理塘县','0',401,0,'',1,0,'',0),(2620,'巴塘县','0',401,0,'',1,0,'',0),(2621,'乡城县','0',401,0,'',1,0,'',0),(2622,'稻城县','0',401,0,'',1,0,'',0),(2623,'得荣县','0',401,0,'',1,0,'',0),(2624,'西昌市','0',402,0,'',1,0,'',0),(2625,'木里藏族自治县','0',402,0,'',1,0,'',0),(2626,'盐源县','0',402,0,'',1,0,'',0),(2627,'德昌县','0',402,0,'',1,0,'',0),(2628,'会理县','0',402,0,'',1,0,'',0),(2629,'会东县','0',402,0,'',1,0,'',0),(2630,'宁南县','0',402,0,'',1,0,'',0),(2631,'普格县','0',402,0,'',1,0,'',0),(2632,'布拖县','0',402,0,'',1,0,'',0),(2633,'金阳县','0',402,0,'',1,0,'',0),(2634,'昭觉县','0',402,0,'',1,0,'',0),(2635,'喜德县','0',402,0,'',1,0,'',0),(2636,'冕宁县','0',402,0,'',1,0,'',0),(2637,'越西县','0',402,0,'',1,0,'',0),(2638,'甘洛县','0',402,0,'',1,0,'',0),(2639,'美姑县','0',402,0,'',1,0,'',0),(2640,'雷波县','0',402,0,'',1,0,'',0),(2641,'南明区','0',403,0,'',1,0,'',0),(2642,'云岩区','0',403,0,'',1,0,'',0),(2643,'花溪区','0',403,0,'',1,0,'',0),(2644,'乌当区','0',403,0,'',1,0,'',0),(2645,'白云区','0',403,0,'',1,0,'',0),(2646,'小河区','0',403,0,'',1,0,'',0),(2647,'开阳县','0',403,0,'',1,0,'',0),(2648,'息烽县','0',403,0,'',1,0,'',0),(2649,'修文县','0',403,0,'',1,0,'',0),(2650,'清镇市','0',403,0,'',1,0,'',0),(2651,'钟山区','0',404,0,'',1,0,'',0),(2652,'六枝特区','0',404,0,'',1,0,'',0),(2653,'水城县','0',404,0,'',1,0,'',0),(2654,'盘县','0',404,0,'',1,0,'',0),(2655,'红花岗区','0',405,0,'',1,0,'',0),(2656,'汇川区','0',405,0,'',1,0,'',0),(2657,'遵义县','0',405,0,'',1,0,'',0),(2658,'桐梓县','0',405,0,'',1,0,'',0),(2659,'绥阳县','0',405,0,'',1,0,'',0),(2660,'正安县','0',405,0,'',1,0,'',0),(2661,'道真仡佬族苗族自治县','0',405,0,'',1,0,'',0),(2662,'务川仡佬族苗族自治县','0',405,0,'',1,0,'',0),(2663,'凤冈县','0',405,0,'',1,0,'',0),(2664,'湄潭县','0',405,0,'',1,0,'',0),(2665,'余庆县','0',405,0,'',1,0,'',0),(2666,'习水县','0',405,0,'',1,0,'',0),(2667,'赤水市','0',405,0,'',1,0,'',0),(2668,'仁怀市','0',405,0,'',1,0,'',0),(2669,'西秀区','0',406,0,'',1,0,'',0),(2670,'平坝县','0',406,0,'',1,0,'',0),(2671,'普定县','0',406,0,'',1,0,'',0),(2672,'镇宁布依族苗族自治县','0',406,0,'',1,0,'',0),(2673,'关岭布依族苗族自治县','0',406,0,'',1,0,'',0),(2674,'紫云苗族布依族自治县','0',406,0,'',1,0,'',0),(2675,'铜仁市','0',407,0,'',1,0,'',0),(2676,'江口县','0',407,0,'',1,0,'',0),(2677,'玉屏侗族自治县','0',407,0,'',1,0,'',0),(2678,'石阡县','0',407,0,'',1,0,'',0),(2679,'思南县','0',407,0,'',1,0,'',0),(2680,'印江土家族苗族自治县','0',407,0,'',1,0,'',0),(2681,'德江县','0',407,0,'',1,0,'',0),(2682,'沿河土家族自治县','0',407,0,'',1,0,'',0),(2683,'松桃苗族自治县','0',407,0,'',1,0,'',0),(2684,'万山特区','0',407,0,'',1,0,'',0),(2685,'兴义市','0',408,0,'',1,0,'',0),(2686,'兴仁县','0',408,0,'',1,0,'',0),(2687,'普安县','0',408,0,'',1,0,'',0),(2688,'晴隆县','0',408,0,'',1,0,'',0),(2689,'贞丰县','0',408,0,'',1,0,'',0),(2690,'望谟县','0',408,0,'',1,0,'',0),(2691,'册亨县','0',408,0,'',1,0,'',0),(2692,'安龙县','0',408,0,'',1,0,'',0),(2693,'毕节市','0',409,0,'',1,0,'',0),(2694,'大方县','0',409,0,'',1,0,'',0),(2695,'黔西县','0',409,0,'',1,0,'',0),(2696,'金沙县','0',409,0,'',1,0,'',0),(2697,'织金县','0',409,0,'',1,0,'',0),(2698,'纳雍县','0',409,0,'',1,0,'',0),(2699,'威宁彝族回族苗族自治县','0',409,0,'',1,0,'',0),(2700,'赫章县','0',409,0,'',1,0,'',0),(2701,'凯里市','0',410,0,'',1,0,'',0),(2702,'黄平县','0',410,0,'',1,0,'',0),(2703,'施秉县','0',410,0,'',1,0,'',0),(2704,'三穗县','0',410,0,'',1,0,'',0),(2705,'镇远县','0',410,0,'',1,0,'',0),(2706,'岑巩县','0',410,0,'',1,0,'',0),(2707,'天柱县','0',410,0,'',1,0,'',0),(2708,'锦屏县','0',410,0,'',1,0,'',0),(2709,'剑河县','0',410,0,'',1,0,'',0),(2710,'台江县','0',410,0,'',1,0,'',0),(2711,'黎平县','0',410,0,'',1,0,'',0),(2712,'榕江县','0',410,0,'',1,0,'',0),(2713,'从江县','0',410,0,'',1,0,'',0),(2714,'雷山县','0',410,0,'',1,0,'',0),(2715,'麻江县','0',410,0,'',1,0,'',0),(2716,'丹寨县','0',410,0,'',1,0,'',0),(2717,'都匀市','0',411,0,'',1,0,'',0),(2718,'福泉市','0',411,0,'',1,0,'',0),(2719,'荔波县','0',411,0,'',1,0,'',0),(2720,'贵定县','0',411,0,'',1,0,'',0),(2721,'瓮安县','0',411,0,'',1,0,'',0),(2722,'独山县','0',411,0,'',1,0,'',0),(2723,'平塘县','0',411,0,'',1,0,'',0),(2724,'罗甸县','0',411,0,'',1,0,'',0),(2725,'长顺县','0',411,0,'',1,0,'',0),(2726,'龙里县','0',411,0,'',1,0,'',0),(2727,'惠水县','0',411,0,'',1,0,'',0),(2728,'三都水族自治县','0',411,0,'',1,0,'',0),(2729,'五华区','0',412,0,'',1,0,'',0),(2730,'盘龙区','0',412,0,'',1,0,'',0),(2731,'官渡区','0',412,0,'',1,0,'',0),(2732,'西山区','0',412,0,'',1,0,'',0),(2733,'东川区','0',412,0,'',1,0,'',0),(2734,'呈贡县','0',412,0,'',1,0,'',0),(2735,'晋宁县','0',412,0,'',1,0,'',0),(2736,'富民县','0',412,0,'',1,0,'',0),(2737,'宜良县','0',412,0,'',1,0,'',0),(2738,'石林彝族自治县','0',412,0,'',1,0,'',0),(2739,'嵩明县','0',412,0,'',1,0,'',0),(2740,'禄劝彝族苗族自治县','0',412,0,'',1,0,'',0),(2741,'寻甸回族彝族自治县','0',412,0,'',1,0,'',0),(2742,'安宁市','0',412,0,'',1,0,'',0),(2743,'麒麟区','0',413,0,'',1,0,'',0),(2744,'马龙县','0',413,0,'',1,0,'',0),(2745,'陆良县','0',413,0,'',1,0,'',0),(2746,'师宗县','0',413,0,'',1,0,'',0),(2747,'罗平县','0',413,0,'',1,0,'',0),(2748,'富源县','0',413,0,'',1,0,'',0),(2749,'会泽县','0',413,0,'',1,0,'',0),(2750,'沾益县','0',413,0,'',1,0,'',0),(2751,'宣威市','0',413,0,'',1,0,'',0),(2752,'红塔区','0',414,0,'',1,0,'',0),(2753,'江川县','0',414,0,'',1,0,'',0),(2754,'澄江县','0',414,0,'',1,0,'',0),(2755,'通海县','0',414,0,'',1,0,'',0),(2756,'华宁县','0',414,0,'',1,0,'',0),(2757,'易门县','0',414,0,'',1,0,'',0),(2758,'峨山彝族自治县','0',414,0,'',1,0,'',0),(2759,'新平彝族傣族自治县','0',414,0,'',1,0,'',0),(2760,'元江哈尼族彝族傣族自治县','0',414,0,'',1,0,'',0),(2761,'隆阳区','0',415,0,'',1,0,'',0),(2762,'施甸县','0',415,0,'',1,0,'',0),(2763,'腾冲县','0',415,0,'',1,0,'',0),(2764,'龙陵县','0',415,0,'',1,0,'',0),(2765,'昌宁县','0',415,0,'',1,0,'',0),(2766,'昭阳区','0',416,0,'',1,0,'',0),(2767,'鲁甸县','0',416,0,'',1,0,'',0),(2768,'巧家县','0',416,0,'',1,0,'',0),(2769,'盐津县','0',416,0,'',1,0,'',0),(2770,'大关县','0',416,0,'',1,0,'',0),(2771,'永善县','0',416,0,'',1,0,'',0),(2772,'绥江县','0',416,0,'',1,0,'',0),(2773,'镇雄县','0',416,0,'',1,0,'',0),(2774,'彝良县','0',416,0,'',1,0,'',0),(2775,'威信县','0',416,0,'',1,0,'',0),(2776,'水富县','0',416,0,'',1,0,'',0),(2777,'古城区','0',417,0,'',1,0,'',0),(2778,'玉龙纳西族自治县','0',417,0,'',1,0,'',0),(2779,'永胜县','0',417,0,'',1,0,'',0),(2780,'华坪县','0',417,0,'',1,0,'',0),(2781,'宁蒗彝族自治县','0',417,0,'',1,0,'',0),(2782,'翠云区','0',418,0,'',1,0,'',0),(2783,'普洱哈尼族彝族自治县','0',418,0,'',1,0,'',0),(2784,'墨江哈尼族自治县','0',418,0,'',1,0,'',0),(2785,'景东彝族自治县','0',418,0,'',1,0,'',0),(2786,'景谷傣族彝族自治县','0',418,0,'',1,0,'',0),(2787,'镇沅彝族哈尼族拉祜族自治县','0',418,0,'',1,0,'',0),(2788,'江城哈尼族彝族自治县','0',418,0,'',1,0,'',0),(2789,'孟连傣族拉祜族佤族自治县','0',418,0,'',1,0,'',0),(2790,'澜沧拉祜族自治县','0',418,0,'',1,0,'',0),(2791,'西盟佤族自治县','0',418,0,'',1,0,'',0),(2792,'临翔区','0',419,0,'',1,0,'',0),(2793,'凤庆县','0',419,0,'',1,0,'',0),(2794,'云县','0',419,0,'',1,0,'',0),(2795,'永德县','0',419,0,'',1,0,'',0),(2796,'镇康县','0',419,0,'',1,0,'',0),(2797,'双江拉祜族佤族布朗族傣族自治县','0',419,0,'',1,0,'',0),(2798,'耿马傣族佤族自治县','0',419,0,'',1,0,'',0),(2799,'沧源佤族自治县','0',420,0,'',1,0,'',0),(2800,'楚雄市','0',420,0,'',1,0,'',0),(2801,'双柏县','0',420,0,'',1,0,'',0),(2802,'牟定县','0',420,0,'',1,0,'',0),(2803,'南华县','0',420,0,'',1,0,'',0),(2804,'姚安县','0',420,0,'',1,0,'',0),(2805,'大姚县','0',420,0,'',1,0,'',0),(2806,'永仁县','0',420,0,'',1,0,'',0),(2807,'元谋县','0',420,0,'',1,0,'',0),(2808,'武定县','0',420,0,'',1,0,'',0),(2809,'禄丰县','0',420,0,'',1,0,'',0),(2810,'个旧市','0',421,0,'',1,0,'',0),(2811,'开远市','0',421,0,'',1,0,'',0),(2812,'蒙自县','0',421,0,'',1,0,'',0),(2813,'屏边苗族自治县','0',421,0,'',1,0,'',0),(2814,'建水县','0',421,0,'',1,0,'',0),(2815,'石屏县','0',421,0,'',1,0,'',0),(2816,'弥勒县','0',421,0,'',1,0,'',0),(2817,'泸西县','0',421,0,'',1,0,'',0),(2818,'元阳县','0',421,0,'',1,0,'',0),(2819,'红河县','0',421,0,'',1,0,'',0),(2820,'金平苗族瑶族傣族自治县','0',421,0,'',1,0,'',0),(2821,'绿春县','0',421,0,'',1,0,'',0),(2822,'河口瑶族自治县','0',421,0,'',1,0,'',0),(2823,'文山县','0',422,0,'',1,0,'',0),(2824,'砚山县','0',422,0,'',1,0,'',0),(2825,'西畴县','0',422,0,'',1,0,'',0),(2826,'麻栗坡县','0',422,0,'',1,0,'',0),(2827,'马关县','0',422,0,'',1,0,'',0),(2828,'丘北县','0',422,0,'',1,0,'',0),(2829,'广南县','0',422,0,'',1,0,'',0),(2830,'富宁县','0',422,0,'',1,0,'',0),(2831,'景洪市','0',423,0,'',1,0,'',0),(2832,'勐海县','0',423,0,'',1,0,'',0),(2833,'勐腊县','0',423,0,'',1,0,'',0),(2834,'大理市','0',424,0,'',1,0,'',0),(2835,'漾濞彝族自治县','0',424,0,'',1,0,'',0),(2836,'祥云县','0',424,0,'',1,0,'',0),(2837,'宾川县','0',424,0,'',1,0,'',0),(2838,'弥渡县','0',424,0,'',1,0,'',0),(2839,'南涧彝族自治县','0',424,0,'',1,0,'',0),(2840,'巍山彝族回族自治县','0',424,0,'',1,0,'',0),(2841,'永平县','0',424,0,'',1,0,'',0),(2842,'云龙县','0',424,0,'',1,0,'',0),(2843,'洱源县','0',424,0,'',1,0,'',0),(2844,'剑川县','0',424,0,'',1,0,'',0),(2845,'鹤庆县','0',424,0,'',1,0,'',0),(2846,'瑞丽市','0',425,0,'',1,0,'',0),(2847,'潞西市','0',425,0,'',1,0,'',0),(2848,'梁河县','0',425,0,'',1,0,'',0),(2849,'盈江县','0',425,0,'',1,0,'',0),(2850,'陇川县','0',425,0,'',1,0,'',0),(2851,'泸水县','0',426,0,'',1,0,'',0),(2852,'福贡县','0',426,0,'',1,0,'',0),(2853,'贡山独龙族怒族自治县','0',426,0,'',1,0,'',0),(2854,'兰坪白族普米族自治县','0',426,0,'',1,0,'',0),(2855,'香格里拉县','0',427,0,'',1,0,'',0),(2856,'德钦县','0',427,0,'',1,0,'',0),(2857,'维西傈僳族自治县','0',427,0,'',1,0,'',0),(2858,'城关区','0',428,0,'',1,0,'',0),(2859,'林周县','0',428,0,'',1,0,'',0),(2860,'当雄县','0',428,0,'',1,0,'',0),(2861,'尼木县','0',428,0,'',1,0,'',0),(2862,'曲水县','0',428,0,'',1,0,'',0),(2863,'堆龙德庆县','0',428,0,'',1,0,'',0),(2864,'达孜县','0',428,0,'',1,0,'',0),(2865,'墨竹工卡县','0',428,0,'',1,0,'',0),(2866,'昌都县','0',429,0,'',1,0,'',0),(2867,'江达县','0',429,0,'',1,0,'',0),(2868,'贡觉县','0',429,0,'',1,0,'',0),(2869,'类乌齐县','0',429,0,'',1,0,'',0),(2870,'丁青县','0',429,0,'',1,0,'',0),(2871,'察雅县','0',429,0,'',1,0,'',0),(2872,'八宿县','0',429,0,'',1,0,'',0),(2873,'左贡县','0',429,0,'',1,0,'',0),(2874,'芒康县','0',429,0,'',1,0,'',0),(2875,'洛隆县','0',429,0,'',1,0,'',0),(2876,'边坝县','0',429,0,'',1,0,'',0),(2877,'乃东县','0',430,0,'',1,0,'',0),(2878,'扎囊县','0',430,0,'',1,0,'',0),(2879,'贡嘎县','0',430,0,'',1,0,'',0),(2880,'桑日县','0',430,0,'',1,0,'',0),(2881,'琼结县','0',430,0,'',1,0,'',0),(2882,'曲松县','0',430,0,'',1,0,'',0),(2883,'措美县','0',430,0,'',1,0,'',0),(2884,'洛扎县','0',430,0,'',1,0,'',0),(2885,'加查县','0',430,0,'',1,0,'',0),(2886,'隆子县','0',430,0,'',1,0,'',0),(2887,'错那县','0',430,0,'',1,0,'',0),(2888,'浪卡子县','0',430,0,'',1,0,'',0),(2889,'日喀则市','0',431,0,'',1,0,'',0),(2890,'南木林县','0',431,0,'',1,0,'',0),(2891,'江孜县','0',431,0,'',1,0,'',0),(2892,'定日县','0',431,0,'',1,0,'',0),(2893,'萨迦县','0',431,0,'',1,0,'',0),(2894,'拉孜县','0',431,0,'',1,0,'',0),(2895,'昂仁县','0',431,0,'',1,0,'',0),(2896,'谢通门县','0',431,0,'',1,0,'',0),(2897,'白朗县','0',431,0,'',1,0,'',0),(2898,'仁布县','0',431,0,'',1,0,'',0),(2899,'康马县','0',431,0,'',1,0,'',0),(2900,'定结县','0',431,0,'',1,0,'',0),(2901,'仲巴县','0',431,0,'',1,0,'',0),(2902,'亚东县','0',431,0,'',1,0,'',0),(2903,'吉隆县','0',431,0,'',1,0,'',0),(2904,'聂拉木县','0',431,0,'',1,0,'',0),(2905,'萨嘎县','0',431,0,'',1,0,'',0),(2906,'岗巴县','0',431,0,'',1,0,'',0),(2907,'那曲县','0',432,0,'',1,0,'',0),(2908,'嘉黎县','0',432,0,'',1,0,'',0),(2909,'比如县','0',432,0,'',1,0,'',0),(2910,'聂荣县','0',432,0,'',1,0,'',0),(2911,'安多县','0',432,0,'',1,0,'',0),(2912,'申扎县','0',432,0,'',1,0,'',0),(2913,'索县','0',432,0,'',1,0,'',0),(2914,'班戈县','0',432,0,'',1,0,'',0),(2915,'巴青县','0',432,0,'',1,0,'',0),(2916,'尼玛县','0',432,0,'',1,0,'',0),(2917,'普兰县','0',433,0,'',1,0,'',0),(2918,'札达县','0',433,0,'',1,0,'',0),(2919,'噶尔县','0',433,0,'',1,0,'',0),(2920,'日土县','0',433,0,'',1,0,'',0),(2921,'革吉县','0',433,0,'',1,0,'',0),(2922,'改则县','0',433,0,'',1,0,'',0),(2923,'措勤县','0',433,0,'',1,0,'',0),(2924,'林芝县','0',434,0,'',1,0,'',0),(2925,'工布江达县','0',434,0,'',1,0,'',0),(2926,'米林县','0',434,0,'',1,0,'',0),(2927,'墨脱县','0',434,0,'',1,0,'',0),(2928,'波密县','0',434,0,'',1,0,'',0),(2929,'察隅县','0',434,0,'',1,0,'',0),(2930,'朗县','0',434,0,'',1,0,'',0),(2931,'新城区','0',435,0,'',1,0,'',0),(2932,'碑林区','0',435,0,'',1,0,'',0),(2933,'莲湖区','0',435,0,'',1,0,'',0),(2934,'灞桥区','0',435,0,'',1,0,'',0),(2935,'未央区','0',435,0,'',1,0,'',0),(2936,'雁塔区','0',435,0,'',1,0,'',0),(2937,'阎良区','0',435,0,'',1,0,'',0),(2938,'临潼区','0',435,0,'',1,0,'',0),(2939,'长安区','0',435,0,'',1,0,'',0),(2940,'蓝田县','0',435,0,'',1,0,'',0),(2941,'周至县','0',435,0,'',1,0,'',0),(2942,'户县','0',435,0,'',1,0,'',0),(2943,'高陵县','0',435,0,'',1,0,'',0),(2944,'王益区','0',436,0,'',1,0,'',0),(2945,'印台区','0',436,0,'',1,0,'',0),(2946,'耀州区','0',436,0,'',1,0,'',0),(2947,'宜君县','0',436,0,'',1,0,'',0),(2948,'渭滨区','0',437,0,'',1,0,'',0),(2949,'金台区','0',437,0,'',1,0,'',0),(2950,'陈仓区','0',437,0,'',1,0,'',0),(2951,'凤翔县','0',437,0,'',1,0,'',0),(2952,'岐山县','0',437,0,'',1,0,'',0),(2953,'扶风县','0',437,0,'',1,0,'',0),(2954,'眉县','0',437,0,'',1,0,'',0),(2955,'陇县','0',437,0,'',1,0,'',0),(2956,'千阳县','0',437,0,'',1,0,'',0),(2957,'麟游县','0',437,0,'',1,0,'',0),(2958,'凤县','0',437,0,'',1,0,'',0),(2959,'太白县','0',437,0,'',1,0,'',0),(2960,'秦都区','0',438,0,'',1,0,'',0),(2961,'杨凌区','0',438,0,'',1,0,'',0),(2962,'渭城区','0',438,0,'',1,0,'',0),(2963,'三原县','0',438,0,'',1,0,'',0),(2964,'泾阳县','0',438,0,'',1,0,'',0),(2965,'乾县','0',438,0,'',1,0,'',0),(2966,'礼泉县','0',438,0,'',1,0,'',0),(2967,'永寿县','0',438,0,'',1,0,'',0),(2968,'彬县','0',438,0,'',1,0,'',0),(2969,'长武县','0',438,0,'',1,0,'',0),(2970,'旬邑县','0',438,0,'',1,0,'',0),(2971,'淳化县','0',438,0,'',1,0,'',0),(2972,'武功县','0',438,0,'',1,0,'',0),(2973,'兴平市','0',438,0,'',1,0,'',0),(2974,'临渭区','0',439,0,'',1,0,'',0),(2975,'华县','0',439,0,'',1,0,'',0),(2976,'潼关县','0',439,0,'',1,0,'',0),(2977,'大荔县','0',439,0,'',1,0,'',0),(2978,'合阳县','0',439,0,'',1,0,'',0),(2979,'澄城县','0',439,0,'',1,0,'',0),(2980,'蒲城县','0',439,0,'',1,0,'',0),(2981,'白水县','0',439,0,'',1,0,'',0),(2982,'富平县','0',439,0,'',1,0,'',0),(2983,'韩城市','0',439,0,'',1,0,'',0),(2984,'华阴市','0',439,0,'',1,0,'',0),(2985,'宝塔区','0',440,0,'',1,0,'',0),(2986,'延长县','0',440,0,'',1,0,'',0),(2987,'延川县','0',440,0,'',1,0,'',0),(2988,'子长县','0',440,0,'',1,0,'',0),(2989,'安塞县','0',440,0,'',1,0,'',0),(2990,'志丹县','0',440,0,'',1,0,'',0),(2991,'吴起县','0',440,0,'',1,0,'',0),(2992,'甘泉县','0',440,0,'',1,0,'',0),(2993,'富县','0',440,0,'',1,0,'',0),(2994,'洛川县','0',440,0,'',1,0,'',0),(2995,'宜川县','0',440,0,'',1,0,'',0),(2996,'黄龙县','0',440,0,'',1,0,'',0),(2997,'黄陵县','0',440,0,'',1,0,'',0),(2998,'汉台区','0',441,0,'',1,0,'',0),(2999,'南郑县','0',441,0,'',1,0,'',0),(3000,'城固县','0',441,0,'',1,0,'',0),(3001,'洋县','0',441,0,'',1,0,'',0),(3002,'西乡县','0',441,0,'',1,0,'',0),(3003,'勉县','0',441,0,'',1,0,'',0),(3004,'宁强县','0',441,0,'',1,0,'',0),(3005,'略阳县','0',441,0,'',1,0,'',0),(3006,'镇巴县','0',441,0,'',1,0,'',0),(3007,'留坝县','0',441,0,'',1,0,'',0),(3008,'佛坪县','0',441,0,'',1,0,'',0),(3009,'榆阳区','0',442,0,'',1,0,'',0),(3010,'神木县','0',442,0,'',1,0,'',0),(3011,'府谷县','0',442,0,'',1,0,'',0),(3012,'横山县','0',442,0,'',1,0,'',0),(3013,'靖边县','0',442,0,'',1,0,'',0),(3014,'定边县','0',442,0,'',1,0,'',0),(3015,'绥德县','0',442,0,'',1,0,'',0),(3016,'米脂县','0',442,0,'',1,0,'',0),(3017,'佳县','0',442,0,'',1,0,'',0),(3018,'吴堡县','0',442,0,'',1,0,'',0),(3019,'清涧县','0',442,0,'',1,0,'',0),(3020,'子洲县','0',442,0,'',1,0,'',0),(3021,'汉滨区','0',443,0,'',1,0,'',0),(3022,'汉阴县','0',443,0,'',1,0,'',0),(3023,'石泉县','0',443,0,'',1,0,'',0),(3024,'宁陕县','0',443,0,'',1,0,'',0),(3025,'紫阳县','0',443,0,'',1,0,'',0),(3026,'岚皋县','0',443,0,'',1,0,'',0),(3027,'平利县','0',443,0,'',1,0,'',0),(3028,'镇坪县','0',443,0,'',1,0,'',0),(3029,'旬阳县','0',443,0,'',1,0,'',0),(3030,'白河县','0',443,0,'',1,0,'',0),(3031,'商州区','0',444,0,'',1,0,'',0),(3032,'洛南县','0',444,0,'',1,0,'',0),(3033,'丹凤县','0',444,0,'',1,0,'',0),(3034,'商南县','0',444,0,'',1,0,'',0),(3035,'山阳县','0',444,0,'',1,0,'',0),(3036,'镇安县','0',444,0,'',1,0,'',0),(3037,'柞水县','0',444,0,'',1,0,'',0),(3038,'城关区','0',445,0,'',1,0,'',0),(3039,'七里河区','0',445,0,'',1,0,'',0),(3040,'西固区','0',445,0,'',1,0,'',0),(3041,'安宁区','0',445,0,'',1,0,'',0),(3042,'红古区','0',445,0,'',1,0,'',0),(3043,'永登县','0',445,0,'',1,0,'',0),(3044,'皋兰县','0',445,0,'',1,0,'',0),(3045,'榆中县','0',445,0,'',1,0,'',0),(3046,'金川区','0',447,0,'',1,0,'',0),(3047,'永昌县','0',447,0,'',1,0,'',0),(3048,'白银区','0',448,0,'',1,0,'',0),(3049,'平川区','0',448,0,'',1,0,'',0),(3050,'靖远县','0',448,0,'',1,0,'',0),(3051,'会宁县','0',448,0,'',1,0,'',0),(3052,'景泰县','0',448,0,'',1,0,'',0),(3053,'秦城区','0',449,0,'',1,0,'',0),(3054,'北道区','0',449,0,'',1,0,'',0),(3055,'清水县','0',449,0,'',1,0,'',0),(3056,'秦安县','0',449,0,'',1,0,'',0),(3057,'甘谷县','0',449,0,'',1,0,'',0),(3058,'武山县','0',449,0,'',1,0,'',0),(3059,'张家川回族自治县','0',449,0,'',1,0,'',0),(3060,'凉州区','0',450,0,'',1,0,'',0),(3061,'民勤县','0',450,0,'',1,0,'',0),(3062,'古浪县','0',450,0,'',1,0,'',0),(3063,'天祝藏族自治县','0',450,0,'',1,0,'',0),(3064,'甘州区','0',451,0,'',1,0,'',0),(3065,'肃南裕固族自治县','0',451,0,'',1,0,'',0),(3066,'民乐县','0',451,0,'',1,0,'',0),(3067,'临泽县','0',451,0,'',1,0,'',0),(3068,'高台县','0',451,0,'',1,0,'',0),(3069,'山丹县','0',451,0,'',1,0,'',0),(3070,'崆峒区','0',452,0,'',1,0,'',0),(3071,'泾川县','0',452,0,'',1,0,'',0),(3072,'灵台县','0',452,0,'',1,0,'',0),(3073,'崇信县','0',452,0,'',1,0,'',0),(3074,'华亭县','0',452,0,'',1,0,'',0),(3075,'庄浪县','0',452,0,'',1,0,'',0),(3076,'静宁县','0',452,0,'',1,0,'',0),(3077,'肃州区','0',453,0,'',1,0,'',0),(3078,'金塔县','0',453,0,'',1,0,'',0),(3079,'瓜州县','0',453,0,'',1,0,'',0),(3080,'肃北蒙古族自治县','0',453,0,'',1,0,'',0),(3081,'阿克塞哈萨克族自治县','0',453,0,'',1,0,'',0),(3082,'玉门市','0',453,0,'',1,0,'',0),(3083,'敦煌市','0',453,0,'',1,0,'',0),(3084,'西峰区','0',454,0,'',1,0,'',0),(3085,'庆城县','0',454,0,'',1,0,'',0),(3086,'环县','0',454,0,'',1,0,'',0),(3087,'华池县','0',454,0,'',1,0,'',0),(3088,'合水县','0',454,0,'',1,0,'',0),(3089,'正宁县','0',454,0,'',1,0,'',0),(3090,'宁县','0',454,0,'',1,0,'',0),(3091,'镇原县','0',454,0,'',1,0,'',0),(3092,'安定区','0',455,0,'',1,0,'',0),(3093,'通渭县','0',455,0,'',1,0,'',0),(3094,'陇西县','0',455,0,'',1,0,'',0),(3095,'渭源县','0',455,0,'',1,0,'',0),(3096,'临洮县','0',455,0,'',1,0,'',0),(3097,'漳县','0',455,0,'',1,0,'',0),(3098,'岷县','0',455,0,'',1,0,'',0),(3099,'武都区','0',456,0,'',1,0,'',0),(3100,'成县','0',456,0,'',1,0,'',0),(3101,'文县','0',456,0,'',1,0,'',0),(3102,'宕昌县','0',456,0,'',1,0,'',0),(3103,'康县','0',456,0,'',1,0,'',0),(3104,'西和县','0',456,0,'',1,0,'',0),(3105,'礼县','0',456,0,'',1,0,'',0),(3106,'徽县','0',456,0,'',1,0,'',0),(3107,'两当县','0',456,0,'',1,0,'',0),(3108,'临夏市','0',457,0,'',1,0,'',0),(3109,'临夏县','0',457,0,'',1,0,'',0),(3110,'康乐县','0',457,0,'',1,0,'',0),(3111,'永靖县','0',457,0,'',1,0,'',0),(3112,'广河县','0',457,0,'',1,0,'',0),(3113,'和政县','0',457,0,'',1,0,'',0),(3114,'东乡族自治县','0',457,0,'',1,0,'',0),(3115,'积石山保安族东乡族撒拉族自治县','0',457,0,'',1,0,'',0),(3116,'合作市','0',458,0,'',1,0,'',0),(3117,'临潭县','0',458,0,'',1,0,'',0),(3118,'卓尼县','0',458,0,'',1,0,'',0),(3119,'舟曲县','0',458,0,'',1,0,'',0),(3120,'迭部县','0',458,0,'',1,0,'',0),(3121,'玛曲县','0',458,0,'',1,0,'',0),(3122,'碌曲县','0',458,0,'',1,0,'',0),(3123,'夏河县','0',458,0,'',1,0,'',0),(3124,'城东区','0',459,0,'',1,0,'',0),(3125,'城中区','0',459,0,'',1,0,'',0),(3126,'城西区','0',459,0,'',1,0,'',0),(3127,'城北区','0',459,0,'',1,0,'',0),(3128,'大通回族土族自治县','0',459,0,'',1,0,'',0),(3129,'湟中县','0',459,0,'',1,0,'',0),(3130,'湟源县','0',459,0,'',1,0,'',0),(3131,'平安县','0',460,0,'',1,0,'',0),(3132,'民和回族土族自治县','0',460,0,'',1,0,'',0),(3133,'乐都县','0',460,0,'',1,0,'',0),(3134,'互助土族自治县','0',460,0,'',1,0,'',0),(3135,'化隆回族自治县','0',460,0,'',1,0,'',0),(3136,'循化撒拉族自治县','0',460,0,'',1,0,'',0),(3137,'门源回族自治县','0',461,0,'',1,0,'',0),(3138,'祁连县','0',461,0,'',1,0,'',0),(3139,'海晏县','0',461,0,'',1,0,'',0),(3140,'刚察县','0',461,0,'',1,0,'',0),(3141,'同仁县','0',462,0,'',1,0,'',0),(3142,'尖扎县','0',462,0,'',1,0,'',0),(3143,'泽库县','0',462,0,'',1,0,'',0),(3144,'河南蒙古族自治县','0',462,0,'',1,0,'',0),(3145,'共和县','0',463,0,'',1,0,'',0),(3146,'同德县','0',463,0,'',1,0,'',0),(3147,'贵德县','0',463,0,'',1,0,'',0),(3148,'兴海县','0',463,0,'',1,0,'',0),(3149,'贵南县','0',463,0,'',1,0,'',0),(3150,'玛沁县','0',464,0,'',1,0,'',0),(3151,'班玛县','0',464,0,'',1,0,'',0),(3152,'甘德县','0',464,0,'',1,0,'',0),(3153,'达日县','0',464,0,'',1,0,'',0),(3154,'久治县','0',464,0,'',1,0,'',0),(3155,'玛多县','0',464,0,'',1,0,'',0),(3156,'玉树县','0',465,0,'',1,0,'',0),(3157,'杂多县','0',465,0,'',1,0,'',0),(3158,'称多县','0',465,0,'',1,0,'',0),(3159,'治多县','0',465,0,'',1,0,'',0),(3160,'囊谦县','0',465,0,'',1,0,'',0),(3161,'曲麻莱县','0',465,0,'',1,0,'',0),(3162,'格尔木市','0',466,0,'',1,0,'',0),(3163,'德令哈市','0',466,0,'',1,0,'',0),(3164,'乌兰县','0',466,0,'',1,0,'',0),(3165,'都兰县','0',466,0,'',1,0,'',0),(3166,'天峻县','0',466,0,'',1,0,'',0),(3167,'兴庆区','0',467,0,'',1,0,'',0),(3168,'西夏区','0',467,0,'',1,0,'',0),(3169,'金凤区','0',467,0,'',1,0,'',0),(3170,'永宁县','0',467,0,'',1,0,'',0),(3171,'贺兰县','0',467,0,'',1,0,'',0),(3172,'灵武市','0',467,0,'',1,0,'',0),(3173,'大武口区','0',468,0,'',1,0,'',0),(3174,'惠农区','0',468,0,'',1,0,'',0),(3175,'平罗县','0',468,0,'',1,0,'',0),(3176,'利通区','0',469,0,'',1,0,'',0),(3177,'盐池县','0',469,0,'',1,0,'',0),(3178,'同心县','0',469,0,'',1,0,'',0),(3179,'青铜峡市','0',469,0,'',1,0,'',0),(3180,'原州区','0',470,0,'',1,0,'',0),(3181,'西吉县','0',470,0,'',1,0,'',0),(3182,'隆德县','0',470,0,'',1,0,'',0),(3183,'泾源县','0',470,0,'',1,0,'',0),(3184,'彭阳县','0',470,0,'',1,0,'',0),(3185,'沙坡头区','0',471,0,'',1,0,'',0),(3186,'中宁县','0',471,0,'',1,0,'',0),(3187,'海原县','0',471,0,'',1,0,'',0),(3188,'天山区','0',472,0,'',1,0,'',0),(3189,'沙依巴克区','0',472,0,'',1,0,'',0),(3190,'新市区','0',472,0,'',1,0,'',0),(3191,'水磨沟区','0',472,0,'',1,0,'',0),(3192,'头屯河区','0',472,0,'',1,0,'',0),(3193,'达坂城区','0',472,0,'',1,0,'',0),(3194,'东山区','0',472,0,'',1,0,'',0),(3195,'乌鲁木齐县','0',472,0,'',1,0,'',0),(3196,'独山子区','0',473,0,'',1,0,'',0),(3197,'克拉玛依区','0',473,0,'',1,0,'',0),(3198,'白碱滩区','0',473,0,'',1,0,'',0),(3199,'乌尔禾区','0',473,0,'',1,0,'',0),(3200,'吐鲁番市','0',474,0,'',1,0,'',0),(3201,'鄯善县','0',474,0,'',1,0,'',0),(3202,'托克逊县','0',474,0,'',1,0,'',0),(3203,'哈密市','0',475,0,'',1,0,'',0),(3204,'巴里坤哈萨克自治县','0',475,0,'',1,0,'',0),(3205,'伊吾县','0',475,0,'',1,0,'',0),(3206,'昌吉市','0',476,0,'',1,0,'',0),(3207,'阜康市','0',476,0,'',1,0,'',0),(3208,'米泉市','0',476,0,'',1,0,'',0),(3209,'呼图壁县','0',476,0,'',1,0,'',0),(3210,'玛纳斯县','0',476,0,'',1,0,'',0),(3211,'奇台县','0',476,0,'',1,0,'',0),(3212,'吉木萨尔县','0',476,0,'',1,0,'',0),(3213,'木垒哈萨克自治县','0',476,0,'',1,0,'',0),(3214,'博乐市','0',477,0,'',1,0,'',0),(3215,'精河县','0',477,0,'',1,0,'',0),(3216,'温泉县','0',477,0,'',1,0,'',0),(3217,'库尔勒市','0',478,0,'',1,0,'',0),(3218,'轮台县','0',478,0,'',1,0,'',0),(3219,'尉犁县','0',478,0,'',1,0,'',0),(3220,'若羌县','0',478,0,'',1,0,'',0),(3221,'且末县','0',478,0,'',1,0,'',0),(3222,'焉耆回族自治县','0',478,0,'',1,0,'',0),(3223,'和静县','0',478,0,'',1,0,'',0),(3224,'和硕县','0',478,0,'',1,0,'',0),(3225,'博湖县','0',478,0,'',1,0,'',0),(3226,'阿克苏市','0',479,0,'',1,0,'',0),(3227,'温宿县','0',479,0,'',1,0,'',0),(3228,'库车县','0',479,0,'',1,0,'',0),(3229,'沙雅县','0',479,0,'',1,0,'',0),(3230,'新和县','0',479,0,'',1,0,'',0),(3231,'拜城县','0',479,0,'',1,0,'',0),(3232,'乌什县','0',479,0,'',1,0,'',0),(3233,'阿瓦提县','0',479,0,'',1,0,'',0),(3234,'柯坪县','0',479,0,'',1,0,'',0),(3235,'阿图什市','0',480,0,'',1,0,'',0),(3236,'阿克陶县','0',480,0,'',1,0,'',0),(3237,'阿合奇县','0',480,0,'',1,0,'',0),(3238,'乌恰县','0',480,0,'',1,0,'',0),(3239,'喀什市','0',481,0,'',1,0,'',0),(3240,'疏附县','0',481,0,'',1,0,'',0),(3241,'疏勒县','0',481,0,'',1,0,'',0),(3242,'英吉沙县','0',481,0,'',1,0,'',0),(3243,'泽普县','0',481,0,'',1,0,'',0),(3244,'莎车县','0',481,0,'',1,0,'',0),(3245,'叶城县','0',481,0,'',1,0,'',0),(3246,'麦盖提县','0',481,0,'',1,0,'',0),(3247,'岳普湖县','0',481,0,'',1,0,'',0),(3248,'伽师县','0',481,0,'',1,0,'',0),(3249,'巴楚县','0',481,0,'',1,0,'',0),(3250,'塔什库尔干塔吉克自治县','0',481,0,'',1,0,'',0),(3251,'和田市','0',482,0,'',1,0,'',0),(3252,'和田县','0',482,0,'',1,0,'',0),(3253,'墨玉县','0',482,0,'',1,0,'',0),(3254,'皮山县','0',482,0,'',1,0,'',0),(3255,'洛浦县','0',482,0,'',1,0,'',0),(3256,'策勒县','0',482,0,'',1,0,'',0),(3257,'于田县','0',482,0,'',1,0,'',0),(3258,'民丰县','0',482,0,'',1,0,'',0),(3259,'伊宁市','0',483,0,'',1,0,'',0),(3260,'奎屯市','0',483,0,'',1,0,'',0),(3261,'伊宁县','0',483,0,'',1,0,'',0),(3262,'察布查尔锡伯自治县','0',483,0,'',1,0,'',0),(3263,'霍城县','0',483,0,'',1,0,'',0),(3264,'巩留县','0',483,0,'',1,0,'',0),(3265,'新源县','0',483,0,'',1,0,'',0),(3266,'昭苏县','0',483,0,'',1,0,'',0),(3267,'特克斯县','0',483,0,'',1,0,'',0),(3268,'尼勒克县','0',483,0,'',1,0,'',0),(3269,'塔城市','0',484,0,'',1,0,'',0),(3270,'乌苏市','0',484,0,'',1,0,'',0),(3271,'额敏县','0',484,0,'',1,0,'',0),(3272,'沙湾县','0',484,0,'',1,0,'',0),(3273,'托里县','0',484,0,'',1,0,'',0),(3274,'裕民县','0',484,0,'',1,0,'',0),(3275,'和布克赛尔蒙古自治县','0',484,0,'',1,0,'',0),(3276,'阿勒泰市','0',485,0,'',1,0,'',0),(3277,'布尔津县','0',485,0,'',1,0,'',0),(3278,'富蕴县','0',485,0,'',1,0,'',0),(3279,'福海县','0',485,0,'',1,0,'',0),(3280,'哈巴河县','0',485,0,'',1,0,'',0),(3281,'青河县','0',485,0,'',1,0,'',0),(3282,'吉木乃县','0',485,0,'',1,0,'',0),(3358,'钓鱼岛','',0,0,'',1,0,'',0),(3359,'钓鱼岛','',3358,0,'',1,0,'',0);

/*Table structure for table `v9_log` */

DROP TABLE IF EXISTS `v9_log`;

CREATE TABLE `v9_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(15) NOT NULL,
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`logid`),
  KEY `module` (`module`,`file`,`action`),
  KEY `username` (`username`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_log` */

/*Table structure for table `v9_member` */

DROP TABLE IF EXISTS `v9_member`;

CREATE TABLE `v9_member` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `phpssouid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '',
  `lastip` char(15) NOT NULL DEFAULT '',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` char(32) NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vip` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overduedate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `connectid` char(30) NOT NULL DEFAULT '',
  `from` char(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20)),
  KEY `phpssouid` (`phpssouid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_member` */

/*Table structure for table `v9_member_detail` */

DROP TABLE IF EXISTS `v9_member_detail`;

CREATE TABLE `v9_member_detail` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_member_detail` */

/*Table structure for table `v9_member_group` */

DROP TABLE IF EXISTS `v9_member_group`;

CREATE TABLE `v9_member_group` (
  `groupid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `starnum` tinyint(2) unsigned NOT NULL,
  `point` smallint(6) unsigned NOT NULL,
  `allowmessage` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowvisit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpostverify` tinyint(1) unsigned NOT NULL,
  `allowsearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowupgrade` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowsendmessage` tinyint(1) unsigned NOT NULL,
  `allowpostnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowattachment` tinyint(1) NOT NULL,
  `price_y` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_m` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_d` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `icon` char(30) NOT NULL,
  `usernamecolor` char(7) NOT NULL,
  `description` char(100) NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `disabled` (`disabled`),
  KEY `listorder` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `v9_member_group` */

insert  into `v9_member_group`(`groupid`,`name`,`issystem`,`starnum`,`point`,`allowmessage`,`allowvisit`,`allowpost`,`allowpostverify`,`allowsearch`,`allowupgrade`,`allowsendmessage`,`allowpostnum`,`allowattachment`,`price_y`,`price_m`,`price_d`,`icon`,`usernamecolor`,`description`,`sort`,`disabled`) values (8,'游客',1,0,0,0,0,0,0,1,0,0,0,0,'0.00','0.00','0.00','','','',0,0),(2,'新手上路',1,1,50,100,1,1,0,0,0,1,0,0,'50.00','10.00','1.00','','','',2,0),(6,'注册会员',1,2,100,150,0,1,0,0,1,1,0,0,'300.00','30.00','1.00','','','',6,0),(4,'中级会员',1,3,150,500,1,1,0,1,1,1,0,0,'500.00','60.00','1.00','','','',4,0),(5,'高级会员',1,5,300,999,1,1,0,1,1,1,0,0,'360.00','90.00','5.00','','','',5,0),(1,'禁止访问',1,0,0,0,1,1,0,1,0,0,0,0,'0.00','0.00','0.00','','','0',0,0),(7,'邮件认证',1,0,0,0,0,0,0,0,0,0,0,0,'0.00','0.00','0.00','images/group/vip.jpg','#000000','',7,0);

/*Table structure for table `v9_member_menu` */

DROP TABLE IF EXISTS `v9_member_menu`;

CREATE TABLE `v9_member_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `isurl` enum('1','0') NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `v9_member_menu` */

insert  into `v9_member_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`,`isurl`,`url`) values (1,'member_init',0,'member','index','init','t=0',0,'1','',''),(2,'account_manage',0,'member','index','account_manage','t=1',0,'1','',''),(3,'favorite',0,'member','index','favorite','t=2',0,'1','','');

/*Table structure for table `v9_member_verify` */

DROP TABLE IF EXISTS `v9_member_verify`;

CREATE TABLE `v9_member_verify` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL,
  `regip` char(15) NOT NULL,
  `email` char(32) NOT NULL,
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `modelinfo` char(255) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message` char(100) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_member_verify` */

/*Table structure for table `v9_member_vip` */

DROP TABLE IF EXISTS `v9_member_vip`;

CREATE TABLE `v9_member_vip` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_member_vip` */

/*Table structure for table `v9_menu` */

DROP TABLE IF EXISTS `v9_menu`;

CREATE TABLE `v9_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=1501 DEFAULT CHARSET=utf8;

/*Data for the table `v9_menu` */

insert  into `v9_menu`(`id`,`name`,`parentid`,`m`,`c`,`a`,`data`,`listorder`,`display`) values (1,'sys_setting',0,'admin','setting','init','',1,'1'),(2,'module',0,'admin','module','init','',2,'1'),(872,'sync_release_point',873,'release','index','init','',3,'1'),(4,'content',0,'content','content','init','',4,'1'),(5,'members',0,'member','member','init','',5,'1'),(6,'userinterface',0,'template','style','init','',6,'1'),(30,'correlative_setting',1,'admin','admin','admin','',0,'1'),(31,'menu_manage',977,'admin','menu','init','',8,'1'),(32,'posid_manage',975,'admin','position','init','',7,'1'),(29,'module_manage',2,'admin','module','','',0,'1'),(9,'plugin',0,'admin','plugin','init','',8,'1'),(10,'panel',0,'admin','index','public_main','',0,'1'),(35,'menu_add',31,'admin','menu','add','',0,'1'),(826,'template_manager',6,'','','','',0,'1'),(54,'admin_manage',49,'admin','admin_manage','init','',0,'1'),(43,'category_manage',975,'admin','category','init','module=admin',4,'1'),(42,'add_category',43,'admin','category','add','s=0',1,'1'),(45,'badword_manage',977,'admin','badword','init','',10,'1'),(46,'posid_add',32,'admin','position','add','',0,'0'),(49,'admin_setting',1,'admin','','','',0,'1'),(50,'role_manage',49,'admin','role','init','',0,'1'),(51,'role_add',50,'admin','role','add','',0,'1'),(52,'category_cache',43,'admin','category','public_cache','module=admin',4,'1'),(55,'manage_member',5,'member','member','manage','',0,'1'),(58,'admin_add',54,'admin','admin_manage','add','',0,'1'),(59,'model_manage',975,'content','sitemodel','init','',5,'1'),(64,'site_management',30,'admin','site','init','',2,'1'),(81,'member_add',72,'member','member','add','',2,'0'),(62,'add_model',59,'content','sitemodel','add','',0,'0'),(65,'release_point_management',30,'admin','release_point','init','',3,'1'),(66,'badword_export',45,'admin','badword','export','',0,'1'),(67,'add_site',64,'admin','site','add','',0,'0'),(68,'badword_import',45,'admin','badword','import','',0,'1'),(812,'member_group_manage',76,'member','member_group','manage','',0,'1'),(74,'member_verify',55,'member','member_verify','manage','s=0',3,'1'),(76,'manage_member_group',5,'member','member_group','manage','',0,'1'),(77,'manage_member_model',5,'member','member_model','manage','',0,'1'),(78,'member_group_add',812,'member','member_group','add','',0,'0'),(79,'member_model_add',813,'member','member_model','add','',1,'0'),(80,'member_model_import',77,'member','member_model','import','',2,'0'),(72,'member_manage',55,'member','member','manage','',1,'1'),(813,'member_model_manage',77,'member','member_model','manage','',0,'1'),(814,'site_edit',64,'admin','site','edit','',0,'0'),(815,'site_del',64,'admin','site','del','',0,'0'),(816,'release_point_add',65,'admin','release_point','add','',0,'0'),(817,'release_point_del',65,'admin','release_point','del','',0,'0'),(818,'release_point_edit',65,'admin','release_point','edit','',0,'0'),(821,'content_publish',4,'content','content','init','',0,'1'),(822,'content_manage',821,'content','content','init','',0,'1'),(867,'linkage',977,'admin','linkage','init','',13,'1'),(827,'template_style',826,'template','style','init','',0,'1'),(828,'import_style',827,'template','style','import','',0,'0'),(831,'template_export',827,'template','style','export','',0,'0'),(830,'template_file',827,'template','file','init','',0,'0'),(832,'template_onoff',827,'template','style','disable','',0,'0'),(833,'template_updatename',827,'template','style','updatename','',0,'0'),(834,'member_lock',72,'member','member','lock','',0,'0'),(835,'member_unlock',72,'member','member','unlock','',0,'0'),(836,'member_move',72,'member','member','move','',0,'0'),(837,'member_delete',72,'member','member','delete','',0,'0'),(842,'verify_ignore',74,'member','member_verify','manage','s=2',0,'1'),(839,'member_setting',55,'member','member_setting','manage','',4,'1'),(841,'verify_pass',74,'member','member_verify','manage','s=1',0,'1'),(843,'verify_delete',74,'member','member_verify','manage','s=3',0,'0'),(844,'verify_deny',74,'member','member_verify','manage','s=4',0,'1'),(845,'never_pass',74,'member','member_verify','manage','s=5',0,'1'),(846,'template_file_list',827,'template','file','init','',0,'0'),(847,'template_file_edit',827,'template','file','edit_file','',0,'0'),(848,'file_add_file',827,'template','file','add_file','',0,'0'),(850,'listorder',76,'member','member_group','sort','',0,'0'),(852,'priv_setting',50,'admin','role','priv_setting','',0,'0'),(853,'role_priv',50,'admin','role','role_priv','',0,'0'),(857,'attachment_manage',821,'attachment','manage','init','',0,'1'),(868,'special',821,'special','special','init','',0,'1'),(869,'template_editor',827,'template','file','edit_file','',0,'0'),(870,'template_visualization',827,'template','file','visualization','',0,'0'),(871,'pc_tag_edit',827,'template','file','edit_pc_tag','',0,'0'),(873,'release_manage',4,'release','html','init','',0,'1'),(874,'type_manage',975,'content','type_manage','init','',6,'1'),(875,'add_type',874,'content','type_manage','add','',0,'0'),(876,'linkageadd',867,'admin','linkage','add','',0,'0'),(877,'failure_list',872,'release','index','failed','',0,'1'),(879,'member_search',72,'member','member','search','',0,'0'),(880,'queue_del',872,'release','index','del','',0,'0'),(881,'member_model_delete',813,'member','member_model','delete','',0,'0'),(882,'member_model_edit',813,'member','member_model','edit','',0,'0'),(885,'workflow',977,'content','workflow','init','',15,'1'),(888,'add_workflow',885,'content','workflow','add','',0,'1'),(889,'member_modelfield_add',813,'member','member_modelfield','add','',0,'0'),(890,'member_modelfield_edit',813,'member','member_modelfield','edit','',0,'0'),(891,'member_modelfield_delete',813,'member','member_modelfield','delete','',0,'0'),(892,'member_modelfield_manage',813,'member','member_modelfield','manage','',0,'0'),(895,'sitemodel_import',59,'content','sitemodel','import','',0,'1'),(896,'pay',29,'pay','payment','pay_list','s=3',0,'1'),(897,'payments',896,'pay','payment','init','',0,'1'),(898,'paylist',896,'pay','payment','pay_list','',0,'1'),(899,'add_content',822,'content','content','add','',0,'0'),(900,'modify_deposit',896,'pay','payment','modify_deposit','s=1',0,'1'),(901,'check_content',822,'content','content','pass','',0,'0'),(902,'dbsource',29,'dbsource','data','init','',0,'1'),(905,'create_content_html',873,'content','create_html','show','',2,'1'),(904,'external_data_sources',902,'dbsource','dbsource_admin','init','',0,'1'),(906,'update_urls',873,'content','create_html','update_urls','',1,'1'),(960,'node_add',957,'collection','node','add','',0,'1'),(909,'fulltext_search',29,'search','search_type','init','',0,'1'),(910,'manage_type',909,'search','search_type','init','',0,'0'),(911,'search_setting',909,'search','search_admin','setting','',0,'1'),(912,'createindex',909,'search','search_admin','createindex','',0,'1'),(913,'add_search_type',909,'search','search_type','add','',0,'0'),(914,'database_toos',977,'admin','database','export','',6,'1'),(915,'database_export',914,'admin','database','export','',0,'1'),(916,'database_import',914,'admin','database','import','',0,'1'),(917,'dbsource_add',902,'dbsource','dbsource_admin','add','',0,'0'),(918,'dbsource_edit',902,'dbsource','dbsource_admin','edit','',0,'0'),(919,'dbsource_del',902,'dbsource','dbsource_admin','del','',0,'0'),(920,'dbsource_data_add',902,'dbsource','data','add','',0,'0'),(921,'dbsource_data_edit',902,'dbsource','data','edit','',0,'0'),(922,'dbsource_data_del',902,'dbsource','data','del','',0,'0'),(926,'add_special',868,'special','special','add','',0,'1'),(927,'edit_special',868,'special','special','edit','',0,'0'),(928,'special_list',868,'special','special','init','',0,'0'),(929,'special_elite',868,'special','special','elite','',0,'0'),(930,'delete_special',868,'special','special','delete','',0,'0'),(931,'badword_add',45,'admin','badword','add','',0,'0'),(932,'badword_edit',45,'admin','badword','edit','',0,'0'),(933,'badword_delete',45,'admin','badword','delete','',0,'0'),(934,'special_listorder',868,'special','special','listorder','',0,'0'),(935,'special_content_list',868,'special','content','init','',0,'0'),(936,'special_content_add',935,'special','content','add','',0,'0'),(937,'special_content_list',935,'special','content','init','',0,'0'),(938,'special_content_edit',935,'special','content','edit','',0,'0'),(939,'special_content_delete',935,'special','content','delete','',0,'0'),(940,'special_content_listorder',935,'special','content','listorder','',0,'0'),(941,'special_content_import',935,'special','special','import','',0,'0'),(942,'history_version',827,'template','template_bak','init','',0,'0'),(943,'restore_version',827,'template','template_bak','restore','',0,'0'),(944,'del_history_version',827,'template','template_bak','del','',0,'0'),(945,'block',821,'block','block_admin','init','',0,'1'),(946,'block_add',945,'block','block_admin','add','',0,'0'),(950,'block_edit',945,'block','block_admin','edit','',0,'0'),(951,'block_del',945,'block','block_admin','del','',0,'0'),(952,'block_update',945,'block','block_admin','block_update','',0,'0'),(953,'block_restore',945,'block','block_admin','history_restore','',0,'0'),(954,'history_del',945,'block','block_admin','history_del','',0,'0'),(978,'urlrule_manage',977,'admin','urlrule','init','',0,'1'),(957,'collection_node',821,'collection','node','manage','',0,'1'),(979,'safe_config',30,'admin','setting','init','&tab=2',11,'1'),(959,'basic_config',30,'admin','setting','init','',10,'1'),(961,'position_edit',32,'admin','position','edit','',0,'0'),(962,'collection_node_edit',957,'collection','node','edit','',0,'0'),(963,'collection_node_delete',957,'collection','node','del','',0,'0'),(990,'col_url_list',957,'collection','node','col_url_list','',0,'0'),(965,'collection_node_publish',957,'collection','node','publist','',0,'0'),(966,'collection_node_import',957,'collection','node','node_import','',0,'0'),(967,'collection_node_export',957,'collection','node','export','',0,'0'),(968,'collection_node_collection_content',957,'collection','node','col_content','',0,'0'),(969,'googlesitemap',977,'admin','googlesitemap','set','',11,'1'),(970,'admininfo',10,'admin','admin_manage','init','',0,'1'),(971,'editpwd',970,'admin','admin_manage','public_edit_pwd','',1,'1'),(972,'editinfo',970,'admin','admin_manage','public_edit_info','',0,'1'),(973,'keylink',977,'admin','keylink','init','',12,'1'),(974,'add_keylink',973,'admin','keylink','add','',0,'0'),(975,'content_settings',4,'content','content_settings','init','',0,'1'),(7,'extend',0,'admin','extend','init_extend','',7,'1'),(977,'extend_all',7,'admin','extend_all','init','',0,'1'),(980,'sso_config',30,'admin','setting','init','&tab=3',12,'1'),(981,'email_config',30,'admin','setting','init','&tab=4',13,'1'),(982,'module_manage',29,'admin','module','init','',0,'1'),(983,'ipbanned',977,'admin','ipbanned','init','',0,'1'),(984,'add_ipbanned',983,'admin','ipbanned','add','',0,'0'),(993,'collection_content_import',957,'collection','node','import','',0,'0'),(991,'copy_node',957,'collection','node','copy','',0,'0'),(992,'content_del',957,'collection','node','content_del','',0,'0'),(989,'downsites',977,'admin','downservers','init','',0,'1'),(994,'import_program_add',957,'collection','node','import_program_add','',0,'0'),(995,'import_program_del',957,'collection','node','import_program_del','',0,'0'),(996,'import_content',957,'collection','node','import_content','',0,'0'),(997,'log',977,'admin','log','init','',0,'1'),(998,'add_page',43,'admin','category','add','s=1',2,'1'),(999,'add_cat_link',43,'admin','category','add','s=2',2,'1'),(1000,'count_items',43,'admin','category','count_items','',5,'1'),(1001,'cache_all',977,'admin','cache_all','init','',0,'1'),(1002,'create_list_html',873,'content','create_html','category','',0,'1'),(1003,'create_html_quick',10,'content','create_html_opt','index','',0,'1'),(1004,'create_index',1003,'content','create_html','public_index','',0,'1'),(1005,'scan',977,'scan','index','init','',0,'1'),(1006,'scan_report',1005,'scan','index','scan_report','',0,'1'),(1007,'md5_creat',1005,'scan','index','md5_creat','',0,'1'),(8,'phpsso',0,'admin','phpsso','menu','',7,'1'),(1011,'edit_content',822,'content','content','edit','',0,'0'),(1012,'push_to_special',822,'content','push','init','',0,'0'),(1023,'delete_log',997,'admin','log','delete','',0,'0'),(1024,'delete_ip',983,'admin','ipbanned','delete','',0,'0'),(1026,'delete_keylink',973,'admin','keylink','delete','',0,'0'),(1027,'edit_keylink',973,'admin','keylink','edit','',0,'0'),(1034,'operation_pass',74,'member','member_verify','pass','',0,'0'),(1035,'operation_delete',74,'member','member_verify','delete','',0,'0'),(1039,'operation_ignore',74,'member','member_verify','ignore','',0,'0'),(1038,'settingsave',30,'admin','setting','save','',0,'0'),(1040,'admin_edit',54,'admin','admin_manage','edit','',0,'0'),(1041,'operation_reject',74,'member','member_verify','reject','',0,'0'),(1042,'admin_delete',54,'admin','admin_manage','delete','',0,'0'),(1043,'card',54,'admin','admin_manage','card','',0,'0'),(1044,'creat_card',54,'admin','admin_manage','creat_card','',0,'0'),(1045,'remove_card',54,'admin','admin_manage','remove_card','',0,'0'),(1049,'member_group_edit',812,'member','member_group','edit','',0,'0'),(1048,'member_edit',72,'member','member','edit','',0,'0'),(1050,'role_edit',50,'admin','role','edit','',0,'0'),(1051,'member_group_delete',812,'member','member_group','delete','',0,'0'),(1052,'member_manage',50,'admin','role','member_manage','',0,'0'),(1053,'role_delete',50,'admin','role','delete','',0,'0'),(1054,'member_model_export',77,'member','member_model','export','',0,'0'),(1055,'member_model_sort',77,'member','member_model','sort','',0,'0'),(1056,'member_model_move',77,'member','member_model','move','',0,'0'),(1057,'payment_add',897,'pay','payment','add','',0,'0'),(1058,'payment_delete',897,'pay','payment','delete','',0,'0'),(1059,'payment_edit',897,'pay','payment','edit','',0,'0'),(1060,'spend_record',896,'pay','spend','init','',0,'1'),(1061,'pay_stat',896,'pay','payment','pay_stat','',0,'1'),(1062,'fields_manage',59,'content','sitemodel_field','init','',0,'0'),(1063,'edit_model_content',59,'content','sitemodel','edit','',0,'0'),(1064,'disabled_model',59,'content','sitemodel','disabled','',0,'0'),(1065,'delete_model',59,'content','sitemodel','delete','',0,'0'),(1066,'export_model',59,'content','sitemodel','export','',0,'0'),(1067,'delete',874,'content','type_manage','delete','',0,'0'),(1068,'edit',874,'content','type_manage','edit','',0,'0'),(1069,'add_urlrule',978,'admin','urlrule','add','',0,'0'),(1070,'edit_urlrule',978,'admin','urlrule','edit','',0,'0'),(1071,'delete_urlrule',978,'admin','urlrule','delete','',0,'0'),(1072,'edit_menu',31,'admin','menu','edit','',0,'0'),(1073,'delete_menu',31,'admin','menu','delete','',0,'0'),(1074,'edit_workflow',885,'content','workflow','edit','',0,'0'),(1075,'delete_workflow',885,'content','workflow','delete','',0,'0'),(1076,'creat_html',868,'special','special','html','',0,'1'),(1093,'connect_config',30,'admin','setting','init','&tab=5',14,'1'),(1102,'view_modelinfo',74,'member','member_verify','modelinfo','',0,'0'),(1202,'create_special_list',868,'special','special','create_special_list','',0,'1'),(1240,'view_memberlinfo',72,'member','member','memberinfo','',0,'0'),(1239,'copyfrom_manage',977,'admin','copyfrom','init','',0,'1'),(1224,'cnzz',977,'cnzz','index','init','',16,'1'),(1241,'move_content',822,'content','content','move','',0,'0'),(1242,'poster_template',56,'poster','space','poster_template','',0,'1'),(1243,'create_index',873,'content','create_html','public_index','',0,'1'),(1244,'add_othors',822,'content','content','add_othors','',0,'1'),(1295,'attachment_manager_dir',857,'attachment','manage','dir','',2,'1'),(1296,'attachment_manager_db',857,'attachment','manage','init','',1,'1'),(1346,'attachment_address_replace',857,'attachment','address','init','',3,'1'),(1347,'attachment_address_update',857,'attachment','address','update','',0,'0'),(1348,'delete_content',822,'content','content','delete','',0,'1'),(1349,'member_menu_manage',977,'member','member_menu','manage','',0,'1'),(1350,'member_menu_add',1349,'member','member_menu','add','',0,'1'),(1351,'member_menu_edit',1349,'member','member_menu','edit','',0,'0'),(1352,'member_menu_delete',1349,'member','member_menu','delete','',0,'0'),(1353,'batch_show',822,'content','content','batch_show','',0,'1'),(1354,'pay_delete',898,'pay','payment','pay_del','',0,'0'),(1355,'pay_cancel',898,'pay','payment','pay_cancel','',0,'0'),(1356,'discount',898,'pay','payment','discount','',0,'0'),(1360,'category_batch_edit',43,'admin','category','batch_edit','',6,'1'),(1361,'plugin',9,'admin','plugin','init','',0,'1'),(1362,'appcenter',1361,'admin','plugin','appcenter','',0,'1'),(1365,'appcenter_detail',1362,'admin','plugin','appcenter_detail','',0,'0'),(1366,'install_online',1362,'admin','plugin','install_online','',0,'0'),(1363,'plugin_import',1361,'admin','plugin','import','',2,'1'),(1364,'plugin_list',1361,'admin','plugin','init','',1,'1'),(1367,'plugin_close',1364,'admin','plugin','status','',0,'0'),(1368,'uninstall_plugin',1364,'admin','plugin','delete','',0,'0'),(1500,'listorder',822,'content','content','listorder','',0,'0');

/*Table structure for table `v9_model` */

DROP TABLE IF EXISTS `v9_model`;

CREATE TABLE `v9_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `description` char(100) NOT NULL,
  `tablename` char(20) NOT NULL,
  `setting` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `items` smallint(5) unsigned NOT NULL DEFAULT '0',
  `enablesearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_style` char(30) NOT NULL,
  `category_template` char(30) NOT NULL,
  `list_template` char(30) NOT NULL,
  `show_template` char(30) NOT NULL,
  `js_template` varchar(30) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`modelid`),
  KEY `type` (`type`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `v9_model` */

insert  into `v9_model`(`modelid`,`siteid`,`name`,`description`,`tablename`,`setting`,`addtime`,`items`,`enablesearch`,`disabled`,`default_style`,`category_template`,`list_template`,`show_template`,`js_template`,`sort`,`type`) values (1,1,'文章模型','','news','',0,0,1,0,'default','category','list','show','',0,0),(2,1,'下载模型','','download','',0,0,1,0,'default','category_download','list_download','show_download','',0,0),(3,1,'图片模型','','picture','',0,0,1,0,'default','category_picture','list_picture','show_picture','',0,0),(10,1,'普通会员','普通会员','member_detail','',0,0,1,0,'','','','','',0,2);

/*Table structure for table `v9_model_field` */

DROP TABLE IF EXISTS `v9_model_field`;

CREATE TABLE `v9_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tips` text NOT NULL,
  `css` varchar(30) NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `formattribute` varchar(255) NOT NULL,
  `unsetgroupids` varchar(255) NOT NULL,
  `unsetroleids` varchar(255) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isbase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isfulltext` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isomnipotent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`),
  KEY `field` (`field`,`modelid`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

/*Data for the table `v9_model_field` */

insert  into `v9_model_field`(`fieldid`,`modelid`,`siteid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (1,1,1,'catid','栏目','','',1,6,'/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,1,0,1,1,1,0,0,1,0,0),(2,1,1,'typeid','类别','','',0,0,'','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','',0,1,0,1,1,1,0,0,2,0,0),(3,1,1,'title','标题','','inputtitle',1,80,'','请输入标题','title','','','','',0,1,0,1,1,1,1,1,4,0,0),(4,1,1,'thumb','缩略图','','',0,100,'','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','',0,1,0,0,0,1,0,1,14,0,0),(5,1,1,'keywords','关键词','多关键词之间用空格或者“,”隔开','',0,40,'','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99',0,1,0,1,1,1,1,0,7,0,0),(6,1,1,'description','摘要','','',0,255,'','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','',0,1,0,1,0,1,1,1,10,0,0),(7,1,1,'updatetime','更新时间','','',0,0,'','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','',1,1,0,1,0,0,0,0,12,0,0),(8,1,1,'content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','',1,999999,'','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)','','','',0,0,0,1,0,1,1,0,13,0,0),(9,1,1,'voteid','添加投票','','',0,0,'','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'text\\\' name=\\\'info[voteid]\\\' id=\\\'voteid\\\' value=\\\'{FIELD_VALUE}\\\' size=\\\'3\\\'> \r\n<input type=\\\'button\\\' value=\"选择已有投票\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=vote&c=vote&a=public_get_votelist&from_api=1\\\',\\\'选择已有投票\\\')\" class=\"button\">\r\n<input type=\\\'button\\\' value=\"新增投票\" onclick=\"omnipotent(\\\'addvote\\\',\\\'?m=vote&c=vote&a=add&from_api=1\\\',\\\'添加投票\\\',0)\" class=\"button\">\',\n  \'fieldtype\' => \'mediumint\',\n  \'minnumber\' => \'1\',\n)','','','',0,0,0,1,0,0,1,0,21,0,0),(10,1,1,'pages','分页方式','','',0,0,'','','pages','','','-99','-99',0,0,0,1,0,0,0,0,16,0,0),(11,1,1,'inputtime','发布时间','','',0,0,'','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','',0,1,0,0,0,0,0,1,17,0,0),(12,1,1,'posids','推荐位','','',0,0,'','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','',0,1,0,1,0,0,0,0,18,0,0),(13,1,1,'url','URL','','',0,100,'','','text','','','','',1,1,0,1,0,0,0,0,50,0,0),(14,1,1,'listorder','排序','','',0,6,'','','number','','','','',1,1,0,1,0,0,0,0,51,0,0),(15,1,1,'status','状态','','',0,2,'','','box','','','','',1,1,0,1,0,0,0,0,55,0,0),(16,1,1,'template','内容页模板','','',0,30,'','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,0,0,0,0,0,0,0,53,0,0),(17,1,1,'groupids_view','阅读权限','','',0,0,'','','groupid','array (\n  \'groupids\' => \'\',\n)','','','',0,0,0,1,0,0,0,0,19,0,0),(18,1,1,'readpoint','阅读收费','','',0,5,'','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,0,0,0,0,0,0,0,55,0,0),(19,1,1,'relation','相关文章','','',0,0,'','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','',0,0,0,0,0,0,1,0,15,0,0),(20,1,1,'allow_comment','允许评论','','',0,0,'','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','',0,0,0,0,0,0,0,0,54,0,0),(21,1,1,'copyfrom','来源','','',0,100,'','','copyfrom','array (\n  \'defaultvalue\' => \'\',\n)','','','',0,0,0,1,0,1,0,0,8,0,0),(80,1,1,'username','用户名','','',0,20,'','','text','','','','',1,1,0,1,0,0,0,0,98,0,0),(22,2,1,'catid','栏目','','',1,6,'/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,1,0,1,1,1,0,0,1,0,0),(23,2,1,'typeid','类别','','',0,0,'','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','',0,1,0,1,1,1,0,0,2,1,0),(24,2,1,'title','标题','','inputtitle',1,80,'','请输入标题','title','','','','',0,1,0,1,1,1,1,1,4,0,0),(25,2,1,'keywords','关键词','多关键词之间用空格或者“,”隔开','',0,40,'','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99',0,1,0,1,1,1,1,0,7,0,0),(26,2,1,'description','摘要','','',0,255,'','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','',0,1,0,1,0,1,1,1,10,0,0),(27,2,1,'updatetime','更新时间','','',0,0,'','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','',1,1,0,1,0,0,0,0,12,0,0),(28,2,1,'content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','',1,999999,'','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)','','','',0,0,0,1,0,1,1,0,13,0,0),(29,2,1,'thumb','缩略图','','',0,100,'','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','',0,1,0,0,0,1,0,1,14,0,0),(30,2,1,'relation','相关文章','','',0,0,'','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','',0,0,0,0,0,0,1,0,15,0,0),(31,2,1,'pages','分页方式','','',0,0,'','','pages','','','-99','-99',0,0,0,1,0,0,0,0,16,1,0),(32,2,1,'inputtime','发布时间','','',0,0,'','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','',0,1,0,0,0,0,0,1,17,0,0),(33,2,1,'posids','推荐位','','',0,0,'','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','',0,1,0,1,0,0,0,0,18,0,0),(34,2,1,'groupids_view','阅读权限','','',0,0,'','','groupid','array (\n  \'groupids\' => \'\',\n)','','','',0,0,0,1,0,0,0,0,19,0,0),(35,2,1,'url','URL','','',0,100,'','','text','','','','',1,1,0,1,0,0,0,0,50,0,0),(36,2,1,'listorder','排序','','',0,6,'','','number','','','','',1,1,0,1,0,0,0,0,51,0,0),(37,2,1,'template','内容页模板','','',0,30,'','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,0,0,0,0,0,0,0,53,0,0),(38,2,1,'allow_comment','允许评论','','',0,0,'','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','',0,0,0,0,0,0,0,0,54,0,0),(39,2,1,'status','状态','','',0,2,'','','box','','','','',1,1,0,1,0,0,0,0,55,0,0),(40,2,1,'readpoint','阅读收费','','',0,5,'','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,0,0,0,0,0,0,0,55,0,0),(41,2,1,'username','用户名','','',0,20,'','','text','','','','',1,1,0,1,0,0,0,0,98,0,0),(42,2,1,'downfiles','本地下载','','',0,0,'','','downfiles','array (\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'10\',\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n)','','','',0,0,0,1,0,1,0,0,8,0,0),(43,2,1,'downfile','镜像下载','','',0,0,'','','downfile','array (\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'1\',\n)','','','',0,0,0,1,0,1,0,0,9,0,0),(44,2,1,'systems','软件平台','<select name=\'selectSystem\' onchange=\"ChangeInput(this,document.myform.systems,\'/\')\">\r\n	<option value=\'WinXP\'>WinXP</option>\r\n	<option value=\'Vista\'>Windows 7</option>\r\n	<option value=\'Win2000\'>Win2000</option>\r\n	<option value=\'Win2003\'>Win2003</option>\r\n	<option value=\'Unix\'>Unix</option>\r\n	<option value=\'Linux\'>Linux</option>\r\n	<option value=\'MacOS\'>MacOS</option>\r\n</select>','',0,100,'','','text','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'Win2000/WinXP/Win2003\',\n  \'ispassword\' => \'0\',\n)','','','',0,1,0,1,0,1,1,0,14,0,0),(45,2,1,'copytype','软件授权形式','','',0,15,'','','box','array (\n  \'options\' => \'免费版|免费版\r\n共享版|共享版\r\n试用版|试用版\r\n演示版|演示版\r\n注册版|注册版\r\n破解版|破解版\r\n零售版|零售版\r\nOEM版|OEM版\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'免费版\',\n)','','','',0,1,0,1,0,1,0,0,12,0,0),(46,2,1,'language','软件语言','','',0,16,'','','box','array (\n  \'options\' => \'英文|英文\r\n简体中文|简体中文\r\n繁体中文|繁体中文\r\n简繁中文|简繁中文\r\n多国语言|多国语言\r\n其他语言|其他语言\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'简体中文\',\n)','','','',0,1,0,1,0,1,0,0,13,0,0),(47,2,1,'classtype','软件类型','','',0,20,'','','box','array (\n  \'options\' => \'国产软件|国产软件\r\n国外软件|国外软件\r\n汉化补丁|汉化补丁\r\n程序源码|程序源码\r\n其他|其他\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'国产软件\',\n)','','','',0,1,0,1,0,1,0,0,17,0,0),(48,2,1,'version','版本号','','',0,20,'','','text','array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)','','','',0,1,0,0,0,1,1,0,13,0,0),(49,2,1,'filesize','文件大小','','',0,10,'','','text','array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'未知\',\n  \'ispassword\' => \'0\',\n)','','','',0,1,0,0,0,1,1,0,14,0,0),(50,2,1,'stars','评分等级','','',0,20,'','','box','array (\n  \'options\' => \'★☆☆☆☆|★☆☆☆☆\r\n★★☆☆☆|★★☆☆☆\r\n★★★☆☆|★★★☆☆\r\n★★★★☆|★★★★☆\r\n★★★★★|★★★★★\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'★★★☆☆\',\n)','','','',0,1,0,1,0,1,0,0,17,0,0),(51,3,1,'allow_comment','允许评论','','',0,0,'','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','',0,0,0,0,0,0,0,0,54,0,0),(52,3,1,'template','内容页模板','','',0,30,'','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,0,0,0,0,0,0,0,53,0,0),(53,3,1,'url','URL','','',0,100,'','','text','','','','',1,1,0,1,0,0,0,0,50,0,0),(54,3,1,'listorder','排序','','',0,6,'','','number','','','','',1,1,0,1,0,0,0,0,51,0,0),(55,3,1,'posids','推荐位','','',0,0,'','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','',0,1,0,1,0,0,0,0,18,0,0),(56,3,1,'groupids_view','阅读权限','','',0,0,'','','groupid','array (\n  \'groupids\' => \'\',\n)','','','',0,0,0,1,0,0,0,0,19,0,0),(57,3,1,'inputtime','发布时间','','',0,0,'','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','',0,1,0,0,0,0,0,1,17,0,0),(58,3,1,'pages','分页方式','','',0,0,'','','pages','','','-99','-99',0,0,0,1,0,0,0,0,16,0,0),(59,3,1,'relation','相关组图','','',0,0,'','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','',0,0,0,0,0,0,1,0,15,0,0),(60,3,1,'thumb','缩略图','','',0,100,'','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','',0,1,0,0,0,1,0,1,14,0,0),(61,3,1,'content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','',0,999999,'','','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)','','','',0,0,0,1,0,1,1,0,13,0,0),(62,3,1,'updatetime','更新时间','','',0,0,'','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','',1,1,0,1,0,0,0,0,12,0,0),(63,3,1,'description','摘要','','',0,255,'','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','',0,1,0,1,0,1,1,1,10,0,0),(64,3,1,'title','标题','','inputtitle',1,80,'','请输入标题','title','','','','',0,1,0,1,1,1,1,1,4,0,0),(65,3,1,'keywords','关键词','多关键词之间用空格或者“,”隔开','',0,40,'','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99',0,1,0,1,1,1,1,0,7,0,0),(66,3,1,'typeid','类别','','',0,0,'','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','',0,1,0,1,1,1,0,0,2,0,0),(67,3,1,'catid','栏目','','',1,6,'/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,1,0,1,1,1,0,0,1,0,0),(68,3,1,'status','状态','','',0,2,'','','box','','','','',1,1,0,1,0,0,0,0,55,0,0),(69,3,1,'readpoint','阅读收费','','',0,5,'','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99',0,0,0,0,0,0,0,0,55,0,0),(70,3,1,'username','用户名','','',0,20,'','','text','','','','',1,1,0,1,0,0,0,0,98,0,0),(71,3,1,'pictureurls','组图','','',0,0,'','','images','array (\n  \'upload_allowext\' => \'gif|jpg|jpeg|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'upload_number\' => \'50\',\n)','','','',0,0,0,1,0,1,0,0,15,0,0),(72,3,1,'copyfrom','来源','','',0,0,'','','copyfrom','array (\n  \'defaultvalue\' => \'\',\n)','','','',0,0,0,1,0,1,0,0,8,0,0),(73,1,1,'islink','转向链接','','',0,0,'','','islink','','','','',0,1,0,0,0,1,0,0,30,0,0),(74,2,1,'islink','转向链接','','',0,0,'','','islink','','','','',0,1,0,0,0,1,0,0,30,0,0),(75,3,1,'islink','转向链接','','',0,0,'','','islink','','','','',0,1,0,0,0,1,0,0,30,0,0),(83,10,1,'birthday','生日','','',0,0,'','生日格式错误','datetime','array (\n  \'fieldtype\' => \'date\',\n  \'format\' => \'Y-m-d\',\n  \'defaulttype\' => \'0\',\n)','','','',0,0,0,0,0,1,1,0,0,0,0);

/*Table structure for table `v9_module` */

DROP TABLE IF EXISTS `v9_module`;

CREATE TABLE `v9_module` (
  `module` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `version` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `installdate` date NOT NULL DEFAULT '0000-00-00',
  `updatedate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_module` */

insert  into `v9_module`(`module`,`name`,`url`,`iscore`,`version`,`description`,`setting`,`listorder`,`disabled`,`installdate`,`updatedate`) values ('admin','admin','',1,'1.0','','array (\n  \'admin_email\' => \'phpcms@phpcms.cn\',\n  \'adminaccessip\' => \'0\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'maxiplockedtime\' => \'15\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'mail_user\' => \'phpcms.cn@foxmail.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'phpcms.cn@foxmail.com\',\n  \'mail_password\' => \'\',\n  \'errorlog_size\' => \'20\',\n)',0,0,'2010-10-18','2010-10-18'),('member','会员','',1,'1.0','','array (\n  \'allowregister\' => \'1\',\n  \'choosemodel\' => \'1\',\n  \'enablemailcheck\' => \'0\',\n  \'registerverify\' => \'0\',\n  \'showapppoint\' => \'0\',\n  \'rmb_point_rate\' => \'10\',\n  \'defualtpoint\' => \'0\',\n  \'defualtamount\' => \'0\',\n  \'showregprotocol\' => \'0\',\n  \'regprotocol\' => \'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \',\n  \'registerverifymessage\' => \' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\',\n  \'forgetpassword\' => \' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\',\n)',0,0,'2010-09-06','2010-09-06'),('pay','支付','',1,'1.0','','',0,0,'2010-09-06','2010-09-06'),('digg','顶一下','',0,'1.0','','',0,0,'2010-09-06','2010-09-06'),('special','专题','',0,'1.0','','',0,0,'2010-09-06','2010-09-06'),('content','内容模块','',1,'1.0','','',0,0,'2010-09-06','2010-09-06'),('search','全站搜索','',0,'1.0','','array (\n  \'fulltextenble\' => \'1\',\n  \'relationenble\' => \'1\',\n  \'suggestenable\' => \'1\',\n  \'sphinxenable\' => \'0\',\n  \'sphinxhost\' => \'10.228.134.102\',\n  \'sphinxport\' => \'9312\',\n)',0,0,'2010-09-06','2010-09-06'),('scan','木马扫描','scan',0,'1.0','','',0,0,'2010-09-01','2010-09-06'),('attachment','附件','attachment',1,'1.0','','',0,0,'2010-09-01','2010-09-06'),('block','碎片','',1,'1.0','','',0,0,'2010-09-01','2010-09-06'),('collection','采集模块','collection',1,'1.0','','',0,0,'2010-09-01','2010-09-06'),('dbsource','数据源','',1,'','','',0,0,'2010-09-01','2010-09-06'),('template','模板风格','',1,'1.0','','',0,0,'2010-09-01','2010-09-06'),('release','发布点','',1,'1.0','','',0,0,'2010-09-01','2010-09-06'),('cnzz','CNZZ统计','cnzz/',0,'1.0','CNZZ统计','',0,0,'2010-09-15','2010-09-15'),('gupiao','股票信息','gupiao/',0,'1.0','股票','',0,0,'0000-00-00','0000-00-00');

/*Table structure for table `v9_news` */

DROP TABLE IF EXISTS `v9_news`;

CREATE TABLE `v9_news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_news` */

/*Table structure for table `v9_news_data` */

DROP TABLE IF EXISTS `v9_news_data`;

CREATE TABLE `v9_news_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `voteid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `copyfrom` varchar(100) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_news_data` */

/*Table structure for table `v9_page` */

DROP TABLE IF EXISTS `v9_page`;

CREATE TABLE `v9_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL,
  `style` varchar(24) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `template` varchar(30) NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_page` */

/*Table structure for table `v9_pay_account` */

DROP TABLE IF EXISTS `v9_pay_account`;

CREATE TABLE `v9_pay_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `trade_sn` char(50) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `contactname` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `telephone` char(20) NOT NULL,
  `discount` float(8,2) NOT NULL DEFAULT '0.00',
  `money` char(8) NOT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `paytime` int(10) NOT NULL DEFAULT '0',
  `usernote` char(255) NOT NULL,
  `pay_id` tinyint(3) NOT NULL,
  `pay_type` enum('offline','recharge','selfincome','online') NOT NULL DEFAULT 'recharge',
  `payment` char(90) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `status` enum('succ','failed','error','progress','timeout','cancel','waitting','unpay') NOT NULL DEFAULT 'unpay',
  `adminnote` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `trade_sn` (`trade_sn`,`money`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_pay_account` */

/*Table structure for table `v9_pay_payment` */

DROP TABLE IF EXISTS `v9_pay_payment`;

CREATE TABLE `v9_pay_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `pay_name` varchar(120) NOT NULL,
  `pay_code` varchar(20) NOT NULL,
  `pay_desc` text NOT NULL,
  `pay_method` tinyint(1) DEFAULT NULL,
  `pay_fee` varchar(10) NOT NULL,
  `config` text NOT NULL,
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `author` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `pay_code` (`pay_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_pay_payment` */

/*Table structure for table `v9_pay_spend` */

DROP TABLE IF EXISTS `v9_pay_spend`;

CREATE TABLE `v9_pay_spend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logo` varchar(20) NOT NULL,
  `value` int(5) NOT NULL,
  `op_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `op_username` char(20) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `creat_at` (`creat_at`),
  KEY `logo` (`logo`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_pay_spend` */

/*Table structure for table `v9_picture` */

DROP TABLE IF EXISTS `v9_picture`;

CREATE TABLE `v9_picture` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_picture` */

/*Table structure for table `v9_picture_data` */

DROP TABLE IF EXISTS `v9_picture_data`;

CREATE TABLE `v9_picture_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `pictureurls` mediumtext NOT NULL,
  `copyfrom` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_picture_data` */

/*Table structure for table `v9_plugin` */

DROP TABLE IF EXISTS `v9_plugin`;

CREATE TABLE `v9_plugin` (
  `pluginid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `appid` int(10) DEFAULT NULL,
  `name` varchar(40) NOT NULL DEFAULT '',
  `identification` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `datatables` varchar(255) NOT NULL DEFAULT '',
  `dir` varchar(100) NOT NULL DEFAULT '',
  `copyright` varchar(100) NOT NULL DEFAULT '',
  `setting` text NOT NULL,
  `iframe` text NOT NULL,
  `version` varchar(20) NOT NULL DEFAULT '',
  `listorder` tinyint(3) NOT NULL DEFAULT '0',
  `disable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pluginid`),
  UNIQUE KEY `identification` (`identification`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_plugin` */

/*Table structure for table `v9_plugin_var` */

DROP TABLE IF EXISTS `v9_plugin_var`;

CREATE TABLE `v9_plugin_var` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pluginid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `fieldname` varchar(40) NOT NULL DEFAULT '',
  `fieldtype` varchar(20) NOT NULL DEFAULT 'text',
  `value` text NOT NULL,
  `setting` text NOT NULL,
  `formattribute` varchar(255) DEFAULT NULL,
  `listorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pluginid` (`pluginid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_plugin_var` */

/*Table structure for table `v9_position` */

DROP TABLE IF EXISTS `v9_position`;

CREATE TABLE `v9_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned DEFAULT '0',
  `catid` smallint(5) unsigned DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `maxnum` smallint(5) NOT NULL DEFAULT '20',
  `extention` char(100) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`posid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `v9_position` */

insert  into `v9_position`(`posid`,`modelid`,`catid`,`name`,`maxnum`,`extention`,`listorder`,`siteid`) values (1,0,0,'首页焦点图推荐',20,NULL,1,1),(2,0,0,'首页头条推荐',20,NULL,4,1),(13,82,0,'栏目页焦点图',20,NULL,0,1),(5,69,0,'推荐下载',20,NULL,0,1),(8,30,54,'图片频道首页焦点图',20,NULL,0,1),(9,0,0,'网站顶部推荐',20,NULL,0,1),(10,0,0,'栏目首页推荐',20,NULL,0,1),(12,0,0,'首页图片推荐',20,NULL,0,1);

/*Table structure for table `v9_position_data` */

DROP TABLE IF EXISTS `v9_position_data`;

CREATE TABLE `v9_position_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `modelid` smallint(6) unsigned DEFAULT '0',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `data` mediumtext,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `listorder` mediumint(8) DEFAULT '0',
  `expiration` int(10) NOT NULL,
  `extention` char(30) DEFAULT NULL,
  `synedit` tinyint(1) DEFAULT '0',
  KEY `posid` (`posid`),
  KEY `listorder` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_position_data` */

/*Table structure for table `v9_queue` */

DROP TABLE IF EXISTS `v9_queue`;

CREATE TABLE `v9_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` char(5) DEFAULT NULL,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `path` varchar(100) DEFAULT NULL,
  `status1` tinyint(1) DEFAULT '0',
  `status2` tinyint(1) DEFAULT '0',
  `status3` tinyint(1) DEFAULT '0',
  `status4` tinyint(1) DEFAULT '0',
  `times` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `times` (`times`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_queue` */

/*Table structure for table `v9_release_point` */

DROP TABLE IF EXISTS `v9_release_point`;

CREATE TABLE `v9_release_point` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `port` varchar(10) DEFAULT '21',
  `pasv` tinyint(1) DEFAULT '0',
  `ssl` tinyint(1) DEFAULT '0',
  `path` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_release_point` */

/*Table structure for table `v9_search` */

DROP TABLE IF EXISTS `v9_search`;

CREATE TABLE `v9_search` (
  `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adddate` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`searchid`),
  KEY `typeid` (`typeid`,`id`),
  KEY `siteid` (`siteid`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_search` */

/*Table structure for table `v9_search_keyword` */

DROP TABLE IF EXISTS `v9_search_keyword`;

CREATE TABLE `v9_search_keyword` (
  `keyword` char(20) NOT NULL,
  `pinyin` char(20) NOT NULL,
  `searchnums` int(10) unsigned NOT NULL,
  `data` char(20) NOT NULL,
  UNIQUE KEY `keyword` (`keyword`),
  UNIQUE KEY `pinyin` (`pinyin`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_search_keyword` */

/*Table structure for table `v9_session` */

DROP TABLE IF EXISTS `v9_session`;

CREATE TABLE `v9_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

/*Data for the table `v9_session` */

/*Table structure for table `v9_site` */

DROP TABLE IF EXISTS `v9_site`;

CREATE TABLE `v9_site` (
  `siteid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT '',
  `dirname` char(255) DEFAULT '',
  `domain` char(255) DEFAULT '',
  `site_title` char(255) DEFAULT '',
  `keywords` char(255) DEFAULT '',
  `description` char(255) DEFAULT '',
  `release_point` text,
  `default_style` char(50) DEFAULT NULL,
  `template` text,
  `setting` mediumtext,
  `uuid` char(40) DEFAULT '',
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `v9_site` */

insert  into `v9_site`(`siteid`,`name`,`dirname`,`domain`,`site_title`,`keywords`,`description`,`release_point`,`default_style`,`template`,`setting`,`uuid`) values (1,'默认站点','','http://phpcms.loc/','PHPCMS演示站','PHPCMS演示站','PHPCMS演示站','','default','default','array (\n  \'upload_maxsize\' => \'2048\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\',\n  \'watermark_enable\' => \'1\',\n  \'watermark_minwidth\' => \'300\',\n  \'watermark_minheight\' => \'300\',\n  \'watermark_img\' => \'/statics/images/water/mark.png\',\n  \'watermark_pct\' => \'85\',\n  \'watermark_quality\' => \'80\',\n  \'watermark_pos\' => \'9\',\n)','');

/*Table structure for table `v9_special` */

DROP TABLE IF EXISTS `v9_special`;

CREATE TABLE `v9_special` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(60) NOT NULL,
  `typeids` char(100) NOT NULL,
  `thumb` char(100) NOT NULL,
  `banner` char(100) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispage` tinyint(1) unsigned NOT NULL,
  `filename` char(40) NOT NULL,
  `pics` char(100) NOT NULL,
  `voteid` char(60) NOT NULL,
  `style` char(20) NOT NULL,
  `index_template` char(40) NOT NULL,
  `list_template` char(40) NOT NULL,
  `show_template` char(60) NOT NULL,
  `css` text NOT NULL,
  `username` char(40) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL,
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_special` */

/*Table structure for table `v9_special_c_data` */

DROP TABLE IF EXISTS `v9_special_c_data`;

CREATE TABLE `v9_special_c_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `paginationtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `style` char(20) NOT NULL,
  `show_template` varchar(30) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_special_c_data` */

/*Table structure for table `v9_special_content` */

DROP TABLE IF EXISTS `v9_special_content`;

CREATE TABLE `v9_special_content` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `specialid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `style` char(24) NOT NULL,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `curl` char(15) NOT NULL,
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `searchid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isdata` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `specialid` (`specialid`,`typeid`,`isdata`),
  KEY `typeid` (`typeid`,`isdata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_special_content` */

/*Table structure for table `v9_sphinx_counter` */

DROP TABLE IF EXISTS `v9_sphinx_counter`;

CREATE TABLE `v9_sphinx_counter` (
  `counter_id` int(11) unsigned NOT NULL,
  `max_doc_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`counter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_sphinx_counter` */

/*Table structure for table `v9_template_bak` */

DROP TABLE IF EXISTS `v9_template_bak`;

CREATE TABLE `v9_template_bak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned DEFAULT '0',
  `fileid` char(50) DEFAULT NULL,
  `userid` mediumint(8) DEFAULT NULL,
  `username` char(20) DEFAULT NULL,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `fileid` (`fileid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `v9_template_bak` */

/*Table structure for table `v9_times` */

DROP TABLE IF EXISTS `v9_times`;

CREATE TABLE `v9_times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `times` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`isadmin`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

/*Data for the table `v9_times` */

/*Table structure for table `v9_type` */

DROP TABLE IF EXISTS `v9_type`;

CREATE TABLE `v9_type` (
  `typeid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(15) NOT NULL,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typedir` char(20) NOT NULL,
  `url` char(100) NOT NULL,
  `template` char(30) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`typeid`),
  KEY `module` (`module`,`parentid`,`siteid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

/*Data for the table `v9_type` */

insert  into `v9_type`(`typeid`,`siteid`,`module`,`modelid`,`name`,`parentid`,`typedir`,`url`,`template`,`listorder`,`description`) values (52,1,'search',0,'专题',0,'special','','',4,'专题'),(1,1,'search',1,'新闻',0,'','','',1,'新闻模型搜索'),(2,1,'search',2,'下载',0,'','','',3,'下载模型搜索'),(3,1,'search',3,'图片',0,'','','',2,'图片模型搜索');

/*Table structure for table `v9_urlrule` */

DROP TABLE IF EXISTS `v9_urlrule`;

CREATE TABLE `v9_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlrule` varchar(255) NOT NULL,
  `example` varchar(255) NOT NULL,
  PRIMARY KEY (`urlruleid`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `v9_urlrule` */

insert  into `v9_urlrule`(`urlruleid`,`module`,`file`,`ishtml`,`urlrule`,`example`) values (1,'content','category',1,'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html','news/china/1000.html'),(6,'content','category',0,'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}','index.php?m=content&c=index&a=lists&catid=1&page=1'),(11,'content','show',1,'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html','2010/catdir_0720/1_2.html'),(12,'content','show',1,'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html','it/product/2010/0720/1_2.html'),(16,'content','show',0,'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}','index.php?m=content&c=index&a=show&catid=1&id=1'),(17,'content','show',0,'show-{$catid}-{$id}-{$page}.html','show-1-2-1.html'),(18,'content','show',0,'content-{$catid}-{$id}-{$page}.html','content-1-2-1.html'),(30,'content','category',0,'list-{$catid}-{$page}.html','list-1-1.html');

/*Table structure for table `v9_workflow` */

DROP TABLE IF EXISTS `v9_workflow`;

CREATE TABLE `v9_workflow` (
  `workflowid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `steps` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `workname` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `setting` text NOT NULL,
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`workflowid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `v9_workflow` */

insert  into `v9_workflow`(`workflowid`,`siteid`,`steps`,`workname`,`description`,`setting`,`flag`) values (1,1,1,'一级审核','审核一次','',0),(2,1,2,'二级审核','审核两次','',0),(3,1,3,'三级审核','审核三次','',0),(4,1,4,'四级审核','四级审核','',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
