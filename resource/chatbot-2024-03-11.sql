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

 Date: 11/03/2024 14:00:03
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
INSERT INTO `t_chat_message` VALUES ('0100c3a486181ea50d6fcd673baa1065', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, 'hello', '2024-03-09 17:22:38');
INSERT INTO `t_chat_message` VALUES ('02e7f662784bc9c8d3650ddbdb32261a', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', 'f515a2703d1a9b1be50a29d71c294bcc', ' Hello again! Is there anything I can assist you with? If you have questions about anything in the world, I want to answer them for you!\n\n', '2024-03-09 17:14:50');
INSERT INTO `t_chat_message` VALUES ('1c4aac94b910ccc6ea7b70c2be5a9c22', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, 'hello', '2024-03-09 17:20:43');
INSERT INTO `t_chat_message` VALUES ('1d6c58c5e930c013e24bc5b2024dac29', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', 'b2470123c36a21f9cc5ce60a4b346038', ' 我是GPT-3.5，是一名基于 GPT-3.5 接口的人工智能机器人。我的任务是为你提供精准、24/7准确的答案和服务，有什么问题可以随时问我。\n\n', '2024-03-09 16:12:19');
INSERT INTO `t_chat_message` VALUES ('213b768baa238d4959223773e17844dd', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, '你好', '2024-03-05 17:41:44');
INSERT INTO `t_chat_message` VALUES ('2b56f9b0e3379d0d095a73a4d24303c4', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', '0100c3a486181ea50d6fcd673baa1065', '  How can I help you today?', '2024-03-09 17:22:38');
INSERT INTO `t_chat_message` VALUES ('34f973ae3bc24eee1ba68cd206074dcb', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', 'f8b0bddccfc15000b1c0dfc007bee7cc', ' `marked` 插件是 Github 提供的一个 Markdown 渲染引擎，插件主要用于集成 Vuepress 增强的话不能用 `marked` 热更新案例，因为渲染过程中会执行排版和选取元素所依赖的样式资源，这些样式资源不会随着 Markdown 内容的变化而更新。\n如果你需要使用 `marked` 内核渲染你的 Markdown 内容时还需要把你的样式资源复制到内存中，然后利用 `marked` 内核的监听机制和 Rust 手动代码实现：\n```rs\n// eslint-disable-next-line\nimport {Listen} from \"typed-jsm\"\n// ...\nconst Listen = (event: Listen, context: PatternMux = RuleContext(ref: PatternRef<Event>)) => {\n      \n}\n```\n`PatternMux` 守卫（Pattern：基本 Event 类型）用于监听匹配的', '2024-03-09 16:35:42');
INSERT INTO `t_chat_message` VALUES ('3d8ac5b36dc329aa04b791355074a230', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, '你好啊', '2024-03-09 15:49:56');
INSERT INTO `t_chat_message` VALUES ('3f0d200ee6c551f6cf8e012ce113cad5', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, '你好啊', '2024-03-09 17:15:44');
INSERT INTO `t_chat_message` VALUES ('4509a80459a26a79d1e58e3fdb5a84b5', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', '3f0d200ee6c551f6cf8e012ce113cad5', ' Hello! How can I assist you today?\n\n', '2024-03-09 17:15:44');
INSERT INTO `t_chat_message` VALUES ('52b1415221e187f031502ef69b1aeaa8', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', '213b768baa238d4959223773e17844dd', ' 你好！有什么问题我可以帮你解答吗？\n\n', '2024-03-05 17:41:44');
INSERT INTO `t_chat_message` VALUES ('5e01658f9b34ae6f85784dbd980a238e', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, '为什么你说话有时候只说一半？', '2024-03-09 16:29:54');
INSERT INTO `t_chat_message` VALUES ('6d0960568a3b82c34e47826673c6288e', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, '你是谁？', '2024-03-10 17:12:52');
INSERT INTO `t_chat_message` VALUES ('72375ca50f840c3736ba0943db6c8c8f', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', 'e791e166af147cde55e84598682e7cfc', ' 好的，下面是一个猜数字猜拳游戏的C++示例程序：\n```\n#include <iostream>\nusing namespace std;\nint main() {\n    int num, guess;\n    do {\n        cout << \"请用竖杆字数（必须大于等于1的整数）：\" << endl;\n        cin >> num;\n        do {\n            guess = rand() % num;   // 随机生成一个数字，加上随机数字素数\n        } while (guess < num);   // 判断猜拳最小的数字是否足够填满竖杆字数\n        if (guess == num) {\n            cout << \"恭喜你，猜中了...\" << endl;\n            cout << \"喜欢的游戏结束啦。\" << endl;\n            return 0;\n        } else {\n            cout << \"不好意思，猜的太大了，再来一点吧...\" << endl;\n        }\n    } while (guess != num);\n    cout << \"我不知道还有多少个小数，选择1~2：\"', '2024-03-09 16:12:56');
INSERT INTO `t_chat_message` VALUES ('79a57520f1a5975e26c9f7ad444abfdc', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, '请使用Java帮我写一个冒泡排序算法', '2024-03-09 17:23:10');
INSERT INTO `t_chat_message` VALUES ('875cbc97c294fc389b69751528bf4ec2', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', '8c60c30ec3a331838a105949bd23d7fb', ' 好的，这里是一个简单的猜数字小游戏的 Java 代码：\n```java\nimport java.util.Scanner;\npublic class GuessNumberGame {\n    public static void main(String[] args) {\n        int guessNumber;\n        do {\n            System.out.println(\"你猜成功了 \");\n            System.out.print(\"请输入一个整数：\");\n            guessNumber = scanner.nextInt();\n        } while (guessNumber <= 1 || guessNumber > 100);\n        System.out.println(\"你猜中了！\");\n    }\n}\n```\n这个程序使用 Scanner 类读取链式的用户输入，使用 do-while 循环让用户进行猜测，并让程序输出一个猜数字的提示信息，使用 while 循环让用户按照提示数进行猜测，直到猜中为止。\n\n', '2024-03-09 16:30:39');
INSERT INTO `t_chat_message` VALUES ('8c60c30ec3a331838a105949bd23d7fb', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, '请使用Java帮我写一个猜数字小游戏', '2024-03-09 16:30:39');
INSERT INTO `t_chat_message` VALUES ('953eeef436bceaad337e3dc1d631b534', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, '请使用C++帮我写一个冒泡排序算法', '2024-03-09 17:10:54');
INSERT INTO `t_chat_message` VALUES ('960c3e10dbc8dc3ac13cfae2a3a9830a', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', '79a57520f1a5975e26c9f7ad444abfdc', ' 好的，以下是Java语言实现的冒泡排序算法：\n```java\npublic class BubbleSort {\n    public static void bubbleSort(int [] arr, int n) {\n        int temp, swapped = 0;\n        do {\n            // 旧的数组与新的数组\n            for (int i = 0; i < n - 1; i++) {\n                temp = arr[i];\n                arr[i] = arr[i + 1];\n                arr[i + 1] = temp;\n            }\n            // 计算冒泡排序后的数组重叠部分的数\n            for (int i = 0; i < n - 1; i++) {\n                // 如果当前值相等，则交换它们\n                if (arr[i] == arr[i + 1]) {\n                    int temp = arr[i];\n                    arr[i] = arr[i + 1];\n                    arr[i + 1] = temp;\n                } else if (arr[i] < arr[i + 1]) {\n                    int temp = arr[i];\n                    arr[i] = arr[i + 1];', '2024-03-09 17:23:10');
INSERT INTO `t_chat_message` VALUES ('9662a694f702734cbf3548a10c4e5bfd', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', '1c4aac94b910ccc6ea7b70c2be5a9c22', ' Hello! I\'m here to assist you with anything you need. To ask a question, please feel free to say \"Hi\". Let me know if you have any questions or want to know more about anything. I\'m always here to help.\n\n', '2024-03-09 17:20:43');
INSERT INTO `t_chat_message` VALUES ('99a5017eb0c7dc76599695dd1acf14f3', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', '953eeef436bceaad337e3dc1d631b534', ' 好的，以下是用C++实现冒泡排序算法的代码：\n```cpp\n#include<iostream>\nusing namespace std;\nvoid bubbleSort(int arr[], int n)\n{\n    int temp, swapped = 0;\n    for (int i = 0; i < n - 1; i++)\n    {\n        for (int j = 0; j < n - i - 1; j++)\n        {\n            if (arr[j] > arr[j + 1])\n            {\n                temp = arr[j];\n                arr[j] = arr[j + 1];\n                arr[j + 1] = temp;\n            }\n        }\n        swapped = 0;\n    }\n}\nint main()\n{\n    int arr[] = { 10, 5, 8, 2, 9, 7, 3, 1, 4 };\n    int n = sizeof(arr)/sizeof(arr[0]);\n    bubbleSort(arr, n);\n    for (int i = 0; i < n; i++)\n        cout << arr[i] << \" \";\n    return 0;\n}\n```\n在上面的代码中，', '2024-03-09 17:10:54');
INSERT INTO `t_chat_message` VALUES ('ab55bdb05cf28c9706b79106d584cb21', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', 'b75b780bc82982aaf425273c57a0b729', ' I am ChatGPT, a GPT-3.5. \nAs an advanced language model, I have been trained on a vast amount of data and have access to numerous open sources, including Wikipedia, encyclopedias, scientific journals, and other databases. I can provide information on a wide range of topics, including recent breakthroughs in astronomy, biology, medicine, and other fields.\nMy aim is to help you understand complex topics, answer questions, and provide support when needed. Please let me know if you have any questions or would like me to assist you.\n\n', '2024-03-05 17:42:12');
INSERT INTO `t_chat_message` VALUES ('b2470123c36a21f9cc5ce60a4b346038', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, '你是谁啊？', '2024-03-09 16:12:19');
INSERT INTO `t_chat_message` VALUES ('b75b780bc82982aaf425273c57a0b729', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, '你是谁？', '2024-03-05 17:42:12');
INSERT INTO `t_chat_message` VALUES ('bdef815f2595a546c726c235182a93aa', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', 'bf6d49dcb10e43570271d3ca36768815', ' 当然，以下是C++语言编写的猜数字小游戏代码：\n```\n#include <iostream>\n#include <ctime>\nusing namespace std;\n// 生成1-100之间随机数\nint main()\n{\n    int random_number, guess;\n    do\n    {\n        cout << \"请输入您想猜的数字：\";\n        cin >> random_number;\n        // 生成一个1-100之间的随机数\n        random_number = rand() % 100 + 1;\n        // 玩游戏\n        cout << \"你猜的数字是：\" << random_number << endl;\n        // 判断猜中的数字\n        if (random_number == guess)\n        {\n            cout << \"恭喜你，正确地猜中了第一个数字！\" << endl;\n            break;\n        }\n        else if (random_number < guess)\n        {\n            cout << \"很遗憾，你猜的数字太小了。\" << endl;\n        }\n        else if (random_number > guess)\n        {', '2024-03-09 17:12:23');
INSERT INTO `t_chat_message` VALUES ('bf6d49dcb10e43570271d3ca36768815', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, '有C++的猜数字小游戏代码吗？', '2024-03-09 17:12:23');
INSERT INTO `t_chat_message` VALUES ('c6900dbfb07b0bb9c656ffbee8a21c9b', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, '请使用Java帮我写一个快速排序算法', '2024-03-09 15:41:25');
INSERT INTO `t_chat_message` VALUES ('caf690886dd6d5fcb5b0c3a4c4ae3112', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', 'e5aa10e40430369fd0187c57f10daf64', ' Hello, what can I assist you with today?\n\n', '2024-03-09 17:21:09');
INSERT INTO `t_chat_message` VALUES ('def058840d09cca8a50662e53698a2d7', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', 'c6900dbfb07b0bb9c656ffbee8a21c9b', ' ```\npublic class QuickSort {\n    \n    public static void quickSort(int[] arr, int left, int right) {\n        if (left < right) {\n            int mid = partition(arr, left, right);\n            quickSort(arr, left, mid - 1);\n            quickSort(arr, mid + 1, right);\n        }\n    }\n    \n    private static int partition(int[] ary, int left, int right) {\n        int pivot = ary[right - 1];\n        int i = left - 1;\n        for (int j = left; j < right; j++) {\n            if (ary[j] <= pivot) {\n                i++;\n                int temp = ary[i];\n                ary[i] = ary[j];\n                ary[j] = temp;\n            }\n        }\n        int temp = ary[i + 1];\n        ary[i + 1] = ary[right];\n        ary[right] = temp;\n        return i + 1;\n    }\n}\n```\n该快速排序算法使用了分治平均距离的思想，定义了一个递归函数`partition`用于', '2024-03-09 15:41:25');
INSERT INTO `t_chat_message` VALUES ('e4c50c680a8aeec7a92a731eeabbdaaa', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, 'C++的呢？', '2024-03-10 16:31:41');
INSERT INTO `t_chat_message` VALUES ('e5aa10e40430369fd0187c57f10daf64', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, 'hello', '2024-03-09 17:21:09');
INSERT INTO `t_chat_message` VALUES ('e791e166af147cde55e84598682e7cfc', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, '请使用C++帮我写一个猜数字的小游戏', '2024-03-09 16:12:56');
INSERT INTO `t_chat_message` VALUES ('eb79b50eae3337461cf44b24b76ceeb0', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', 'ecdd48140a671ae9883a68c7f0fbf111', ' 好的，以下是Java版本的冒泡排序算法：\n```\npublic static void bubbleSort(int[] arr) {\n    int n = arr.length;\n    for (int i = 0; i < n - 1; i++) {\n        for (int j = 0; j < n - i - 1; j++) {\n            if (arr[j] > arr[j + 1]) {\n                // swap arr[j] and arr[j+1]\n                int temp = arr[j];\n                arr[j] = arr[j + 1];\n                arr[j + 1] = temp;\n            }\n        }\n    }\n}\n```\n请注意，本实现中计算了n-1两个相邻元素的最大差值，然后在两个相邻元素之间进行交换，无需保存第一个和最后一个元素，因此时间复杂度为O(n^2)。\n\n', '2024-03-05 17:43:09');
INSERT INTO `t_chat_message` VALUES ('ec763494d1449bbb89055da4c55da094', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', '3d8ac5b36dc329aa04b791355074a230', ' 你好，有什么我可以帮助你的吗？需要我回答什么问题吗？\n\n', '2024-03-09 15:49:56');
INSERT INTO `t_chat_message` VALUES ('ecdd48140a671ae9883a68c7f0fbf111', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, '请使用Java帮我写一个冒泡排序算法', '2024-03-05 17:43:09');
INSERT INTO `t_chat_message` VALUES ('f32b558079afa7f91fd1355f132ecb25', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', '5e01658f9b34ae6f85784dbd980a238e', ' 这可能是由于回复的响应内容被分割成多条短语添加到回复中，因此只有一部分字符被显示。您可以稍后再次输入，以查看所有内容。感谢您的提问！\n\n', '2024-03-09 16:29:54');
INSERT INTO `t_chat_message` VALUES ('f515a2703d1a9b1be50a29d71c294bcc', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, '你好', '2024-03-09 17:14:50');
INSERT INTO `t_chat_message` VALUES ('f8b0bddccfc15000b1c0dfc007bee7cc', 'e33d6f643686c9b7a2b88a943d58b864', 'user', NULL, 'Vue的Markdown插件没法热更新内容怎么办？', '2024-03-09 16:35:42');
INSERT INTO `t_chat_message` VALUES ('f9bd494c42c309bde8965a976fc094d5', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', '6d0960568a3b82c34e47826673c6288e', ' AI（Artificial Intelligence）短句编辑器是一个认知人工智能的短语，它也是一个虚构的实体。这个短语可以加以结合内容，如在有点在线论坛上发布的确定，这种编辑模式被称为为开放曲线公式，该公式指的是如何逐步地分析线性问题并预测其目标表达。', '2024-03-10 17:12:52');
INSERT INTO `t_chat_message` VALUES ('ffa65c6bb2516535b24617d66a9ab3a2', 'e33d6f643686c9b7a2b88a943d58b864', 'assistant', 'e4c50c680a8aeec7a92a731eeabbdaaa', '  好的，以下是一个简单的Java C++实现的冒泡排序算法：\n```java\npublic class BubbleSort {\n    public static void bubbleSort(int[] arr, int n) {\n        int temp, swapped = 0;\n        int[] tmpArray = new int[n];\n        for (int i = 0; i < n - 1; i++) {\n            for (int j = 0; j < n - i - 1; j++) {\n                if (arr[j] > arr[j + 1]) {\n                    swap(arr, j, j + 1);   // 嵌套轮循\n                }\n            }\n            if (swap)\n                System.arraycopy(arr, 0, tmpArray, 0, n - 1);\n            else\n                bubble(arr, n);\n        }\n        for (int i = 0; i < n; i++)   // 返回排序好的数组\n            templ[i] = arr[i];\n        return templ;\n    }\n    public static void bubble(int[] arr, int n) {\n        for (int i = 0; i < n; i++)   // 年龄比较\n            if (arr[i] > arr[i + 1]) {\n                int temp = arr[i];\n                arr[i] = arr[i + 1];\n                arr[i + 1] = temp;   // 相邻的元素进行比较交换\n               // ...\n            }\n        }\n    }\n}\n```\n在上面的代码中，`bubbleSort(arr, n)` 和 `bubble(arr, n)` 是冒泡排序算法的实现，其中 `bubble(arr, n)` 利用 Java 内存模型比较旧的数组与新的数组的相对位置，从而将不相等的元素交换到其位置上，再进行一轮比较，直到所有元素都被排序为完成。`bubble` 函数从键盘上获取现有的数组，调用 `bubbleSort` 函数进行排序，并返回排序后的数组。\n这样，就完成了冒泡排序算法的实现。需要注意的是，冒泡排序算法通常较快，但也较容易陷入堆栈溢出而导致程序崩溃。', '2024-03-10 16:31:41');

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

-- ----------------------------
-- Table structure for t_model_version
-- ----------------------------
DROP TABLE IF EXISTS `t_model_version`;
CREATE TABLE `t_model_version`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deployment_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
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
  `head` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `api_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `registration_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `last_login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('18ce1152a25675a8f4d76b2b000caa5f', 'NvzRvCV7nXY8LjYpWXaZRg==', 'fyXSmoDZXdcH76QCG4RPhA==', '1/jcYjVOKilFzYGhtZ1csqHXu6gOYSwqEXHBxTZnnQQ=', NULL, 'JD0rG7KJSkUqWQHCCs6b0zMnqi0/ckVAEtCWE1nc1mTCOphtfSejgrT/rU+ZYg4w', '2024-03-01 11:28:29', '2024-03-10 17:32:57');

SET FOREIGN_KEY_CHECKS = 1;
