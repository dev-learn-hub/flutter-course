---
layout: default
title: "第12周讲义：Flutter 动画与交互体验"
permalink: /week-12/lecture/
---

本文为**第12周详细讲义**，侧重动画基础（Animation、AnimationController、Tween、Curve）、AnimatedBuilder、Hero 动画、页面切换与隐式动画。课程大纲与目标见 [第12周大纲](../outline/)。

---

## 一、本讲目标与前置知识

- **目标**：理解 Animation 与 AnimationController；掌握 Tween、CurvedAnimation 与常用 Curve；会用 AnimatedBuilder 避免整页 setState；掌握 Hero 的 tag 与列表→详情过渡；了解自定义 PageRoute 与隐式动画组件；能运行本课程 [第12周案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-12)（animation_demo）。
- **前置**：第10周事件与界面；第11周数据与 FutureBuilder。  

---

## 二、动画基础：Animation 与 AnimationController

- **AnimationController**：需要 `vsync`（Ticker），State 混入 `SingleTickerProviderStateMixin` 或 `TickerProviderStateMixin`；在 `initState` 中创建，在 `dispose` 中必须调用 `controller.dispose()`。
- **Animation**：通过 `Tween(begin, end).animate(controller)` 或 `CurvedAnimation(parent: controller, curve: Curves.xxx)` 得到；用 `animation.value` 驱动 UI。
- **AnimationStatus**：dismissed、forward、reverse、completed，可用于循环或单次动画。本课程 Demo 中显式动画部分演示了 Controller + Tween + CurvedAnimation。  

---

## 三、Tween 与 Curve

- **Tween**：`Tween<double>`、`ColorTween`、`Tween<Offset>` 等，`animate(controller)` 得到 `Animation<T>`。
- **CurvedAnimation**：在 Controller 与 Tween 之间插入曲线，如 `Curves.easeInOut`、`Curves.elasticOut`，使插值更自然。
- **常见曲线**：linear、easeIn、easeOut、easeInOut、bounceOut、elasticOut 等，见 [Curves](https://api.flutter.dev/flutter/animation/Curves-class.html)。  

---

## 四、AnimatedBuilder 与 AnimatedWidget

- **AnimatedBuilder**：`animation`、`builder`；只在 builder 内用 `animation.value` 构建子树，避免整页 setState，性能更好。
- **AnimatedWidget**：继承并实现 `build`，内部使用 `listenable`（即 Animation）；适合封装「根据动画值绘制的组件」。
- **注意**：避免在动画中 `controller.addListener(() => setState(() {}))` 导致整页重建；优先用 AnimatedBuilder 限定重建范围。本课程 Demo 中显式动画即用 AnimatedBuilder。  

---

## 五、Hero 动画

- **用法**：在「列表页」和「详情页」用相同 `tag` 的 `Hero(tag: 'xxx', child: ...)`，路由切换时 Flutter 自动做共享元素过渡。
- **tag 唯一性**：同一路由栈中同一 tag 只应成对出现（一页一个）；可用 id、index 等保证唯一，如 `hero_$index`。
- **典型场景**：网格/列表项点击 → 详情页；返回时从详情过渡回列表。本课程 Demo 中三张卡片与详情页使用 `hero_0`、`hero_1`、`hero_2`。  

---

## 六、页面切换与自定义 PageRoute

- **PageRoute**：`buildTransitions` 中根据 `animation` 使用 `SlideTransition`、`FadeTransition`、`ScaleTransition` 等；`transitionDuration` 控制时长。
- **自定义 Route**：继承 `PageRoute` 或 `MaterialPageRoute`，重写 `buildTransitions` 即可实现滑动、淡入、缩放等效果。大纲中有完整代码示例。  

---

## 七、隐式动画

- **AnimatedContainer**：当 width、height、color、padding 等属性变化时自动做过渡；设置 `duration`、`curve`。
- **AnimatedOpacity**：opacity 变化时淡入淡出。
- **AnimatedPositioned / AnimatedAlign**：在 Stack 或 Align 中做位置/对齐的平滑变化。
- **适用场景**：由状态驱动、无需精确控制时间线时，优先考虑隐式动画。本课程 Demo 中 AnimatedContainer 与 AnimatedOpacity 演示了展开/收起与显隐。  

---

## 八、运行本课程第12周 Demo

1. 进入 `demos/week-12/demo/animation_demo`，执行 `flutter pub get`。
2. 执行 `flutter run`（或选择设备）。
3. 操作：点击「播放/反向」观察显式动画；点击三张彩色卡片进入详情，观察 Hero 过渡，再点击返回；点击「点击展开」「点击淡出」观察隐式动画。
4. 阅读 `lib/main.dart`：initState/dispose 中 Controller 的创建与释放；AnimatedBuilder 的 animation 与 builder；Hero 的 tag 与两页对应；AnimatedContainer/AnimatedOpacity 与 setState。  

---

## 九、常见问题与最佳实践

- **忘记 dispose**：AnimationController 必须在 State.dispose 中调用 `controller.dispose()`，否则会泄漏。
- **全页 setState**：用 AnimatedBuilder 只重建动画相关子树，避免 addListener + setState 整页重建。
- **Hero 标签**：确保两页 tag 一致且唯一；列表项用 `hero_$index` 即可。
- **时长与曲线**：根据交互反馈调整 duration 和 curve，避免过长或过猛。  

---

## 十、与大纲、课堂练习的链接

- **大纲**：[第12周大纲](../outline/)。  
- **课堂练习**：[第12周课堂练习](../exercise/)。  
- **案例**：[demos/week-12](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-12)。
