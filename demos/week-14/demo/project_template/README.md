# 第14周 项目结构示例（project_template）

第14周案例：Flutter 规范项目结构 — lib 分层目录、入口与 README。

## 运行

```bash
flutter pub get
flutter run
```

## 项目结构说明

```
lib/
├── main.dart          # 应用入口
├── config/            # 配置文件（如 app_config、theme）
├── models/            # 数据模型
├── screens/           # 页面（screens 或 pages）
├── widgets/           # 可复用组件
└── utils/             # 工具函数、常量、扩展
```

- **config**：应用配置、主题等。
- **models**：业务数据模型（如 user_model、product_model）。
- **screens**：全屏页面，按功能分子目录（如 home、login）。
- **widgets**：通用或业务相关可复用组件。
- **utils**：constants、validators、logger、extensions 等。

配合课程大纲学习：代码规范（Dart Style Guide）、Git 工作流、CI/CD。本仓库根目录的 `.github/workflows` 与 `analysis_options.yaml` 可作 CI 与代码分析参考。
