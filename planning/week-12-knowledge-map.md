# 第12周知识点体系大纲

> 本周主题与目标（一句话）：掌握 Flutter 动画系统（Animation、Tween、Curve、AnimatedBuilder、Hero、页面切换、隐式动画），能实现显式/隐式动画与页面过渡，并注意 controller 释放与性能。

---

## 一、动画基础概念

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| Animation | value、status | 使用 animation.value 驱动 UI，判断 status |
| AnimationController | duration、vsync、forward/reverse/dispose | 创建 Controller、在 initState 中初始化、在 dispose 中释放 |
| AnimationStatus | dismissed、forward、reverse、completed | 根据状态做循环或单次动画 |
| TickerProviderStateMixin | vsync: this | 在 State 中混入，为 Controller 提供 Ticker |

---

## 二、Tween 与 Curve

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| Tween | begin、end、animate(controller) | 使用 Tween<double>、ColorTween、Tween<Offset> 等 |
| CurvedAnimation | parent、curve | 用 Curves.easeIn/easeOut/bounceOut 等改变插值 |
| 常见 Curve | linear、easeIn、easeOut、bounceOut、elasticOut | 按需选择曲线使动效更自然 |

---

## 三、AnimatedBuilder 与 AnimatedWidget

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| AnimatedBuilder | animation、builder | 在 builder 中根据 animation.value 构建子组件，避免整页 setState |
| AnimatedWidget | listenable、build | 封装「根据 Animation 绘制的 Widget」，便于复用 |
| 性能 | 避免 addListener + setState 全量重建 | 用 AnimatedBuilder 只重建动画相关子树 |

---

## 四、Hero 动画

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| Hero | tag、child | 在列表/详情两页使用相同 tag，实现共享元素过渡 |
| tag 唯一性 | 同屏/同路由栈中 tag 不重复 | 用唯一标识（如 id、index）作为 tag |
| 典型场景 | 列表项 → 详情页 | 列表页与详情页各一个 Hero(tag: sameId, child: ...) |

---

## 五、页面切换与自定义 PageRoute

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| PageRoute | buildTransitions、transitionDuration | 理解路由与转场的关系 |
| buildTransitions | animation、child | 使用 SlideTransition、FadeTransition、ScaleTransition 等 |
| 自定义 Route | 继承 PageRoute 或 MaterialPageRoute | 实现自定义滑动/淡入/缩放等转场效果 |

---

## 六、隐式动画

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| AnimatedContainer | duration、curve、width/height/color 等变化 | 属性变化时自动做过渡动画 |
| AnimatedOpacity | opacity、duration | 淡入淡出 |
| AnimatedPositioned / AnimatedAlign | 位置/对齐变化 | 在 Stack/Align 中做位置动画 |
| 使用场景 | 简单状态驱动、无需精确控制时间线 | 在「状态切换」场景优先考虑隐式动画 |

---

## 七、常见错误与最佳实践

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| dispose | AnimationController.dispose() | 在 State.dispose 中释放，避免泄漏 |
| AnimatedBuilder vs addListener | 局部重建优于整页 setState | 显式动画用 AnimatedBuilder 包裹需更新的部分 |
| Hero 标签 | 同一 tag 在两处成对出现 | 避免重复 tag、避免 tag 动态冲突 |
| 时长与曲线 | duration、curve 合理设置 | 根据交互反馈调整，避免过长或过猛 |

---

## 八、与本周 Demo / 课堂练习的对应

- **Demo**（`demos/week-12/demo/animation_demo`）：显式动画（Controller + Tween + AnimatedBuilder）、Hero（列表 → 详情）、隐式动画（AnimatedContainer/AnimatedOpacity）；对应大纲「动画基础、Tween/Curve、AnimatedBuilder、Hero、隐式动画」。
- **课堂练习**（`week-12-exercise.md`）：当堂任务对应上述主块中的 2～3 个，验收与大纲一致。
