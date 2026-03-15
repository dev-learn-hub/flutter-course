---
layout: default
title: "第6周课堂练习：Dart 异步编程与网络请求"
permalink: /week-06/exercise/
---

# 第6周课堂练习

本节为**当堂可完成的练习**，基于本周 [大纲](../outline/)、[讲义](../lecture/) 与 [演示案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-06) 内容。

---

## 练习 1：运行本课程 Demo 并理解异步与 JSON

**依据**：讲义「五、运行本课程第6周 Demo」；案例 `demos/week-06/demo/async_http_cli`。

**步骤**：

1. 进入 `demos/week-06/demo/async_http_cli`，执行 `dart pub get`、`dart run bin/main.dart`。
2. 观察输出：至少会看到两条 Post 的标题与内容（若 API 可用则为真实数据，否则为 fallback）。
3. 在 `bin/main.dart` 中找到：`async`/`await` 的用法、`http.get` 与 `timeout`、`jsonDecode` 与 `Post.fromJson`。
4. 口头或笔记：`fetchPost` 的返回类型是什么？为什么 main 要写成 `Future<void> main() async`？

**验收**：能成功运行程序，并能指出异步函数、GET 请求与 fromJson 所在位置。

---

## 练习 2：修改案例请求另一条 post 或增加超时捕获

**依据**：大纲「网络请求」「错误处理与超时」；讲义「三、HTTP 请求」「二、异步基础」。

**步骤**：

1. 在 `main()` 中增加一次 `fetchPost(3)`（或任意 id），并 print 结果。
2. 或将 `fetchPost` 中的 `Duration(seconds: 10)` 改为 `Duration(milliseconds: 1)`，在 main 中保留 `on TimeoutException catch (e)`，运行后确认能捕获超时并打印。
3. 保存后运行，确认输出符合预期。

**验收**：程序能请求新 id 或能演示超时捕获。

---

## 练习 3：用 DartPad 写一个 async 函数（无 http）

**依据**：大纲「Future」「async-await」；讲义「二、异步基础与 Future」。

**步骤**：

1. 打开 [DartPad](https://dartpad.dev)。
2. 编写 `Future<String> fetchData() async { await Future.delayed(Duration(seconds: 1)); return 'Done'; }`，在 `main()` 中 `await fetchData()` 并 print（main 需为 `Future<void> main() async { ... }`）。
3. 点击 Run，确认约 1 秒后输出 "Done"。

**验收**：DartPad 中能定义并调用 async 函数，看到延迟后输出。

---

## 说明与链接

- **课堂练习**与**课后作业**不同：课堂练习为当堂完成、可当堂验收；课后作业见 [本周大纲](../outline/) 中的「📝 课后作业」。
- 遇到问题可查阅 [第6周讲义](../lecture/) 与 [Dart 异步 codelab](https://dart.dev/codelabs/async-await)。
- 返回 [第6周聚合页](../) 可继续查看大纲、讲义与案例。
