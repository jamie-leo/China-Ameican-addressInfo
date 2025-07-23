SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL COMMENT '父级ID, 指向本表的id, NULL表示顶级',
  `country_code` varchar(3) DEFAULT NULL COMMENT '国家代码 (ISO 3166-1), 如 CN, US',
  `level_type` varchar(32) DEFAULT NULL COMMENT '层级类型 (如 province, state, city, county)',
  `admin_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '行政区划代码 (主要用于中国)',
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `name_en` varchar(128) DEFAULT NULL COMMENT '英文名称',
  `postal_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '邮政编码 (如美国的ZIP Code)',
  `coordinate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '城市坐标废弃',
  `parent_admin_code` varchar(255) DEFAULT NULL,
  `longitude` decimal(15,6) DEFAULT NULL,
  `latitude` decimal(15,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_admin_code` (`admin_code`),
  KEY `idx_parent_admin_code` (`parent_admin_code`),
  KEY `idx_level_country` (`level_type`,`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=85712 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='地址信息表';

SET FOREIGN_KEY_CHECKS = 1;
