/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : xy-mall

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 08/07/2020 18:16:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for advert_info
-- ----------------------------
DROP TABLE IF EXISTS `advert_info`;
CREATE TABLE `advert_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `advert_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告类型',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of advert_info
-- ----------------------------
INSERT INTO `advert_info` VALUES (1, '首页轮播图', 'http://192.168.43.96/group1/M00/00/01/wKgrYF60vf-AYBU8AAJQBtaEMDI652.png');
INSERT INTO `advert_info` VALUES (2, '首页轮播图', 'http://192.168.43.96/group1/M00/00/01/wKgrYF60vT2AQFFbAADzBqb-a7Y01.webp');
INSERT INTO `advert_info` VALUES (3, '首页轮播图', 'http://192.168.43.96/group1/M00/00/01/wKgrYF60vjuADm4qAAL5PYY8vEY625.jpg');
INSERT INTO `advert_info` VALUES (4, '首页轮播图', 'http://192.168.43.96/group1/M00/00/01/wKgrYF60xAmAHse4AANSPlza164992.jpg');

-- ----------------------------
-- Table structure for feedback_message
-- ----------------------------
DROP TABLE IF EXISTS `feedback_message`;
CREATE TABLE `feedback_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '反馈时间',
  `is_reply` int(1) NULL DEFAULT 0 COMMENT '是否回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '反馈信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback_message
-- ----------------------------
INSERT INTO `feedback_message` VALUES (1, 'fairy', '1303890280@qq.com', '完美', '2020-04-05 13:03:52', 1);
INSERT INTO `feedback_message` VALUES (2, '访客', '1335868480@qq.com', '非常棒', '2020-04-05 13:04:45', 0);

-- ----------------------------
-- Table structure for goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `goods_attribute`;
CREATE TABLE `goods_attribute`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'spu属性id',
  `attribute_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spu属性名称',
  `catalog3_id` bigint(20) NULL DEFAULT NULL COMMENT '三级分类id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'spu筛选属性' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_attribute
-- ----------------------------
INSERT INTO `goods_attribute` VALUES (1, '品牌', 38);
INSERT INTO `goods_attribute` VALUES (2, '价格', 38);
INSERT INTO `goods_attribute` VALUES (3, '屏幕尺寸', 38);
INSERT INTO `goods_attribute` VALUES (4, '运行内存', 38);
INSERT INTO `goods_attribute` VALUES (5, '机身内存', 38);
INSERT INTO `goods_attribute` VALUES (6, '热点', 38);
INSERT INTO `goods_attribute` VALUES (7, '操作系统', 38);
INSERT INTO `goods_attribute` VALUES (8, '电池容量', 38);
INSERT INTO `goods_attribute` VALUES (9, '充电功率', 38);
INSERT INTO `goods_attribute` VALUES (10, 'CPU型号', 38);
INSERT INTO `goods_attribute` VALUES (11, '后摄主摄像素', 38);
INSERT INTO `goods_attribute` VALUES (12, '前摄主摄像素', 38);
INSERT INTO `goods_attribute` VALUES (13, '拍照特点', 38);
INSERT INTO `goods_attribute` VALUES (14, '游戏性能', 38);
INSERT INTO `goods_attribute` VALUES (15, '分辨率', 38);
INSERT INTO `goods_attribute` VALUES (16, '屏幕比列', 38);
INSERT INTO `goods_attribute` VALUES (17, '屏占率', 38);
INSERT INTO `goods_attribute` VALUES (18, '特殊功能', 38);
INSERT INTO `goods_attribute` VALUES (19, '屏幕前摄组合', 38);
INSERT INTO `goods_attribute` VALUES (20, '大家说', 38);
INSERT INTO `goods_attribute` VALUES (21, '品牌', 63);
INSERT INTO `goods_attribute` VALUES (22, '价格', 63);
INSERT INTO `goods_attribute` VALUES (23, '显卡型号', 63);
INSERT INTO `goods_attribute` VALUES (24, '处理器', 63);
INSERT INTO `goods_attribute` VALUES (25, '屏幕尺寸', 63);
INSERT INTO `goods_attribute` VALUES (26, '内存容量', 63);
INSERT INTO `goods_attribute` VALUES (27, '硬盘容量', 63);
INSERT INTO `goods_attribute` VALUES (28, '刷新率', 63);
INSERT INTO `goods_attribute` VALUES (29, '显存容量', 63);
INSERT INTO `goods_attribute` VALUES (30, '色域', 63);
INSERT INTO `goods_attribute` VALUES (31, '游戏性能', 63);
INSERT INTO `goods_attribute` VALUES (32, '分辨率', 63);
INSERT INTO `goods_attribute` VALUES (33, '特性', 63);
INSERT INTO `goods_attribute` VALUES (34, '裸机重量', 63);
INSERT INTO `goods_attribute` VALUES (35, '系列', 63);
INSERT INTO `goods_attribute` VALUES (36, '厚度', 63);
INSERT INTO `goods_attribute` VALUES (37, '系统', 63);
INSERT INTO `goods_attribute` VALUES (38, '机身材质', 63);
INSERT INTO `goods_attribute` VALUES (39, '待机时长', 63);
INSERT INTO `goods_attribute` VALUES (40, '优选服务', 63);
INSERT INTO `goods_attribute` VALUES (41, '大家说', 63);
INSERT INTO `goods_attribute` VALUES (42, '品牌', 62);
INSERT INTO `goods_attribute` VALUES (43, '价格', 62);
INSERT INTO `goods_attribute` VALUES (44, '分类', 62);
INSERT INTO `goods_attribute` VALUES (45, '屏幕尺寸', 62);
INSERT INTO `goods_attribute` VALUES (46, '内存容量', 62);
INSERT INTO `goods_attribute` VALUES (47, '显卡类别', 62);
INSERT INTO `goods_attribute` VALUES (48, '硬盘容量', 62);

