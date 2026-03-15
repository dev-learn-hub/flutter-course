---
layout: default
title: "第11周讲义：Flutter 常用组件与功能（第二部分）"
permalink: /week-11/lecture/
---

本文为**第11周详细讲义**，侧重本地存储（SharedPreferences）、网络请求（http）、FutureBuilder 正确用法与第三方库集成。课程大纲与目标见 [第11周大纲](../outline/)。

---

## 一、本讲目标与前置知识

- **目标**：掌握 SharedPreferences 的存取；掌握 http 包的 GET 请求与超时、错误处理；掌握 FutureBuilder 的正确用法（future 在 initState 或 State 中创建）；能运行本课程 [第11周案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-11)（data_async_demo）；了解 path_provider 与文件读写的思路。
- **前置**：第6周 Dart 异步与网络（Future、async-await、http、JSON）；第10周 Form、界面与事件。  

---

## 二、SharedPreferences

- **用途**：轻量键值对存储，适合配置、简单状态；不适合大量数据。
- **用法**：`SharedPreferences prefs = await SharedPreferences.getInstance();` 后使用 `prefs.setString(key, value)`、`prefs.getString(key)`、`setInt`/`getInt`、`setBool`/`getBool`、`remove(key)`、`clear()`。
- **异步**：getInstance 与 set/get 均为异步，在 initState 中可先调用 load 再 setState 更新 UI。本课程 Demo 中在「保存」后重新 load 并 SnackBar 提示。  

---

## 三、网络请求与 http

- **GET**：`http.get(Uri.parse(url))` 返回 `Future<Response>`；`response.statusCode`、`response.body`；常用 `.timeout(Duration(seconds: 10))` 避免长时间等待。
- **错误处理**：根据 statusCode 判断 200/404/401 等；用 try-catch 捕获网络异常与 TimeoutException。
- **JSON**：`import 'dart:convert';` 后 `jsonDecode(response.body)` 得到 Map/List；可配合模型类 fromJson。本课程 Demo 中若 API 不可用则使用本地 JSON 保证演示可运行。  

---

## 四、FutureBuilder 正确用法

- **关键**：`future` 参数应传入「同一份 Future」，不要在 build 里每次写 `future: fetchData()`，否则每次 build 都会重新发起请求。
- **做法**：在 State 中定义 `late Future<XXX> _futureData;`，在 `initState` 里 `_futureData = fetchData();`，build 里 `FutureBuilder(future: _futureData, builder: ...)`。
- **刷新**：需要重新加载时 `setState(() => _futureData = fetchData());`，让 FutureBuilder 拿到新的 Future。
- **builder 分支**：`snapshot.connectionState == ConnectionState.waiting` 显示加载；`snapshot.hasError` 显示错误；`snapshot.hasData` 显示数据。本课程 Demo 中三种状态均有对应 UI。  

---

## 五、path_provider 与文件（简述）

- **path_provider**：`getApplicationDocumentsDirectory()`、`getTemporaryDirectory()` 获取应用目录路径（移动端/桌面；Web 需注意兼容性）。
- **文件**：使用 `dart:io` 的 `File` 在路径下 `readAsString`、`writeAsString`、`exists()`、`delete()`；适合较大或结构化数据（如 JSON 文件）。大纲中有完整示例，Demo 以 SharedPreferences 为主便于多平台运行。  

---

## 六、第三方库集成

- **添加依赖**：在 `pubspec.yaml` 的 `dependencies` 下添加如 `http: ^1.2.0`、`shared_preferences: ^2.2.2`，然后执行 `flutter pub get`。
- **使用**：在代码中 `import 'package:http/http.dart' as http;`、`import 'package:shared_preferences/shared_preferences.dart';` 后调用 API。  

---

## 七、运行本课程第11周 Demo

1. 进入 `demos/week-11/demo/data_async_demo`，执行 `flutter pub get`。
2. 执行 `flutter run`（或选择设备）。
3. 操作：在输入框输入文字并点击「保存」，观察「已保存内容」与 SnackBar；查看 FutureBuilder 区域（加载中 → 数据或本地回退）；点击「重新加载」观察再次请求。
4. 阅读 `lib/main.dart`：initState 中 _loadSaved、_futurePost = _fetchPost()；SharedPreferences 的 setString/getString；FutureBuilder 的 future 与 builder 分支；_refreshPost 中 setState 更新 _futurePost。  

---

## 八、常见问题与最佳实践

- **FutureBuilder 重复请求**：确保 future 只在 initState 或「刷新」时创建，不要写在 build 的 FutureBuilder 参数里。
- **网络超时**：使用 `.timeout(Duration(seconds: n))` 并在 catch 中处理 TimeoutException。
- **SharedPreferences 存大数据**：不推荐；大量数据用文件或数据库（如 sqflite）。  

---

## 九、与大纲、课堂练习的链接

- **大纲**：[第11周大纲](../outline/)。  
- **课堂练习**：[第11周课堂练习](../exercise/)。  
- **案例**：[demos/week-11](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-11)。
