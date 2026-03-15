---
layout: default
title: "第3周讲义：Flutter 开发环境搭建"
permalink: /week-03-lecture/
---

本文为**第3周详细讲义**，侧重操作步骤与常见问题。课程大纲与目标见 [第3周课程页](./week-03/)。

---

## 一、本讲目标与前置知识

- **目标**：在 Windows 或 macOS 上完成 Flutter 环境搭建，用 Android Studio 或 VSCode 创建并运行第一个 Hello World 应用。
- **前置**：已安装 Java JDK 8+、Git；建议 8GB 以上内存、约 50GB 可用磁盘。

---

## 二、Flutter SDK 安装（分平台）

### 2.1 Windows

1. **下载 SDK**  
   打开 [Flutter 官方安装页](https://docs.flutter.dev/get-started/install/windows)，下载 Windows 版 Flutter SDK（zip）。

2. **解压到无中文路径**  
   例如解压到 `C:\src\flutter`，**不要**放在 `C:\Users\你的用户名\桌面` 等含中文的路径。

3. **配置 PATH**  
   - 打开「环境变量」：Win + R → 输入 `sysdm.cpl` →「高级」→「环境变量」。  
   - 在「用户变量」或「系统变量」中找到 `Path`，编辑 →「新建」→ 添加 `C:\src\flutter\bin`（按你的解压路径修改）。  
   - 确定保存后，**关闭并重新打开**终端 / CMD / PowerShell。

4. **验证**  
   新开终端执行：
   ```bash
   flutter --version
   ```
   能显示版本号即表示 PATH 配置成功。

### 2.2 macOS

1. **下载 SDK**  
   从 [Flutter 官方安装页](https://docs.flutter.dev/get-started/install/macos) 下载 macOS 版 SDK（zip 或通过 Git 克隆）。

2. **解压或克隆到目录**  
   例如：`~/development/flutter`，避免路径中含中文或空格。

3. **配置 PATH**  
   编辑 `~/.zshrc` 或 `~/.bash_profile`，添加：
   ```bash
   export PATH="$PATH:$HOME/development/flutter/bin"
   ```
   保存后执行 `source ~/.zshrc`（或对应配置文件）。

4. **验证**  
   ```bash
   flutter --version
   ```

5. **Apple Silicon (M1/M2)**  
   若遇架构或 Xcode 相关问题，请参考 [Flutter 官方 macOS 说明](https://docs.flutter.dev/get-started/install/macos#apple-silicon-apple-m1-chip)。

---

## 三、环境检查：flutter doctor

安装完 SDK 后，在终端执行：

```bash
flutter doctor
```

- 出现 **绿色 ✓** 表示该项正常。  
- 出现 **黄色 !** 或红色说明需要处理（如未接受 Android 许可证、未装 Xcode 等）。

**常见需要处理项：**

- **Android licenses not accepted**  
  执行：
  ```bash
  flutter doctor --android-licenses
  ```
  按提示输入 `y` 接受所有许可证。

- **Android SDK not found**  
  需先安装 [Android Studio](https://developer.android.com/studio) 并通过 SDK Manager 安装 Android SDK（见下一节）。

---

## 四、Android SDK 与 Android Studio（可选但推荐）

若需在 Android 模拟器或真机上运行，需要 Android SDK。

### 4.1 安装 Android Studio（Windows / macOS 通用）

1. 从 [Android Studio 官网](https://developer.android.com/studio) 下载并安装。  
2. 首次启动时选择「Standard」安装，会一并安装 Android SDK。  
3. 在 **SDK Manager**（Settings / Preferences → Appearance & Behavior → System Settings → Android SDK）中确认：
   - 已安装 **Android SDK Platform**（建议 30 或以上）、  
   - **Android SDK Build-Tools**、  
   - 需要时勾选 **Android SDK Command-line Tools**。  
4. 在 **Device Manager** 中创建至少一个虚拟设备（AVD），便于后续运行应用。

### 4.2 在 Android Studio 中安装 Flutter 插件

1. File → Settings（macOS：Android Studio → Preferences）→ Plugins。  
2. 搜索「Flutter」，安装 **Flutter** 插件（会提示一并安装 Dart 插件，选同意）。  
3. 重启 Android Studio。  
4. 若已装 Flutter SDK，可在 Settings → Languages & Frameworks → Flutter 中指定 SDK 路径（如 `C:\src\flutter` 或 `~/development/flutter`）。

---

## 五、VSCode 配置（可选）

1. 安装 [VSCode](https://code.visualstudio.com/)。  
2. 在扩展市场安装 **Flutter**（会提示安装 Dart，一并安装）。  
3. 若 VSCode 未自动识别 Flutter SDK，在设置中搜索 `flutter sdk`，填写 SDK 路径。  
4. 使用命令面板（Ctrl+Shift+P / Cmd+Shift+P）可执行「Flutter: New Project」「Flutter: Run」等。

---

## 六、运行本课程第3周 Demo（Hello World）

本课程仓库中已提供第3周演示项目，可按以下步骤在本地运行。

1. **克隆或打开课程仓库**  
   若尚未克隆：
   ```bash
   git clone https://github.com/dev-learn-hub/flutter-course.git
   cd flutter-course
   ```

2. **进入第3周 Demo 目录**  
   ```bash
   cd demos/week-03/demo/hello_world
   ```

3. **安装依赖并运行**  
   ```bash
   flutter pub get
   flutter run
   ```
   若有多个设备，会提示选择；也可指定设备，例如：
   - Web：`flutter run -d chrome`  
   - Windows 桌面：`flutter run -d windows`  
   - Android 模拟器：先启动模拟器，再 `flutter run`。

4. **预期效果**  
   应用标题为「Flutter 课程」，页面中央显示「Hello World!」。  
   演示代码在 `lib/main.dart`，可对照 [第3周课程页](./week-03/) 的讲解理解。

---

## 七、自己创建 Hello World 项目

### 7.1 使用 Android Studio

1. File → New → New Flutter Project。  
2. 选择「Flutter application」，Next。  
3. 填写项目名称（如 `my_hello`）、路径、组织名，选择 Flutter SDK 路径，Finish。  
4. 创建完成后，将 `lib/main.dart` 中默认的计数器示例改为简单 Hello World：保留 `MyApp` 和 `home`，把首页改为一个 `Scaffold`，中间放 `Text('Hello World!')`。可参考本课程 Demo 的 `demos/week-03/demo/hello_world/lib/main.dart`。

### 7.2 使用 VSCode

1. Ctrl+Shift+P（macOS：Cmd+Shift+P）→「Flutter: New Project」。  
2. 选择「Application」，输入项目名称与路径。  
3. 打开 `lib/main.dart`，同样改为 Hello World 页面（参考上面或课程 Demo）。

### 7.3 使用命令行

```bash
flutter create my_hello
cd my_hello
```

然后编辑 `lib/main.dart` 为 Hello World 界面，再执行 `flutter run`。

---

## 八、多平台运行与 Hot Reload

- **Web**：`flutter run -d chrome`（需已安装 Chrome）。  
- **Windows 桌面**：`flutter run -d windows`。  
- **Android**：连接真机或启动模拟器后执行 `flutter run`。  
- **iOS（仅 macOS）**：需 Xcode，执行 `flutter run -d ios`。

**Hot Reload**：在 `flutter run` 运行过程中，修改代码并保存，在终端按 **r**，界面会快速更新，无需完全重启应用。

---

## 九、常见问题与解决

| 现象 | 可能原因 | 处理办法 |
|------|----------|----------|
| 终端输入 `flutter` 提示找不到命令 | PATH 未配置或未生效 | 确认已把 `flutter/bin` 加入 PATH，并**重新打开终端**（或重启 IDE）。 |
| `flutter doctor` 报 Android licenses 未接受 | 未接受 Android SDK 许可 | 执行 `flutter doctor --android-licenses`，全部输入 `y`。 |
| Windows 下 Flutter 报错或行为异常 | 路径含中文 | 将 Flutter 解压到纯英文路径（如 `C:\src\flutter`）并重新配置 PATH。 |
| macOS M1/M2 下模拟器或构建异常 | 架构或 Xcode 版本 | 参考 [Flutter macOS 安装](https://docs.flutter.dev/get-started/install/macos)，确保 Xcode 与命令行工具已安装并更新。 |
| 模拟器列表为空或无法启动 | 未创建 AVD 或未安装模拟器镜像 | 在 Android Studio → Device Manager 中创建虚拟设备，并确保已下载对应系统镜像。 |

更多环境问题可参考课程 [第3周实验报告示例](https://github.com/dev-learn-hub/flutter-course/blob/main/planning/03-Week-03-Result.md) 中的「遇到的问题及解决方案」部分。

---

## 十、本讲练习与作业要求

- **必做**：  
  1. 在 Android Studio 或 VSCode 中成功创建 Hello World 项目，并在至少一种方式（模拟器 / 真机 / Web / Windows）下运行。  
  2. 成功运行本课程仓库中的第3周 Demo（`demos/week-03/demo/hello_world`）。  
  3. 体验一次 Hot Reload（改文案后按 r 观察界面更新）。  
  4. 撰写实验报告：环境搭建中遇到的问题及解决、原生与跨平台开发对比（不少于 1000 字）、选择 Flutter 的 3 个理由。

- **选做**：修改 Demo 中的「Hello World!」文案或主题色，再次运行并观察效果。

详细作业说明与提交方式以教师当堂或课程平台通知为准。

---

## 十一、学习检查清单

- [ ] `flutter --version` 能正确显示版本  
- [ ] `flutter doctor` 无红色报错（黄色可逐步处理）  
- [ ] 能在至少一种平台上运行应用（Web / Windows / Android 等）  
- [ ] 已体验 Hot Reload  
- [ ] 已运行本课程第3周 Demo  
- [ ] 实验报告已完成

---

## 十二、相关链接

- [第3周课程大纲与目标](./week-03/)  
- [Flutter 官方安装文档](https://docs.flutter.dev/get-started/install)  
- [Flutter 中文网](https://flutter.cn)  
- [本课程仓库 GitHub](https://github.com/dev-learn-hub/flutter-course)

---

*讲义最后更新：2026年3月*