-- ----------------------------
-- Table structure for goods_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `goods_attribute_value`;
CREATE TABLE `goods_attribute_value`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'spu属性值id',
  `value_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spu属性值名称',
  `attribute_id` bigint(20) NULL DEFAULT NULL COMMENT 'spu属性id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 260 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'spu筛选属性值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_attribute_value
-- ----------------------------
INSERT INTO `goods_attribute_value` VALUES (1, '华为', 1);
INSERT INTO `goods_attribute_value` VALUES (2, 'oppo', 1);
INSERT INTO `goods_attribute_value` VALUES (3, 'vivo', 1);
INSERT INTO `goods_attribute_value` VALUES (4, '小米', 1);
INSERT INTO `goods_attribute_value` VALUES (5, 'ONEPLUS', 1);
INSERT INTO `goods_attribute_value` VALUES (6, 'HONOR', 1);
INSERT INTO `goods_attribute_value` VALUES (7, 'meizu', 1);
INSERT INTO `goods_attribute_value` VALUES (8, '0-499', 2);
INSERT INTO `goods_attribute_value` VALUES (9, '500-999', 2);
INSERT INTO `goods_attribute_value` VALUES (10, '1000-1699', 2);
INSERT INTO `goods_attribute_value` VALUES (11, '1700-2799', 2);
INSERT INTO `goods_attribute_value` VALUES (12, '2800-4499', 2);
INSERT INTO `goods_attribute_value` VALUES (13, '4500-11999', 2);
INSERT INTO `goods_attribute_value` VALUES (14, '12000以上', 2);
INSERT INTO `goods_attribute_value` VALUES (15, '6.95英寸以上', 3);
INSERT INTO `goods_attribute_value` VALUES (16, '6.85-6.94英寸', 3);
INSERT INTO `goods_attribute_value` VALUES (17, '6.75-6.84英寸', 3);
INSERT INTO `goods_attribute_value` VALUES (18, '6.65-6.74英寸', 3);
INSERT INTO `goods_attribute_value` VALUES (19, '6.55-6.64英寸', 3);
INSERT INTO `goods_attribute_value` VALUES (20, '6.45-6.54英寸', 3);
INSERT INTO `goods_attribute_value` VALUES (21, '6.35-6.44英寸', 3);
INSERT INTO `goods_attribute_value` VALUES (22, '6.25-6.34英寸', 3);
INSERT INTO `goods_attribute_value` VALUES (23, '6.0-6.24英寸', 3);
INSERT INTO `goods_attribute_value` VALUES (24, '6.0以下', 3);
INSERT INTO `goods_attribute_value` VALUES (25, '12GB', 4);
INSERT INTO `goods_attribute_value` VALUES (26, '10GB', 4);
INSERT INTO `goods_attribute_value` VALUES (27, '8GB', 4);
INSERT INTO `goods_attribute_value` VALUES (28, '6GB', 4);
INSERT INTO `goods_attribute_value` VALUES (29, '4GB', 4);
INSERT INTO `goods_attribute_value` VALUES (30, '3GB', 4);
INSERT INTO `goods_attribute_value` VALUES (31, '3GB以下', 4);
INSERT INTO `goods_attribute_value` VALUES (32, '1TB', 5);
INSERT INTO `goods_attribute_value` VALUES (33, '512GB', 5);
INSERT INTO `goods_attribute_value` VALUES (34, '256GB', 5);
INSERT INTO `goods_attribute_value` VALUES (35, '128GB', 5);
INSERT INTO `goods_attribute_value` VALUES (36, '64GB', 5);
INSERT INTO `goods_attribute_value` VALUES (37, '32GB', 5);
INSERT INTO `goods_attribute_value` VALUES (38, '16GB', 5);
INSERT INTO `goods_attribute_value` VALUES (39, '8GB以下', 5);
INSERT INTO `goods_attribute_value` VALUES (40, '5G', 6);
INSERT INTO `goods_attribute_value` VALUES (41, '高倍率变焦', 6);
INSERT INTO `goods_attribute_value` VALUES (42, '曲面屏', 6);
INSERT INTO `goods_attribute_value` VALUES (43, '快速充电', 6);
INSERT INTO `goods_attribute_value` VALUES (44, '防水防尘', 6);
INSERT INTO `goods_attribute_value` VALUES (45, '超高屏占率', 6);
INSERT INTO `goods_attribute_value` VALUES (46, '屏幕指纹', 6);
INSERT INTO `goods_attribute_value` VALUES (47, 'Android(安卓)', 7);
INSERT INTO `goods_attribute_value` VALUES (48, 'IOS(Apple)', 7);
INSERT INTO `goods_attribute_value` VALUES (49, 'windows(微软)', 7);
INSERT INTO `goods_attribute_value` VALUES (50, '5000mAh以上', 8);
INSERT INTO `goods_attribute_value` VALUES (51, '4500mAh-5000mAh', 8);
INSERT INTO `goods_attribute_value` VALUES (52, '4250mAh-4449mAh', 8);
INSERT INTO `goods_attribute_value` VALUES (53, '4000mAh-4249mAh', 8);
INSERT INTO `goods_attribute_value` VALUES (54, '3750mAh-3999mAh', 8);
INSERT INTO `goods_attribute_value` VALUES (55, '3500mAh-3749mAh', 8);
INSERT INTO `goods_attribute_value` VALUES (56, '3000mAh-3499mAh', 8);
INSERT INTO `goods_attribute_value` VALUES (57, '3000mAh以下', 8);
INSERT INTO `goods_attribute_value` VALUES (58, '100W以上', 9);
INSERT INTO `goods_attribute_value` VALUES (59, '50-100W', 9);
INSERT INTO `goods_attribute_value` VALUES (60, '40-49W', 9);
INSERT INTO `goods_attribute_value` VALUES (61, '30-39W', 9);
INSERT INTO `goods_attribute_value` VALUES (62, '27-29W', 9);
INSERT INTO `goods_attribute_value` VALUES (63, '29W以下', 9);
INSERT INTO `goods_attribute_value` VALUES (64, '晓龙855', 10);
INSERT INTO `goods_attribute_value` VALUES (65, '晓龙845', 10);
INSERT INTO `goods_attribute_value` VALUES (66, '晓龙835', 10);
INSERT INTO `goods_attribute_value` VALUES (67, '晓龙730', 10);
INSERT INTO `goods_attribute_value` VALUES (68, '晓龙712', 10);
INSERT INTO `goods_attribute_value` VALUES (69, '晓龙710', 10);
INSERT INTO `goods_attribute_value` VALUES (70, '麒麟990', 10);
INSERT INTO `goods_attribute_value` VALUES (71, '麒麟980', 10);
INSERT INTO `goods_attribute_value` VALUES (72, '麒麟970', 10);
INSERT INTO `goods_attribute_value` VALUES (73, '麒麟810', 10);
INSERT INTO `goods_attribute_value` VALUES (74, '6400万像素', 11);
INSERT INTO `goods_attribute_value` VALUES (75, '4800万像素', 11);
INSERT INTO `goods_attribute_value` VALUES (76, '4000万像素', 11);
INSERT INTO `goods_attribute_value` VALUES (77, '3200万像素', 11);
INSERT INTO `goods_attribute_value` VALUES (78, '2400万像素', 11);
INSERT INTO `goods_attribute_value` VALUES (79, '2400万像素以下', 11);
INSERT INTO `goods_attribute_value` VALUES (80, '4800万像素', 12);
INSERT INTO `goods_attribute_value` VALUES (81, '3200万像素', 12);
INSERT INTO `goods_attribute_value` VALUES (82, '2500万像素', 12);
INSERT INTO `goods_attribute_value` VALUES (83, '2400万像素', 12);
INSERT INTO `goods_attribute_value` VALUES (84, '2300万像素', 12);
INSERT INTO `goods_attribute_value` VALUES (85, '2100万像素', 12);
INSERT INTO `goods_attribute_value` VALUES (86, '2000万像素', 12);
INSERT INTO `goods_attribute_value` VALUES (87, '2000万像素以下', 12);
INSERT INTO `goods_attribute_value` VALUES (88, '后置四摄', 13);
INSERT INTO `goods_attribute_value` VALUES (89, '后置三摄', 13);
INSERT INTO `goods_attribute_value` VALUES (90, '红外', 13);
INSERT INTO `goods_attribute_value` VALUES (91, '微距', 13);
INSERT INTO `goods_attribute_value` VALUES (92, '后置多摄', 13);
INSERT INTO `goods_attribute_value` VALUES (93, '后置双摄', 13);
INSERT INTO `goods_attribute_value` VALUES (94, '前置双摄', 13);
INSERT INTO `goods_attribute_value` VALUES (95, '电竞级', 14);
INSERT INTO `goods_attribute_value` VALUES (96, '发烧级', 14);
INSERT INTO `goods_attribute_value` VALUES (97, 'QHD+及以上', 15);
INSERT INTO `goods_attribute_value` VALUES (98, '全高清FHD+', 15);
INSERT INTO `goods_attribute_value` VALUES (99, '高清HD+', 15);
INSERT INTO `goods_attribute_value` VALUES (100, '标清SD', 15);
INSERT INTO `goods_attribute_value` VALUES (101, '21:9', 16);
INSERT INTO `goods_attribute_value` VALUES (102, '20.5:9', 16);
INSERT INTO `goods_attribute_value` VALUES (103, '20:9', 16);
INSERT INTO `goods_attribute_value` VALUES (104, '19.5:9', 16);
INSERT INTO `goods_attribute_value` VALUES (105, '19:9', 16);
INSERT INTO `goods_attribute_value` VALUES (106, '18.5:9', 16);
INSERT INTO `goods_attribute_value` VALUES (107, '18:9', 16);
INSERT INTO `goods_attribute_value` VALUES (108, '16:9', 16);
INSERT INTO `goods_attribute_value` VALUES (109, '4:3', 16);
INSERT INTO `goods_attribute_value` VALUES (110, '<90%', 17);
INSERT INTO `goods_attribute_value` VALUES (111, '≥90%', 17);
INSERT INTO `goods_attribute_value` VALUES (112, '≥91%', 17);
INSERT INTO `goods_attribute_value` VALUES (113, '≥92%', 17);
INSERT INTO `goods_attribute_value` VALUES (114, '≥93%', 17);
INSERT INTO `goods_attribute_value` VALUES (115, '≥94%', 17);
INSERT INTO `goods_attribute_value` VALUES (116, '≥95%', 17);
INSERT INTO `goods_attribute_value` VALUES (117, '≥96%', 17);
INSERT INTO `goods_attribute_value` VALUES (118, '≥97%', 17);
INSERT INTO `goods_attribute_value` VALUES (119, '≥98%', 17);
INSERT INTO `goods_attribute_value` VALUES (120, '≥99%', 17);
INSERT INTO `goods_attribute_value` VALUES (121, '超大字体', 18);
INSERT INTO `goods_attribute_value` VALUES (122, '超大音量', 18);
INSERT INTO `goods_attribute_value` VALUES (123, '语音识别', 18);
INSERT INTO `goods_attribute_value` VALUES (124, '屏下摄像头', 19);
INSERT INTO `goods_attribute_value` VALUES (125, '弹出式摄像头', 19);
INSERT INTO `goods_attribute_value` VALUES (126, '水滴屏', 19);
INSERT INTO `goods_attribute_value` VALUES (127, '刘海屏', 19);
INSERT INTO `goods_attribute_value` VALUES (128, '屏幕大', 20);
INSERT INTO `goods_attribute_value` VALUES (129, '待机时间长', 20);
INSERT INTO `goods_attribute_value` VALUES (130, '照相不错', 20);
INSERT INTO `goods_attribute_value` VALUES (131, '外观漂亮', 20);
INSERT INTO `goods_attribute_value` VALUES (132, '指纹识别', 20);
INSERT INTO `goods_attribute_value` VALUES (133, '支持国产', 20);
INSERT INTO `goods_attribute_value` VALUES (134, 'Lenovo', 21);
INSERT INTO `goods_attribute_value` VALUES (135, '华硕', 21);
INSERT INTO `goods_attribute_value` VALUES (136, 'acer', 21);
INSERT INTO `goods_attribute_value` VALUES (137, '戴尔', 21);
INSERT INTO `goods_attribute_value` VALUES (138, '机械革命', 21);
INSERT INTO `goods_attribute_value` VALUES (139, '神舟', 21);
INSERT INTO `goods_attribute_value` VALUES (140, 'hp', 21);
INSERT INTO `goods_attribute_value` VALUES (141, 'ALIENWARE', 21);
INSERT INTO `goods_attribute_value` VALUES (142, '0-5499', 22);
INSERT INTO `goods_attribute_value` VALUES (143, '5500-5999', 22);
INSERT INTO `goods_attribute_value` VALUES (144, '6000-6999', 22);
INSERT INTO `goods_attribute_value` VALUES (145, '7000-7999', 22);
INSERT INTO `goods_attribute_value` VALUES (146, '8000-8999', 22);
INSERT INTO `goods_attribute_value` VALUES (147, '9000以上', 22);
INSERT INTO `goods_attribute_value` VALUES (148, 'RTX2080Max-Q', 23);
INSERT INTO `goods_attribute_value` VALUES (149, 'RTX2080', 23);
INSERT INTO `goods_attribute_value` VALUES (150, 'RTX2070', 23);
INSERT INTO `goods_attribute_value` VALUES (151, 'RTX2060', 23);
INSERT INTO `goods_attribute_value` VALUES (152, 'GTX1660Ti', 23);
INSERT INTO `goods_attribute_value` VALUES (153, 'GTX1650', 23);
INSERT INTO `goods_attribute_value` VALUES (154, 'GTX1080', 23);
INSERT INTO `goods_attribute_value` VALUES (155, 'Intel i9标准电压版', 24);
INSERT INTO `goods_attribute_value` VALUES (156, 'Intel i7标准电压版', 24);
INSERT INTO `goods_attribute_value` VALUES (157, 'Intel i5标准电压版', 24);
INSERT INTO `goods_attribute_value` VALUES (158, 'Intel i3标准电压版', 24);
INSERT INTO `goods_attribute_value` VALUES (159, 'AMD Ryzen', 24);
INSERT INTO `goods_attribute_value` VALUES (160, '13英寸以下', 25);
INSERT INTO `goods_attribute_value` VALUES (161, '13.3英寸', 25);
INSERT INTO `goods_attribute_value` VALUES (162, '14.0英寸', 25);
INSERT INTO `goods_attribute_value` VALUES (163, '15.4英寸', 25);
INSERT INTO `goods_attribute_value` VALUES (164, '15.6英寸', 25);
INSERT INTO `goods_attribute_value` VALUES (165, '16.1英寸', 25);
INSERT INTO `goods_attribute_value` VALUES (166, '16.6英寸', 25);
INSERT INTO `goods_attribute_value` VALUES (167, '17.3英寸', 25);
INSERT INTO `goods_attribute_value` VALUES (168, '18.4英寸', 25);
INSERT INTO `goods_attribute_value` VALUES (169, '32GB', 26);
INSERT INTO `goods_attribute_value` VALUES (170, '16GB', 26);
INSERT INTO `goods_attribute_value` VALUES (171, '8GB', 26);
INSERT INTO `goods_attribute_value` VALUES (172, '4GB', 26);
INSERT INTO `goods_attribute_value` VALUES (173, '500GB HDD', 27);
INSERT INTO `goods_attribute_value` VALUES (174, '1TB HDD', 27);
INSERT INTO `goods_attribute_value` VALUES (175, '240GB SSD', 27);
INSERT INTO `goods_attribute_value` VALUES (176, '240GB SSD+1TB HDD', 27);
INSERT INTO `goods_attribute_value` VALUES (177, '256GB SSD', 27);
INSERT INTO `goods_attribute_value` VALUES (178, '512GB SSD', 27);
INSERT INTO `goods_attribute_value` VALUES (179, '128GB SSD+500GB HDD', 27);
INSERT INTO `goods_attribute_value` VALUES (180, '240HZ', 28);
INSERT INTO `goods_attribute_value` VALUES (181, '60HZ', 28);
INSERT INTO `goods_attribute_value` VALUES (182, '120HZ', 28);
INSERT INTO `goods_attribute_value` VALUES (183, '144HZ', 28);
INSERT INTO `goods_attribute_value` VALUES (184, '16GB', 29);
INSERT INTO `goods_attribute_value` VALUES (185, '8GB', 29);
INSERT INTO `goods_attribute_value` VALUES (186, '6GB', 29);
INSERT INTO `goods_attribute_value` VALUES (187, '4GB', 29);
INSERT INTO `goods_attribute_value` VALUES (188, '3GB', 29);
INSERT INTO `goods_attribute_value` VALUES (189, '2GB', 29);
INSERT INTO `goods_attribute_value` VALUES (190, '94%NTSC', 30);
INSERT INTO `goods_attribute_value` VALUES (191, '72%NTSC', 30);
INSERT INTO `goods_attribute_value` VALUES (192, '45%NTSC', 30);
INSERT INTO `goods_attribute_value` VALUES (193, '100%RGB', 30);
INSERT INTO `goods_attribute_value` VALUES (194, '吃鸡性能', 31);
INSERT INTO `goods_attribute_value` VALUES (195, '入门级', 31);
INSERT INTO `goods_attribute_value` VALUES (196, '发烧级', 31);
INSERT INTO `goods_attribute_value` VALUES (197, '骨灰级', 31);
INSERT INTO `goods_attribute_value` VALUES (198, '超高清屏(2K/3K/4K)', 32);
INSERT INTO `goods_attribute_value` VALUES (199, '全高清屏(1920x1080)', 32);
INSERT INTO `goods_attribute_value` VALUES (200, '高分屏(1600x900)', 32);
INSERT INTO `goods_attribute_value` VALUES (201, '标准屏(1366x768)', 32);
INSERT INTO `goods_attribute_value` VALUES (202, '全面屏', 33);
INSERT INTO `goods_attribute_value` VALUES (203, '机械键盘', 33);
INSERT INTO `goods_attribute_value` VALUES (204, '背光键盘', 33);
INSERT INTO `goods_attribute_value` VALUES (205, 'PCIE高速固态硬盘', 33);
INSERT INTO `goods_attribute_value` VALUES (206, '3D实感摄像头', 33);
INSERT INTO `goods_attribute_value` VALUES (207, '1kg以下', 34);
INSERT INTO `goods_attribute_value` VALUES (208, '1-1.5kg', 34);
INSERT INTO `goods_attribute_value` VALUES (209, '1.5-2kg', 34);
INSERT INTO `goods_attribute_value` VALUES (210, '2-2.5kg', 34);
INSERT INTO `goods_attribute_value` VALUES (211, '2.5kg', 34);
INSERT INTO `goods_attribute_value` VALUES (212, '华硕-飞行堡垒FX63', 35);
INSERT INTO `goods_attribute_value` VALUES (213, '联想-拯救者', 35);
INSERT INTO `goods_attribute_value` VALUES (214, '神舟-战神Z7', 35);
INSERT INTO `goods_attribute_value` VALUES (215, '神舟-战神Z7M', 35);
INSERT INTO `goods_attribute_value` VALUES (216, '惠普-暗影精灵', 35);
INSERT INTO `goods_attribute_value` VALUES (217, '惠普-光影精灵', 35);
INSERT INTO `goods_attribute_value` VALUES (218, '20.0mm以下', 36);
INSERT INTO `goods_attribute_value` VALUES (219, '20.0mm-25.0mm', 36);
INSERT INTO `goods_attribute_value` VALUES (220, '25.0mm以上', 36);
INSERT INTO `goods_attribute_value` VALUES (221, 'Windows10', 37);
INSERT INTO `goods_attribute_value` VALUES (222, 'Windows8', 37);
INSERT INTO `goods_attribute_value` VALUES (223, 'Windows7', 37);
INSERT INTO `goods_attribute_value` VALUES (224, 'DOS/Linux', 37);
INSERT INTO `goods_attribute_value` VALUES (225, '金属材质', 38);
INSERT INTO `goods_attribute_value` VALUES (226, '金属+复合材质', 38);
INSERT INTO `goods_attribute_value` VALUES (227, '复合材质', 38);
INSERT INTO `goods_attribute_value` VALUES (228, '皮革材质', 38);
INSERT INTO `goods_attribute_value` VALUES (229, '含碳纤维', 38);
INSERT INTO `goods_attribute_value` VALUES (230, '小于5小时', 39);
INSERT INTO `goods_attribute_value` VALUES (231, '5-7小时', 39);
INSERT INTO `goods_attribute_value` VALUES (232, '7-9小时', 39);
INSERT INTO `goods_attribute_value` VALUES (233, '9小时以上', 39);
INSERT INTO `goods_attribute_value` VALUES (234, '上门服务', 40);
INSERT INTO `goods_attribute_value` VALUES (235, '一年保质', 40);
INSERT INTO `goods_attribute_value` VALUES (236, '两年保质', 40);
INSERT INTO `goods_attribute_value` VALUES (237, '三年保质', 40);
INSERT INTO `goods_attribute_value` VALUES (238, '7*24H咨询', 40);
INSERT INTO `goods_attribute_value` VALUES (239, '配置不错', 41);
INSERT INTO `goods_attribute_value` VALUES (240, '运行流畅', 41);
INSERT INTO `goods_attribute_value` VALUES (241, '外观漂亮', 41);
INSERT INTO `goods_attribute_value` VALUES (242, '速度快', 41);
INSERT INTO `goods_attribute_value` VALUES (243, '散热好', 41);
INSERT INTO `goods_attribute_value` VALUES (244, 'Lenovo', 42);
INSERT INTO `goods_attribute_value` VALUES (245, '华硕', 42);
INSERT INTO `goods_attribute_value` VALUES (246, 'HP', 42);
INSERT INTO `goods_attribute_value` VALUES (247, '戴尔', 42);
INSERT INTO `goods_attribute_value` VALUES (249, '16GB', 46);
INSERT INTO `goods_attribute_value` VALUES (250, '8GB', 46);
INSERT INTO `goods_attribute_value` VALUES (251, '4GB', 46);
INSERT INTO `goods_attribute_value` VALUES (252, '集成显卡', 47);
INSERT INTO `goods_attribute_value` VALUES (253, '入门级游戏独立显卡', 47);
INSERT INTO `goods_attribute_value` VALUES (254, '高性能游戏独立显卡', 47);
INSERT INTO `goods_attribute_value` VALUES (255, '500GB HDD', 48);
INSERT INTO `goods_attribute_value` VALUES (256, '128 SSD+500GB HDD', 48);
INSERT INTO `goods_attribute_value` VALUES (257, '1TB HDD', 48);
INSERT INTO `goods_attribute_value` VALUES (258, '128 SSD', NULL);
INSERT INTO `goods_attribute_value` VALUES (259, '机械革命-深海幽灵系列', 35);

-- ----------------------------
-- Table structure for goods_brand
-- ----------------------------
DROP TABLE IF EXISTS `goods_brand`;
CREATE TABLE `goods_brand`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '品牌' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_cart_info
-- ----------------------------
DROP TABLE IF EXISTS `goods_cart_info`;
CREATE TABLE `goods_cart_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `spu_id` bigint(20) NULL DEFAULT NULL COMMENT 'spu id',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT 'sku id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `quantity` bigint(20) NULL DEFAULT NULL COMMENT '数量',
  `price` decimal(10, 0) NULL DEFAULT 0 COMMENT '价格',
  `weight` double NULL DEFAULT NULL COMMENT '重量',
  `sale_attribute1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性1',
  `sale_attribute2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性2',
  `sale_attribute3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性3',
  `sku_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认图片地址',
  `spu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spu名称',
  `sku_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku名称',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `create_datetime` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `modify_datetime` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  `catalog3_id` bigint(20) NULL DEFAULT NULL COMMENT '产品分类',
  `shop_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名',
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `is_checked` bigint(2) NULL DEFAULT 1 COMMENT '1选中0未选中',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_cart_info
-- ----------------------------
INSERT INTO `goods_cart_info` VALUES (3, 5, 18, 3, 1, 9999, 2, '512GB SSD', '电竞屏', NULL, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmAIcU4AAKWQqIomaM067.jpg', '联想(Lenovo)拯救者Y7000P', '联想(Lenovo)拯救者Y7000P 2019英特尔酷睿i7 15.6英寸游戏笔记本电脑(i7-9750H 16G 1TSSD RTX2060 144Hz)', '6087596391', '2019-10-12 07:45:50', '2019-10-12 07:45:50', 63, '联想旗舰店', '', 0);
INSERT INTO `goods_cart_info` VALUES (11, 6, 20, 3, 1, 8888, 2, '1TB SSD', '纯固态', NULL, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2YCCaAHxOBAAKIuyJHR_k326.jpg', '机械革命(MECHREVO)Z2 Air', '机械革命(MECHREVO)Z2-R 15.6英寸窄边框游戏笔记本电脑(i7-9750H 16G 512G PCIE+1T RTX2060 144Hz）', '6087596391', '2020-05-10 04:25:05', '2020-05-10 04:25:05', 63, '机械革命旗舰店', '', 1);

-- ----------------------------
-- Table structure for goods_catalog1
-- ----------------------------
DROP TABLE IF EXISTS `goods_catalog1`;
CREATE TABLE `goods_catalog1`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '一级分类名称',
  PRIMARY KEY (`id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '一级分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_catalog1
