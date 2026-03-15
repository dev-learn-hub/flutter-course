# release_demo — 第16周打包练习项目

最小 Flutter 应用，用于练习 **release 构建**与 **Android 签名**。

## 运行

```bash
flutter pub get
flutter run
```

## 打包

请先阅读**上级目录**的 [README.md](../README.md)，按步骤配置密钥与 `key.properties` 后执行：

```bash
flutter build apk --release
# 或
flutter build appbundle --release
```

输出路径见上级 README。
