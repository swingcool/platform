-- +---------------------------------------------------------
-- | MODEL       : camera
-- | AUTHOR      : zhuyan
-- +---------------------------------------------------------

delimiter ;

set names utf8;

###########  创建数据库 ##############
drop database if exists mybatis;
create database mybatis character set utf8;

############### 建表 ################
use mybatis;

#language语种表
drop table if exists language;
create table `language`
(
	#语种ID
	id tinyint unsigned not null, 
	#文字
	writing varchar(32) not null default "",
	#语言
	speaking varchar(32) not null default "",
	#简写
	logogram varchar(32) not null default "",
	primary key (id)
)ENGINE=InnoDB default charset=utf8;
insert into language(id, writing, speaking, logogram) values(1, '简体中文', '中文', 'zh');#简体中文，普通话
insert into language(id, writing, speaking, logogram) values(2, '繁體中文', '粵語', 'zh_hk');#繁体中文，粤语
insert into language(id, writing, speaking, logogram) values(3, 'English', 'English', 'en');#英文，英语
insert into language(id, writing, speaking, logogram) values(4, 'Japanese', 'Japanese', 'ja');#日文，日本语
insert into language(id, writing, speaking, logogram) values(5, 'Korean', 'Korean', 'ko');#韩文，韩语
insert into language(id, writing, speaking, logogram) values(6, 'Arabic', 'Arabic', 'ar');#阿拉伯文，阿拉伯语
insert into language(id, writing, speaking, logogram) values(7, 'German', 'German', 'de');#德文，德语
insert into language(id, writing, speaking, logogram) values(8, 'Spanish', 'Spanish', 'es');#西班牙文，西班牙语
insert into language(id, writing, speaking, logogram) values(9, 'Russian', 'Russian', 'ru');#俄文，俄语
insert into language(id, writing, speaking, logogram) values(10, 'French', 'French', 'fr');#法文，法语

#teminal_type 终端类型表， 宏定义
drop table if exists terminal_type;
create table `terminal_type`
(
	#id
	id tinyint not null,
	#描述
	description varchar(32) not null default "",
	primary key (id)
)ENGINE=InnoDB default charset=utf8;
insert into terminal_type(id, description) values(0, "UNKOWN"); #未知
insert into terminal_type(id, description) values(1, "STB"); #机顶盒
insert into terminal_type(id, description) values(2, "PC"); #个人电脑
insert into terminal_type(id, description) values(3, "Android-Phone"); #Android手机
insert into terminal_type(id, description) values(4, "Android-Pad"); #Android Pad
insert into terminal_type(id, description) values(5, "iOS-Phone"); #苹果手机
insert into terminal_type(id, description) values(6, "iOS-Pad"); #苹果平板
#insert into terminal_type(id, description) values(10, "AP"); #AP设备
insert into terminal_type(id, description) values(20, "Camera"); #摄像头
insert into terminal_type(id, description) values(32, "CDS"); #CDS服务器

#server_type 服务器类型表， 宏定义
drop table if exists server_type;
create table `server_type`
(
	#id
	id tinyint not null,
	#描述
	description varchar(10) not null default "",
	primary key (id)
)ENGINE=InnoDB default charset=utf8;
insert into server_type(id, description) values(0, "UNKOWN"); #未知
insert into server_type(id, description) values(1, "OIS"); #OIS服务器
insert into server_type(id, description) values(2, "CDS"); #CDS服务器
#--insert into server_type(id, description) values(3, "EPGS"); #EPG服务器

#bill_type 摄像头订购套餐类型表， 宏定义
drop table if exists bill_type;
create table `bill_type`
(
	#id
	id tinyint not null,
	#描述
	description varchar(10) not null default "",
	primary key (id)
)ENGINE=InnoDB default charset=utf8;
insert into bill_type(id, description) values(0, "UNKOWN"); 
insert into bill_type(id, description) values(1, "一次性购买包"); 
insert into bill_type(id, description) values(2, "自动续订包天包"); 
insert into bill_type(id, description) values(3, "自动续订包月包"); 
insert into bill_type(id, description) values(4, "自动续订包年包"); 

#alarm_type 摄像头报警类型表， 宏定义
drop table if exists alarm_type;
create table `alarm_type`
(
	#id
	id tinyint not null,
	#描述
	description varchar(100) not null default "",
	primary key (id)
)ENGINE=InnoDB default charset=utf8;
insert into alarm_type(id, description) values(0, "UNKOWN");#关闭
insert into alarm_type(id, description) values(1, "移动侦测报警"); #（开启）移动侦测报警
insert into alarm_type(id, description) values(2, "遮挡侦测报警"); #（开启）遮挡侦测报警
insert into alarm_type(id, description) values(4, "温度侦测报警"); #（开启）温度侦测报警

#alarm_link 报警联动字， 宏定义
drop table if exists alarm_link;
create table `alarm_link`
(
	#id
	id int unsigned not null,
	#描述
	description varchar(100) not null default "",
	primary key (id)
)ENGINE=InnoDB default charset=utf8;
insert into alarm_link(id, description) values(0, "无"); #无
insert into alarm_link(id, description) values(1, "抓拍"); #抓拍


#网络连接类型， 宏定义
drop table if exists netmode;
create table `netmode`
(
	#id
	id int not null,
	#描述
	description varchar(32) not null default "",
	primary key (id)
)ENGINE=InnoDB default charset=utf8;
insert into netmode(id, description) values(0, "unkown");
insert into netmode(id, description) values(1, "lan-dhcp");
insert into netmode(id, description) values(2, "lan-static");
insert into netmode(id, description) values(3, "lan-pppoe");
insert into netmode(id, description) values(4, "wifi-dhcp");
insert into netmode(id, description) values(5, "wifi-static");
insert into netmode(id, description) values(6, "wifi-pppoe");
insert into netmode(id, description) values(7, "2G");
insert into netmode(id, description) values(8, "3G");
insert into netmode(id, description) values(9, "4G");

