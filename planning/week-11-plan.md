# 第11周具体方案

> 基于 `planning/02-Weekly-Content-Template.md` 第七节生成。按步骤 1～8 执行并勾选检查项。

---

### 基本信息

- **周次**：第11周  
- **主题**：Flutter 常用组件与功能（第二部分）  
- **核心内容（一句话）**：本地存储、网络请求、FutureBuilder、第三方库  
- **全学期中的阶段**：Flutter 基础（承接第10周表单与交互，为第12周动画与交互、第13周状态管理打基础）  

---

### 步骤 1：全学期课程大纲

- 前一周主题：第10周 Flutter 常用组件与功能（第一部分）  
- 后一周主题：第12周 Flutter 动画与交互体验  
- 备注：第11周聚焦数据与异步（文件操作、path_provider、SharedPreferences、http 网络请求、FutureBuilder/StreamBuilder、第三方库集成），与第6周 Dart 异步/网络、第10周表单衔接，为第12周动画与第13周状态管理提供数据与异步 UI 基础。  

**检查**：☑ 已阅读 index.md  ☑ 已记录与前后周衔接  

---

### 步骤 2：本周课程大纲

- **本周学习目标**：掌握文件操作、网络请求、异步编程，学会使用 FutureBuilder 处理异步数据，集成第三方库，实现完整的应用功能。  
- **讲授要点**：文件操作（path_provider 获取目录、File 读写/追加/删除、listSync 列目录；JSON 文件与 toJson/fromJson）；SharedPreferences 本地存储（getInstance、setString/getString、setInt/getInt、setBool/getBool、remove、clear）；网络请求（http 包 GET/POST/PUT/DELETE、timeout、statusCode 与错误处理、jsonDecode）；异步与 FutureBuilder（Future 在 initState 中创建避免重复调用、ConnectionState.waiting/hasError/hasData、builder 分支）；Stream 与 StreamBuilder（可选）；第三方库集成（pubspec.yaml、http/shared_preferences/path_provider 等；Logger、Intl、CachedNetworkImage、FilePicker、PermissionHandler 示例）；常见错误与最佳实践（FutureBuilder 的 future 不要每次 build 创建、网络超时与异常处理、SharedPreferences 不存大数据）。  
- **实操任务**：文件操作应用（文本编辑器、SharedPreferences 存最近文件列表、删除）；网络请求应用（JSONPlaceholder 获取文章列表、列表与详情、刷新、错误处理）；天气应用（公开 API、FutureBuilder、城市搜索）；TODO 列表应用（path_provider + File 持久化 JSON）；综合案例：新闻应用（API 列表、SharedPreferences 缓存、刷新与加载更多、错误与超时）。  
- **作业要求**：必做：文件管理应用、天气查询应用、API 数据展示、完善 TODO 应用；选做：用户注册 POST、图片缓存、离线同步应用。  

**检查**：☑ 已阅读 week-11.md  ☑ 已提取目标/要点/实操/作业  

---

### 步骤 3：前几周已有内容

- **前置依赖**：第6周 Dart 异步与网络（Future、async-await、http、JSON）；第10周 Form、Dialog、事件处理（可为数据展示提供界面）。第11周在 Flutter 中系统讲解 path_provider、SharedPreferences、http 与 FutureBuilder，以及第三方库集成。  
- **可复用的表述或结构**：第3～10周大纲/讲义/课堂练习的段落结构、周聚合页四链接表格式、步骤 8 提交须包含 week-XX-page 及本周全部相关文件；第6周 Dart 控制台 async/http 示例可作对比。  

**检查**：☑ 已阅读前几周内容  ☑ 已列前置依赖  ☑ 已注明可复用处  

---

### 步骤 4：知识点体系大纲

- 产出文件：`planning/week-11-knowledge-map.md`  
- 简要：主块七块（文件操作与 path_provider、SharedPreferences、网络与 http、FutureBuilder、StreamBuilder 可选、第三方库、常见错误与最佳实践）；与 demo/课堂练习对应已写。  

**检查**：☑ 已创建 knowledge-map  ☑ 未超纲  ☑ 知识点有「应能…」描述  

---

### 步骤 5：素材准备

- **素材清单**（主题 / 链接 / 用途 / 版本或日期）：
  - FutureBuilder：https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html — 讲义异步 UI
  - http：https://pub.dev/packages/http — 网络请求
  - shared_preferences：https://pub.dev/packages/shared_preferences — 本地存储
  - path_provider：https://pub.dev/packages/path_provider — 文件路径

**检查**：☑ 已搜索并保存素材  ☑ 清单含链接与用途  

---

### 步骤 6：案例编写与运行验证

- demo 路径：`demos/week-11/demo/data_async_demo/`  
- 项目名：`data_async_demo`（SharedPreferences 存取、http GET、FutureBuilder loading/error/data、Future 在 initState 中创建、重新加载）  
- 本地验证结果：`flutter pub get`、`flutter analyze` 通过。  

**检查**：☑ demo 已创建且可运行  ☑ 对应知识点  ☑ 已本地验证  

---

### 步骤 7：讲义与课堂练习编写

- 讲义文件：`week-11-lecture.md`（独立，permalink `/week-11/lecture/`），含 path_provider 简述、SharedPreferences、http 与超时/错误、FutureBuilder 正确用法、运行 Demo、第三方库与常见问题。  
- 课堂练习文件：`week-11-exercise.md`（permalink `/week-11/exercise/`），三则当堂练习：运行 Demo 并说明 Future/SharedPreferences；修改 key 或增加 setInt；为 FutureBuilder 增加错误提示或修改超时。  

**检查**：☑ 讲义结构完整  ☑ 已引用知识点/案例  ☑ 讲义 permalink 正确  ☑ 已创建课堂练习且 permalink 正确  

---

### 步骤 8：组合与发布

- **将课堂练习加入周聚合页**：已在 `week-11-page.md` 表中添加「课堂练习」一行，链接 `./exercise/`；讲义链接为 `./lecture/`。  
- 周聚合页链接检查：大纲 / 讲义 / 案例 / 课堂练习  
- **推送与部署**（必做）：提交须包含 `week-11-page.md` 及本周全部相关文件，推送到 main，触发 GitHub Pages 部署。  
- **线上验证**（必做）：访问课程 GitHub Pages，从首页进入第11周聚合页，逐链点击大纲、讲义、案例、课堂练习，确认无 404 且内容正确。  

**检查**：☑ 已在聚合页添加课堂练习链接  ☑ 四链接正确  ☑ 提交已包含 week-11-page 及本周全部相关文件  ☑ 已推送到 main 且 Pages 部署成功  ☑ 已访问发布站点并逐链验证  

---

**本周方案状态**：☑ 已完成  

**完成日期**：2026-03-15
