---
layout: default
title: "第11周课堂练习：Flutter 常用组件与功能（第二部分）"
permalink: /week-11/exercise/
---

# 第11周课堂练习

本节为**当堂可完成的练习**，基于本周 [大纲](../outline/)、[讲义](../lecture/) 与 [演示案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-11) 内容。

---

## 练习 1：运行本课程第11周 Demo

**依据**：讲义「七、运行本课程第11周 Demo」；案例 `demos/week-11/demo/data_async_demo`。

**步骤**：

1. 进入 `demos/week-11/demo/data_async_demo`，执行 `flutter pub get`。
2. 执行 `flutter run`（或选择设备如 `flutter run -d chrome`）。
3. 在界面中：输入一段文字并点击「保存」，确认「已保存内容」更新并出现 SnackBar；观察 FutureBuilder 区域先显示「加载中…」再显示帖子或本地数据；点击「重新加载」观察再次加载。
4. 在 `lib/main.dart` 中找到：initState 中 _futurePost 的赋值、FutureBuilder 的 future 与 builder 内 connectionState/hasError/hasData 分支、SharedPreferences 的 setString/getString 调用位置。

**验收**：能运行 Demo，并能说明为何 Future 要在 initState 中创建，以及 SharedPreferences 与 FutureBuilder 在代码中的位置。

---

## 练习 2：修改 SharedPreferences 的 key 或增加一项

**依据**：大纲「SharedPreferences 本地存储」；讲义「二、SharedPreferences」。

**步骤**：

1. 在 `lib/main.dart` 中新增一个 key（如 `saved_count`），在「保存」时同时用 `prefs.setInt('saved_count', 当前次数)` 记录保存次数，并在页面上显示「已保存次数: X」。
2. 或把 _prefKey 改为其他字符串，保存后重启应用，确认仍能读出之前保存的内容（若 key 不变）或为空（若 key 变了）。
3. 保存后 Hot Reload 或重新运行，确认行为符合预期。

**验收**：能使用 setInt/getInt 或修改 key，理解 SharedPreferences 的键值存取。

---

## 练习 3：为 FutureBuilder 增加错误提示或修改超时时间

**依据**：大纲「网络请求」「FutureBuilder」；讲义「三、网络请求与 http」「四、FutureBuilder」。

**步骤**：

1. 在 _fetchPost 中把 `.timeout(const Duration(seconds: 5))` 改为 2 秒，保存后点击「重新加载」，观察在慢网络下是否更易出现超时（或保持 5 秒）。
2. 或在 FutureBuilder 的 hasError 分支里，用 SnackBar 或更明显的文案显示 `snapshot.error`，便于调试。
3. 确认「重新加载」会重新执行 _fetchPost 并更新界面（setState 中替换 _futurePost）。

**验收**：能修改超时时间或错误展示方式，理解 FutureBuilder 与 setState 刷新的关系。

---

## 说明与链接

- **课堂练习**与**课后作业**不同：课堂练习为当堂完成、可当堂验收；课后作业见 [本周大纲](../outline/) 中的「📝 课后作业」。
- 遇到问题可查阅 [第11周讲义](../lecture/) 与 [FutureBuilder](https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html)。
- 返回 [第11周聚合页](../) 可继续查看大纲、讲义与案例。
