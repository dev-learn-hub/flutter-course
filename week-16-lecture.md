---
layout: default
title: "第16周讲义：Flutter 项目实践（第三部分）"
permalink: /week-16/lecture/
---

本文为**第16周详细讲义**，侧重项目展示与演讲、应用打包与发布、发布渠道、上线后运营与项目总结。课程大纲与目标见 [第16周大纲](../outline/)。

---

## 一、本讲目标与前置知识

- **目标**：能按结构准备 10–15 分钟项目演讲与 PPT；掌握 Android 签名与 release 构建（APK/AAB）；了解 iOS 打包与 Google Play/App Store 发布步骤；理解发布检查清单与上线后运营要点；能撰写项目总结并做知识转移；能运行并打包本课程 [第16周案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-16)（release_demo）。
- **前置**：第14周项目结构、Git/CI/CD；第15周 PRD、原型、小组协作；前面各周 Flutter 应用开发基础。

---

## 二、项目展示与演讲

- **演讲结构**：开场（1–2 分钟）→ 背景与问题（2–3 分钟）→ 解决方案（3–4 分钟）→ 产品演示（3–5 分钟）→ 技术亮点（1–2 分钟）→ 成果与数据（1–2 分钟）→ 后续规划（1 分钟）→ 结束与问答（1–2 分钟）；总长约 10–15 分钟。
- **演讲技巧**：内容上充分理解项目、准备演讲稿与 PPT、产品演示含备用方案（如录屏）、反复练习控时；表现上自信、语速清晰、与听众眼神交流、声调有变化。
- **PPT 设计**：简洁清晰、字体 24pt 以上、每页 5–6 行、图表易懂、留白充足；大纲中有示例页结构（标题页、问题/机会、解决方案、功能、技术架构、成果、反馈、后续、团队、致谢）。
- **产品演示**：真机测试、预装演示数据、备用录屏；演示中网络或崩溃时保持冷静、快速恢复或切换备用方案；对听众提问诚实回答并承诺跟进。

---

## 三、应用打包与发布

- **Android 签名**：使用 `keytool` 生成密钥库（.jks）；在 `android/app` 下创建 `key.properties`（勿提交），配置 storePassword、keyPassword、keyAlias、storeFile；在 `build.gradle` 中读取并配置 `signingConfigs` 与 `buildTypes.release`。详见 [Flutter 官方部署文档](https://flutter.dev/docs/deployment/android#signing-the-app)。
- **APK 与 AAB**：`flutter build apk --release` 产出 APK，便于真机安装测试；`flutter build appbundle --release` 产出 AAB，为 Google Play 推荐格式。输出路径见大纲或本课程 [demos/week-16/demo/README](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-16)。
- **iOS 打包**：配置开发者证书与 Provisioning Profile；在 Xcode 中打开 `ios/Runner.xcworkspace`，选择签名；Product → Archive，导出 .ipa 并上传 App Store Connect。
- **发布检查清单**：应用名称与版本、应用 ID/包名、隐私政策、图标与截图、描述；代码质量（测试、无崩溃、分析通过）；安全与隐私（敏感数据、API 密钥、权限）；本地化与性能；测试与文档（CHANGELOG、版本号、发布说明）。完整条目见 [第16周大纲](../outline/)。

---

## 四、应用发布渠道

- **Google Play**：注册开发者账户（一次性费用）、创建应用、填写详情与隐私政策 URL、上传 AAB、完成内容评级、提交审核；审核通过后发布，后续可监控下载与评分。
- **App Store**：Apple Developer 账户、App ID、证书与 Profile、Xcode Archive、App Store Connect 提交与审核；通常 1–3 天。
- **国内渠道**：华为、小米、应用宝、360 等；审核约 1–3 天，费用与政策各异，见大纲表格。

---

## 五、应用上线后运营

- **监控与分析**：关键指标如 DAU/MAU、留存、崩溃率、评分；工具如 Firebase、Google Analytics、Crashlytics 等。
- **用户反馈**：应用内反馈、商店评价、客服邮箱等；流程：收集 → 分析 → 修复/迭代 → 反馈用户。
- **版本迭代**：紧急修复、安全补丁、新功能版本、大版本更新的频率与节奏；建议 4–8 周一个功能版本，详见大纲。

---

## 六、项目总结与知识转移

- **项目总结文档**：概述、目标完成情况、主要成就与关键数据、技术成就、挑战与解决方案、最佳实践、教训与改进、后续建议、致谢。大纲中有模板可参考。
- **知识转移**：需求与设计文档、架构与部署文档、API 与 FAQ；代码注释与 README；技术分享与培训。

---

## 七、运行与打包本课程第16周 Demo

1. 进入 `demos/week-16/demo/release_demo`，执行 `flutter pub get`、`flutter run` 确认可运行。
2. 阅读 `demos/week-16/demo/README.md`，按步骤生成密钥、配置 `key.properties`（勿提交）、在 `build.gradle` 中配置签名。
3. 执行 `flutter build apk --release` 或 `flutter build appbundle --release`，在输出路径查看产物。
4. 对照大纲中的发布检查清单，自检应用配置、安全与文档。

---

## 八、常见问题

- **演讲忘词**：停顿、看备注、保持冷静，继续下一段。
- **审核被拒**：仔细阅读拒绝原因，修复后重新提交；可多次提交。
- **用户反馈 Bug**：按优先级处理，严重问题紧急修复并发布，一般问题纳入下版本。
- **更新频率**：一般 4–8 周一个版本，紧急 Bug 除外。

---

## 九、与大纲、课堂练习的链接

- **大纲**：[第16周大纲](../outline/)。
- **课堂练习**：[第16周课堂练习](../exercise/)。
- **案例**：[demos/week-16](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-16)。
