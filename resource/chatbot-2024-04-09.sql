/*
 Navicat Premium Data Transfer

 Source Server         : 本地机器5.7（root）
 Source Server Type    : MySQL
 Source Server Version : 50740 (5.7.40-log)
 Source Host           : localhost:3307
 Source Schema         : chatbot

 Target Server Type    : MySQL
 Target Server Version : 50740 (5.7.40-log)
 File Encoding         : 65001

 Date: 09/04/2024 16:19:50
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
INSERT INTO `t_chat_message` VALUES ('0678796a7837ff36332b0f79a0c3eae3', '04e0a56cc0f9d1abc5e83574ac07eede', 'assistant', 'bc8914085b4d6b1a7a51d7a0e97e6f12', ' 冒泡排序是一个基于先前最基本的排序算法。在Python中，我们可以使用 if 循环来遍历字符串中一个值来比较顺序。下面是一个急切快速的Python代码实现：\n\n```python\ndef reverse_order_by_key(seq):\n    if seq[0] == \"1\":\n        return seq[1]\n    elif seq[0] == \"2\":\n        return seq[2]\n    elif seq[2] == \"2\":\n        return seq[3]\n    elif seq[3] == \"3\":\n        return seq[4]\n    elif seq[0] == \"3\":\n        return seq[4]\n    elif seq[0] == \"4\":\n        return seq[1]\n    elif seq[1] == \"4\":\n        return seq[2]\n    elif seq[0] == \"5\":\n        return seq[3]\n    elif seq[2] == \"5\":\n        return seq[3]\n    elif seq[0] == \"5\":\n        return seq[2]\n    elif seq[0] == \"6\":\n        return seq[0]\n\n```\n\n在这个示例中，函数声音调用了一个 `reverse()` 方法，它遍历了10个不同的列表，然后按照从顺序来排序的序列。最后，它直接返回了排序后的序列，表示对应的序列为[5,3,5]。该函数`reverse_order()` 方法对给定的整数序列进行排序，不考虑递归。', '2024-04-09 16:11:13');
INSERT INTO `t_chat_message` VALUES ('0ad11b9ff9b295a052beafae2f92a658', 'd930271cf81a43c315a31fe65ab278f6', 'user', NULL, '请使用Java帮我写一个冒泡排序算法', '2024-04-09 13:09:07');
INSERT INTO `t_chat_message` VALUES ('16c8ff4f401f267b88e0ad6c7ca12ddb', 'd930271cf81a43c315a31fe65ab278f6', 'assistant', '0ad11b9ff9b295a052beafae2f92a658', ' 以下是Python代码，使用QuickSort算法对两个数组进行排序。首先定义一个整数数组arr，您希望方法很简单。接下来，使用冒泡排序算法对数组[0,2)进行排序。接下来，您可以使用for循环来执行快序的操作，进行98次排序。\n\n```python\nmyArray = [1,2,3,4,5]\n# 执行冒泡排序\nmyArr = [1,2,3,4,5]\n# 执行冒泡排序\nmyArray.sort()\n\n# 将前三个数字相加\nfor myArr in myArr: print(myArr)\n# 将排序后的数组依次进行比较\nmyArr[myArr.index(-1)]=myArr[myArr.index(myArr.index(myArr.index(-1))]++myArr.index(myArr.index(myArr.index(myArr.index(-1)))-1))\n# 合并两次\nmyArr[myArr.index(myArr.index(myArr.index(-1))] = myArr.index(myArr.index(myArr.index(-1)))-1)\n# 最后一个数字执行排序\nmyArr.sort()\n# 数据快序的算法\nmyArr[0] = myArr[0] + myArr[0]\nmyArr[1] = myArr[1] - myArr[1]\nmyArr[2] = myArr[2] - myArr[2]\nmyArr[3] = myArr[2] - myArr[3]\nmyArr[4] = myArr[3] - myArr[3]\n# 显示排序结果\nprint(myArr.sort(reverse=True))\n```\n\n在此示例中，数组[1,2,2,3,4]和数组[3,4,5,6]都要排序，排序结果是[1,2,2,3,4,4]。\n\n这是与排序一致的排序算法。基于这种方式，我可以简单的打印以下输出：\n[1,2,2,3,4,4]', '2024-04-09 13:09:07');
INSERT INTO `t_chat_message` VALUES ('16d82dafbaa2eeca383a205f089f5cbe', 'dddd9ef16d0e5e24da77241d5ab7adde', 'user', NULL, '你是谁？', '2024-03-29 13:35:59');
INSERT INTO `t_chat_message` VALUES ('21a05daecdd5b66b54a112dd264f5ef0', 'dddd9ef16d0e5e24da77241d5ab7adde', 'assistant', '94c4d9d8b908725fbf351eff3f4ff8e7', ' 好的，下面是一个使用C#实现快速排序算法的示例代码：\n```csharp\npublic static void QuickSort(int[] arr, int left, int right) {\n    if (left < right) {\n        int pivot = arr[right];\n        int j = left;\n        for (int k = left; k <= right - 1; k++) {\n            if (arr[k] < pivot) {\n                j++;\n                int tmp = arr[k];\n                arr[k] = arr[j];\n                arr[j] = tmp;\n            }\n        }\n        int t = arr[j - 1];\n        arr[j - 1] = arr[right - 1];\n        arr[right - 1] = t;\n    }\n}\npublic static void Main() {\n    int[] arr = { 5, 2, 7, 1, 9, 4, 8, 3 };\n    QuickSort(arr, 0, arr.Length - 1);\n    foreach (int num in arr) {\n        Console.Write(num + \" \");\n    }\n    Console.ReadLine();\n}\n```\n在这个示例中，我们定义了一个 `QuickSort` 函数，它使用了一个 `partition` 函数来选择一个基准值，从而将数组划分为左子数组和右子数组。该函数使用了一个 `i` 变量来表示数组的索引，从0开始计数，当 `left` 大于或等于 `i` 时，表示左子数组，否则表示右子数组。函数接受一个已经有序的数组和数组的起始位置，然后通过一个 `pivot` 变量来选择一个基准值，并使用一个 `j` 变量来表示左子数组的索引，从0开始计数。函数中，首先判断左子数组的长度是否大于等于1，如果是，则只选择左子数组；否则，从左子数组的第一个元素开始，依次比较其与右子数组的第一个元素，将较大的元素放到右子数组的末尾，重复上述过程，直到左子数组只有一个元素时，再将其与右子数组合并到一起，最后将有序数组输出即可。\n\n', '2024-03-29 19:10:35');
INSERT INTO `t_chat_message` VALUES ('23c365b072053fbff3c5baa52a1fb580', 'd930271cf81a43c315a31fe65ab278f6', 'assistant', 'a92a080fac77f0445bddadb64c5e56d8', ' 我是一个由InsectMk于2024年3月29日微调的智能聊天机器人，我可以回答关于科学、技术、历史、文化、娱乐等领域的问题并提供建议和信息！', '2024-03-29 13:36:33');
INSERT INTO `t_chat_message` VALUES ('275c90268024ea8d0aea51c68016bd04', 'd930271cf81a43c315a31fe65ab278f6', 'assistant', '3254f519ee2feb999163750db7b94a9f', '  Java 的语法和数据类型可能因用户的时间和行为而异。Python的语法为：\n\n```Java\n[1,2,3,4,5]\n```', '2024-04-09 14:56:21');
INSERT INTO `t_chat_message` VALUES ('3254f519ee2feb999163750db7b94a9f', 'd930271cf81a43c315a31fe65ab278f6', 'user', NULL, '我要的是Java，为什么给我Python的？', '2024-04-09 14:56:21');
INSERT INTO `t_chat_message` VALUES ('49a0788674bdf4ff96f09646680b9dad', 'dddd9ef16d0e5e24da77241d5ab7adde', 'assistant', '644bd2804c9e8d4e8a37cec7b2b98460', ' 好的，下面是一个基于C++的快速排序算法实现：\n```c++\n#include <iostream>\nusing namespace std;\n// 快速排序\nvoid quickSort(int arr[], int left, int right) {\n    if (left < right) {\n        int pivot = partition(arr, left, right);\n        quickSort(arr, left, pivot - 1);\n        quickSort(arr, pivot + 1, right);\n    }\n}\n// 获取某个元素的索引\nint partition(int arr[], int left, int right) {\n    int pivot = arr[right];\n    int i = left - 1;\n    for (int j = left; j < right; j++) {\n        if (arr[j] < pivot) {\n            i++;\n            int temp = arr[i];\n            arr[i] = arr[j];\n            arr[j] = temp;\n        }\n    }\n    int temp = arr[i + 1];\n    arr[i + 1] = arr[right];\n    arr[right] = temp;\n    return i + 1;\n}\n// 测试\nint main() {\n    int arr[] = { 5, 2, 7, 1, 9, 4, 8, 3 };\n    int n = sizeof(arr) / sizeof(arr[0]);\n    quickSort(arr, 0, n - 1);\n    cout << \"Sorted array: \";\n    for (int i = 0; i < n; i++) {\n        cout << arr[i] << \" \";\n    }\n    cout << endl;\n    return 0;\n}\n```\n在这个示例中，我们定义了一个`quickSort`函数，它使用经典的快速排序算法来对输入的数组进行排序。在函数中，我们使用了一个`partition`函数来计算数组的左右边界，并使用一个`pivot`变量来选择一个基准值进行排序。然后，我们使用一个`partition`函数来从数组的左侧开始将数组分成两个子数组，并递归地对子数组进行排序。最后，我们将排好序的左右两个子数组合并起来即可得到排好序的整个数组。', '2024-03-29 13:38:55');
INSERT INTO `t_chat_message` VALUES ('4e29e5319203e0cd37d8df0ef9933b84', 'dddd9ef16d0e5e24da77241d5ab7adde', 'user', NULL, '请使用Java帮我写一个快速排序算法', '2024-03-29 13:37:45');
INSERT INTO `t_chat_message` VALUES ('4f9ab70721d2fa07f00225c36cacb469', 'dddd9ef16d0e5e24da77241d5ab7adde', 'assistant', 'e3a2451aa7a1f92f05fe34dabae74483', '  好的，下面是一个使用Python实现快速排序算法的示例代码：\n```python\ndef quick_sort(arr, left, right):\n    if left < right:\n        pivot = partition(arr, left, right)\n        quick_sort(arr, left, pivot - 1)\n        quick_sort(arr, pivot + 1, right)\n    return arr\ndef partition(arr, left, right):\n    pivot = arr[right]\n    i = left - 1\n    for j in range(left, right):\n        if arr[j] < pivot:\n            i += 1\n            arr[i], arr[j] = arr[j], arr[i]\n    arr[i + 1], arr[right] = arr[right], arr[i + 1]\n    return i + 1\n```\n这个示例中，我们定义了一个 `quick_sort` 函数，它接受两个参数：一个已经有序的数组和一个需要排序的数组，返回一个已经有序的数组。该函数先使用一个 `pivot` 变量来选择一个基准值，然后使用一个 `partition` 函数将数组划分为左子数组和右子数组，最后对左子数组进行递归排序，对右子数组进行平均取值，并将有序数组合并到一起。\n该示例中的 `partition` 函数使用了一个 `i` 变量来表示数组的索引，从0开始计数。在函数体内，如果左子数组的第一个元素小于等于右子数组的最后一个元素，则选择左子数组中间的元素作为基准值，依次将左子数组和右子数组分别与中间元素进行比较，将较大的值放到右子数组的末尾，重复上述过程，直到左子数组只剩下一个元素时，再将其与右子数组合并到有序数组中。\n\n', '2024-03-29 19:04:46');
INSERT INTO `t_chat_message` VALUES ('5e75465df3aee34d3dea466212aa0db6', 'd930271cf81a43c315a31fe65ab278f6', 'assistant', 'cf9cc7cedebe6c2f31f39f954d2ef139', ' 很高兴能够为您提供数据。这是我自己，但我很抱歉我无法提供您所想的信息。不过，我可以在预订设备的过程中使用这些技术来解决任何问题。只需更新任何一个浏览器的内存容量，请按照我的描述进行操作。', '2024-04-09 12:56:14');
INSERT INTO `t_chat_message` VALUES ('6413e9efa15a31f945c44aff7854c0e9', 'd930271cf81a43c315a31fe65ab278f6', 'assistant', 'f624d953e7267db81704053393bc7037', ' 您是否感谢这个结果！', '2024-04-09 15:07:34');
INSERT INTO `t_chat_message` VALUES ('644bd2804c9e8d4e8a37cec7b2b98460', 'dddd9ef16d0e5e24da77241d5ab7adde', 'user', NULL, 'C++的呢？', '2024-03-29 13:38:55');
INSERT INTO `t_chat_message` VALUES ('6bb7d5b38bdc58f37d5dd3beaf415b39', 'd930271cf81a43c315a31fe65ab278f6', 'user', NULL, '早上好', '2024-04-09 13:08:39');
INSERT INTO `t_chat_message` VALUES ('821755c18fcbaebc1e746aecc07e1c6d', 'dddd9ef16d0e5e24da77241d5ab7adde', 'assistant', '4e29e5319203e0cd37d8df0ef9933b84', ' 好的，下面是一个基于Java的快速排序算法实现：\n```java\npublic static void quickSort(int[] arr, int left, int right) {\n    if (left < right) {\n        int pivot = partition(arr, left, right);\n        quickSort(arr, left, pivot - 1);\n        quickSort(arr, pivot + 1, right);\n    }\n}\npublic static int partition(int[] arr, int left, int right) {\n    int pivot = arr[right];\n    int i = left - 1;\n    for (int j = left; j < right; j++) {\n        if (arr[j] < pivot) {\n            i++;\n            int temp = arr[i];\n            arr[i] = arr[j];\n            arr[j] = temp;\n        }\n    }\n    int temp = arr[i + 1];\n    arr[i + 1] = arr[right];\n    arr[right] = temp;\n    return i + 1;\n}\n```\n这个算法使用了一个简单的分治思想，将一个有序的数组分成两个子数组，一个是有序的左子数组，另一个是无序的右子数组，然后将左子数组的第一个元素作为基准值，递归地对左右两个子数组进行排序，最终将排好序的左右两个子数组合并起来即可得到排序后的整个数组。', '2024-03-29 13:37:45');
INSERT INTO `t_chat_message` VALUES ('8d84160c381f9c63d451fa012d9cfc74', 'd930271cf81a43c315a31fe65ab278f6', 'user', NULL, '你是谁？', '2024-04-09 09:57:46');
INSERT INTO `t_chat_message` VALUES ('8dc50e4d78485f28cfc868df0bdeb672', 'd930271cf81a43c315a31fe65ab278f6', 'assistant', '8d84160c381f9c63d451fa012d9cfc74', ' 没有可信的地理位置。是由于InsectMk处于中南半球和中南半球，并且我可能在西方没有电视或电影。', '2024-04-09 09:57:46');
INSERT INTO `t_chat_message` VALUES ('94c4d9d8b908725fbf351eff3f4ff8e7', 'dddd9ef16d0e5e24da77241d5ab7adde', 'user', NULL, 'C#呢？', '2024-03-29 19:10:35');
INSERT INTO `t_chat_message` VALUES ('a92a080fac77f0445bddadb64c5e56d8', 'd930271cf81a43c315a31fe65ab278f6', 'user', NULL, '你是谁？', '2024-03-29 13:36:33');
INSERT INTO `t_chat_message` VALUES ('aab4d2f87de15f17798f3a053cb8e67e', 'a73597f23657e010729844ffc7d4134e', 'assistant', 'eaa3ef5ac456ac521ddcc840e941dbb6', ' 我是GPT-3.5，是一名基于GPT-3.5接口的AI机器人。我的主要职责是帮助用户解答各种问题，并且为用户提供更高效、便捷的服务体验。', '2024-03-29 15:57:56');
INSERT INTO `t_chat_message` VALUES ('ae5581df608c2b099f1b4307d372bc57', 'd930271cf81a43c315a31fe65ab278f6', 'assistant', 'ed4cec258956bee85af602c2e81a5b84', ' 我是一个人工智能助手，您好，我能够通过设备方式来协助人工智能。', '2024-04-09 13:05:03');
INSERT INTO `t_chat_message` VALUES ('bc8914085b4d6b1a7a51d7a0e97e6f12', '04e0a56cc0f9d1abc5e83574ac07eede', 'user', NULL, '请使用Java帮我写一个冒泡排序算法', '2024-04-09 16:11:13');
INSERT INTO `t_chat_message` VALUES ('cf9cc7cedebe6c2f31f39f954d2ef139', 'd930271cf81a43c315a31fe65ab278f6', 'user', NULL, '你好', '2024-04-09 12:56:14');
INSERT INTO `t_chat_message` VALUES ('d0e32b87a7e02f2818e756929e181a4d', 'd930271cf81a43c315a31fe65ab278f6', 'user', NULL, '你是谁？', '2024-04-09 15:14:30');
INSERT INTO `t_chat_message` VALUES ('d552f33b667640e1e1973fb2e4177200', 'd930271cf81a43c315a31fe65ab278f6', 'assistant', 'd0e32b87a7e02f2818e756929e181a4d', ' 我是一个人工智能程序，经验丰富，不过由于我是一个人工智能语言模型，我没有实际知识的能力。请看文章的解释：此虽不健康，但我很高兴我能够起到这个功能！\n\n这里提供一个Python程序，在提供排序后的Data class中，清晰地告诉我何时搜索表中的值。\n\n```Python\nclass SearchedArray(object):\n    def __init__(self, value = None):\n        self.value = value\n\n    def __len__(self):\n        return len(self.value)\n\n    def __len__(self):\n        return len(self.value)\n\n# 数据类型的查询\nclass SearchedArray(object):\n\n    def __init__(self, value, search = None):\n        self.value = value\n    def __str__(self):\n        text = self.value\n        for k in range(0, len(self.value)):\n            text = self.value[k](text)\n        for p in self.value:\n            text = p + \":\" + text\n    def search(self, value):\n        init = self.value = self.value = value\n        for k in range(0, len(self.value) - 1):\n            search = search[k]\n        if self.search != None:\n            if isinstance(self.value, SearchedArray):\n                self.value = search(value)\n        elif self.value != None:\n            self.value = self.value.lower()\n        else:\n            self.value = self.value\n        self.init()\n\n        return self.Value()\n\n```', '2024-04-09 15:14:30');
INSERT INTO `t_chat_message` VALUES ('e3a2451aa7a1f92f05fe34dabae74483', 'dddd9ef16d0e5e24da77241d5ab7adde', 'user', NULL, 'Python呢？', '2024-03-29 19:04:46');
INSERT INTO `t_chat_message` VALUES ('eaa3ef5ac456ac521ddcc840e941dbb6', 'a73597f23657e010729844ffc7d4134e', 'user', NULL, '你是谁？', '2024-03-29 15:57:56');
INSERT INTO `t_chat_message` VALUES ('ed4cec258956bee85af602c2e81a5b84', 'd930271cf81a43c315a31fe65ab278f6', 'user', NULL, '你好，你是谁？', '2024-04-09 13:05:03');
INSERT INTO `t_chat_message` VALUES ('ef1017cf0cc61d691c2af8484de5d8b5', 'd930271cf81a43c315a31fe65ab278f6', 'assistant', '6bb7d5b38bdc58f37d5dd3beaf415b39', ' 有其他问题?请告诉我。', '2024-04-09 13:08:39');
INSERT INTO `t_chat_message` VALUES ('f624d953e7267db81704053393bc7037', 'd930271cf81a43c315a31fe65ab278f6', 'user', NULL, '早上好啊！', '2024-04-09 15:07:34');
INSERT INTO `t_chat_message` VALUES ('fd9091bc4153a0c26ecfdfe516613a8c', 'dddd9ef16d0e5e24da77241d5ab7adde', 'assistant', '16d82dafbaa2eeca383a205f089f5cbe', ' 我是一个由InsectMk于2024年3月29日微调的智能聊天机器人，我可以回答关于科学、技术、历史、文化、娱乐等领域的问题并提供建议和信息！\n\n', '2024-03-29 13:35:59');

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
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `model_version_id`(`model_version_id`) USING BTREE,
  CONSTRAINT `t_chat_session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_chat_session_ibfk_2` FOREIGN KEY (`model_version_id`) REFERENCES `t_model_version` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_chat_session
-- ----------------------------
INSERT INTO `t_chat_session` VALUES ('04e0a56cc0f9d1abc5e83574ac07eede', '56439f0e310cd4dae5d9ed51f869d51d', 'f4fd5c356c23163d5653a8e5cfeb0a71', '编程问题', '2024-04-09 16:10:48', '2024-04-09 16:10:48');
INSERT INTO `t_chat_session` VALUES ('a73597f23657e010729844ffc7d4134e', '2cbcb04456e5b0419e4a189cd27d8fc9', '1', '[马某人]的API', '2024-03-29 15:57:23', '2024-03-29 15:57:23');
INSERT INTO `t_chat_session` VALUES ('b2a2a71016a5f8fb4c2dc411d145c20c', 'a036b08c189facd488d115954ca19f08', '1', '[马昆]的API', '2024-04-09 12:41:40', '2024-04-09 12:41:40');
INSERT INTO `t_chat_session` VALUES ('d930271cf81a43c315a31fe65ab278f6', '56439f0e310cd4dae5d9ed51f869d51d', '1', '[InsectMk]的API', '2024-03-29 13:36:18', '2024-03-29 13:36:18');
INSERT INTO `t_chat_session` VALUES ('dddd9ef16d0e5e24da77241d5ab7adde', '56439f0e310cd4dae5d9ed51f869d51d', '1', '对话测试', '2024-03-29 13:35:50', '2024-03-29 13:35:50');

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
  `max_token` int(11) UNSIGNED ZEROFILL NULL DEFAULT 00000001024 COMMENT '最长上下文Token',
  `generate_tokens` bigint(20) NULL DEFAULT 0 COMMENT '已生成的Token数量',
  `deployment_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_model_version
-- ----------------------------
INSERT INTO `t_model_version` VALUES ('1', 'RWKV', '0.0.1', 'http://127.0.0.1:8000/', '', 00000001024, 5189, '2024-02-29 09:44:41', '默认模型');
INSERT INTO `t_model_version` VALUES ('103550eb06ea493723e666207d37d722', 'GPU-4G-7B-CN', '0.0.1', 'http://localhost:8080/', NULL, 00000001024, 2541, '2024-04-09 16:16:23', 'GPU-4G-7B-CN');
INSERT INTO `t_model_version` VALUES ('564f41e0d16a309431acd17457bae441', 'GPU-4G-3B-World', '0.0.1', 'http://127.0.0.1:8000/', NULL, 00000001024, 4513, '2024-04-09 16:15:10', 'GPU-4G-3B-World');
INSERT INTO `t_model_version` VALUES ('6f697caf794e5624f660204482bf31e0', 'GPU-2G-3B-World', '0.0.1', 'http://127.0.0.1:8000/', NULL, 00000001024, 854, '2024-04-09 16:13:41', '2G显存-30亿参数-全世界语言');
INSERT INTO `t_model_version` VALUES ('8fd398b4ca8418793a3c882e5e4b616e', 'GPU-2G-1B5-World', '0.0.1', 'http://127.0.0.1:8000/', NULL, 00000001024, 1423, '2024-04-09 16:12:39', '2G显存-15亿参数');
INSERT INTO `t_model_version` VALUES ('a20ebce361b9fe1e4c3eb34229e2338c', 'GPU-4G-1B5-World', '0.0.1', 'http://127.0.0.1:8000/', NULL, 00000001024, 154, '2024-04-09 16:14:31', '4G显存-15亿参数-世界语言');
INSERT INTO `t_model_version` VALUES ('b8e780bd16cc223d01fd78981022d430', 'GPU-4G-3B-CN', '0.0.1', 'http://localhost:8080/', NULL, 00000001024, 2587, '2024-04-09 16:15:39', 'GPU-4G-3B-CN');
INSERT INTO `t_model_version` VALUES ('bb0abb2b648faa0956c28f5cf64ebd8f', 'GPU-4G-7B-World', '0.0.1', 'http://localhost:8080/', NULL, 00000001024, 7843, '2024-04-09 16:15:58', 'GPU-4G-7B-World');
INSERT INTO `t_model_version` VALUES ('f4fd5c356c23163d5653a8e5cfeb0a71', 'InsectMk\'s LoRA', '0.0.1', 'http://127.0.0.1:8000/', NULL, 00000001024, 2372, '2024-04-09 13:59:32', 'InsectMk的微调模型');

-- ----------------------------
-- Table structure for t_system_log
-- ----------------------------
DROP TABLE IF EXISTS `t_system_log`;
CREATE TABLE `t_system_log`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `op_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人邮箱',
  `level` enum('信息','警告','错误') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '等级',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '信息',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_system_log
-- ----------------------------
INSERT INTO `t_system_log` VALUES ('09aca12856beea5a3aad093db2c579f3', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:59:41');
INSERT INTO `t_system_log` VALUES ('0a3b096a93df2b2d585dde8df6dc8391', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:13:49');
INSERT INTO `t_system_log` VALUES ('0a90442fe99217a603a15e6e62a8272a', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:31:36');
INSERT INTO `t_system_log` VALUES ('0d9409759c55157a52d141ceef1dce09', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:25:38');
INSERT INTO `t_system_log` VALUES ('156b42a66fe5e05691e888fe1fa070a6', '3067836615@qq.com', '警告', '业务异常：您无权访问此会话', '2024-04-09 15:05:47');
INSERT INTO `t_system_log` VALUES ('17db1e5d4ee43c1ef7f45da3cb909853', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:04:35');
INSERT INTO `t_system_log` VALUES ('1805d26aa156207162b0612ceb0ccab8', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:17:35');
INSERT INTO `t_system_log` VALUES ('188ed8861fabfa58858ceba67b4641c8', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:17:28');
INSERT INTO `t_system_log` VALUES ('1d84299009a232bc461cd1748836f660', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:32:04');
INSERT INTO `t_system_log` VALUES ('2081040467f6afe3da237971a5286489', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:08:23');
INSERT INTO `t_system_log` VALUES ('21ecb6072d864251f414c88c845e5001', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:05:42');
INSERT INTO `t_system_log` VALUES ('2480841b2ba0ac570ecffac3e6074de8', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:42:45');
INSERT INTO `t_system_log` VALUES ('2588ef251af1690233f08cbbe4c52b4a', '3067836615@qq.com', '错误', '出错了：com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`chatbot`.`t_chat_session`, CONSTRAINT `t_chat_session_ibfk_2` FOREIGN KEY (`model_version_id`) REFERENCES `t_model_version` (`id`))', '2024-04-09 14:33:55');
INSERT INTO `t_system_log` VALUES ('25a3d4e62f5b69a25ead88c9fe6383ca', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:17:24');
INSERT INTO `t_system_log` VALUES ('25be0ebc70e2d19780b35533e533da36', '3067836615@qq.com', '警告', '业务异常：您无权访问此会话', '2024-04-09 15:25:37');
INSERT INTO `t_system_log` VALUES ('264e5c3bb519ae97664bbb3a6ebcb7c6', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 14:11:20');
INSERT INTO `t_system_log` VALUES ('275b4cf06022326bca18f5a7d695ce0b', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:26:12');
INSERT INTO `t_system_log` VALUES ('28859ea4747ed5bda0c9c053dbe2a24f', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:39:38');
INSERT INTO `t_system_log` VALUES ('2a53b2b9d893bd5da27630aa04560359', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:41:19');
INSERT INTO `t_system_log` VALUES ('2b627e380b67e30666382de3634afc51', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:42:26');
INSERT INTO `t_system_log` VALUES ('2f1a228526fb97737acc7b6da8d0e283', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 14:55:10');
INSERT INTO `t_system_log` VALUES ('3564f87797750df2201425da098265c9', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:31:29');
INSERT INTO `t_system_log` VALUES ('3718213493739efb4756a3ab7264abb1', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 16:03:31');
INSERT INTO `t_system_log` VALUES ('3b85411639c06702478480b3ccc63bb3', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:15:50');
INSERT INTO `t_system_log` VALUES ('3e606f5d0d86fbc999ecc8a2ab0a5b89', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 14:55:56');
INSERT INTO `t_system_log` VALUES ('3eb4f51acb7f82feab6e6542bbe832a8', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:33:22');
INSERT INTO `t_system_log` VALUES ('456fb12c2e3c9930b2d5f9e66e8714c6', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:27:16');
INSERT INTO `t_system_log` VALUES ('461ebfa0204877f1f18822ac96ed9a07', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:39:07');
INSERT INTO `t_system_log` VALUES ('46340e504081b010169cbee0c39580e5', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:33:02');
INSERT INTO `t_system_log` VALUES ('485a6b1b6ba8f93581d7ab21147ccbb8', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 16:07:53');
INSERT INTO `t_system_log` VALUES ('4d0b1d53ee9166807a773f1fa23f7312', '未知', '警告', '业务异常：已达到最大会话数', '2024-04-09 13:11:12');
INSERT INTO `t_system_log` VALUES ('4f8acac7fc254062a0372ee54ccdc7c5', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:17:37');
INSERT INTO `t_system_log` VALUES ('5074f450ba3b2ed5255c7fddcec3ee72', '未知', '警告', '业务异常：已达到最大会话数', '2024-04-09 13:09:31');
INSERT INTO `t_system_log` VALUES ('54914f3bf0011ca540eaa0e24e16606b', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:13:35');
INSERT INTO `t_system_log` VALUES ('54d84d4a3b6eff59fd8b58142371a1b4', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:48:19');
INSERT INTO `t_system_log` VALUES ('56c4cc0a4b56f094d728720450a3858c', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:14:52');
INSERT INTO `t_system_log` VALUES ('57f2277ecb7d76ff4a5fdbba4cb1e99a', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:02:22');
INSERT INTO `t_system_log` VALUES ('58be87989b3e0b6056426acd4a04f547', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:15:48');
INSERT INTO `t_system_log` VALUES ('59da8ced656c2515f7b96d4a0b01149b', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:32:01');
INSERT INTO `t_system_log` VALUES ('5dff8342f7e43814f0a7d2322ba96d9d', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:13:27');
INSERT INTO `t_system_log` VALUES ('5e74ac54d2b5acb8247ca8058aa4ca88', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:30:44');
INSERT INTO `t_system_log` VALUES ('5ff740063432fb4a7b49a8593f5568a8', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:30:41');
INSERT INTO `t_system_log` VALUES ('604a8b357b98d2c170dd91f5f0386191', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 16:10:04');
INSERT INTO `t_system_log` VALUES ('60cb335a5da77ee57f3fdd70cf6737b4', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:37:08');
INSERT INTO `t_system_log` VALUES ('62dc3495575fb44c50cd55d86f936f0f', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:43:45');
INSERT INTO `t_system_log` VALUES ('64087c98b155143e818ca02b799da9e4', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:40:47');
INSERT INTO `t_system_log` VALUES ('6f268511272d867f335dde283de0c33e', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 14:11:22');
INSERT INTO `t_system_log` VALUES ('6fd391bac9adc9576cc6da9fe97b38dc', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:04:51');
INSERT INTO `t_system_log` VALUES ('726e88bd0f272d7919faf4fcc54fe199', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 16:09:12');
INSERT INTO `t_system_log` VALUES ('729e88e90aeeae256b788f236ab633ba', '未知', '警告', '业务异常：您无权访问此会话', '2024-04-09 12:55:04');
INSERT INTO `t_system_log` VALUES ('7372d6f7193c79a4f528c624d12b89ac', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:34:41');
INSERT INTO `t_system_log` VALUES ('76c2f34a2e1d3b9ffa795f7e795589ac', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:12:14');
INSERT INTO `t_system_log` VALUES ('773b9cbb1c9a896ffd6c27fae26a0420', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:55:05');
INSERT INTO `t_system_log` VALUES ('78bc9d4fa94c4dd78b011ca39b51c5f5', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:32:00');
INSERT INTO `t_system_log` VALUES ('7f1e587133a64940e211ffcbd94961a2', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:44:39');
INSERT INTO `t_system_log` VALUES ('7f9409a35d6c4eb15c49cf890f53d92a', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:35:45');
INSERT INTO `t_system_log` VALUES ('7fbb88d28642634e164b37f4a9ed0479', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:45:44');
INSERT INTO `t_system_log` VALUES ('80538600e11c76beadf857547f086a51', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:30:46');
INSERT INTO `t_system_log` VALUES ('818e33b65f1f7025f36570dbacb16053', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 14:10:06');
INSERT INTO `t_system_log` VALUES ('85475d1f11904ab45627b3f621c31eaa', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:56:25');
INSERT INTO `t_system_log` VALUES ('85f0cce28316bc29a15702fb978f2b07', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:22:28');
INSERT INTO `t_system_log` VALUES ('8c1fb6b339a17215d512424176b49895', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:09:18');
INSERT INTO `t_system_log` VALUES ('90d1d32c435b8b1ea6f1cec6ecce33d0', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:47:50');
INSERT INTO `t_system_log` VALUES ('9173306edf44c62a410da39c48bffb64', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:43:06');
INSERT INTO `t_system_log` VALUES ('91bc7a1fa383293210402df39180cedb', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:30:45');
INSERT INTO `t_system_log` VALUES ('9265eb9d0fa11e36ec3598bfdab798f3', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:19:29');
INSERT INTO `t_system_log` VALUES ('929ab7f41b57ebe2fea9c672ddcb7509', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:17:06');
INSERT INTO `t_system_log` VALUES ('95190974ba737490eef108df7d111395', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:31:28');
INSERT INTO `t_system_log` VALUES ('9a484dbab0fd6d4b16882a21aaf8ef43', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:50:05');
INSERT INTO `t_system_log` VALUES ('a5a1adaf6b220766072f9a4f73a772ad', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:48:58');
INSERT INTO `t_system_log` VALUES ('a626b45e8c3f8bcb31c937803d9aa990', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:23:41');
INSERT INTO `t_system_log` VALUES ('aa4ce59cb3b9c846327a9677393e3f96', '未知', '警告', '业务异常：您无权访问此会话', '2024-04-09 13:04:20');
INSERT INTO `t_system_log` VALUES ('aba1d459ce71531106891b56bea0b075', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 16:08:28');
INSERT INTO `t_system_log` VALUES ('b00a4e96061adc794e0c23f6c87da30d', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:25:19');
INSERT INTO `t_system_log` VALUES ('b3c46ffab0b1d7197ab0cb6c054cfe61', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:25:42');
INSERT INTO `t_system_log` VALUES ('ba8fd2f2915b5bc1d589043b6993fd1b', '3067836615@qq.com', '警告', '业务异常：您无权访问此会话', '2024-04-09 13:48:57');
INSERT INTO `t_system_log` VALUES ('bac22a79c70588d519b4713a74e84c21', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 14:05:15');
INSERT INTO `t_system_log` VALUES ('bbdbd48c74e9895993bc44c149f236e4', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 16:07:38');
INSERT INTO `t_system_log` VALUES ('c725826e54b5a67d4f2515a720d9f615', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:48:01');
INSERT INTO `t_system_log` VALUES ('c78436f870da692062a7540218b342aa', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:05:48');
INSERT INTO `t_system_log` VALUES ('ca9dfae2b6d6bf83f90c6c323908c3bb', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:47:44');
INSERT INTO `t_system_log` VALUES ('cdf0640e7f30442eb80cb21a065afb77', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:04:21');
INSERT INTO `t_system_log` VALUES ('d0836ca24ca433e84740b4c74722f9a5', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:58:30');
INSERT INTO `t_system_log` VALUES ('d0a88bdf0bf6ac4b2b120890ef7791b8', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:34:35');
INSERT INTO `t_system_log` VALUES ('d22f092cb4c52cfb3e8ce94f1e526a60', '3067836615@qq.com', '警告', '业务异常：该模型为默认模型，无法删除！', '2024-04-09 14:37:21');
INSERT INTO `t_system_log` VALUES ('d2a423a08d26203e19710761aecaac45', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 14:33:50');
INSERT INTO `t_system_log` VALUES ('d329ce30c041e71579612f6c20c227d7', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:44:30');
INSERT INTO `t_system_log` VALUES ('d405b24a2a4e12fbb8c454a7a06c74a4', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:49:01');
INSERT INTO `t_system_log` VALUES ('d414a62db7eca707a3c521771a07a24a', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:46:14');
INSERT INTO `t_system_log` VALUES ('d45636e0ac355c7031a53ed59d1dbfe8', '3067836615@qq.com', '错误', '出错了：null', '2024-04-09 13:34:09');
INSERT INTO `t_system_log` VALUES ('d551f088d62cec6d20bd415c6a48c6fd', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 16:19:01');
INSERT INTO `t_system_log` VALUES ('d8fc9841b914738134d91ad399de9beb', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:43:57');
INSERT INTO `t_system_log` VALUES ('d945bdeb46fe4496c0b5d2ad13989dbb', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:30:47');
INSERT INTO `t_system_log` VALUES ('da3faf5367f0601d1a2e1e91ba3a8322', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:30:43');
INSERT INTO `t_system_log` VALUES ('e19ea61ee9a4e27b70b8cc691ec10814', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:32:00');
INSERT INTO `t_system_log` VALUES ('e22174c0e14eda9edb1fabac9cb0f6d0', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 16:18:32');
INSERT INTO `t_system_log` VALUES ('e6cf285cf20a3fa7f09973855f51910e', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:48:14');
INSERT INTO `t_system_log` VALUES ('e72ac0d742e3dd76ede234506cd1165e', '3067836615@qq.com', '警告', '业务异常：您无权访问此会话', '2024-04-09 16:10:03');
INSERT INTO `t_system_log` VALUES ('e75044eadaf0299e1f53c1dbd9a5fbe6', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 14:10:15');
INSERT INTO `t_system_log` VALUES ('ed2d6e5affa5e86f6933b9eb3a76a641', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:36:42');
INSERT INTO `t_system_log` VALUES ('ed88a4131497897645f4987eca3715f3', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 16:18:00');
INSERT INTO `t_system_log` VALUES ('ef55b0e086812188e9b0204bae367321', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:13:33');
INSERT INTO `t_system_log` VALUES ('efa9868007b1f869edd3a3b88ba6f4e6', '3067836615@qq.com', '警告', '业务异常：您无权访问此会话', '2024-04-09 15:34:35');
INSERT INTO `t_system_log` VALUES ('f0d91038fe02b1e989409a4c1ebe1a13', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:17:01');
INSERT INTO `t_system_log` VALUES ('f12a81e7060a12754f08cd92225c31f9', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:17:37');
INSERT INTO `t_system_log` VALUES ('f16372becb3c4894e2fc637c3909d0c4', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:34:33');
INSERT INTO `t_system_log` VALUES ('f3b8ac14ee95ea91681c44b8eaeef013', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:35:36');
INSERT INTO `t_system_log` VALUES ('f4b5e83d1f667ed6be0a0cdd0ee5ba44', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:12:10');
INSERT INTO `t_system_log` VALUES ('f702c1b87ffd236e2c5caa453e39ca62', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 15:01:57');
INSERT INTO `t_system_log` VALUES ('f70edc361de19a61efca0238fdcebccc', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:34:09');
INSERT INTO `t_system_log` VALUES ('f76beabec6a51883ca0c476f62f289ba', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:32:47');
INSERT INTO `t_system_log` VALUES ('f9167ef209fef98c6ac135293f143e3d', '3067836615@qq.com', '信息', '清空系统日志', '2024-04-09 12:11:55');
INSERT INTO `t_system_log` VALUES ('fa00417e40cdf94de340f5d33cc915d7', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 12:34:14');
INSERT INTO `t_system_log` VALUES ('fbcbaad148be4e3c50a3e87d3da34a82', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:32:01');
INSERT INTO `t_system_log` VALUES ('fd5dd2b0dace8514af1fbc4e29730e3a', '3067836615@qq.com', '信息', '获取用户信息', '2024-04-09 13:30:45');

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
INSERT INTO `t_user` VALUES ('2cbcb04456e5b0419e4a189cd27d8fc9', 'XVJx+cw6nRy5ge/DL3S/NA==', 'RwI/lv4Y2MBZ5CNeCMSgXg==', 'my/bnohoTSX+w4CNocpXCqHXu6gOYSwqEXHBxTZnnQQ=', 'https://insectmk.cn/static/img/head/insectmk.png', 'AvWDh1xxSqk2yjUr6je793HYEHwl+knqEBRCMuyvGULCOphtfSejgrT/rU+ZYg4w', 10, 10000, '2024-03-29 14:30:09', '2024-04-09 12:46:39');
INSERT INTO `t_user` VALUES ('56439f0e310cd4dae5d9ed51f869d51d', 'u69DWYE27dZSV6Ez5AeFJQ==', 'Ksid7UvKEJgngAbAbz/sSw==', '1/jcYjVOKilFzYGhtZ1csqHXu6gOYSwqEXHBxTZnnQQ=', 'https://insectmk.cn/static/img/head/insectmk.png', 'HL78heW5NViuq0ykl9Ex0xPZmjB3uJK3tkiXLKAnnnvCOphtfSejgrT/rU+ZYg4w', 10, 5987, '2024-03-29 13:30:50', '2024-04-09 12:46:33');
INSERT INTO `t_user` VALUES ('a036b08c189facd488d115954ca19f08', 'sxhZzTScVF8QKah1agmaoQ==', 'RwI/lv4Y2MBZ5CNeCMSgXg==', 'dHf4YG+tZUC2FRVLtubjJ6HXu6gOYSwqEXHBxTZnnQQ=', 'https://insectmk.cn/static/img/head/insectmk.png', 'FWoWMt7dfIKOyA24aY+vwNxwSH0aFa/f4RnmxY8vQQPCOphtfSejgrT/rU+ZYg4w', 10, 10000, '2024-04-09 12:41:40', '2024-04-09 12:41:40');

SET FOREIGN_KEY_CHECKS = 1;
