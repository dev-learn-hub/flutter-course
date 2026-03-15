# 第3周：Flutter 开发环境搭建

> **📖 详细讲义**：本页为课程大纲与目标；分步操作说明、Windows/macOS 区别及常见问题见 [第3周讲义（操作指南）](./week-03-lecture/)。

## 周学习目标
完成 Flutter 开发环境的全面搭建，能够在 Android Studio、VSCode 两种 IDE 上分别构建开发环境，并成功创建、编译和运行第一个 Hello World 应用。

---

## 📚 课程内容（4小时）

### 第1-2节：讲授（2小时）

#### 一、移动开发概述
- **移动开发的演变**
  - 原生开发：Android (Java/Kotlin)、iOS (Swift/Objective-C)
  - 跨平台框架对比：React Native vs. Flutter vs. Xamarin vs. Cordova
  - 为什么选择 Flutter
    - 多端一致性（多端统一外观和体验）
    - 高性能（编译到原生代码，不依赖系统 WebView）
    - 热重载（Hot Reload）实现快速迭代
    - 丰富的官方组件和活跃的社区

#### 二、系统要求与前置准备
- **硬件要求**
  - CPU：Intel 或 Apple Silicon（M1/M2）
  - 内存：8GB 以上（推荐 16GB）
  - 存储：至少 50GB 自由空间（用于 SDK）
- **操作系统支持**
  - Windows 10/11、macOS 10.14+、Linux (Ubuntu/Debian)
- **前置软件**
  - Java JDK 8+（推荐 11 或 17）
  - Git
  - 代码编辑器或 IDE

#### 三、Flutter SDK 安装详解
- **下载与安装步骤**
  1. 从 https://flutter.dev/docs/get-started/install 下载对应系统的 SDK
  2. 解压到指定目录（如 C:\src\flutter 或 ~/flutter）
  3. 添加 Flutter/bin 到系统 PATH
  4. 运行 `flutter doctor` 检查环境
- **常见问题排查**
  - PATH 配置不生效
  - Android SDK 未找到
  - iOS 开发工具缺失（macOS）

#### 四、Android SDK 与 Android Studio 配置
- **Android Studio 安装**
  - 下载官方 IDE
  - 配置 SDK Manager（下载 SDK 30+、NDK、模拟器）
  - 创建虚拟设备（AVD）
- **Flutter 插件安装**
  - 在 Android Studio 中安装 Flutter 和 Dart 插件
  - 配置快捷键和代码模板

#### 五、VSCode 环境配置
- **必装插件**
  - Flutter（官方）
  - Dart Code
  - Code Runner（可选）
- **配置 settings.json**
  - Flutter SDK 路径
  - Dart SDK 路径
  - 调试器设置

#### 六、移动应用原生开发 vs. 跨平台开发对比
| 特性 | 原生开发 | 跨平台开发 |
|------|--------|---------|
| 性能 | 最优 | 接近原生 |
| 开发周期 | 长（需开发多套） | 短（一套代码） |
| 学习曲线 | 陡峭 | 平缓 |
| 平台特性支持 | 完全 | 需要桥接 |
| 发布流程 | 各平台不同 | 相对统一 |

#### 七、真机调试基础
- **USB 调试开启**
  - Android：开发者选项 → USB 调试
  - iOS：需要 Apple 开发者账号
- **代码签名与证书**
  - 开发阶段调试证书
  - 发布前的证书申请流程

---

### 第3-4节：实操（2小时）

#### 实操任务
1. **环境检查**
   - 运行 `flutter doctor` 并解决所有问题
   - 验证 Java、Android SDK、Git 都已正确配置
   
2. **Android Studio 创建项目**
   - File → New → New Flutter Project
   - 配置项目名称、包名、位置
   - 选择 Flutter SDK 路径
   - 创建后在模拟器上运行

3. **VSCode 创建项目**
   - 打开命令面板：Ctrl+Shift+P
   - 选择 "Flutter: New Project"
   - 选择应用类型（Application）
   - 使用 `flutter run` 启动应用

4. **创建 Hello World 项目**
   - 修改默认生成的计数器应用
   - 替换 MyApp 和 HomePage，实现简单的 Hello World 页面

5. **多平台运行测试**
   - **Web 浏览器**：`flutter run -d chrome`
   - **Android 模拟器**：`flutter run`
   - **真机（Android）**：连接 USB，`flutter run`
   - **iOS 模拟器（macOS）**：`flutter run -d ios`

6. **Hot Reload 体验**
   - 修改文本内容，按 R 快速重载
   - 观察界面立即更新
   - 体会开发效率提升

---

## 📝 课后作业

### 必做作业
1. ✅ 在 Android Studio 中成功创建 Hello World 项目并在模拟器/真机运行
2. ✅ 在 VSCode 中成功创建 Hello World 项目并在模拟器/真机运行
3. ✅ 在 Web 浏览器中运行应用
4. ✅ 撰写实验报告：
   - 环境搭建过程中遇到的问题及解决方案
   - 原生开发与跨平台开发的优缺点分析（至少 1000 字）
   - 为什么选择 Flutter 的 3 个理由

### 推荐补充学习
- 阅读 Flutter 官方文档：https://flutter.dev/docs/get-started/install
- 了解 Flutter 支持的所有平台
- 研究不同平台的发布流程差异

---

## 📚 学习资源

### 官方文档
- **Flutter 官方文档**：https://flutter.dev/docs
- **Dart 官方文档**：https://dart.dev
- **中国镜像**：https://flutter.cn（网络良好时推荐）

### 开发工具
- **Android Studio 官方**：https://developer.android.com/studio
- **VSCode 官方**：https://code.visualstudio.com
- **Dart Pad 在线编辑器**：https://dartpad.dev

### 视频教程
- Flutter官方视频系列（YouTube）
- 网易云课堂 Flutter 教程
- B 站 Flutter 中文教程

### 参考书籍
- 《Flutter 实战》（杜文著） - **第1、2章**
- 《Flutter 应用开发从0到1》

---

## 🎯 学习检查清单

- [ ] Flutter SDK 已安装，`flutter --version` 能正确显示版本号
- [ ] Android SDK 已配置，能创建和运行虚拟设备
- [ ] Android Studio 中 Flutter 和 Dart 插件已安装
- [ ] VSCode 中 Flutter 插件已安装
- [ ] `flutter doctor` 输出无红色错误
- [ ] 能在 Android 模拟器上运行应用
- [ ] 能在 Web 浏览器上运行应用
- [ ] 体验过 Hot Reload 功能
- [ ] 实验报告已完成提交

---

## 💡 额外提示

**Windows 用户常见坑：**
- 确保 Flutter 解压在没有中文路径的目录
- PATH 添加后需要重启 IDE 或重新打开终端生效

**macOS 用户常见坑：**
- M1/M2 芯片需要额外配置（参考官方文档）
- Xcode 版本必须足够新

**Linux 用户常见坑：**
- 某些依赖需要手动安装（如 `libglu1-mesa`）
- 虚拟设备可能需要 KVM 支持

---

**预计完成时间**：4小时课内 + 4-6小时课外  
**难度等级**：⭐⭐ （主要是环境配置，需要耐心）  
**重要程度**：⭐⭐⭐⭐⭐ （基础中的基础）
