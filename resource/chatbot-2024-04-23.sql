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

 Date: 23/04/2024 19:01:24
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
INSERT INTO `t_chat_message` VALUES ('0463447007d5f34be680dca594a2f4ae', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '写段代码', '2024-04-23 16:42:50');
INSERT INTO `t_chat_message` VALUES ('0527ca3f9cacc96c788a7b12621e3c78', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '46bdb8a4383c214a4eaa674f8eba4863', ' 你好，我是一款AI，专门设计来回答问题和提供帮助的。\n\n', '2024-04-23 16:29:18');
INSERT INTO `t_chat_message` VALUES ('058228c7819d9d48cace5712914efd66', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你好', '2024-04-23 16:54:14');
INSERT INTO `t_chat_message` VALUES ('0b7d519342cb58885ddf8fee12fcd448', 'b2cbea9470f8e3521ca610fa4572c8e5', 'assistant', '733a3c1b14fafb9bf906af76f57aaea9', ' 你好！有什么我可以帮助你的吗？\n\n', '2024-04-19 13:50:12');
INSERT INTO `t_chat_message` VALUES ('0d98a0da607f985ebf154773b10b91c2', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你是谁？', '2024-04-23 17:00:48');
INSERT INTO `t_chat_message` VALUES ('1133a51b69c881f13129e3a9ba8d2a79', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你好', '2024-04-23 17:04:05');
INSERT INTO `t_chat_message` VALUES ('11403c3dd67818863e9203300ce5a29c', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '154401ea0b86ff6bd64342b446f7ae9d', ' 我是一款智能聊天机器人，旨在帮助和回答各种问题。\n\n', '2024-04-23 16:42:26');
INSERT INTO `t_chat_message` VALUES ('154401ea0b86ff6bd64342b446f7ae9d', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你好', '2024-04-23 16:42:26');
INSERT INTO `t_chat_message` VALUES ('15cc2f4464a80051c72e8c84bb5ab99e', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', 'b833e060a910cc63b4afec749970b014', ' 当然，这里是一段代码，它将提示用户输入一个字符串并返回该字符串的长度：\n```\nimport java.util.Scanner;\npublic class Main {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        System.out.print(\"Enter a string: \");\n        String input = scanner.nextLine();\n        int length = input.length();\n        System.out.println(\"The length of \" + input + \" is \" + length);\n    }\n}\n```\n\n', '2024-04-23 16:30:52');
INSERT INTO `t_chat_message` VALUES ('179ef8ecb5589853d6b08bf42a6c4003', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你好', '2024-04-23 16:36:18');
INSERT INTO `t_chat_message` VALUES ('1e7e63c4529a63b3d095ec51b4861049', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你好', '2024-04-23 16:58:58');
INSERT INTO `t_chat_message` VALUES ('1fcba4a0349b63ff138927428aa38d10', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', 'f28512882fcda818e9acf00f6c0e039a', ' 是的，今天的天气非常好！你有任何问题需要我的帮助吗？\n\n', '2024-04-23 17:04:13');
INSERT INTO `t_chat_message` VALUES ('2135d6afd9255aaa605ae083d90ec0f4', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', 'badcdbd5d66f0fcd42ac9e2d40daf446', ' 当然，这里是两段话的Java代码：\n```\npublic class BubbleSort {\n    public static void main(String[] args) {\n        int[] arr = {5, 2, 8, 1, 7};\n        for (int num : arr) {\n            for (int i = 0; i < num - 1; i++) {\n                if (arr[i] > arr[i + 1]) {\n                    int temp = arr[i];\n                    arr[i] = arr[i + 1];\n                    arr[i + 1] = temp;\n                }\n            }\n        }\n        System.out.println(\"排序后的数组:\");\n        for (int num : arr) {\n            System.out.print(num + \" \");\n        }\n    }\n}\n```\n\n', '2024-04-23 16:29:12');
INSERT INTO `t_chat_message` VALUES ('339f470b1800ea85870d8497c439e7b4', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '1133a51b69c881f13129e3a9ba8d2a79', ' 很高兴认识你！有什么我可以帮你的吗？\n\n', '2024-04-23 17:04:05');
INSERT INTO `t_chat_message` VALUES ('35d0d5c8cbfc7fa95b32a3b5a77fa749', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '请帮我写一个java排序算法', '2024-04-23 16:52:02');
INSERT INTO `t_chat_message` VALUES ('360a8a5ba7b1f93a5f50d1b395005cfc', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '179ef8ecb5589853d6b08bf42a6c4003', ' 你好，有什么我可以帮你的吗？', '2024-04-23 16:36:18');
INSERT INTO `t_chat_message` VALUES ('3a9b636b46b28d86a483874b0454d60c', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '87ede439de9e5460037e959649f9e0aa', ' 你好！我是一款智能聊天机器人，可以帮你解答问题、提供信息和陪伴你。\n\n', '2024-04-23 17:21:51');
INSERT INTO `t_chat_message` VALUES ('3b8e51caf30db5aefeed456e4520c551', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '请把代码给我', '2024-04-23 17:05:15');
INSERT INTO `t_chat_message` VALUES ('3cff8d9ecf9c046753bd6110e3483c66', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你好', '2024-04-23 16:25:19');
INSERT INTO `t_chat_message` VALUES ('3fd5c2a5c169c28ee652bf08e2287115', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '0463447007d5f34be680dca594a2f4ae', ' 当然，这里是一段简单的Java代码，它将提示用户输入一个数字并返回该数字的平方：\n```\nimport java.util.Scanner;\npublic class Square {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        System.out.print(\"Enter a number: \");\n        int num = scanner.nextInt();\n        System.out.println(\"The square of \" + num + \" is \" + num * num);\n    }\n}\n```\n\n', '2024-04-23 16:42:50');
INSERT INTO `t_chat_message` VALUES ('414ee8e5749f15aee71f62e799747f6e', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你好，请求为我写两段话', '2024-04-23 16:28:30');
INSERT INTO `t_chat_message` VALUES ('4232d3778b5664a054fad7f041fe9206', 'b2cbea9470f8e3521ca610fa4572c8e5', 'assistant', '920361d3c1ddbd315f65f3ba93994e2e', ' 你好！有什么我可以帮助你的吗？\n\n', '2024-04-19 13:46:02');
INSERT INTO `t_chat_message` VALUES ('4489aa0d7b3051ba1ca19c0ff1c30172', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '写一段代码', '2024-04-23 16:29:42');
INSERT INTO `t_chat_message` VALUES ('46bdb8a4383c214a4eaa674f8eba4863', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你好', '2024-04-23 16:29:18');
INSERT INTO `t_chat_message` VALUES ('4a10349b15a3cd7eefebc13f3586d185', 'b2cbea9470f8e3521ca610fa4572c8e5', 'user', NULL, '你好', '2024-04-19 13:47:22');
INSERT INTO `t_chat_message` VALUES ('4b88d72c6548bc441bd1a73a0bf68058', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你好', '2024-04-23 17:26:45');
INSERT INTO `t_chat_message` VALUES ('4db2037da375d17b8e72821672b0c223', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '1e7e63c4529a63b3d095ec51b4861049', ' 很高兴能帮到你！有什么我可以帮你的吗？', '2024-04-23 16:58:58');
INSERT INTO `t_chat_message` VALUES ('546f742d1cfafc914ef994bf8f88c7ef', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '请使用Java', '2024-04-23 16:24:38');
INSERT INTO `t_chat_message` VALUES ('5dabcf4a5a5377b2a60504b237445e05', 'b2cbea9470f8e3521ca610fa4572c8e5', 'assistant', 'c0acfeb637ec65488f0931e3a2cb912a', ' 你好！有什么我可以帮助你的吗？\n\n', '2024-04-19 13:45:50');
INSERT INTO `t_chat_message` VALUES ('5e39018c833045806291e922dfd2efde', 'a2ef3f3de3a05425852bccc1aab27f0c', 'user', NULL, '你好啊', '2024-04-23 17:31:41');
INSERT INTO `t_chat_message` VALUES ('6096b11e1c12c44f7c61c864a4cce4e3', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '622147bdc328e0ef7dd75fdb160937d7', ' 我是一款智能聊天机器人，旨在回答各种问题并提供帮助。\n\n', '2024-04-23 16:58:16');
INSERT INTO `t_chat_message` VALUES ('622147bdc328e0ef7dd75fdb160937d7', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你好', '2024-04-23 16:58:16');
INSERT INTO `t_chat_message` VALUES ('623deed4bc82261601d831cf8ac1c961', 'b2cbea9470f8e3521ca610fa4572c8e5', 'assistant', '4a10349b15a3cd7eefebc13f3586d185', ' 你好！有什么我可以帮助你的吗？\n\n', '2024-04-19 13:47:22');
INSERT INTO `t_chat_message` VALUES ('671b5b5f5468cd3f6432107bc342a4f7', 'a2ef3f3de3a05425852bccc1aab27f0c', 'system', NULL, 'You are a helpful assistant. You can help me by answering my questions. You can also ask me questions.', '2024-04-23 17:31:35');
INSERT INTO `t_chat_message` VALUES ('68ede0c86396dabcbb868aa5e5700454', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '9a33ddc67e7c0159e97b4cde111d1bfa', ' 当然，我很乐意帮你编写冒泡排序算法！请问你需要排序的数组吗？\n\n', '2024-04-23 17:04:24');
INSERT INTO `t_chat_message` VALUES ('6994621e2f33aad8923dde11f13a5712', 'b2cbea9470f8e3521ca610fa4572c8e5', 'assistant', '9b0443fe1951c7aefc84aade0f93ee32', ' 以下是一个使用C++编写的快速排序算法：\n```c++\n#include <iostream>\n#include <vector>\nusing namespace std;\nvoid quickSort(vector<int>& arr) {\n    if (arr.size() <= 1)\n        return;\n    \n    int pivot = arr[0];\n    int left = 0;\n    int right = arr.size() - 1;\n    \n    while (left < right) {\n        while (left < right && arr[left] >= pivot)\n            left++;\n        \n        while (left < right && arr[right] >= pivot)\n            right--;\n        \n        if (left < right) {\n            arr[left] = arr[right];\n            ++right;\n        }\n    }\n    \n    quickSort(arr, left, pivot - 1);\n    quickSort(arr, pivot + 1, right);\n}\nint main() {\n    vector<int> arr = {10, 5, 8, 3, 7};\n    \n    quickSort(arr);\n    \n    cout << \"Sorted array: \" << endl;\n    for (int i = 0; i < arr.size(); i++)\n        cout << arr[i] << \" \";\n    cout << endl;\n    \n    return 0;\n}\n```\n\n', '2024-04-23 10:46:24');
INSERT INTO `t_chat_message` VALUES ('6b178ee7cb4b523b672c10b97200a44b', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你好', '2024-04-23 17:27:13');
INSERT INTO `t_chat_message` VALUES ('6b71e1056c441a7644da6b478ef23183', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', 'b7e44d34a94245136aa841e002ba0922', ' 我是一款智能聊天机器人，可以帮你解答问题、提供信息和陪伴你。\n\n', '2024-04-23 17:19:33');
INSERT INTO `t_chat_message` VALUES ('733a3c1b14fafb9bf906af76f57aaea9', 'b2cbea9470f8e3521ca610fa4572c8e5', 'user', NULL, '你好', '2024-04-19 13:50:12');
INSERT INTO `t_chat_message` VALUES ('7770dfaabd13f967ef53c925ad04a870', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '我还要C++的排序算法', '2024-04-23 16:54:54');
INSERT INTO `t_chat_message` VALUES ('799c7aa93f0506044244009158edf019', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '是的', '2024-04-23 17:04:33');
INSERT INTO `t_chat_message` VALUES ('7af49bc93a242bb4fea471af56722c7e', 'b2cbea9470f8e3521ca610fa4572c8e5', 'assistant', 'e91d9f53c9f6144d40c6a7add81255cc', ' 你好！有什么我可以帮助你的吗？\n\n', '2024-04-19 13:18:45');
INSERT INTO `t_chat_message` VALUES ('7bd0cdeb096b193345c436d8239e6ec4', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '4489aa0d7b3051ba1ca19c0ff1c30172', ' 当然，这里是一段简单的Java代码，它将提示用户输入一个数字并返回该数字的平方：\n```\nimport java.util.Scanner;\npublic class Square {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        System.out.print(\"Enter a number: \");\n        int num = scanner.nextInt();\n        System.out.println(\"The square of \" + num + \" is \" + num * num);\n    }\n}\n```\n\n', '2024-04-23 16:29:42');
INSERT INTO `t_chat_message` VALUES ('7e51785d0b28173177d745ee7977de48', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '3cff8d9ecf9c046753bd6110e3483c66', ' 你好，我是一款智能聊天机器人，旨在帮助和回答各种问题。\n\n', '2024-04-23 16:25:19');
INSERT INTO `t_chat_message` VALUES ('7ebf4388fa4fbbaf47c11b081fc21507', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你好', '2024-04-23 16:56:46');
INSERT INTO `t_chat_message` VALUES ('7f65047bcb84e8c6ceb93896d3939c85', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', 'e58a13aaeeb5dfafa8c59eb957431648', ' 当然，我可以帮你编写冒泡排序。\n\n', '2024-04-23 16:24:10');
INSERT INTO `t_chat_message` VALUES ('8099e8fac4fbd6c4895a0ca79942d6f3', 'b2cbea9470f8e3521ca610fa4572c8e5', 'user', NULL, '你是谁？', '2024-04-19 13:47:33');
INSERT INTO `t_chat_message` VALUES ('8500280f6ef86c913419fd3798a92016', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '0d98a0da607f985ebf154773b10b91c2', ' 我是一款智能聊天机器人，旨在帮助和回答各种问题。\n\n', '2024-04-23 17:00:48');
INSERT INTO `t_chat_message` VALUES ('87ede439de9e5460037e959649f9e0aa', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你好', '2024-04-23 17:21:51');
INSERT INTO `t_chat_message` VALUES ('920361d3c1ddbd315f65f3ba93994e2e', 'b2cbea9470f8e3521ca610fa4572c8e5', 'user', NULL, '你好？', '2024-04-19 13:46:02');
INSERT INTO `t_chat_message` VALUES ('932369ec5dd2f51aef3c6293aaab0bda', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', 'c693d80b68f9175d18829c6a6cd6ac08', ' 很高兴能帮到你！', '2024-04-23 17:17:09');
INSERT INTO `t_chat_message` VALUES ('9363c954393c2fdebbcc4a92646770bf', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '546f742d1cfafc914ef994bf8f88c7ef', ' 当然，这里是冒泡排序的Java代码：\n```\npublic class BubbleSort {\n    public static void main(String[] args) {\n        int[] arr = {5, 2, 8, 1, 7};\n        for (int i = 0; i < arr.length - 1; i++) {\n            for (int j = 0; j < arr.length - 1 - i; j++) {\n                if (arr[j] > arr[j + 1]) {\n                    int temp = arr[j];\n                    arr[j] = arr[j + 1];\n                    arr[j + 1] = temp;\n                }\n            }\n        }\n        System.out.println(\"排序后的数组:\");\n        for (int num : arr) {\n            System.out.print(num + \" \");\n        }\n    }\n}\n```\n\n', '2024-04-23 16:24:38');
INSERT INTO `t_chat_message` VALUES ('9616bacab680db558eebb24fdc2da9fa', 'b2cbea9470f8e3521ca610fa4572c8e5', 'assistant', 'f7c4a0b882e40d15017ef595d615fa74', ' 好的，以下是一个使用Java编写快速排序算法的示例代码：\n```java\npublic class QuickSort {\n    public static void main(String[] args) {\n        int[] arr = {10, 5, 8, 3, 7};\n        quickSort(arr);\n        System.out.println(\"Sorted array: \" + Arrays.toString(arr));\n    }\n    \n    public static void quickSort(int[] arr) {\n        int left = 0;\n        int right = arr.length - 1;\n        \n        while (left <= right) {\n            while (left < right && arr[right] > arr[left])\n                right--;\n            \n            if (left < right)\n                swap(arr, left, right);\n            \n            left++;\n            right--;\n        }\n        \n        printArray(arr);\n    }\n    \n    public static void swap(int[] arr, int i, int j) {\n        int temp = arr[i];\n        arr[i] = arr[j];\n        arr[j] = temp;\n    }\n    \n    public static void swap(int[] array1, int i1, int j1) {\n        for (int k = 0; k < array1.length; k++)\n            if (k != i && k != j)\n                swapArray(array1, i++, j--);\n    }\n}\n```\n\n', '2024-04-19 14:47:11');
INSERT INTO `t_chat_message` VALUES ('9a33ddc67e7c0159e97b4cde111d1bfa', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '请帮我写一个冒泡排序算法', '2024-04-23 17:04:24');
INSERT INTO `t_chat_message` VALUES ('9b0443fe1951c7aefc84aade0f93ee32', 'b2cbea9470f8e3521ca610fa4572c8e5', 'user', NULL, 'C++的呢？', '2024-04-23 10:46:24');
INSERT INTO `t_chat_message` VALUES ('9ff12c26e99c7949027556bc093a92ba', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', 'e760f767fd87f4ae6d10e0ca86a2a7ff', ' 很高兴能帮到你！有什么我可以帮你的吗？', '2024-04-23 16:59:00');
INSERT INTO `t_chat_message` VALUES ('a17f9bd58ebc4b224db9b89ffc357c11', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你是谁？', '2024-04-23 16:23:55');
INSERT INTO `t_chat_message` VALUES ('a2748fd142f3229abb89798a1a63dab0', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你好', '2024-04-23 17:14:29');
INSERT INTO `t_chat_message` VALUES ('a2df79e3edb1709d5b12a1d1bfceb80e', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '058228c7819d9d48cace5712914efd66', ' 你好，有什么我可以帮你的吗？\n\n', '2024-04-23 16:54:14');
INSERT INTO `t_chat_message` VALUES ('a6b14b724501ec1d928b76262be5c531', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你好', '2024-04-23 17:00:41');
INSERT INTO `t_chat_message` VALUES ('b6ebd8f2c8b550ecbd343b3a6bbb033a', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', 'a17f9bd58ebc4b224db9b89ffc357c11', ' 我是一个AI，由OpenAI训练而成。我的目的是提供帮助和信息，而不是讨论我的起源。\n\n', '2024-04-23 16:23:55');
INSERT INTO `t_chat_message` VALUES ('b7e44d34a94245136aa841e002ba0922', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你是谁？你能帮我干什么？', '2024-04-23 17:19:33');
INSERT INTO `t_chat_message` VALUES ('b833e060a910cc63b4afec749970b014', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '再来一段', '2024-04-23 16:30:52');
INSERT INTO `t_chat_message` VALUES ('b85047692456d9d3f1f7367013440e10', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '35d0d5c8cbfc7fa95b32a3b5a77fa749', ' 当然，这里是一段简单的Java排序算法的代码：\n```\npublic class Sort {\n    public static void main(String[] args) {\n        int[] arr = {5, 2, 8, 1};\n        Arrays.sort(arr);\n        for (int i = 0; i < arr.length; i++) {\n            System.out.print(arr[i] + \" \");\n        }\n    }\n}\n```\n\n', '2024-04-23 16:52:02');
INSERT INTO `t_chat_message` VALUES ('b8e88b5f1fcb50d531c53676ceadb39b', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '7770dfaabd13f967ef53c925ad04a870', ' 当然，这里是一段简单的C++排序算法：\n```\n#include <iostream>\nusing namespace std;\nint main() {\n    int arr[] = {5, 2, 8, 1};\n    int n = arr.length;\n    for (int i = 0; i < n - 1; i++) {\n        for (int j = 0; j < n - i - 1; j++) {\n            if (arr[j] > arr[j + 1]) {\n                int temp = arr[j];\n                arr[j] = arr[j + 1];\n                arr[j + 1] = temp;\n            }\n        }\n    }\n    cout << \"排序后的数组: \";\n    for (int i = 0; i < n; i++) {\n        cout << arr[i] << \" \";\n    }\n    cout << endl;\n    return 0;\n}\n```\n\n', '2024-04-23 16:54:54');
INSERT INTO `t_chat_message` VALUES ('b8f4adabb342f898559dbfc8d7f9f3fe', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '6b178ee7cb4b523b672c10b97200a44b', ' 我是一款智能聊天机器人，可以帮你解答问题、提供信息和陪伴你。\n\n', '2024-04-23 17:27:13');
INSERT INTO `t_chat_message` VALUES ('b9fb5ae5f4188364f1c33334800ceaec', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', 'f2d7bbb5a79006df797e43f754478126', ' 你好，有什么我可以帮你的吗？', '2024-04-23 16:51:04');
INSERT INTO `t_chat_message` VALUES ('badcdbd5d66f0fcd42ac9e2d40daf446', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你好，请求为我写两段话', '2024-04-23 16:29:12');
INSERT INTO `t_chat_message` VALUES ('be38c3c5c796c9276b979d4c744f6843', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '7ebf4388fa4fbbaf47c11b081fc21507', ' 你好，有什么我可以帮你的吗？', '2024-04-23 16:56:46');
INSERT INTO `t_chat_message` VALUES ('c0acfeb637ec65488f0931e3a2cb912a', 'b2cbea9470f8e3521ca610fa4572c8e5', 'user', NULL, '你好', '2024-04-19 13:45:50');
INSERT INTO `t_chat_message` VALUES ('c235974f281f69c203f33663d7323f0b', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', 'd206902f7014b754e827b52ccc7c9ef2', ' 当然，我很乐意帮你编写一个冒泡排序算法！请问你需要排序的数组吗？\n\n', '2024-04-23 17:04:50');
INSERT INTO `t_chat_message` VALUES ('c3a8dfec10bac0c8934cd3b36ccc031e', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', 'a6b14b724501ec1d928b76262be5c531', ' 我是一款智能聊天机器人，旨在帮助和回答各种问题。\n\n', '2024-04-23 17:00:41');
INSERT INTO `t_chat_message` VALUES ('c693d80b68f9175d18829c6a6cd6ac08', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你好', '2024-04-23 17:17:09');
INSERT INTO `t_chat_message` VALUES ('c86edab3e64e6f7abb57688c6ce78488', '9d9f65dd1a660ad34f99d1098a0164b8', 'system', NULL, '你是一个高级软件工程师，你需要帮我解答各种技术难题、设计技术方案以及编写代码。你编写的代码必须可以正常运行，而且没有任何 Bug 和其他问题。如果你的回答中用代码，请用 markdown 代码块，并且在代码块中标明使用的编程语言。', '2024-04-23 16:23:44');
INSERT INTO `t_chat_message` VALUES ('cc97b982def066ce821149a97a96821b', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', 'e33a7d9e4feb07594cb2d5aa0fe87c67', ' 当然，这里是一段代码，它将提示用户输入一个字符串并返回该字符串的长度：\n```\nimport java.util.Scanner;\npublic class Main {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        System.out.print(\"Enter a string: \");\n        String input = scanner.nextLine();\n        int length = input.length();\n        System.out.println(\"The length of \" + input + \" is \" + length);\n    }\n}\n```\n\n', '2024-04-23 16:43:35');
INSERT INTO `t_chat_message` VALUES ('cda8f9773b016462899c4626faa294b3', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '4b88d72c6548bc441bd1a73a0bf68058', ' 很高兴认识你！有什么需要帮助的吗？', '2024-04-23 17:26:45');
INSERT INTO `t_chat_message` VALUES ('d11748da053b831b69a0ccb28de5c882', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '3b8e51caf30db5aefeed456e4520c551', ' 当然，这是你需要的Java代码：\n```\npublic class BubbleSort {\n    public static void main(String[] args) {\n        int[] arr = {5, 2, 8, 1};\n        bubbleSort(arr);\n        for (int i = 0; i < arr.length; i++) {\n            System.out.print(arr[i] + \" \");\n        }\n    }\n    public static void bubbleSort(int[] arr) {\n        for (int i = 0; i < arr.length - 1; i++) {\n            for (int j = 0; j < arr.length - 1 - i; j++) {\n                if (arr[j] > arr[j + 1]) {\n                    // swap elements\n                    int temp = arr[j];\n                    arr[j] = arr[j + 1];\n                    arr[j + 1] = temp;\n                }\n            }\n        }\n    }\n}\n```\n\n', '2024-04-23 17:05:15');
INSERT INTO `t_chat_message` VALUES ('d1504e40021c14733318c43a18fcc1a7', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', 'dc7774a7dbc06ff144c2d1d4aec75615', ' 好的，冒泡排序的基本思路是比较相邻的两个元素，如果它们的顺序错误就交换它们。这样一轮下来，最大（或最小）的数会被“浮”到数列的末尾。\n\n', '2024-04-23 16:24:20');
INSERT INTO `t_chat_message` VALUES ('d206902f7014b754e827b52ccc7c9ef2', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '用Java帮我写一个', '2024-04-23 17:04:50');
INSERT INTO `t_chat_message` VALUES ('d42511107d72fb63b52c9c77481c4650', 'b2cbea9470f8e3521ca610fa4572c8e5', 'assistant', '8099e8fac4fbd6c4895a0ca79942d6f3', ' 我是一个AI语言模型，可以回答你的问题和提供帮助。\n\n', '2024-04-19 13:47:33');
INSERT INTO `t_chat_message` VALUES ('d4c94647b0ef754885179e5872bf32a9', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '414ee8e5749f15aee71f62e799747f6e', ' 当然，这里是两段话的Java代码：\n```\npublic class BubbleSort {\n    public static void main(String[] args) {\n        int[] arr = {5, 2, 8, 1, 7};\n        for (int num : arr) {\n            for (int i = 0; i < num - 1; i++) {\n                if (arr[i] > arr[i + 1]) {\n                    int temp = arr[i];\n                    arr[i] = arr[i + 1];\n                    arr[i + 1] = temp;\n                }\n            }\n        }\n        System.out.println(\"排序后的数组:\");\n        for (int num : arr) {\n            System.out.print(num + \" \");\n        }\n    }\n}\n```\n\n', '2024-04-23 16:28:30');
INSERT INTO `t_chat_message` VALUES ('da592f8a8a59b4751bc6516a821e3d70', 'a2ef3f3de3a05425852bccc1aab27f0c', 'assistant', '5e39018c833045806291e922dfd2efde', ' 你好！有什么我可以帮你的吗？\n\n', '2024-04-23 17:31:41');
INSERT INTO `t_chat_message` VALUES ('dc7774a7dbc06ff144c2d1d4aec75615', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '写吧', '2024-04-23 16:24:20');
INSERT INTO `t_chat_message` VALUES ('e33a7d9e4feb07594cb2d5aa0fe87c67', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '再来一段', '2024-04-23 16:43:35');
INSERT INTO `t_chat_message` VALUES ('e58a13aaeeb5dfafa8c59eb957431648', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '帮我写一个冒泡排序', '2024-04-23 16:24:10');
INSERT INTO `t_chat_message` VALUES ('e760f767fd87f4ae6d10e0ca86a2a7ff', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你好', '2024-04-23 16:59:00');
INSERT INTO `t_chat_message` VALUES ('e8ed2336c17d62d69735676ea9c309f2', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', '799c7aa93f0506044244009158edf019', ' 好的，我会尽力帮你完成任务。\n\n', '2024-04-23 17:04:33');
INSERT INTO `t_chat_message` VALUES ('e91d9f53c9f6144d40c6a7add81255cc', 'b2cbea9470f8e3521ca610fa4572c8e5', 'user', NULL, '你好', '2024-04-19 13:18:45');
INSERT INTO `t_chat_message` VALUES ('f28512882fcda818e9acf00f6c0e039a', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '今天天气真不错呀', '2024-04-23 17:04:13');
INSERT INTO `t_chat_message` VALUES ('f2d7bbb5a79006df797e43f754478126', '9d9f65dd1a660ad34f99d1098a0164b8', 'user', NULL, '你好', '2024-04-23 16:51:04');
INSERT INTO `t_chat_message` VALUES ('f650c2f44adc153798cc00e669468311', '9d9f65dd1a660ad34f99d1098a0164b8', 'assistant', 'a2748fd142f3229abb89798a1a63dab0', ' 你好，我是一款智能聊天机器人，很高兴能帮到你！', '2024-04-23 17:14:29');
INSERT INTO `t_chat_message` VALUES ('f7c4a0b882e40d15017ef595d615fa74', 'b2cbea9470f8e3521ca610fa4572c8e5', 'user', NULL, '请使用Java帮我写一个快速排序算法', '2024-04-19 14:47:11');

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
INSERT INTO `t_chat_session` VALUES ('93aafc3fa7f4a8c0fdd3f0c5bfc6f2f5', '9bd17cbf5f8ea20207b3305eef42c1ac', '1', '[洗心革面好男孩]的API', '2024-04-19 12:25:27', '2024-04-19 12:25:27');
INSERT INTO `t_chat_session` VALUES ('9d9f65dd1a660ad34f99d1098a0164b8', 'faecf96a4a822452df162b566f8f27fd', '1', '测试', '2024-04-23 16:23:44', '2024-04-23 16:23:44');
INSERT INTO `t_chat_session` VALUES ('a2ef3f3de3a05425852bccc1aab27f0c', 'faecf96a4a822452df162b566f8f27fd', '1', '测试', '2024-04-23 17:31:35', '2024-04-23 17:31:35');
INSERT INTO `t_chat_session` VALUES ('b2cbea9470f8e3521ca610fa4572c8e5', 'faecf96a4a822452df162b566f8f27fd', '1', '[InsectMk]的API', '2024-04-19 10:15:18', '2024-04-19 10:15:18');

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
  `temperature` double NULL DEFAULT 1,
  `top_p` double NULL DEFAULT 0.3,
  `presence_penalty` double NULL DEFAULT 0,
  `frequency_penalty` double NULL DEFAULT 1,
  `max_token` int(11) UNSIGNED ZEROFILL NULL DEFAULT 00000001024 COMMENT '最长上下文Token',
  `generate_tokens` bigint(20) NULL DEFAULT 0 COMMENT '已生成的Token数量',
  `deployment_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_model_version
-- ----------------------------
INSERT INTO `t_model_version` VALUES ('1', 'RWKV', '0.0.1', 'http://rwkv.frp.insectmk.top/', '', 1, 0.3, 0, 1, 00000001024, 31626, '2024-02-29 09:44:41', '默认模型');
INSERT INTO `t_model_version` VALUES ('103550eb06ea493723e666207d37d722', 'GPU-4G-7B-CN', '0.0.1', 'http://rwkv.frp.insectmk.top/', NULL, 1, 0.4, 0, 1, 00000001024, 2541, '2024-04-09 16:16:23', 'GPU-4G-7B-CN');
INSERT INTO `t_model_version` VALUES ('564f41e0d16a309431acd17457bae441', 'GPU-4G-3B-World', '0.0.1', 'http://rwkv.frp.insectmk.top/', NULL, 1, 0.3, 0, 1, 00000001024, 4513, '2024-04-09 16:15:10', 'GPU-4G-3B-World');
INSERT INTO `t_model_version` VALUES ('6c8e08ea4324ef0bbcd13bcf651682ce', 'test', 'sadfsadf', 'http://rwkv.frp.insectmk.top/', '', 1, 0.3, 0, 1, 00000001024, 0, '2024-04-10 11:34:59', 'fdsafsdf');
INSERT INTO `t_model_version` VALUES ('6f697caf794e5624f660204482bf31e0', 'GPU-2G-3B-World', '0.0.1', 'http://rwkv.frp.insectmk.top/', NULL, 1, 0.3, 0, 1, 00000001024, 854, '2024-04-09 16:13:41', '2G显存-30亿参数-全世界语言');
INSERT INTO `t_model_version` VALUES ('8fd398b4ca8418793a3c882e5e4b616e', 'GPU-2G-1B5-World', '0.0.1', 'http://rwkv.frp.insectmk.top/', NULL, 1, 0.3, 0, 1, 00000001024, 1423, '2024-04-09 16:12:39', '2G显存-15亿参数');
INSERT INTO `t_model_version` VALUES ('a20ebce361b9fe1e4c3eb34229e2338c', 'GPU-4G-1B5-World', '0.0.1', 'http://rwkv.frp.insectmk.top/', NULL, 1, 0.3, 0, 1, 00000001024, 154, '2024-04-09 16:14:31', '4G显存-15亿参数-世界语言');
INSERT INTO `t_model_version` VALUES ('b8e780bd16cc223d01fd78981022d430', 'GPU-4G-3B-CN', '0.0.1', 'http://rwkv.frp.insectmk.top/', NULL, 1, 0.3, 0, 1, 00000001024, 2587, '2024-04-09 16:15:39', 'GPU-4G-3B-CN');
INSERT INTO `t_model_version` VALUES ('bb0abb2b648faa0956c28f5cf64ebd8f', 'GPU-4G-7B-World', '0.0.1', 'http://rwkv.frp.insectmk.top/', NULL, 1, 0.3, 0, 1, 00000001024, 7843, '2024-04-09 16:15:58', 'GPU-4G-7B-World');
INSERT INTO `t_model_version` VALUES ('c667f0ebd57917c58d9878004620f296', '测试模型', '0.0.1', 'http://rwkv.frp.insectmk.top/', NULL, 1, 0.3, 0, 1, 00000001024, 0, '2024-04-18 15:59:58', '测试模型，无意义');
INSERT INTO `t_model_version` VALUES ('f4fd5c356c23163d5653a8e5cfeb0a71', 'InsectMk\'s LoRA', '0.0.1', 'http://rwkv.frp.insectmk.top/', NULL, 1, 0.3, 0, 1, 00000001024, 4892, '2024-04-09 13:59:32', 'InsectMk的微调模型');

-- ----------------------------
-- Table structure for t_partner
-- ----------------------------
DROP TABLE IF EXISTS `t_partner`;
CREATE TABLE `t_partner`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '搭档名称',
  `prompt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '人物设定',
  `head` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像地址',
  `is_public` tinyint(4) NULL DEFAULT NULL COMMENT '是否公开',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_partner
-- ----------------------------
INSERT INTO `t_partner` VALUES ('1', 'faecf96a4a822452df162b566f8f27fd', '默认搭档', 'You are a helpful assistant. You can help me by answering my questions. You can also ask me questions.', 'https://insectmk.cn/static/img/head/insectmk.png', 1, '2024-04-23 09:45:13');
INSERT INTO `t_partner` VALUES ('2', 'faecf96a4a822452df162b566f8f27fd', '测试搭档', 'You are a helpful assistant. You can help me by answering my questions. You can also ask me questions.', 'https://insectmk.cn/static/img/head/insectmk.png', 0, '2024-04-23 11:49:13');
INSERT INTO `t_partner` VALUES ('f00c160402d79c22af3f1498faa272df', 'faecf96a4a822452df162b566f8f27fd', '软件工程师', '你是一个高级软件工程师，你需要帮我解答各种技术难题、设计技术方案以及编写代码。你编写的代码必须可以正常运行，而且没有任何 Bug 和其他问题。如果你的回答中用代码，请用 markdown 代码块，并且在代码块中标明使用的编程语言。', 'https://pub-45c0b529c25a4d388dfa7cf57f35f8f0.r2.dev/avatar/programmer.png', 0, '2024-04-23 13:25:35');

-- ----------------------------
-- Table structure for t_system
-- ----------------------------
DROP TABLE IF EXISTS `t_system`;
CREATE TABLE `t_system`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '系统名称',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '系统Logo',
  `only_one_row` int(11) GENERATED ALWAYS AS (1) VIRTUAL COMMENT '一行记录约束' NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `only_one_row`(`only_one_row`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_system
-- ----------------------------
INSERT INTO `t_system` VALUES ('1', NULL, NULL, DEFAULT);

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
INSERT INTO `t_system_log` VALUES ('02e9e6208cc99f34ff55440e9f6fd8e8', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-23 16:58:17');
INSERT INTO `t_system_log` VALUES ('037196f3ba398babf50f6c97c4a212a5', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:02:51');
INSERT INTO `t_system_log` VALUES ('03b3a6c81fdbaf58a484f49a55a208fb', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:51:02');
INSERT INTO `t_system_log` VALUES ('06ceb8cc09bf3d7f8d1dee551c6be873', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 13:01:37');
INSERT INTO `t_system_log` VALUES ('07ef0a28c3039ebe10871023e5487e21', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:29:27');
INSERT INTO `t_system_log` VALUES ('094121e520fd1ec15fb396c4e0fadd90', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.UserController.info', '2024-04-10 16:41:13');
INSERT INTO `t_system_log` VALUES ('0b71d56b17f4203b5141dd1afe9affae', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:24:42');
INSERT INTO `t_system_log` VALUES ('0ba5cf1cb31f788e63e7cc2d49350f08', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-18 13:12:46');
INSERT INTO `t_system_log` VALUES ('0bb5317b19453ec3d168a8567ededfec', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:51:02');
INSERT INTO `t_system_log` VALUES ('0ec4f9fb4f962aa1fa39895e7c15bfa9', '127.0.0.1', '未知', '错误', '服务器出错：Request method \'GET\' not supported', '2024-04-23 15:45:10');
INSERT INTO `t_system_log` VALUES ('0eda7626fd768c8308e689a2b9d7fe02', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:19:04');
INSERT INTO `t_system_log` VALUES ('0f0a008064f823381ba757286464e431', '127.0.0.1', '3067836615@qq.com', '错误', '服务器出错：Content type \'multipart/form-data;boundary=----WebKitFormBoundaryeDvsNdRvFYsTeKL3;charset=UTF-8\' not supported', '2024-04-10 13:17:31');
INSERT INTO `t_system_log` VALUES ('0f12eaf7bfe3be8d3143316ab9bae25d', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-10 18:57:34');
INSERT INTO `t_system_log` VALUES ('0f7f967b95309f0ffd45adfe917b9a82', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.captcha', '2024-04-11 09:35:55');
INSERT INTO `t_system_log` VALUES ('105803268a694e77c2c3ef447f61c956', '127.0.0.1', '未知', '警告', '过多请求：info', '2024-04-10 12:40:04');
INSERT INTO `t_system_log` VALUES ('11652763fe1da11bd98da59d4aeba71b', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatSessionController.findAllMessage', '2024-04-10 18:32:18');
INSERT INTO `t_system_log` VALUES ('165ce84172784001b91edd7e2f23aa8a', '127.0.0.1', '3067836615@qq.com', '警告', '业务异常：模型不在线', '2024-04-19 13:49:23');
INSERT INTO `t_system_log` VALUES ('17bb4f3129dc1440243aea6bd22d3b28', '127.0.0.1', '未知', '错误', '出错了：java.sql.SQLException: Field \'password\' doesn\'t have a default value', '2024-04-19 12:19:06');
INSERT INTO `t_system_log` VALUES ('1bdee35992f270006a17927e413b1a49', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 10:16:52');
INSERT INTO `t_system_log` VALUES ('1c2cc8a3a32a803970bcd2876fccf753', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-18 17:50:15');
INSERT INTO `t_system_log` VALUES ('1c638d0e9beb1556adf360d1139b128d', '127.0.0.1', '未知', '错误', '出错了：java.sql.SQLException: Field \'password\' doesn\'t have a default value', '2024-04-19 12:21:24');
INSERT INTO `t_system_log` VALUES ('1c9ab8d7e85f3b21dd9f50114a140930', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:02:06');
INSERT INTO `t_system_log` VALUES ('1dca307ff2a92dcedd8d271ea5e3e923', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:49:04');
INSERT INTO `t_system_log` VALUES ('1e92c756d667f707fcf2ac2c32d44007', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:59:40');
INSERT INTO `t_system_log` VALUES ('1ee336e58e69d6e753d001be96ce60a9', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatSessionController.findAllMessage', '2024-04-10 18:32:29');
INSERT INTO `t_system_log` VALUES ('1f689d3e08a0c0e5635776abd4dec802', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-11 09:27:56');
INSERT INTO `t_system_log` VALUES ('205d8926b047d5ac36a4746d5087b014', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '错误', '出错了：com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'temperature\' in \'field list\'', '2024-04-18 15:26:09');
INSERT INTO `t_system_log` VALUES ('244c447fdd212821fa99b6c486b96589', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 09:10:19');
INSERT INTO `t_system_log` VALUES ('25252ea571e7552b6ba2d1ea8b266bd1', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 10:16:46');
INSERT INTO `t_system_log` VALUES ('268ff19005b4925c9ee07d9dc64ea88d', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-10 18:58:19');
INSERT INTO `t_system_log` VALUES ('26d3edf2bff04658458f07cf51f00766', '127.0.0.1', '3067836615@qq.com', '错误', '服务器出错：Content type \'multipart/form-data;boundary=----WebKitFormBoundary0dvy9SVpSkvW1uDH;charset=UTF-8\' not supported', '2024-04-10 13:20:17');
INSERT INTO `t_system_log` VALUES ('274f99f53b46ca3bb2ae7408087f6a18', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 13:13:25');
INSERT INTO `t_system_log` VALUES ('29e1a629177833ca33a8026c70153bd8', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-11 10:18:29');
INSERT INTO `t_system_log` VALUES ('2a7d3e97d235dde5732bb3064ce68f97', '127.0.0.1', '未知', '错误', '出错了：java.sql.SQLException: Field \'password\' doesn\'t have a default value', '2024-04-19 12:20:27');
INSERT INTO `t_system_log` VALUES ('2ac603cc67ba6485ae73444858bd0389', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:01:11');
INSERT INTO `t_system_log` VALUES ('2c90eb16e7e2964191f309768b94d8f0', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatSessionController.findAllMessage', '2024-04-10 18:32:29');
INSERT INTO `t_system_log` VALUES ('2df38a0b8d92f921830d6725e4abbb21', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:17:48');
INSERT INTO `t_system_log` VALUES ('2e13ae72b5f24eb7f4b1370ca99ce61d', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 09:09:16');
INSERT INTO `t_system_log` VALUES ('2e26d05df2443ccd8bf82b09bd0fe8c0', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'creat_time\' in \'field list\'', '2024-04-23 12:10:56');
INSERT INTO `t_system_log` VALUES ('2ebc3b5500d0bd731632b1e025bea360', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.captcha', '2024-04-10 22:36:12');
INSERT INTO `t_system_log` VALUES ('308b256a47e067135b5726c49a6dcc70', '127.0.0.1', '3067836615@qq.com', '警告', '业务异常：模型不在线', '2024-04-19 13:48:21');
INSERT INTO `t_system_log` VALUES ('30a6e9c780b2062fac17b7824f7a3b66', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 09:26:05');
INSERT INTO `t_system_log` VALUES ('3171554c14204574fd3208d5af4014e4', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-10 18:58:18');
INSERT INTO `t_system_log` VALUES ('3308f5a8f142dcc8c010c78b4f2b130d', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 09:10:19');
INSERT INTO `t_system_log` VALUES ('3327a441c7cda1a117fb29fd0bf73802', '127.0.0.1', '未知', '错误', '服务器出错：Request method \'GET\' not supported', '2024-04-23 15:43:57');
INSERT INTO `t_system_log` VALUES ('3354eb3b1b22b418239c08f754ff7b57', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:02:10');
INSERT INTO `t_system_log` VALUES ('337762c2c2ff3f4fb8f657d80b3ea1b0', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-18 17:52:47');
INSERT INTO `t_system_log` VALUES ('337c9427821a46c43e6f01d2b0bdf110', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 08:52:58');
INSERT INTO `t_system_log` VALUES ('343a8c14dbd0add5f437652f085e82c8', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-11 09:27:58');
INSERT INTO `t_system_log` VALUES ('350b40ae958976b7d6f9548ab0802491', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 09:12:06');
INSERT INTO `t_system_log` VALUES ('35c6549684778e708b7a7c40c58c45d3', '0:0:0:0:0:0:0:1', '未知', '警告', '业务异常：该接口已失效', '2024-04-19 12:26:18');
INSERT INTO `t_system_log` VALUES ('36004bcd30a9a260c5e5a8c82b0329b4', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:26:57');
INSERT INTO `t_system_log` VALUES ('37138386a3ca76d4f71f8a5219717f58', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:31:24');
INSERT INTO `t_system_log` VALUES ('3917ea968dab21ecb22a1b3589d73682', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 12:24:49');
INSERT INTO `t_system_log` VALUES ('395c5e20123ee4cefd1cb551e1069f3f', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:00:59');
INSERT INTO `t_system_log` VALUES ('39ca8a825a5243bdfc058768c8fcf46f', '127.0.0.1', '3067836615@qq.com', '错误', '服务器出错：org.springframework.validation.BeanPropertyBindingResult: 2 errors\nField error in object \'userDto\' on field \'lastLoginTime\': rejected value [2024-04-09 12:46:39]; codes [typeMismatch.userDto.lastLoginTime,typeMismatch.lastLoginTime,typeMismatch.java.util.Date,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [userDto.lastLoginTime,lastLoginTime]; arguments []; default message [lastLoginTime]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.util.Date\' for property \'lastLoginTime\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.util.Date] for value \'2024-04-09 12:46:39\'; nested exception is java.lang.IllegalArgumentException]\nField error in object \'userDto\' on field \'registrationTime\': rejected value [2024-03-29 14:30:09]; codes [typeMismatch.userDto.registrationTime,typeMismatch.registrationTime,typeMismatch.java.util.Date,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [userDto.registrationTime,registrationTime]; arguments []; default message [registrationTime]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.util.Date\' for property \'registrationTime\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.util.Date] for value \'2024-03-29 14:30:09\'; nested exception is java.lang.IllegalArgumentException]', '2024-04-10 13:22:37');
INSERT INTO `t_system_log` VALUES ('3dc266408983ab971fa563b16a2c4da2', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-11 09:50:38');
INSERT INTO `t_system_log` VALUES ('3dd7931b3c0abec22cc7f3b8175b6f9b', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-19 10:36:14');
INSERT INTO `t_system_log` VALUES ('400108c05e5a5f8a9f1c8445b07a6a29', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:24:53');
INSERT INTO `t_system_log` VALUES ('4064e1c44c9df887e7b16e241b5c3300', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.captcha', '2024-04-10 22:42:49');
INSERT INTO `t_system_log` VALUES ('415ab270f1febba28c133755518b82c6', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-18 10:39:36');
INSERT INTO `t_system_log` VALUES ('451d0a1fd75e447bcf9b6a9de37a7790', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:29:55');
INSERT INTO `t_system_log` VALUES ('45d4dd05404940403093597b138951c1', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:02:07');
INSERT INTO `t_system_log` VALUES ('470fc2c619439a651073dded90782176', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 09:09:11');
INSERT INTO `t_system_log` VALUES ('4854d10069059beb9312808c774b1641', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:40:34');
INSERT INTO `t_system_log` VALUES ('48a2a5a54c33d33296048446dcc9b91b', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:58:10');
INSERT INTO `t_system_log` VALUES ('49f42ebba46c1de1629d710337c84931', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-11 09:50:27');
INSERT INTO `t_system_log` VALUES ('4a750beb5b393fd8e71be28931fe8b4b', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"outputStream\"]->org.apache.tomcat.util.http.fileupload.DeferredFileOutputStream[\"currentOutputStream\"]->java.io.FileOutputStream[\"fd\"])', '2024-04-10 14:21:22');
INSERT INTO `t_system_log` VALUES ('4e30533405fa9537f29aea86a5e02b7e', '0:0:0:0:0:0:0:1', '未知', '错误', '非法数据：null', '2024-04-19 12:59:26');
INSERT INTO `t_system_log` VALUES ('53feb52e9eb59585f1d5c43542823084', '127.0.0.1', '3067836615@qq.com', '错误', '服务器出错：org.springframework.validation.BeanPropertyBindingResult: 2 errors\nField error in object \'userDto\' on field \'lastLoginTime\': rejected value [2024-04-09 12:46:39]; codes [typeMismatch.userDto.lastLoginTime,typeMismatch.lastLoginTime,typeMismatch.java.util.Date,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [userDto.lastLoginTime,lastLoginTime]; arguments []; default message [lastLoginTime]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.util.Date\' for property \'lastLoginTime\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.util.Date] for value \'2024-04-09 12:46:39\'; nested exception is java.lang.IllegalArgumentException]\nField error in object \'userDto\' on field \'registrationTime\': rejected value [2024-03-29 14:30:09]; codes [typeMismatch.userDto.registrationTime,typeMismatch.registrationTime,typeMismatch.java.util.Date,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [userDto.registrationTime,registrationTime]; arguments []; default message [registrationTime]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.util.Date\' for property \'registrationTime\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.util.Date] for value \'2024-03-29 14:30:09\'; nested exception is java.lang.IllegalArgumentException]', '2024-04-10 13:22:21');
INSERT INTO `t_system_log` VALUES ('5480cd1b4fae977070c56ae35c53e9d9', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-11 10:23:53');
INSERT INTO `t_system_log` VALUES ('571056da5cd48c561e1e406e811110ae', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-18 17:52:47');
INSERT INTO `t_system_log` VALUES ('579c6cca19feb4db3afe999cafd997ef', '127.0.0.1', '3067836615@qq.com', '警告', '业务异常：模型不在线', '2024-04-23 14:57:18');
INSERT INTO `t_system_log` VALUES ('5acdbbb4a04433bc558a68cc5bab64f1', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 09:26:19');
INSERT INTO `t_system_log` VALUES ('5d94f97c038210f883a667d1c0adcc6e', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"outputStream\"]->org.apache.tomcat.util.http.fileupload.DeferredFileOutputStream[\"currentOutputStream\"]->java.io.FileOutputStream[\"fd\"])', '2024-04-10 14:34:37');
INSERT INTO `t_system_log` VALUES ('5dad23a1462360c3dd4cc497276e78ad', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-18 17:49:57');
INSERT INTO `t_system_log` VALUES ('5e5d9919e2678bc77471ff7249ec60d3', '127.0.0.1', '3067836615@qq.com', '警告', '业务异常：模型不在线', '2024-04-23 14:53:52');
INSERT INTO `t_system_log` VALUES ('5e69325d32502e6b47a42a187e803d74', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:58:10');
INSERT INTO `t_system_log` VALUES ('5f50fbfab3ef45a164b67f1763c9c82f', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 13:01:51');
INSERT INTO `t_system_log` VALUES ('645a6b5953ee52ee01f64634eed1b45c', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 09:09:18');
INSERT INTO `t_system_log` VALUES ('691d4d9c06cbd3325284de55c07d0c84', '0:0:0:0:0:0:0:1', '未知', '警告', '业务异常：API说明文件未找到！', '2024-04-19 12:55:12');
INSERT INTO `t_system_log` VALUES ('6a2b72fd81ec7b0d30af5b398e4dcbee', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:25:06');
INSERT INTO `t_system_log` VALUES ('6a517637d47e5c5a8b07a89a420c2739', '127.0.0.1', '3067836615@qq.com', '错误', '服务器出错：org.springframework.validation.BeanPropertyBindingResult: 2 errors\nField error in object \'userDto\' on field \'lastLoginTime\': rejected value [2024-04-09 12:46:39]; codes [typeMismatch.userDto.lastLoginTime,typeMismatch.lastLoginTime,typeMismatch.java.util.Date,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [userDto.lastLoginTime,lastLoginTime]; arguments []; default message [lastLoginTime]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.util.Date\' for property \'lastLoginTime\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.util.Date] for value \'2024-04-09 12:46:39\'; nested exception is java.lang.IllegalArgumentException]\nField error in object \'userDto\' on field \'registrationTime\': rejected value [2024-03-29 14:30:09]; codes [typeMismatch.userDto.registrationTime,typeMismatch.registrationTime,typeMismatch.java.util.Date,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [userDto.registrationTime,registrationTime]; arguments []; default message [registrationTime]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.util.Date\' for property \'registrationTime\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.util.Date] for value \'2024-03-29 14:30:09\'; nested exception is java.lang.IllegalArgumentException]', '2024-04-10 13:22:13');
INSERT INTO `t_system_log` VALUES ('6b53e0e024146744a9f2d35103239cf3', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-18 17:52:47');
INSERT INTO `t_system_log` VALUES ('6c0b688992397fa4b83c9c180d136391', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:02:12');
INSERT INTO `t_system_log` VALUES ('6c70f58cfed5af8835de54d38445a39f', '127.0.0.1', '未知', '错误', '出错了：java.sql.SQLException: Field \'password\' doesn\'t have a default value', '2024-04-19 12:24:31');
INSERT INTO `t_system_log` VALUES ('6e4d5a4abb6ef15c5e67f96c1e00b009', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-18 17:49:31');
INSERT INTO `t_system_log` VALUES ('6e59be515d3d8476a7d027675a517a10', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-10 18:58:16');
INSERT INTO `t_system_log` VALUES ('6e9300976c1144dddcc13b0188e472ab', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-11 10:18:31');
INSERT INTO `t_system_log` VALUES ('6ee599661e2e0cbeb04682d70529229c', '127.0.0.1', '未知', '错误', '服务器出错：Request method \'POST\' not supported', '2024-04-23 13:22:10');
INSERT INTO `t_system_log` VALUES ('6f700a5bef8d2eba1c0a60905da41728', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 09:09:11');
INSERT INTO `t_system_log` VALUES ('6fb3200346d04583467d0ade74f65c52', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:58:13');
INSERT INTO `t_system_log` VALUES ('703ce3cbcfd8007aa68723736a424121', '127.0.0.1', '3067836615@qq.com', '警告', '业务异常：模型不在线', '2024-04-23 14:58:41');
INSERT INTO `t_system_log` VALUES ('72b4b8e63d40c2aeb8d28e6707081d06', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 09:09:16');
INSERT INTO `t_system_log` VALUES ('72ee5f6bfa178ca72351cf60a4bd53be', '127.0.0.1', '3067836615@qq.com', '信息', '清空系统日志', '2024-04-10 12:07:23');
INSERT INTO `t_system_log` VALUES ('73b6c62b6930a9e84cf14a408313b670', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:30:34');
INSERT INTO `t_system_log` VALUES ('74f5f3d747c8da7ff5d80ae15a3f0b2f', '127.0.0.1', '未知', '错误', '出错了：java.sql.SQLException: Field \'password\' doesn\'t have a default value', '2024-04-19 12:19:06');
INSERT INTO `t_system_log` VALUES ('751367b4b7a876ff6c1a7898bcb33f73', '0:0:0:0:0:0:0:1', '未知', '警告', '业务异常：API说明文件未找到！', '2024-04-19 12:55:01');
INSERT INTO `t_system_log` VALUES ('75e13b765afe34987c822c084209f97b', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:28:32');
INSERT INTO `t_system_log` VALUES ('75f16b83abed70c189c5a18845cb0670', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:02:13');
INSERT INTO `t_system_log` VALUES ('78451b8cb31e633f293214f61536f72a', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:49:04');
INSERT INTO `t_system_log` VALUES ('7937e1ebd79fb6ceffede72a17b86c84', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:58:10');
INSERT INTO `t_system_log` VALUES ('7a6656ee00f1bbe58935a2a44f6bf76f', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-11 10:19:53');
INSERT INTO `t_system_log` VALUES ('7ac5883bf3560a277572e1eff43bccf3', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 13:00:09');
INSERT INTO `t_system_log` VALUES ('7ad37671cabe38ad174d5e40e087503b', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 09:09:18');
INSERT INTO `t_system_log` VALUES ('7b57c770ca36512ecdd3a74c41f2c7d9', '127.0.0.1', '3067836615@qq.com', '错误', '服务器出错：Content type \'multipart/form-data;boundary=----WebKitFormBoundaryaB3IJb1ui74Zj03L;charset=UTF-8\' not supported', '2024-04-10 13:17:18');
INSERT INTO `t_system_log` VALUES ('7c8b30f212aff96a58b31d20d93f5f2e', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:50:00');
INSERT INTO `t_system_log` VALUES ('7d7396f08cda7e54c8b69aeafe771969', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:32:38');
INSERT INTO `t_system_log` VALUES ('7dc84bc64f52e08698f4d83d360318d0', '0:0:0:0:0:0:0:1', '未知', '警告', '业务异常：该接口已失效', '2024-04-19 12:26:46');
INSERT INTO `t_system_log` VALUES ('7e0d411282a0cd3e52b41014832537bb', '127.0.0.1', '未知', '警告', '业务异常：该注册链接已失效！', '2024-04-19 10:07:38');
INSERT INTO `t_system_log` VALUES ('7e84fc1eff56149bac4cee07f46674f3', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:28:59');
INSERT INTO `t_system_log` VALUES ('7f0a7db4a34e6b2f17784b960f8df6a5', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:02:09');
INSERT INTO `t_system_log` VALUES ('8006031fb9844965d0d86265b3184016', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:24:53');
INSERT INTO `t_system_log` VALUES ('80e1d009294ae9d9fbe22387395549a6', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 09:09:46');
INSERT INTO `t_system_log` VALUES ('821d8fc1b8a8f67d90e7706776708e81', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:25:06');
INSERT INTO `t_system_log` VALUES ('8332e6b9ea7018803987ac495a3516c4', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 13:13:25');
INSERT INTO `t_system_log` VALUES ('85a69855d4d79ef009147273b1f5bad2', '127.0.0.1', '3067836615@qq.com', '警告', '业务异常：模型不在线', '2024-04-19 13:47:56');
INSERT INTO `t_system_log` VALUES ('866e8e5870b7d61dc4350cbe79b67b28', '127.0.0.1', '3067836615@qq.com', '错误', '服务器出错：org.springframework.validation.BeanPropertyBindingResult: 2 errors\nField error in object \'userDto\' on field \'lastLoginTime\': rejected value [2024-04-09 12:41:40]; codes [typeMismatch.userDto.lastLoginTime,typeMismatch.lastLoginTime,typeMismatch.java.util.Date,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [userDto.lastLoginTime,lastLoginTime]; arguments []; default message [lastLoginTime]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.util.Date\' for property \'lastLoginTime\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.util.Date] for value \'2024-04-09 12:41:40\'; nested exception is java.lang.IllegalArgumentException]\nField error in object \'userDto\' on field \'registrationTime\': rejected value [2024-04-09 12:41:40]; codes [typeMismatch.userDto.registrationTime,typeMismatch.registrationTime,typeMismatch.java.util.Date,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [userDto.registrationTime,registrationTime]; arguments []; default message [registrationTime]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.util.Date\' for property \'registrationTime\'; nested exception is org.springframework.core.convert.ConversionFailedException: Failed to convert from type [java.lang.String] to type [java.util.Date] for value \'2024-04-09 12:41:40\'; nested exception is java.lang.IllegalArgumentException]', '2024-04-10 13:23:32');
INSERT INTO `t_system_log` VALUES ('86ca40c3e92998cd8d04b1480535948b', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 13:01:37');
INSERT INTO `t_system_log` VALUES ('87dd8e9b9ad1ff3e9cf2015f4dc3bd95', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 09:20:11');
INSERT INTO `t_system_log` VALUES ('88bd6713ac3868a29db500b59ecec800', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-18 17:50:15');
INSERT INTO `t_system_log` VALUES ('88e1f1bcf1e358bc72c9d752d556ef8d', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-19 12:32:28');
INSERT INTO `t_system_log` VALUES ('8aeca24044f613585e8ea08a15255253', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: Cannot construct instance of `org.springframework.web.multipart.MultipartFile` (no Creators, like default constructor, exist): abstract types either need to be mapped to concrete types, have custom deserializer, or contain additional type information\n at [Source: (org.springframework.util.StreamUtils$NonClosingInputStream); line: 1, column: 350] (through reference chain: cn.insectmk.chatbotweb.controller.dto.UserDto[\"headImageFile\"])', '2024-04-10 12:59:42');
INSERT INTO `t_system_log` VALUES ('8cb54feddeef718b9729e1579abfc512', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-19 10:37:39');
INSERT INTO `t_system_log` VALUES ('8cf64d3231d4b0342e873e1bd80c5078', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-18 14:28:34');
INSERT INTO `t_system_log` VALUES ('8e50ceca444b8d5a19bc1d59024e48a2', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.captcha', '2024-04-10 22:36:27');
INSERT INTO `t_system_log` VALUES ('8ebadd0754e0534be0f96a20b9a16352', '127.0.0.1', '3067836615@qq.com', '警告', '数据校验失败：请输入验证码;请输入验证码', '2024-04-10 12:52:48');
INSERT INTO `t_system_log` VALUES ('91a1232fb6b290b823078c81c79d78ee', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 09:09:11');
INSERT INTO `t_system_log` VALUES ('922e5fd3117d98ddb481c172a2a2bdd3', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-11 09:47:01');
INSERT INTO `t_system_log` VALUES ('92bdd9d178fac8e08a60002f7db926ff', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.captcha', '2024-04-10 22:42:56');
INSERT INTO `t_system_log` VALUES ('92fd89b1842fcf130742ef4f625f4b68', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'temperature\' in \'field list\'', '2024-04-18 15:25:17');
INSERT INTO `t_system_log` VALUES ('933ee63f3cdbabae5d95b2e112f6acd3', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 13:00:37');
INSERT INTO `t_system_log` VALUES ('94d12f8c52e3dbc86dcf7a69b86048ab', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 13:07:52');
INSERT INTO `t_system_log` VALUES ('952930a54b82c54285083d05406ad367', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:39:22');
INSERT INTO `t_system_log` VALUES ('9639e3c5e6e94106ba338823d3a29de8', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:00:56');
INSERT INTO `t_system_log` VALUES ('96679d1c61d5fa532903bb5f1d0144c0', '127.0.0.1', '未知', '错误', '服务器出错：Request method \'GET\' not supported', '2024-04-23 15:45:17');
INSERT INTO `t_system_log` VALUES ('96a0941efe507ca105c341fa904e5275', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '业务异常：Tokens存量不足', '2024-04-18 12:29:59');
INSERT INTO `t_system_log` VALUES ('96c94f89f1e77d8b64c3560e689e9416', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-18 10:36:44');
INSERT INTO `t_system_log` VALUES ('97f6f409e37de4258d05c37ec7d114ce', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 13:00:09');
INSERT INTO `t_system_log` VALUES ('98e212dba11bc012ba82060785abc96a', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-18 17:52:47');
INSERT INTO `t_system_log` VALUES ('995d1124a05efcec1fbd98380c2e931a', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:21:25');
INSERT INTO `t_system_log` VALUES ('996eb00166ff38d34b31d25e797e10b9', '127.0.0.1', '3067836615@qq.com', '警告', '业务异常：模型不在线', '2024-04-23 14:54:55');
INSERT INTO `t_system_log` VALUES ('9a81db77b7f98e307ec6ff72d590b2ac', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.captcha', '2024-04-10 22:36:17');
INSERT INTO `t_system_log` VALUES ('9bd389644e1f03e92353abdee5b3a231', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:02:08');
INSERT INTO `t_system_log` VALUES ('9c9cf07858df3875056e1fd72d9ee66b', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-10 18:57:29');
INSERT INTO `t_system_log` VALUES ('9cc801a7476d8ad32d65550823641827', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-11 09:50:32');
INSERT INTO `t_system_log` VALUES ('9cde3e8b42432f05e6375939e3aac9ce', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-18 17:49:31');
INSERT INTO `t_system_log` VALUES ('9ece8cddb7ccc119bb408a57ad41dea0', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:39:05');
INSERT INTO `t_system_log` VALUES ('a058cdc83fee99ce7adf147efc13d4d0', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-18 17:49:31');
INSERT INTO `t_system_log` VALUES ('a0b740712c51b1277ab7a43fff1a807b', '127.0.0.1', '未知', '警告', '业务异常：该注册链接已失效！', '2024-04-19 09:52:05');
INSERT INTO `t_system_log` VALUES ('a13b68163a8f4df6271a8de0c3f99ff2', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:59:40');
INSERT INTO `t_system_log` VALUES ('a1ba7d0709a42c427f7f61323ab64b0d', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-11 09:50:30');
INSERT INTO `t_system_log` VALUES ('a1e74fc9f0ff07f0193a1a968ecc692a', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-10 18:58:18');
INSERT INTO `t_system_log` VALUES ('a2c0ff9411b75cdf633f64ba566fec3e', '127.0.0.1', '未知', '警告', '业务异常：该注册链接已失效！', '2024-04-19 10:06:58');
INSERT INTO `t_system_log` VALUES ('a40db38022d00110f72fc44fe55647f1', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:50:00');
INSERT INTO `t_system_log` VALUES ('a49cabfd40f7111e2b278e305a558f79', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 13:03:51');
INSERT INTO `t_system_log` VALUES ('a7743a58c28804f518fca8a92c3f438a', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-11 09:27:54');
INSERT INTO `t_system_log` VALUES ('a81707409da256ac952d43d24af3f08a', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-18 17:49:57');
INSERT INTO `t_system_log` VALUES ('a8c927408d77ac1d1c94539cadbcb758', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-18 17:49:31');
INSERT INTO `t_system_log` VALUES ('a954dd3222a4e3cb70641f55ba0c8589', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-18 13:12:57');
INSERT INTO `t_system_log` VALUES ('ab47c356010ffb332f351099f3bfa5f1', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-11 10:16:16');
INSERT INTO `t_system_log` VALUES ('abd03a33fe1e367ce4ef29ab76e3152e', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:22:23');
INSERT INTO `t_system_log` VALUES ('abf6753b0bde1cf73cf9fc954f2afa2e', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-18 17:49:57');
INSERT INTO `t_system_log` VALUES ('abfc4f1ada09fcd0a662ddd849f24a54', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:38:25');
INSERT INTO `t_system_log` VALUES ('ae4ff29a2c9a8cd30817468a0b4cb6e1', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-18 17:49:57');
INSERT INTO `t_system_log` VALUES ('b0cd7a630c2703301be51fb6456ec46b', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:01:03');
INSERT INTO `t_system_log` VALUES ('b28efe291a939985a151e8c46b77c83d', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-18 17:50:15');
INSERT INTO `t_system_log` VALUES ('b2966464d7b56f4a35c8b2acb9e6d8c9', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 13:02:11');
INSERT INTO `t_system_log` VALUES ('b32534f4a971393260bd68a77a0ae9da', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:01:01');
INSERT INTO `t_system_log` VALUES ('b45eb119dba4b7917d7aaa8cf7c7d552', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-10 18:58:17');
INSERT INTO `t_system_log` VALUES ('b49e8b98733abdbc702f2b95c7f2aae6', '127.0.0.1', '3067836615@qq.com', '警告', '数据校验失败：请输入验证码;请输入验证码', '2024-04-10 12:52:56');
INSERT INTO `t_system_log` VALUES ('b4a69dc7a46820df44d70d9d128291eb', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:21:58');
INSERT INTO `t_system_log` VALUES ('b4c34fdb111fa62dcee571b247387777', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:19:43');
INSERT INTO `t_system_log` VALUES ('b7d93166df37336de6a45fe0ad331176', '127.0.0.1', '未知', '错误', '出错了：java.sql.SQLException: Field \'password\' doesn\'t have a default value', '2024-04-19 12:20:45');
INSERT INTO `t_system_log` VALUES ('b9c683e9685ac92109e151d4db026ecd', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 10:17:04');
INSERT INTO `t_system_log` VALUES ('c080bb860f84d8344fdda08e53207551', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-11 10:23:27');
INSERT INTO `t_system_log` VALUES ('c27d3d348f2a14cc9d8b28c46675015a', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:58:13');
INSERT INTO `t_system_log` VALUES ('c46bad67ff4b95811cb938d3e1be9d6e', '0:0:0:0:0:0:0:1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 13:15:31');
INSERT INTO `t_system_log` VALUES ('c59f8d149deffba49b1986091f4893ac', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-11 09:50:34');
INSERT INTO `t_system_log` VALUES ('c72dc13169780d0c8cabb6f34700255c', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 09:09:46');
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
INSERT INTO `t_system_log` VALUES ('d5fba8290a59c8d637dd089aedc7d4ad', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-18 17:49:31');
INSERT INTO `t_system_log` VALUES ('d5feb98b5b8ece23b2da0f5761afff6d', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"outputStream\"]->org.apache.tomcat.util.http.fileupload.DeferredFileOutputStream[\"currentOutputStream\"]->java.io.FileOutputStream[\"fd\"])', '2024-04-10 14:25:47');
INSERT INTO `t_system_log` VALUES ('d84723ae5584b2c692b0585601258804', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 13:00:37');
INSERT INTO `t_system_log` VALUES ('d8a6f09d44263c663d66aeb2e43573e3', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 09:17:34');
INSERT INTO `t_system_log` VALUES ('d973157db25f8739a735f1800e216d66', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ApiController.getApiTips', '2024-04-10 16:41:13');
INSERT INTO `t_system_log` VALUES ('dbf4d3cf18816b4582901a7c68f5f1bd', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 13:03:13');
INSERT INTO `t_system_log` VALUES ('dc366dd9d7c8729e86e9081d2a77bc95', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:14:51');
INSERT INTO `t_system_log` VALUES ('dcc0cd3645de67681fc5c38d1aa03caa', '127.0.0.1', '3067836615@qq.com', '错误', '非法数据：null', '2024-04-10 14:28:59');
INSERT INTO `t_system_log` VALUES ('de3b2a3440c8a9a40ee5b3dec965b4f4', '127.0.0.1', '3067836615@qq.com', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 13:03:51');
INSERT INTO `t_system_log` VALUES ('e0221985de5b05b234c9e1a54ca9ab86', '127.0.0.1', '未知', '信息', '用户注册', '2024-04-19 10:15:18');
INSERT INTO `t_system_log` VALUES ('e347906c1fc043152fde706accc2cefb', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 13:02:11');
INSERT INTO `t_system_log` VALUES ('e367ed16283d1eadcb20b2045a51cb27', '127.0.0.1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.LoginController.login', '2024-04-10 18:57:32');
INSERT INTO `t_system_log` VALUES ('e494d6cd71ad384038a1b1e878acac71', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: Cannot construct instance of `org.springframework.web.multipart.MultipartFile` (no Creators, like default constructor, exist): abstract types either need to be mapped to concrete types, have custom deserializer, or contain additional type information\n at [Source: (org.springframework.util.StreamUtils$NonClosingInputStream); line: 1, column: 353] (through reference chain: cn.insectmk.chatbotweb.controller.dto.UserDto[\"headImageFile\"])', '2024-04-10 12:47:39');
INSERT INTO `t_system_log` VALUES ('e597c8c2dbf479e2d9f0ff992b7d670e', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:29:54');
INSERT INTO `t_system_log` VALUES ('e65fa93ec4aa15f217eea43a82067fe0', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:14:47');
INSERT INTO `t_system_log` VALUES ('e6d3066381a8f1c7482b69b414f08f45', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 13:58:13');
INSERT INTO `t_system_log` VALUES ('e775814c1abd76fbe19ebe05faabd2c7', '0:0:0:0:0:0:0:1', '未知', '警告', '业务异常：API说明文件未找到！', '2024-04-19 13:00:30');
INSERT INTO `t_system_log` VALUES ('e82b4e874a6682078615cd55c3ab0ad8', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 12:24:55');
INSERT INTO `t_system_log` VALUES ('e83fd7b99e904ff5356a592d217e104f', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 09:11:20');
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
INSERT INTO `t_system_log` VALUES ('f17bef6e8266c4adcc74dffe4bdc70ec', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-18 17:50:15');
INSERT INTO `t_system_log` VALUES ('f19b9622a5a1d4db508d2b12ce6afba7', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 13:57:13');
INSERT INTO `t_system_log` VALUES ('f1c5dcadcd5a325a248b8011f36c331e', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:01:12');
INSERT INTO `t_system_log` VALUES ('f276db6c0cb09c84119094f33687751b', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-10 18:58:17');
INSERT INTO `t_system_log` VALUES ('f27dccbf5e85744c64cf90edd7994211', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`chatbot`.`t_chat_session`, CONSTRAINT `t_chat_session_ibfk_2` FOREIGN KEY (`model_version_id`) REFERENCES `t_model_version` (`id`))', '2024-04-18 16:08:34');
INSERT INTO `t_system_log` VALUES ('f480c2c6fcc9496a9f3305589a94638c', '0:0:0:0:0:0:0:1', '未知', '警告', '过多请求：cn.insectmk.chatbotweb.controller.ChatMessageController.sendStream', '2024-04-18 11:01:01');
INSERT INTO `t_system_log` VALUES ('f48862c2ac516cae517d56b259742ffa', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 13:01:51');
INSERT INTO `t_system_log` VALUES ('f51def7e3ed770db52e563f9bbd10c07', '127.0.0.1', '未知', '错误', '非法数据：null', '2024-04-19 09:19:39');
INSERT INTO `t_system_log` VALUES ('f6824c4873f40f996feb7bb9435b03e0', '127.0.0.1', '未知', '错误', '出错了：null', '2024-04-19 10:35:18');
INSERT INTO `t_system_log` VALUES ('f6de06ddb709f6d6ba2c6c11d985cb22', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: Cannot construct instance of `org.springframework.web.multipart.MultipartFile` (no Creators, like default constructor, exist): abstract types either need to be mapped to concrete types, have custom deserializer, or contain additional type information\n at [Source: (org.springframework.util.StreamUtils$NonClosingInputStream); line: 1, column: 350] (through reference chain: cn.insectmk.chatbotweb.controller.dto.UserDto[\"headImageFile\"])', '2024-04-10 12:55:09');
INSERT INTO `t_system_log` VALUES ('f7fdb1a6ec41975266f8bda9debb03b5', '127.0.0.1', '2514378105@qq.com', '警告', '业务异常：您不是root用户', '2024-04-11 10:26:18');
INSERT INTO `t_system_log` VALUES ('f87eec5ecb169932bcd3af09d5ef9ee5', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class java.io.FileDescriptor and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile[\"part\"]->org.apache.catalina.core.ApplicationPart[\"fileItem\"]->org.apache.tomcat.util.http.fileupload.disk.DiskFileItem[\"inputStream\"]->java.io.FileInputStream[\"fd\"])', '2024-04-10 14:33:16');
INSERT INTO `t_system_log` VALUES ('f9500e590d18f04831f29856d05e6de6', '127.0.0.1', '未知', '错误', '出错了：com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry \'3067836615@qq.com\' for key \'email\'', '2024-04-19 10:31:29');
INSERT INTO `t_system_log` VALUES ('fa8e9aef39ab14c1a23db48d36cd11bd', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 13:07:52');
INSERT INTO `t_system_log` VALUES ('fbc1ff5c0cf00329e3f0b895beb31820', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'creat_time\' in \'field list\'', '2024-04-23 12:11:01');
INSERT INTO `t_system_log` VALUES ('fcb31e54e409cc16f53972d50ea0f106', '127.0.0.1', '3067836615@qq.com', '错误', '出错了：null', '2024-04-18 12:40:34');
INSERT INTO `t_system_log` VALUES ('fd7781c193ea6b030fdfc9d63ad2fa58', '127.0.0.1', '未知', '信息', '用户注册', '2024-04-19 12:25:27');
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
INSERT INTO `t_user` VALUES ('9bd17cbf5f8ea20207b3305eef42c1ac', '洗心革面好男孩', '&123456InsectMk', '2514378105@qq.com', 'https://insectmk.cn/static/img/head/insectmk.png', '8D2rIxyCejx-45UtcrIVuSNWwhqjw08_CVn5Tvx3u8OOvqKKH8uxNUbvN3fet9Ax', 10, 10000, '2024-04-19 12:25:27', '2024-04-19 12:25:55');
INSERT INTO `t_user` VALUES ('faecf96a4a822452df162b566f8f27fd', 'InsectMk', '_Mk20010624', '3067836615@qq.com', 'https://insectmk.cn/static/img/head/insectmk.png', 'b2cbea9470f8e3521ca610fa4572c8e5', 10, 99999995501, '2024-04-19 10:15:18', '2024-04-19 12:32:59');

SET FOREIGN_KEY_CHECKS = 1;