#系统属性表
drop table if exists system_property;
create table `system_property`
(
	#自增主键
	id int unsigned auto_increment,
	#支持语言（可以支持多种语言，以/隔开）
	support_languages varchar(22) not null default 1, 
	#默认语言
	default_language tinyint unsigned not null default 1,
	#是否启用文件自动分发, 默认未开启
	auto_distribute char not null default 0,
	#是否启用片源自动推送，默认未启动
	auto_push char not null default 0,
	#回看录制时长（单位天，即系统需要录制保留几天的回看, 默认7天回看）
	playback_duration tinyint not null default 7,
	#资源分发完成是否自动导入系统
	auto_import_resource char not null default 1,
	#是否启用sunniwell-drm系统对内容进行保护(0-不启用，1-启用)
	enable_drm char not null default 0,
	#EPGS服务器的同步状态码, 是一个32位的UUID值。每次公共属性有更改，则重新生成UUID写入此字段。
	#每次与EPGS同步公共属性完成之后，会将此状态码传递给EPGS保存起来。
	#EPG媒资发布的时候，首先会获取EPGS的状态码，与MOP后台的状态码相比较，
	#如果不同表示后台的公共属性已经有修改，需要同步，并更新状态码
	#如果相同则不需要同步公共属性
	sync_code char(36) not null default "defaultcode",
	#升级地址，全地址。
	upgrade_url varchar(255),
	#平台标题 支持动态修改生效
	platform_title text,
	primary key (id)
)ENGINE=InnoDB default charset=utf8;
insert into system_property(support_languages, default_language, auto_distribute, auto_push,playback_duration,auto_import_resource,enable_drm,platform_title) values("1",1,0,0,7,1,0,'{"en_US":"Sunniwell Camera management of platform","zh_CN":"朝歌随看管理平台","zh_TW":"朝歌隨看管理平臺"}'); #支持中文简体， 默认语言中文简体

#计费相关动作表，此表不用， 只是约定备查
drop table if exists billing_operation;
create table `billing_operation`
(
	#id
	id tinyint not null,
	#简体中文描述
	description_zh varchar(32) not null default "",
	#繁体中文描述
	description_zhhk varchar(32) not null default "",
	#英文描述
	description_en varchar(32) not null default "",
	primary key (id)
)ENGINE=InnoDB default charset=utf8;
insert into billing_operation(id, description_zh, description_zhhk, description_en) values(1, '充值','充值', 'Recharge');
insert into billing_operation(id, description_zh, description_zhhk, description_en) values(2, '购买','購買', 'Buy');
insert into billing_operation(id, description_zh, description_zhhk, description_en) values(3, '退订','退訂', 'Unsubscribe');
insert into billing_operation(id, description_zh, description_zhhk, description_en) values(4, '转账','轉賬', 'Transfer');

#command表
drop table if exists command;
create table `command`
(
	#自增主键
	id int unsigned	auto_increment,
	#命令
	cmd char(64) not null,
	#参数1 一般就是表ID
	arg0 varchar(128),
	#参数2
	arg1 varchar(128),
	#参数3
	arg2 text,
	#主键
	primary key (id)
)ENGINE=InnoDB default charset=utf8;

#operator操作员相关表
drop table if exists operator_role;
drop table if exists operators;
drop table if exists permission;
#操作员角色表
create table `operator_role`
(
	#角色ID
	id int auto_increment,
	#角色名
	name char(32) not null,
	#权限(权限具体与各个管理模块ID对应，拥有该模块ID串则具有该操作权限，ID间用"/"竖杠隔开，*号表示可使用所有权限（超级用户）)
	permission text	not null,
	#主键
	primary key (id)
)ENGINE=InnoDB default charset=utf8;
insert into operator_role(id, name, permission) values(2, '超级用户', '*');
##--insert into operator_role(id, name, permission) values(1, '行业用户', '*');

#操作员表
create table `operators`
(
	#操作员ID(即用户名)
	id char(64)	not null,
	#角色ID
	role_id int not null,
	#密码
	password char(64) not null default "",
	#联系方式
	phone char(16) not null default "",
	#住址
	addr char(64) not null default "",
	#登录时间
	login_utc bigint not null default 0,
	#密保问题
	question varchar(255) not null default "",
	#密保答案
	answer varchar(255) not null default "",
	#用户密保邮箱 通过邮箱找回密码 修改时间：2015年9月14日20:01:30
	email varchar(128) not null default '',
	#用户分组权限
	jurisdiction text,
	#主键
	primary key (id),
	#索引
	key (role_id),
	#外键约束-级联删除
	foreign key (`role_id`) references `operator_role` (`id`) on delete cascade on update cascade
)ENGINE=InnoDB default charset=utf8;
#insert into operators(id, role_id, password) values('root', 2, 'b98e0cff831eea096ed56f55cef775f1');
#-- 初始化密码 123456ab user_role 修改加密算法
insert into operators(id, role_id, password) values('root', 2, 'AF2133204427DE42D3AD3932894944DE');

#权限表
create table `permission`
(
	#id
	id int unsigned,
	#title
	title varchar(64) not null,
	#描述
	description varchar(64) not null,
	#主键
	primary key (id)
)ENGINE=InnoDB default charset=utf8;

insert into permission(id,title,description) values 
(1000, 'opm', 'menu.system.management'),
(1100, 'opm_opm', 'operator.management'),
(1200, 'opm_rolem', 'role.management'),
(1300, 'opm_groupm', 'menu.group.management'),
(1400, 'sysm_syspm', 'menu.system.parameters'),

(2000, 'serverm', 'server.management'),
(2100, 'serverm_serverm', 'server.management'),
(2200, 'sm_scm', 'menu.server.condition.monitoring'),
(2300, 'sm_sfs', 'menu.server.flow.statistics'),

(3000, 'cameram', 'menu.terminal.management'),
(3100, 'cameram_inventory', 'camera.inventory.management'),
(3200, 'cameram_cameram', 'camera.management'),
(3300, 'cameram_alarm', 'camera.alarm'),
(3400, 'terminalm_terminalm', 'terminal.management'),

(4000,'userm','user.management'),
#--(4100,'userm_userr','user.role.management'),
(4200,'userm_userm','user.management'),
(4300,'userm_userm','userm_feedback'),

#--(5000, 'terminalm', 'terminal.management'),
#--(5100, 'terminalm_terminalm', 'terminal.management'),

#--(7000, 'storagem', 'menu.storage.management'),
#--(7100, 'storagem_storagefile', 'menu.storagefile.management'),
(8000, 'bm', 'menu.payment.management'),
(8100, 'bm_ppm', 'menu.product.package.management'),
(8200, 'bm_r', 'menu.recharge'),
(8300, 'bm_bo', 'menu.business.order'),
(8400, 'bm_oh', 'menu.order.history'),
(8500, 'bm_eh', 'menu.expense.history'),
(9000, 'lm', 'menu.log.management'),
(9500, 'lm_sysl', 'menu.log.info.management'),
#--(9100, 'lm_ssl', 'menu.system.log'),
#--(9300, 'lm_tl', 'menu.terminal.log'),
#--(9200, 'lm_sel', 'menu.server.log'),
#--(9400, 'lm_cl', 'menu.camera.log'),

