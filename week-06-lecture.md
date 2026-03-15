---
layout: default
title: "第6周讲义：Dart 异步编程与网络请求"
permalink: /week-06/lecture/
---

本文为**第6周详细讲义**，侧重 Future、async-await、HTTP 请求与 JSON 解析。课程大纲与目标见 [第6周大纲](../outline/)。

---

## 一、本讲目标与前置知识

- **目标**：理解异步模型，掌握 Future 与 async-await、使用 http 包发起 GET 请求、用 dart:convert 解析 JSON 并转为 Dart 对象；能运行本课程 [第6周案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-06)（async_http_cli）。
- **前置**：第5周类与对象、异常处理、pubspec 与依赖；能编写带依赖的 Dart 项目。

---

## 二、异步基础与 Future

- **同步 vs 异步**：同步阻塞当前流程；异步在等待时不阻塞，通过回调或 Future 获取结果。
- **Future**：表示将来某时刻的值或错误；`.then((value) => ...)`、`.catchError((e) => ...)`。
- **async-await**：`Future<T> foo() async { ...; return await someFuture; }`；`await` 暂停当前 async 函数直到 Future 完成。  
  建议用 async-await 替代长 then 链，用 try-catch 处理异常。

---

## 三、HTTP 请求（http 包）

- **添加依赖**：在 `pubspec.yaml` 中 `dependencies: http: ^1.2.0`，然后 `dart pub get`。
- **GET**：`import 'package:http/http.dart' as http;`，`final response = await http.get(Uri.parse(url));`，`response.statusCode`、`response.body`。
- **超时**：`await http.get(...).timeout(Duration(seconds: 10));`，捕获 `TimeoutException`（dart:async）。
- **错误处理**：statusCode != 200 时按需抛异常或走 fallback；网络异常用 try-catch。

---

## 四、JSON 解析

- **dart:convert**：`jsonDecode(response.body)` 得到 `dynamic`，通常强转为 `Map<String, dynamic>`；`jsonEncode(map)` 序列化。
- **fromJson 工厂**：为数据类写 `factory X.fromJson(Map<String, dynamic> json) => X(...);`，从接口返回的 Map 构建对象。  
  案例中 `Post.fromJson` 对应 JSONPlaceholder 的 post 结构。

---

## 五、运行本课程第6周 Demo

1. 进入 `demos/week-06/demo/async_http_cli`，执行 `dart pub get`，再 `dart run bin/main.dart`。
2. 若网络可达 JSONPlaceholder，将看到真实 post 数据；若不可达（如 403），程序用本地 JSON 回退，仍会输出 Post 对象，演示 fromJson。
3. 阅读 `bin/main.dart`：`fetchPost` 为 async、await http.get、timeout、jsonDecode、Post.fromJson；main 中 try/on TimeoutException/catch。

---

## 六、常见问题

- **403 / 网络错误**：部分环境无法访问公网 API，案例已做 fallback，本地仍可看到 fromJson 与异步流程。
- **TimeoutException**：需 `import 'dart:async';`。
- **类型**：jsonDecode 返回 dynamic，解析后建议转成 `Map<String, dynamic>` 再 fromJson。

---

## 七、与大纲、课堂练习的链接

- **大纲**：[第6周大纲](../outline/)。  
- **课堂练习**：[第6周课堂练习](../exercise/)。  
- **案例**：[demos/week-06](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-06)。
