---
layout: default
title: "第9周讲义：Flutter 布局系统详解"
permalink: /week-09/lecture/
---

本文为**第9周详细讲义**，侧重布局约束、Row/Column、Flex/Expanded、Stack/Positioned、ListView、GridView、Wrap 与响应式设计。课程大纲与目标见 [第9周大纲](../outline/)。

---

## 一、本讲目标与前置知识

- **目标**：理解 Flutter 布局约束与对齐；掌握 Row、Column 及 mainAxisAlignment/crossAxisAlignment；会使用 Expanded/Flex 分配空间；掌握 Stack 与 Positioned；会使用 ListView、GridView、Wrap；能根据 MediaQuery 做简单响应式布局；能运行本课程 [第9周案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-09)（layout_demo）。
- **前置**：第8周 Flutter 框架基础（StatelessWidget/StatefulWidget、build、Container、Padding、Scaffold 等）。  

---

## 二、布局基础

- **约束（Constraints）**：父组件向子组件传递 min/max 宽高约束；子组件在约束内决定自身尺寸，再由父进行定位。
- **对齐（alignment）**：在 Align、Center、Row/Column 的 mainAxisAlignment 与 crossAxisAlignment 中设置；常见值：start、center、end、spaceAround、spaceBetween 等。
- **尺寸（sizing）**：无界约束（如 ListView 在主轴方向）表示「尽可能大」；有界约束由父组件或 SizedBox 等给出。  

---

## 三、Row 与 Column

- **Row**：水平排列子组件；主轴为水平，副轴为竖直。`mainAxisAlignment`、`crossAxisAlignment`、`mainAxisSize`（min 取最小、max 取最大）、`crossAxisSize`。
- **Column**：竖直排列子组件；主轴为竖直，副轴为水平。属性同 Row。
- **组合**：Row 内放 Column、Column 内放 Row，可实现复杂行列布局。本课程 Demo 中有 Row+Column 与 Expanded 示例。  

---

## 四、Flex 与 Expanded

- **Expanded**：在 Row/Column 的子组件外包一层 Expanded，子在主轴方向占据剩余空间；`flex` 默认为 1，多个 Expanded 按 flex 比例分配。
- **Flexible**：与 Expanded 类似但可设置 `fit: FlexFit.loose`，子不必填满剩余空间。
- **Flex**：Row/Column 的底层实现，一般直接用 Row/Column 即可。  

---

## 五、Stack 与 Positioned

- **Stack**：子组件按顺序堆叠，后子在上层。可设置 `alignment`（默认左上）、`fit`（StackFit 等）。
- **Positioned**：仅用于 Stack 的子组件；通过 `left`、`right`、`top`、`bottom` 或 `width`、`height` 精确定位；不指定则按 alignment 或居中。
- 本课程 Demo 中有 Stack 内多枚 Positioned 与中心文字的示例。  

---

## 六、ListView

- **ListView(children: [...])**：适合列表项数量有限时；需放在有高度约束的父组件内（如 SizedBox、Expanded），否则会报「unbounded height」。
- **ListView.builder**：按需构建列表项，适合长列表；`itemCount`、`itemBuilder(context, index)`。
- **scrollDirection**：默认 Axis.vertical；可设为 Axis.horizontal 做横向列表。本课程 Demo 中有横向 ListView 示例。  

---

## 七、GridView

- **GridView.count**：固定列数，`crossAxisCount`；子组件数量多时建议用 `GridView.builder`。
- **GridView.extent**：交叉轴方向每个子组件最大尺寸由 `maxCrossAxisExtent` 决定。
- **mainAxisSpacing / crossAxisSpacing**：网格间距。本课程 Demo 中有 GridView.count 示例。  

---

## 八、Wrap

- **Wrap**：子组件按主轴排列，空间不足时自动换行；可替代 Row 避免溢出。`spacing`、`runSpacing` 控制间距。  

---

## 九、响应式设计

- **MediaQuery.of(context).size**：获取屏幕宽高（width、height）；可根据 width 判断「宽屏 / 窄屏」并返回不同布局。
- **LayoutBuilder**：根据父组件传入的 constraints 构建不同子组件，也可用于响应式。
- 本课程 Demo 底部展示当前宽度，便于理解「根据宽度切换布局」的思路。  

---

## 十、运行本课程第9周 Demo

1. 进入 `demos/week-09/demo/layout_demo`，执行 `flutter pub get`。
2. 执行 `flutter run`（或 `flutter run -d chrome` 等）。
3. 页面自上而下：Row/Column 组合与 Expanded；横向 ListView；GridView.count 网格；Stack+Positioned 四角与中心；当前宽度提示（MediaQuery）。
4. 阅读 `lib/main.dart`：各布局组件的用法与参数。  

---

## 十一、常见问题

- **ListView/GridView 报 unbounded height**：将 ListView/GridView 放入 SizedBox(height: …) 或 Expanded 中，赋予明确高度或「占满剩余空间」。
- **Row 内子组件溢出**：使用 Expanded/Flexible 包裹子组件，或改用 Wrap。
- **Stack 子组件定位不准**：确认是否使用了 Positioned 及 left/right/top/bottom 或 width/height。  

---

## 十二、与大纲、课堂练习的链接

- **大纲**：[第9周大纲](../outline/)。  
- **课堂练习**：[第9周课堂练习](../exercise/)。  
- **案例**：[demos/week-09](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-09)。