(10000, 'reportm', 'menu.report.management'),
#--(10100, 'sm_scm', 'menu.server.condition.monitoring'),
#--(10200, 'sm_sfs', 'menu.server.flow.statistics'),
(10300, 'sm_ca', 'menu.camera.alarm.statistical'),
(10400, 'sm_uos', 'menu.user.online.statistic'),
(10500, 'sm_cos', 'menu.camera.online.statistic');

drop table if exists camera_group;
#摄像头设备表
drop table if exists camera;
create table `camera`
(
	#摄像头id,或serial或mac地址等唯一标识字串 
	id varchar(64) not null,
	#别名
	name varchar(255) not null default "",
	#所属用户
	user_id char(128) not null default "",
	#关联cds
	cds_id char(36) not null default "",
	#IP地址, 初始可以为空，程序跑起来再更新此字段 
	ip char(20) not null default "", 
	#MAC地址，初始可以为空，登录时上报
	mac char(20) not null default "", 
	#软件版本号 
	soft_ver char(32) not null default "", 
	#硬件版本号
	hard_ver char(32) not null default "", 
	#在线状态(0-不在线 1-在线) 
	online char	not null default 0, 
	#开通状态 0-未开通 1-开通 
	enable char	not null default 0,
	#有效期至
	end_utc bigint not null default 0,
	#回看录制时长（单位天）
	playback_duration int not null default 0,
	#摄像头级别（0-个人摄像头， 1-行业摄像头）
	level int not null default 0,
	#套餐类型（订购类型，参见bill_type表宏定义）
	bill_type tinyint not null default 0,
	#第一次绑定用户 1：已经绑定过 0：尚未绑定过
	first_bind tinyint not null default 0,
	#允许使用的磁盘空间(云端空间，在CDS上的空间。-1：不限制；0：不开通；n：正整数)(单位M）
	enable_space int not null default 0,
	#已使用的磁盘空间(单位MB）
	used_space int not null default 0,
	#SD卡空间大小(单位MB)
	sdcard_space int not null default 0,
	#优先支持协议（0：Relay ；1：P2P）
	protocol int not null default 0,
	#SD卡已使用空间(单位MB)
	sdcard_used_space int not null default 0,
	#告警联动字
	#alarm_link int not null default 0,
	#报警状态 0：关闭 ；1：开启
	#alarm_status int not null default 0,
	#参数 用JSON格式表示。
	argument text,
	#登录时间 
	login_utc bigint not null default 0,
	#skey计数器
	skey_counter smallint default 0,
	#用于生成skey
	skey_seed char(34),
	#skey加密算法(0-AES, 1-DES)
	sencrypt_type char,
	#ckey加密算法(0-AES, 1-DES)
	cencrypt_type char,
	#ckey计数器
	ckey_counter int default 0,
	#内容密钥
	ckey char(34),	
	#硬件型号
	hardware_type varchar(32) not null default "",
	#可播放时间段
	play_time text,
	#业务ID
	business_id varchar(64) not null default "",
	#出库状态
	outbound char not null default 0,
	#摄像头分享状态 0：不分享 >1：私密分享 -1：公共分享
	share_count int default 0,
	#摄像头直连播放端口
	pnat_port int default 6789,
	#主键
	primary key (id)
)ENGINE=InnoDB default charset=utf8;

#损坏的摄像头列表
drop table if exists breakdown_camera;
create table `breakdown_camera`
(
	#摄像头id,或serial或mac地址等唯一标识字串 
	id char(64)	not null,
	#业务ID
	business_id varchar(64) not null default "",
	#别名
	name varchar(255) not null default "",
	#所属用户
	user_id char(128) not null default "",
	#关联cds
	cds_id char(36) not null default "",
	#IP地址, 初始可以为空，程序跑起来再更新此字段 
	ip char(20) not null default "", 
	#MAC地址，初始可以为空，登录时上报
	mac char(20) not null default "", 
	#摄像头级别（0-个人摄像头， 1-行业摄像头）
	level int not null default 0, 
	#损坏时间 
	breakdown_utc bigint not null default 0,
	#主键
	primary key (id)
)ENGINE=InnoDB default charset=utf8;

#摄像头分组
create table `camera_group`
(
	#自增主键
	id int unsigned auto_increment,
	#组名
	title varchar(255) not null,
	#主键
	primary key (id)
)ENGINE=InnoDB default charset=utf8;

#摄像头分享表
drop table if exists camera_share;
create table `camera_share`
(
	#自增主键
	id int unsigned auto_increment,
	#摄像头ID
	camera_id varchar(64) not null,
	#分享ID ，可以是账户ID或分组ID。 账户ID==私密分享  分组ID==公开分享
	share_id varchar(128) not null,
	#分享状态 1：私密分享  2：公开分享
	share_status int not null default 1,
	#主键
	primary key (id)
)ENGINE=InnoDB default charset=utf8;

#摄像头参数表
drop table if exists camera_parameter;
create table `camera_parameter`
(
	#终端ID
	id char(36)	not null,
	#params
	params text,
	#主键
	primary key ( id )
)ENGINE=InnoDB default charset=utf8;

#drm_record表
drop table if exists drm_record;
create table `drm_record`
(
	#自增索引
	id int unsigned auto_increment,
	#key计数器
	key_counter int unsigned,
	#密钥
	key_seed char(36),
	#加密类型
	cencrypt_type char,
	#主键
	primary key (id )
)ENGINE=InnoDB default charset=utf8;

#录制任务表
drop table if exists record_task;
create table `record_task`
(
	#自增主键
	id int unsigned auto_increment,
	#camera id
	camera_id char(64)	not null,
	#录制开始时间utc
	start_utc bigint not null default 0,
	#录制结束时间utc
	end_utc bigint not null default 0,
	#主键
	primary key (id)
)ENGINE=InnoDB default charset=utf8;

#报警表
drop table if exists alarm;
create table `alarm`
(
	#自增主键
	id int unsigned auto_increment,
	#camera id
	camera_id char(64)	not null,
	#报警时间utc
	utc bigint not null default 0,
	#报警类型（参见alarm_type表宏定义）
	type tinyint not null default 0,
	#主键
	primary key (id)
)ENGINE=InnoDB default charset=utf8;

