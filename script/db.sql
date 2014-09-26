CREATE TABLE cluster_t
(
	id BIGINT NOT NULL COMMENT 'Id',
	domain_id BIGINT COMMENT 'FK 域Id',
	name VARCHAR(255) NOT NULL COMMENT '名称',
	api_address VARCHAR(255) NOT NULL COMMENT '提供Deployer调用的接口地址',
	update_time BIGINT NOT NULL COMMENT '更新时间',
	update_flag INTEGER NOT NULL COMMENT '更新标识  0：初始  1：更新',
	description VARCHAR(2048) COMMENT '描述',
	PRIMARY KEY (id)

)  COMMENT='集群'
;

CREATE TABLE user_t
(
	id BIGINT NOT NULL AUTO_INCREMENT COMMENT '自增Id',
	role_id BIGINT NOT NULL COMMENT 'FK 角色Id',
	name VARCHAR(255) NOT NULL COMMENT '名称',
	password VARCHAR(255) NOT NULL COMMENT '密码',
	PRIMARY KEY (id)

)  COMMENT='用户'
;

