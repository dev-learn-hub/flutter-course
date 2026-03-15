# 第9周具体方案

> 基于 `planning/02-Weekly-Content-Template.md` 第七节生成。按步骤 1～8 执行并勾选检查项。

---

### 基本信息

- **周次**：第9周  
- **主题**：Flutter 布局系统详解  
- **核心内容（一句话）**：Row、Column、Stack、ListView、GridView  
- **全学期中的阶段**：Flutter 基础（承接第8周 Widget 与基础组件，为第10周常用组件与导航打基础）  

---

### 步骤 1：全学期课程大纲

- 前一周主题：第8周 Flutter 框架基础（第一部分）  
- 后一周主题：第10周 Flutter 常用组件与功能（第一部分）  
- 备注：第9周聚焦布局系统（约束、对齐、Row/Column/Flex、Stack/Positioned、ListView、GridView、Wrap、响应式），与第8周基础组件衔接，为第10周 AppBar、导航、表单等提供布局基础。  

**检查**：☑ 已阅读 index.md  ☑ 已记录与前后周衔接  

---

### 步骤 2：本周课程大纲

- **本周学习目标**：掌握 Flutter 的布局系统，学会使用行列、栅栏、绝对定位等布局组件，能创建复杂的响应式界面。  
- **讲授要点**：布局基础（Constraints 约束、alignment 对齐、sizing 尺寸）；主要布局组件（Row 水平布局、mainAxisAlignment/crossAxisAlignment、mainAxisSize/crossAxisSize；Column 竖直布局；Flex 灵活布局与 flex 参数；Stack 堆叠与绝对定位、Positioned；ListView 可滚动列表；GridView 网格布局；Wrap 流式布局）；响应式设计（MediaQuery.of(context).size、根据宽度切换宽/窄布局）。  
- **实操任务**：Row 和 Column 组合；ListView 列表应用；GridView 网格应用；Stack 和 Positioned 应用；响应式布局应用。  
- **作业要求**：复杂布局应用（多种布局组合）；图片网格应用；响应式应用。  

**检查**：☑ 已阅读 week-09.md  ☑ 已提取目标/要点/实操/作业  

---

### 步骤 3：前几周已有内容

- **前置依赖**：第8周 Flutter 框架基础（StatelessWidget/StatefulWidget、build、基础组件 Text/Container/Padding/Center 等）；第7周 Flutter Web 入门（可选：响应式概念）。第9周在既有 Widget 与组件之上系统讲解布局约束与 Row/Column/Stack/ListView/GridView。  
- **可复用的表述或结构**：第3～8周大纲/讲义/课堂练习的段落结构、周聚合页四链接表格式、步骤 8 提交须包含 week-XX-page 及本周全部相关文件；第8周 basics_demo 的 Column/Row 可作简单铺垫。  

**检查**：☑ 已阅读前几周内容  ☑ 已列前置依赖  ☑ 已注明可复用处  

---

### 步骤 4：知识点体系大纲

- 产出文件：`planning/week-09-knowledge-map.md`  
- 简要：主块八块（布局基础、Row/Column、Flex/Expanded、Stack/Positioned、ListView、GridView、Wrap、响应式）；与 demo/课堂练习对应已写。  

**检查**：☑ 已创建 knowledge-map  ☑ 未超纲  ☑ 知识点有「应能…」描述  

---

### 步骤 5：素材准备

- **素材清单**（主题 / 链接 / 用途 / 版本或日期）：
  - Flutter 布局：https://docs.flutter.dev/ui/layout — 约束、Row/Column、Box 模型
  - ListView：https://api.flutter.dev/flutter/widgets/ListView-class.html — 列表与 builder
  - GridView：https://api.flutter.dev/flutter/widgets/GridView-class.html — 网格
  - Stack：https://api.flutter.dev/flutter/widgets/Stack-class.html — 堆叠与 Positioned
  - 响应式：MediaQuery、LayoutBuilder — 讲义响应式小节

**检查**：☑ 已搜索并保存素材  ☑ 清单含链接与用途  

---

### 步骤 6：案例编写与运行验证

- demo 路径：`demos/week-09/demo/layout_demo/`  
- 项目名：`layout_demo`（Row/Column、Expanded、ListView 水平列表、GridView.count、Stack+Positioned、MediaQuery 宽度提示）  
- 本地验证结果：`flutter pub get`、`flutter analyze` 通过。  

**检查**：☑ demo 已创建且可运行  ☑ 对应知识点  ☑ 已本地验证  

---

### 步骤 7：讲义与课堂练习编写

- 讲义文件：`week-09-lecture.md`，permalink `/week-09/lecture/`；含布局基础、Row/Column、Flex/Expanded、Stack/Positioned、ListView、GridView、Wrap、响应式、运行 Demo、常见问题。  
- 课堂练习文件：`week-09-exercise.md`，permalink `/week-09/exercise/`；3 个当堂练习（运行 Demo 并指认布局组件、修改 Row/GridView 参数、新增 Stack 角标或 Wrap 区域）。  

**检查**：☑ 讲义结构完整  ☑ 已引用知识点/案例  ☑ 讲义 permalink 正确  ☑ 已创建课堂练习且 permalink 正确  

---

### 步骤 8：组合与发布

- **将课堂练习加入周聚合页**：在 `week-09-page.md`「本章资源」表中添加「课堂练习」一行，链接 `./exercise/`；将讲义链接改为 `./lecture/`（若采用独立讲义）。当前 week-09-page 仅有三行（大纲、讲义、案例），需补第四行。  
- 周聚合页链接检查：大纲 / 讲义 / 案例 / 课堂练习  
- **推送与部署**（必做）：提交时须包含 `week-09-page.md` 及本周全部相关文件，再推送到 main，触发 GitHub Pages 部署；在 GitHub Actions 中确认部署工作流成功。  
- **线上验证**（必做）：实际访问课程 GitHub Pages 发布地址，从首页进入「第9周」聚合页，逐链点击「大纲、讲义、案例、课堂练习」，确认无 404 且内容正确。  

**检查**：□ 已在聚合页添加课堂练习链接  □ 四链接正确  □ 提交已包含 week-09-page 及本周全部相关文件  □ 已推送到 main 且 Pages 部署成功  □ 已访问发布站点并逐链验证  

---

**本周方案状态**：□ 进行中  □ 已完成  

**完成日期**：（填写）