#报警策略设置
drop table if exists alarm_strategy_setting;
create table `alarm_strategy_setting`
(
	#自增主键
	id int unsigned auto_increment,
	#camera id
	camera_id char(64)	not null,
	#录制时长（秒）
	record_duration int unsigned,
	#告警间隔（秒）
	alarm_interval int unsigned,
	#抓拍数量
	capture_num int unsigned,
	#保存告警抓拍总张数
	save_capture_num int unsigned,
	#预录制状态  0 关闭    1 开启
	reserved_record_status int not null default 0,
	#时间间隔（秒）
	capture_time_interval int unsigned,
	#告警联动字
	alarm_link int not null default 0,
	#报警联动类型，定义如下： 0 - 关闭报警联动；1 - （开启）移动侦测报警；2 - （开启）遮挡侦测报警。4 -  （开启）温度侦测报警
	alarm_type char not null default 0,
	#保存告警抓拍总张数
	capture_limit int(11) DEFAULT 0,
	#主键
	primary key ( id ) ,
	#索引
	key (`camera_id`),
	#外键约束-级联删除
	foreign key (`camera_id`) references `camera` (`id`) on delete cascade on update cascade
)ENGINE=InnoDB default charset=utf8;



#报障表  报障时间 操作员ID 摄像头ID 
drop table if exists malfunctioning;
create table `malfunctioning`
(
	#自增主键
	id int unsigned auto_increment,
	#camera id
	camera_id char(64)	not null,
	#报障时间utc
	utc bigint not null default 0,
	#故障描述
	description text,
	#操作员
	operator varchar(64),
	#主键
	primary key (id)
)ENGINE=InnoDB default charset=utf8;

#server表
drop table if exists server;
create table `server`
(
	#服务器ID
	id char(36)	not null,
	#服务器名称
	name varchar(128) not null default "",
	#IP地址, 对外提供服务IP
	ip char(20)	not null default "",
	#服务器内网IP地址
	local_ip char(20) default "",
	#端口
	port int unsigned,
	#域名
	domain varchar(128) not null default "",
	#1-ois, 2-cds, 3-epgs ,  见 server_type 表
	type char not null,
	#在线状态(0-不在线 1-在线)
	online char	not null default 0,
	#开通状态 0-未开通 1-开通
	enable char	not null default 0,
	#服务器启动时间
	login_utc bigint not null default 0,
	#剩余硬盘空间
	free_space int unsigned not null default 0,
	#最大输出带宽
	output_bw int unsigned not null default 0,
	#当前负载
	cur_load int unsigned not null default 0,
	#最大负载
	max_load int unsigned not null default 0,
	#服务器所在地区
	addr char(64) not null default "",
	#主键
	primary key (id)
)ENGINE=InnoDB default charset=utf8;

#摄像头分组跟用户分组共用一套分组
drop table if exists camera_group_child;

#user用户表
drop table if exists user_group_child;
drop table if exists user_group;
drop table if exists user_role_code;
drop table if exists user_role;
drop table if exists user;

#终端用户权限码表（用权限码来计算出权限值）
create table `user_role_code`(
	#主键ID
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	#权限码（不能重复且必须是2的N次方）
	code int not null UNIQUE,
	#简体中文描述
	description_zh varchar(64) not null default '',
	#繁体中文描述
	description_zhhk varchar(64) not null default '',
	#英文描述
	description_en varchar(64) not null default '',
	PRIMARY KEY (`id`)
)ENGINE=InnoDB default charset=utf8;

INSERT INTO `user_role_code` VALUES (1,1,'直播','直播','Live');
INSERT INTO `user_role_code` VALUES (2,2,'对讲','對講','Intercom');
INSERT INTO `user_role_code` VALUES (3,4,'手动抓拍','手動抓拍','Capture');
INSERT INTO `user_role_code` VALUES (4,8,'翻转','翻轉','Flip');
INSERT INTO `user_role_code` VALUES (5,16,'查看云空间','查看云空間','See the cloud space');
INSERT INTO `user_role_code` VALUES (6,32,'布撤防','布撤防','Deployment Evacuate Defense');
INSERT INTO `user_role_code` VALUES (7,64,'云台控制','云臺控制','PTZ control');

#终端用户角色(权限值)表
create table `user_role`
(
	#角色ID
	id int auto_increment,
	#角色名
	name char(64) not null,
	#权限值(用户权限码异或(^)运算得出的数值)
	permission int not null default 1,
	#主键
	primary key (id)
)ENGINE=InnoDB default charset=utf8;

#新用户表 包含系统用户、行业用户、终端用户
create table `user`
(
	#用户名作为主键
	id varchar(128) not null,
	#密码
	password char(32) not null default '',
	#Token 对接第三方平台
	token varchar(64) default '',
	#微信号
	wechat varchar(32) default '',
	#开通状态 0-禁用 1-启用 
	enable char	not null default 0, 
	#真实姓名
	realname varchar(128) not null default '',
	#email
	email varchar(128) not null default '',
	#住址
	addr varchar(255) not null default '',
	#电话
	phone char(16) not null default '',
	#在线状态(0-不在线 1-在线) 
	online char	not null default 0, 
	#名下摄像头数
	camcnt int unsigned not null default 0,
	#在线终端数
	termcnt int unsigned not null default 0,
	#用户允许同时在线最大终端数
	max_termcnt int unsigned not null default 0,
	#存储时间字段
	save_time int unsigned default 0,
	#账户余额
	balances double not null default 0,
	#用户级别（0-个人用户， 1-行业用户）
	level int not null default 0,
	#父节点ID
	pid varchar(128),
	#用户类型：0：一般用户  1：行业用户  2:系统操作员
	type int(6) not null,
	#登录时间
	login_utc bigint not null default 0,
	#激活时间（即enable置为1的时间）
	enable_utc bigint not null default 0,
	#有效期至（为0表示无有效期限制，永远可用）
	validto_utc bigint not null default 0,
	#isp
	isp char(32) not null default "",
	#角色ID
	role_id int not null default 0,
	#主键
	primary key (id)
	#,
	#key (`role_id`),
	#foreign key (`role_id`) references `user_role` (`id`)
)ENGINE=InnoDB default charset=utf8;
INSERT INTO `user`(id, password, enable, realname, email, addr, phone, online, camcnt, save_time, balances, level, pid, type, login_utc, enable_utc, validto_utc, isp)
VALUES ('camera', 'd1a65a8fdbeb6d7380c0cb19ead51904', '1', 'camera', '', 'camera', '', '0', '0', '123', '0', '0', '00', '0', '0', '0', '1441411200000', 'beijing');

