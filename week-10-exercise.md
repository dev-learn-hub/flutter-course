---
layout: default
title: "第10周课堂练习：Flutter 常用组件与功能（第一部分）"
permalink: /week-10/exercise/
---

# 第10周课堂练习

本节为**当堂可完成的练习**，基于本周 [大纲](../outline/)、[讲义](../lecture/) 与 [演示案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-10) 内容。

---

## 练习 1：运行本课程第10周 Demo

**依据**：讲义「七、运行本课程第10周 Demo」；案例 `demos/week-10/demo/components_demo`。

**步骤**：

1. 进入 `demos/week-10/demo/components_demo`，执行 `flutter pub get`。
2. 执行 `flutter run`（或选择设备如 `flutter run -d chrome`）。
3. 依次操作：点击 AppBar 左侧菜单、右侧搜索与更多，观察 SnackBar；在表单中输入不合规内容（如用户名 1 字符）点击登录，观察校验提示；输入合规内容后点击登录，观察 SnackBar；点击「AlertDialog」「BottomSheet」并操作；点击 GestureDetector、InkWell 区域。
4. 在 `lib/main.dart` 中找到：_formKey、Form、TextFormField 的 validator/onSaved、showDialog、showModalBottomSheet、ScaffoldMessenger.showSnackBar。

**验收**：能运行 Demo，并能指出 Form 校验与保存、Dialog 关闭、SnackBar 在代码中的位置。

---

## 练习 2：修改表单校验或 AppBar 按钮

**依据**：大纲「构建用户登录表单」「创建自定义 AppBar」；讲义「二、Form 与 TextFormField」「二、AppBar 详解」。

**步骤**：

1. 在 `lib/main.dart` 中，将用户名的 validator 改为「至少 5 个字符」，保存后 Hot Reload，输入 3 字符点击登录，确认出现新错误提示。
2. 或在 AppBar 的 actions 中新增一个 IconButton（如 Icons.settings），onPressed 中显示 SnackBar「设置」，Hot Reload 后点击确认。
3. 可选：将 AlertDialog 的「确定」改为在 SnackBar 中显示「已确认」后关闭（与当前 Demo 一致，可核对代码）。

**验收**：能修改 validator 或 AppBar 并看到预期行为，理解 Form 与 AppBar 的配置方式。

---

## 练习 3：新增一个表单字段或 BottomSheet 选项

**依据**：大纲「表单」「对话框系统」；讲义「三、Form 与 TextFormField」「五、对话框与 BottomSheet」。

**步骤**：

1. 在登录 Form 中新增一个 TextFormField「邮箱」（可选校验：包含 @），在 State 中增加 `String? _email`，在 onSaved 中保存，登录成功后 SnackBar 中显示邮箱（或仅显示「登录成功」）。
2. 或在 _showBottomSheet 的 Column 中新增一个 ListTile（如「从文件选择」），onTap 中 Navigator.pop 并显示 SnackBar「从文件选择」。
3. 保存后 Hot Reload，确认新字段或新选项可用。

**验收**：能独立增加一个 TextFormField（含 validator/onSaved）或一个 BottomSheet 选项，并正确关闭弹窗与提示。

---

## 说明与链接

- **课堂练习**与**课后作业**不同：课堂练习为当堂完成、可当堂验收；课后作业见 [本周大纲](../outline/) 中的「📝 课后作业」。
- 遇到问题可查阅 [第10周讲义](../lecture/) 与 [Flutter Form](https://api.flutter.dev/flutter/widgets/Form-class.html)。
- 返回 [第10周聚合页](../) 可继续查看大纲、讲义与案例。
