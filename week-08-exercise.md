---
layout: default
title: "第8周课堂练习：Flutter 框架基础（第一部分）"
permalink: /week-08/exercise/
---

# 第8周课堂练习

本节为**当堂可完成的练习**，基于本周 [大纲](../outline/)、[讲义](../lecture/) 与 [演示案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-08) 内容。

---

## 练习 1：运行本课程第8周 Demo

**依据**：讲义「七、运行本课程第8周 Demo」；案例 `demos/week-08/demo/basics_demo`。

**步骤**：

1. 进入 `demos/week-08/demo/basics_demo`，执行 `flutter pub get`。
2. 执行 `flutter run`（或选择设备如 `flutter run -d chrome`）。
3. 在界面中确认：上方为个人信息卡片（StatelessWidget），下方为计数器（StatefulWidget）；点击「加」「减」观察数字变化。
4. 在 `lib/main.dart` 中找到：StatelessWidget（MyApp、HomePage、ProfileCard）与 StatefulWidget（CounterSection、_CounterSectionState）；找出 `setState` 的调用位置与对应的 `build` 方法。

**验收**：能运行 Demo，并能指出哪些是 StatelessWidget、哪些是 StatefulWidget，以及 setState 与界面更新的关系。

---

## 练习 2：修改个人信息或计数器初始值

**依据**：大纲「StatelessWidget 应用」「StatefulWidget 计数器」；讲义「三、StatelessWidget 与 StatefulWidget」。

**步骤**：

1. 在 `lib/main.dart` 中，将 `ProfileCard` 的 `name` 或 `role` 改为自己的信息，保存后按 `r` 做 Hot Reload，确认界面更新且计数器数值保留。
2. 将 `_CounterSectionState` 中 `_count` 的初始值改为 10（或任意值），保存后 Hot Reload，确认初始显示为新值。
3. 可选：给 AppBar 的 `title` 加上副标题或修改主题色，再次 Hot Reload 观察效果。

**验收**：能修改代码并通过 Hot Reload 看到效果，理解 Stateless 的配置由父组件传入、Stateful 的状态在 State 内维护。

---

## 练习 3：新增一个 StatelessWidget 展示项

**依据**：大纲「常用基础组件」；讲义「五、常用基础组件」。

**步骤**：

1. 在 `HomePage` 的 `Column` 中，在 `ProfileCard` 与 `CounterSection` 之间新增一个 StatelessWidget（如「课程名称：移动应用软件开发实训」），使用 `Text`、`Padding` 或 `Container` 进行简单排版。
2. 保存后 Hot Reload，确认新组件显示正确。
3. 说明该组件为什么用 StatelessWidget 即可（无需要变化的内部状态）。

**验收**：能独立写一个 StatelessWidget 并使用至少一种基础组件（Text/Container/Padding）展示内容。

---

## 说明与链接

- **课堂练习**与**课后作业**不同：课堂练习为当堂完成、可当堂验收；课后作业见 [本周大纲](../outline/) 中的「📝 课后作业」。
- 遇到问题可查阅 [第8周讲义](../lecture/) 与 [Flutter Widget 介绍](https://docs.flutter.dev/ui/widgets-intro)。
- 返回 [第8周聚合页](../) 可继续查看大纲、讲义与案例。
