---
layout: default
title: "第5周讲义：Dart 语言进阶（第二部分）"
permalink: /week-05/lecture/
---

本文为**第5周详细讲义**，侧重 Dart 类与对象、继承与多态、抽象类与接口、Mixin、异常处理与包管理。课程大纲与目标见 [第5周大纲](../outline/)。

---

## 一、本讲目标与前置知识

- **目标**：掌握 Dart 类与构造函数、继承与多态、抽象类与接口、Mixin、异常处理与包管理；能运行并理解本课程 [第5周案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-05)（图书馆管理 CLI）。
- **前置**：第4周 Dart 变量、类型、List/Map、函数与闭包；能编写简单 Dart 程序。

---

## 二、类与对象（要点）

- **类定义**：`class 类名 { 属性; 构造函数; 方法; }`。
- **构造函数**：普通 `Person(this.name, this.age)`、命名 `Person.fromJson(Map j)`、工厂 `factory Person() => ...`；初始化列表 `: age = 0`。
- **getter/setter**：`double get area => ...`、`set radius(double r) => _radius = r`。
- **私有成员**：以下划线 `_` 开头的名称仅在当前库可见。  
  案例中 `Library` 使用 `_books` 私有 Map 存储图书。

---

## 三、继承与多态

- **继承**：`class Dog extends Animal { @override void makeSound() { ... } }`；用 `super` 调用父类方法。
- **多态**：父类类型变量可引用子类对象，调用时执行子类覆盖后的方法。  
  大纲中的动物类体系（Animal / Dog / Cat / Bird）可自行在 DartPad 或本地练习。

---

## 四、抽象类与接口

- **抽象类**：`abstract class Shape { double getArea(); }`，不能直接实例化，由子类实现抽象方法。
- **接口**：Dart 中类即接口，`class Circle implements Shape { ... }` 实现契约。  
  可结合大纲中的 Shape / Circle / Rectangle / Triangle 练习。

---

## 五、Mixin

- **mixin**：`mixin Swimmer { void swim() { ... } }`；使用 `class Duck extends Animal with Swimmer, Flyer { }`。
- **mixin on**：限制 mixin 仅可用于某类及其子类。  
  案例未使用 mixin，可在大纲「Mixin 混入实践」中练习。

---

## 六、异常处理

- **try-catch-finally**：`try { ... } catch (e) { ... } finally { ... }`。
- **特定异常**：`on DuplicateIsbnException catch (e) { ... }`。
- **自定义异常**：`class DuplicateIsbnException implements Exception { ... }`，用 `throw DuplicateIsbnException(isbn)` 抛出。  
  案例中 `Library.addBook` 在 ISBN 重复时抛出 `DuplicateIsbnException`，`main` 中演示捕获。

---

## 七、包管理（pub）

- **pubspec.yaml**：`name`、`version`、`dependencies`、`dev_dependencies`。
- **命令**：`dart pub get`、`dart pub upgrade`、`dart pub outdated`。  
  Flutter 项目中使用 `flutter pub get`。

---

## 八、运行本课程第5周 Demo

1. 打开或克隆课程仓库，进入 `demos/week-05/demo/library_cli`。
2. 在终端执行：`dart run bin/main.dart` 或 `dart run .`。
3. 查看输出：添加图书、按作者/ISBN 查询、重复 ISBN 异常捕获、删除图书。
4. 打开 `bin/main.dart` 对照本讲「类与对象、自定义异常、Library/Book」阅读代码。

---

## 九、常见问题

- **找不到 dart 命令**：确认已安装 Dart SDK 或 Flutter，PATH 包含 bin。
- **implements Exception**：自定义异常建议实现 `Exception` 接口并重写 `toString`。
- **Map 与类**：案例用 `Map<String, Book>` 存 ISBN → Book，可按需改为 `List<Book>` 并自己实现按 ISBN 查找。

---

## 十、与大纲、课堂练习的链接

- **大纲**：[第5周大纲](../outline/)。  
- **课堂练习**：[第5周课堂练习](../exercise/)。  
- **案例**：[demos/week-05](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-05)。
