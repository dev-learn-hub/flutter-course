# 第14周 项目结构示例（project_template）

第14周案例：Flutter 规范项目结构 — lib 分层目录、入口与 README。

## 运行

```bash
flutter pub get
flutter run
```

## 三端构建与脚本

- **Windows**：`flutter build windows` → 产出 `build\windows\x64\runner\Release\project_template.exe`。
- **Web**：`flutter build web`；使用 `serve_web.bat` 启动本地 HTTP 服务（支持 `--no-build`、`--no-browser`、`--port`）；使用 `test_web.bat` / `test_web.ps1` 做自动化测试（HTTP 校验 + 无头浏览器截图 `capture_web_screenshot.py` → `web_screenshot.png` 校验），测试结束后自动停止服务，无浏览器窗口残留。
- **Android**：`flutter build apk`（目前受网络/TLS 协议限制，可能需要多次重试或代理；脚本与配置已就绪）；使用 `run_android.bat` 在设备/模拟器上运行：无设备时自动尝试启动模拟器，在新窗口执行 `flutter run -d android`，**先轮询等待本包 `com.example.project_template` 安装**后再 `adb shell am start` 将本应用带到前台，截屏并调用 `verify_screenshot.py` 校验（非黑屏/非空白）；脚本结束时会关闭「照片」预览，避免窗口累积。

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
