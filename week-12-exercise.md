---
layout: default
title: "第12周课堂练习：Flutter 动画与交互体验"
permalink: /week-12/exercise/
---

# 第12周课堂练习

本节为**当堂可完成的练习**，基于本周 [大纲](../outline/)、[讲义](../lecture/) 与 [演示案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-12) 内容。

---

## 练习 1：运行本课程第12周 Demo

**依据**：讲义「八、运行本课程第12周 Demo」；案例 `demos/week-12/demo/animation_demo`。

**步骤**：

1. 进入 `demos/week-12/demo/animation_demo`，执行 `flutter pub get`。
2. 执行 `flutter run`（或选择设备如 `flutter run -d chrome`）。
3. 在界面中：点击「播放」「反向」观察显式动画的宽高与透明度变化；点击三张彩色卡片进入详情页，观察 Hero 过渡，再点击详情页返回；点击「点击展开」「点击淡出」观察 AnimatedContainer 与 AnimatedOpacity。
4. 在 `lib/main.dart` 中找到：AnimationController 的创建与 dispose、AnimatedBuilder 的 animation 与 builder、Hero 的 tag（hero_0/1/2）、AnimatedContainer/AnimatedOpacity 与 setState 的对应关系。

**验收**：能运行 Demo，并能说明为何要在 dispose 中释放 Controller，以及 Hero 的 tag 在两页如何对应。

---

## 练习 2：修改显式动画的时长或曲线

**依据**：大纲「Tween 与 Curve」；讲义「二、三」。

**步骤**：

1. 在 `animation_demo` 的 `MainPage` 中，将 `AnimationController` 的 `duration` 改为 `Duration(milliseconds: 500)` 或 `Duration(seconds: 2)`，保存后 Hot Reload，观察动画快慢变化。
2. 将 `CurvedAnimation` 的 `curve` 从 `Curves.easeInOut` 改为 `Curves.elasticOut` 或 `Curves.bounceOut`，观察插值效果。
3. 确认 `dispose` 中仍调用 `_controller.dispose()`。

**验收**：能修改 duration 与 curve，理解其对动画观感的影响。

---

## 练习 3：增加一个 Hero 卡片或一种隐式动画

**依据**：大纲「Hero 动画」「隐式动画」；讲义「五、七」。

**步骤**：

1. 在主页的 Hero 区域增加第四张卡片（index: 3），在 `DetailPage` 中对应支持 `index: 3` 的显示（颜色自选）；确保两页 Hero 的 tag 为 `hero_3`。
2. 或增加一个 `AnimatedAlign` 或 `AnimatedPositioned`：用布尔状态控制 alignment 或 left/top，在 setState 中切换，观察位置过渡。
3. 保存后运行，确认 Hero 过渡与隐式动画均正常。

**验收**：能新增 Hero 或隐式动画组件，理解 tag 唯一性与隐式动画的状态驱动。

---

## 说明与链接

- **课堂练习**与**课后作业**不同：课堂练习为当堂完成、可当堂验收；课后作业见 [本周大纲](../outline/) 中的「📝 课后作业」。
- 遇到问题可查阅 [第12周讲义](../lecture/) 与 [Animation 类](https://api.flutter.dev/flutter/animation/Animation-class.html)、[Hero](https://api.flutter.dev/flutter/widgets/Hero-class.html)。
- 返回 [第12周聚合页](../) 可继续查看大纲、讲义与案例。
