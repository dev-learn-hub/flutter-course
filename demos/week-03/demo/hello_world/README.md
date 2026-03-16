# hello_world

第 3 周 Flutter 示例项目。

## Web 本地预览

在项目根目录执行：

```bash
# Python 脚本（支持 --port、--no-build）
python serve_web.py

# 或批处理（Windows）
serve_web.bat
```

脚本会执行 `flutter build web`，在 `build/web` 下用 Python 启动 HTTP 服务（默认端口 8080），并自动打开浏览器。

- **serve_web.py**：`--port 端口` / `-p 端口`、`--no-build`
- **serve_web.bat**：`--port 端口`、`--no-build`、`--no-browser`（例：`serve_web.bat --no-build`；自动化测试用 `--no-browser` 可不打开浏览器）

**Web 自动化测试（HTTP 校验 + 浏览器截图校验 + 停止服务）**：运行 `test_web.bat` 或 `powershell -ExecutionPolicy Bypass -File test_web.ps1`。会使用 Selenium 无头 Edge/Chrome 打开页面并截屏保存为 `web_screenshot.png`，并做与 Android 相同的有效性校验。依赖：`pip install selenium`，本机需已安装 Edge 或 Chrome。

## Android 模拟器运行

在项目根目录执行：

```bat
run_android.bat
```

若有已连接的设备或已启动的模拟器，会直接在该设备上运行；否则会尝试自动启动一个已安装的模拟器，等待就绪后再运行。需已安装 Android SDK 并在 Android Studio 中至少创建一个模拟器。启动应用后会自动截屏并校验截图是否有效（非黑屏、非空白）；校验失败则脚本退出码 1，需调整等待时间或应用直至通过。

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
