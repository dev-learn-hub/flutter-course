# 第14周具体方案

> 基于 `planning/02-Weekly-Content-Template.md` 第七节生成。按步骤 1～8 执行并勾选检查项。

---

### 基本信息

- **周次**：第14周  
- **主题**：Flutter 项目实践（第一部分）  
- **核心内容（一句话）**：Git、GitHub、代码规范、CI/CD、项目管理  
- **全学期中的阶段**：项目实践（承接第13周架构与状态管理，为第15周小组协作与产品设计、第16周项目展示与发布打基础；本周侧重工程化与协作流程）  

---

### 步骤 1：全学期课程大纲

- 前一周主题：第13周 Flutter 应用架构与状态管理  
- 后一周主题：第15周 Flutter 项目实践（第二部分）  
- 备注：第14周聚焦项目管理与工程化（Flutter 项目结构规范、Dart 代码规范与 analysis_options、Git 基础与工作流、GitHub 协作与 PR/Issue 模板、CI/CD 与 GitHub Actions、Conventional Commits、项目文档 README/CONTRIBUTING），与第13周架构衔接，为第15～16周小组项目提供版本控制、规范与 CI/CD 基础。  

**检查**：☑ 已阅读 index.md  ☑ 已记录与前后周衔接  

---

### 步骤 2：本周课程大纲

- **本周学习目标**：掌握项目管理工具和流程，学会使用 Git 和 GitHub 进行版本控制，遵循代码规范，建立持续集成/持续部署（CI/CD）流程，为团队协作做准备。  
- **讲授要点**：项目结构规范（lib 下 config/models/services/repositories/providers 或 blocs/screens/widgets/utils/theme、test、assets、pubspec、analysis_options、.gitignore）；代码规范（Dart Style Guide：类名大驼峰、方法/变量小驼峰、常量 k 前缀、文件名蛇形、文档注释、单职责函数）；Git 基础与工作流（init、add、commit、branch、merge、远程 push/pull；特性分支、main/develop；Conventional Commits）；GitHub 协作（创建仓库、分支保护、Pull Request、Issue 与 PR 模板、代码审查）；CI/CD（GitHub Actions 示例：checkout、Flutter 环境、pub get、format、analyze、test、build；本地检查命令）；常见工具与最佳实践（Git/GitHub、analysis_options、README/CONTRIBUTING、.gitignore）。  
- **实操任务**：项目初始化（flutter create、创建标准目录结构、git init 与首次提交）；配置代码规范（analysis_options.yaml、格式化规则、可选 pre-commit）；GitHub 仓库设置（创建仓库、分支保护、PR/Issue 模板、README/CONTRIBUTING）；实现 CI/CD 流程（.github/workflows/flutter.yml、自动化测试与构建、验证运行）；团队协作演练（特性分支、规范提交信息、PR、代码审查、合并与冲突解决）；综合案例：建立项目框架（规范结构、Main 页、路由、主题与国际化基础、通用网络客户端、单元/集成测试、CI/CD、项目文档）。  
- **作业要求**：必做：建立完整项目框架（规范目录、代码分析规则、基础模型与服务类）；GitHub 仓库配置（分支保护、README/CONTRIBUTING、Issue/PR 模板）；实现 CI/CD 流程（GitHub Actions、代码检查/测试/构建、验证）；撰写项目文档（README、CONTRIBUTING、API 说明、部署指南）。选做：配置自动部署；集成代码覆盖率；自动变更日志生成。  

**检查**：☑ 已阅读 week-14.md  ☑ 已提取目标/要点/实操/作业  

---

### 步骤 3：前几周已有内容

- **前置依赖**：第13周应用架构与状态管理（分层、Provider/GetX/Bloc）；第11～12周数据与 UI、动画。第14周将前述技术置于「项目与协作」语境：规范目录对应架构分层、代码规范与 CI 保证质量、Git/GitHub 与 PR 支持团队协作。  
- **可复用的表述或结构**：第3～13周大纲/讲义/课堂练习的段落结构、周聚合页四链接表格式、步骤 8 提交须包含 week-XX-page 及本周全部相关文件；本课程仓库自身的 .github/workflows、README、analysis_options 可作示例引用。  

**检查**：☑ 已阅读前几周内容  ☑ 已列前置依赖  ☑ 已注明可复用处  

---

### 步骤 4：知识点体系大纲

- 产出文件：`planning/week-14-knowledge-map.md`  
- 简要：主块六块（项目结构规范、代码规范、Git 基础与工作流、GitHub 协作、CI/CD、常见工具与最佳实践）；与 demo/课堂练习对应已写。  

**检查**：☑ 已创建 knowledge-map  ☑ 未超纲  ☑ 知识点有「应能…」描述  

---

### 步骤 5：素材准备

- **素材清单**（主题 / 链接 / 用途 / 版本或日期）：
  - Dart Style Guide：https://dart.dev/guides/language/effective-dart/style — 代码规范
  - Flutter 项目结构：https://docs.flutter.dev/development/best-practices/structure — 项目结构
  - GitHub Actions：https://docs.github.com/en/actions — CI/CD

**检查**：☑ 已搜索并保存素材  ☑ 清单含链接与用途  

---

### 步骤 6：案例编写与运行验证

- demo 路径：`demos/week-14/demo/project_template/`  
- 项目名：`project_template`（规范 lib 目录 config/models/screens/widgets/utils、可运行 main、README 说明结构）  
- 本地验证结果：`flutter analyze` 通过。  

**检查**：☑ demo 已创建且可运行  ☑ 对应知识点  ☑ 已本地验证  

---

### 步骤 7：讲义与课堂练习编写

- 讲义文件：`week-14-lecture.md`（独立，permalink `/week-14/lecture/`），含项目结构、代码规范、Git/GitHub、CI/CD 基础、运行 Demo、常见问题。  
- 课堂练习文件：`week-14-exercise.md`（permalink `/week-14/exercise/`），三则当堂练习：运行 Demo 并查看结构；新增 constants 文件（规范命名）；本地 Git 提交或简述 PR 流程。  

**检查**：☑ 讲义结构完整  ☑ 已引用知识点/案例  ☑ 讲义 permalink 正确  ☑ 已创建课堂练习且 permalink 正确  

---

### 步骤 8：组合与发布

- **将课堂练习加入周聚合页**：在 `week-14-page.md`「本章资源」表中添加「课堂练习」一行，链接 `./exercise/`；将讲义链接改为 `./lecture/`（若采用独立讲义）。当前 week-14-page 仅有三行（大纲、讲义、案例），需补第四行。  
- 周聚合页链接检查：大纲 / 讲义 / 案例 / 课堂练习  
- **推送与部署**（必做）：提交时须包含 `week-14-page.md` 及本周全部相关文件，再推送到 main，触发 GitHub Pages 部署；在 GitHub Actions 中确认部署工作流成功。  
- **线上验证**（必做）：实际访问课程 GitHub Pages 发布地址，从首页进入「第14周」聚合页，逐链点击「大纲、讲义、案例、课堂练习」，确认无 404 且内容正确。  

**检查**：☑ 已在聚合页添加课堂练习链接  ☑ 四链接正确  ☑ 提交已包含 week-14-page 及本周全部相关文件  ☑ 已推送到 main 且 Pages 部署成功  ☑ 已访问发布站点并逐链验证  

---

**本周方案状态**：☑ 已完成  

**完成日期**：2026-03-16
