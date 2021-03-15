/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50643
 Source Host           : localhost:3306
 Source Schema         : verio

 Target Server Type    : MySQL
 Target Server Version : 50643
 File Encoding         : 65001

 Date: 15/03/2021 11:31:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '反馈标题',
  `content` varchar(1000) NOT NULL COMMENT '反馈内容',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `status` int(4) NOT NULL COMMENT '处理状态：0待处理，1已处理',
  `reply` varchar(1000) DEFAULT NULL COMMENT '回复内容',
  `contact_name` varchar(100) DEFAULT NULL COMMENT '联系人姓名',
  `contact_email` varchar(100) DEFAULT NULL COMMENT '联系人邮箱',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `t_feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_feedback_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_feedback
-- ----------------------------
BEGIN;
INSERT INTO `t_feedback` VALUES (1, '2021-03-14 13:48:47', '标题标题标题标题', '2222', 1001, 1, NULL, '张先生', '8888@qq.com');
INSERT INTO `t_feedback` VALUES (2, '2021-03-14 13:48:47', '标题标题标题标题', '内容内容内容内容', 1001, 0, NULL, '张先生', '8888@qq.com');
INSERT INTO `t_feedback` VALUES (3, '2021-03-14 13:48:47', '标题标题标题标题', '内容内容内容内容', 1001, 1, '好的！！！', '张先生', '8888@qq.com');
INSERT INTO `t_feedback` VALUES (4, '2021-03-14 13:48:47', '标题标题标题标题', '内容内容内容内容', 1001, 1, '谢谢反馈，已经解决了', '张先生', '8888@qq.com');
INSERT INTO `t_feedback` VALUES (6, '2021-03-14 19:58:52', '测试反馈一下', '测试反馈一下测试反馈一下测试反馈一下测试反馈一下测试反馈一下', 1005, 1, 'OK！', '周韵', 'zhouyu@qq.com');
COMMIT;

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `user_id` bigint(20) NOT NULL COMMENT '房东用户ID',
  `rent_type` varchar(20) NOT NULL COMMENT '出租类型：整租whole/ 合租share',
  `title` varchar(200) NOT NULL COMMENT '房屋名称',
  `content` text COMMENT '详细描述内容',
  `city` varchar(100) NOT NULL COMMENT '城市名称',
  `address` varchar(200) DEFAULT NULL COMMENT '详细地址，具体门牌号',
  `thumbnail_url` varchar(200) DEFAULT NULL COMMENT '缩略图URL',
  `slide_url` varchar(1000) DEFAULT NULL COMMENT '轮播图URL',
  `month_rent` int(11) NOT NULL COMMENT '月租金额',
  `status` int(4) NOT NULL DEFAULT '1' COMMENT '0未租出，1已租出，,-1已下架,-2待审核，-3审核不通过',
  `certificate_no` varchar(50) NOT NULL COMMENT '房产证号',
  `toilet_num` int(11) NOT NULL COMMENT '卫生间数量',
  `kitchen_num` int(11) NOT NULL COMMENT '厨房数量',
  `living_room_num` int(11) NOT NULL COMMENT '客厅数量',
  `bedroom_num` int(11) NOT NULL COMMENT '卧室数量',
  `has_air_conditioner` int(11) NOT NULL COMMENT '是否有空调，1有，0无',
  `area` decimal(10,2) NOT NULL COMMENT '面积',
  `floor` int(11) NOT NULL COMMENT '当前所在楼层数',
  `max_floor` int(11) NOT NULL COMMENT '房子最大楼层数',
  `has_elevator` int(11) NOT NULL COMMENT '是否有电梯',
  `build_year` int(11) NOT NULL COMMENT '建成年份',
  `direction` varchar(20) DEFAULT NULL COMMENT '朝向',
  `last_order_start_time` datetime DEFAULT NULL COMMENT '上次开始入住时间',
  `last_order_end_time` datetime DEFAULT NULL COMMENT '上次结束入住时间',
  `longitude_latitude` varchar(100) DEFAULT NULL COMMENT '经纬度',
  `contact_name` varchar(100) DEFAULT NULL COMMENT '联系人姓名',
  `contact_phone` varchar(100) DEFAULT NULL COMMENT '联系人手机',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  CONSTRAINT `t_house_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_house
