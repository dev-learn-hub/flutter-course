# 第12周 动画演示 Demo

第12周案例：显式动画（AnimationController + Tween + CurvedAnimation + AnimatedBuilder）、Hero 动画（列表卡片 → 详情页）、隐式动画（AnimatedContainer、AnimatedOpacity）。

## 运行

```bash
flutter pub get
flutter run
```

可选设备：`flutter run -d chrome` 或 `flutter run -d windows`。

## 三端构建与脚本

- **Windows**：`flutter build windows`，产出在 `build\windows\x64\runner\Release\animation_demo.exe`。
- **Web**：`flutter build web`；`serve_web.bat` 启动 HTTP 服务并可选打开浏览器（支持 `--no-build`、`--no-browser`、`--port`）；`test_web.bat` / `test_web.ps1` 为自动化测试（含 `capture_web_screenshot.py` 无头浏览器截图校验），测试结束后停止服务，无浏览器窗口残留。
- **Android**：`flutter build apk`；`run_android.bat` 在模拟器/真机上运行应用，截屏前会等待本包安装并用 adb 将应用带到前台，截屏后由 `verify_screenshot.py` 校验（非黑屏、非空白）；不自动打开截图，脚本末尾会关闭「照片」预览窗口。包名：`com.example.animation_demo`。

## 说明

- **显式动画**：Controller 在 initState 中创建、dispose 中释放；Tween + CurvedAnimation；AnimatedBuilder 根据 animation.value 更新宽高与透明度，避免整页 setState。
- **Hero**：主页三张卡片与详情页使用相同 tag（hero_0、hero_1、hero_2），实现共享元素过渡。
- **隐式动画**：AnimatedContainer 随 _expanded 切换宽高与颜色；AnimatedOpacity 随 _visible 切换透明度。
- 对应大纲：动画基础、Tween/Curve、AnimatedBuilder、Hero、隐式动画。
