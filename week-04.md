---
layout: default
title: "第4周大纲：Dart 语言基础（第一部分）"
permalink: /week-04/outline/
---

# 第4周：Dart 语言基础（第一部分）

## 周学习目标
掌握 Dart 变量、数据类型、操作符等基础概念，理解 Dart 中的类型推导和类型系统，掌握函数定义和基本的函数特性，能独立编写简单的 Dart 程序。

---

## 📚 课程内容（4小时）

### 第1-2节：讲授（2小时）

#### 一、Dart 语言简介与特点
- **Dart 的设计目标**
  - 为多平台开发设计（Web、移动、桌面、服务器）
  - 提高生产力和代码质量
  - 与 JavaScript 兼容
- **Dart vs. Java vs. Python vs. JavaScript**
  - 类型系统的对比
  - 语法特性的对比
  - 编译方式的对比

#### 二、变量与常量系统
- **var、dynamic、final、const 的区别与选择**
  ```dart
  var name = 'Alice';        // 类型推导，运行时确定
  dynamic value = 10;        // 动态类型，可任意改变
  final age = 25;            // 运行时常量，不可修改
  const PI = 3.14159;        // 编译时常量
  ```
- **类型注解**
  - 显式类型声明：`String name = 'Bob';`
  - 隐式类型推导：`var age = 30;`
  - 何时使用哪种方式

#### 三、基本数据类型详解

| 类型 | 说明 | 示例 |
|------|------|------|
| `int` | 整数 | `int x = 42;` |
| `double` | 浮点数 | `double pi = 3.14;` |
| `String` | 字符串 | `String name = 'Flutter';` |
| `bool` | 布尔值 | `bool isTrue = true;` |
| `List` | 列表 | `List<int> nums = [1, 2, 3];` |
| `Map` | 字典 | `Map<String, int> scores = {'Alice': 100};` |
| `Set` | 集合 | `Set<String> tags = {'flutter', 'dart'};` |

- **List 操作**
  - 创建：`[1, 2, 3]`、`List(5)`、`List.filled(3, 0)`
  - 常用方法：`add()`、`remove()`、`length`、`isEmpty`
  - 迭代：`for (var item in list)`、`forEach()`、`map()`

- **Map 操作**
  - 创建：`{'key': value}`、`Map()`
  - 访问：`map['key']`、`map.keys`、`map.values`
  - 常用方法：`putIfAbsent()`、`update()`、`remove()`

- **Set 操作**
  - 创建：`{'a', 'b', 'c'}`、`Set<String>()`
  - 集合运算：`union()`、`intersection()`、`difference()`
  - 唯一性：自动去重

#### 四、操作符全览
- **算术操作符**：`+`、`-`、`*`、`/`、`~/`（整除）、`%`（取余）
- **关系操作符**：`==`、`!=`、`<`、`>`、`<=`、`>=`
- **逻辑操作符**：`&&`、`||`、`!`
- **赋值操作符**：`=`、`+=`、`-=`、`*=`、`/=`、`??=`（空值赋值）
- **条件操作符**：三元操作符 `condition ? true_value : false_value`
- **特殊操作符**
  - `??`：空值合并操作符
  - `..`：级联操作符（链式调用）
  - `is`、`is!`：类型检查

#### 五、字符串操作
- **字符串创建**
  - 单引号、双引号、三引号（多行字符串）
  - Raw 字符串：`r'...'`（不转义）
- **字符串插值**
  ```dart
  String name = 'World';
  String greeting = 'Hello, $name!';  // 简单插值
  String msg = 'Result: ${2 + 3}';    // 表达式插值
  ```
- **字符串方法**
  - `length`、`isEmpty`、`toUpperCase()`、`toLowerCase()`
  - `substring()`、`split()`、`contains()`、`startsWith()`、`endsWith()`
  - `trim()`、`replaceAll()`、`padLeft()`、`padRight()`

#### 六、函数定义与调用
- **基本函数语法**
  ```dart
  // 有返回值的函数
  int add(int a, int b) {
    return a + b;
  }
  
  // 无返回值的函数（void）
  void printName(String name) {
    print('Name: $name');
  }
  
  // 箭头函数（简洁形式）
  int multiply(int a, int b) => a * b;
  ```

- **参数类型**
  - **必需参数**：`void greet(String name)`
  - **可选位置参数**：`void info(String name, [int age])`
  - **命名参数**：`void describe({String name, int age})`
  - **默认参数**：`void setConfig({int timeout = 30})`
  - **必需命名参数**：`void required({required String id})`

