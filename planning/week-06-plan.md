# 第6周具体方案

> 基于 `planning/02-Weekly-Content-Template.md` 第七节生成。按步骤 1～8 执行并勾选检查项。

---

### 基本信息

- **周次**：第6周  
- **主题**：Dart 异步编程与网络请求  
- **核心内容（一句话）**：Future、async-await、HTTP 请求、JSON 解析  
- **全学期中的阶段**：Dart 基础（最后一周，为第7周 Web/第8周 Flutter 打基础）  

---

### 步骤 1：全学期课程大纲

- 前一周主题：第5周 Dart 语言进阶（第二部分）  
- 后一周主题：第7周 Dart Web 开发与 Flutter Web 入门  
- 备注：第6周承上启下，异步与网络是 Flutter 应用常用能力，需掌握 Future/async-await 与 HTTP/JSON。  

**检查**：□ 已阅读 index.md  □ 已记录与前后周衔接  

---

### 步骤 2：本周课程大纲

- **本周学习目标**：理解异步编程模型，掌握 Future、async-await 语法，学会网络请求和数据解析，能编写实际的服务端程序。  
- **讲授要点**：异步基础（同步 vs 异步、Future、then/catchError）；async-await；Stream 流（async*、yield）；网络请求（http 库 GET/POST）；JSON 数据处理（dart:convert、fromJson）；dio 库高级用法（拦截器、baseUrl）；错误处理与超时控制。  
- **实操任务**：使用 http 库 GET/POST；解析 JSON 并转为 Dart 对象；编写 HTTP 服务器（shelf）；处理错误与异常；实现带超时控制的网络请求。  
- **作业要求**：仿写教材第 8 章示例；编写天气数据获取程序（调用公开 API、解析 JSON、显示温度等）；编写 HTTP 服务器（路由 GET /、GET /users/:id、POST /users，返回 JSON，含错误处理）；实验报告。  

**检查**：□ 已阅读 week-06.md  □ 已提取目标/要点/实操/作业  

---

### 步骤 3：前几周已有内容

- **前置依赖**：第4周 Dart 基础（类型、函数）；第5周类与对象、异常处理、包管理（pubspec、依赖）。第6周需在项目中添加 http/dio/shelf 等依赖，并运用 try-catch、自定义类与 fromJson。  
- **可复用的表述或结构**：第3～5周大纲/讲义/课堂练习的段落结构、周聚合页四链接表格式、步骤 8 提交须包含 week-XX-page 及本周全部相关文件。  

**检查**：□ 已阅读前几周内容  □ 已列前置依赖  □ 已注明可复用处  

---

### 步骤 4：知识点体系大纲

- 产出文件：`planning/week-06-knowledge-map.md`  
- 简要：主块五块（异步与 Future、Stream 选讲、HTTP 请求、JSON 解析）；与 demo/课堂练习对应已写。  

**检查**：☑ 已创建 knowledge-map  ☑ 未超纲  ☑ 知识点有「应能…」描述  

---

### 步骤 5：素材准备

- **素材清单**（主题 / 链接 / 用途 / 版本或日期）：
  - Dart 异步：https://dart.dev/codelabs/async-await — 讲义 async-await 依据，查阅 2026-03
  - Dart Future/Stream：https://dart.dev/guides/language/language-tour#asynchrony-support — 讲义 Future/Stream 依据
  - http 包：https://pub.dev/packages/http — 案例依赖与用法
  - JSONPlaceholder：https://jsonplaceholder.typicode.com — 案例 GET 请求目标 API
  - dart:convert：https://api.dart.dev/stable/dart-convert/dart-convert-library.html — JSON 解析依据

**检查**：☑ 已搜索并保存素材  ☑ 清单含链接与用途  

---

### 步骤 6：案例编写与运行验证

- demo 路径：`demos/week-06/demo/async_http_cli/`  
- 项目名：`async_http_cli`（依赖 http，GET JSONPlaceholder、Post.fromJson、timeout；API 不可用时本地 JSON fallback）  
- 本地验证结果：`dart pub get` + `dart run bin/main.dart` 通过。  

**检查**：☑ demo 已创建且可运行  ☑ 对应知识点  ☑ 已本地验证  

---

### 步骤 7：讲义与课堂练习编写

- 讲义文件：`week-06-lecture.md`，permalink `/week-06/lecture/`；含异步与 Future、http 请求、JSON 与 fromJson、运行 Demo、常见问题。  
- 课堂练习文件：`week-06-exercise.md`，permalink `/week-06/exercise/`；3 个当堂练习（运行 Demo、改 id/超时、DartPad async）。  

**检查**：☑ 讲义结构完整  ☑ 已引用知识点/案例  ☑ 讲义 permalink 正确  ☑ 已创建课堂练习且 permalink 正确  

---

### 步骤 8：组合与发布

- **将课堂练习加入周聚合页**：在 `week-06-page.md`「本章资源」表中添加「课堂练习」一行，链接 `./exercise/`；将讲义链接改为 `./lecture/`（若采用独立讲义）。当前 week-06-page 仅有三行（大纲、讲义、案例），需补第四行。  
- 周聚合页链接检查：大纲 / 讲义 / 案例 / 课堂练习  
- **推送与部署**（必做）：提交时须包含 `week-06-page.md` 及本周全部相关文件，再推送到 main，触发 GitHub Pages 部署；在 GitHub Actions 中确认部署工作流成功。  
- **线上验证**（必做）：实际访问课程 GitHub Pages 发布地址，从首页进入「第6周」聚合页，逐链点击「大纲、讲义、案例、课堂练习」，确认无 404 且内容正确。  

**检查**：□ 已在聚合页添加课堂练习链接  □ 四链接正确  □ 提交已包含 week-06-page 及本周全部相关文件  □ 已推送到 main 且 Pages 部署成功  □ 已访问发布站点并逐链验证  

---

**本周方案状态**：□ 进行中  □ 已完成  

**完成日期**：（填写）