#用户摄像头关联关系表
create table `user_camera_child`(
	#自增主键
	id int unsigned auto_increment,
	#成员id，外键，连接到user（注意去重）
	user_id varchar(128) not null references user(id),
	#摄像头id，外键，连接到camera
	camera_id varchar(64) not null references camera(id),
	#主键
	primary key (id),
	#索引
	key (`user_id`),
	key (`camera_id`),
	#外键约束-级联删除
	foreign key (`user_id`) references `user` (`id`) on delete cascade on update cascade,
	foreign key (`camera_id`) references `camera` (`id`) on delete cascade on update cascade
)ENGINE=InnoDB default charset=utf8;

#用户分组
create table `user_group`
(
	#主键
	id varchar(255) not null,
	#组名
	title varchar(255) not null,
	#主键
	pid varchar(255) not null,
	primary key (id)
)ENGINE=InnoDB default charset=utf8;
insert into user_group(id,title, pid) values("00","root", "0"); 

#用户分组成员表
create table `user_group_child`
(
	#自增主键
	id int unsigned auto_increment,
	#组id，外键，连接到user_group
	group_id varchar(255) not null references user_group(id),
	#成员id，外键，连接到user（注意去重）
	user_id varchar(128) not null references user(id),
	#主键
	primary key (id),
 	#索引
	key (`user_id`),
	key (`group_id`),
	#外键约束-级联删除
	foreign key (`user_id`) references `user` (`id`) on delete cascade on update cascade,
	foreign key (`group_id`) references `user_group` (`id`) on delete cascade on update cascade
)ENGINE=InnoDB default charset=utf8;

#摄像头分组成员表
create table `camera_group_child`
(
	#自增主键
	id int unsigned auto_increment,
	#组id，外键，连接到user_group
	group_id varchar(255) not null references user_group(id),
	#成员id，外键，连接到camera表（注意去重）
	camera_id char(64) not null,
	#主键
	primary key (id),
 	#索引
	key (`camera_id`),
	key (`group_id`),
	#外键约束-级联删除
	foreign key (`camera_id`) references `camera` (`id`) on delete cascade on update cascade,
	foreign key (`group_id`) references `user_group` (`id`) on delete cascade on update cascade
)ENGINE=InnoDB default charset=utf8;

#subscribe 用户订购记录表
drop table if exists user_subscribe;
create table `user_subscribe`
(
	#自增主键
	id int unsigned auto_increment,
	#用户名
	user_id char(128) not null references user(id),
	#成员id，外键，连接到camera表（注意去重）一个摄像头只能订购一个产品包
	camera_id char(64) not null,
	#订购的业务包id
	service_id char(36) not null references service(id),
	#订购价格，即订购该包时包的价格，以后包的价格可以变更，但用户当时买的价格不能随之变化
	price double not null default 0,
	#订购时间
	op_utc bigint not null default 0,
	#生效时间
	start_utc bigint not null,
	#到期时间
	end_utc bigint not null,
	#订购状态: 0：订购未支付  1：支付成功  2：支付失败  3：已取消
	status tinyint not null default 0,
	#索引
	key (`camera_id`),
	primary key (id)
)ENGINE=InnoDB default charset=utf8;

#user_asset 用户消费记录表
drop table if exists user_asset;
create table `user_asset`
(
	#自增主键
	id int unsigned auto_increment,
	#用户ID
	user_id char(128)	not null references user(id),
	#操作的产品包(消费/退订)
	service_id char(36) references service(id),
	#用户动作(见billing_operation表)
	op_type char not null,
	#操作费用
	op_cost double not null default 0,
	#操作时间
	op_utc bigint not null,
	#操作后账户余额
	balances double not null default 0,
	primary key (id)
)ENGINE=InnoDB default charset=utf8;

#terminal终端表 
drop table if exists terminal_group_child;
drop table if exists terminal_group;
drop table if exists terminal; 
create table `terminal` 
( 
	#id即为stb-id,或serial或mac地址等唯一标识字串 
	id char(64)	not null, 
	#所属用户
	user_id char(128) not null default "",
	#IP地址, 初始可以为空，程序跑起来再更新此字段 
	ip char(20) not null default "", 
	#MAC地址，初始可以为空，登录时上报
	mac char(20) not null default "", 
	#终端类型，详解见terminal_type表 
	type char not null, 
	#软件版本号 
	soft_ver char(32) not null default "", 
	#硬件版本号 
	hard_ver char(32) not null default "", 
	#在线状态(0-不在线 1-在线) 
	online char	not null default 0, 
	#开通状态 0-未开通 1-开通 
	enable char	not null default 0, 
	#登录时间 
	login_utc bigint not null default 0, 
	#终端所在地区 
	addr char(128) not null default "", 
	#网络连接类型(见表netmode)
	netmode	int not null default 0, 
	#主键
	primary key (id)
)ENGINE=InnoDB default charset=utf8;

#终端分组
create table `terminal_group`
(
	#自增主键
	id int unsigned auto_increment,
	#组名
	title varchar(255) not null,
	#主键
	primary key (id)
)ENGINE=InnoDB default charset=utf8;

#终端分组成员表
create table `terminal_group_child`
(
	#自增主键
	id int unsigned auto_increment,
	#组id，外键，连接到terminal_group
	group_id int unsigned not null,
	#成员id，外键，连接到terminal（注意去重）
	terminal_id char(64) not null,
	#主键
	primary key (id),
 	#索引
	key (`terminal_id`),
	key (`group_id`),
	#外键约束-级联删除
	foreign key (`terminal_id`) references `terminal` (`id`) on delete cascade on update cascade,
	foreign key (`group_id`) references `terminal_group` (`id`) on delete cascade on update cascade
)ENGINE=InnoDB default charset=utf8;

#终端参数表
drop table if exists terminal_parameter;
create table `terminal_parameter`
(
	#终端ID
	id char(64)	not null,
	#params
	params text,
	#主键
	primary key ( id )
)ENGINE=InnoDB default charset=utf8;