- **函数作为一等公民**
  ```dart
  Function add = (a, b) => a + b;
  var result = add(2, 3);
  
  // 函数作为参数
  void operate(int a, int b, Function fn) {
    print(fn(a, b));
  }
  operate(5, 3, (x, y) => x - y);  // 输出：2
  ```

#### 七、闭包与作用域
- **闭包的概念**
  - 内层函数访问外层变量
  - 变量捕获与生命周期
- **示例**
  ```dart
  Function makeMultiplier(int factor) {
    return (int number) => number * factor;  // 捕获 factor
  }
  var double = makeMultiplier(2);
  print(double(5));  // 输出：10
  ```

---

### 第3-4节：实操（2小时）

#### 实操任务
1. **环境准备**
   - 安装 Dart SDK
   - 配置 VSCode 或使用 DartPad（https://dartpad.dev）

2. **基本数据类型练习**
   ```dart
   // 声明各种数据类型的变量
   // 进行类型转换
   // 体验类型推导
   ```

3. **字符串操作练习程序**
   - 输入两个字符串，输出拼接、长度、大小写转换结果
   - 使用字符串插值

4. **数据结构操作练习程序**
   - 创建并操作 List、Map、Set
   - 实现列表元素搜索、排序
   - 实现字典数据查询

5. **函数与参数练习程序**
   - 编写多个函数演示不同参数类型
   - 编写高阶函数（函数作为参数）
   - 实现简单的函数组合

6. **完整程序：学生成绩管理系统**
   - 功能需求
     - 添加学生与成绩
     - 查询学生成绩
     - 计算平均分、最高分、最低分
     - 按成绩排序
   - 代码结构
     - 使用 Map 存储学生数据
     - 使用函数实现各个功能
     - 使用命令行交互

---

## 📝 课后作业

### 必做作业
1. ✅ 仿写教材《Flutter 实战》第 2 章的**所有示例程序**
   - 第2.1-2.5 节的代码片段
   - 确保每段代码都能正常运行

2. ✅ 编写**学生成绩管理系统**（命令行版本）
   - 支持添加学生信息
   - 支持查询单个或全部学生的成绩
   - 支持计算平均分、最高分、最低分
   - 代码规范，包含注释

3. ✅ 撰写实验报告（1500+ 字）
   - Dart 与 Java/Python 的相同点和不同点
   - Dart 类型系统的理解
   - 学习过程中的难点和解决方案

### 补充任务（加分）
- 扩展学生管理系统：添加删除、修改、排序功能
- 学习并使用 JSON 操作库（dart:convert）

---

## 📚 学习资源

### 官方文档
- **Dart 官方教程**：https://dart.dev/guides/language/language-tour
- **Dart 中文文档**：https://dart.cn
- **DartPad 在线编辑器**：https://dartpad.dev

### 参考资料
- 《Flutter 实战》第 2 章：Dart 语言
- Dart API 文档：https://api.dart.dev
- 菜鸟教程 Dart 部分

### 练习平台
- **LeetCode** - Dart 语言支持
- **HackerRank** - Dart 算法练习
- **Project Euler** - 用 Dart 解数学问题

---

## 🎯 学习检查清单

- [ ] 能区分 var、dynamic、final、const 四种变量声明方式
- [ ] 掌握所有基本数据类型的创建和常用操作
- [ ] 理解字符串插值和转义字符
- [ ] 能编写多种形式的函数（普通、箭头、匿名）
- [ ] 理解可选参数、命名参数、默认参数的区别
- [ ] 能编写使用闭包的程序
- [ ] 完成学生管理系统程序
- [ ] 所有示例代码都能正常编译和运行

---

## 💡 学习建议

1. **多敲代码，少看视频**
   - 每个概念都动手实践一遍
   - 使用 DartPad 快速验证想法

2. **对比学习**
   - 如果学过 Java/Python，对比学习会更快
   - 理解 Dart 独特的特性（Mixin、级联等）

3. **循序渐进**
   - 不要一开始就学太复杂的特性
   - 每周的内容都是为下周铺垫

4. **记错题本**
   - 记录编译错误和逻辑错误
   - 定期回顾

---

**预计完成时间**：4小时课内 + 6-8小时课外  
**难度等级**：⭐⭐⭐ （需要转变编程思维）  
**重要程度**：⭐⭐⭐⭐⭐ （Dart 基础，必须掌握）
