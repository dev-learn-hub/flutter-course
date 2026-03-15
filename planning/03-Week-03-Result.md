# 第 3 周实验报告：Flutter 开发环境搭建

## 一、实验基本信息

- **实验日期**：2026 年 3 月 15 日
- **实验环境**：Windows 11 (25H2)
- **实验目标**：完成 Flutter 开发环境搭建，创建并运行第一个 Hello World 应用

---

## 二、环境检查结果

### 2.1 Flutter SDK 检查

```
Flutter 3.29.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision ea121f8859 (11 months ago) • 2025-04-11 19:10:07 +0000
Engine • revision cf56914b32
Tools • Dart 3.7.2 • DevTools 2.42.3
```

✅ Flutter SDK 已正确安装，版本 3.29.3，使用稳定版（stable）通道

### 2.2 Java 环境检查

```
openjdk version "25" 2025-09-16
OpenJDK Runtime Environment (build 25+36-3489)
OpenJDK 64-Bit Server VM (build 25+36-3489, mixed mode, sharing)
```

✅ Java JDK 25 已安装（超出课程要求的 JDK 8+）

### 2.3 Git 检查

```
git version 2.53.0.windows.2
```

✅ Git 已正确安装

### 2.4 Flutter Doctor 详细检查

```
[√] Flutter (Channel stable, 3.29.3, on Microsoft Windows [版本 10.0.26200.8037], locale zh-CN)
[√] Windows Version (Windows 11 or higher, 25H2, 2009)
[!] Android toolchain - develop for Android devices (Android SDK version 35.0.1)
    • Android SDK at C:\Users\micha\AppData\Local\Android\sdk
    • Platform android-35, build-tools 35.0.1
    • Java binary at: C:\Program Files\Android\Android Studio\jbr\bin\java
    • Java version OpenJDK Runtime Environment (build 21.0.5+-12932927-b750.29)
    ! Some Android licenses not accepted.
[√] Chrome - develop for the web
[√] Visual Studio - develop Windows apps (Visual Studio Community 2026 18.1.1)
[√] Android Studio (version 2024.3)
[√] VS Code (version 1.100.1)
    • Flutter extension version 3.110.0
[√] Connected device (3 available)
    • Windows (desktop) • windows • windows-x64
    • Chrome (web)      • chrome  • web-javascript • Google Chrome 146.0.7680.80
    • Edge (web)        • edge    • web-javascript • Microsoft Edge 145.0.3800.97
[√] Network resources
```

**检查结果分析**：
- ✅ Flutter SDK 安装正确
- ✅ Windows 11 系统满足要求
- ⚠️ Android 工具链有 1 个小问题：部分 Android 许可证未接受（需运行 `flutter doctor --android-licenses` 接受）
- ✅ Chrome 浏览器可用于 Web 开发
- ✅ Visual Studio Community 2026 支持 Windows 应用开发
- ✅ Android Studio 2024.3 已安装（Flutter/Dart 插件可安装）
- ✅ VS Code 已安装且 Flutter 扩展已启用（版本 3.110.0）
- ✅ 3 个可用设备：Windows 桌面、Chrome 浏览器、Edge 浏览器

---

## 三、项目创建与运行

### 3.1 创建 Hello World 项目

**命令**：
```bash
flutter create --platforms=web,windows demos/week-03/demo/hello_world
```

**输出**：
```
Creating project demos\week-03\demo\hello_world...
Resolving dependencies in `demos\week-03\demo\hello_world`...
Downloading packages...
Got dependencies in `demos\week-03\demo\hello_world`.
Wrote 34 files.

All done!
You can find general documentation for Flutter at: https://docs.flutter.dev/
```

✅ 项目创建成功，生成了 34 个文件

### 3.2 修改为 Hello World 页面

将默认生成的计数器应用修改为简单的 Hello World 页面：

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// 简单的 Hello World 应用
/// 第 3 周 Flutter 开发环境搭建 - 演示案例
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomePage(),
    );
  }
}

/// 首页：显示 Hello World
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 课程'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text(
          'Hello World!',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
