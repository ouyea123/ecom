CREATE TABLE `li_file_directory`
(
    `id`             bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `create_time`    datetime                                                      NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL DEFAULT NULL COMMENT '创建者',
    `update_time`    datetime                                                      NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL DEFAULT NULL COMMENT '更新者',
    `delete_flag`    tinyint(1)                                                    NULL DEFAULT 0 COMMENT '删除标志 true/false 删除/未删除',
    `directory_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件目录类型',
    `directory_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '拥有者名称',
    `owner_id`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '拥有者id',
    `parent_id`      bigint                                                        NULL DEFAULT NULL COMMENT '父分类ID',
    `level`          int                                                           NULL DEFAULT NULL COMMENT '层级',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1698937596963311619
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件夹'
  ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;

ALTER TABLE li_file
    ADD file_directory_id varchar(255) COMMENT '文件夹ID';

/**
  订单包裹
 */
CREATE TABLE `li_order_package` (
                                    `id` bigint NOT NULL COMMENT 'ID',
                                    `create_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '创建者',
                                    `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
                                    `delete_flag` bit(1) DEFAULT NULL COMMENT '是否删除',
                                    `update_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '修改者',
                                    `update_time` datetime(6) DEFAULT NULL COMMENT '修改时间',
                                    `package_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '包裹单号',
                                    `order_sn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '订单编号',
                                    `logistics_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '发货单号',
                                    `logistics_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '物流公司CODE',
                                    `logistics_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '物流公司名称',
                                    `consignee_mobile` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '收件人手机',
                                    `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '状态',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC;

/**
  分包货物
 */
CREATE TABLE `li_order_package_item` (
                                         `id` bigint NOT NULL COMMENT 'ID',
                                         `create_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '创建者',
                                         `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
                                         `delete_flag` bit(1) DEFAULT NULL COMMENT '是否删除',
                                         `update_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '修改者',
                                         `update_time` datetime(6) DEFAULT NULL COMMENT '修改时间',
                                         `package_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '包裹单号',
                                         `order_sn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '订单编号',
                                         `order_item_sn` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL COMMENT '子订单编号',
                                         `deliver_number` int DEFAULT NULL COMMENT '发货数量',
                                         `logistics_time` datetime(6) DEFAULT NULL COMMENT '发货时间',
                                         `goods_name` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
                                         `thumbnail` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC;


ALTER TABLE li_order_item ADD  `deliver_number` int DEFAULT NULL COMMENT '发货数量';

ALTER TABLE li_goods_sku ADD  `alert_quantity` int DEFAULT NULL COMMENT '预警库存';

/**
  交易唤醒表，增加交易流水详情
 */
ALTER TABLE li_order_item ADD `is_refund` varchar(255) DEFAULT NULL COMMENT '是否退款';

/**
  交易表增加订单状态字段
 */
ALTER TABLE li_order_item ADD `refund_price` decimal(10,2) DEFAULT NULL COMMENT '退款金额';