# 第9周 布局系统 Demo

第9周案例：Row/Column 组合、Expanded、ListView（水平列表）、GridView.count、Stack+Positioned、MediaQuery 响应式提示。

## 运行

```bash
flutter pub get
flutter run
```

可选设备：`flutter run -d chrome` 或 `flutter run -d windows`。

## 三端构建与脚本

- **Windows**：`flutter build windows`，产出在 `build\windows\x64\runner\Release\layout_demo.exe`。
- **Web**：`flutter build web`；`serve_web.bat` 启动 HTTP 服务并可选打开浏览器（支持 `--no-build`、`--no-browser`、`--port`）；`test_web.bat` / `test_web.ps1` 为自动化测试（含 `capture_web_screenshot.py` 无头浏览器截图校验），测试结束后停止服务，无浏览器窗口残留。
- **Android**：`flutter build apk`；`run_android.bat` 在模拟器/真机上运行应用，截屏前会等待本包安装并用 adb 将应用带到前台，截屏后由 `verify_screenshot.py` 校验（非黑屏、非空白）；不自动打开截图，脚本末尾会关闭「照片」预览窗口。包名：`com.example.layout_demo`。

## 说明

- **Row + Column**：mainAxisAlignment、Expanded(flex)。
- **ListView**：水平滚动，SizedBox 限定高度。
- **GridView.count**：固定 3 列，count/extent。
- **Stack + Positioned**：四角与中心叠放。
- **响应式**：显示当前 MediaQuery.size 宽度，便于理解根据宽度切换布局。
- 对应大纲：主要布局组件、响应式设计。
