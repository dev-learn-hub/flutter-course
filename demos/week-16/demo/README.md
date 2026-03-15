# 第16周 案例：打包与发布示例

第16周侧重**项目展示、应用打包与发布**。本目录提供可运行的 Flutter 示例项目 `release_demo`，供课堂练习 **Android 签名**与 **release 构建**（APK/AAB）；配合大纲与讲义完成发布检查清单与演讲准备。

## 目录说明

| 路径 | 说明 |
|------|------|
| **release_demo/** | 最小可运行、可打包的 Flutter 项目 |
| **README.md** | 本说明与下方打包步骤 |

## Android 打包步骤（课堂可做）

### 1. 生成密钥库（首次）

在项目根目录外或安全位置执行（请勿将密钥提交到 Git）：

```bash
keytool -genkey -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

按提示输入密钥库密码、别名密码及姓名/组织等信息。

### 2. 配置签名（android/app 下）

在 `release_demo/android/app/` 下创建 `key.properties`（勿提交到版本库）：

```properties
storePassword=你的密钥库密码
keyPassword=你的别名密码
keyAlias=key
storeFile=../../key.jks
```

路径 `storeFile` 请按实际放置 key.jks 的位置调整（相对 android/app 的路径）。

### 3. 在 build.gradle 中引用

在 `release_demo/android/app/build.gradle` 中，于 `android {` 前增加：

```groovy
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('app/key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}
```

在 `android {` 内 `signingConfigs` 与 `buildTypes` 中配置 release 签名（详见 [Flutter 官方文档](https://flutter.dev/docs/deployment/android#signing-the-app)）。

### 4. 构建 release 包

在 `release_demo` 目录下：

```bash
# APK（可直接安装测试）
flutter build apk --release

# AAB（Google Play 推荐）
flutter build appbundle --release
```

- APK 输出：`build/app/outputs/flutter-apk/app-release.apk`
- AAB 输出：`build/app/outputs/bundle/release/app-release.aab`

## 发布前检查清单（要点）

- [ ] 应用名称与版本号正确（pubspec.yaml、AndroidManifest）
- [ ] 已配置签名且 key.properties 未提交
- [ ] 隐私政策与权限说明就绪
- [ ] 本地测试通过：`flutter run --release` 或真机安装 APK 验证

更多条目见 [第16周大纲](https://github.com/dev-learn-hub/flutter-course/blob/main/week-16.md) 中的「完整的发布检查清单」。

## 与课程大纲的对应

- 应用打包与发布（Android 签名、APK/AAB）
- 发布检查清单
- 项目展示与演讲（见大纲与讲义）
