# 第10周 常用组件 Demo

第10周案例：AppBar（leading/actions）、Form + TextFormField（用户名/密码、validator、onSaved）、AlertDialog、showModalBottomSheet、GestureDetector、InkWell、SnackBar。

## 运行

```bash
flutter pub get
flutter run
```

可选设备：`flutter run -d chrome` 或 `flutter run -d windows`。

## 三端构建与脚本

- **Windows**：`flutter build windows`，产出在 `build\windows\x64\runner\Release\components_demo.exe`。
- **Web**：`flutter build web`；`serve_web.bat` 启动 HTTP 服务并可选打开浏览器（支持 `--no-build`、`--no-browser`、`--port`）；`test_web.bat` / `test_web.ps1` 为自动化测试（含 `capture_web_screenshot.py` 无头浏览器截图校验），测试结束后停止服务，无浏览器窗口残留。
- **Android**：`flutter build apk`；`run_android.bat` 在模拟器/真机上运行应用，截屏前会等待本包安装并用 adb 将应用带到前台，截屏后由 `verify_screenshot.py` 校验（非黑屏、非空白）；不自动打开截图，脚本末尾会关闭「照片」预览窗口。包名：`com.example.components_demo`。

## 说明

- **AppBar**：leading 菜单、actions 搜索与更多，点击触发 SnackBar。
- **Form**：GlobalKey<FormState>、两个 TextFormField（validator 校验、onSaved 保存），登录按钮 validate + save 后显示 SnackBar。
- **AlertDialog**：showDialog + AlertDialog，确定/取消与 Navigator.pop。
- **BottomSheet**：showModalBottomSheet，列表选项与 Navigator.pop。
- **GestureDetector / InkWell**：单击、长按与涟漪效果。
- 对应大纲：AppBar、Form、Dialog、事件处理。
