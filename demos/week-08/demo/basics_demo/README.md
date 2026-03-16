# Flutter 框架基础 Demo（第8周）

第8周案例：应用结构（main、MaterialApp）、StatelessWidget（ProfileCard）、StatefulWidget（CounterSection）、基础组件（Text、Container、Padding、Icon、ElevatedButton、Scaffold、AppBar）。

## 运行

```bash
flutter pub get
flutter run
```

可选设备：`flutter run -d chrome` 或 `flutter run -d windows`。

## 三端构建与脚本

- **Windows**：`flutter build windows`，产出在 `build\windows\x64\runner\Release\basics_demo.exe`。
- **Web**：`flutter build web`；`serve_web.bat` 启动 HTTP 服务并可选打开浏览器（支持 `--no-build`、`--no-browser`、`--port`）；`test_web.bat` / `test_web.ps1` 为自动化测试，测试结束后会关闭浏览器并停止服务。
- **Android**：`flutter build apk`；`run_android.bat` 在模拟器/真机上运行应用，截屏前会用 adb 将应用带到前台，截屏后由 `verify_screenshot.py` 校验（非黑屏、非空白）；不自动打开截图，脚本末尾会关闭「照片」预览窗口，避免窗口累积。包名：`com.example.basics_demo`。

## 说明

- **MyApp**：StatelessWidget，MaterialApp 配置。
- **ProfileCard**：StatelessWidget，展示姓名与角色（无状态）。
- **CounterSection**：StatefulWidget，计数器通过 setState 更新；对应生命周期 build/setState。
- 对应大纲：Flutter 应用结构、Stateless vs Stateful、常用基础组件。
