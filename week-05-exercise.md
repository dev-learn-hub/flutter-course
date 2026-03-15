---
layout: default
title: "第5周课堂练习：Dart 语言进阶（第二部分）"
permalink: /week-05/exercise/
---

# 第5周课堂练习

本节为**当堂可完成的练习**，基于本周 [大纲](../outline/)、[讲义](../lecture/) 与 [演示案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-05) 内容。建议在完成「实操任务」后按顺序做。

---

## 练习 1：运行本课程 Demo 并理解类与异常

**依据**：讲义「八、运行本课程第5周 Demo」；案例 `demos/week-05/demo/library_cli`。

**步骤**：

1. 打开或克隆课程仓库，进入 `demos/week-05/demo/library_cli`。
2. 在终端执行 `dart run bin/main.dart`（或 `dart run .`）。
3. 对照输出，在 `bin/main.dart` 中找到：`Book` 类的属性与构造函数、`Library` 的 `addBook` 与 `findByAuthor`、重复 ISBN 时抛出的异常类型及 `main` 中的捕获方式。
4. 口头或笔记回答：本程序在什么情况下会抛出异常？异常类叫什么？

**验收**：能成功运行程序，并能指出 Book/Library 的职责与自定义异常的名称及触发条件。

---

## 练习 2：在案例中新增一本图书并触发一次查询

**依据**：大纲「类与对象」「图书馆管理系统」；讲义「二、类与对象」「八、运行本课程第5周 Demo」。

**步骤**：

1. 在 `bin/main.dart` 的 `main()` 中，仿照现有 `lib.addBook(Book(...))` 再写一行，添加一本新书（书名、作者、ISBN、年份自拟，ISBN 勿与已有重复）。
2. 保存后执行 `dart run bin/main.dart`，确认输出列表中出现该新书。
3. 在 `main()` 中增加一次按作者或按 ISBN 的查询并 `print` 结果，再次运行确认输出正确。

**验收**：程序输出包含新添加的图书，且有一次查询结果输出。

---

## 练习 3：用 DartPad 写一个简单类（含 getter 或自定义异常）

**依据**：大纲「类与对象」「异常处理」；讲义「二、类与对象」「六、异常处理」。

**步骤**：

1. 打开 [DartPad](https://dartpad.dev)。
2. 编写一个简单类，例如：`Rectangle`（宽、高），带 `area` getter；或在一个函数内对非法输入（如负边长）`throw` 自定义异常并在 `main` 中 `try-catch` 打印。
3. 在 `main()` 中创建对象并调用 getter，或触发异常并捕获，点击 Run 确认无报错、输出符合预期。

**验收**：在 DartPad 中能定义类（含 getter）或自定义异常并正确使用。

---

## 说明与链接

- **课堂练习**与**课后作业**不同：课堂练习为当堂完成、可当堂验收；课后作业见 [本周大纲](../outline/) 中的「📝 课后作业」。
- 遇到语法或异常问题，可查阅 [第5周讲义](../lecture/) 与 [Dart 语言导览](https://dart.dev/guides/language/language-tour)。
- 返回 [第5周聚合页](../) 可继续查看大纲、讲义与案例。
