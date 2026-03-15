---
layout: default
title: "第13周讲义：Flutter 应用架构与状态管理"
permalink: /week-13/lecture/
---

本文为**第13周详细讲义**，侧重应用架构概念、Provider（ChangeNotifier、watch/read、Consumer）、GetX 与 Bloc 要点、架构选择与常见问题。课程大纲与目标见 [第13周大纲](../outline/)。

---

## 一、本讲目标与前置知识

- **目标**：理解 MVC/MVP/MVVM 与分层架构；掌握 Provider 的 ChangeNotifier、Provider/Consumer、context.watch 与 context.read；了解 GetX 的 Obx/Controller 与 Bloc 的 Event/State/BlocBuilder；能运行本课程 [第13周案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-13)（state_management_demo）；能根据项目规模选择状态管理方案。
- **前置**：第11周数据与异步、第12周动画与交互；StatefulWidget 与 setState。  

---

## 二、应用架构基础

- **MVC / MVP / MVVM**：View 负责 UI，Controller/Presenter/ViewModel 负责状态与逻辑，Model 负责数据；三者职责分离，便于测试与维护。
- **分层架构**：Presentation（UI）→ Business Logic（状态管理、用例）→ Data（Repository、数据源）→ Infrastructure（API、数据库）。业务逻辑不写在 UI 或状态对象里，数据获取放在 Repository/Service。
- **状态与 UI 分离**：本课程 Demo 用 Provider 将 Counter（状态）放在 ChangeNotifier 中，UI 只通过 watch/read 消费，体现「状态与 UI 分离」。  

---

## 三、Provider

- **ChangeNotifier**：模型类 with ChangeNotifier，状态变化时调用 notifyListeners()，监听者会重建。
- **ChangeNotifierProvider**：在 runApp 或路由顶层用 `ChangeNotifierProvider(create: (_) => Counter(), child: MyApp())` 提供实例；MultiProvider 可组合多个 Provider。
- **context.watch\<T\>()**：在 build 中使用，监听 T 的变化，T 变化时当前 widget 重建；适合「展示状态」。
- **context.read\<T\>()**：只取当前 T，不监听，不触发重建；适合在回调中调用方法（如按钮 onPressed）。
- **Consumer\<T\>**：builder 只在 T 变化时重建该子树，可缩小重建范围，优化性能。本课程 Demo 中同时演示了 watch、read 与 Consumer。  

---

## 四、GetX 要点（简述）

- **GetxController**：继承 GetxController，用 .obs 声明响应式变量；onInit/onClose 生命周期。
- **Obx**：在 Obx 内访问 .obs 变量，变量变化时仅该 Obx 重建。
- **Get.put / Get.find**：依赖注入，在路由或全局 put Controller，在页面中 find 使用。大纲中有完整 GetX 待办示例。  

---

## 五、Bloc 要点（简述）

- **Event / State**：用户操作或系统事件转为 Event，Bloc 处理后 emit 新 State；UI 用 BlocBuilder 根据 State 构建。
- **BlocProvider / BlocBuilder / BlocListener**：Provider 提供 Bloc 实例；Builder 根据 state 建 UI；Listener 监听 state 做副作用（如 SnackBar、导航）。Bloc 需在适当时机 close，通常由 BlocProvider 管理。
- **职责**：Bloc 内只做「事件→状态」转换，网络请求等放在 Repository，Bloc 调用 repository。大纲中有 AuthBloc 等示例。  

---

## 六、架构选择与常见问题

- **选择建议**：小型应用用 Provider 或无需状态管理；中型可用 Provider/GetX；大型或企业级可用 Bloc。不在同一项目中混用多种方案。
- **常见错误**：过度设计（简单应用上 Bloc）；在状态对象中直接写 http 或数据库；忘记释放 Bloc/Controller。
- **最佳实践**：业务逻辑放在 Repository/Service；状态粒度适中；职责清晰、便于测试。  

---

## 七、运行本课程第13周 Demo

1. 进入 `demos/week-13/demo/state_management_demo`，执行 `flutter pub get`。
2. 执行 `flutter run`（或选择设备）。
3. 操作：点击「−」「+」「重置」观察数字变化；理解顶部数字由 context.watch 监听 Counter 重建；按钮用 context.read 调用方法；下方 Consumer 区域仅在 Counter 变化时重建。
4. 阅读 `lib/main.dart`：Counter with ChangeNotifier、notifyListeners；ChangeNotifierProvider 的 create；watch 与 read 的使用位置；Consumer 的 builder。  

---

## 八、与大纲、课堂练习的链接

- **大纲**：[第13周大纲](../outline/)。  
- **课堂练习**：[第13周课堂练习](../exercise/)。  
- **案例**：[demos/week-13](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-13)。
