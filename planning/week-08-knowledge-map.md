# 第8周知识点体系大纲

> 本周主题与目标（一句话）：理解 Flutter 应用架构，掌握 StatelessWidget 与 StatefulWidget，会使用常用基础组件（Text、Container、Button 等）并理解生命周期与 Hot Reload。

---

## 一、Flutter 应用结构

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| main 与 runApp | 入口、挂载根 Widget | 写出 main 并 runApp(MyApp()) |
| MaterialApp | title、theme、home | 配置应用标题、主题与首页 |
| StatelessWidget.build | 无状态组件的 build 方法 | 实现一个简单 StatelessWidget 的 build |

---

## 二、StatelessWidget 与 StatefulWidget

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| StatelessWidget | 不可变、无内部状态 | 区分何时用 StatelessWidget |
| StatefulWidget | 可变、有状态，createState | 写出 StatefulWidget + State 子类 |
| setState | 更新状态并触发重建 | 在 State 内用 setState 更新数据并看到 UI 变化 |

---

## 三、StatefulWidget 生命周期

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| createState / initState | 创建 State、初始化 | 说明 initState 的调用时机 |
| build | 根据状态构建 UI | 说明 setState 后 build 会再次执行 |
| dispose | 释放资源 | 知道在 dispose 中做清理（如取消订阅） |

---

## 四、常用基础组件

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| Text / Icon / Image | 文本、图标、图片 | 使用 Text、Icon 展示内容 |
| Container / Padding / Center | 布局与间距 | 用 Container、Padding、Center 排布子组件 |
| ElevatedButton / FAB | 按钮 | 使用按钮并绑定 onPressed |
| Scaffold / AppBar | 脚手架与标题栏 | 用 Scaffold、AppBar 搭页面框架 |

---

## 五、Hot Reload

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| Hot Reload | 热重载保留状态 | 修改代码后 r 热重载并观察界面变化 |
| 适用场景 | UI 与样式迭代 | 知道何时用 Hot Reload、何时需重启 |

---

## 六、与本周 Demo / 课堂练习的对应

- **Demo**（`demos/week-08/demo/basics_demo`）：Flutter 应用结构、StatelessWidget 个人信息卡片 + StatefulWidget 计数器，对应大纲「应用结构、Stateless/Stateful、基础组件」。
- **课堂练习**（`week-08-exercise.md`）：当堂任务对应上述主块中的 2～3 个，验收与大纲一致。
