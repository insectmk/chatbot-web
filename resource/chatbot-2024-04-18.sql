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

 Date: 18/04/2024 15:34:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_chat_message
-- ----------------------------
DROP TABLE IF EXISTS `t_chat_message`;
CREATE TABLE `t_chat_message`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `session_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '会话ID',
  `sender_type` enum('system','user','assistant') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送人类别',
  `message_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '消息ID',
  `message_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息内容（用于关联回复）',
  `sent_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送是时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `session_id`(`session_id`) USING BTREE,
  CONSTRAINT `t_chat_message_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `t_chat_session` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_chat_message
-- ----------------------------
INSERT INTO `t_chat_message` VALUES ('1eea6631cfc414d224dc5807aac9c7c9', '39203c8242e538ac4fe8bbfcc9ab7236', 'user', NULL, '请使用Java帮我写一个冒泡排序算法', '2024-04-18 15:32:05');
INSERT INTO `t_chat_message` VALUES ('3ca70c990bb0e222f9b190acbcd3151f', '39203c8242e538ac4fe8bbfcc9ab7236', 'assistant', '1eea6631cfc414d224dc5807aac9c7c9', ' 好的，以下是冒泡排序算法的Java代码：\n```java\npublic class BubbleSort {\n    public static void main(String[] args) {\n        int[] arr = {10, 5, 8, 3, 7};\n        bubbleSort(arr);\n        System.out.println(\"Sorted array: \");\n        for (int i = 0; i < arr.length; i++) {\n            System.out.print(arr[i] + \" \");\n        }\n    }\n    public static void bubbleSort(int[] arr) {\n        for (int i = 0; i < arr.length - 1; i++) {\n            for (int j = 0; j < arr.length - 1 - i; j++) {\n                if (arr[j] > arr[j+1]) {\n                    // Swap the values at index j and j+1\n                    int temp = arr[j];\n                    arr[j] = arr[j+1];\n                    arr[j+1] = temp;\n                }\n            }\n        }\n    }\n}\n```\n这个代码中，我们首先定义了一个名为`bubbleSort`的方法，它接受一个整数数组作为参数。在这个方法中，我们使用两层循环来遍历整个数组。外层循环控制比较和交换的次数，内层循环则控制每次比较和交换操作。\n在内层循环中，我们使用了两种不同的比较方式：\n* 第一种方式：通过使用嵌套的for循环来遍历整个数组。\n* 第二种方式：通过使用Java提供的内置函数`compareTo()`来进行排序。\n最后一步是将排序后的结果打印出来。在这里，我们将输出结果为 `[3, 5, 7, 8, 10]`。\n希望这可以帮助你理解如何实现冒泡排序算法！\n\n', '2024-04-18 15:32:05');
INSERT INTO `t_chat_message` VALUES ('3f86ddee1edb210c1c02901c0418c03b', '39203c8242e538ac4fe8bbfcc9ab7236', 'user', NULL, '你好', '2024-04-18 15:31:15');
INSERT INTO `t_chat_message` VALUES ('756167a90ec4a2c6b0d52157fa3cb1ed', 'b7ee87c89df8ac171b0447f5a11d569a', 'assistant', 'd4910cbf15d00e450f7abb355fac1dc7', ' 我是由OpenAI训练的大型语言模型，可以进行自然语言处理和生成任务。我可以回答各种问题，回答用户的问题，并与用户进行对话。', '2024-04-18 14:34:10');
INSERT INTO `t_chat_message` VALUES ('94e413406654b4ea4e7a3f64f5b2a85c', 'b7ee87c89df8ac171b0447f5a11d569a', 'assistant', '953820a43a344f473f98500dc75b47a6', ' Sure, here\'s a fully functional Java program to implement冒泡排序 in JDK 8 and Java SE 7:\n```java\nimport java.util.Arrays;\nimport java.util.CompareTo;\npublic class BubbleSort {\n    \n    public static void main(String[] args) {\n        char[] arr = {\'a\', \'b\', \'c\', \'d\', \'e\', \'f\', \'g\', \'h\', \'i\', \'j\', \'k\', \'l\', \'m\', \'n\'};\n        int minLen = 1; // 所需要的差的最小次数\n        int count = 0; // 累加当前最小比较次数\n        for(int i=0; i<arr.length; i++){\n            for(int j=0; j<arr.length-i-1; j++){\n                if(arr[j] > arr[j+1]){\n                    char temp = arr[j];\n                    arr[j] = arr[j+1];\n                    arr[j+1] = temp;\n                    count++;\n                }\n            }\n        }\n        // 找到最大的差值为反向排序，初始化为全空最小值\n        for(int i=1; i<arr.length; i++){\n            for(int j=0; j<arr.length; j++){\n                if(arr[i-1] > arr[j]){\n                    char temp = arr[j];\n                    arr[j] = arr[j-1];\n                    arr[j-1] = temp;\n                    count++;\n                }\n            }\n        }\n        System.out.println(\"Printed and sorted array: \");\n        for(int i=0; i<arr.length; i++){\n            System.out.print(arr[i] + \" \");\n        }\n    }\n}\n```\n运行后，程序会输出：\n```\nPrinted and sorted array: [8 1 1 0 4]\n```\n这个程序原理就是通过冒泡排序的方法，通过段落的反向遍历，一个个比较相邻的两个元素，将小于级别的元素放入一个新的数组中，跨过大小与元素当前位置左右的元素来完成比较和交换。\n程序中使用了一个for循环来实现相邻的元素比较和交换操作，如果新元素在数组中的位置需要交换的话，就重新加入一个数字到该位置上。\n程序还有两个额外的判断值，一个判断是否为最小值，一个判断为差值，这两个值分别用于判断相邻元素是否需要通过异或或者比较等操作。\n程序同时使用了多重循环来实现许多操作，其中最终是遍历整个数组然后进行反向排序，并全额暂停（false）的循环方式进行。\n\n', '2024-04-18 14:33:03');
INSERT INTO `t_chat_message` VALUES ('953820a43a344f473f98500dc75b47a6', 'b7ee87c89df8ac171b0447f5a11d569a', 'user', NULL, '请使用Java帮我写一个冒泡排序算法', '2024-04-18 14:33:03');
INSERT INTO `t_chat_message` VALUES ('95f130bf50c55ab48650c9aeec49e462', '39203c8242e538ac4fe8bbfcc9ab7236', 'assistant', 'b7df96fd93a36b7471f7901eb18598e3', ' 我是一个人工智能语言模型，被训练来回答各种问题和提供帮助。我的目标是尽可能地为用户提供有用的信息和答案。\n\n', '2024-04-18 15:31:23');
INSERT INTO `t_chat_message` VALUES ('aab4d2f87de15f17798f3a053cb8e67e', 'a73597f23657e010729844ffc7d4134e', 'assistant', 'eaa3ef5ac456ac521ddcc840e941dbb6', ' 我是GPT-3.5，是一名基于GPT-3.5接口的AI机器人。我的主要职责是帮助用户解答各种问题，并且为用户提供更高效、便捷的服务体验。', '2024-03-29 15:57:56');
INSERT INTO `t_chat_message` VALUES ('b7df96fd93a36b7471f7901eb18598e3', '39203c8242e538ac4fe8bbfcc9ab7236', 'user', NULL, '你是谁？', '2024-04-18 15:31:23');
INSERT INTO `t_chat_message` VALUES ('c4cf6ea5b164ff0c83ea6d25359ef9d2', '39203c8242e538ac4fe8bbfcc9ab7236', 'assistant', '3f86ddee1edb210c1c02901c0418c03b', ' 你好！有什么我可以帮助你的吗？\n\n', '2024-04-18 15:31:15');
INSERT INTO `t_chat_message` VALUES ('d4910cbf15d00e450f7abb355fac1dc7', 'b7ee87c89df8ac171b0447f5a11d569a', 'user', NULL, '你是谁？', '2024-04-18 14:34:10');
INSERT INTO `t_chat_message` VALUES ('eaa3ef5ac456ac521ddcc840e941dbb6', 'a73597f23657e010729844ffc7d4134e', 'user', NULL, '你是谁？', '2024-03-29 15:57:56');

-- ----------------------------
-- Table structure for t_chat_session
-- ----------------------------
DROP TABLE IF EXISTS `t_chat_session`;
CREATE TABLE `t_chat_session`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户ID',
  `model_version_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '模型ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `model_version_id`(`model_version_id`) USING BTREE,
  CONSTRAINT `t_chat_session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_chat_session_ibfk_2` FOREIGN KEY (`model_version_id`) REFERENCES `t_model_version` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_chat_session
-- ----------------------------
INSERT INTO `t_chat_session` VALUES ('39203c8242e538ac4fe8bbfcc9ab7236', '56439f0e310cd4dae5d9ed51f869d51d', '1', '测试', '2024-04-18 15:31:09', '2024-04-18 15:31:09');
INSERT INTO `t_chat_session` VALUES ('3c909158b2837d4bb6bc47058e681de3', '092b43dd1b8633b76bbefaf04f0b5800', '1', '[测试用户]的API', '2024-04-10 16:30:08', '2024-04-10 16:30:08');
INSERT INTO `t_chat_session` VALUES ('a73597f23657e010729844ffc7d4134e', '2cbcb04456e5b0419e4a189cd27d8fc9', '1', '[马某人]的API', '2024-03-29 15:57:23', '2024-03-29 15:57:23');
INSERT INTO `t_chat_session` VALUES ('b2a2a71016a5f8fb4c2dc411d145c20c', 'a036b08c189facd488d115954ca19f08', '1', '[马昆]的API', '2024-04-09 12:41:40', '2024-04-09 12:41:40');
INSERT INTO `t_chat_session` VALUES ('b7ee87c89df8ac171b0447f5a11d569a', '56439f0e310cd4dae5d9ed51f869d51d', '1', '测试', '2024-04-18 14:32:19', '2024-04-18 14:32:19');

-- ----------------------------
-- Table structure for t_model_version
-- ----------------------------
DROP TABLE IF EXISTS `t_model_version`;
CREATE TABLE `t_model_version`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模型名称',
  `version_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '版本号',
  `api_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'API地址',
  `api_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'API密钥',
  `temperature` double NULL DEFAULT NULL,
  `top_p` double NULL DEFAULT NULL,
  `presence_penalty` double NULL DEFAULT NULL,
  `frequency_penalty` double NULL DEFAULT NULL,
  `max_token` int(11) UNSIGNED ZEROFILL NULL DEFAULT 00000001024 COMMENT '最长上下文Token',
  `generate_tokens` bigint(20) NULL DEFAULT 0 COMMENT '已生成的Token数量',
  `deployment_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_model_version
-- ----------------------------
INSERT INTO `t_model_version` VALUES ('1', 'RWKV', '0.0.1', 'http://127.0.0.1:8000/', '', NULL, NULL, NULL, NULL, 00000001024, 26809, '2024-02-29 09:44:41', '默认模型');
INSERT INTO `t_model_version` VALUES ('103550eb06ea493723e666207d37d722', 'GPU-4G-7B-CN', '0.0.1', 'http://localhost:8080/', NULL, NULL, NULL, NULL, NULL, 00000001024, 2541, '2024-04-09 16:16:23', 'GPU-4G-7B-CN');
INSERT INTO `t_model_version` VALUES ('564f41e0d16a309431acd17457bae441', 'GPU-4G-3B-World', '0.0.1', 'http://127.0.0.1:8000/', NULL, NULL, NULL, NULL, NULL, 00000001024, 4513, '2024-04-09 16:15:10', 'GPU-4G-3B-World');
INSERT INTO `t_model_version` VALUES ('6c8e08ea4324ef0bbcd13bcf651682ce', 'test', 'sadfsadf', 'http://127.0.0.1:8000/', '', NULL, NULL, NULL, NULL, 00000001024, 0, '2024-04-10 11:34:59', 'fdsafsdf');
INSERT INTO `t_model_version` VALUES ('6f697caf794e5624f660204482bf31e0', 'GPU-2G-3B-World', '0.0.1', 'http://127.0.0.1:8000/', NULL, NULL, NULL, NULL, NULL, 00000001024, 854, '2024-04-09 16:13:41', '2G显存-30亿参数-全世界语言');
INSERT INTO `t_model_version` VALUES ('8fd398b4ca8418793a3c882e5e4b616e', 'GPU-2G-1B5-World', '0.0.1', 'http://127.0.0.1:8000/', NULL, NULL, NULL, NULL, NULL, 00000001024, 1423, '2024-04-09 16:12:39', '2G显存-15亿参数');
INSERT INTO `t_model_version` VALUES ('a20ebce361b9fe1e4c3eb34229e2338c', 'GPU-4G-1B5-World', '0.0.1', 'http://127.0.0.1:8000/', NULL, NULL, NULL, NULL, NULL, 00000001024, 154, '2024-04-09 16:14:31', '4G显存-15亿参数-世界语言');
INSERT INTO `t_model_version` VALUES ('b8e780bd16cc223d01fd78981022d430', 'GPU-4G-3B-CN', '0.0.1', 'http://localhost:8080/', NULL, NULL, NULL, NULL, NULL, 00000001024, 2587, '2024-04-09 16:15:39', 'GPU-4G-3B-CN');
INSERT INTO `t_model_version` VALUES ('bb0abb2b648faa0956c28f5cf64ebd8f', 'GPU-4G-7B-World', '0.0.1', 'http://localhost:8080/', NULL, NULL, NULL, NULL, NULL, 00000001024, 7843, '2024-04-09 16:15:58', 'GPU-4G-7B-World');
INSERT INTO `t_model_version` VALUES ('f4fd5c356c23163d5653a8e5cfeb0a71', 'InsectMk\'s LoRA', '0.0.1', 'http://127.0.0.1:8000/', NULL, NULL, NULL, NULL, NULL, 00000001024, 4892, '2024-04-09 13:59:32', 'InsectMk的微调模型');

-- ----------------------------
-- Table structure for t_system_log
-- ----------------------------
DROP TABLE IF EXISTS `t_system_log`;
CREATE TABLE `t_system_log`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人IP地址',
  `op_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人邮箱',
  `level` enum('信息','警告','错误') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '等级',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '信息',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_system_log
-- ----------------------------
INSERT INTO `t_system_log` VALUES ('037196f3ba398babf50f6c97c4a212a5', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:02:51');
INSERT INTO `t_system_log` VALUES ('03b3a6c81fdbaf58a484f49a55a208fb', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:51:02');
INSERT INTO `t_system_log` VALUES ('06ceb8cc09bf3d7f8d1dee551c6be873', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 13:01:37');
INSERT INTO `t_system_log` VALUES ('07ef0a28c3039ebe10871023e5487e21', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:29:27');
INSERT INTO `t_system_log` VALUES ('094121e520fd1ec15fb396c4e0fadd90', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.UserController.info', '2024-04-10 16:41:13');
INSERT INTO `t_system_log` VALUES ('0b71d56b17f4203b5141dd1afe9affae', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:24:42');
INSERT INTO `t_system_log` VALUES ('0ba5cf1cb31f788e63e7cc2d49350f08', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-18 13:12:46');
INSERT INTO `t_system_log` VALUES ('0bb5317b19453ec3d168a8567ededfec', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:51:02');
INSERT INTO `t_system_log` VALUES ('0eda7626fd768c8308e689a2b9d7fe02', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:19:04');
INSERT INTO `t_system_log` VALUES ('0f0a008064f823381ba757286464e431', '127.0.0.1', '3067836615@qq.com', '错误', '服务器出错：Content type \'multipart/form-data;boundary=----WebKitFormBoundaryeDvsNdRvFYsTeKL3;charset=UTF-8\' not supported', '2024-04-10 13:17:31');
INSERT INTO `t_system_log` VALUES ('0f12eaf7bfe3be8d3143316ab9bae25d', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-10 18:57:34');
INSERT INTO `t_system_log` VALUES ('0f7f967b95309f0ffd45adfe917b9a82', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.captcha', '2024-04-11 09:35:55');
INSERT INTO `t_system_log` VALUES ('105803268a694e77c2c3ef447f61c956', '127.0.0.1', '未知', '警告', '过多请求：info', '2024-04-10 12:40:04');
INSERT INTO `t_system_log` VALUES ('11652763fe1da11bd98da59d4aeba71b', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatSessionController.findAllMessage', '2024-04-10 18:32:18');
INSERT INTO `t_system_log` VALUES ('1c9ab8d7e85f3b21dd9f50114a140930', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:02:06');
INSERT INTO `t_system_log` VALUES ('1dca307ff2a92dcedd8d271ea5e3e923', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:49:04');
INSERT INTO `t_system_log` VALUES ('1e92c756d667f707fcf2ac2c32d44007', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:59:40');
INSERT INTO `t_system_log` VALUES ('1ee336e58e69d6e753d001be96ce60a9', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatSessionController.findAllMessage', '2024-04-10 18:32:29');
INSERT INTO `t_system_log` VALUES ('1f689d3e08a0c0e5635776abd4dec802', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-11 09:27:56');
INSERT INTO `t_system_log` VALUES ('205d8926b047d5ac36a4746d5087b014', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '错误', '出错了：com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'temperature\' in \'field list\'', '2024-04-18 15:26:09');
INSERT INTO `t_system_log` VALUES ('268ff19005b4925c9ee07d9dc64ea88d', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-10 18:58:19');
INSERT INTO `t_system_log` VALUES ('26d3edf2bff04658458f07cf51f00766', '127.0.0.1', '3067836615@qq.com', '错误', '服务器出错：Content type \'multipart/form-data;boundary=----WebKitFormBoundary0dvy9SVpSkvW1uDH;charset=UTF-8\' not supported', '2024-04-10 13:20:17');
INSERT INTO `t_system_log` VALUES ('274f99f53b46ca3bb2ae7408087f6a18', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 13:13:25');
INSERT INTO `t_system_log` VALUES ('29e1a629177833ca33a8026c70153bd8', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-11 10:18:29');
INSERT INTO `t_system_log` VALUES ('2ac603cc67ba6485ae73444858bd0389', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:01:11');
INSERT INTO `t_system_log` VALUES ('2c90eb16e7e2964191f309768b94d8f0', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatSessionController.findAllMessage', '2024-04-10 18:32:29');
INSERT INTO `t_system_log` VALUES ('2df38a0b8d92f921830d6725e4abbb21', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:17:48');
INSERT INTO `t_system_log` VALUES ('2ebc3b5500d0bd731632b1e025bea360', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.captcha', '2024-04-10 22:36:12');
INSERT INTO `t_system_log` VALUES ('3171554c14204574fd3208d5af4014e4', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-10 18:58:18');
INSERT INTO `t_system_log` VALUES ('3354eb3b1b22b418239c08f754ff7b57', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:02:10');
INSERT INTO `t_system_log` VALUES ('343a8c14dbd0add5f437652f085e82c8', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-11 09:27:58');
INSERT INTO `t_system_log` VALUES ('36004bcd30a9a260c5e5a8c82b0329b4', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:26:57');
INSERT INTO `t_system_log` VALUES ('37138386a3ca76d4f71f8a5219717f58', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:31:24');
INSERT INTO `t_system_log` VALUES ('395c5e20123ee4cefd1cb551e1069f3f', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:00:59');
INSERT INTO `t_system_log` VALUES ('39ca8a825a5243bdfc058768c8fcf46f', '127.0.0.1', '3067836615@qq.com', '错误', '服务器出错：org.springframework.validation.BeanPropertyBindingResult: 2 errors\nField error in object \'userDto\' on field \'lastLoginTime\': rejected value [2024-04-09 12:46:39]; codes [typeMismatch.userDto.lastLoginTime,typeMismatch.lastLoginTime,typeMismatch.java.util.Date,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [userDto.lastLoginTime,lastLoginTime]; arguments []; default message [lastLoginTime]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.util.Date\' for property \'lastLoginTime\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.util.Date] for value \'2024-04-09 12:46:39\'; nested exception is java.lang.IllegalArgumentException]\nField error in object \'userDto\' on field \'registrationTime\': rejected value [2024-03-29 14:30:09]; codes [typeMismatch.userDto.registrationTime,typeMismatch.registrationTime,typeMismatch.java.util.Date,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [userDto.registrationTime,registrationTime]; arguments []; default message [registrationTime]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.util.Date\' for property \'registrationTime\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.util.Date] for value \'2024-03-29 14:30:09\'; nested exception is java.lang.IllegalArgumentException]', '2024-04-10 13:22:37');
INSERT INTO `t_system_log` VALUES ('3dc266408983ab971fa563b16a2c4da2', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-11 09:50:38');
INSERT INTO `t_system_log` VALUES ('400108c05e5a5f8a9f1c8445b07a6a29', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:24:53');
INSERT INTO `t_system_log` VALUES ('4064e1c44c9df887e7b16e241b5c3300', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.captcha', '2024-04-10 22:42:49');
INSERT INTO `t_system_log` VALUES ('415ab270f1febba28c133755518b82c6', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-18 10:39:36');
INSERT INTO `t_system_log` VALUES ('451d0a1fd75e447bcf9b6a9de37a7790', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:29:55');
INSERT INTO `t_system_log` VALUES ('45d4dd05404940403093597b138951c1', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:02:07');
INSERT INTO `t_system_log` VALUES ('4854d10069059beb9312808c774b1641', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:40:34');
INSERT INTO `t_system_log` VALUES ('48a2a5a54c33d33296048446dcc9b91b', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:58:10');
INSERT INTO `t_system_log` VALUES ('49f42ebba46c1de1629d710337c84931', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-11 09:50:27');
INSERT INTO `t_system_log` VALUES ('4a750beb5b393fd8e71be28931fe8b4b', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"outputStream\"]->org.apache.tomcat.util.http.fileupload.DeferredFileOutputStream[\"currentOutputStream\"]->java.io.FileOutputStream[\"fd\"])', '2024-04-10 14:21:22');
INSERT INTO `t_system_log` VALUES ('53feb52e9eb59585f1d5c43542823084', '127.0.0.1', '3067836615@qq.com', '错误', '服务器出错：org.springframework.validation.BeanPropertyBindingResult: 2 errors\nField error in object \'userDto\' on field \'lastLoginTime\': rejected value [2024-04-09 12:46:39]; codes [typeMismatch.userDto.lastLoginTime,typeMismatch.lastLoginTime,typeMismatch.java.util.Date,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [userDto.lastLoginTime,lastLoginTime]; arguments []; default message [lastLoginTime]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.util.Date\' for property \'lastLoginTime\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.util.Date] for value \'2024-04-09 12:46:39\'; nested exception is java.lang.IllegalArgumentException]\nField error in object \'userDto\' on field \'registrationTime\': rejected value [2024-03-29 14:30:09]; codes [typeMismatch.userDto.registrationTime,typeMismatch.registrationTime,typeMismatch.java.util.Date,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [userDto.registrationTime,registrationTime]; arguments []; default message [registrationTime]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.util.Date\' for property \'registrationTime\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.util.Date] for value \'2024-03-29 14:30:09\'; nested exception is java.lang.IllegalArgumentException]', '2024-04-10 13:22:21');
INSERT INTO `t_system_log` VALUES ('5480cd1b4fae977070c56ae35c53e9d9', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-11 10:23:53');
INSERT INTO `t_system_log` VALUES ('5d94f97c038210f883a667d1c0adcc6e', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"outputStream\"]->org.apache.tomcat.util.http.fileupload.DeferredFileOutputStream[\"currentOutputStream\"]->java.io.FileOutputStream[\"fd\"])', '2024-04-10 14:34:37');
INSERT INTO `t_system_log` VALUES ('5e69325d32502e6b47a42a187e803d74', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:58:10');
INSERT INTO `t_system_log` VALUES ('5f50fbfab3ef45a164b67f1763c9c82f', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 13:01:51');
INSERT INTO `t_system_log` VALUES ('6a2b72fd81ec7b0d30af5b398e4dcbee', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:25:06');
INSERT INTO `t_system_log` VALUES ('6a517637d47e5c5a8b07a89a420c2739', '127.0.0.1', '3067836615@qq.com', '错误', '服务器出错：org.springframework.validation.BeanPropertyBindingResult: 2 errors\nField error in object \'userDto\' on field \'lastLoginTime\': rejected value [2024-04-09 12:46:39]; codes [typeMismatch.userDto.lastLoginTime,typeMismatch.lastLoginTime,typeMismatch.java.util.Date,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [userDto.lastLoginTime,lastLoginTime]; arguments []; default message [lastLoginTime]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.util.Date\' for property \'lastLoginTime\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.util.Date] for value \'2024-04-09 12:46:39\'; nested exception is java.lang.IllegalArgumentException]\nField error in object \'userDto\' on field \'registrationTime\': rejected value [2024-03-29 14:30:09]; codes [typeMismatch.userDto.registrationTime,typeMismatch.registrationTime,typeMismatch.java.util.Date,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [userDto.registrationTime,registrationTime]; arguments []; default message [registrationTime]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.util.Date\' for property \'registrationTime\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.util.Date] for value \'2024-03-29 14:30:09\'; nested exception is java.lang.IllegalArgumentException]', '2024-04-10 13:22:13');
INSERT INTO `t_system_log` VALUES ('6c0b688992397fa4b83c9c180d136391', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:02:12');
INSERT INTO `t_system_log` VALUES ('6e59be515d3d8476a7d027675a517a10', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-10 18:58:16');
INSERT INTO `t_system_log` VALUES ('6e9300976c1144dddcc13b0188e472ab', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-11 10:18:31');
INSERT INTO `t_system_log` VALUES ('6fb3200346d04583467d0ade74f65c52', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:58:13');
INSERT INTO `t_system_log` VALUES ('72ee5f6bfa178ca72351cf60a4bd53be', '127.0.0.1', '3067836615@qq.com', '信息', '清空系统日志', '2024-04-10 12:07:23');
INSERT INTO `t_system_log` VALUES ('73b6c62b6930a9e84cf14a408313b670', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:30:34');
INSERT INTO `t_system_log` VALUES ('75e13b765afe34987c822c084209f97b', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:28:32');
INSERT INTO `t_system_log` VALUES ('75f16b83abed70c189c5a18845cb0670', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:02:13');
INSERT INTO `t_system_log` VALUES ('78451b8cb31e633f293214f61536f72a', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:49:04');
INSERT INTO `t_system_log` VALUES ('7937e1ebd79fb6ceffede72a17b86c84', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:58:10');
INSERT INTO `t_system_log` VALUES ('7a6656ee00f1bbe58935a2a44f6bf76f', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-11 10:19:53');
INSERT INTO `t_system_log` VALUES ('7ac5883bf3560a277572e1eff43bccf3', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 13:00:09');
INSERT INTO `t_system_log` VALUES ('7b57c770ca36512ecdd3a74c41f2c7d9', '127.0.0.1', '3067836615@qq.com', '错误', '服务器出错：Content type \'multipart/form-data;boundary=----WebKitFormBoundaryaB3IJb1ui74Zj03L;charset=UTF-8\' not supported', '2024-04-10 13:17:18');
INSERT INTO `t_system_log` VALUES ('7c8b30f212aff96a58b31d20d93f5f2e', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:50:00');
INSERT INTO `t_system_log` VALUES ('7d7396f08cda7e54c8b69aeafe771969', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:32:38');
INSERT INTO `t_system_log` VALUES ('7e84fc1eff56149bac4cee07f46674f3', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:28:59');
INSERT INTO `t_system_log` VALUES ('7f0a7db4a34e6b2f17784b960f8df6a5', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:02:09');
INSERT INTO `t_system_log` VALUES ('8006031fb9844965d0d86265b3184016', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:24:53');
INSERT INTO `t_system_log` VALUES ('821d8fc1b8a8f67d90e7706776708e81', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:25:06');
INSERT INTO `t_system_log` VALUES ('8332e6b9ea7018803987ac495a3516c4', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 13:13:25');
INSERT INTO `t_system_log` VALUES ('866e8e5870b7d61dc4350cbe79b67b28', '127.0.0.1', '3067836615@qq.com', '错误', '服务器出错：org.springframework.validation.BeanPropertyBindingResult: 2 errors\nField error in object \'userDto\' on field \'lastLoginTime\': rejected value [2024-04-09 12:41:40]; codes [typeMismatch.userDto.lastLoginTime,typeMismatch.lastLoginTime,typeMismatch.java.util.Date,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [userDto.lastLoginTime,lastLoginTime]; arguments []; default message [lastLoginTime]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.util.Date\' for property \'lastLoginTime\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.util.Date] for value \'2024-04-09 12:41:40\'; nested exception is java.lang.IllegalArgumentException]\nField error in object \'userDto\' on field \'registrationTime\': rejected value [2024-04-09 12:41:40]; codes [typeMismatch.userDto.registrationTime,typeMismatch.registrationTime,typeMismatch.java.util.Date,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [userDto.registrationTime,registrationTime]; arguments []; default message [registrationTime]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.util.Date\' for property \'registrationTime\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.util.Date] for value \'2024-04-09 12:41:40\'; nested exception is java.lang.IllegalArgumentException]', '2024-04-10 13:23:32');
INSERT INTO `t_system_log` VALUES ('86ca40c3e92998cd8d04b1480535948b', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 13:01:37');
INSERT INTO `t_system_log` VALUES ('8aeca24044f613585e8ea08a15255253', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: Cannot construct instance of `org.springframework.web.multipart.MultipartFile` (no Creators, like default constructor, exist): abstract types either need to be mapped to concrete types, have custom deserializer, or contain additional type information\n at [Source: (org.springframework.util.StreamUtils$NonClosingInputStream); line: 1, column: 350] (through reference chain: cn.insectmk.chatbotweb.controller.dto.UserDto[\"headImageFile\"])', '2024-04-10 12:59:42');
INSERT INTO `t_system_log` VALUES ('8cf64d3231d4b0342e873e1bd80c5078', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-18 14:28:34');
INSERT INTO `t_system_log` VALUES ('8e50ceca444b8d5a19bc1d59024e48a2', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.captcha', '2024-04-10 22:36:27');
INSERT INTO `t_system_log` VALUES ('8ebadd0754e0534be0f96a20b9a16352', '127.0.0.1', '3067836615@qq.com', '警告', '数据校验失败：请输入验证码;请输入验证码', '2024-04-10 12:52:48');
INSERT INTO `t_system_log` VALUES ('922e5fd3117d98ddb481c172a2a2bdd3', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-11 09:47:01');
INSERT INTO `t_system_log` VALUES ('92bdd9d178fac8e08a60002f7db926ff', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.captcha', '2024-04-10 22:42:56');
INSERT INTO `t_system_log` VALUES ('92fd89b1842fcf130742ef4f625f4b68', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'temperature\' in \'field list\'', '2024-04-18 15:25:17');
INSERT INTO `t_system_log` VALUES ('933ee63f3cdbabae5d95b2e112f6acd3', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 13:00:37');
INSERT INTO `t_system_log` VALUES ('94d12f8c52e3dbc86dcf7a69b86048ab', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 13:07:52');
INSERT INTO `t_system_log` VALUES ('952930a54b82c54285083d05406ad367', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:39:22');
INSERT INTO `t_system_log` VALUES ('9639e3c5e6e94106ba338823d3a29de8', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:00:56');
INSERT INTO `t_system_log` VALUES ('96a0941efe507ca105c341fa904e5275', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '业务异常：Tokens存量不足', '2024-04-18 12:29:59');
INSERT INTO `t_system_log` VALUES ('96c94f89f1e77d8b64c3560e689e9416', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-18 10:36:44');
INSERT INTO `t_system_log` VALUES ('97f6f409e37de4258d05c37ec7d114ce', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 13:00:09');
INSERT INTO `t_system_log` VALUES ('995d1124a05efcec1fbd98380c2e931a', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:21:25');
INSERT INTO `t_system_log` VALUES ('9a81db77b7f98e307ec6ff72d590b2ac', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.captcha', '2024-04-10 22:36:17');
INSERT INTO `t_system_log` VALUES ('9bd389644e1f03e92353abdee5b3a231', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:02:08');
INSERT INTO `t_system_log` VALUES ('9c9cf07858df3875056e1fd72d9ee66b', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-10 18:57:29');
INSERT INTO `t_system_log` VALUES ('9cc801a7476d8ad32d65550823641827', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-11 09:50:32');
INSERT INTO `t_system_log` VALUES ('9ece8cddb7ccc119bb408a57ad41dea0', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:39:05');
INSERT INTO `t_system_log` VALUES ('a13b68163a8f4df6271a8de0c3f99ff2', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:59:40');
INSERT INTO `t_system_log` VALUES ('a1ba7d0709a42c427f7f61323ab64b0d', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-11 09:50:30');
INSERT INTO `t_system_log` VALUES ('a1e74fc9f0ff07f0193a1a968ecc692a', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-10 18:58:18');
INSERT INTO `t_system_log` VALUES ('a40db38022d00110f72fc44fe55647f1', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:50:00');
INSERT INTO `t_system_log` VALUES ('a49cabfd40f7111e2b278e305a558f79', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 13:03:51');
INSERT INTO `t_system_log` VALUES ('a7743a58c28804f518fca8a92c3f438a', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-11 09:27:54');
INSERT INTO `t_system_log` VALUES ('a954dd3222a4e3cb70641f55ba0c8589', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-18 13:12:57');
INSERT INTO `t_system_log` VALUES ('ab47c356010ffb332f351099f3bfa5f1', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-11 10:16:16');
INSERT INTO `t_system_log` VALUES ('abd03a33fe1e367ce4ef29ab76e3152e', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:22:23');
INSERT INTO `t_system_log` VALUES ('abfc4f1ada09fcd0a662ddd849f24a54', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:38:25');
INSERT INTO `t_system_log` VALUES ('b0cd7a630c2703301be51fb6456ec46b', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:01:03');
INSERT INTO `t_system_log` VALUES ('b2966464d7b56f4a35c8b2acb9e6d8c9', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 13:02:11');
INSERT INTO `t_system_log` VALUES ('b32534f4a971393260bd68a77a0ae9da', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:01:01');
INSERT INTO `t_system_log` VALUES ('b45eb119dba4b7917d7aaa8cf7c7d552', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-10 18:58:17');
INSERT INTO `t_system_log` VALUES ('b49e8b98733abdbc702f2b95c7f2aae6', '127.0.0.1', '3067836615@qq.com', '警告', '数据校验失败：请输入验证码;请输入验证码', '2024-04-10 12:52:56');
INSERT INTO `t_system_log` VALUES ('b4a69dc7a46820df44d70d9d128291eb', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:21:58');
INSERT INTO `t_system_log` VALUES ('b4c34fdb111fa62dcee571b247387777', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:19:43');
INSERT INTO `t_system_log` VALUES ('c080bb860f84d8344fdda08e53207551', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-11 10:23:27');
INSERT INTO `t_system_log` VALUES ('c27d3d348f2a14cc9d8b28c46675015a', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:58:13');
INSERT INTO `t_system_log` VALUES ('c46bad67ff4b95811cb938d3e1be9d6e', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 13:15:31');
INSERT INTO `t_system_log` VALUES ('c59f8d149deffba49b1986091f4893ac', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-11 09:50:34');
INSERT INTO `t_system_log` VALUES ('c875672df25e491c75633e87fe424047', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:17:51');
INSERT INTO `t_system_log` VALUES ('c8b049800054f80ba96dcc1ea8b2f98a', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:58:10');
INSERT INTO `t_system_log` VALUES ('cb38068062845aba11145517093b7d23', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:33:07');
INSERT INTO `t_system_log` VALUES ('ce18ff2322c4db2b2589a966ee4178ed', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"outputStream\"]->org.apache.tomcat.util.http.fileupload.DeferredFileOutputStream[\"currentOutputStream\"]->java.io.FileOutputStream[\"fd\"])', '2024-04-10 14:23:17');
INSERT INTO `t_system_log` VALUES ('cf67021dc5420453bfcc7792f94e96ef', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatSessionController.findAllMessage', '2024-04-10 18:32:37');
INSERT INTO `t_system_log` VALUES ('cf675eb41d4b8e393927d8aef43870ce', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'temperature\' in \'field list\'', '2024-04-18 15:25:22');
INSERT INTO `t_system_log` VALUES ('cfb703793afaba386ba3bca0512815e6', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-10 14:51:55');
INSERT INTO `t_system_log` VALUES ('d4506f53abf12ca96ec1591947824ad2', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 13:03:13');
INSERT INTO `t_system_log` VALUES ('d5df371181f6e08dea8613accb6c2e42', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:02:03');
INSERT INTO `t_system_log` VALUES ('d5ec67e6124ffd0c78f5a743eb626b49', '127.0.0.1', '未知', '警告', '业务异常：该邮箱已注册！', '2024-04-11 09:37:03');
INSERT INTO `t_system_log` VALUES ('d5feb98b5b8ece23b2da0f5761afff6d', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"outputStream\"]->org.apache.tomcat.util.http.fileupload.DeferredFileOutputStream[\"currentOutputStream\"]->java.io.FileOutputStream[\"fd\"])', '2024-04-10 14:25:47');
INSERT INTO `t_system_log` VALUES ('d84723ae5584b2c692b0585601258804', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 13:00:37');
INSERT INTO `t_system_log` VALUES ('d973157db25f8739a735f1800e216d66', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ApiController.getApiTips', '2024-04-10 16:41:13');
INSERT INTO `t_system_log` VALUES ('dbf4d3cf18816b4582901a7c68f5f1bd', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 13:03:13');
INSERT INTO `t_system_log` VALUES ('dc366dd9d7c8729e86e9081d2a77bc95', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:14:51');
INSERT INTO `t_system_log` VALUES ('dcc0cd3645de67681fc5c38d1aa03caa', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:28:59');
INSERT INTO `t_system_log` VALUES ('de3b2a3440c8a9a40ee5b3dec965b4f4', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 13:03:51');
INSERT INTO `t_system_log` VALUES ('e347906c1fc043152fde706accc2cefb', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 13:02:11');
INSERT INTO `t_system_log` VALUES ('e367ed16283d1eadcb20b2045a51cb27', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-10 18:57:32');
INSERT INTO `t_system_log` VALUES ('e494d6cd71ad384038a1b1e878acac71', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: Cannot construct instance of `org.springframework.web.multipart.MultipartFile` (no Creators, like default constructor, exist): abstract types either need to be mapped to concrete types, have custom deserializer, or contain additional type information\n at [Source: (org.springframework.util.StreamUtils$NonClosingInputStream); line: 1, column: 353] (through reference chain: cn.insectmk.chatbotweb.controller.dto.UserDto[\"headImageFile\"])', '2024-04-10 12:47:39');
INSERT INTO `t_system_log` VALUES ('e597c8c2dbf479e2d9f0ff992b7d670e', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:29:54');
INSERT INTO `t_system_log` VALUES ('e65fa93ec4aa15f217eea43a82067fe0', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:14:47');
INSERT INTO `t_system_log` VALUES ('e6d3066381a8f1c7482b69b414f08f45', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 13:58:13');
INSERT INTO `t_system_log` VALUES ('e82b4e874a6682078615cd55c3ab0ad8', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:24:55');
INSERT INTO `t_system_log` VALUES ('e95cb9081b46186f97c9461d4c2bd8aa', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 13:15:47');
INSERT INTO `t_system_log` VALUES ('e9b66e51d903cdf24ea1b9bfe6d7f7b0', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:24:42');
INSERT INTO `t_system_log` VALUES ('ea7831c5f601d16de869894f2c0d9a62', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatSessionController.findAllMessage', '2024-04-10 18:32:18');
INSERT INTO `t_system_log` VALUES ('eb1ea1558b41db2deaa2b8847ba75af2', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-10 14:51:43');
INSERT INTO `t_system_log` VALUES ('eb39b03b826cca6e27d27e25eeaa6c76', '127.0.0.1', '3067836615@qq.com', '错误', '服务器出错：org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'userDto\' on field \'password\': rejected value []; codes [Pattern.userDto.password,Pattern.password,Pattern.java.lang.String,Pattern]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [userDto.password,password]; arguments []; default message [password],[Ljavax.validation.constraints.Pattern$Flag;@14bce19b,^(?=.*\\d)(?=.*[a-zA-Z])(?=.*[\\W_]).{6,24}$]; default message [密码格式不正确]', '2024-04-10 13:24:08');
INSERT INTO `t_system_log` VALUES ('ece9a0c4d2db99b01a14b9412692d3c2', '127.0.0.1', '3067836615@qq.com', '警告', '数据校验失败：请输入验证码;请输入验证码', '2024-04-10 12:52:27');
INSERT INTO `t_system_log` VALUES ('eda9c4a20b817ac4398c3b9cdc43f3a2', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-11 09:28:07');
INSERT INTO `t_system_log` VALUES ('edd3dccdfd26a7f6f818adc89edd08cb', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-11 09:27:57');
INSERT INTO `t_system_log` VALUES ('eee750dd4787f7c01180105ed62a5d42', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:02:08');
INSERT INTO `t_system_log` VALUES ('f03d5d9911c4f0c67541b68f2b0128cd', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-10 18:57:33');
INSERT INTO `t_system_log` VALUES ('f0b1d696050a05db699cca09358a2bd0', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:33:01');
INSERT INTO `t_system_log` VALUES ('f19b9622a5a1d4db508d2b12ce6afba7', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 13:57:13');
INSERT INTO `t_system_log` VALUES ('f1c5dcadcd5a325a248b8011f36c331e', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:01:12');
INSERT INTO `t_system_log` VALUES ('f276db6c0cb09c84119094f33687751b', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-10 18:58:17');
INSERT INTO `t_system_log` VALUES ('f480c2c6fcc9496a9f3305589a94638c', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:01:01');
INSERT INTO `t_system_log` VALUES ('f48862c2ac516cae517d56b259742ffa', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 13:01:51');
INSERT INTO `t_system_log` VALUES ('f6de06ddb709f6d6ba2c6c11d985cb22', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: Cannot construct instance of `org.springframework.web.multipart.MultipartFile` (no Creators, like default constructor, exist): abstract types either need to be mapped to concrete types, have custom deserializer, or contain additional type information\n at [Source: (org.springframework.util.StreamUtils$NonClosingInputStream); line: 1, column: 350] (through reference chain: cn.insectmk.chatbotweb.controller.dto.UserDto[\"headImageFile\"])', '2024-04-10 12:55:09');
INSERT INTO `t_system_log` VALUES ('f7fdb1a6ec41975266f8bda9debb03b5', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-11 10:26:18');
INSERT INTO `t_system_log` VALUES ('f87eec5ecb169932bcd3af09d5ef9ee5', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:33:16');
INSERT INTO `t_system_log` VALUES ('fa8e9aef39ab14c1a23db48d36cd11bd', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 13:07:52');
INSERT INTO `t_system_log` VALUES ('fcb31e54e409cc16f53972d50ea0f106', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:40:34');
INSERT INTO `t_system_log` VALUES ('fece92bb08e1a7d23580d2937129bc98', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-10 18:58:14');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '昵称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `head` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `api_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密钥',
  `max_session` bigint(20) NULL DEFAULT 10 COMMENT '最大会话数',
  `tokens` bigint(20) NULL DEFAULT 10000 COMMENT '剩余Token数',
  `registration_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `last_login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('092b43dd1b8633b76bbefaf04f0b5800', 'k1jughcEKNKBVoXzTb6kfQ==', 'POwY5p9xe5NMwvKMibQ17A==', 'N9RElUs4M5UlXr2+zdGVP6HXu6gOYSwqEXHBxTZnnQQ=', 'https://makun-ing-image-bed.oss-cn-chengdu.aliyuncs.com/chatbot-web/user-head/20240410163056-16cf6071-6278-4b7a-bcec-72953ca2dedf.jpg', 'ErHtOdDyR7nSNCZFxhhObrSFoA4DEzXyudasJsB2xjfCOphtfSejgrT/rU+ZYg4w', 10, 10000, '2024-04-10 16:30:08', '2024-04-10 16:30:08');
INSERT INTO `t_user` VALUES ('2cbcb04456e5b0419e4a189cd27d8fc9', 'XVJx+cw6nRy5ge/DL3S/NA==', 'RwI/lv4Y2MBZ5CNeCMSgXg==', 'my/bnohoTSX+w4CNocpXCqHXu6gOYSwqEXHBxTZnnQQ=', 'https://makun-ing-image-bed.oss-cn-chengdu.aliyuncs.com/chatbot-web/user-head/20240410161722-1212a872-de5c-4abd-9704-8c0ddfb3043c.jpg', 'AvWDh1xxSqk2yjUr6je793HYEHwl+knqEBRCMuyvGULCOphtfSejgrT/rU+ZYg4w', 10, 10000, '2024-03-29 14:30:09', '2024-04-11 10:23:17');
INSERT INTO `t_user` VALUES ('56439f0e310cd4dae5d9ed51f869d51d', 'u69DWYE27dZSV6Ez5AeFJQ==', 'Ksid7UvKEJgngAbAbz/sSw==', '1/jcYjVOKilFzYGhtZ1csqHXu6gOYSwqEXHBxTZnnQQ=', 'https://insectmk.cn/static/img/head/insectmk.png', 'YTwbQUEz3GH1QiRuAjxWAw457w0EwRwudmth4TQ2saHCOphtfSejgrT/rU+ZYg4w', 10, 99983603, '2024-03-29 13:30:50', '2024-04-11 10:28:09');
INSERT INTO `t_user` VALUES ('a036b08c189facd488d115954ca19f08', 'sxhZzTScVF8QKah1agmaoQ==', 'POwY5p9xe5NMwvKMibQ17A==', 'dHf4YG+tZUC2FRVLtubjJ6HXu6gOYSwqEXHBxTZnnQQ=', 'https://makun-ing-image-bed.oss-cn-chengdu.aliyuncs.com/chatbot-web/user-head/20240410161700-09304c89-e05b-4f87-8c09-fb5e3df1b32b.jpg', 'FWoWMt7dfIKOyA24aY+vwNxwSH0aFa/f4RnmxY8vQQPCOphtfSejgrT/rU+ZYg4w', 10, 10000, '2024-04-09 12:41:40', '2024-04-09 12:41:40');

SET FOREIGN_KEY_CHECKS = 1;
