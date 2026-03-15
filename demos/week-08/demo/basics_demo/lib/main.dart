// 第8周案例：Flutter 框架基础 — 应用结构、StatelessWidget、StatefulWidget、基础组件
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// 根组件：StatelessWidget，配置 MaterialApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '第8周 Flutter 基础',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomePage(),
    );
  }
}

/// 首页：包含 StatelessWidget 个人信息卡片 + StatefulWidget 计数器
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第8周：框架基础'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ProfileCard(name: '张三', role: '学生'),
                const SizedBox(height: 32),
                const Text('计数器（StatefulWidget）', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                const CounterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// StatelessWidget：个人信息卡片（无状态，仅展示）
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.name, required this.role});

  final String name;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.person, size: 40, color: Colors.blue.shade700),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(name, style: Theme.of(context).textTheme.titleMedium),
              Text(role, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}

/// StatefulWidget：计数器（有状态，setState 更新）
class CounterSection extends StatefulWidget {
  const CounterSection({super.key});

  @override
  State<CounterSection> createState() => _CounterSectionState();
}

class _CounterSectionState extends State<CounterSection> {
  int _count = 0;

  void _increment() => setState(() => _count++);
  void _decrement() => setState(() => _count--);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('$_count', style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: _decrement,
              icon: const Icon(Icons.remove),
              label: const Text('减'),
            ),
            const SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: _increment,
              icon: const Icon(Icons.add),
              label: const Text('加'),
            ),
          ],
        ),
      ],
    );
  }
}
