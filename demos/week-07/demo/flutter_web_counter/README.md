# Flutter Web 计数器

第7周案例：Flutter Web 入门，StatefulWidget 计数器，加、减、重置。

## 运行

```bash
flutter pub get
flutter run -d chrome
```

或构建 Web 产物：`flutter build web --release`，输出在 `build/web/`。

## 三端构建与脚本

- **Windows**：`flutter build windows`，产出在 `build\windows\x64\runner\Release\flutter_web_counter.exe`。
- **Web**：`flutter build web`；`serve_web.bat` 启动 HTTP 服务并可选打开浏览器（支持 `--no-build`、`--no-browser`、`--port`）；`test_web.bat` / `test_web.ps1` 为自动化测试，测试结束后会关闭浏览器并停止服务。
- **Android**：`flutter build apk`；`run_android.bat` 在模拟器/真机上运行应用，截屏前会用 adb 将应用带到前台，截屏后由 `verify_screenshot.py` 校验（非黑屏、非空白）；不自动打开截图，脚本末尾会关闭「照片」预览窗口，避免窗口累积。包名：`com.example.flutter_web_counter`。

## 说明

- `CounterPage` 为 StatefulWidget，`_count` 状态，`_increment`/`_decrement`/`_reset` 通过 `setState` 更新。
- 对应大纲：Flutter Web 计数器应用、StatefulWidget、响应式设计入门。
