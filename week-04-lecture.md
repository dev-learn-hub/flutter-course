---
layout: default
title: "第4周讲义：Dart 语言基础（第一部分）"
permalink: /week-04/lecture/
---

本文为**第4周详细讲义**，侧重 Dart 变量、类型、集合、函数与闭包的操作与示例。课程大纲与目标见 [第4周大纲](../outline/)。

---

## 一、本讲目标与前置知识

- **目标**：掌握 Dart 变量与类型系统、List/Map/Set 操作、字符串与操作符、函数定义与参数、闭包概念；能运行并理解本课程 [第4周案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-04)（学生成绩管理 CLI）。
- **前置**：第3周已完成 Flutter 环境搭建；本讲可为纯 Dart，可用 [DartPad](https://dartpad.dev) 或本地 Dart SDK（`dart run`）练习。

---

## 二、环境：Dart 运行方式

- **DartPad**：浏览器打开 https://dartpad.dev ，无需安装，适合片段练习。
- **本地 Dart**：已安装 Flutter 则自带 Dart；或单独安装 [Dart SDK](https://dart.dev/get-dart)。在项目目录执行 `dart run bin/main.dart` 运行控制台程序。
- **本课程案例**：`demos/week-04/demo/student_score_cli` 为纯 Dart 控制台项目，在项目根目录执行 `dart run bin/main.dart` 即可运行。

---

## 三、变量与类型（要点）

- **var**：类型推导，赋值后类型确定。  
  `var name = 'Alice';`  
- **final**：运行时常量，赋值一次不可改。  
  `final age = 25;`  
- **const**：编译时常量。  
  `const pi = 3.14159;`  
- **dynamic**：动态类型，可任意赋值，慎用。  
- **类型注解**：`String name = 'Bob';`、`List<int> nums = [1, 2, 3];`  
- 建议：优先 `var`/`final`，需要明确时加类型注解；集合用泛型如 `List<int>`、`Map<String, int>`。

---

## 四、List / Map / Set 与案例对应

- **List**：`[1, 2, 3]`、`length`、`add`/`remove`、`forEach`、`map`。  
  案例中学生成绩用 `List<int>` 存储单人多门成绩。
- **Map**：`{'key': value}`、`map['key']`、`keys`/`values`、`putIfAbsent`。  
  案例中用 `Map<String, List<int>>` 存「姓名 → 成绩列表」。
- **Set**：去重、`union`/`intersection`/`difference`。  
  可用于「选课名单」等唯一集合场景。

案例代码中 `addScore`、`printAll`、`averageAll`、`highestAll`、`lowestAll`、`printSortedByAverage` 对应上述集合与函数用法。

---

## 五、字符串与操作符

- **字符串插值**：`'Hello, $name!'`、`'Result: ${a + b}'`。  
  案例中输出如 `'${entry.key}: ${entry.value}'`。
- **常用方法**：`length`、`toUpperCase`/`toLowerCase`、`split`、`trim`、`replaceAll`。
- **操作符**：算术 `+ - * / ~/ %`；关系 `== != < >`；逻辑 `&& || !`；空值 `??`、`??=`；级联 `..`。

---

## 六、函数与参数

- **定义**：`返回值类型 函数名(参数) { ... }`；单表达式可用 `=> expr`。
- **参数**：必需位置参数；可选位置 `[int? age]`；命名参数 `{String? name, int age = 0}`；`required` 命名参数。
- **一等公民**：函数可赋给变量、作参数、作返回值。案例中未显式写高阶函数，但 `sort` 等已接受回调。
- **闭包**：内层函数捕获外层变量。示例：`Function makeMultiplier(int n) => (int x) => x * n;`

---

## 七、运行本课程第4周 Demo

1. 打开或克隆课程仓库，进入 `demos/week-04/demo/student_score_cli`。
2. 在终端执行：  
   `dart run bin/main.dart`  
   或（Dart 3+）：  
   `dart run .`
3. 查看输出：添加学生与成绩、查询、平均/最高/最低、按平均分排序。  
4. 打开 `bin/main.dart` 对照本讲「变量、Map/List、函数、字符串」知识点阅读注释。

---

## 八、常见问题

- **找不到 `dart` 命令**：确认已安装 Dart SDK 或 Flutter，并将 `bin` 加入 PATH；或使用 DartPad。
- **类型错误**：注意 `List` 与 `List<int>`、`Map` 与 `Map<String, List<int>>` 等泛型写法。
- **空安全**：Dart 2.12+ 默认为空安全，未赋值变量需用 `?` 或赋初值；案例中使用了 `int?`、`final` 等。

---

## 九、与大纲、课堂练习的链接

- **大纲**（目标、讲授要点、实操与作业）：[第4周大纲](../outline/)。  
- **课堂练习**（当堂任务与验收）：[第4周课堂练习](../exercise/)。  
- **案例仓库路径**：[demos/week-04](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-04)。
