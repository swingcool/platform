delimiter ;

set names utf8;

###########  创建数据库 ##############
drop database if exists mybatis;
create database mybatis character set utf8;

############### 建表 ################
use mybatis;

drop table if exists operator;
create table operator (
	id int,
	username varchar(32) not null,
	password varchar(128) not null,
	administrator boolean,
	primary key (id)
)ENGINE=InnoDB default charset=utf8;