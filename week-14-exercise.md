---
layout: default
title: "第14周课堂练习：Flutter 项目实践（第一部分）"
permalink: /week-14/exercise/
---

# 第14周课堂练习

本节为**当堂可完成的练习**，基于本周 [大纲](../outline/)、[讲义](../lecture/) 与 [演示案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-14) 内容。

---

## 练习 1：运行本课程第14周 Demo 并查看项目结构

**依据**：讲义「七、运行本课程第14周 Demo」；案例 `demos/week-14/demo/project_template`。

**步骤**：

1. 进入 `demos/week-14/demo/project_template`，执行 `flutter pub get`、`flutter run`。
2. 在 IDE 或文件管理器中打开 `lib`，确认存在 config、models、screens、widgets、utils 等子目录。
3. 阅读 `README.md` 中的项目结构说明，对应大纲中的「标准 Flutter 项目结构」。

**验收**：能运行 Demo，并能说出各目录的用途（config、models、screens、widgets、utils）。

---

## 练习 2：在 project_template 中新增一个常量文件

**依据**：大纲「代码规范」；讲义「三、代码规范」。

**步骤**：

1. 在 `lib/utils/` 下新建文件 `constants.dart`（蛇形命名）。
2. 在文件中定义 1～2 个常量，使用小写 k 前缀，例如：`const String kAppTitle = '第14周示例';`
3. 在 `lib/main.dart` 中 import 该文件，将 App 的 title 改为使用该常量（可选）。
4. 运行 `dart format lib`、`flutter analyze`，确认无报错。

**验收**：能按规范命名文件与常量，并理解 k 前缀与蛇形文件名的用法。

---

## 练习 3：完成一次本地 Git 提交（或简述 PR 流程）

**依据**：大纲「Git 基础」「GitHub 协作」；讲义「四、五」。

**步骤**：

1. 若本机已配置 Git：在 project_template 目录执行 `git init`（若尚未初始化），将 constants.dart 等修改加入暂存区，用 Conventional Commits 格式写一条 commit message，例如 `feat(utils): 添加 constants.dart`。
2. 或：不实际执行 Git，在纸上或文档中写出「从创建 feature 分支到提交 PR、合并」的简要步骤（至少 4 步）。

**验收**：能完成一次规范提交，或能简述 PR 流程（分支 → 开发 → 推送 → 创建 PR → 审查 → 合并）。

---

## 说明与链接

- **课堂练习**与**课后作业**不同：课堂练习为当堂完成、可当堂验收；课后作业见 [本周大纲](../outline/) 中的「📝 课后作业」。
- 遇到问题可查阅 [第14周讲义](../lecture/) 与 [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)。
- 返回 [第14周聚合页](../) 可继续查看大纲、讲义与案例。
