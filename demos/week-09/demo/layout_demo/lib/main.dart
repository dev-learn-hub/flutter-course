// 第9周案例：Flutter 布局系统 — Row/Column、ListView、GridView、Stack/Positioned、响应式
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '第9周 布局演示',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const LayoutDemoPage(),
    );
  }
}

class LayoutDemoPage extends StatelessWidget {
  const LayoutDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第9周：布局系统'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionTitle(context, '1. Row 与 Column 组合'),
          _rowColumnDemo(context),
          const SizedBox(height: 24),
          _sectionTitle(context, '2. ListView 列表'),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(5, (i) => _colorCard(Colors.primaries[i % Colors.primaries.length], 'Item $i')),
            ),
          ),
          const SizedBox(height: 24),
          _sectionTitle(context, '3. GridView 网格'),
          SizedBox(
            height: 160,
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: List.generate(6, (i) => _colorCard(Colors.accents[i % Colors.accents.length], '$i')),
            ),
          ),
          const SizedBox(height: 24),
          _sectionTitle(context, '4. Stack 与 Positioned'),
          SizedBox(
            height: 100,
            child: Stack(
              children: [
                Container(color: Colors.blue.shade100, width: double.infinity),
                Positioned(left: 8, top: 8, child: _chip('左上')),
                Positioned(right: 8, top: 8, child: _chip('右上')),
                Positioned(left: 8, bottom: 8, child: _chip('左下')),
                Positioned(right: 8, bottom: 8, child: _chip('右下')),
                const Positioned(left: 0, right: 0, top: 0, bottom: 0, child: Center(child: Text('Stack 中心', style: TextStyle(fontWeight: FontWeight.bold)))),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _sectionTitle(context, '5. 响应式提示'),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                '当前宽度: ${MediaQuery.of(context).size.width.toStringAsFixed(0)} px。\n在讲义中可用 MediaQuery.of(context).size 根据宽度切换宽/窄布局。',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
    );
  }

  Widget _rowColumnDemo(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _chip('A'),
                _chip('B'),
                _chip('C'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: Container(height: 40, color: Colors.red.shade100, child: const Center(child: Text('Expanded 1')))),
                Expanded(flex: 2, child: Container(height: 40, color: Colors.green.shade100, child: const Center(child: Text('Expanded 2 (flex:2)')))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorCard(Color color, String label) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 80,
      decoration: BoxDecoration(color: color.withValues(alpha: 0.7), borderRadius: BorderRadius.circular(8)),
      child: Center(child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
    );
  }

  Widget _chip(String text) {
    return Chip(
      label: Text(text),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
