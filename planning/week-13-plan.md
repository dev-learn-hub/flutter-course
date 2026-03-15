# 第13周具体方案

> 基于 `planning/02-Weekly-Content-Template.md` 第七节生成。按步骤 1～8 执行并勾选检查项。

---

### 基本信息

- **周次**：第13周  
- **主题**：Flutter 应用架构与状态管理  
- **核心内容（一句话）**：Provider、GetX、Bloc、架构设计  
- **全学期中的阶段**：进阶（承接第12周动画与交互，为第14周项目实践打基础；状态管理与架构是项目实践的核心能力）  

---

### 步骤 1：全学期课程大纲

- 前一周主题：第12周 Flutter 动画与交互体验  
- 后一周主题：第14周 Flutter 项目实践（第一部分）  
- 备注：第13周聚焦应用架构与状态管理（MVC/MVP/MVVM、分层架构、Provider 的 ChangeNotifier/Consumer/context.watch/read、GetX 的 Obx/GetBuilder/Controller、Bloc 的 Event/State/BlocBuilder/BlocListener、架构选择指南、常见错误与最佳实践），与第11周数据与异步、第12周交互衔接，为第14～16周项目实践提供架构与状态管理基础。  

**检查**：☑ 已阅读 index.md  ☑ 已记录与前后周衔接  

---

### 步骤 2：本周课程大纲

- **本周学习目标**：理解 Flutter 应用架构设计，掌握多种状态管理方案（Provider、GetX、Bloc），学会在实际项目中选择和应用合适的架构模式。  
- **讲授要点**：应用架构基础（MVC、MVP、MVVM、分层架构：Presentation / Business Logic / Data / Infrastructure）；Provider（ChangeNotifier、ChangeNotifierProvider/MultiProvider、context.watch/read、Consumer）；GetX（GetxController、.obs、Obx、GetBuilder、依赖注入与路由）；Bloc（Bloc/Cubit、Event、State、BlocProvider、BlocBuilder、BlocListener、复杂 Bloc 示例如 AuthBloc）；架构选择指南（Provider/GetX/Bloc/Redux 的复杂度、适用场景、选择建议）；常见错误与最佳实践（避免过度设计、不混用多种方案、业务逻辑放 Repository/Service、正确释放 Bloc、状态粒度、职责分工）。  
- **实操任务**：Provider 计数器应用（Counter + ChangeNotifier、Consumer、加减重置）；GetX 待办事项应用（TodoController、.obs、Obx、添加/完成/删除）；Bloc 用户登录应用（AuthBloc、BlocBuilder、加载与错误状态、登录成功后导航）；项目架构设计：新闻应用（分层、状态管理选型、列表/详情/分类、网络与缓存）。  
- **作业要求**：必做：对比三种状态管理方案（Provider/GetX/Bloc 实现同一功能、对比分析报告）；完整的用户认证系统（注册/登录/登出、令牌持久化、受保护路由、错误处理）；购物车功能（商品管理、价格计算、收藏、订单历史）；应用架构设计文档（架构图、模块说明、数据流、扩展性）。选做：集成推送通知；离线数据同步；可重用 Bloc 模板库。  

**检查**：☑ 已阅读 week-13.md  ☑ 已提取目标/要点/实操/作业  

---

### 步骤 3：前几周已有内容

- **前置依赖**：第11周 FutureBuilder、数据与异步、本地存储与网络；第12周动画与交互、StatefulWidget 与 setState。第13周在 Flutter 中系统讲解「状态提升」的替代方案（Provider、GetX、Bloc）与分层架构，与第11周数据层、第12周 UI 层形成完整「数据—状态—UI」链条。  
- **可复用的表述或结构**：第3～12周大纲/讲义/课堂练习的段落结构、周聚合页四链接表格式、步骤 8 提交须包含 week-XX-page 及本周全部相关文件；第11周 Demo 的数据获取与第12周 Demo 的 UI 更新可延续到第13周「由状态管理驱动 UI」。  

**检查**：☑ 已阅读前几周内容  ☑ 已列前置依赖  ☑ 已注明可复用处  

---

### 步骤 4：知识点体系大纲

- 产出文件：`planning/week-13-knowledge-map.md`  
- 简要：主块六块（应用架构基础、Provider、GetX、Bloc、架构选择指南、常见错误与最佳实践）；与 demo/课堂练习对应已写。  

**检查**：☑ 已创建 knowledge-map  ☑ 未超纲  ☑ 知识点有「应能…」描述  

---

### 步骤 5：素材准备

- **素材清单**（主题 / 链接 / 用途 / 版本或日期）：
  - Provider：https://pub.dev/packages/provider — 状态管理
  - GetX：https://pub.dev/packages/get — 状态管理与路由
  - Bloc：https://bloclibrary.dev/ — Bloc 文档与示例

**检查**：☑ 已搜索并保存素材  ☑ 清单含链接与用途  

---

### 步骤 6：案例编写与运行验证

- demo 路径：`demos/week-13/demo/state_management_demo/`  
- 项目名：`state_management_demo`（Provider：Counter + ChangeNotifier、ChangeNotifierProvider、context.watch/read、Consumer）  
- 本地验证结果：`flutter pub get`、`flutter analyze` 通过。  

**检查**：☑ demo 已创建且可运行  ☑ 对应知识点  ☑ 已本地验证  

---

### 步骤 7：讲义与课堂练习编写

- 讲义文件：`week-13-lecture.md`（独立，permalink `/week-13/lecture/`），含架构概念、Provider（watch/read/Consumer）、GetX/Bloc 要点、架构选择、运行 Demo、常见问题。  
- 课堂练习文件：`week-13-exercise.md`（permalink `/week-13/exercise/`），三则当堂练习：运行 Demo 并说明 watch/read；为 Counter 增加方法并用 read 调用；用 Consumer 替代 watch 理解重建范围。  

**检查**：☑ 讲义结构完整  ☑ 已引用知识点/案例  ☑ 讲义 permalink 正确  ☑ 已创建课堂练习且 permalink 正确  

---

### 步骤 8：组合与发布

- **将课堂练习加入周聚合页**：在 `week-13-page.md`「本章资源」表中添加「课堂练习」一行，链接 `./exercise/`；将讲义链接改为 `./lecture/`（若采用独立讲义）。当前 week-13-page 仅有三行（大纲、讲义、案例），需补第四行。  
- 周聚合页链接检查：大纲 / 讲义 / 案例 / 课堂练习  
- **推送与部署**（必做）：提交时须包含 `week-13-page.md` 及本周全部相关文件，再推送到 main，触发 GitHub Pages 部署；在 GitHub Actions 中确认部署工作流成功。  
- **线上验证**（必做）：实际访问课程 GitHub Pages 发布地址，从首页进入「第13周」聚合页，逐链点击「大纲、讲义、案例、课堂练习」，确认无 404 且内容正确。  

**检查**：☑ 已在聚合页添加课堂练习链接  ☑ 四链接正确  ☑ 提交已包含 week-13-page 及本周全部相关文件  ☑ 已推送到 main 且 Pages 部署成功  ☑ 已访问发布站点并逐链验证  

---

**本周方案状态**：☑ 已完成  

**完成日期**：2026-03-16
