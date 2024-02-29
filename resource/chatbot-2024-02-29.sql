/*
 Navicat Premium Data Transfer

 Source Server         : 本地机器5.7（manager）
 Source Server Type    : MySQL
 Source Server Version : 50740 (5.7.40-log)
 Source Host           : localhost:3307
 Source Schema         : chatbot

 Target Server Type    : MySQL
 Target Server Version : 50740 (5.7.40-log)
 File Encoding         : 65001

 Date: 29/02/2024 10:47:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_chat_message
-- ----------------------------
DROP TABLE IF EXISTS `t_chat_message`;
CREATE TABLE `t_chat_message`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_type` enum('用户','机器人') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `session_id`(`session_id`) USING BTREE,
  CONSTRAINT `t_chat_message_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `t_chat_session` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_chat_message
-- ----------------------------
INSERT INTO `t_chat_message` VALUES ('1', '1', '用户', '2', '你好', '2024-02-29 10:37:06');
INSERT INTO `t_chat_message` VALUES ('2', '1', '机器人', '1', '你好👋！我是人工智能助手 ChatGLM2-6B，很高兴见到你，欢迎问我任何问题。', '2024-02-29 10:37:35');

-- ----------------------------
-- Table structure for t_chat_session
-- ----------------------------
DROP TABLE IF EXISTS `t_chat_session`;
CREATE TABLE `t_chat_session`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_version_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('busy','free') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `model_version_id`(`model_version_id`) USING BTREE,
  CONSTRAINT `t_chat_session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_chat_session_ibfk_2` FOREIGN KEY (`model_version_id`) REFERENCES `t_model_version` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_chat_session
-- ----------------------------
INSERT INTO `t_chat_session` VALUES ('1', 'e219dd21c439a672bf966ad4dd8c60af', '1', '2024-02-29 10:34:54', '2024-02-29 10:34:54', NULL);

-- ----------------------------
-- Table structure for t_model_version
-- ----------------------------
DROP TABLE IF EXISTS `t_model_version`;
CREATE TABLE `t_model_version`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deployment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_model_version
-- ----------------------------
INSERT INTO `t_model_version` VALUES ('1', 'ChatGLM2-6B', '0.0.1', '2024-02-29 09:44:41', '默认模型');

-- ----------------------------
-- Table structure for t_system_log
-- ----------------------------
DROP TABLE IF EXISTS `t_system_log`;
CREATE TABLE `t_system_log`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('信息','警告','错误') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_system_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `registration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('e219dd21c439a672bf966ad4dd8c60af', 'u69DWYE27dZSV6Ez5AeFJQ==', 'fyXSmoDZXdcH76QCG4RPhA==', '1/jcYjVOKilFzYGhtZ1csqHXu6gOYSwqEXHBxTZnnQQ=', '2024-02-28 15:18:19', '2024-02-28 15:18:19');

SET FOREIGN_KEY_CHECKS = 1;
