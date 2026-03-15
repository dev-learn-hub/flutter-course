---
layout: default
title: "第13周课堂练习：Flutter 应用架构与状态管理"
permalink: /week-13/exercise/
---

# 第13周课堂练习

本节为**当堂可完成的练习**，基于本周 [大纲](../outline/)、[讲义](../lecture/) 与 [演示案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-13) 内容。

---

## 练习 1：运行本课程第13周 Demo

**依据**：讲义「七、运行本课程第13周 Demo」；案例 `demos/week-13/demo/state_management_demo`。

**步骤**：

1. 进入 `demos/week-13/demo/state_management_demo`，执行 `flutter pub get`。
2. 执行 `flutter run`（或选择设备如 `flutter run -d chrome`）。
3. 在界面中：点击「−」「+」「重置」观察数字变化；点击「在 Consumer 内 +1」观察上方数字与下方卡片同步变化。
4. 在 `lib/main.dart` 中找到：Counter 的 notifyListeners、ChangeNotifierProvider 的 create、context.watch 与 context.read 的用法区别、Consumer 的 builder。

**验收**：能运行 Demo，并能说明 watch 与 read 的区别（谁触发重建、谁仅取当前值）。

---

## 练习 2：为 Counter 增加一个方法并用 read 调用

**依据**：大纲「Provider」；讲义「三、Provider」。

**步骤**：

1. 在 Counter 类中增加方法，例如 `void add(int n) { _count += n; notifyListeners(); }`。
2. 在 HomePage 的按钮区域或 Consumer 内增加一个按钮，在 onPressed 中用 `context.read<Counter>().add(2)` 调用。
3. 保存后 Hot Reload，点击新按钮确认数字增加 2；确认使用的是 read 而不是 watch（read 用于回调，watch 用于 build 中展示）。

**验收**：能在 ChangeNotifier 中新增方法，并在 UI 中通过 context.read 正确调用。

---

## 练习 3：用 Consumer 替代一处 context.watch（可选）

**依据**：讲义「三、Provider」中的 Consumer 说明。

**步骤**：

1. 将 HomePage 中「显示 count 的大数字」部分改为用 Consumer\<Counter\> 包裹，在 builder 中显示 counter.count。
2. 对比：整页用 watch 时，Counter 变化会重建整个 HomePage；仅该数字区域用 Consumer 时，只有 Consumer 的子树重建。理解「缩小重建范围」的意义。
3. 若时间允许，可保留两种写法并加注释说明使用场景。

**验收**：能使用 Consumer 局部监听 Counter，并理解其与 watch 的适用场景。

---

## 说明与链接

- **课堂练习**与**课后作业**不同：课堂练习为当堂完成、可当堂验收；课后作业见 [本周大纲](../outline/) 中的「📝 课后作业」。
- 遇到问题可查阅 [第13周讲义](../lecture/) 与 [Provider 包](https://pub.dev/packages/provider)。
- 返回 [第13周聚合页](../) 可继续查看大纲、讲义与案例。
