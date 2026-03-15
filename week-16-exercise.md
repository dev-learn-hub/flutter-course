---
layout: default
title: "第16周课堂练习：Flutter 项目实践（第三部分）"
permalink: /week-16/exercise/
---

# 第16周课堂练习

本节为**当堂可完成的练习**，基于本周 [大纲](../outline/)、[讲义](../lecture/) 与 [演示案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-16) 内容。

---

## 练习 1：运行并尝试 release 构建本课程第16周 Demo

**依据**：讲义「七、运行与打包本课程第16周 Demo」；案例 `demos/week-16/demo/release_demo`。

**步骤**：

1. 进入 `demos/week-16/demo/release_demo`，执行 `flutter pub get`、`flutter run`，确认应用可运行。
2. 阅读上级目录 `demos/week-16/demo/README.md` 中的打包步骤（密钥生成、key.properties、build.gradle 配置）。
3. 若已配置签名：执行 `flutter build apk --release`，在 `build/app/outputs/flutter-apk/` 下确认生成 `app-release.apk`；若未配置签名，至少能复述「生成密钥 → 配置 key.properties → 配置 build.gradle → flutter build apk」的流程。

**验收**：能运行 Demo，并能说明或完成 Android release 构建的完整步骤。

---

## 练习 2：为本周/本组项目列一页演讲提纲

**依据**：讲义「二、项目展示与演讲」；大纲「演讲结构」「PPT 示例结构」。

**步骤**：

1. 按「开场 → 背景与问题 → 解决方案 → 产品演示 → 技术亮点 → 成果 → 后续 → 结束与问答」列出一页提纲（每段 1–2 句话）。
2. 标出预计每段占用时间（总长 10–15 分钟）。
3. （可选）选其中 2–3 段，写出可放在 PPT 上的要点标题。

**验收**：能交出结构完整的一页演讲提纲，并说明各段目的与时间分配。

---

## 练习 3：勾选发布检查清单中的 5 项并说明

**依据**：讲义「三、应用打包与发布」；大纲「完整的发布检查清单」。

**步骤**：

1. 从大纲的发布检查清单中任选 5 项（如：应用名称和版本正确、隐私政策、测试通过、CHANGELOG、应用图标）。
2. 针对本组项目或 release_demo，逐项勾选「已做 / 未做 / 不适用」，并写一句话说明（如：版本号在 pubspec.yaml 中已设为 1.0.0）。
3. 写出 1 项你认为最容易遗漏的检查项及防范办法。

**验收**：能完成 5 项勾选与简短说明，并能指出至少 1 项易遗漏项及应对方式。

---

## 说明与链接

- **课堂练习**与**课后作业**不同：课堂练习为当堂完成、可当堂验收；课后作业见 [本周大纲](../outline/) 中的「📝 课后作业」。
- 遇到问题可查阅 [第16周讲义](../lecture/) 与 [Flutter 部署文档](https://flutter.dev/docs/deployment)。
- 返回 [第16周聚合页](../) 可继续查看大纲、讲义与案例。
