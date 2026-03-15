// 第16周案例：可打包发布示例 — 用于练习 flutter build apk / appbundle
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '第16周 打包与发布示例',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      home: const ReleaseDemoPage(),
    );
  }
}

/// 首页：用于练习 release 构建与签名
class ReleaseDemoPage extends StatelessWidget {
  const ReleaseDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第16周：打包与发布'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            '本示例用于练习 Android 签名与 release 构建。'
            '请参阅上级目录 README：keytool、key.properties、flutter build apk/appbundle。',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
