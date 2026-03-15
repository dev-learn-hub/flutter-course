# 第14周知识点体系大纲

> 本周主题与目标（一句话）：掌握 Flutter 项目结构规范、Dart 代码规范、Git/GitHub 工作流与 CI/CD 基础，能为小组项目建立规范框架与协作流程。

---

## 一、项目结构规范

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| lib 目录分层 | config、models、services、repositories、screens、widgets、utils、theme 等 | 按功能划分目录并放置对应文件 |
| 入口与路由 | main.dart、路由配置 | 理解入口与页面组织方式 |
| test / assets | 测试目录、资源目录与 pubspec 声明 | 会添加测试与资源并配置 pubspec |
| .gitignore / README | 忽略构建与敏感文件、项目说明 | 编写基本 .gitignore 与 README |

---

## 二、代码规范（Dart Style Guide）

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| 命名规范 | 类大驼峰、方法/变量小驼峰、常量 k 前缀、文件名蛇形 | 按规范命名并区分使用场景 |
| 代码风格 | 缩进、const、有意义命名、函数简短单职责 | 写出符合风格指南的代码 |
| 文档注释 | /// 文档、参数与返回值说明 | 为公开 API 编写简要文档注释 |
| analysis_options.yaml | 启用 linter、自定义规则 | 配置并理解常见分析规则 |

---

## 三、Git 基础与工作流

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| 基本命令 | init、add、commit、status、log | 完成本地提交与查看历史 |
| 分支与合并 | branch、checkout、merge；main/develop、feature/* | 创建特性分支并合并到主分支 |
| 远程协作 | remote、push、pull、clone | 与远程仓库同步 |
| Conventional Commits | type(scope): message | 书写规范提交信息 |

---

## 四、GitHub 协作（PR/Issue）

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| 仓库与分支保护 | 创建仓库、保护 main/develop | 配置仓库与分支策略 |
| Pull Request | 创建 PR、描述变更、请求审查 | 完成一次规范的 PR 流程 |
| Issue 与模板 | 描述问题、使用 Issue/PR 模板 | 按模板填写 Issue 与 PR |
| 代码审查 | 审查评论、修改后推送 | 参与简单代码审查 |

---

## 五、CI/CD（GitHub Actions）

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| 工作流概念 | 触发条件、job、step | 理解一次「推送后自动检查」的流程 |
| Flutter 工作流示例 | checkout、Flutter 环境、pub get、format、analyze、test、build | 能阅读并修改简易 workflow 配置 |
| 本地检查命令 | dart format、flutter analyze、flutter test、flutter build | 在本地执行与 CI 一致的检查 |

---

## 六、常见工具与最佳实践

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| 推荐工具 | Git/GitHub、VS Code、GitHub Actions | 知道常用工具及其用途 |
| 最佳实践 | 规范目录、README/CONTRIBUTING、.gitignore 完整 | 在新项目中应用基本实践 |

---

## 七、与本周 Demo / 课堂练习的对应

- **Demo**（`demos/week-14/demo/project_template`）：规范 lib 目录结构（config、models、screens、widgets、utils）、可运行的 main、README 说明结构；对应大纲「项目结构规范」。可选：analysis_options 与简易 workflow 引用本课程仓库。
- **课堂练习**（`week-14-exercise.md`）：当堂任务对应目录创建、Git 初提交、或 PR 流程简述；验收与大纲一致。
