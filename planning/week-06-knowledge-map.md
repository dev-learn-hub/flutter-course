# 第6周知识点体系大纲

> 本周主题与目标（一句话）：理解异步模型，掌握 Future、async-await、HTTP 请求与 JSON 解析，能编写异步网络程序（含 GET 请求与 fromJson）。

---

## 一、异步基础与 Future

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| 同步 vs 异步 | 阻塞 vs 非阻塞、并发 | 区分并说明使用场景 |
| Future 与 then/catchError | 异步结果、链式处理 | 写出 Future 并 then/catchError 处理 |
| async-await | 异步函数、await 暂停至完成 | 用 async/await 改写 then 链并处理异常 |

---

## 二、Stream（选讲）

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| async* 与 yield | 异步生成流、listen | 写出简单 Stream 并用 listen 消费（可选） |

---

## 三、HTTP 请求

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| http 包 GET | Uri.parse、response.statusCode、body | 用 http.get 请求并判断状态码、取 body |
| http 包 POST | headers、body、jsonEncode | 用 http.post 发送 JSON 体 |
| 超时与错误 | .timeout()、TimeoutException、try-catch | 为请求加超时并捕获异常 |

---

## 四、JSON 解析

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| dart:convert | jsonDecode、jsonEncode | 将字符串与 Map 互转 |
| fromJson 工厂 | 从 Map 构建 Dart 类 | 为数据类写 factory X.fromJson 并解析接口返回 |

---

## 五、与本周 Demo / 课堂练习的对应

- **Demo**（`demos/week-06/demo/async_http_cli`）：覆盖「Future、async-await、http.get、jsonDecode、fromJson」；请求 JSONPlaceholder 获取一篇 post 并解析为对象输出。
- **课堂练习**（`week-06-exercise.md`）：当堂任务对应上述主块中的 2～3 个，验收与大纲一致。
