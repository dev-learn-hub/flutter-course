// 第14周案例：规范项目结构示例 — 入口与首页
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '第14周 项目结构示例',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomePage(),
    );
  }
}

/// 首页：演示规范结构下的入口页面
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第14周：项目结构'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            '本示例展示规范的 lib 目录结构（config、models、screens、widgets、utils）。'
            '详见 README 与课程大纲。',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
