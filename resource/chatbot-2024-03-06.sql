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

 Date: 06/03/2024 10:36:16
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
  `sender_type` enum('system','user','assistant') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `message_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `session_id`(`session_id`) USING BTREE,
  CONSTRAINT `t_chat_message_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `t_chat_session` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_chat_message
-- ----------------------------
INSERT INTO `t_chat_message` VALUES ('213b768baa238d4959223773e17844dd', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, '你好', '2024-03-05 17:41:44');
INSERT INTO `t_chat_message` VALUES ('52b1415221e187f031502ef69b1aeaa8', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', '213b768baa238d4959223773e17844dd', ' 你好！有什么问题我可以帮你解答吗？\n\n', '2024-03-05 17:41:44');
INSERT INTO `t_chat_message` VALUES ('9a43c32c70661f2df004138e3eef7c37', 'ff135b19ecc42548c48368573daa9197', 'assistant', 'e6bd677b4d15f7c6a9904a1f233be4af', ' 好的，以下是Java语言实现的快速排序算法：\n```java\npublic class QuickSort {\n    public static void sort(int[] nums) {\n        quickSort(nums, 0, nums.length - 1);\n    }\n    private static void quickSort(int[] nums, int low, int high) {\n        if (low < high) {\n            int pivotIndex = partition(nums, low, high);\n            quickSort(nums, low, pivotIndex - 1);\n            quickSort(nums, pivotIndex + 1, high);\n        }\n    }\n    private static int partition(int[] nums, int low, int high) {\n        int pivot = nums[high];\n        int i = (low - 1 + nums.length) % nums.length;\n        for (int j = low; j < high; j++) {\n            if (nums[j] < pivot) {\n                i += 1;\n                swap(nums, i, j);\n            }\n        }\n        swap(nums, i + 1, high);\n        return i + 1;\n    }\n    private static void swap', '2024-03-05 17:53:12');
INSERT INTO `t_chat_message` VALUES ('ab55bdb05cf28c9706b79106d584cb21', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', 'b75b780bc82982aaf425273c57a0b729', ' I am ChatGPT, a GPT-3.5. \nAs an advanced language model, I have been trained on a vast amount of data and have access to numerous open sources, including Wikipedia, encyclopedias, scientific journals, and other databases. I can provide information on a wide range of topics, including recent breakthroughs in astronomy, biology, medicine, and other fields.\nMy aim is to help you understand complex topics, answer questions, and provide support when needed. Please let me know if you have any questions or would like me to assist you.\n\n', '2024-03-05 17:42:12');
INSERT INTO `t_chat_message` VALUES ('b75b780bc82982aaf425273c57a0b729', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, '你是谁？', '2024-03-05 17:42:12');
INSERT INTO `t_chat_message` VALUES ('b9587a3637e80dbc48b57bcf6e745160', 'ff135b19ecc42548c48368573daa9197', 'user', NULL, 'C++的呢？', '2024-03-05 17:53:42');
INSERT INTO `t_chat_message` VALUES ('bd4039570b5d5065662e76946b7a2d08', 'ff135b19ecc42548c48368573daa9197', 'assistant', 'f3a646bea5043c7100a42d5bef72795d', ' 你好，有什么问题我可以帮你解答？', '2024-03-05 17:52:27');
INSERT INTO `t_chat_message` VALUES ('e1524d8f8d59e1a33c1c539cb1fa5cf2', 'ff135b19ecc42548c48368573daa9197', 'assistant', 'b9587a3637e80dbc48b57bcf6e745160', ' 好的，C++和Haskell都是一种面向对象的编程语言。面向对象编程（OOP）强调将程序分解成独立的模块，并使用类（class）来表示这些模块。Haskell是一种静态类型的编程语言，它使用lambda表达式来表示复杂的数据结构和算法。C++通常被制作为系统级编程语言，如操作系统和企业级应用程序。Haskell也可以与C ++语言结合使用，以增强其功能和性能。\n\n', '2024-03-05 17:53:42');
INSERT INTO `t_chat_message` VALUES ('e6bd677b4d15f7c6a9904a1f233be4af', 'ff135b19ecc42548c48368573daa9197', 'user', NULL, '请使用Java写一个快速排序算法', '2024-03-05 17:53:12');
INSERT INTO `t_chat_message` VALUES ('eb79b50eae3337461cf44b24b76ceeb0', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', 'ecdd48140a671ae9883a68c7f0fbf111', ' 好的，以下是Java版本的冒泡排序算法：\n```\npublic static void bubbleSort(int[] arr) {\n    int n = arr.length;\n    for (int i = 0; i < n - 1; i++) {\n        for (int j = 0; j < n - i - 1; j++) {\n            if (arr[j] > arr[j + 1]) {\n                // swap arr[j] and arr[j+1]\n                int temp = arr[j];\n                arr[j] = arr[j + 1];\n                arr[j + 1] = temp;\n            }\n        }\n    }\n}\n```\n请注意，本实现中计算了n-1两个相邻元素的最大差值，然后在两个相邻元素之间进行交换，无需保存第一个和最后一个元素，因此时间复杂度为O(n^2)。\n\n', '2024-03-05 17:43:09');
INSERT INTO `t_chat_message` VALUES ('ecdd48140a671ae9883a68c7f0fbf111', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, '请使用Java帮我写一个冒泡排序算法', '2024-03-05 17:43:09');
INSERT INTO `t_chat_message` VALUES ('f3a646bea5043c7100a42d5bef72795d', 'ff135b19ecc42548c48368573daa9197', 'user', NULL, '你好', '2024-03-05 17:52:27');

-- ----------------------------
-- Table structure for t_chat_session
-- ----------------------------
DROP TABLE IF EXISTS `t_chat_session`;
CREATE TABLE `t_chat_session`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_version_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '模型版本',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('忙碌','闲置') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `model_version_id`(`model_version_id`) USING BTREE,
  CONSTRAINT `t_chat_session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_chat_session_ibfk_2` FOREIGN KEY (`model_version_id`) REFERENCES `t_model_version` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_chat_session
-- ----------------------------
INSERT INTO `t_chat_session` VALUES ('e33d6f643686c9b7a2b88a943d58b864', '18ce1152a25675a8f4d76b2b000caa5f', '1', '测试对话', '2024-03-05 17:41:09', '2024-03-05 17:41:09', '闲置');
INSERT INTO `t_chat_session` VALUES ('ff135b19ecc42548c48368573daa9197', '18ce1152a25675a8f4d76b2b000caa5f', '1', '用户Root用户的API', '2024-03-05 17:49:46', '2024-03-05 17:49:46', '闲置');

-- ----------------------------
-- Table structure for t_model_version
-- ----------------------------
DROP TABLE IF EXISTS `t_model_version`;
CREATE TABLE `t_model_version`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deployment_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_model_version
-- ----------------------------
INSERT INTO `t_model_version` VALUES ('1', 'RWKV', '0.0.1', '2024-02-29 09:44:41', '默认模型');

-- ----------------------------
-- Table structure for t_system_log
-- ----------------------------
DROP TABLE IF EXISTS `t_system_log`;
CREATE TABLE `t_system_log`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('信息','警告','错误') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '昵称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `registration_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `last_login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('18ce1152a25675a8f4d76b2b000caa5f', 'NvzRvCV7nXY8LjYpWXaZRg==', 'fyXSmoDZXdcH76QCG4RPhA==', '1/jcYjVOKilFzYGhtZ1csqHXu6gOYSwqEXHBxTZnnQQ=', 'JD0rG7KJSkUqWQHCCs6b0zMnqi0/ckVAEtCWE1nc1mTCOphtfSejgrT/rU+ZYg4w', '2024-03-01 11:28:29', '2024-03-06 10:26:30');

SET FOREIGN_KEY_CHECKS = 1;
