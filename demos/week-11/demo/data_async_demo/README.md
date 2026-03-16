# 第11周 数据与异步 Demo

第11周案例：SharedPreferences 存取、http GET、FutureBuilder（loading/error/data）、Future 在 initState 中创建、重新加载。

## 运行

```bash
flutter pub get
flutter run
```

可选设备：`flutter run -d chrome` 或 `flutter run -d windows`。

## 三端构建与脚本

- **Windows**：`flutter build windows`（需系统开启开发者模式以支持符号链接），产出在 `build\windows\x64\runner\Release\data_async_demo.exe`。
- **Web**：`flutter build web`；`serve_web.bat` 启动 HTTP 服务并可选打开浏览器（支持 `--no-build`、`--no-browser`、`--port`）；`test_web.bat` / `test_web.ps1` 为自动化测试（含 `capture_web_screenshot.py` 无头浏览器截图校验），测试结束后停止服务，无浏览器窗口残留。
- **Android**：`flutter build apk`；`run_android.bat` 在模拟器/真机上运行应用，截屏前会等待本包安装并用 adb 将应用带到前台，截屏后由 `verify_screenshot.py` 校验（非黑屏、非空白）；不自动打开截图，脚本末尾会关闭「照片」预览窗口。包名：`com.example.data_async_demo`。若构建时遇到网络/TLS 问题，可稍后重试或配置代理/镜像。

## 说明

- **SharedPreferences**：保存/读取字符串，演示 setString、getString。
- **FutureBuilder**：future 在 initState 中赋值，避免每次 build 重新请求；分支处理 waiting、hasError、hasData。
- **http**：GET jsonplaceholder.typicode.com/posts/1；若失败或非 200 则使用本地 JSON 保证演示可运行。
- **重新加载**：setState 中替换 _futurePost，触发 FutureBuilder 使用新 Future。
- 对应大纲：本地存储、网络请求、FutureBuilder。