-- ----------------------------
INSERT INTO `goods_catalog1` VALUES (1, '家用电器');
INSERT INTO `goods_catalog1` VALUES (2, '手机/运营商/数码');
INSERT INTO `goods_catalog1` VALUES (3, '电脑/办公');
INSERT INTO `goods_catalog1` VALUES (4, '家居/家具/家装/厨具');
INSERT INTO `goods_catalog1` VALUES (5, '男装/女装/童装/内衣');
INSERT INTO `goods_catalog1` VALUES (6, '美妆/个护清洁/宠物');
INSERT INTO `goods_catalog1` VALUES (7, '女鞋/箱包/钟表/珠宝');
INSERT INTO `goods_catalog1` VALUES (8, '男鞋/运动/户外');
INSERT INTO `goods_catalog1` VALUES (9, '房产/汽车/汽车用品');
INSERT INTO `goods_catalog1` VALUES (10, '母婴/玩具乐器');
INSERT INTO `goods_catalog1` VALUES (11, '食品/酒类/生鲜/特产');
INSERT INTO `goods_catalog1` VALUES (12, '艺术/礼品鲜花/农资绿植');
INSERT INTO `goods_catalog1` VALUES (13, '医药保健/计生情趣');
INSERT INTO `goods_catalog1` VALUES (14, '图书/文娱/电子书');
INSERT INTO `goods_catalog1` VALUES (15, '机票/酒店/旅游/生活');
INSERT INTO `goods_catalog1` VALUES (16, '理财/众筹/白条/保险');
INSERT INTO `goods_catalog1` VALUES (17, '安装/维修/清洁/二手');
INSERT INTO `goods_catalog1` VALUES (18, '工业品');

