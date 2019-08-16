/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : deptmanage

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 16/08/2019 17:39:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for deptget
-- ----------------------------
DROP TABLE IF EXISTS `deptget`;
CREATE TABLE `deptget`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of deptget
-- ----------------------------
INSERT INTO `deptget` VALUES (1, '技术部技术科', '304-304');
INSERT INTO `deptget` VALUES (2, '管理部管理科管理信息', '306');
INSERT INTO `deptget` VALUES (3, '规划部', '404');
INSERT INTO `deptget` VALUES (4, '网安部', '406');
INSERT INTO `deptget` VALUES (5, '测试部', '312');
INSERT INTO `deptget` VALUES (6, '技术部技术科', '304-304');
INSERT INTO `deptget` VALUES (7, '管理部管理科管理信息', '306');
INSERT INTO `deptget` VALUES (8, '规划部', '404');
INSERT INTO `deptget` VALUES (9, '网安部', '406');
INSERT INTO `deptget` VALUES (10, '测试部', '312');
INSERT INTO `deptget` VALUES (11, '技术部技术科', '304-304');
INSERT INTO `deptget` VALUES (12, '管理部管理科管理信息', '306');
INSERT INTO `deptget` VALUES (13, '规划部', '404');
INSERT INTO `deptget` VALUES (14, '网安部', '406');
INSERT INTO `deptget` VALUES (15, '测试部', '312');
INSERT INTO `deptget` VALUES (16, '技术部技术科', '304-304');
INSERT INTO `deptget` VALUES (17, '管理部管理科管理信息', '306');
INSERT INTO `deptget` VALUES (18, '规划部', '404');
INSERT INTO `deptget` VALUES (19, '网安部', '406');
INSERT INTO `deptget` VALUES (20, '测试部', '312');

SET FOREIGN_KEY_CHECKS = 1;
