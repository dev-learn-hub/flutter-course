---
layout: default
title: "第7周课堂练习：Dart Web 开发与 Flutter Web 入门"
permalink: /week-07/exercise/
---

# 第7周课堂练习

本节为**当堂可完成的练习**，基于本周 [大纲](../outline/)、[讲义](../lecture/) 与 [演示案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-07) 内容。

---

## 练习 1：运行本课程 Flutter Web Demo

**依据**：讲义「四、运行本课程第7周 Demo」；案例 `demos/week-07/demo/flutter_web_counter`。

**步骤**：

1. 进入 `demos/week-07/demo/flutter_web_counter`，执行 `flutter pub get`。
2. 执行 `flutter run -d chrome`（或 `flutter run -d web-server` 后按提示在浏览器打开）。
3. 在页面中点击加、减、重置，确认数字变化正确。
4. 在 `lib/main.dart` 中找到：StatefulWidget 与 State、`setState` 的调用位置、三个按钮对应的回调。

**验收**：能在浏览器中运行计数器，并能指出状态与 setState 所在位置。

---

## 练习 2：修改计数器文案或初始值

**依据**：大纲「Flutter Web 计数器应用」；讲义「四、运行本课程第7周 Demo」。

**步骤**：

1. 在 `lib/main.dart` 中将 `_count` 的初始值改为 10（或任意值），保存后 Hot Reload（r）或重新运行，确认页面显示新初始值。
2. 或将 AppBar 的 title 改为「我的计数器」，保存后 Hot Reload 确认。
3. 运行 `flutter build web --release`，确认能成功构建（可选）。

**验收**：能修改代码并通过 Hot Reload 或重新运行看到效果。

---

## 练习 3：用 Flutter 新建一个 Web 项目并运行

**依据**：大纲「创建 Flutter Web 应用」；讲义「三、Flutter Web 概述与结构」。

**步骤**：

1. 在本地任意目录执行 `flutter create my_week7_web --project-name my_week7_web`。
2. 进入 `my_week7_web`，执行 `flutter run -d chrome`（或 `flutter run -d web-server`）。
3. 确认默认计数器应用能在浏览器中打开并点击加号有效。

**验收**：能独立创建 Flutter 项目并在浏览器中运行。

---

## 说明与链接

- **课堂练习**与**课后作业**不同：课堂练习为当堂完成、可当堂验收；课后作业见 [本周大纲](../outline/) 中的「📝 课后作业」。
- 遇到问题可查阅 [第7周讲义](../lecture/) 与 [Flutter Web 文档](https://docs.flutter.dev/get-started/web)。
- 返回 [第7周聚合页](../) 可继续查看大纲、讲义与案例。
