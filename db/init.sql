CREATE TABLE "sku" (
  "id" int(19) NOT NULL AUTO_INCREMENT,
  "version" int(10) NOT NULL COMMENT '版本',
  "create_time" datetime NOT NULL COMMENT '创建时间',
  "last_update_time" datetime NOT NULL COMMENT '更新时间',
  "name" varchar(255) NOT NULL COMMENT '商品名称',
  "category_id" int(11) NOT NULL COMMENT '类目id',
  "shop_name" varchar(255) DEFAULT NULL COMMENT '店铺名称',
  "brand" varchar(255) DEFAULT NULL COMMENT '品牌名称',
  "url" varchar(255) DEFAULT NULL COMMENT '淘宝链接',
  "status" tinyint(2) NOT NULL COMMENT '状态（0：使用；1：失效）',
  "buy_time" datetime DEFAULT NULL COMMENT '购买时间',
  "product_time" datetime DEFAULT NULL COMMENT '生产日期',
  "expired_time" datetime DEFAULT NULL COMMENT '过期日期',
  "change_time" datetime DEFAULT NULL COMMENT '更换日期',
  "pic_url" varchar(255) DEFAULT NULL COMMENT '图片地址',
  "delete_tag" tinyint(1) DEFAULT NULL COMMENT '删除标记',
  "price" decimal(19,6) DEFAULT NULL COMMENT '价格',
  "star" int(2) DEFAULT NULL COMMENT '星级',
  PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品';

CREATE TABLE "category" (
  "id" int(19) NOT NULL AUTO_INCREMENT,
  "version" int(10) NOT NULL COMMENT '版本',
  "create_time" datetime NOT NULL COMMENT '创建时间',
  "last_update_time" datetime NOT NULL COMMENT '更新时间',
  "name" varchar(255) NOT NULL COMMENT '类目名称',
  "father_id" int(11) DEFAULT NULL COMMENT '上级类目id',
  "level" tinyint(1) NOT NULL COMMENT '等级',
  PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类目';

CREATE TABLE "log" (
  "id" int(19) NOT NULL AUTO_INCREMENT,
  "create_time" datetime NOT NULL COMMENT '创建时间',
  "sku_id" int(11) NOT NULL COMMENT '商品id',
  "status_before" tinyint(2) NOT NULL COMMENT '操作类型（枚举待定）',
  "status_after" tinyint(2) NOT NULL,
  "remark" varchar(512) DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志';