-- ----------------------------
-- Table structure for goods_catalog2
-- ----------------------------
DROP TABLE IF EXISTS `goods_catalog2`;
CREATE TABLE `goods_catalog2`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二级分类名称',
  `catalog1_id` bigint(20) NULL DEFAULT NULL COMMENT '一级分类id',
  PRIMARY KEY (`id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '二级分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_catalog2
-- ----------------------------
INSERT INTO `goods_catalog2` VALUES (1, '电视', 1);
INSERT INTO `goods_catalog2` VALUES (2, '空调', 1);
INSERT INTO `goods_catalog2` VALUES (3, '洗衣机', 1);
INSERT INTO `goods_catalog2` VALUES (4, '冰箱', 1);
INSERT INTO `goods_catalog2` VALUES (5, '厨卫大电', 1);
INSERT INTO `goods_catalog2` VALUES (6, '厨房小电', 1);
INSERT INTO `goods_catalog2` VALUES (7, '生活电器', 1);
INSERT INTO `goods_catalog2` VALUES (8, '个护健康', 1);
INSERT INTO `goods_catalog2` VALUES (9, '试听影音', 1);
INSERT INTO `goods_catalog2` VALUES (10, '手机通讯', 2);
INSERT INTO `goods_catalog2` VALUES (11, '运营商', 2);
INSERT INTO `goods_catalog2` VALUES (12, '手机配件', 2);
INSERT INTO `goods_catalog2` VALUES (13, '摄影摄像', 2);
INSERT INTO `goods_catalog2` VALUES (14, '数码配件', 2);
INSERT INTO `goods_catalog2` VALUES (15, '影音娱乐', 2);
INSERT INTO `goods_catalog2` VALUES (16, '智能设备', 2);
INSERT INTO `goods_catalog2` VALUES (17, '电子教育', 2);
INSERT INTO `goods_catalog2` VALUES (18, '电脑整机', 3);
INSERT INTO `goods_catalog2` VALUES (19, '电脑配件', 3);
INSERT INTO `goods_catalog2` VALUES (20, '外设产品', 3);
INSERT INTO `goods_catalog2` VALUES (21, '游戏设备', 3);
INSERT INTO `goods_catalog2` VALUES (22, '网络产品', 3);
INSERT INTO `goods_catalog2` VALUES (23, '办公设备', 3);
INSERT INTO `goods_catalog2` VALUES (24, '文具', 3);
INSERT INTO `goods_catalog2` VALUES (25, '耗材', 3);
INSERT INTO `goods_catalog2` VALUES (26, '服务产品', 3);

-- ----------------------------
-- Table structure for goods_catalog3
-- ----------------------------
DROP TABLE IF EXISTS `goods_catalog3`;
CREATE TABLE `goods_catalog3`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '三级分类名称',
  `catalog2_id` bigint(20) NULL DEFAULT NULL COMMENT '二级分类id',
  PRIMARY KEY (`id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '三级分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_catalog3
-- ----------------------------
INSERT INTO `goods_catalog3` VALUES (1, '超薄电视', 1);
INSERT INTO `goods_catalog3` VALUES (2, '全面屏电视', 1);
INSERT INTO `goods_catalog3` VALUES (3, '智能电视', 1);
INSERT INTO `goods_catalog3` VALUES (4, 'OLED电视', 1);
INSERT INTO `goods_catalog3` VALUES (5, '曲面电视', 1);
INSERT INTO `goods_catalog3` VALUES (6, '4K超清电视', 1);
INSERT INTO `goods_catalog3` VALUES (7, '电视配件', 1);
INSERT INTO `goods_catalog3` VALUES (8, '空调挂机', 2);
INSERT INTO `goods_catalog3` VALUES (9, '空调机柜', 2);
INSERT INTO `goods_catalog3` VALUES (10, '中央空调', 2);
INSERT INTO `goods_catalog3` VALUES (11, '移动空调', 2);
INSERT INTO `goods_catalog3` VALUES (12, '省电空调', 2);
INSERT INTO `goods_catalog3` VALUES (13, '变频空调', 2);
INSERT INTO `goods_catalog3` VALUES (14, '以旧换新', 2);
INSERT INTO `goods_catalog3` VALUES (15, '滚筒洗衣机', 3);
INSERT INTO `goods_catalog3` VALUES (16, '洗烘一体机', 3);
INSERT INTO `goods_catalog3` VALUES (17, '波轮洗衣机', 3);
INSERT INTO `goods_catalog3` VALUES (18, '迷你洗衣机', 3);
INSERT INTO `goods_catalog3` VALUES (19, '烘干洗衣机', 3);
INSERT INTO `goods_catalog3` VALUES (20, '洗衣机配件', 3);
INSERT INTO `goods_catalog3` VALUES (21, '多门', 4);
INSERT INTO `goods_catalog3` VALUES (22, '双开门', 4);
INSERT INTO `goods_catalog3` VALUES (23, '双门', 4);
INSERT INTO `goods_catalog3` VALUES (24, '冷柜/冰吧', 4);
INSERT INTO `goods_catalog3` VALUES (25, '酒柜', 4);
INSERT INTO `goods_catalog3` VALUES (26, '冰箱配件', 4);
INSERT INTO `goods_catalog3` VALUES (27, '油烟机', 5);
INSERT INTO `goods_catalog3` VALUES (28, '燃气灶', 5);
INSERT INTO `goods_catalog3` VALUES (30, '洗碗柜', 5);
INSERT INTO `goods_catalog3` VALUES (31, '电热水器', 5);
INSERT INTO `goods_catalog3` VALUES (32, '太阳能热水器', 5);
INSERT INTO `goods_catalog3` VALUES (33, '电烤箱', 6);
INSERT INTO `goods_catalog3` VALUES (34, '电压力锅', 6);
INSERT INTO `goods_catalog3` VALUES (35, '豆浆机', 6);
INSERT INTO `goods_catalog3` VALUES (36, '咖啡机', 6);
INSERT INTO `goods_catalog3` VALUES (37, '电饭煲', 6);
INSERT INTO `goods_catalog3` VALUES (38, '手机', 10);
INSERT INTO `goods_catalog3` VALUES (39, '游戏手机', 10);
INSERT INTO `goods_catalog3` VALUES (40, '老人机', 10);
INSERT INTO `goods_catalog3` VALUES (41, '对讲机', 10);
INSERT INTO `goods_catalog3` VALUES (42, '以旧换新', 10);
INSERT INTO `goods_catalog3` VALUES (43, '手机维修', 10);
INSERT INTO `goods_catalog3` VALUES (44, '选号码', 11);
INSERT INTO `goods_catalog3` VALUES (45, '中国移动', 11);
INSERT INTO `goods_catalog3` VALUES (46, '中国电信', 11);
INSERT INTO `goods_catalog3` VALUES (47, '中国联通', 11);
INSERT INTO `goods_catalog3` VALUES (48, '充话费/流量', 11);
INSERT INTO `goods_catalog3` VALUES (49, '宽带', 11);
INSERT INTO `goods_catalog3` VALUES (50, '手机壳', 12);
INSERT INTO `goods_catalog3` VALUES (51, '贴膜', 12);
INSERT INTO `goods_catalog3` VALUES (52, '充电器', 12);
INSERT INTO `goods_catalog3` VALUES (53, '数据线', 12);
INSERT INTO `goods_catalog3` VALUES (54, '手机耳机', 12);
INSERT INTO `goods_catalog3` VALUES (55, '手机电池', 12);
INSERT INTO `goods_catalog3` VALUES (56, '手机饰品', 12);
INSERT INTO `goods_catalog3` VALUES (57, '蓝牙耳机', 12);
INSERT INTO `goods_catalog3` VALUES (58, '数码相机', 13);
INSERT INTO `goods_catalog3` VALUES (59, '摄像机', 13);
INSERT INTO `goods_catalog3` VALUES (60, '运动相机', 13);
INSERT INTO `goods_catalog3` VALUES (61, '单反相机', 13);
INSERT INTO `goods_catalog3` VALUES (62, '笔记本', 18);
INSERT INTO `goods_catalog3` VALUES (63, '游戏本', 18);
INSERT INTO `goods_catalog3` VALUES (64, '平板电脑', 18);
INSERT INTO `goods_catalog3` VALUES (65, '平板电脑配件', 18);
INSERT INTO `goods_catalog3` VALUES (66, '台式机', 18);
INSERT INTO `goods_catalog3` VALUES (67, '一体机', 18);
INSERT INTO `goods_catalog3` VALUES (68, '服务器/工作站', 18);
INSERT INTO `goods_catalog3` VALUES (69, '笔记本配件', 18);
INSERT INTO `goods_catalog3` VALUES (70, '显示器', 19);
INSERT INTO `goods_catalog3` VALUES (71, 'CPU', 19);
INSERT INTO `goods_catalog3` VALUES (72, '主板', 19);
INSERT INTO `goods_catalog3` VALUES (73, '显卡', 19);
INSERT INTO `goods_catalog3` VALUES (74, '硬盘', 19);
INSERT INTO `goods_catalog3` VALUES (75, '内存', 19);
INSERT INTO `goods_catalog3` VALUES (76, '电源', 19);
INSERT INTO `goods_catalog3` VALUES (77, '机箱', 19);
INSERT INTO `goods_catalog3` VALUES (78, 'SSD固态硬盘', 19);
INSERT INTO `goods_catalog3` VALUES (79, '鼠标', 20);
INSERT INTO `goods_catalog3` VALUES (80, '键盘', 20);
INSERT INTO `goods_catalog3` VALUES (81, '键鼠套装', 20);
INSERT INTO `goods_catalog3` VALUES (82, 'U盘', 20);
INSERT INTO `goods_catalog3` VALUES (83, '鼠标垫', 20);
INSERT INTO `goods_catalog3` VALUES (84, '摄像头', 20);
INSERT INTO `goods_catalog3` VALUES (85, '游戏机', 21);
INSERT INTO `goods_catalog3` VALUES (86, '游戏耳机', 21);
INSERT INTO `goods_catalog3` VALUES (87, '手柄/方向盘', 21);
INSERT INTO `goods_catalog3` VALUES (88, '游戏软件', 21);

-- ----------------------------
-- Table structure for goods_coupon
-- ----------------------------
DROP TABLE IF EXISTS `goods_coupon`;
CREATE TABLE `goods_coupon`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` int(1) NULL DEFAULT NULL COMMENT '优惠卷类型,0全场赠券,1会员赠券,2购物赠券,3注册赠券',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠券名称',
  `use_platform` int(1) NULL DEFAULT NULL COMMENT '使用平台：0全部，1移动，2PC',
  `count` bigint(20) NULL DEFAULT NULL COMMENT '数量',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `user_count_limit` int(11) NULL DEFAULT NULL COMMENT '每人限领张数',
  `min_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '使用门槛，0表示无门槛',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '可使用时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `use_scope` int(1) NULL DEFAULT NULL COMMENT '使用范围：0全场通用，1指定分类，2指定商品',
  `catalog1_id` bigint(20) NULL DEFAULT NULL COMMENT '一级分类',
  `catalog2_id` bigint(20) NULL DEFAULT NULL COMMENT '二级分类',
  `catalog3_id` bigint(20) NULL DEFAULT NULL COMMENT '三级分类',
  `spu_id` bigint(20) NULL DEFAULT NULL COMMENT 'spuId',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT 'skuId',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `publish_count` bigint(11) NULL DEFAULT NULL COMMENT '发行数量',
  `use_count` bigint(11) NULL DEFAULT NULL COMMENT '已使用数量',
  `enable_time` datetime(0) NULL DEFAULT NULL COMMENT '可以领取的日期',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠码',
  `user_grade_id` int(11) NULL DEFAULT NULL COMMENT '可领取的会员类型：0无限时',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠卷表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_order_details
-- ----------------------------
DROP TABLE IF EXISTS `goods_order_details`;
CREATE TABLE `goods_order_details`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单 id',
  `order_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT 'slu id',
  `sku_image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `sku_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `brand` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `sku_price` decimal(10, 0) NULL DEFAULT NULL COMMENT '价格',
  `sku_quantity` bigint(20) NULL DEFAULT NULL COMMENT '数量',
  `sku_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条形码',
  `catalog3_id` bigint(200) NULL DEFAULT NULL COMMENT '产品分类id',
  `sale_attribute1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性1',
  `sale_attribute2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性2',
  `sale_attribute3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性3',
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '促销活动名称',
  `promotion_amount` decimal(10, 0) NULL DEFAULT NULL COMMENT '促销金额',
  `coupon_amount` decimal(10, 0) NULL DEFAULT NULL COMMENT '优惠券金额',
  `integral_deduction_amount` decimal(10, 0) NULL DEFAULT NULL COMMENT '积分扣除金额',
  `pay_amount` decimal(10, 0) NULL DEFAULT NULL COMMENT '应付金额',
  `gain_integral_number` bigint(20) NULL DEFAULT NULL COMMENT '获得积分数量',
  `gain_growth_value` bigint(20) NULL DEFAULT NULL COMMENT '获得成长值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_order_details
-- ----------------------------
INSERT INTO `goods_order_details` VALUES (7, 7, '201910200018023', 20, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2YCCaAHxOBAAKIuyJHR_k326.jpg', '机械革命(MECHREVO)Z2-R 15.6英寸窄边框游戏笔记本电脑(i7-9750H 16G 512G PCIE+1T RTX2060 144Hz）', '', 8888, 2, NULL, 63, '1TB SSD', '纯固态', NULL, NULL, 0, 0, NULL, 17776, NULL, NULL);
INSERT INTO `goods_order_details` VALUES (8, 8, '201910200042463', 20, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2YCCaAHxOBAAKIuyJHR_k326.jpg', '机械革命(MECHREVO)Z2-R 15.6英寸窄边框游戏笔记本电脑(i7-9750H 16G 512G PCIE+1T RTX2060 144Hz）', '', 8888, 1, NULL, 63, '1TB SSD', '纯固态', NULL, NULL, 0, 0, NULL, 8888, NULL, NULL);
INSERT INTO `goods_order_details` VALUES (9, 9, '201910200953483', 20, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2YCCaAHxOBAAKIuyJHR_k326.jpg', '机械革命(MECHREVO)Z2-R 15.6英寸窄边框游戏笔记本电脑(i7-9750H 16G 512G PCIE+1T RTX2060 144Hz）', '', 8888, 5, NULL, 63, '1TB SSD', '纯固态', NULL, NULL, 0, 0, NULL, 44440, NULL, NULL);
INSERT INTO `goods_order_details` VALUES (10, 10, '201910211551542113608728', 20, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2YCCaAHxOBAAKIuyJHR_k326.jpg', '机械革命(MECHREVO)Z2-R 15.6英寸窄边框游戏笔记本电脑(i7-9750H 16G 512G PCIE+1T RTX2060 144Hz）', '', 8888, 2, NULL, 63, '1TB SSD', '纯固态', NULL, NULL, 0, 0, NULL, 17776, NULL, NULL);
INSERT INTO `goods_order_details` VALUES (11, 11, '201910211553471670886265', 20, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2YCCaAHxOBAAKIuyJHR_k326.jpg', '机械革命(MECHREVO)Z2-R 15.6英寸窄边框游戏笔记本电脑(i7-9750H 16G 512G PCIE+1T RTX2060 144Hz）', '', 8888, 1, NULL, 63, '1TB SSD', '纯固态', NULL, NULL, 0, 0, NULL, 8888, NULL, NULL);
INSERT INTO `goods_order_details` VALUES (12, 12, '20191107085049770289306', 20, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2YCCaAHxOBAAKIuyJHR_k326.jpg', '机械革命(MECHREVO)Z2-R 15.6英寸窄边框游戏笔记本电脑(i7-9750H 16G 512G PCIE+1T RTX2060 144Hz）', '', 8888, 1, NULL, 63, '1TB SSD', '纯固态', NULL, NULL, 0, 0, NULL, 8888, NULL, NULL);
INSERT INTO `goods_order_details` VALUES (13, 13, '20200509152943998698564', 19, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XPgyATlLaAAJcCX9OSFI302.jpg', '机械革命(MECHREVO)Z2 Air 15.6英寸轻薄游戏笔记本电脑(i7-9750H 8G 512G SSD GTX1650 72%高色域）', '', 6299, 2, NULL, 63, '256GB SSD+1TB', '电竞屏', NULL, NULL, 0, 0, NULL, 12598, NULL, NULL);
INSERT INTO `goods_order_details` VALUES (14, 14, '202005091550531666895910', 20, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2YCCaAHxOBAAKIuyJHR_k326.jpg', '机械革命(MECHREVO)Z2-R 15.6英寸窄边框游戏笔记本电脑(i7-9750H 16G 512G PCIE+1T RTX2060 144Hz）', '', 8888, 1, NULL, 63, '1TB SSD', '纯固态', NULL, NULL, 0, 0, NULL, 8888, NULL, NULL);
INSERT INTO `goods_order_details` VALUES (15, 15, '202005091716541884836792', 17, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmAWT2uAAFhjYCzYMI427.jpg', '联想(Lenovo)拯救者Y7000 2019 英特尔酷睿i5 15.6英寸游戏笔记本电脑(i5-9300H 8G 1T SSD GTX1650 72%NTSC)', '', 6666, 1, NULL, 63, '256GB SSD+1TB ', '高色域', NULL, NULL, 0, 0, NULL, 6666, NULL, NULL);
INSERT INTO `goods_order_details` VALUES (16, 16, '202005091751241997121505', 19, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XPgyATlLaAAJcCX9OSFI302.jpg', '机械革命(MECHREVO)Z2 Air 15.6英寸轻薄游戏笔记本电脑(i7-9750H 8G 512G SSD GTX1650 72%高色域）', '', 6299, 1, NULL, 63, '256GB SSD+1TB', '电竞屏', NULL, NULL, 0, 0, NULL, 6299, NULL, NULL);
INSERT INTO `goods_order_details` VALUES (17, 17, '202005092104491276447422', 19, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XPgyATlLaAAJcCX9OSFI302.jpg', '机械革命(MECHREVO)Z2 Air 15.6英寸轻薄游戏笔记本电脑(i7-9750H 8G 512G SSD GTX1650 72%高色域）', '', 6299, 1, NULL, 63, '256GB SSD+1TB', '电竞屏', NULL, NULL, 0, 0, NULL, 6299, NULL, NULL);
INSERT INTO `goods_order_details` VALUES (18, 18, '202005092154111224216140', 19, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XPgyATlLaAAJcCX9OSFI302.jpg', '机械革命(MECHREVO)Z2 Air 15.6英寸轻薄游戏笔记本电脑(i7-9750H 8G 512G SSD GTX1650 72%高色域）', '', 6299, 1, NULL, 63, '256GB SSD+1TB', '电竞屏', NULL, NULL, 0, 0, NULL, 6299, NULL, NULL);
INSERT INTO `goods_order_details` VALUES (19, 19, '20200509230043-1595279560', 19, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XPgyATlLaAAJcCX9OSFI302.jpg', '机械革命(MECHREVO)Z2 Air 15.6英寸轻薄游戏笔记本电脑(i7-9750H 8G 512G SSD GTX1650 72%高色域）', '', 6299, 1, NULL, 63, '256GB SSD+1TB', '电竞屏', NULL, NULL, 0, 0, NULL, 6299, NULL, NULL);
INSERT INTO `goods_order_details` VALUES (20, 20, '20200510155630-1907539172', 17, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmAWT2uAAFhjYCzYMI427.jpg', '联想(Lenovo)拯救者Y7000 2019 英特尔酷睿i5 15.6英寸游戏笔记本电脑(i5-9300H 8G 1T SSD GTX1650 72%NTSC)', '', 6666, 1, NULL, 63, '256GB SSD+1TB ', '高色域', NULL, NULL, 0, 0, NULL, 6666, NULL, NULL);

-- ----------------------------
-- Table structure for goods_order_info
-- ----------------------------
DROP TABLE IF EXISTS `goods_order_info`;
CREATE TABLE `goods_order_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `coupon_id` bigint(20) NULL DEFAULT NULL COMMENT '优惠券ID',
  `order_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '订单时间',
  `shop_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名称',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销活动金额（促销价、满减、阶梯价）',
  `integral_deduction_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '折扣金额',
  `pay_type` int(1) NULL DEFAULT NULL COMMENT '支付方式：0未支付1支付宝2微信3货到付款',
  `source_type` int(1) NULL DEFAULT NULL COMMENT '订单来源\r\n0PC 、1APP\r\n',
  `status` int(1) NULL DEFAULT NULL COMMENT '订单状态0待付款，1待发货，2已发货，3交易成功，4订单已取消，5申请退款，6退款中，7退款成功，8已评价',
  `order_type` int(1) NULL DEFAULT NULL COMMENT '订单类型：0正常订单，1秒杀订单',
  `delivery_company` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递公司',
  `logistics_single_inquiry_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(11) NULL DEFAULT 7 COMMENT '自动确认时间（天）',
  `gain_integral_number` bigint(20) NULL DEFAULT NULL COMMENT '获得的积分数量',
  `gain_growth_value` bigint(20) NULL DEFAULT NULL COMMENT '获得成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '促销信息',
  `invoice_type` int(1) NULL DEFAULT NULL COMMENT '发票类型：0不开发票；1电子发票；2纸质发票',
  `invoice_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票标题',
  `invoice_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `receiver_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `region` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县',
  `detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `confirm_status` int(1) NULL DEFAULT 0 COMMENT '确认收货状态：0未确认，已确认',
  `delete_status` int(1) NULL DEFAULT 0 COMMENT '删除状态\r\n0未删除1已删除\r\n',
  `use_integral` bigint(11) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '付款时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_order_info
-- ----------------------------
INSERT INTO `goods_order_info` VALUES (7, 3, NULL, '201910200018023', '2019-10-19 16:18:03', '机械革命旗舰店', NULL, 17776.00, 17776.00, 0.00, 0.00, NULL, 0.00, 0.00, 1, 0, 1, 0, '逍遥快递', '20200412183823-1164526896', 7, NULL, NULL, NULL, 1, '个人发票', '商品明细', '6087596391', '13351122', '6666', '重庆市', '重庆市', '合川区', '合阳街道9号', NULL, 0, 0, NULL, '2020-04-12 10:38:24', '2019-10-19 16:18:03', NULL, '2019-10-19 16:18:03', '2019-10-19 16:18:03');
INSERT INTO `goods_order_info` VALUES (8, 3, NULL, '201910200042463', '2019-10-19 16:42:46', '机械革命旗舰店', NULL, 8888.00, 8888.00, 0.00, 0.00, NULL, 0.00, 0.00, 1, 0, 3, 0, '逍遥快递', '20200412183823-1164526896', 7, NULL, NULL, NULL, 1, '个人发票', '商品明细', '6087596391', '13351122', '6666', '重庆市', '重庆市', '合川区', '合阳街道9号', NULL, 0, 0, NULL, '2020-04-12 10:38:24', '2019-10-19 16:42:46', NULL, '2019-10-19 16:42:46', '2019-10-19 16:42:46');
INSERT INTO `goods_order_info` VALUES (9, 3, NULL, '201910200953483', '2019-10-20 01:53:49', '机械革命旗舰店', NULL, 44440.00, 44440.00, 0.00, 0.00, NULL, 0.00, 0.00, 1, 0, 2, 0, '逍遥快递', '20200412183823-1164526896', 7, 44440, 4444, NULL, 1, '个人发票', '商品明细', '6087596391', '13351122', '9999', '重庆市', '重庆市', '江北区', '红旗街道9号', NULL, 0, 0, NULL, '2020-04-12 10:38:24', '2019-10-20 01:53:49', NULL, '2019-10-20 01:53:49', '2019-10-20 01:53:49');
INSERT INTO `goods_order_info` VALUES (10, 3, NULL, '201910211551542113608728', '2019-10-21 07:51:55', '机械革命旗舰店', NULL, 17776.00, 17776.00, 0.00, 0.00, NULL, 0.00, 0.00, 1, 0, 2, 0, '逍遥快递', '20200412183823-1164526896', 7, 17776, 1777, NULL, 1, '个人发票', '商品明细', '6087596391', '13351122', '6666', '重庆市', '重庆市', '合川区', '合阳街道9号', NULL, 0, 0, NULL, '2020-04-12 10:38:24', '2019-10-21 07:51:55', NULL, '2019-10-21 07:51:55', '2019-10-21 07:51:55');
INSERT INTO `goods_order_info` VALUES (11, 3, NULL, '201910211553471670886265', '2019-10-21 07:53:48', '机械革命旗舰店', NULL, 8888.00, 8888.00, 0.00, 0.00, NULL, 0.00, 0.00, 1, 0, 1, 0, '逍遥快递', '20200412183823-1164526896', 7, 8888, 888, NULL, 1, '个人发票', '商品明细', '6087596391', '13351122', '6666', '重庆市', '重庆市', '合川区', '合阳街道9号', NULL, 0, 1, NULL, '2020-04-12 10:38:24', '2019-10-21 07:53:48', NULL, '2019-10-21 07:53:48', '2019-10-21 07:53:48');
INSERT INTO `goods_order_info` VALUES (12, 3, NULL, '20191107085049770289306', '2019-11-07 00:50:49', '机械革命旗舰店', NULL, 8888.00, 8888.00, 0.00, 0.00, NULL, 0.00, 0.00, 1, 0, 0, 0, '逍遥快递', '20200412183823-1164526896', 7, 8888, 888, NULL, 1, '个人发票', '商品明细', '6087596391', '13351122', '6666', '重庆市', '重庆市', '合川区', '合阳街道9号', NULL, 0, 0, NULL, '2020-04-12 10:38:26', '2019-11-07 00:50:49', NULL, '2019-11-07 00:50:49', '2019-11-07 00:50:49');
INSERT INTO `goods_order_info` VALUES (13, 3, NULL, '20200509152943998698564', '2020-05-09 07:30:02', '机械革命旗舰店', NULL, 12598.00, 12598.00, 0.00, 0.00, NULL, 0.00, 12598.00, 1, 0, 0, 0, NULL, NULL, 7, 12598, 1259, NULL, NULL, NULL, NULL, '6087596391', '13351122', '6666', '重庆市', '重庆市', '合川区', '合阳街道9号', NULL, 0, 0, NULL, NULL, '2020-05-09 07:30:02', NULL, '2020-05-09 07:30:02', '2020-05-09 07:30:02');
INSERT INTO `goods_order_info` VALUES (14, 3, NULL, '202005091550531666895910', '2020-05-09 07:51:02', '机械革命旗舰店', NULL, 8888.00, 8888.00, 0.00, 0.00, NULL, 0.00, 8888.00, 1, 0, 1, 0, '逍遥快递', '20200509155158938821271', 7, 8888, 888, NULL, 1, '个人发票', '商品明细', '6087596391', '13351122', '6666', '重庆市', '重庆市', '合川区', '合阳街道9号', NULL, 0, 0, NULL, '2020-05-09 07:52:11', '2020-05-09 07:51:02', NULL, '2020-05-09 07:51:02', '2020-05-09 07:51:02');
INSERT INTO `goods_order_info` VALUES (15, 3, NULL, '202005091716541884836792', '2020-05-09 09:16:56', '联想旗舰店', NULL, 6666.00, 6666.00, 0.00, 0.00, NULL, 0.00, 6666.00, 1, 0, 0, 0, NULL, NULL, 7, 6666, 666, NULL, NULL, NULL, NULL, '6087596391', '13351122', '6666', '重庆市', '重庆市', '合川区', '合阳街道9号', NULL, 0, 0, NULL, NULL, '2020-05-09 09:16:56', NULL, '2020-05-09 09:16:56', '2020-05-09 09:16:56');
INSERT INTO `goods_order_info` VALUES (16, 3, NULL, '202005091751241997121505', '2020-05-09 09:51:27', '机械革命旗舰店', NULL, 6299.00, 6299.00, 0.00, 0.00, NULL, 0.00, 6299.00, 1, 0, 1, 0, '逍遥快递', '20200509175155-1428027364', 7, 6299, 629, NULL, 1, '个人发票', '商品明细', '6087596391', '13351122', '6666', '重庆市', '重庆市', '合川区', '合阳街道9号', NULL, 0, 0, NULL, '2020-05-09 09:52:05', '2020-05-09 09:51:27', NULL, '2020-05-09 09:51:27', '2020-05-09 09:51:27');
INSERT INTO `goods_order_info` VALUES (17, 3, NULL, '202005092104491276447422', '2020-05-09 13:04:50', '机械革命旗舰店', NULL, 6299.00, 6299.00, 0.00, 0.00, NULL, 0.00, 6299.00, 1, 0, 1, 0, '逍遥快递', '20200509210605-1356079084', 7, 6299, 629, NULL, 1, '个人发票', '商品明细', '6087596391', '13351122', '6666', '重庆市', '重庆市', '合川区', '合阳街道9号', NULL, 0, 0, NULL, '2020-05-09 13:06:22', '2020-05-09 13:04:50', NULL, '2020-05-09 13:04:50', '2020-05-09 13:04:50');
INSERT INTO `goods_order_info` VALUES (18, 3, NULL, '202005092154111224216140', '2020-05-09 13:54:14', '机械革命旗舰店', NULL, 6299.00, 6299.00, 0.00, 0.00, NULL, 0.00, 6299.00, 1, 0, 1, 0, '逍遥快递', '202005092155121379176179', 7, 6299, 629, NULL, 1, '个人发票', '商品明细', '6087596391', '13351122', '6666', '重庆市', '重庆市', '合川区', '合阳街道9号', NULL, 0, 0, NULL, '2020-05-09 13:55:22', '2020-05-09 13:54:14', NULL, '2020-05-09 13:54:14', '2020-05-09 13:54:14');
INSERT INTO `goods_order_info` VALUES (19, 3, NULL, '20200509230043-1595279560', '2020-05-09 15:00:45', '机械革命旗舰店', NULL, 6299.00, 6299.00, 0.00, 0.00, NULL, 0.00, 6299.00, 1, 0, 1, 0, '逍遥快递', '20200509230126-1503934073', 7, 6299, 629, NULL, 1, '个人发票', '商品明细', '6087596391', '13351122', '6666', '重庆市', '重庆市', '合川区', '合阳街道9号', NULL, 0, 0, NULL, '2020-05-09 15:01:38', '2020-05-09 15:00:45', NULL, '2020-05-09 15:00:45', '2020-05-09 15:00:45');
INSERT INTO `goods_order_info` VALUES (20, 3, NULL, '20200510155630-1907539172', '2020-05-10 07:56:32', '联想旗舰店', NULL, 6666.00, 6666.00, 0.00, 0.00, NULL, 0.00, 6666.00, 1, 0, 1, 0, '逍遥快递', '20200510180834-563662030', 7, 6666, 666, NULL, 1, '个人发票', '商品明细', '6087596391', '13351122', '6666', '重庆市', '重庆市', '合川区', '合阳街道9号', NULL, 0, 0, NULL, '2020-05-10 10:08:53', '2020-05-10 07:56:32', NULL, '2020-05-10 07:56:32', '2020-05-10 07:56:32');

-- ----------------------------
-- Table structure for goods_promotion_activity
-- ----------------------------
DROP TABLE IF EXISTS `goods_promotion_activity`;
CREATE TABLE `goods_promotion_activity`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `activity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `activity_amount` decimal(10, 0) NULL DEFAULT NULL COMMENT '活动金额',
  `activity_scope` int(1) NULL DEFAULT NULL COMMENT '0全场通用,1指定分类,2指定商品',
  `catalog1_id` bigint(255) NULL DEFAULT NULL COMMENT '一级分类',
  `catalog2_id` bigint(255) NULL DEFAULT NULL COMMENT '二级分类',
  `catalog3_id` bigint(255) NULL DEFAULT NULL COMMENT '三级分类',
  `spu_id` bigint(20) NULL DEFAULT NULL COMMENT '指定商品spuId',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT '指定商品skuId',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '促销活动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_sale_attribute
-- ----------------------------
DROP TABLE IF EXISTS `goods_sale_attribute`;
CREATE TABLE `goods_sale_attribute`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '销售属性 id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '销售属性名称',
  `login_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品销售属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_sale_attribute
-- ----------------------------
INSERT INTO `goods_sale_attribute` VALUES (1, '容量', 'fairy');
INSERT INTO `goods_sale_attribute` VALUES (2, '颜色', 'fairy');
INSERT INTO `goods_sale_attribute` VALUES (3, '版本', 'fairy');

-- ----------------------------
-- Table structure for goods_sku_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku_attribute_value`;
CREATE TABLE `goods_sku_attribute_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `attribute_id` bigint(20) NULL DEFAULT NULL COMMENT '销售属性id',
  `value_id` bigint(20) NULL DEFAULT NULL COMMENT '销售属性值id',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT 'sku id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 611 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sku商品参数值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_sku_attribute_value
-- ----------------------------
INSERT INTO `goods_sku_attribute_value` VALUES (401, 21, 134, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (402, 22, 147, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (403, 23, 148, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (404, 24, 156, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (405, 25, 167, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (406, 26, 169, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (407, 27, 178, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (408, 28, 180, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (409, 29, 185, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (410, 30, 190, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (411, 31, 194, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (412, 32, 198, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (413, 33, 203, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (414, 34, 207, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (415, 35, 213, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (416, 36, 218, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (417, 37, 221, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (418, 38, 225, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (419, 39, 233, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (420, 40, 237, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (421, 41, 239, 18);
INSERT INTO `goods_sku_attribute_value` VALUES (485, 21, 134, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (486, 22, 147, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (487, 23, 152, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (488, 24, 156, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (489, 25, 167, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (490, 26, 170, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (491, 27, 178, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (492, 28, 180, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (493, 29, 185, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (494, 30, 190, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (495, 31, 194, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (496, 32, 199, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (497, 33, 203, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (498, 34, 207, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (499, 35, 213, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (500, 36, 218, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (501, 37, 221, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (502, 38, 225, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (503, 39, 233, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (504, 40, 237, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (505, 41, 239, 16);
INSERT INTO `goods_sku_attribute_value` VALUES (548, 21, 134, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (549, 22, 144, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (550, 23, 153, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (551, 24, 157, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (552, 25, 164, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (553, 26, 169, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (554, 27, 178, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (555, 28, 180, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (556, 29, 185, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (557, 30, 190, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (558, 31, 194, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (559, 32, 199, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (560, 33, 203, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (561, 34, 207, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (562, 35, 213, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (563, 36, 218, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (564, 37, 221, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (565, 38, 225, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (566, 39, 233, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (567, 40, 237, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (568, 41, 239, 17);
INSERT INTO `goods_sku_attribute_value` VALUES (569, 21, 138, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (570, 22, 144, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (571, 23, 153, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (572, 24, 156, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (573, 25, 164, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (574, 26, 170, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (575, 27, 178, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (576, 28, 181, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (577, 29, 187, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (578, 30, 191, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (579, 31, 194, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (580, 32, 199, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (581, 33, 204, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (582, 34, 207, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (583, 35, 259, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (584, 36, 218, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (585, 37, 221, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (586, 38, 226, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (587, 39, 232, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (588, 40, 236, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (589, 41, 241, 19);
INSERT INTO `goods_sku_attribute_value` VALUES (590, 21, 138, 20);
INSERT INTO `goods_sku_attribute_value` VALUES (591, 22, 146, 20);
INSERT INTO `goods_sku_attribute_value` VALUES (592, 23, 151, 20);
INSERT INTO `goods_sku_attribute_value` VALUES (593, 24, 156, 20);
INSERT INTO `goods_sku_attribute_value` VALUES (594, 25, 167, 20);
INSERT INTO `goods_sku_attribute_value` VALUES (595, 26, 170, 20);
INSERT INTO `goods_sku_attribute_value` VALUES (596, 27, 178, 20);
INSERT INTO `goods_sku_attribute_value` VALUES (597, 28, 181, 20);
INSERT INTO `goods_sku_attribute_value` VALUES (598, 29, 186, 20);
INSERT INTO `goods_sku_attribute_value` VALUES (599, 30, 190, 20);
INSERT INTO `goods_sku_attribute_value` VALUES (600, 31, 194, 20);
INSERT INTO `goods_sku_attribute_value` VALUES (601, 32, 199, 20);
INSERT INTO `goods_sku_attribute_value` VALUES (602, 33, 203, 20);
INSERT INTO `goods_sku_attribute_value` VALUES (603, 34, 209, 20);
INSERT INTO `goods_sku_attribute_value` VALUES (604, 35, 259, 20);
INSERT INTO `goods_sku_attribute_value` VALUES (605, 36, 218, 20);
INSERT INTO `goods_sku_attribute_value` VALUES (606, 37, 221, 20);
INSERT INTO `goods_sku_attribute_value` VALUES (607, 38, 226, 20);
INSERT INTO `goods_sku_attribute_value` VALUES (608, 39, 233, 20);
INSERT INTO `goods_sku_attribute_value` VALUES (609, 40, 236, 20);
INSERT INTO `goods_sku_attribute_value` VALUES (610, 41, 239, 20);

-- ----------------------------
-- Table structure for goods_sku_image
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku_image`;
CREATE TABLE `goods_sku_image`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT 'sku id',
  `img_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片名称',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `spu_img_id` bigint(20) NULL DEFAULT NULL COMMENT 'spu图片id',
  `is_default` bigint(20) NULL DEFAULT NULL COMMENT '1默认，0不默认',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品sku图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_sku_image
-- ----------------------------
INSERT INTO `goods_sku_image` VALUES (43, 16, '1fc808df0fbe5813.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmAWT2uAAFhjYCzYMI427.jpg', 17, 0);
INSERT INTO `goods_sku_image` VALUES (44, 16, '1f205ea2c708681e.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmAbkCZAAGw8f8unqs450.jpg', 19, 1);
INSERT INTO `goods_sku_image` VALUES (45, 16, '11d712f118991744.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmAIcU4AAKWQqIomaM067.jpg', 18, 0);
INSERT INTO `goods_sku_image` VALUES (46, 17, '1fc808df0fbe5813.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmAWT2uAAFhjYCzYMI427.jpg', 17, 1);
INSERT INTO `goods_sku_image` VALUES (47, 17, '1f205ea2c708681e.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmAbkCZAAGw8f8unqs450.jpg', 19, 0);
INSERT INTO `goods_sku_image` VALUES (48, 17, '11d712f118991744.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmAIcU4AAKWQqIomaM067.jpg', 18, 0);
INSERT INTO `goods_sku_image` VALUES (49, 18, '1fc808df0fbe5813.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmAWT2uAAFhjYCzYMI427.jpg', 17, 0);
INSERT INTO `goods_sku_image` VALUES (50, 18, '1f205ea2c708681e.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmAbkCZAAGw8f8unqs450.jpg', 19, 0);
INSERT INTO `goods_sku_image` VALUES (51, 18, '11d712f118991744.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmAIcU4AAKWQqIomaM067.jpg', 18, 1);
INSERT INTO `goods_sku_image` VALUES (52, 19, 'c7d799230f50f3be.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XPgyATlLaAAJcCX9OSFI302.jpg', 27, 1);
INSERT INTO `goods_sku_image` VALUES (53, 19, '342af8af77b1f23f.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XPgyAbBjZAAHx6VWbpe4877.jpg', 25, 0);
INSERT INTO `goods_sku_image` VALUES (54, 19, '1e08b92f8151bc5b.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XPgyAZG-hAAEbbbEjxvI515.jpg', 26, 0);
INSERT INTO `goods_sku_image` VALUES (55, 19, 'ba08709d17947797.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XPgyAJlzZAAIFSu3S0c0583.jpg', 22, 0);
INSERT INTO `goods_sku_image` VALUES (56, 20, '943c1a44a16f7b77.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2YCCaAHxOBAAKIuyJHR_k326.jpg', 28, 1);
INSERT INTO `goods_sku_image` VALUES (57, 20, '1e08b92f8151bc5b.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XPgyAZG-hAAEbbbEjxvI515.jpg', 26, 0);
INSERT INTO `goods_sku_image` VALUES (58, 20, '342af8af77b1f23f.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XPgyAbBjZAAHx6VWbpe4877.jpg', 25, 0);
INSERT INTO `goods_sku_image` VALUES (59, 20, 'ba08709d17947797.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XPgyAJlzZAAIFSu3S0c0583.jpg', 22, 0);

-- ----------------------------
-- Table structure for goods_sku_info
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku_info`;
CREATE TABLE `goods_sku_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `spu_id` bigint(20) NULL DEFAULT NULL COMMENT 'spu id',
  `price` double NULL DEFAULT NULL COMMENT '价格',
  `sku_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku名称',
  `sku_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku描述',
  `weight` double NULL DEFAULT NULL COMMENT '重量',
  `brand_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `catalog3_id` bigint(20) NULL DEFAULT NULL COMMENT '三级分类id',
  `sku_default_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品sku信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_sku_info
-- ----------------------------
INSERT INTO `goods_sku_info` VALUES (16, 5, 8888, '联想(Lenovo)拯救者Y7000P 2019英特尔酷睿i7 15.6英寸游戏笔记本电脑(i7-9750H 16G 1TSSD GTX1650 144Hz)', '英特尔9代i7H高性能处理器，144Hz电竞屏窄边框', 2, '', 63, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmAbkCZAAGw8f8unqs450.jpg');
INSERT INTO `goods_sku_info` VALUES (17, 5, 6666, '联想(Lenovo)拯救者Y7000 2019 英特尔酷睿i5 15.6英寸游戏笔记本电脑(i5-9300H 8G 1T SSD GTX1650 72%NTSC)', 'GTX1660电竞级独显，英特尔9代i7H高性能处理器，144Hz电竞屏窄边框', 2, '', 63, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmAWT2uAAFhjYCzYMI427.jpg');
INSERT INTO `goods_sku_info` VALUES (18, 5, 9999, '联想(Lenovo)拯救者Y7000P 2019英特尔酷睿i7 15.6英寸游戏笔记本电脑(i7-9750H 16G 1TSSD RTX2060 144Hz)', '超大1T固态，升级双通道16G内存一步到位，GTX1660Ti电竞级独显，英特尔9代i7H高性能处理器，144Hz电竞屏窄边框', 2, '', 63, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmAIcU4AAKWQqIomaM067.jpg');
INSERT INTO `goods_sku_info` VALUES (19, 6, 6299, '机械革命(MECHREVO)Z2 Air 15.6英寸轻薄游戏笔记本电脑(i7-9750H 8G 512G SSD GTX1650 72%高色域）', '\"十一\"提前放价【GTX1650爆款】轻薄本游戏本更多人的选择，九代标压i7，512G固态，72%高色域屏', 1, '', 63, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XPgyATlLaAAJcCX9OSFI302.jpg');
INSERT INTO `goods_sku_info` VALUES (20, 6, 8888, '机械革命(MECHREVO)Z2-R 15.6英寸窄边框游戏笔记本电脑(i7-9750H 16G 512G PCIE+1T RTX2060 144Hz）', '【RTX2060爆款】窄边框144Hz电竞屏，九代酷睿i7，16G双通道内存，机械键盘手感更好，这是你的选择', 2, '', 63, 'http://192.168.43.96/group1/M00/00/00/wKgrYF2YCCaAHxOBAAKIuyJHR_k326.jpg');

-- ----------------------------
-- Table structure for goods_sku_sale_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku_sale_attribute_value`;
CREATE TABLE `goods_sku_sale_attribute_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT 'sku id',
  `sale_attribute_id` bigint(20) NULL DEFAULT NULL COMMENT 'sku id',
  `sale_attribute_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性名称',
  `sale_attribute_value_id` bigint(20) NULL DEFAULT NULL COMMENT '销售属性值id',
  `sale_attribute_value_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性值名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品sku销售属性信息值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_sku_sale_attribute_value
-- ----------------------------
INSERT INTO `goods_sku_sale_attribute_value` VALUES (40, 18, 1, '容量', 39, '512GB SSD');
INSERT INTO `goods_sku_sale_attribute_value` VALUES (41, 18, 2, '颜色', 41, '电竞屏');
INSERT INTO `goods_sku_sale_attribute_value` VALUES (58, 16, 1, '容量', 39, '512GB SSD');
INSERT INTO `goods_sku_sale_attribute_value` VALUES (59, 16, 2, '颜色', 42, '高色域');
INSERT INTO `goods_sku_sale_attribute_value` VALUES (60, 17, 1, '容量', 40, '256GB SSD+1TB ');
INSERT INTO `goods_sku_sale_attribute_value` VALUES (61, 17, 2, '颜色', 42, '高色域');
INSERT INTO `goods_sku_sale_attribute_value` VALUES (66, 19, 1, '容量', 44, '256GB SSD+1TB');
INSERT INTO `goods_sku_sale_attribute_value` VALUES (67, 19, 2, '颜色', 46, '电竞屏');
INSERT INTO `goods_sku_sale_attribute_value` VALUES (74, 20, 1, '容量', 43, '1TB SSD');
INSERT INTO `goods_sku_sale_attribute_value` VALUES (75, 20, 2, '颜色', 45, '纯固态');

-- ----------------------------
-- Table structure for goods_spu_image
-- ----------------------------
DROP TABLE IF EXISTS `goods_spu_image`;
CREATE TABLE `goods_spu_image`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '图片id',
  `spu_id` bigint(20) NULL DEFAULT NULL COMMENT 'spu id',
  `img_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片名称',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片url地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'spu商品图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_spu_image
-- ----------------------------
INSERT INTO `goods_spu_image` VALUES (4, 1, '1fc808df0fbe5813.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2UPZ2AU5mMAAFhjYCzYMI155.jpg');
INSERT INTO `goods_spu_image` VALUES (5, 1, '1635fd95d6831027.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2UPZ2AQqAnAADJCjBtz4M909.jpg');
INSERT INTO `goods_spu_image` VALUES (6, 1, '208a374f3328c874.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2UPZ2ASvjcAAOYy-AZrrk159.jpg');
INSERT INTO `goods_spu_image` VALUES (7, 1, 'd56d258b14bad253.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2UPZ2AZfJjAAMVdPJFP2I779.jpg');
INSERT INTO `goods_spu_image` VALUES (8, 1, '11d712f118991744.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2UPZ2AL0TvAAKWQqIomaM789.jpg');
INSERT INTO `goods_spu_image` VALUES (9, 1, '1f205ea2c708681e.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2UP62AGfQQAAGw8f8unqs987.jpg');
INSERT INTO `goods_spu_image` VALUES (10, 2, '1e08b92f8151bc5b.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2W4E6AcmhdAAEbbbEjxvI582.jpg');
INSERT INTO `goods_spu_image` VALUES (11, 2, 'ba08709d17947797.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2W4E6ARoWuAAIFSu3S0c0376.jpg');
INSERT INTO `goods_spu_image` VALUES (12, 2, '21c0efce9ebff272.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2W4E6ATJQ7AAGqQykf9J0429.jpg');
INSERT INTO `goods_spu_image` VALUES (13, 2, 'c7d799230f50f3be.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2W4E6ATyAxAAJcCX9OSFI324.jpg');
INSERT INTO `goods_spu_image` VALUES (14, 2, '342af8af77b1f23f.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2W4E-AS3LSAAHx6VWbpe4757.jpg');
INSERT INTO `goods_spu_image` VALUES (15, 2, '17fd81db597cd7ec.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2W4E-ADk0JAAOC1CYNK4g458.jpg');
INSERT INTO `goods_spu_image` VALUES (16, 5, '1635fd95d6831027.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmABRhuAADJCjBtz4M830.jpg');
INSERT INTO `goods_spu_image` VALUES (17, 5, '1fc808df0fbe5813.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmAWT2uAAFhjYCzYMI427.jpg');
INSERT INTO `goods_spu_image` VALUES (18, 5, '11d712f118991744.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmAIcU4AAKWQqIomaM067.jpg');
INSERT INTO `goods_spu_image` VALUES (19, 5, '1f205ea2c708681e.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmAbkCZAAGw8f8unqs450.jpg');
INSERT INTO `goods_spu_image` VALUES (20, 5, 'd56d258b14bad253.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmAPhLhAAMVdPJFP2I201.jpg');
INSERT INTO `goods_spu_image` VALUES (21, 5, '208a374f3328c874.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XNsmAF1GJAAOYy-AZrrk972.jpg');
INSERT INTO `goods_spu_image` VALUES (22, 6, 'ba08709d17947797.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XPgyAJlzZAAIFSu3S0c0583.jpg');
INSERT INTO `goods_spu_image` VALUES (23, 6, '17fd81db597cd7ec.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XPgyAATORAAOC1CYNK4g429.jpg');
INSERT INTO `goods_spu_image` VALUES (24, 6, '21c0efce9ebff272.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XPgyAA2sYAAGqQykf9J0055.jpg');
INSERT INTO `goods_spu_image` VALUES (25, 6, '342af8af77b1f23f.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XPgyAbBjZAAHx6VWbpe4877.jpg');
INSERT INTO `goods_spu_image` VALUES (26, 6, '1e08b92f8151bc5b.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XPgyAZG-hAAEbbbEjxvI515.jpg');
INSERT INTO `goods_spu_image` VALUES (27, 6, 'c7d799230f50f3be.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2XPgyATlLaAAJcCX9OSFI302.jpg');
INSERT INTO `goods_spu_image` VALUES (28, 6, '943c1a44a16f7b77.jpg', 'http://192.168.43.96/group1/M00/00/00/wKgrYF2YCCaAHxOBAAKIuyJHR_k326.jpg');

-- ----------------------------
-- Table structure for goods_spu_info
-- ----------------------------
DROP TABLE IF EXISTS `goods_spu_info`;
CREATE TABLE `goods_spu_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'spu id',
  `brand_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌id',
  `spu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spu商品名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spu商品描述',
  `catalog3_id` bigint(20) NULL DEFAULT NULL COMMENT '三级分类id',
  `shop_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'spu商品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_spu_info
-- ----------------------------
INSERT INTO `goods_spu_info` VALUES (5, NULL, '联想(Lenovo)拯救者Y7000P', '电竞级独显，英特尔9代i7H高性能处理器', 63, '联想旗舰店');
INSERT INTO `goods_spu_info` VALUES (6, NULL, '机械革命(MECHREVO)Z2 Air', '轻薄本游戏本', 63, '机械革命旗舰店');

-- ----------------------------
-- Table structure for goods_spu_sale_attribute_info
-- ----------------------------
DROP TABLE IF EXISTS `goods_spu_sale_attribute_info`;
CREATE TABLE `goods_spu_sale_attribute_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `spu_id` bigint(20) NULL DEFAULT NULL COMMENT 'spu id',
  `sale_attribute_id` bigint(20) NULL DEFAULT NULL COMMENT '销售属性id',
  `sale_attribute_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品销售属性信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_spu_sale_attribute_info
-- ----------------------------
INSERT INTO `goods_spu_sale_attribute_info` VALUES (14, 5, 1, '容量');
INSERT INTO `goods_spu_sale_attribute_info` VALUES (15, 5, 2, '颜色');
INSERT INTO `goods_spu_sale_attribute_info` VALUES (16, 6, 1, '容量');
INSERT INTO `goods_spu_sale_attribute_info` VALUES (17, 6, 2, '颜色');

-- ----------------------------
-- Table structure for goods_spu_sale_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `goods_spu_sale_attribute_value`;
CREATE TABLE `goods_spu_sale_attribute_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `spu_id` bigint(20) NULL DEFAULT NULL COMMENT 'spu id',
  `sale_attribute_id` bigint(20) NULL DEFAULT NULL COMMENT '销售属性id',
  `sale_attribute_value_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性值名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品销售属性值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_spu_sale_attribute_value
-- ----------------------------
INSERT INTO `goods_spu_sale_attribute_value` VALUES (39, 5, 1, '512GB SSD');
INSERT INTO `goods_spu_sale_attribute_value` VALUES (40, 5, 1, '256GB SSD+1TB ');
INSERT INTO `goods_spu_sale_attribute_value` VALUES (41, 5, 2, '电竞屏');
INSERT INTO `goods_spu_sale_attribute_value` VALUES (42, 5, 2, '高色域');
INSERT INTO `goods_spu_sale_attribute_value` VALUES (43, 6, 1, '1TB SSD');
INSERT INTO `goods_spu_sale_attribute_value` VALUES (44, 6, 1, '256GB SSD+1TB');
INSERT INTO `goods_spu_sale_attribute_value` VALUES (45, 6, 2, '纯固态');
INSERT INTO `goods_spu_sale_attribute_value` VALUES (46, 6, 2, '电竞屏');

-- ----------------------------
-- Table structure for goods_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `goods_warehouse`;
CREATE TABLE `goods_warehouse`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库id',
  `sku_id` bigint(20) NOT NULL COMMENT 'sku id',
  `sku_number` bigint(20) NULL DEFAULT NULL COMMENT 'sku商品数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品仓库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_warehouse
-- ----------------------------
INSERT INTO `goods_warehouse` VALUES (1, 1, 16, 100);
INSERT INTO `goods_warehouse` VALUES (2, 1, 17, 48);
INSERT INTO `goods_warehouse` VALUES (3, 1, 18, 18);
INSERT INTO `goods_warehouse` VALUES (4, 2, 19, 27);
INSERT INTO `goods_warehouse` VALUES (5, 1, 20, 71);

-- ----------------------------
-- Table structure for pay_info
-- ----------------------------
DROP TABLE IF EXISTS `pay_info`;
CREATE TABLE `pay_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `order_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `pay_trade_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付交易编号',
  `total_amount` decimal(10, 0) NULL DEFAULT NULL COMMENT '总金额',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `sku_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `pay_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `confirm_time` datetime(0) NULL DEFAULT NULL COMMENT '确认时间',
  `callback_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调信息',
  `callback_time` datetime(0) NULL DEFAULT NULL COMMENT '回调时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_info
-- ----------------------------
INSERT INTO `pay_info` VALUES (11, 7, '201910200018023', '2019102022001466951402564648', 17776, NULL, '机械革命(MECHREVO)Z2-R 15.6英寸窄边框游戏笔记本电脑(i7-9750H 16G 512G PCIE+1T RTX2060 144Hz）', '已支付', '2019-10-19 16:26:29', NULL, '支付成功', '2019-10-19 16:37:47');
INSERT INTO `pay_info` VALUES (12, 8, '201910200042463', '2019102022001466951402775272', 8888, NULL, '机械革命(MECHREVO)Z2-R 15.6英寸窄边框游戏笔记本电脑(i7-9750H 16G 512G PCIE+1T RTX2060 144Hz）', '已支付', '2019-10-19 16:42:50', NULL, '支付成功', '2019-10-19 16:44:38');
INSERT INTO `pay_info` VALUES (13, 9, '201910200953483', '2019102022001466951402626251', 44440, 20, '机械革命(MECHREVO)Z2-R 15.6英寸窄边框游戏笔记本电脑(i7-9750H 16G 512G PCIE+1T RTX2060 144Hz）', '已支付', '2019-10-20 01:54:18', NULL, '支付成功', '2019-10-20 01:56:29');
INSERT INTO `pay_info` VALUES (14, 10, '20191021155154-2113608728', NULL, 17776, 20, '机械革命(MECHREVO)Z2-R 15.6英寸窄边框游戏笔记本电脑(i7-9750H 16G 512G PCIE+1T RTX2060 144Hz）', '未支付', '2019-10-21 07:52:07', NULL, NULL, NULL);
INSERT INTO `pay_info` VALUES (15, 11, '20191021155347-1670886265', '2019102122001466951402998230', 8888, 20, '机械革命(MECHREVO)Z2-R 15.6英寸窄边框游戏笔记本电脑(i7-9750H 16G 512G PCIE+1T RTX2060 144Hz）', '已支付', '2019-10-21 07:53:56', NULL, '支付成功', '2019-10-21 07:56:14');
INSERT INTO `pay_info` VALUES (16, 12, '20191107085049770289306', '2020041222001466951413397040', 8888, 20, '机械革命(MECHREVO)Z2-R 15.6英寸窄边框游戏笔记本电脑(i7-9750H 16G 512G PCIE+1T RTX2060 144Hz）', '已支付', '2020-04-12 09:50:18', NULL, '支付成功', '2020-04-12 10:38:28');
INSERT INTO `pay_info` VALUES (17, 12, '20191107085049770289306', '2020041222001466951413397040', 8888, 20, '机械革命(MECHREVO)Z2-R 15.6英寸窄边框游戏笔记本电脑(i7-9750H 16G 512G PCIE+1T RTX2060 144Hz）', '已支付', '2020-04-12 10:37:50', NULL, '支付成功', '2020-04-12 10:38:28');
INSERT INTO `pay_info` VALUES (18, 14, '202005091550531666895910', '2020050922001466950534564357', 8888, 20, '机械革命(MECHREVO)Z2-R 15.6英寸窄边框游戏笔记本电脑(i7-9750H 16G 512G PCIE+1T RTX2060 144Hz）', '已支付', '2020-05-09 07:51:28', NULL, '支付成功', '2020-05-09 07:52:18');
INSERT INTO `pay_info` VALUES (19, 15, '202005091716541884836792', NULL, 6666, 17, '联想(Lenovo)拯救者Y7000 2019 英特尔酷睿i5 15.6英寸游戏笔记本电脑(i5-9300H 8G 1T SSD GTX1650 72%NTSC)', '未支付', '2020-05-09 09:23:48', NULL, NULL, NULL);
INSERT INTO `pay_info` VALUES (20, 16, '202005091751241997121505', '2020050922001466950533880100', 6299, 19, '机械革命(MECHREVO)Z2 Air 15.6英寸轻薄游戏笔记本电脑(i7-9750H 8G 512G SSD GTX1650 72%高色域）', '已支付', '2020-05-09 09:51:37', NULL, '支付成功', '2020-05-09 09:52:06');
INSERT INTO `pay_info` VALUES (21, 17, '202005092104491276447422', '2020050922001466950533183689', 6299, 19, '机械革命(MECHREVO)Z2 Air 15.6英寸轻薄游戏笔记本电脑(i7-9750H 8G 512G SSD GTX1650 72%高色域）', '已支付', '2020-05-09 13:05:30', NULL, '支付成功', '2020-05-09 13:06:23');
INSERT INTO `pay_info` VALUES (22, 18, '202005092154111224216140', '2020050922001466950536083511', 6299, 19, '机械革命(MECHREVO)Z2 Air 15.6英寸轻薄游戏笔记本电脑(i7-9750H 8G 512G SSD GTX1650 72%高色域）', '已支付', '2020-05-09 13:54:45', NULL, '支付成功', '2020-05-09 13:55:23');
INSERT INTO `pay_info` VALUES (23, 19, '20200509230043-1595279560', '2020050922001466950533185468', 6299, 19, '机械革命(MECHREVO)Z2 Air 15.6英寸轻薄游戏笔记本电脑(i7-9750H 8G 512G SSD GTX1650 72%高色域）', '已支付', '2020-05-09 15:01:07', NULL, '支付成功', '2020-05-09 15:01:40');
INSERT INTO `pay_info` VALUES (24, 20, '20200510155630-1907539172', '2020051022001466950548050597', 6666, 17, '联想(Lenovo)拯救者Y7000 2019 英特尔酷睿i5 15.6英寸游戏笔记本电脑(i5-9300H 8G 1T SSD GTX1650 72%NTSC)', '已支付', '2020-05-10 10:01:37', NULL, '支付成功', '2020-05-10 10:08:54');
INSERT INTO `pay_info` VALUES (25, 20, '20200510155630-1907539172', '2020051022001466950548050597', 6666, 17, '联想(Lenovo)拯救者Y7000 2019 英特尔酷睿i5 15.6英寸游戏笔记本电脑(i5-9300H 8G 1T SSD GTX1650 72%NTSC)', '已支付', '2020-05-10 10:04:17', NULL, '支付成功', '2020-05-10 10:08:54');

-- ----------------------------
-- Table structure for service_message
-- ----------------------------
DROP TABLE IF EXISTS `service_message`;
CREATE TABLE `service_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息',
  `reply_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客服回复的用户',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '消息时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客服消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service_message
-- ----------------------------
INSERT INTO `service_message` VALUES (1, 'admin', '你好，我是主人的美女秘书，有什么事就跟我说吧，等他回来我会转告他的。face[心] face[心] face[心] \',\r\n                \'face[威武] face[威武] face[威武] face[威武]', 'fairy', '2020-04-05 11:17:17');
INSERT INTO `service_message` VALUES (2, 'fairy', '宝贝', 'admin', '2020-04-05 15:28:36');
INSERT INTO `service_message` VALUES (3, 'fairy', '我是一个Java开发工程师', 'admin', '2020-04-05 15:30:46');
INSERT INTO `service_message` VALUES (4, 'fairy', '宝贝宝贝', 'admin', '2020-04-06 00:43:50');
INSERT INTO `service_message` VALUES (5, 'fairy', '洗澡中，请勿打扰face[哈哈] ', 'admin', '2020-04-06 00:43:51');
INSERT INTO `service_message` VALUES (6, 'fairy', '宝贝', 'admin', '2020-04-06 00:46:21');
INSERT INTO `service_message` VALUES (7, 'fairy', '你要和我说话？你真的要和我说话？你确定自己想说吗？你一定非说不可吗？那你说吧，这是自动回复。', 'admin', '2020-04-06 00:46:21');
INSERT INTO `service_message` VALUES (8, 'fairy', '我很强', 'admin', '2020-04-06 00:51:21');
INSERT INTO `service_message` VALUES (9, 'admin', 'face[威武] face[威武] face[威武] face[威武] ', 'fairy', '2020-04-06 00:51:21');
INSERT INTO `service_message` VALUES (10, 'fairy', '宝贝', 'admin', '2020-04-06 01:11:04');
INSERT INTO `service_message` VALUES (11, 'admin', '你要和我说话？你真的要和我说话？你确定自己想说吗？你一定非说不可吗？那你说吧，这是自动回复。', 'fairy', '2020-04-06 01:11:04');
INSERT INTO `service_message` VALUES (12, 'fairy', '嘿嘿', 'admin', '2020-04-06 01:14:34');
INSERT INTO `service_message` VALUES (13, 'admin', '您好，我现在有事不在，一会再和您联系。', 'fairy', '2020-04-06 01:14:34');
INSERT INTO `service_message` VALUES (14, 'fairy', '1111', 'admin', '2020-05-09 02:17:49');
INSERT INTO `service_message` VALUES (15, 'admin', '你好，我是主人的美女秘书，有什么事就跟我说吧，等他回来我会转告他的。face[心] face[心] face[心] ', 'fairy', '2020-05-09 02:17:53');
INSERT INTO `service_message` VALUES (18, 'admin', '21432', 'admin', '2020-05-10 06:03:09');
INSERT INTO `service_message` VALUES (19, 'fairy', '你好，我是主人的美女秘书，有什么事就跟我说吧，等他回来我会转告他的。face[心] face[心] face[心] ', 'admin', '2020-05-10 06:03:11');

-- ----------------------------
-- Table structure for user_admin_info
-- ----------------------------
DROP TABLE IF EXISTS `user_admin_info`;
CREATE TABLE `user_admin_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `higher_authority` int(255) NULL DEFAULT 0 COMMENT '是否拥有管理员以上的权力',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `status` bigint(20) NULL DEFAULT 1 COMMENT '帐号启用状态：0禁用；1启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_admin_info
-- ----------------------------
INSERT INTO `user_admin_info` VALUES (1, 'admin', '123456', '999999', 1, '11', '666@qq.com', '小帅哥', 'CEO', '2019-09-23 12:51:30', '2019-09-25 12:51:34', 1);
INSERT INTO `user_admin_info` VALUES (2, 'xiaoguaiguai', '132456', '13984345', 0, '22', '123@qq.com', '小乖乖', '总裁', '2019-09-24 12:55:23', '2019-09-25 12:55:28', 1);

-- ----------------------------
-- Table structure for user_common_info
-- ----------------------------
DROP TABLE IF EXISTS `user_common_info`;
CREATE TABLE `user_common_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_grade_id` int(20) NULL DEFAULT 1 COMMENT '会员id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `status` bigint(20) NULL DEFAULT 1 COMMENT '帐号启用状态:0禁用，1启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` bigint(20) NULL DEFAULT 1 COMMENT '性别：1女，2男，0未知',
  `birthday` date NULL DEFAULT NULL COMMENT '出生生日',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所做城市',
  `job` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业',
  `personalized_signature` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `source_type` bigint(20) NULL DEFAULT NULL COMMENT '用户来源1本网站，2QQ，3微信，4微博',
  `integral` bigint(20) NULL DEFAULT 0 COMMENT '积分',
  `growth` bigint(20) NULL DEFAULT 0 COMMENT '成长值',
  `lucky_count` bigint(20) NULL DEFAULT 0 COMMENT '剩余抽奖次数',
  `history_integral` bigint(20) NULL DEFAULT 0 COMMENT '历史积分数量',
  `access_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录认证信息',
  `source_uid` bigint(255) NULL DEFAULT NULL COMMENT '第三方登录id',
  `access_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方授权码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_name`(`user_name`) USING BTREE,
  UNIQUE INDEX `idx_phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '普通用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_common_info
-- ----------------------------
INSERT INTO `user_common_info` VALUES (1, 1, 'SmallLovely', '123456', '小可爱', '123456789', 1, '2019-10-08 17:03:49', NULL, 1, '2019-09-11', '重庆', 'Java工程师', '我是一个可爱Java高级工程师', 1, 0, 0, 0, 0, '', NULL, '');
INSERT INTO `user_common_info` VALUES (2, 3, 'fairy', 'fICz0kFbHVc=', '小仙女', '18315262016', 1, '2019-10-08 17:03:49', NULL, 1, '2019-09-11', '重庆', 'Java工程师', '我是一个美丽Java高级工程师', 1, 0, 0, 0, 0, '', NULL, '');
INSERT INTO `user_common_info` VALUES (3, 1, '6087596391', NULL, '6087596391', '18315261391', 1, '2019-10-08 17:23:33', 'http://192.168.43.96/group1/M00/00/01/wKgrYF603-iAZodcAAiVaLFyuvA036.png', 2, NULL, '重庆', 'Java开发工程师', '', 4, 134828, 13472, 0, 0, '2.00ZuvydGClYQ5B09fa89a250I6t2uD', 6087596391, 'dd0015ae00d2d5d4ab27b075682e4a15');
INSERT INTO `user_common_info` VALUES (4, 1, '小可爱', 'w/3aB7dPcEtPuyl1F0XOKA==', NULL, '15635264852', 0, '2019-10-24 09:59:32', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_dealer_info
-- ----------------------------
DROP TABLE IF EXISTS `user_dealer_info`;
CREATE TABLE `user_dealer_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_grade_id` int(20) UNSIGNED NOT NULL COMMENT '用户等级id',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话',
  `status` bigint(20) NULL DEFAULT 1 COMMENT '0禁用，1启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` bigint(1) NOT NULL DEFAULT 1 COMMENT '1女，2男',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在城市',
  `job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业',
  `personalized_signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `id_card_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号码',
  `id_card_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '身份证照片地址',
  `business_license` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '营业执照',
  `integral` bigint(20) NULL DEFAULT 0 COMMENT '积分',
  `growth` bigint(20) NULL DEFAULT 0 COMMENT '成长值',
  `lucky_count` bigint(20) NULL DEFAULT 0 COMMENT '抽奖次数',
  `history_integral` bigint(20) NULL DEFAULT 0 COMMENT '历史积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_dealer_info
-- ----------------------------
INSERT INTO `user_dealer_info` VALUES (1, 2, 'fairy', '123456', '小仙女', '5555', 1, '2019-09-22 20:14:16', 'http://tva1.sinaimg.cn/crop.0.23.1242.1242.180/8693225ajw8fbimjimpjwj20yi0zs77l.jpg', 1, '2019-09-14', '重庆', '学生', '我是一个漂亮的小仙女', '123456464631132', '', '1231545215', 0, 0, 0, 0);
INSERT INTO `user_dealer_info` VALUES (2, 2, 'SmallLovely', '123456', '小可爱', '1346456', 1, '2019-09-25 12:56:44', 'http://tva2.sinaimg.cn/crop.0.0.640.640.180/648fbe5ejw8ethmg0u9egj20hs0ht0tn.jpg', 1, '2019-09-25', '重庆', '学生', '我是一个小可爱', '1345312351355', '', '3245343123', 0, 0, 0, 0);

-- ----------------------------
-- Table structure for user_grade
-- ----------------------------
DROP TABLE IF EXISTS `user_grade`;
CREATE TABLE `user_grade`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `growth_point` int(11) NULL DEFAULT NULL COMMENT '增长值',
  `free_freight_norm` bigint(10) NULL DEFAULT NULL COMMENT '免运费标准',
  `comment_gain_growth_value` int(11) NULL DEFAULT NULL COMMENT '每次评价获取的成长值',
  `privilege_free_freight` int(1) NULL DEFAULT NULL COMMENT '是否有免邮特权',
  `privilege_sign_in` int(1) NULL DEFAULT NULL COMMENT '是否有签到特权',
  `privilege_comment` int(1) NULL DEFAULT NULL COMMENT '是否有评论获奖励特权',
  `privilege_promotion` int(1) NULL DEFAULT NULL COMMENT '是否有专享活动特权',
  `privilege_member_price` int(1) NULL DEFAULT NULL COMMENT '是否有会员价格特权',
  `privilege_birthday` int(1) NULL DEFAULT NULL COMMENT '是否有生日特权',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员等级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_grade
-- ----------------------------
INSERT INTO `user_grade` VALUES (1, '白银会员', 10, 10, 5, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `user_grade` VALUES (2, '黄金会员', 10, 10, 5, 1, 1, 0, 0, 0, 0, NULL);
INSERT INTO `user_grade` VALUES (3, '铂金会员', 20, 10, 5, 1, 1, 1, 0, 0, 0, NULL);

-- ----------------------------
-- Table structure for user_shipping_address
-- ----------------------------
DROP TABLE IF EXISTS `user_shipping_address`;
CREATE TABLE `user_shipping_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `nick_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `phone` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话',
  `is_default` int(1) NULL DEFAULT 0 COMMENT '是否默认：1默认，0不默认',
  `post_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `region` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县',
  `detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户收货地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_shipping_address
-- ----------------------------
INSERT INTO `user_shipping_address` VALUES (1, 2, 'fairy', '小仙女', '666666', 0, '4399', '重庆市', '重庆市', '合川区', '合阳街道9号');
INSERT INTO `user_shipping_address` VALUES (2, 3, NULL, '6087596391', '13351122', 1, '6666', '重庆市', '重庆市', '合川区', '合阳街道9号');
INSERT INTO `user_shipping_address` VALUES (3, 3, NULL, '6087596391', '13351122', 0, '9999', '重庆市', '重庆市', '江北区', '红旗街道9号');
INSERT INTO `user_shipping_address` VALUES (4, 3, '6087596391', '小仙女', '18315261391', NULL, '40520', '重庆市', '重庆市', '合川区', '合阳街道10号');
INSERT INTO `user_shipping_address` VALUES (5, 3, '6087596391', '6087596391', '18315261391', NULL, '40520', '重庆市', '重庆市', '合川区', '合阳街道11号');
INSERT INTO `user_shipping_address` VALUES (6, 3, '6087596391', '6087596391', '18315261391', 0, '40520', '重庆市', '重庆市', '合川区', '合阳街道12号');
INSERT INTO `user_shipping_address` VALUES (19, 3, '6087596391', '6087596391', '18315261391', 0, '40520', '重庆市', '重庆市', '合川区', '合阳街道999号');
INSERT INTO `user_shipping_address` VALUES (20, 3, '6087596391', '6087596391', '18315261391', 0, '40520', '重庆市', '重庆市', '合川区', '合阳街道6号');

-- ----------------------------
-- Table structure for warehouse_info
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_info`;
CREATE TABLE `warehouse_info`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `warehouse_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '仓库名称',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库地址',
  `warehouse_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '仓库信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warehouse_info
-- ----------------------------
INSERT INTO `warehouse_info` VALUES (1, '1号仓库', '重庆', '100001');
INSERT INTO `warehouse_info` VALUES (2, '2号仓库', '北京', '100002');

-- ----------------------------
-- Table structure for warehouse_out_storage
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_out_storage`;
CREATE TABLE `warehouse_out_storage`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '仓库id',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `sku_number` bigint(20) NULL DEFAULT NULL COMMENT '出库数量',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '出库日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '出库列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warehouse_out_storage
-- ----------------------------
INSERT INTO `warehouse_out_storage` VALUES (1, NULL, 17, 1, '2020-05-10 10:08:51');
INSERT INTO `warehouse_out_storage` VALUES (2, NULL, 17, 1, '2020-05-10 10:08:55');

-- ----------------------------
-- Table structure for warehouse_storage
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_storage`;
CREATE TABLE `warehouse_storage`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '仓库id',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `sku_number` bigint(20) NULL DEFAULT NULL COMMENT '商品入库数量',
  `provider` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商',
  `provider_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商地址',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品入库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warehouse_storage
-- ----------------------------
INSERT INTO `warehouse_storage` VALUES (1, 2, 18, 1, '宣宣集团', '重庆市渝中区', '2020-04-06 11:33:06');
INSERT INTO `warehouse_storage` VALUES (2, 2, 18, 10, '宣宣集团', '重庆市渝中区', '2020-04-06 03:33:52');
INSERT INTO `warehouse_storage` VALUES (3, 1, 18, 5, '宣宣集团', '重庆市渝中区', '2020-04-06 03:35:33');
INSERT INTO `warehouse_storage` VALUES (4, 1, 18, 2, '宣宣集团', '重庆市渝中区', '2020-04-06 03:39:16');

SET FOREIGN_KEY_CHECKS = 1;
