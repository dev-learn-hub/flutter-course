# 第8周具体方案

> 基于 `planning/02-Weekly-Content-Template.md` 第七节生成。按步骤 1～8 执行并勾选检查项。

---

### 基本信息

- **周次**：第8周  
- **主题**：Flutter 框架基础（第一部分）  
- **核心内容（一句话）**：Widget、生命周期、Stateless/Stateful  
- **全学期中的阶段**：Flutter 基础（承接第7周 Flutter Web 入门，为第9周布局系统打基础）  

---

### 步骤 1：全学期课程大纲

- 前一周主题：第7周 Dart Web 开发与 Flutter Web 入门  
- 后一周主题：第9周 Flutter 布局系统详解  
- 备注：第8周进入 Flutter 框架核心（应用结构、Stateless/StatefulWidget、生命周期、常用基础组件），与第7周 Flutter Web 计数器中的 StatefulWidget 衔接，为第9周 Row/Column/ListView 等布局打基础。  

**检查**：☑ 已阅读 index.md  ☑ 已记录与前后周衔接  

---

### 步骤 2：本周课程大纲

- **本周学习目标**：理解 Flutter 应用架构，掌握 StatelessWidget 和 StatefulWidget，学会使用常用基础组件。  
- **讲授要点**：Flutter 应用结构（main、runApp、MaterialApp、build）；StatelessWidget vs. StatefulWidget（不可变/可变、无状态/有状态、createState）；StatefulWidget 生命周期（createState、initState、build、setState、dispose）；常用基础组件（Text、Image、Icon、Button、Container、Padding、Center、RaisedButton、FloatingActionButton）；Hot Reload 原理（快速迭代、保留状态）。  
- **实操任务**：创建第一个 Flutter 应用；StatelessWidget 应用；StatefulWidget 计数器；个人信息展示应用；调试与 Hot Reload。  
- **作业要求**：创建有状态计数器应用；个人信息卡片展示；实验报告。  

**检查**：☑ 已阅读 week-08.md  ☑ 已提取目标/要点/实操/作业  

---

### 步骤 3：前几周已有内容

- **前置依赖**：第3周 Flutter 环境（flutter 命令、IDE、run/debug）；第7周 Flutter Web 入门（StatefulWidget、setState、计数器已在 Web 中接触）。第8周侧重「应用结构 + 生命周期 + 基础组件」的系统讲解与移动端/多平台运行。  
- **可复用的表述或结构**：第3～7周大纲/讲义/课堂练习的段落结构、周聚合页四链接表格式、步骤 8 提交须包含 week-XX-page 及本周全部相关文件；第7周 demo 的 StatefulWidget 计数器可作对比或起点。  

**检查**：☑ 已阅读前几周内容  ☑ 已列前置依赖  ☑ 已注明可复用处  

---

### 步骤 4：知识点体系大纲

- 产出文件：`planning/week-08-knowledge-map.md`  
- 简要：主块五块（应用结构、Stateless/Stateful、生命周期、常用基础组件、Hot Reload）；与 demo/课堂练习对应已写。  

**检查**：☑ 已创建 knowledge-map  ☑ 未超纲  ☑ 知识点有「应能…」描述  

---

### 步骤 5：素材准备

- **素材清单**（主题 / 链接 / 用途 / 版本或日期）：
  - Flutter 框架概览：https://docs.flutter.dev/ — 应用结构、Widget 体系
  - Widget 介绍：https://docs.flutter.dev/ui/widgets-intro — Stateless/Stateful、build
  - 基础组件：https://docs.flutter.dev/ui/widgets/basics — Text、Container、Button 等
  - Hot Reload：https://docs.flutter.dev/development/tools/hot-reload — 讲义常见问题

**检查**：☑ 已搜索并保存素材  ☑ 清单含链接与用途  

---

### 步骤 6：案例编写与运行验证

- demo 路径：`demos/week-08/demo/basics_demo/`  
- 项目名：`basics_demo`（StatelessWidget 个人信息卡片 + StatefulWidget 计数器；Text、Container、Padding、Icon、ElevatedButton、Scaffold、AppBar）  
- 本地验证结果：`flutter pub get`、`flutter analyze` 通过。  

**检查**：☑ demo 已创建且可运行  ☑ 对应知识点  ☑ 已本地验证  

---

### 步骤 7：讲义与课堂练习编写

- 讲义文件：`week-08-lecture.md`，permalink `/week-08/lecture/`；含应用结构、Stateless/Stateful、生命周期、常用基础组件、运行 Demo、Hot Reload、常见问题。  
- 课堂练习文件：`week-08-exercise.md`，permalink `/week-08/exercise/`；3 个当堂练习（运行 Demo 并区分 Stateless/Stateful、修改信息或初始值并 Hot Reload、新增 StatelessWidget 展示项）。  

**检查**：☑ 讲义结构完整  ☑ 已引用知识点/案例  ☑ 讲义 permalink 正确  ☑ 已创建课堂练习且 permalink 正确  

---

### 步骤 8：组合与发布

- **将课堂练习加入周聚合页**：在 `week-08-page.md`「本章资源」表中添加「课堂练习」一行，链接 `./exercise/`；将讲义链接改为 `./lecture/`（若采用独立讲义）。当前 week-08-page 仅有三行（大纲、讲义、案例），需补第四行。  
- 周聚合页链接检查：大纲 / 讲义 / 案例 / 课堂练习  
- **推送与部署**（必做）：提交时须包含 `week-08-page.md` 及本周全部相关文件，再推送到 main，触发 GitHub Pages 部署；在 GitHub Actions 中确认部署工作流成功。  
- **线上验证**（必做）：实际访问课程 GitHub Pages 发布地址，从首页进入「第8周」聚合页，逐链点击「大纲、讲义、案例、课堂练习」，确认无 404 且内容正确。  

**检查**：☑ 已在聚合页添加课堂练习链接  ☑ 四链接正确  ☑ 提交已包含 week-08-page 及本周全部相关文件  ☑ 已推送到 main 且 Pages 部署成功  ☑ 已访问发布站点并逐链验证  

---

**本周方案状态**：☑ 已完成  

**完成日期**：2026-03-15
