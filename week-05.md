---
layout: default
title: "第5周大纲：Dart 语言进阶（第二部分）"
permalink: /week-05/outline/
---

# 第5周：Dart 语言进阶（第二部分）

## 周学习目标
掌握 Dart 的面向对象编程特性，理解类、继承、接口、Mixin 等概念，学会异常处理，了解包管理系统。

---

## 📚 课程内容（4小时）

### 第1-2节：讲授（2小时）

#### 一、类与对象
- **类的定义**
  ```dart
  class Person {
    String name;
    int age;
    
    Person(this.name, this.age);  // 构造函数
    
    void introduce() {
      print('I am $name, $age years old');
    }
  }
  ```
- **构造函数类型**
  - 普通构造函数：`Person(String name, int age) { ... }`
  - 命名构造函数：`Person.fromJson(Map json) { ... }`
  - 工厂构造函数：`factory Person() { ... }`
  - 初始化列表：`Person(this.name) : age = 0;`

- **getter 与 setter**
  ```dart
  class Circle {
    double _radius;  // 私有属性（以 _ 开头）
    
    double get area => 3.14 * _radius * _radius;
    set radius(double r) => _radius = r;
  }
  ```

#### 二、继承与多态
- **继承语法**
  ```dart
  class Animal {
    void makeSound() {
      print('Some sound');
    }
  }
  
  class Dog extends Animal {
    @override
    void makeSound() {
      print('Woof!');
    }
  }
  ```
- **方法覆盖与 @override 注解**
- **super 关键字访问父类方法**
- **多态性理解**：同一消息，不同对象有不同响应

#### 三、抽象类与接口
- **抽象类**
  ```dart
  abstract class Shape {
    double getArea();  // 抽象方法
    
    void describe() {
      print('This is a shape');
    }
  }
  
  class Circle implements Shape {
    @override
    double getArea() => 3.14 * r * r;
    
    @override
    void describe() => super.describe();
  }
  ```
- **接口（通过 implements）**
  - Dart 中每个类都是潜在的接口
  - 使用 implements 实现接口契约

#### 四、Mixin 混入机制
- **什么是 Mixin**
  - 解决多重继承问题
  - 代码复用的另一种方式
- **Mixin 定义与使用**
  ```dart
  mixin Swimmer {
    void swim() {
      print('Swimming...');
    }
  }
  
  mixin Flyer {
    void fly() {
      print('Flying...');
    }
  }
  
  class Duck extends Animal with Swimmer, Flyer {
    // Duck 既能游泳又能飞行
  }
  ```
- **Mixin on 关键字**：限制 Mixin 的使用范围

#### 五、异常处理
- **try-catch-finally 机制**
  ```dart
  try {
    int result = 10 ~/ 0;  // 整除异常
  } catch (e) {
    print('Error: $e');
  } finally {
    print('Cleanup');
  }
  ```
- **捕获特定异常**
  ```dart
  try {
    // code
  } on IntegerDivisionByZeroException {
    print('Division by zero');
  } on Exception catch (e) {
    print('General exception: $e');
  } catch (e) {
    print('Unknown error: $e');
  }
  ```
- **自定义异常**
  ```dart
  class CustomException implements Exception {
    String message;
    CustomException(this.message);
  }
  ```
- **throw 关键字抛出异常**

#### 六、Dart 包管理（pub）
- **pubspec.yaml 文件**
  ```yaml
  name: my_app
  version: 1.0.0
  
  dependencies:
    flutter:
      sdk: flutter
    http: ^0.13.0
    json_serializable: ^6.0.0
  
  dev_dependencies:
    flutter_test:
      sdk: flutter
  ```
- **常用命令**
  - `pub get` / `flutter pub get`：获取依赖
  - `pub upgrade`：升级依赖
  - `pub outdated`：检查过期依赖
- **常用库介绍**
  - `http`：网络请求
  - `json_serializable`：JSON 序列化
  - `provider`：状态管理（后续章节）

---

### 第3-4节：实操（2小时）

#### 实操任务

1. **类与对象实践**
   - 编写 Person 类，包含构造函数、方法、getter/setter
   - 创建多个对象并调用方法

2. **继承与多态实践**
   - 设计动物类体系（Animal 基类）
   - 子类：Dog、Cat、Bird
   - 每个子类覆盖 makeSound() 方法
   - 演示多态性：同一方法，不同输出

3. **抽象类与接口实践**
   - 定义 Shape 抽象类
   - 实现 Circle、Rectangle、Triangle
   - 计算各自面积和周长

4. **Mixin 混入实践**
   - 定义 Swimmable、Flyable Mixin
   - 创建不同的动物类使用不同的 Mixin 组合

5. **异常处理实践**
   - 编写程序演示不同异常捕获
   - 自定义异常的创建和使用

6. **项目实践：图书馆管理系统**
   - Book 类：书名、作者、ISBN、出版年份
   - Library 类：管理图书集合
   - 功能：添加、删除、查询、分类
   - 异常处理：ISBN 重复、图书不存在等

---

## 📝 课后作业

### 必做作业
1. ✅ 仿写教材第 3-4 章的所有示例程序
2. ✅ 完成**图书馆管理系统**
   - 类设计
   - 异常处理
   - 完整的管理功能
3. ✅ 撰写实验报告（1500+ 字）
   - OOP 概念在 Dart 中的实现
   - 继承 vs. Mixin 的使用场景
   - 异常处理的最佳实践

### 推荐补充
- 学习 JSON 序列化：json_serializable
- 研究设计模式在 Dart 中的应用

---

## 📚 学习资源
- https://dart.dev/guides/language/language-tour#classes-and-objects
- 《Flutter 实战》第 3 章
- Dart API 文档：collections、core

---

## 🎯 学习检查清单
- [ ] 能创建多种类型的构造函数
- [ ] 理解继承和多态的关系
- [ ] 能正确使用抽象类和接口
- [ ] 理解 Mixin 的应用场景
- [ ] 能捕获和处理异常
- [ ] 能操作 pubspec.yaml
- [ ] 完成图书馆管理系统

---

**预计完成时间**：4小时课内 + 6-8小时课外  
**难度等级**：⭐⭐⭐⭐  
**重要程度**：⭐⭐⭐⭐⭐