-- ----------------------------
BEGIN;
INSERT INTO `t_house` VALUES (1, '2021-03-15 19:40:07', 1000, 'share', '合租-世界花园-4居室-A卧', '优质好房，欢迎入住！！！', '北京', '广东省深圳市南山区世界之窗世纪花园小区12栋305室A卧', '/uploads/f73c9a99609345fba643e8106dea6b4e.png', '[\"/uploads/f73c9a99609345fba643e8106dea6b4e.png\",\"/uploads/bbede939735448a4a39ff285be7c51a1.png\",\"/uploads/2f0c72b03587446582d2afa629f9465d.png\",\"/uploads/abb9f46c32314ce78cbe7491f66df628.png\",\"/uploads/0b7fdd26b1094e30bace755f22b84f51.png\"]', 2500, 1, '1000000000', 1, 1, 1, 4, 1, 25.00, 3, 30, 1, 2010, '朝南', NULL, NULL, '113.978951,22.545783', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (2, '2021-03-15 19:40:07', 1000, 'share', '合租-世界花园-4居室-B卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区世界之窗世纪花园小区12栋305室B卧', '/assets/img/indoors/3.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2200, 0, '1000000000', 1, 1, 1, 4, 1, 22.00, 3, 30, 1, 2010, '朝南', '2021-03-15 11:06:32', '2025-03-15 00:00:00', '113.978951,22.545783', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (3, '2021-03-15 19:40:07', 1000, 'share', '合租-世界花园-4居室-C卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区世界之窗世纪花园小区12栋305室C卧', '/assets/img/indoors/4.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 3000, 1, '1000000000', 1, 1, 1, 4, 1, 30.00, 3, 30, 1, 2010, '朝北', NULL, NULL, '113.978951,22.545783', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (4, '2021-03-15 19:40:07', 1000, 'share', '合租-世界花园-4居室-D卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区世界之窗世纪花园小区12栋305室D卧', '/assets/img/indoors/5.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 1800, 0, '1000000000', 1, 1, 1, 4, 1, 18.00, 3, 30, 1, 2010, '朝西', '2021-03-15 10:55:54', '2023-10-27 00:00:00', '113.978951,22.545783', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (11, '2021-03-13 19:40:07', 1000, 'share', '合租-龙城西苑-4居室-A卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区科技园南龙城新苑小区12栋305室A卧', '/assets/img/indoors/6.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 3000, 1, '1000000001', 1, 1, 1, 4, 1, 30.00, 3, 30, 1, 2010, '朝东', NULL, NULL, '113.933216,22.524803', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (12, '2021-03-13 19:40:07', 1000, 'share', '合租-龙城西苑-4居室-B卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区科技园南龙城新苑小区12栋305室B卧', '/assets/img/indoors/1.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2800, 1, '1000000001', 1, 1, 1, 4, 1, 28.00, 3, 30, 1, 2010, '朝北', NULL, NULL, '113.933216,22.524803', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (13, '2021-03-13 19:40:07', 1000, 'share', '合租-龙城西苑-4居室-C卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区科技园南龙城新苑小区12栋305室C卧', '/assets/img/indoors/2.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2600, 1, '1000000001', 1, 1, 1, 4, 1, 26.00, 3, 30, 1, 2010, '朝西', NULL, NULL, '113.933216,22.524803', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (14, '2021-03-13 19:40:07', 1000, 'share', '合租-龙城西苑-4居室-D卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区科技园南龙城新苑小区12栋305室D卧', '/assets/img/indoors/3.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2400, 1, '1000000001', 1, 1, 1, 4, 1, 24.00, 3, 30, 1, 2010, '朝南', NULL, NULL, '113.933216,22.524803', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (21, '2021-03-13 19:40:07', 1000, 'share', '合租-金众小区-4居室-A卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区金众小区12栋305室A卧', '/assets/img/indoors/4.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 3000, 1, '1000000002', 1, 1, 1, 4, 1, 30.00, 3, 30, 1, 2010, '朝东', NULL, NULL, '114.01862,22.543646', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (22, '2021-03-13 19:40:07', 1000, 'share', '合租-金众小区-4居室-B卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区金众小区12栋305室B卧', '/assets/img/indoors/5.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2800, 1, '1000000002', 1, 1, 1, 4, 1, 28.00, 3, 30, 1, 2010, '朝北', NULL, NULL, '114.01862,22.543646', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (23, '2021-03-13 19:40:07', 1000, 'share', '合租-金众小区-4居室-C卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区金众小区12栋305室C卧', '/assets/img/indoors/6.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2600, 1, '1000000002', 1, 1, 1, 4, 1, 26.00, 3, 30, 1, 2010, '朝西', NULL, NULL, '114.01862,22.543646', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (24, '2021-03-13 19:40:07', 1000, 'share', '合租-金众小区4居室-D卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区金众小区12栋305室D卧', '/assets/img/indoors/1.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2400, 1, '1000000002', 1, 1, 1, 4, 1, 24.00, 3, 30, 1, 2010, '朝南', NULL, NULL, '114.01862,22.543646', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (31, '2021-03-13 19:40:07', 1000, 'share', '合租-椰树花园-4居室-A卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区金众小区12栋305室A卧', '/assets/img/indoors/2.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 3000, 1, '1000000003', 1, 1, 1, 4, 1, 30.00, 3, 30, 1, 2010, '朝东', NULL, NULL, '114.044645,22.531124', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (32, '2021-03-13 19:40:07', 1000, 'share', '合租-椰树花园-4居室-B卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区金众小区12栋305室B卧', '/assets/img/indoors/3.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2800, 1, '1000000003', 1, 1, 1, 4, 1, 28.00, 3, 30, 1, 2010, '朝北', NULL, NULL, '114.044645,22.531124', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (33, '2021-03-13 19:40:07', 1000, 'share', '合租-椰树花园-4居室-C卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区金众小区12栋305室C卧', '/assets/img/indoors/4.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2600, 1, '1000000003', 1, 1, 1, 4, 1, 26.00, 3, 30, 1, 2010, '朝西', NULL, NULL, '114.044645,22.531124', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (34, '2021-03-13 19:40:07', 1000, 'share', '合租-椰树花园4居室-D卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区金众小区12栋305室D卧', '/assets/img/indoors/5.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2400, 1, '1000000003', 1, 1, 1, 4, 1, 24.00, 3, 30, 1, 2010, '朝南', NULL, NULL, '114.044645,22.531124', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (41, '2021-03-13 19:40:07', 1000, 'share', '合租-竹园小区-4居室-A卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区竹园小区12栋305室A卧', '/assets/img/indoors/6.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 3000, 1, '1000000004', 1, 1, 1, 4, 1, 30.00, 3, 30, 1, 2010, '朝东', NULL, NULL, '114.022414,22.545682', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (42, '2021-03-13 19:40:07', 1000, 'share', '合租-竹园小区-4居室-B卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区竹园小区12栋305室B卧', '/assets/img/indoors/1.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2800, 0, '1000000004', 1, 1, 1, 4, 1, 28.00, 3, 30, 1, 2010, '朝北', '2021-03-14 19:48:40', '2021-04-02 00:00:00', '114.022414,22.545682', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (43, '2021-03-13 19:40:07', 1000, 'share', '合租-竹园小区-4居室-C卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区竹园小区12栋305室C卧', '/assets/img/indoors/2.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2600, 1, '1000000004', 1, 1, 1, 4, 1, 26.00, 3, 30, 1, 2010, '朝西', NULL, NULL, '114.022414,22.545682', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (44, '2021-03-13 19:40:07', 1000, 'share', '合租-竹园小区-4居室-D卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区竹园小区12栋305室D卧', '/assets/img/indoors/3.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2400, 0, '1000000004', 1, 1, 1, 4, 1, 24.00, 3, 30, 1, 2010, '朝南', '2021-03-14 19:51:54', '2022-04-30 00:00:00', '114.022414,22.545682', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (100, '2021-03-13 20:07:47', 1000, 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头桃苑公寓12栋602室', '/assets/img/indoors/5.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 8800, 1, '1000000020', 1, 1, 1, 3, 1, 110.00, 6, 35, 1, 2007, '朝北', NULL, NULL, '113.930485,22.534048', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (101, '2021-03-13 20:07:47', 1000, 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头桃苑公寓11栋601室', '/assets/img/indoors/6.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 8800, 1, '1000000021', 1, 1, 1, 3, 1, 110.00, 6, 35, 1, 2007, '朝北', NULL, NULL, '113.930485,22.534048', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (102, '2021-03-13 20:07:47', 1000, 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头桃苑公寓12栋602室', '/assets/img/indoors/1.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 8800, 1, '1000000022', 1, 1, 1, 3, 1, 110.00, 6, 35, 1, 2007, '朝北', NULL, NULL, '113.930485,22.534048', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (103, '2021-03-13 20:07:47', 1000, 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头桃苑公寓11栋603室', '/assets/img/indoors/2.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 8800, 1, '1000000023', 1, 1, 1, 3, 1, 110.00, 6, 35, 1, 2007, '朝北', NULL, NULL, '113.930485,22.534048', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (104, '2021-03-13 20:07:47', 1000, 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头桃苑公寓12栋604室', '/assets/img/indoors/3.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 8800, 1, '1000000020', 1, 1, 1, 3, 1, 110.00, 6, 35, 1, 2007, '朝北', NULL, NULL, '113.930485,22.534048', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (105, '2021-03-13 20:07:47', 1000, 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头桃苑公寓11栋605室', '/assets/img/indoors/4.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 8800, 1, '1000000021', 1, 1, 1, 3, 1, 110.00, 6, 35, 1, 2007, '朝北', NULL, NULL, '113.930485,22.534048', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (106, '2021-03-13 20:07:47', 1000, 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头桃苑公寓12栋606室', '/assets/img/indoors/5.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 8800, 1, '1000000022', 1, 1, 1, 3, 1, 110.00, 6, 35, 1, 2007, '朝北', NULL, NULL, '113.930485,22.534048', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (107, '2021-03-13 20:07:47', 1000, 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头桃苑公寓11栋607室', '/assets/img/indoors/6.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 8800, 1, '1000000023', 1, 1, 1, 3, 1, 110.00, 6, 35, 1, 2007, '朝北', NULL, NULL, '113.930485,22.534048', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (110, '2021-03-13 20:07:47', 1000, 'whole', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头泰安轩12栋501', '/assets/img/indoors/3.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 4800, 1, '1000000020', 1, 1, 1, 3, 1, 120.00, 5, 35, 1, 2012, '朝北', NULL, NULL, '114.031235,22.540339', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (111, '2021-03-13 20:07:47', 1000, 'whole', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头泰安轩12栋502', '/assets/img/indoors/4.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 9800, 1, '1000000021', 1, 1, 1, 3, 1, 120.00, 5, 35, 1, 2012, '朝北', NULL, NULL, '114.031235,22.540339', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (112, '2021-03-13 20:07:47', 1000, 'whole', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头泰安轩12栋503', '/assets/img/indoors/5.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 9800, 1, '1000000022', 1, 1, 1, 3, 1, 120.00, 5, 35, 1, 2012, '朝北', '2021-03-14 18:43:36', '2021-03-14 21:36:34', '114.031235,22.540339', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (113, '2021-03-13 20:07:47', 1000, 'whole', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头泰安轩12栋504', '/assets/img/indoors/6.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 9800, 1, '1000000023', 1, 1, 1, 3, 1, 120.00, 5, 35, 1, 2012, '朝北', NULL, NULL, '114.031235,22.540339', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (114, '2021-03-13 20:07:47', 1000, 'whole', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头泰安轩12栋505', '/assets/img/indoors/1.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 9800, 1, '1000000020', 1, 1, 1, 3, 1, 120.00, 5, 35, 1, 2012, '朝北', NULL, NULL, '114.031235,22.540339', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (116, '2021-03-13 20:07:47', 1000, 'whole', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头泰安轩12栋507', '/assets/img/indoors/3.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 8800, -1, '1000000022', 1, 1, 1, 3, 1, 120.00, 5, 35, 1, 2012, '朝北', NULL, NULL, '114.031235,22.540339', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (117, '2021-03-13 20:07:47', 1000, 'whole', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头泰安轩12栋508', '/assets/img/indoors/4.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 9800, 0, '1000000023', 1, 1, 1, 3, 1, 120.00, 5, 35, 1, 2012, '朝北', '2021-03-15 10:52:13', '2025-04-05 00:00:00', '114.031235,22.540339', '马先生', '13512344322');
INSERT INTO `t_house` VALUES (120, '2021-03-15 19:40:07', 1000, 'whole', '整租-世界花园-三室一厅', '优质好房，欢迎入住！！！', '北京', '广东省深圳市南山区南头泰安轩12栋308', '/uploads/6c70130b9a504744bd7700de6799da6c.png', '[\"/uploads/7092b27328764dee89c67dbd329eac68.png\",\"/uploads/3e63ed582ef74b6294fa1f2e1028396f.png\",\"/uploads/5b0c872bf1ad4427b7a95546426c2ded.png\",\"/uploads/7792477a4b2e4d459c763a670809934d.png\",\"/uploads/6c70130b9a504744bd7700de6799da6c.png\"]', 8000, -2, '1000000088', 1, 1, 1, 3, 1, 88.00, 3, 30, 1, 2010, '朝南', '2021-03-15 10:34:18', '2021-03-15 10:34:42', '113.978951,22.545783', '马先生', '13512344322');
COMMIT;

-- ----------------------------
-- Table structure for t_mark
-- ----------------------------
DROP TABLE IF EXISTS `t_mark`;
CREATE TABLE `t_mark` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `house_id` bigint(20) NOT NULL COMMENT '房子ID',
  PRIMARY KEY (`id`),
  KEY `house_id` (`house_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `t_mark_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `t_house` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_mark_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mark
-- ----------------------------
BEGIN;
INSERT INTO `t_mark` VALUES (2, '2021-03-14 13:39:52', 1001, 42);
INSERT INTO `t_mark` VALUES (3, '2021-03-14 18:14:42', 1001, 116);
INSERT INTO `t_mark` VALUES (4, '2021-03-14 19:58:03', 1005, 43);
INSERT INTO `t_mark` VALUES (5, '2021-03-14 19:58:09', 1005, 34);
INSERT INTO `t_mark` VALUES (6, '2021-03-15 10:32:01', 1, 120);
INSERT INTO `t_mark` VALUES (7, '2021-03-15 10:52:39', 1003, 111);
INSERT INTO `t_mark` VALUES (8, '2021-03-15 10:52:42', 1003, 41);
COMMIT;

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `summary` varchar(1000) NOT NULL COMMENT '摘要',
  `content` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
BEGIN;
INSERT INTO `t_news` VALUES (2, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (3, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (4, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (5, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (6, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (7, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (8, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (9, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (10, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (11, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (12, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (13, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (14, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (15, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (16, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
COMMIT;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `customer_user_id` bigint(20) NOT NULL COMMENT '租客用户ID',
  `owner_user_id` bigint(20) NOT NULL COMMENT '房东用户ID',
  `status` int(4) NOT NULL COMMENT '订单状态：-2待签合同，-1待付款，0生效中，1已到期，-3租客已取消',
  `house_id` bigint(20) NOT NULL COMMENT '房子ID',
  `month_rent` int(11) NOT NULL COMMENT '月租金',
  `day_num` int(11) NOT NULL COMMENT '租住月数',
  `total_amount` int(11) NOT NULL COMMENT '总金额',
  `start_date` datetime DEFAULT NULL COMMENT '开始日期',
  `end_date` datetime DEFAULT NULL COMMENT '结束日期',
  PRIMARY KEY (`id`),
  KEY `owner_user_id` (`owner_user_id`) USING BTREE,
  KEY `customer_user_id` (`customer_user_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`owner_user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`customer_user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
BEGIN;
INSERT INTO `t_order` VALUES (1, '2021-03-14 18:16:29', 1001, 1000, -2, 116, 8800, 31, 9083, '2021-03-14 18:16:29', '2021-04-14 00:00:00');
INSERT INTO `t_order` VALUES (2, '2021-03-14 18:16:59', 1001, 1000, -2, 112, 9800, 20, 6520, '2021-03-14 18:16:59', '2021-04-03 00:00:00');
INSERT INTO `t_order` VALUES (3, '2021-03-14 18:17:24', 1001, 1000, -3, 113, 9800, 18, 5868, '2021-03-14 18:17:24', '2021-04-01 00:00:00');
INSERT INTO `t_order` VALUES (4, '2021-03-14 18:30:45', 1001, 1000, -2, 112, 9800, 18, 5868, '2021-03-14 18:30:45', '2021-04-01 00:00:00');
INSERT INTO `t_order` VALUES (5, '2021-03-14 18:30:47', 1001, 1000, -1, 112, 9800, 18, 5868, '2021-03-14 18:30:47', '2021-04-01 00:00:00');
INSERT INTO `t_order` VALUES (6, '2021-03-14 18:43:36', 1001, 1000, 1, 112, 9800, 0, 0, '2021-03-14 18:43:36', '2021-03-14 21:36:34');
INSERT INTO `t_order` VALUES (7, '2021-03-14 19:48:40', 1001, 1000, 0, 42, 2800, 19, 1767, '2021-03-14 19:48:40', '2021-04-02 00:00:00');
INSERT INTO `t_order` VALUES (8, '2021-03-14 19:51:54', 1005, 1000, 0, 44, 2400, 412, 32960, '2021-03-14 19:51:54', '2022-04-30 00:00:00');
INSERT INTO `t_order` VALUES (9, '2021-03-15 10:34:18', 1001, 1, 1, 120, 8000, 0, 0, '2021-03-15 10:34:18', '2021-03-15 10:34:42');
INSERT INTO `t_order` VALUES (10, '2021-03-15 10:52:13', 1003, 1000, 0, 117, 9800, 1482, 483132, '2021-03-15 10:52:13', '2025-04-05 00:00:00');
INSERT INTO `t_order` VALUES (11, '2021-03-15 10:55:54', 1006, 1000, 0, 4, 1800, 956, 57360, '2021-03-15 10:55:54', '2023-10-27 00:00:00');
INSERT INTO `t_order` VALUES (12, '2021-03-15 11:06:32', 1004, 1000, 0, 2, 2200, 1461, 106653, '2021-03-15 11:06:32', '2025-03-15 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime NOT NULL COMMENT '注册时间',
  `user_name` varchar(30) NOT NULL COMMENT '用户名/账号',
  `user_display_name` varchar(30) NOT NULL COMMENT '姓名',
  `phone` varchar(20) NOT NULL COMMENT '手机号',
  `email` varchar(20) NOT NULL COMMENT '电子邮箱',
  `user_pass` varchar(100) NOT NULL COMMENT '密码',
  `id_card` varchar(30) DEFAULT NULL COMMENT '身份证',
  `user_avatar` varchar(100) DEFAULT NULL COMMENT '头像',
  `user_desc` varchar(200) DEFAULT NULL COMMENT '个人描述',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '状态：1正常，0禁用',
  `role` varchar(20) NOT NULL COMMENT '角色，管理员admin/房东owner/租客customer',
  `sex` varchar(20) DEFAULT NULL COMMENT '性别',
  `hobby` varchar(200) DEFAULT NULL COMMENT '业务爱好',
  `job` varchar(100) DEFAULT NULL COMMENT '职业',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES (1, '2021-03-13 19:34:54', 'admin', '管理员', '13512344321', '847064370@qq.com', '123456', '1111111', '/assets/img/default-avatar.jpg', '我是管理员用户哦，服务大家', 0, 'admin', '男', '游泳,跑步', '互联网/计算机');
INSERT INTO `t_user` VALUES (1000, '2021-03-13 19:34:54', 'mayun', '马昀', '13512344322', '847064370@qq.com', '123456', '1111111222', '/assets/img/default-avatar.jpg', '我是马芸，不是那个马云哦，我是一个房东', 0, 'owner', '男', '游泳,跑步', '互联网/计算机');
INSERT INTO `t_user` VALUES (1001, '2021-03-13 19:34:54', 'zhangsan', '张三', '13512224322', '847064370@qq.com', '123456', '11111111222', '/assets/img/default-avatar.jpg', '我是张三，一个在找房子的年轻人', 0, 'customer', '男', '游泳,跑步', '互联网/计算机');
INSERT INTO `t_user` VALUES (1002, '2021-03-14 09:35:16', 'hanxin2', '韩信', '13512341234', '847064370@qq.com', '123456', NULL, '/assets/img/default-avatar.jpg', NULL, 0, 'customer', '男', '游泳,跑步', '互联网/计算机');
INSERT INTO `t_user` VALUES (1003, '2021-03-14 19:49:37', 'lisi', '李四', '13412346789', '847064370@qq.com', '123456', NULL, '/assets/img/default-avatar.jpg', NULL, 0, 'customer', '男', '游泳,跑步', '互联网/计算机');
INSERT INTO `t_user` VALUES (1004, '2021-03-14 19:49:57', 'wangwu', '王五', '13211112222', '847064370@qq.com', '123456', NULL, '/assets/img/default-avatar.jpg', NULL, 0, 'customer', '男', '游泳,跑步', '互联网/计算机');
INSERT INTO `t_user` VALUES (1005, '2021-03-14 19:50:27', 'zhouyun', '周韵', '13512335566', '847064370@qq.com', '123456', '123123123122199', '/assets/img/default-avatar.jpg', '', 0, 'customer', '女', '游泳,跑步', '文化/传媒');
INSERT INTO `t_user` VALUES (1006, '2021-03-14 19:49:37', 'tom', '汤姆', '13412346789', '847064370@qq.com', '123456', '123123123122122', '/assets/img/default-avatar.jpg', '', 0, 'customer', '男', '游泳,跑步,游戏', '互联网/计算机');
INSERT INTO `t_user` VALUES (1007, '2021-03-14 19:49:57', 'jerry', '杰瑞', '13211112222', '847064370@qq.com', '123456', NULL, '/assets/img/default-avatar.jpg', NULL, 0, 'customer', '男', '游泳,跑步', '互联网/计算机');
INSERT INTO `t_user` VALUES (1008, '2021-03-14 19:50:27', 'frank', '法兰克', '13512335566', '847064370@qq.com', '123456', '123123123122199', '/assets/img/default-avatar.jpg', '', 1, 'customer', '女', '游泳,跑步', '文化/传媒');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