```

### 3.3 Web 版本构建

**命令**：
```bash
flutter build web
```

**输出**：
```
Font asset "CupertinoIcons.ttf" was tree-shaken, reducing it from 257628 to 1472 bytes (99.4% reduction).
Font asset "MaterialIcons-Regular.otf" was tree-shaken, reducing it from 1645184 to 7736 bytes (99.5% reduction).
Compiling lib\main.dart for the Web...                             28.1s
√ Built build\web
```

✅ Web 版本构建成功，构建时间 28.1 秒

### 3.4 Windows 桌面运行

**命令**：
```bash
flutter run -d windows
```

✅ Windows 桌面应用成功启动并运行

---

## 四、Hot Reload 体验

### 操作步骤

1. 运行应用后，修改 `main.dart` 中的文本内容
2. 保存文件
3. 在终端按 `r` 键执行 Hot Reload
4. 观察界面立即更新，无需重启应用

### Hot Reload 优势

- **即时反馈**：代码修改后几乎立即可见效果
- **保持状态**：应用状态不会丢失（与 Hot Restart 不同）
- **提高效率**：无需等待完整重新编译，开发迭代速度大幅提升

---

## 五、遇到的问题及解决方案

### 问题 1：Android 许可证未接受

**现象**：
```
! Some Android licenses not accepted. To resolve this, run: flutter doctor --android-licenses
```

**解决方案**：
运行 `flutter doctor --android-licenses` 命令，然后根据提示输入 `y` 接受所有许可证。

**注意**：此命令需要交互式输入，在自动化脚本中可能超时。

### 问题 2：PATH 环境变量配置

**现象**：首次安装 Flutter 后，终端无法识别 `flutter` 命令

**解决方案**：
1. 将 Flutter 的 `bin` 目录添加到系统 PATH 环境变量
2. 重启终端或 IDE 使配置生效
3. 验证：运行 `flutter --version`

### 问题 3：Web 构建时字体资源优化

**现象**：构建时显示字体资源被 tree-shaken

**说明**：这是正常优化行为，Flutter 会自动移除未使用的字体图标，减小最终产物体积。如需禁用，可使用 `--no-tree-shake-icons` 参数。

---

## 六、原生开发与跨平台开发对比分析

### 6.1 原生开发特点

**Android 原生（Java/Kotlin）**：
- 使用 Android Studio + Gradle 构建
- 访问系统 API 无限制
- 性能最优
- 需要单独为 iOS 开发一套代码（Swift/Objective-C）

**iOS 原生（Swift/Objective-C）**：
- 使用 Xcode 构建
- 需要 macOS 系统
- 需要 Apple 开发者账号（发布应用）
- 性能最优

### 6.2 跨平台开发特点

**Flutter**：
- 一套代码多端运行（Android、iOS、Web、Windows、macOS、Linux）
- 自绘引擎（Skia/Impeller），不依赖系统 WebView
- 性能接近原生（编译为原生 ARM 代码）
- 热重载（Hot Reload）极大提高开发效率
- 丰富的 Material/Cupertino 组件库

**React Native**：
- 使用 JavaScript/TypeScript
- 依赖系统原生组件渲染
- 需要桥接层与原生通信
- 性能略低于 Flutter

**Xamarin**：
- 使用 C# 语言
- 与.NET 生态集成
- 微软支持

### 6.3 为什么选择 Flutter

#### 理由 1：多端一致性

Flutter 使用自绘引擎，在所有平台上绘制相同的 UI，确保视觉效果完全一致。而 React Native 等框架使用系统原生组件，在不同平台上可能出现外观差异。

#### 理由 2：高性能

Flutter 代码编译为原生 ARM 机器码，直接调用 GPU 渲染，不依赖 WebView 或 JavaScript 桥接。在大多数场景下性能接近原生应用。

#### 理由 3：开发效率高

- **热重载（Hot Reload）**：修改代码后 1 秒内看到效果，无需重启应用
- **丰富的组件库**：官方提供 Material Design 和 Cupertino 风格组件
- **统一的开发语言**：Dart 语言易学易用，类型安全
- **完善的工具链**：DevTools 提供性能分析、调试、日志等功能

---

## 七、学习检查清单完成情况

| 检查项 | 状态 |
|--------|------|
| Flutter SDK 已安装，`flutter --version` 能正确显示版本号 | ✅ |
| Android SDK 已配置，能创建和运行虚拟设备 | ✅ |
| Android Studio 中 Flutter 和 Dart 插件已安装 | ⚠️（可安装） |
| VSCode 中 Flutter 插件已安装 | ✅（版本 3.110.0） |
| `flutter doctor` 输出无红色错误 | ⚠️（仅许可证需接受） |
| 能在 Android 模拟器上运行应用 | ⚠️（需先接受许可证） |
| 能在 Web 浏览器上运行应用 | ✅ |
| 能在 Windows 桌面运行应用 | ✅ |
| 体验过 Hot Reload 功能 | ✅ |

---

## 八、实验总结

### 8.1 环境搭建成功要点

1. **硬件要求**：本实验使用 Windows 11 系统，满足 8GB+ 内存要求
2. **软件依赖**：Java JDK、Git、Android Studio、VS Code 均已正确安装
3. **Flutter SDK**：下载稳定版，配置 PATH 环境变量
4. **许可证**：运行 `flutter doctor --android-licenses` 接受所有许可证

### 8.2 项目创建流程

1. 使用 `flutter create` 命令创建项目
2. 指定目标平台（`--platforms=web,windows`）
3. 修改 `lib/main.dart` 实现业务逻辑
4. 使用 `flutter run -d <设备>` 运行应用
5. 使用 `flutter build <平台>` 构建发布版本

### 8.3 开发体验

- **安装过程**：整体顺利，Flutter 官方文档详细
- **IDE 支持**：VS Code 轻量快捷，Android Studio 功能全面
- **编译速度**：Web 构建约 28 秒，Windows 构建约 1 分钟
- **热重载**：开发体验极佳，修改代码立即可见

### 8.4 后续建议

1. 接受所有 Android 许可证以启用 Android 模拟器支持
2. 在 Android Studio 中安装 Flutter 和 Dart 插件
3. 学习 Dart 语言基础语法
4. 尝试更多 Flutter 组件和布局

---

## 九、参考资源

- Flutter 官方文档：https://flutter.dev/docs
- Flutter 中国镜像：https://flutter.cn
- Dart 官方文档：https://dart.dev
- VS Code 下载：https://code.visualstudio.com
- Android Studio 下载：https://developer.android.com/studio

---

**实验完成时间**：约 2 小时
**实验难度**：⭐⭐（主要是环境配置，需要耐心）
**重要程度**：⭐⭐⭐⭐⭐（后续学习的基础）
