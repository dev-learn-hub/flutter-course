# 第13周知识点体系大纲

> 本周主题与目标（一句话）：理解应用架构（MVC/MVP/MVVM、分层），掌握 Provider、GetX、Bloc 三种状态管理方案，能根据项目规模选择合适方案并避免常见错误。

---

## 一、应用架构基础

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| MVC / MVP / MVVM | View、Controller/Presenter/ViewModel、Model 的职责划分 | 区分三种架构的差异与适用场景 |
| 分层架构 | Presentation、Business Logic、Data、Infrastructure | 能画出分层图并说明各层职责 |
| 职责分离 | UI 只展示与交互，业务在 Controller/Bloc，数据在 Repository | 不在 UI 或状态对象中写网络/数据库直连 |

---

## 二、Provider

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| ChangeNotifier | 继承或 with，内部状态变化时调用 notifyListeners() | 实现一个带状态的可通知模型（如 Counter） |
| ChangeNotifierProvider / MultiProvider | create 中创建实例，子树可读取 | 在 runApp 或路由顶层提供 Provider |
| context.watch / context.read | watch 监听变化触发重建，read 仅取当前值不监听 | 在 build 中用 watch 展示状态，在回调中用 read 调用方法 |
| Consumer | 局部监听某 Provider，builder 在变化时重建 | 用 Consumer 包裹仅需该状态的子树以优化重建范围 |

---

## 三、GetX

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| GetxController | 继承 GetxController，onInit/onClose | 定义响应式状态与业务方法 |
| .obs 响应式变量 | Rx 类型，变化时自动通知 | 用 .obs 声明状态，在 Obx 中访问触发监听 |
| Obx / GetBuilder | Obx 监听 .obs，GetBuilder 需 update() | 在 UI 中用 Obx 或 GetBuilder 绑定 Controller |
| 依赖注入与 Get.put | 全局或路由级注入 Controller | 在合适作用域 put Controller 并在页面中 Get.find |

---

## 四、Bloc

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| Event / State | 事件驱动，Bloc 接收 Event 发出 State | 为功能定义事件类与状态类 |
| Bloc 类 | Bloc<E,S>，on<Event> 中 emit(State) | 实现一个 Bloc，在 on 中处理逻辑并 emit |
| BlocProvider / BlocBuilder / BlocListener | 提供 Bloc、根据 State 构建 UI、监听 State 做副作用（如 SnackBar） | 在页面中提供 Bloc 并用 Builder/Listener 连接 UI |
| 资源释放 | Bloc 由 BlocProvider 管理或手动 close | 理解 Bloc 生命周期，不重复创建导致泄漏 |

---

## 五、架构选择指南

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| 方案对比 | Provider 简单、GetX 快捷、Bloc 适合复杂流 | 根据应用规模与团队选择方案 |
| 适用场景 | 小应用 Provider、快速原型 GetX、大型/企业 Bloc | 能简述各方案适用场景 |

---

## 六、常见错误与最佳实践

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| 避免过度设计 | 简单应用不必上 Bloc | 按复杂度选型 |
| 不混用方案 | 同一项目避免 Provider+GetX+Bloc 混用 | 统一一种状态管理 |
| 业务逻辑位置 | Repository/Service 负责数据，Bloc/Controller 负责流程 | 不在状态对象中写 http 或 db 直连 |
| 释放资源 | Bloc.close、Controller 的 onClose | 正确释放，避免泄漏 |

---

## 七、与本周 Demo / 课堂练习的对应

- **Demo**（`demos/week-13/demo/state_management_demo`）：Provider 计数器（Counter + ChangeNotifier、ChangeNotifierProvider、context.watch/read、Consumer）；对应大纲「Provider」与「应用架构」中的状态与 UI 分离。
- **课堂练习**（`week-13-exercise.md`）：当堂任务对应 Provider 使用、watch/read 区别、可选扩展 GetX/Bloc 阅读；验收与大纲一致。
