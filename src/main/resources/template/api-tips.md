## 发送消息

### 普通对话

- 接口地址：`{{url}}/api/send?key={你的API密钥}`

- 请求类型：`POST`

- 请求数据格式：

  ```json
  {
      "messageContent": "你好"
  }
  ```


### 流式对话

- 接口地址：`{{url}}/api/send/stream?key={你的API密钥}`

- 请求类型：`POST`

- 请求数据格式：

  ```json
  {
      "messageContent": "你好"
  }
  ```

## 对话历史

- 接口地址：`{{url}}/api?key={你的API密钥}`
- 请求类型：`GET`

## 注意

1. 每位用户只能同时拥有一个API密钥
2. 重新生成API密钥会导致旧密钥的失效，并且会清除所有对话内容