#各类日志、统计、监测总表
drop table if exists log;
create table `log`
(
	#自增索引
	id bigint unsigned auto_increment,
	#来源(IP)
	source varchar(255),
	#type log类型，针对信息主体(1-terminal, 2-server, 3-camera, 4-user)
	type char(10) not null default 1,
	#subtype 子类型，针对信息类型(1-normal正常运行日志，2-exception异常日志, 3-error出错日志，4-action行为日志，7-statistics统计日志，8-monitor监测日志，9-warning告警日志)
	subtype char(10) not null default 1, 
	#log上报时间utc
	utc bigint,
	#json描述
	content text,
	#扩展字段
	extend varchar(50),
	#主键
	primary key ( id )
)ENGINE=InnoDB default charset=utf8;

#服务器日志表（对应log总表的type=2, subtype=1 or 2）
drop table if exists server_log;
create table `server_log`
(
	#自增索引
	id bigint unsigned auto_increment,
	#服务器ID（取值来自log总表的content.server_id字段）
	server_id char(36)	not null,
	#服务器IP地址（取值来自log总表的source字段）
	ip char(20)	not null default "",
	#日志类型 1-normal正常运行日志，2-exception异常日志, 3-error出错日志，4-action行为日志（取值来自log总表的subtype字段)
	type tinyint,
	#日志简述, 如行为日志简述可以是login/logout/reboot等，异常日志简述可以是play/upgrade/file/socket等等（取值来自log总表的extend字段）
	brief varchar(128),
	#日志详细描述，对日志的详细描述，比如出错日志这里可以带上出错打印（取值来自log总表的content.description字段）
	detail text,
	#记录时间点（取值来自log总表的utc字段）
	utc bigint,
	#主键
	primary key ( id )
)ENGINE=InnoDB default charset=utf8;

#服务器流量统计（10分钟统计一次）（对应log总表的type=2, subtype=3, extend="flow"）
drop table if exists server_flow_statistics;
create table `server_flow_statistics`
(
	#自增索引
	id bigint unsigned auto_increment,
	#服务器ID（取值来自log总表的content.server_id字段）
	server_id char(36)	not null,	
	#服务器IP地址（取值来自log总表的source字段）
	ip char(20)	not null default "",
	#上行流量(单位Kb/s）（取值来自log总表的content.up_flow字段）
	up_flow int unsigned,
	#下行流量（单位Kb/s）（取值来自log总表的content.down_flow字段）
	down_flow int unsigned,
	#统计开始时间（取值来自log总表的content.start_utc字段）
	start_utc bigint,
	#统计结束时间（取值来自log总表的content.end_utc字段）
	end_utc bigint,
	#主键
	primary key ( id )	
)ENGINE=InnoDB default charset=utf8;

#服务器系统状态实时监测（5s更新一次）（对应log总表的type=2，subtype=4，extend="system"）
drop table if exists server_system_monitor;
create table `server_system_monitor`
(
	#自增索引
	id bigint unsigned auto_increment,
	#服务器ID（取值来自log总表的content.server_id字段）
	server_id char(36)	not null,	
	#服务器IP地址（取值来自log总表的source字段）
	ip char(20)	not null default "",
	#CPU占用率（单位百分比）（取值来自log总表的content.cpu字段）
	cpu tinyint,
	#内存占用率（单位百分比）（取值来自log总表的content.mem字段）
	mem tinyint unsigned,
	#内存总量（单位K）（取值来自log总表的content.endmem_total字段）
	mem_total int unsigned,
	#已使用内存（单位K）（取值来自log总表的content.mem_used字段）
	mem_used int unsigned,
	#剩余内存（单位K）（取值来自log总表的content.mem_free字段）
	mem_free int unsigned,
	#上行码率(单位K)（取值来自log总表的content.upkb字段）
	upkb int unsigned,
	#下行码率(单位K)（取值来自log总表的content.downkb字段）
	downkb int unsigned,  
	#磁盘空间（单位M）（取值来自log总表的content.disk_total字段）
	disk_total int unsigned,
	#已使用磁盘空间（单位M）（取值来自log总表的content.disk_used字段）
	disk_used int unsigned,
	#剩余磁盘空间（单位M）（取值来自log总表的content.disk_free字段）
	disk_free int unsigned,
	#io繁忙度(IO等待所占用的CPU时间的百分比,高过30%时IO压力高)（取值来自log总表的content.io字段）
	io tinyint unsigned,
	#记录时间点（取值来自log总表的utc字段）
	utc bigint,
	#主键
	primary key ( id )
)ENGINE=InnoDB default charset=utf8;

#服务器告警记录（对应总表的type=2, subtype=5）
drop table if exists server_warning;
create table `server_warning`
(
	#自增索引
	id bigint unsigned auto_increment,
	#服务器ID（取值来自log总表的content.server_id字段）
	server_id char(36)	not null,	
	#服务器IP地址（取值来自log总表的source字段）
	ip char(20)	not null default "",
	#告警项（取值来自log总表的extend字段）
	warning varchar(128),
	#告警描述（取值来自log总表的content.description字段）
	description varchar(255),
	#告警时间（取值来自log总表的utc字段）
	utc bigint,
	#主键
	primary key ( id )
)ENGINE=InnoDB default charset=utf8;

#终端日志表（对应总表的type=1，subtype=1 or 2）
drop table if exists terminal_log;
create table `terminal_log`
(
	#自增索引
	id bigint unsigned auto_increment,
	#终端ID（取值来自log总表的content.terminal_id字段）
	terminal_id char(64) not null,
	#所属用户（取值来自log总表的content.user_id字段）
	user_id char(128) not null default "",
	#终端IP地址（取值来自log总表的source字段）
	ip char(20)	not null default "",
	#日志类型 1-normal正常运行日志，2-exception异常日志, 3-error出错日志，4-action行为日志（取值来自log总表的subtype字段)
	type tinyint,
	#日志简述, 如行为日志简述可以是login/logout/reboot等，异常日志简述可以是play/upgrade/file/socket等等（取值来自log总表的extend字段）
	brief varchar(128),
	#日志详细描述，对日志的详细描述，比如出错日志这里可以带上出错打印（取值来自log总表的content.description字段）
	detail text,
	#记录时间点（取值来自log总表的utc字段）
	utc bigint,
	#主键
	primary key ( id )	
)ENGINE=InnoDB default charset=utf8;

