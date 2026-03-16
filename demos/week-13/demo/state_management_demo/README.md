# 第13周 状态管理 Demo（Provider）

第13周案例：Provider 状态管理 — ChangeNotifier、ChangeNotifierProvider、context.watch/read、Consumer。

## 运行

```bash
flutter pub get
flutter run
```

## 三端构建与脚本

- **Windows**：`flutter build windows` → 产出 `build\windows\x64\runner\Release\state_management_demo.exe`。
- **Web**：`flutter build web`；使用 `serve_web.bat` 启动本地 HTTP 服务（支持 `--no-build`、`--no-browser`、`--port`）；使用 `test_web.bat` 或 `test_web.ps1` 做自动化测试（HTTP 校验 + 无头浏览器截图 `capture_web_screenshot.py` → `web_screenshot.png` 校验），测试结束后自动停止服务，无浏览器窗口残留。
- **Android**：`flutter build apk`；使用 `run_android.bat` 在设备/模拟器上运行：无设备时自动尝试启动模拟器，在新窗口执行 `flutter run -d android`，**先轮询等待本包安装**后再 `adb shell am start` 将本应用带到前台，截屏并调用 `verify_screenshot.py` 校验（非黑屏/非空白）；脚本结束时会关闭「照片」预览，避免窗口累积。

## 说明

- **Counter**：with ChangeNotifier，increment/decrement/reset 后调用 notifyListeners()。
- **ChangeNotifierProvider**：在 runApp 顶层 create Counter，子树可 watch/read。
- **context.watch**：监听 Counter 变化，重建当前 widget（显示 count）。
- **context.read**：仅获取 Counter 并调用方法，不监听，用于按钮回调。
- **Consumer**：仅 builder 子树在 Counter 变化时重建，用于局部优化。
- 对应大纲：应用架构（状态与 UI 分离）、Provider（ChangeNotifier、watch/read、Consumer）。
