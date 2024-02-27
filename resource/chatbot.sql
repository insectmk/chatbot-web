CREATE
DATABASE chatbot CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 创建用户表
CREATE TABLE t_user
(
    id                INT AUTO_INCREMENT PRIMARY KEY,
    username          VARCHAR(255) NOT NULL UNIQUE,
    password          VARCHAR(255) NOT NULL,
    email             VARCHAR(255) NOT NULL UNIQUE,
    registration_time TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_login_time   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 创建模型版本表
CREATE TABLE t_model_version
(
    id              INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(255) NOT NULL,
    version_number  VARCHAR(255) NOT NULL,
    deployment_time TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    remarks         TEXT
);

-- 创建聊天会话表
CREATE TABLE t_chat_session
(
    id               INT AUTO_INCREMENT PRIMARY KEY,
    user_id          INT       NOT NULL,
    model_version_id INT,                                          -- 新增的字段
    start_time       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    end_time         TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES t_user (id),
    FOREIGN KEY (model_version_id) REFERENCES t_model_version (id) -- 新增的外键约束
);

-- 创建聊天消息表
CREATE TABLE t_chat_message
(
    id              INT AUTO_INCREMENT PRIMARY KEY,
    session_id      INT       NOT NULL,
    sender_type     ENUM('用户', '机器人') NOT NULL,
    message_content TEXT      NOT NULL,
    sent_time       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (session_id) REFERENCES t_chat_session (id)
);

-- 创建日志表
CREATE TABLE t_system_log
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    level       ENUM('信息', '警告', '错误') NOT NULL,
    message     TEXT      NOT NULL,
    create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

