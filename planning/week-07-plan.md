# 第7周具体方案

> 基于 `planning/02-Weekly-Content-Template.md` 第七节生成。按步骤 1～8 执行并勾选检查项。

---

### 基本信息

- **周次**：第7周  
- **主题**：Dart Web 开发与 Flutter Web 入门  
- **核心内容（一句话）**：DOM 操作、Flutter Web、响应式设计  
- **全学期中的阶段**：Flutter 基础（入门周，承接 Dart 异步/网络，为第8周 Widget 与移动端打基础）  

---

### 步骤 1：全学期课程大纲

- 前一周主题：第6周 Dart 异步编程与网络请求  
- 后一周主题：第8周 Flutter 框架基础（第一部分）  
- 备注：第7周为 Web 侧入门，同时涉及 Dart Web（dart:html、DOM）与 Flutter Web（flutter run -d chrome、build web），为后续移动端 Flutter 统一技术栈做铺垫。  

**检查**：□ 已阅读 index.md  □ 已记录与前后周衔接  

---

### 步骤 2：本周课程大纲

- **本周学习目标**：掌握 Dart Web 编程基础，理解 Flutter Web 架构，能创建简单的 Web 应用，为后续移动开发奠基。  
- **讲授要点**：Web 开发基础回顾（HTML/CSS/JS 角色、Dart Web 优势）；Dart Web 编程（dart:html、DOM 操作、事件处理、创建元素）；Dart Web 项目结构；Flutter Web 概述（与 Dart Web 对比、平台与性能）；Flutter Web 应用结构；Web 调试与部署（flutter run -d chrome、build web、静态/服务器托管）。  
- **实操任务**：Dart Web 项目创建（dart create -t web）、简单计数器；创建 Flutter Web 应用（flutter create -p web）、Flutter Web 计数器（StatefulWidget、加减重置、响应式）；天气查询 Web 应用（Dart Web 或 Flutter Web、调用 API、展示结果）；性能测试（Chrome DevTools、编译大小）。  
- **作业要求**：创建 Dart Web 计数器；创建 Flutter Web 待办事项应用；天气查询 Web 应用（任选其一）；对比报告：Dart Web vs. Flutter Web vs. 传统 Web 框架。  

**检查**：□ 已阅读 week-07.md  □ 已提取目标/要点/实操/作业  

---

### 步骤 3：前几周已有内容

- **前置依赖**：第3周 Flutter 环境（flutter 命令、IDE）；第6周异步与网络（Future、http、JSON），便于在 Web 中调用 API。第7周 Dart Web 需 Dart SDK 与浏览器；Flutter Web 沿用既有 Flutter 环境。  
- **可复用的表述或结构**：第3～6周大纲/讲义/课堂练习的段落结构、周聚合页四链接表格式、步骤 8 提交须包含 week-XX-page 及本周全部相关文件。  

**检查**：□ 已阅读前几周内容  □ 已列前置依赖  □ 已注明可复用处  

---

### 步骤 4：知识点体系大纲

- 产出文件：`planning/week-07-knowledge-map.md`  
- 简要：主块四块（Web 基础回顾、Dart Web、Flutter Web 概述与结构、调试与部署）；与 demo/课堂练习对应已写。  

**检查**：☑ 已创建 knowledge-map  ☑ 未超纲  ☑ 知识点有「应能…」描述  

---

### 步骤 5：素材准备

- **素材清单**（主题 / 链接 / 用途 / 版本或日期）：
  - Dart Web：https://dart.dev/web — 讲义 Dart Web / DOM 依据，查阅 2026-03
  - Flutter Web：https://docs.flutter.dev/get-started/web — 讲义 Flutter Web 结构与运行依据
  - Flutter 示例：https://github.com/flutter/samples — 参考 Flutter Web 示例

**检查**：☑ 已搜索并保存素材  ☑ 清单含链接与用途  

---

### 步骤 6：案例编写与运行验证

- demo 路径：`demos/week-07/demo/flutter_web_counter/`  
- 项目名：`flutter_web_counter`（Flutter Web，StatefulWidget 计数器，加/减/重置；`flutter run -d chrome` 或 `flutter build web --release`）  
- 本地验证结果：`flutter build web --release` 通过，产出在 `build/web/`。  

**检查**：☑ demo 已创建且可运行  ☑ 对应知识点  ☑ 已本地验证  

---

### 步骤 7：讲义与课堂练习编写

- 讲义文件：`week-07-lecture.md`，permalink `/week-07/lecture/`；含 Web 基础、Dart Web 简述、Flutter Web 概述与结构、运行 Demo、常见问题。  
- 课堂练习文件：`week-07-exercise.md`，permalink `/week-07/exercise/`；3 个当堂练习（运行 Flutter Web Demo、修改文案或初始值、新建 Web 项目并运行）。  

**检查**：☑ 讲义结构完整  ☑ 已引用知识点/案例  ☑ 讲义 permalink 正确  ☑ 已创建课堂练习且 permalink 正确  

---

### 步骤 8：组合与发布

- **将课堂练习加入周聚合页**：在 `week-07-page.md`「本章资源」表中添加「课堂练习」一行，链接 `./exercise/`；将讲义链接改为 `./lecture/`（若采用独立讲义）。当前 week-07-page 仅有三行（大纲、讲义、案例），需补第四行。  
- 周聚合页链接检查：大纲 / 讲义 / 案例 / 课堂练习  
- **推送与部署**（必做）：提交时须包含 `week-07-page.md` 及本周全部相关文件，再推送到 main，触发 GitHub Pages 部署；在 GitHub Actions 中确认部署工作流成功。  
- **线上验证**（必做）：实际访问课程 GitHub Pages 发布地址，从首页进入「第7周」聚合页，逐链点击「大纲、讲义、案例、课堂练习」，确认无 404 且内容正确。  

**检查**：□ 已在聚合页添加课堂练习链接  □ 四链接正确  □ 提交已包含 week-07-page 及本周全部相关文件  □ 已推送到 main 且 Pages 部署成功  □ 已访问发布站点并逐链验证  

---

**本周方案状态**：□ 进行中  □ 已完成  

**完成日期**：（填写）
