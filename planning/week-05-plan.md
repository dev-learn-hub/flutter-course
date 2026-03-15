# 第5周具体方案

> 基于 `planning/02-Weekly-Content-Template.md` 第七节生成。按步骤 1～8 执行并勾选检查项。

---

### 基本信息

- **周次**：第5周  
- **主题**：Dart 语言进阶（第二部分）  
- **核心内容（一句话）**：面向对象、Mixin、异常处理、包管理  
- **全学期中的阶段**：Dart 基础  

---

### 步骤 1：全学期课程大纲

- 前一周主题：第4周 Dart 语言基础（第一部分）  
- 后一周主题：第6周 Dart 异步编程与网络请求  
- 备注：第5周为 Dart 基础第二段，承接变量/类型/函数，为第6周异步与后续 Flutter 打基础。  

**检查**：□ 已阅读 index.md  □ 已记录与前后周衔接  

---

### 步骤 2：本周课程大纲

- **本周学习目标**：掌握 Dart 的面向对象编程特性，理解类、继承、接口、Mixin 等概念，学会异常处理，了解包管理系统。  
- **讲授要点**：类与对象（定义、构造函数类型、getter/setter）；继承与多态；抽象类与接口；Mixin 混入机制；异常处理（try-catch-finally、特定异常、自定义异常）；Dart 包管理（pubspec.yaml、pub get/upgrade/outdated、常用库）。  
- **实操任务**：类与对象实践（Person 类）；继承与多态（动物类体系）；抽象类与接口（Shape/Circle/Rectangle/Triangle）；Mixin 实践（Swimmable、Flyable）；异常处理实践；项目实践「图书馆管理系统」（Book、Library，添加/删除/查询/分类，异常处理）。  
- **作业要求**：仿写教材第 3～4 章示例；完成图书馆管理系统（类设计、异常处理、完整功能）；实验报告 1500+ 字（OOP 在 Dart 中的实现、继承 vs. Mixin、异常处理最佳实践）。  

**检查**：□ 已阅读 week-05.md  □ 已提取目标/要点/实操/作业  

---

### 步骤 3：前几周已有内容

- **前置依赖**：第4周 Dart 语言基础（变量、类型、List/Map/Set、函数、闭包）；能编写简单 Dart 程序。第5周在此基础上引入类、继承、Mixin、异常与包管理。  
- **可复用的表述或结构**：第3、4周大纲/讲义/课堂练习的段落结构、周聚合页「本章资源」表格式（四链接）、课堂练习与课后作业的区分、步骤 8 提交须包含 week-XX-page 及本周全部相关文件。  

**检查**：□ 已阅读前几周内容  □ 已列前置依赖  □ 已注明可复用处  

---

### 步骤 4：知识点体系大纲

- 产出文件：`planning/week-05-knowledge-map.md`  
- 简要：主块六块（类与对象、继承与多态、抽象类与接口、Mixin、异常处理、包管理）；与 demo/课堂练习对应已写。  

**检查**：☑ 已创建 knowledge-map  ☑ 未超纲  ☑ 知识点有「应能…」描述  

---

### 步骤 5：素材准备

- **素材清单**（主题 / 链接 / 用途 / 版本或日期）：
  - Dart 类与对象：https://dart.dev/guides/language/language-tour#classes — 讲义类/构造函数/getter 依据，查阅 2026-03
  - Dart 继承与 Mixin：https://dart.dev/guides/language/language-tour#extending-a-class — 讲义继承、Mixin 依据
  - Dart 异常：https://dart.dev/guides/language/language-tour#exceptions — 讲义异常处理依据
  - Dart 包管理：https://dart.dev/guides/packages — 讲义 pubspec/pub get 依据
  - 《Flutter 实战》第 3 章 — 作业仿写与 OOP 表述参考

**检查**：☑ 已搜索并保存素材  ☑ 清单含链接与用途  

---

### 步骤 6：案例编写与运行验证

- demo 路径：`demos/week-05/demo/library_cli/`  
- 项目名：`library_cli`（纯 Dart 控制台，Book/Library、自定义异常 DuplicateIsbnException，`dart run bin/main.dart`）  
- （可选）exercise 路径与说明：未单独建 exercise 目录，当堂练习见 `week-05-exercise.md`。  
- 本地验证结果：`dart run bin/main.dart` 通过，输出添加/查询/异常/删除。  

**检查**：☑ demo 已创建且可运行  ☑ 对应知识点  ☑ 已本地验证  

---

### 步骤 7：讲义与课堂练习编写

- 讲义文件：`week-05-lecture.md`，permalink `/week-05/lecture/`；含类与对象、继承与多态、抽象类与接口、Mixin、异常处理、包管理、运行 Demo、常见问题。  
- 课堂练习文件：`week-05-exercise.md`，permalink `/week-05/exercise/`；3 个当堂练习（运行 Demo 与异常、新增图书与查询、DartPad 类/getter 或异常）。  

**检查**：☑ 讲义结构完整  ☑ 已引用知识点/案例  ☑ 讲义 permalink 正确  ☑ 已创建课堂练习且 permalink 正确  

---

### 步骤 8：组合与发布

- **将课堂练习加入周聚合页**：在 `week-05-page.md`「本章资源」表中添加「课堂练习」一行，链接 `./exercise/`；将讲义链接改为 `./lecture/`（若采用独立讲义）。当前 week-05-page 仅有三行（大纲、讲义、案例），需补第四行。  
- 周聚合页链接检查：大纲 / 讲义 / 案例 / 课堂练习  
- **推送与部署**（必做）：提交时须包含 `week-05-page.md` 及本周全部相关文件，再推送到 main，触发 GitHub Pages 部署；在 GitHub Actions 中确认部署工作流成功。  
- **线上验证**（必做）：实际访问课程 GitHub Pages 发布地址，从首页进入「第5周」聚合页，逐链点击「大纲、讲义、案例、课堂练习」，确认无 404 且内容正确。  

**检查**：☑ 已在聚合页添加课堂练习链接  ☑ 四链接正确  □ 提交已包含 week-05-page 及本周全部相关文件  □ 已推送到 main 且 Pages 部署成功  □ 已访问发布站点并逐链验证  

---

**本周方案状态**：☑ 进行中（步骤 1～8 产出已完成，待推送与线上验证）  □ 已完成  

**完成日期**：（待推送后填写）
