# 第9周知识点体系大纲

> 本周主题与目标（一句话）：掌握 Flutter 布局系统，会使用 Row/Column/Flex、Stack/Positioned、ListView、GridView、Wrap，并能做简单响应式布局。

---

## 一、布局基础

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| Constraints | 父传给子的约束（min/max 宽高） | 说明「子决定自身尺寸在父约束内」 |
| alignment | 对齐方式（如 center、start、end） | 在 Align/Container 等中使用 alignment |
| sizing | 尺寸与边界（无界、有界） | 知道 ListView 等可滚动组件在主轴上的无界约束 |

---

## 二、Row 与 Column

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| Row | 水平排列子组件 | 使用 mainAxisAlignment、crossAxisAlignment 控制对齐 |
| Column | 竖直排列子组件 | 使用 mainAxisSize、crossAxisSize 控制占位 |
| 组合 | Row 内放 Column、Column 内放 Row | 实现简单行列组合布局 |

---

## 三、Flex 与 Expanded

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| Flex / Row+Expanded | 按 flex 分配空间 | 用 Expanded(flex: n) 在 Row/Column 中分配比例 |
| Flexible | 可伸缩子组件 | 区分 Expanded 与 Flexible 的 fit |

---

## 四、Stack 与 Positioned

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| Stack | 子组件堆叠（后子在上） | 用 Stack 叠放多个子组件 |
| Positioned | 在 Stack 内精确定位 | 用 Positioned 的 top/left/right/bottom 或 width/height 定位 |
| Stack alignment | alignment、fit | 设置 Stack 的 alignment 与 fit |

---

## 五、ListView

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| ListView | 可滚动列表 | 使用 ListView(children: [...]) 或 ListView.builder |
| ListView.builder | 按需构建列表项 | 在项多时用 builder 避免一次性构建全部 |
| 列表项 | ListTile、Card 等 | 用 ListTile 或自定义 Widget 作为列表项 |

---

## 六、GridView

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| GridView | 网格布局 | 使用 GridView.count 或 GridView.extent |
| count / extent | 固定列数或固定交叉轴尺寸 | 根据需求选择 count 或 extent |
| 网格项 | 子组件为网格单元 | 用 Container、Card 等作为网格项 |

---

## 七、Wrap

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| Wrap | 流式布局，自动换行 | 用 Wrap 替代 Row 避免溢出，设置 spacing、runSpacing |

---

## 八、响应式设计

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| MediaQuery | 获取屏幕尺寸、方向等 | 用 MediaQuery.of(context).size 判断宽高 |
| 条件布局 | 根据宽度/方向切换不同布局 | 写简单 ResponsiveWidget 根据 size.width 返回不同布局 |

---

## 九、与本周 Demo / 课堂练习的对应

- **Demo**（`demos/week-09/demo/layout_demo`）：展示 Row/Column 组合、ListView、GridView、Stack+Positioned、简单响应式（MediaQuery），对应大纲「主要布局组件」与「响应式设计」。
- **课堂练习**（`week-09-exercise.md`）：当堂任务对应上述主块中的 2～3 个，验收与大纲一致。
