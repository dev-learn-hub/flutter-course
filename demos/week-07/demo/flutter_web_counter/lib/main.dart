// 第7周案例：Flutter Web 计数器（StatefulWidget、加/减/重置）
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web 计数器',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const CounterPage(),
    );
  }
}

/// 第7周：Flutter Web 计数器 — StatefulWidget，加、减、重置
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _count = 0;

  void _increment() => setState(() => _count++);
  void _decrement() => setState(() => _count--);
  void _reset() => setState(() => _count = 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第7周 Flutter Web 计数器'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_count',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  onPressed: _decrement,
                  icon: const Icon(Icons.remove),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: _reset,
                  child: const Text('重置'),
                ),
                const SizedBox(width: 16),
                IconButton.filled(
                  onPressed: _increment,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
