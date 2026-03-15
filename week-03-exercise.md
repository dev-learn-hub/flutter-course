---
layout: default
title: "第3周课堂练习：Flutter 开发环境搭建"
permalink: /week-03/exercise/
---

# 第3周课堂练习

本节为**当堂可完成的练习**，基于本周 [大纲](../outline/)、[讲义](../lecture/) 与 [演示案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-03) 内容。建议在完成「实操任务」后按顺序做。

---

## 练习 1：运行本课程 Demo 并修改文案

**依据**：讲义中「六、运行本课程第3周 Demo」；演示案例 `demos/week-03/demo/hello_world`。

**步骤**：

1. 打开或克隆课程仓库，进入 `demos/week-03/demo/hello_world`。
2. 在终端执行 `flutter pub get`，再执行 `flutter run`（或 `flutter run -d chrome` / `-d windows`）。
3. 用编辑器打开 `lib/main.dart`，将 `HomePage` 里显示的 `'Hello World!'` 改成你的学号或姓名。
4. 保存文件，在运行中的终端按 **r** 进行 Hot Reload，确认界面文字已更新。

**验收**：应用能运行，且界面中央显示你修改后的文字。

---

## 练习 2：用另一种 IDE 新建项目并运行

**依据**：大纲「实操任务」中「Android Studio 创建项目」与「VSCode 创建项目」；讲义「七、自己创建 Hello World 项目」。

**步骤**：

1. 若课上已用 Android Studio 建过项目，则改用 **VSCode** 新建一个 Flutter 项目；反之亦然。
2. 项目名称建议：`hello_week3`，路径不要含中文。
3. 创建完成后，在项目目录执行 `flutter run`（或选择可用设备后运行）。
4. 确认应用能正常启动。

**验收**：用与「实操」时不同的 IDE 成功创建并运行一个 Flutter 项目。

---

## 练习 3：把默认项目改成「一句话」页面

**依据**：大纲「实操任务」第 4 条「创建 Hello World 项目」；讲义「七、自己创建 Hello World 项目」中的「将默认计数器改为简单 Hello World」。

**步骤**：

1. 在练习 2 创建的项目中，打开 `lib/main.dart`。
2. 删除或注释掉默认的计数器逻辑（如 `_CounterWidget`、`floatingActionButton` 等）。
3. 将首页改为一个只显示一句话的页面，例如：`Text('第3周课堂练习完成')`，居中显示。
4. 保存后 Hot Reload 或重新运行，确认界面只显示该句话、无报错。

**验收**：应用运行后，页面中央只显示「第3周课堂练习完成」（或你自拟的等价文案）。

---

## 说明与链接

- **课堂练习**与**课后作业**不同：课堂练习为当堂完成、可当堂验收；课后作业见 [本周大纲](../outline/) 中的「📝 课后作业」。
- 遇到环境或步骤问题，可先查阅 [第3周讲义](../lecture/) 中的「常见问题与解决」。
- 返回 [第3周聚合页](../) 可继续查看大纲、讲义与案例。
