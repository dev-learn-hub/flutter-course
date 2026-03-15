---
layout: default
title: "第8周讲义：Flutter 框架基础（第一部分）"
permalink: /week-08/lecture/
---

本文为**第8周详细讲义**，侧重 Flutter 应用结构、StatelessWidget 与 StatefulWidget、生命周期、常用基础组件及 Hot Reload。课程大纲与目标见 [第8周大纲](../outline/)。

---

## 一、本讲目标与前置知识

- **目标**：理解 Flutter 应用架构（main、runApp、MaterialApp）；掌握 StatelessWidget 与 StatefulWidget 的区别与写法；了解 StatefulWidget 生命周期；会使用 Text、Container、Padding、Center、ElevatedButton、Scaffold、AppBar 等基础组件；能运行本课程 [第8周案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-08)（basics_demo）。
- **前置**：第3周 Flutter 环境；第7周 Flutter Web 入门（已接触 StatefulWidget、setState）。  

---

## 二、Flutter 应用结构

- **入口**：`void main() { runApp(MyApp()); }`，runApp 挂载根 Widget。
- **MaterialApp**：`title`、`theme`（ThemeData、ColorScheme）、`home` 指定首页。
- **StatelessWidget**：实现 `build(BuildContext context)` 返回一棵 Widget 树；无内部可变状态，相同配置多次 build 结果一致。
- 本课程 Demo 中 `MyApp` 为 StatelessWidget，配置 MaterialApp；`HomePage` 为 StatelessWidget，使用 Scaffold、AppBar、body。

---

## 三、StatelessWidget 与 StatefulWidget

- **StatelessWidget**：不可变，无状态；适合纯展示（如个人信息卡片、标题）。
- **StatefulWidget**：需要可变状态时使用；由 `createState()` 返回一个 State 子类，状态保存在 State 中；通过 `setState(() { ... })` 更新状态并触发 rebuild。
- **写法**：StatefulWidget 类内 `State<XXX> createState() => _XXXState();`；State 子类中定义字段（如 `_count`）、在 `build` 中使用，在回调中调用 `setState` 更新。
- 本课程 Demo：`ProfileCard` 为 StatelessWidget（name、role 由父组件传入）；`CounterSection` 为 StatefulWidget，`_CounterSectionState` 中 `_count` 与 `_increment`/`_decrement` 调用 `setState`。

---

## 四、StatefulWidget 生命周期

- **createState()**：StatefulWidget 创建时调用，返回 State 实例。
- **initState()**：State 插入树时调用一次，适合做初始化（如订阅、加载数据）。
- **build()**：每次需要构建 UI 时调用（初次、setState 后、父重建等）。
- **setState()**：在 State 内调用，传入回调修改状态并标记需要重建，框架会再次调用 build()。
- **dispose()**：State 从树中移除时调用，应在此释放资源（如取消订阅、关闭控制器）。
- 讲义与课堂练习中可结合 Demo 的 CounterSection 说明：点击按钮 → 调用 setState → build 再次执行 → 界面更新。

---

## 五、常用基础组件

- **Text**：展示文本；**Icon**：图标（Icons.xxx）；**Image**：图片（asset、network 等）。
- **Container**：装饰（颜色、圆角、边框）、内边距、子组件；**Padding**：内边距；**Center**：居中。
- **ElevatedButton** / **ElevatedButton.icon**：按钮，`onPressed` 回调；**FloatingActionButton**：悬浮按钮。
- **Scaffold**：脚手架，提供 AppBar、body、FAB 等；**AppBar**：标题栏，`title`、`backgroundColor` 等。
- 本课程 Demo 使用了上述组件，可在 `lib/main.dart` 中对照大纲查阅。

---

## 六、Hot Reload

- **作用**：修改代码后保存，在运行中的应用按 `r`（或 IDE 热重载）即可看到变化，无需完全重启；**状态会保留**（如计数器当前值）。
- **适用**：UI 与样式修改、逻辑小改动；若修改了 initState 或全局静态数据，有时需完整重启（`R`）才生效。
- 建议在实操中多使用 Hot Reload 观察 Stateless/Stateful 与 build 的关系。

---

## 七、运行本课程第8周 Demo

1. 进入 `demos/week-08/demo/basics_demo`，执行 `flutter pub get`。
2. 执行 `flutter run`（或 `flutter run -d chrome` / `-d windows` 选择设备）。
3. 页面包含：上方 StatelessWidget 个人信息卡片（姓名、角色）；下方 StatefulWidget 计数器，点击「加」「减」观察数字变化。
4. 阅读 `lib/main.dart`：MyApp、HomePage、ProfileCard、CounterSection / _CounterSectionState、setState 与 build 的对应关系。

---

## 八、常见问题

- **找不到设备**：确保模拟器或真机已启动，或使用 `flutter run -d chrome`。
- **setState 后界面不更新**：检查是否在 State 子类内调用 setState，且修改的是 State 的实例字段。
- **RaisedButton 报错**：新版本 Flutter 推荐使用 ElevatedButton 替代 RaisedButton。

---

## 九、与大纲、课堂练习的链接

- **大纲**：[第8周大纲](../outline/)。  
- **课堂练习**：[第8周课堂练习](../exercise/)。  
- **案例**：[demos/week-08](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-08)。
