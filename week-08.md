---
layout: default
title: "第8周大纲：Flutter 框架基础（第一部分）"
permalink: /week-08/outline/
---

# 第8周：Flutter 框架基础（第一部分）

## 周学习目标
理解 Flutter 应用架构，掌握 StatelessWidget 和 StatefulWidget，学会使用常用基础组件。

---

## 📚 核心内容

### 讲授（2小时）

#### 一、Flutter 应用结构
```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
```

#### 二、StatelessWidget vs. StatefulWidget
- **StatelessWidget**：不可变，无状态
- **StatefulWidget**：可变，有状态
  ```dart
  class Counter extends StatefulWidget {
    @override
    State<Counter> createState() => _CounterState();
  }
  
  class _CounterState extends State<Counter> {
    int _count = 0;
    
    @override
    Widget build(BuildContext context) {
      return Text('Count: $_count');
    }
  }
  ```

#### 三、生命周期
- **StatefulWidget 生命周期**
  - `createState()`
  - `initState()`
  - `build()`
  - `setState()`
  - `dispose()`

#### 四、常用基础组件
- **Text**、**Image**、**Icon**、**Button**
- **Container**、**Padding**、**Center**
- **RaisedButton**、**FloatingActionButton**

#### 五、Hot Reload 原理
- 快速迭代开发
- 保留应用状态

---

### 实操（2小时）
1. 创建第一个 Flutter 应用
2. StatelessWidget 应用
3. StatefulWidget 计数器
4. 个人信息展示应用
5. 调试与 Hot Reload

---

## 📝 课后作业
1. 创建有状态计数器应用
2. 个人信息卡片展示
3. 实验报告

---

**预计完成时间**：4小时课内 + 5小时课外  
**难度等级**：⭐⭐⭐  
**重要程度**：⭐⭐⭐⭐⭐
