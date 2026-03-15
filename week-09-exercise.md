---
layout: default
title: "第9周课堂练习：Flutter 布局系统详解"
permalink: /week-09/exercise/
---

# 第9周课堂练习

本节为**当堂可完成的练习**，基于本周 [大纲](../outline/)、[讲义](../lecture/) 与 [演示案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-09) 内容。

---

## 练习 1：运行本课程第9周 Demo

**依据**：讲义「十、运行本课程第9周 Demo」；案例 `demos/week-09/demo/layout_demo`。

**步骤**：

1. 进入 `demos/week-09/demo/layout_demo`，执行 `flutter pub get`。
2. 执行 `flutter run`（或选择设备如 `flutter run -d chrome`）。
3. 在界面中依次确认：Row/Column 组合、横向 ListView、GridView 网格、Stack+Positioned、底部宽度提示。
4. 在 `lib/main.dart` 中找到：Row、Column、Expanded、ListView、GridView.count、Stack、Positioned、MediaQuery.of(context).size 的用法。

**验收**：能运行 Demo，并能指出各布局组件在代码中的位置及作用。

---

## 练习 2：修改 Row/Column 或 GridView

**依据**：大纲「Row 和 Column 组合」「GridView 网格应用」；讲义「三、Row 与 Column」「七、GridView」。

**步骤**：

1. 在 `lib/main.dart` 的 Row/Column 示例中，将 `mainAxisAlignment` 改为 `MainAxisAlignment.end` 或 `MainAxisAlignment.spaceBetween`，保存后 Hot Reload（r），观察对齐变化。
2. 或将 GridView.count 的 `crossAxisCount` 改为 2 或 4，Hot Reload 后观察列数变化。
3. 可选：在 ListView 的 `List.generate(5, ...)` 中把 5 改为 8，观察横向列表项数量增加。

**验收**：能通过修改参数并 Hot Reload 看到布局变化，理解 mainAxisAlignment、crossAxisCount 等的作用。

---

## 练习 3：新增一个 Stack 角标或 Wrap 区域

**依据**：大纲「Stack 和 Positioned 应用」；讲义「五、Stack 与 Positioned」「八、Wrap」。

**步骤**：

1. 在 Demo 的 Stack 示例中，新增一个 Positioned 子组件（如右下角外一点的位置），显示一个小圆点或文字「NEW」；或在本页任意一处新增一段 Wrap，内放 5～6 个 Chip，观察自动换行。
2. 保存后 Hot Reload，确认新组件显示正确。

**验收**：能独立使用 Positioned 在 Stack 中定位一个子组件，或使用 Wrap 实现一段可换行的子组件排列。

---

## 说明与链接

- **课堂练习**与**课后作业**不同：课堂练习为当堂完成、可当堂验收；课后作业见 [本周大纲](../outline/) 中的「📝 课后作业」。
- 遇到问题可查阅 [第9周讲义](../lecture/) 与 [Flutter 布局文档](https://docs.flutter.dev/ui/layout)。
- 返回 [第9周聚合页](../) 可继续查看大纲、讲义与案例。
