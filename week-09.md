---
layout: default
title: "第9周大纲：Flutter 布局系统详解"
permalink: /week-09/outline/
---

# 第9周：Flutter 布局系统详解

## 周学习目标
掌握 Flutter 的布局系统，学会使用行列、栅栏、绝对定位等布局组件，能创建复杂的响应式界面。

---

## 📚 核心内容

### 讲授（2小时）

#### 一、布局基础
- **Constraints**（约束）系统
- **alignment**（对齐）
- **sizing**（尺寸）

#### 二、主要布局组件
- **Row**：水平布局
  - `mainAxisAlignment`：主轴对齐
  - `crossAxisAlignment`：副轴对齐
  - `mainAxisSize`、`crossAxisSize`
- **Column**：竖直布局
- **Flex**：灵活布局，使用 flex 参数分配空间
- **Stack**：堆叠、绝对定位
  - `Positioned` 精确控制位置
- **ListView**：可滚动列表
- **GridView**：网格布局
- **Wrap**：流式布局

#### 三、响应式设计
```dart
class ResponsiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width > 600) {
      return WideLayout();  // 横屏布局
    } else {
      return NarrowLayout();  // 竖屏布局
    }
  }
}
```

---

### 实操（2小时）
1. Row 和 Column 组合
2. ListView 列表应用
3. GridView 网格应用
4. Stack 和 Positioned 应用
5. 响应式布局应用

---

## 📝 课后作业
1. 复杂布局应用（多种布局组合）
2. 图片网格应用
3. 响应式应用

---

**预计完成时间**：4小时课内 + 6小时课外  
**难度等级**：⭐⭐⭐⭐  
**重要程度**：⭐⭐⭐⭐⭐
