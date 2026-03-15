# 异步 HTTP 与 JSON 解析（命令行）

第6周案例：演示 Future、async-await、http.get、jsonDecode、Post.fromJson、超时与异常捕获。

## 运行

```bash
dart pub get
dart run bin/main.dart
```

需要网络：请求 https://jsonplaceholder.typicode.com/posts/1 与 /posts/2。

## 说明

- `Post` 类含 `fromJson` 工厂；`fetchPost(id)` 为 async 函数，内部 await http.get、timeout、jsonDecode。
- 对应大纲：异步基础、async-await、网络请求、JSON 解析、错误与超时。
