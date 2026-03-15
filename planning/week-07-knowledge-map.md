# 第7周知识点体系大纲

> 本周主题与目标（一句话）：掌握 Dart Web 与 Flutter Web 入门，能创建简单 Web 应用（DOM 或 Flutter Web 计数器），理解调试与部署。

---

## 一、Web 开发基础回顾

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| HTML/CSS/JS 角色 | 结构、样式、交互 | 说明三者分工 |
| Dart Web 优势 | 强类型、编译到 JS、代码组织 | 简述 Dart Web 适用场景 |

---

## 二、Dart Web 编程

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| dart:html 与 DOM | querySelector、元素 text/style | 用 Dart 查询并修改 DOM |
| 事件处理 | onClick.listen、onChange.listen | 绑定按钮与输入事件 |
| 创建元素 | DivElement()、append | 动态创建并插入元素 |
| 项目结构 | web/index.html、main.dart | 说明 Dart Web 项目目录 |

---

## 三、Flutter Web 概述与结构

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| Flutter Web vs Dart Web | 框架一致 vs 灵活 DOM | 区分两者定位 |
| 应用结构 | lib/main.dart、web/index.html | 说明 Flutter Web 项目目录 |
| 运行与构建 | flutter run -d chrome、flutter build web | 在浏览器运行与产出 release |

---

## 四、Web 调试与部署

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| 开发服务器 | flutter run -d chrome | 本地调试 Web 应用 |
| 构建发布 | flutter build web --release | 生成可部署的静态资源 |
| 部署选项 | 静态托管、服务器托管 | 列举常见部署方式 |

---

## 五、与本周 Demo / 课堂练习的对应

- **Demo**（`demos/week-07/demo/flutter_web_counter`）：Flutter Web 计数器（StatefulWidget、加/减/重置），对应大纲「Flutter Web 计数器应用」。
- **课堂练习**（`week-07-exercise.md`）：当堂任务对应上述主块中的 2～3 个，验收与大纲一致。