#终端流量统计（对应总表的type=1， subtype=3，extend="flow"）
drop table if exists terminal_flow_statistics;
create table `terminal_flow_statistics`
(
	#自增索引
	id bigint unsigned auto_increment,
	#终端ID（取值来自log总表的content.terminal_id字段）
	terminal_id char(64)	not null,
	#所属用户（取值来自log总表的content.user_id字段）
	user_id char(128) not null default "",
	#终端IP地址（取值来自log总表的source字段）
	ip char(20)	not null default "",
	#上行流量(单位Kb/s）（取值来自log总表的content.up_flow字段）
	up_flow int unsigned,
	#下行流量（单位Kb/s）（取值来自log总表的content.down_flow字段）
	down_flow int unsigned,
	#统计开始时间（取值来自log总表的content.start_utc字段）
	start_utc bigint,
	#统计结束时间（取值来自log总表的content.end_utc字段）
	end_utc bigint,
	#主键
	primary key ( id )	
)ENGINE=InnoDB default charset=utf8;

#终端系统状态监测（对应总表的type=1， subtype=4，extend="system"）
drop table if exists terminal_system_monitor;
create table `terminal_system_monitor`
(
	#自增索引
	id bigint unsigned auto_increment,
	#终端ID（取值来自log总表的content.terminal_id字段）
	terminal_id char(64) not null,
	#所属用户（取值来自log总表的content.user_id字段）
	user_id char(128) not null default "",
	#终端IP地址（取值来自log总表的source字段）
	ip char(20)	not null default "",
	#CPU占用率（单位百分比）（取值来自log总表的content.cpu字段）
	cpu tinyint,
	#内存占用率（单位百分比）（取值来自log总表的content.mem字段）
	mem tinyint unsigned,
	#内存总量（单位K）（取值来自log总表的content.endmem_total字段）
	mem_total int unsigned,
	#已使用内存（单位K）（取值来自log总表的content.mem_used字段）
	mem_used int unsigned,
	#剩余内存（单位K）（取值来自log总表的content.mem_free字段）
	mem_free int unsigned,
	#上行码率(单位K)（取值来自log总表的content.upkb字段）
	upkb int unsigned,
	#下行码率(单位K)（取值来自log总表的content.downkb字段）
	downkb int unsigned,  
	#磁盘空间（单位M）（取值来自log总表的content.disk_total字段）
	disk_total int unsigned,
	#已使用磁盘空间（单位M）（取值来自log总表的content.disk_used字段）
	disk_used int unsigned,
	#剩余磁盘空间（单位M）（取值来自log总表的content.disk_free字段）
	disk_free int unsigned,
	#io繁忙度(IO等待所占用的CPU时间的百分比,高过30%时IO压力高)（取值来自log总表的content.io字段）
	io tinyint unsigned,
	#记录时间点（取值来自log总表的utc字段）
	utc bigint,
	#主键
	primary key ( id )
)ENGINE=InnoDB default charset=utf8;

#message表（给终端的离线消息或留言）
drop table if exists message_push;
drop table if exists message;
create table `message`
(
	#自增主键
	id int unsigned auto_increment,
	#标题
	title varchar(255) not null default "",
	#内容
	content text not null,
	#主键
	primary key (id)
)ENGINE=InnoDB default charset=utf8;

#message发送管理表
create table `message_push`
(
	#自增主键
	id int unsigned auto_increment,
	#message id
	message_id int unsigned not null,  
	#user id， id为*表示所有终端
	user_id char(128) not null,
	#留言发送状态(0-未发送，1-已发送）
	status tinyint not null default 0,
	#成功发送时间utc（指的是终端取走此email的时刻）
	utc bigint not null default 0,
	#主键
	primary key (id),
	#索引
	key (`message_id`),
	key (`user_id`),
	#外键约束-级联删除
	foreign key (`message_id`) references `message` (`id`) on delete cascade on update cascade,
	foreign key (`user_id`) references `user` (`id`) on delete cascade on update cascade
)ENGINE=InnoDB default charset=utf8;

#摄像头日志表（对应总表的type=1，subtype=）
drop table if exists camera_log;
create table `camera_log`
(
	#自增索引
	id bigint unsigned auto_increment,
	#camera ID（取值来自log总表的content.camera_id字段）
	camera_id char(64)	not null,
	#所属用户（取值来自log总表的content.user_id字段）
	user_id char(128) not null default "",
	#摄像头IP地址（取值来自log总表的source字段）
	ip char(20)	not null default "",
	#日志类型 1-normal正常运行日志，2-exception异常日志, 3-error出错日志，4-action行为日志（取值来自log总表的subtype字段)
	type tinyint,
	#日志简述, 如行为日志简述可以是login/logout/reboot等，异常日志简述可以是play/upgrade/file/socket等等（取值来自log总表的extend字段）
	brief varchar(128),
	#日志详细描述，对日志的详细描述，比如出错日志这里可以带上出错打印（取值来自log总表的content.description字段）
	detail text,
	#记录时间点（取值来自log总表的utc字段）
	utc bigint,
	#主键
	primary key ( id )	
)ENGINE=InnoDB default charset=utf8;


#在线数量统计表
drop table if exists online_statistic;
create table `online_statistic`
(
	#自增索引
	id bigint unsigned auto_increment,
	#在线用户数
	online_number int not null default 0,
	#离线用户数
	offline_number int not null default 0,
	#用户总数
	total_number int not null default 0,
	#统计类型 0 ：终端用户 1：摄像头
	type tinyint not null default 0,
	#记录时间点（取值来自log总表的utc字段）
	utc bigint,
	#主键
	primary key ( id )	
)ENGINE=InnoDB default charset=utf8;


#后台操作日志
drop table if exists operate_log;
create table `operate_log`
(
	#自增索引
	id bigint unsigned auto_increment,
	#操作员id
	operator_id varchar(128) not null default "",
	#IP
	ip varchar(32),
	#类名
	class_info varchar(64) not null default "",
	#方法名
	mothod varchar(64) not null default "",
	#日志级别 ERROR INFO DEBUG 等
	log_level varchar(32) not null,
	#描述
	description text,
	#操作时间utc
	utc bigint,
	#主键
	primary key ( id ) 
)ENGINE=InnoDB default charset=utf8;

#image图片表单独建表管理
drop table if exists image;
create table `image`
(
	#图片ID(首字母+md5, 首字母有意义，J-表示JPEG图片， P-PNG图片， B-BMP图片)
	id char(36)	not null,
	#图片数据
	image mediumblob not null,
	#主键
	primary key (id)
)ENGINE=InnoDB default charset=utf8;

