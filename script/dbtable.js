var tbcollection = [
{"tbname":"cluster_t", "fields":[
{"name":"id","type":"BIGINT","allow_null":"NO","comment":"Id"}
,{"name":"domain_id","type":"BIGINT","allow_null":"","comment":"FK 域Id"}
,{"name":"name","type":"VARCHAR(255)","allow_null":"NO","comment":"名称"}
,{"name":"api_address","type":"VARCHAR(255)","allow_null":"NO","comment":"提供Deployer调用的接口地址"}
,{"name":"update_time","type":"BIGINT","allow_null":"NO","comment":"更新时间"}
,{"name":"update_flag","type":"INTEGER","allow_null":"NO","comment":"更新标识  0：初始  1：更新"}
,{"name":"description","type":"VARCHAR(2048)","allow_null":"","comment":"描述"}
],
"key":"id"
}

,{"tbname":"user_t", "fields":[
{"name":"id","type":"BIGINT","allow_null":"NO","comment":"自增Id"}
,{"name":"role_id","type":"BIGINT","allow_null":"NO","comment":"FK 角色Id"}
,{"name":"name","type":"VARCHAR(255)","allow_null":"NO","comment":"名称"}
,{"name":"password","type":"VARCHAR(255)","allow_null":"NO","comment":"密码"}
],
"key":"id"
}
];