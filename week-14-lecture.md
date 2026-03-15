---
layout: default
title: "第14周讲义：Flutter 项目实践（第一部分）"
permalink: /week-14/lecture/
---

本文为**第14周详细讲义**，侧重项目结构规范、Dart 代码规范、Git/GitHub 工作流、CI/CD 基础与常见问题。课程大纲与目标见 [第14周大纲](../outline/)。

---

## 一、本讲目标与前置知识

- **目标**：理解 Flutter 标准项目结构；掌握 Dart 命名与风格要点；会使用 Git 常用命令与 GitHub PR 流程；了解 CI/CD 与 GitHub Actions 示例；能运行本课程 [第14周案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-14)（project_template）；能为小组项目建立规范框架。
- **前置**：第13周架构与状态管理；前面各周 Flutter/Dart 基础。  

---

## 二、项目结构规范

- **lib 目录**：main.dart 为入口；按职责分 config、models、services、repositories、screens（或 pages）、widgets、utils、theme 等；子目录可再按功能划分（如 screens/home、screens/login）。
- **test / assets**：测试放 test，资源放 assets 并在 pubspec.yaml 中声明。
- **根目录**：pubspec.yaml、analysis_options.yaml、.gitignore、README.md。本课程 Demo（project_template）展示了 lib 下的分层目录与 README 说明。  

---

## 三、代码规范（Dart Style Guide）

- **命名**：类名大驼峰（UserProfile）；方法/变量小驼峰（getUserData、userName）；常量小写 k 前缀（kAppName）；文件名蛇形（user_profile.dart）。
- **风格**：缩进 2 空格、合理使用 const、有意义的命名、函数简短单职责；避免模糊缩写。
- **文档注释**：公开 API 用 /// 写简要说明与参数/返回值。
- **analysis_options.yaml**：启用 flutter_lints 或自定义规则，本地与 CI 统一用 `dart format`、`flutter analyze`。  

---

## 四、Git 基础与工作流

- **基本命令**：git init、add、commit、status、log；远程 clone、push、pull。
- **分支**：main/develop 为主干；特性在 feature/* 或 bugfix/* 上开发，完成后合并。
- **Conventional Commits**：type(scope): message，如 feat(auth): 登录页、fix(api): 修正超时。  

---

## 五、GitHub 协作（PR/Issue）

- **仓库与分支保护**：在 GitHub 创建仓库，对 main/develop 设置保护规则（如要求 PR 审查）。
- **Pull Request**：在特性分支开发完成后推送到远程，在 GitHub 创建 PR，填写描述与检查清单，请求审查后合并。
- **Issue 与模板**：用 Issue 跟踪问题与需求；可配置 PR/Issue 模板（见大纲示例）。  

---

## 六、CI/CD 基础（GitHub Actions）

- **概念**：推送或 PR 时自动运行 job（如安装环境、格式检查、分析、测试、构建）。
- **Flutter 示例**：workflow 中 checkout、设置 Flutter、flutter pub get、dart format --set-exit-if-changed、flutter analyze、flutter test、flutter build。本课程仓库的 `.github/workflows/pages.yml` 为 Jekyll 部署示例，可参考结构；大纲中有 Flutter 专用 workflow 示例。
- **本地对齐**：提交前在本地执行 `dart format lib`、`flutter analyze`、`flutter test`，与 CI 保持一致。  

---

## 七、运行本课程第14周 Demo

1. 进入 `demos/week-14/demo/project_template`，执行 `flutter pub get`。
2. 执行 `flutter run`（或选择设备）。
3. 查看 lib 下 config、models、screens、widgets、utils 目录与 README 中的结构说明；结合大纲理解各目录用途与扩展方式。  

---

## 八、与大纲、课堂练习的链接

- **大纲**：[第14周大纲](../outline/)。  
- **课堂练习**：[第14周课堂练习](../exercise/)。  
- **案例**：[demos/week-14](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-14)。