#产品包表
drop table if exists service_child;
drop table if exists service;
create table `service`
(
	#主键
	id char(36) not null,
	#包名
	name varchar(255) not null, 
	#购买价格
	price double not null default 0,
	#折扣之后价格
	discount_price double not null default 0,
	#产品包类型，1：一次性购买包 2：自动续订包天包 3：自动续订包月包 4：自动续订包年包
	type tinyint(11) not null default '1',
	#录制时长(单位S)
	record_time bigint not null default 0,
	#抓拍张数
	capture_num int not null default 0,
	#发布状态 0-未发布 1-已发布未审核 2-已发布 (预留字段) 3-下架（下架后不能再操作）
	status char not null,
	#创建日期（utc时间）
	create_utc bigint default 0,
	#发布日期（utc时间）（预留字段）
	pub_utc bigint default 0,
	#海报图，系统内部上传维护的海报url形如：mop://id， 否则为其他外部图片 (预留字段)
	image_url varchar(255),
	#缩略图 (预留字段)
	thumbnail_url varchar(255),
	#描述
	description text,
	#是否默认 0-不是默认包 1-是默认包 
	preferred char not null default 0, 
	#2016-12-19 购买时长
	buy_times int not null default 1,
	#主键
	primary key (id)
)ENGINE=InnoDB default charset=utf8;

#service_child 业务包隶属关系表
create table `service_child`
(
	#自增主键
	id int unsigned auto_increment,
	#业务包ID
	service_id char(36) not null,
	#子包ID(数据结构上虽然支持包里含包，但业务逻辑上不支持包里含包，在往包里放包时把子包剥开放入（注意去重）)
	child_service_id char(36) not null,
	#主键
	primary key (id),
	#索引
	key (`service_id`),
	key (`child_service_id`),
	#外键约束-级联删除
	foreign key (`service_id`) references `service` (`id`) on delete cascade on update cascade,
	foreign key (`child_service_id`) references `service` (`id`) on delete cascade on update cascade  
)ENGINE=InnoDB default charset=utf8;

#产品包分组成员表
create table `service_group_child`
(
	#自增主键
	id int unsigned auto_increment,
	#组id，外键，连接到user_group
	group_id varchar(255) not null references user_group(id),
	#成员id，外键，连接到service表（注意去重）
	service_id char(36) not null,
	#主键
	primary key (id),
 	#索引
	key (`service_id`),
	key (`group_id`),
	#外键约束-级联删除
	foreign key (`service_id`) references `service` (`id`) on delete cascade on update cascade,
	foreign key (`group_id`) references `user_group` (`id`) on delete cascade on update cascade
)ENGINE=InnoDB default charset=utf8;

drop table if exists storage_file;
create table `storage_file`
(
	#自增索引
	id bigint unsigned auto_increment,
	#存储设备标识
	device_id varchar(255),
	#文件名称
	file_name varchar(255),
	#文件路径
	file_path varchar(255),
	#文件大小(单位KB)
	file_size bigint,
	#文件来源类型，参照terminal_type表
	device_type int,
	#所属用户ID
	user_id varchar(255) not null default "",
	#录制开始时间
	start_time bigint,
	#录制结束时间
	end_time bigint,
	#主键
	primary key ( id ),
	#文件名称索引
	KEY `file_name_index` (`file_name`),
	#存储设备标识索引
	KEY `device_id_index` (`device_id`),
	#文件来源索引
	KEY `device_type_index` (`device_type`),
	#开始时间索引
  	KEY `start_time_index` (`start_time`),
  	#结束时间索引
  	KEY `end_time_index` (`end_time`)
)ENGINE=InnoDB default charset=utf8;

#充值卡表
drop table if exists prepay_card;
create table `prepay_card`
(
	#主键
	id char(36) not null,
	#密码
	password varchar(36), 
	#过期日期（utc时间）
	end_utc bigint default 0,
	#金额
	amount int not null,
	#标记： 0-未使用 1-已使用
	flag tinyint not null,
	#主键
	primary key (id)
)ENGINE=InnoDB default charset=utf8;

#财付通支付记录表
drop table if exists `tenpay_record`;
create table `tenpay_record`
(
	#订单号(生成规则：utc_Hash(user_id)_Hash(service_id)
	sp_billno char(64) not null,
	#财付通生成的token
	token varchar(128) not null,
	#用户id
	user_id varchar(128) not null,
	#动作action 1-充值， 2-购买 见billing_operation表
	action tinyint not null,
	#购买的service_id, 如果是充值则service_id为空
	service_id char(36) not null default "",
	#财付通支付别名（对于使用财付通快捷支付用户来说一般就是QQ号）
	purchase_alias varchar(64) not null default "",
	#支付结果(0-支付成功，1-支付失败）
	pay_result char not null default 1,
	#支付信息(一般用户支付失败的说明，如果支付成功则为空）
	pay_info varchar(128) not null default "",
	#财付通流水订单号
	transaction_id char(32) not null default "",
	#支付金额（单位分）
	total_fee int,
	#币种（1-人民币）
	fee_type int not null default 1,
	#付款银行编号（0-财付通）
	bank_type char(16) not null default "0",
	#银行订单号
	bank_billno char(32) not null default "",
	#订单生成时间utc
	start_utc bigint,
	#订单支付完成时间utc
	end_utc bigint,
	#商家附加信息
	attach varchar(255) not null default "",
	#是否接收到财付通回调通知（0-未接收到，1-接收到）
	receive_notify char not null default 0,
	#是否有效订单(0-无效, 1-有效)
	valid char not null default 1,
	#支付渠道（0-wap手机支付， 1-PC支付）
	type char not null,
	#交易描述（一般用于财付通支付页面显示的商品名称）
	description varchar(255) not null default "",
	#主键
	primary key ( sp_billno )
)ENGINE=InnoDB default charset=utf8;

#用户反馈信息表
drop table if exists feedback;
create table `feedback`
(
	#自增索引
	id bigint unsigned auto_increment,
	#所属用户
	user_id char(128) not null,
	#用户反馈的具体内容
	content text not null,
	#记录时间点（用户填写反馈信息的时间UTC值）
	submit_utc bigint not null default 0,
	#主键
	primary key ( id )
	
)ENGINE=InnoDB default charset=utf8;

delimiter //
