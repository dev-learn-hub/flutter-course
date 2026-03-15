// 第13周案例：Provider 状态管理 — ChangeNotifier、watch/read、Consumer
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Counter(),
      child: const MyApp(),
    ),
  );
}

/// 状态：Counter 使用 ChangeNotifier，变化时 notifyListeners()
class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '第13周 Provider 演示',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第13周：状态管理（Provider）'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              '1. context.watch — 监听变化会重建',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              '${context.watch<Counter>().count}',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              '2. context.read — 仅调用方法，不监听',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: () => context.read<Counter>().decrement(),
                child: const Text('−'),
              ),
              const SizedBox(width: 16),
              FilledButton(
                onPressed: () => context.read<Counter>().reset(),
                child: const Text('重置'),
              ),
              const SizedBox(width: 16),
              FilledButton(
                onPressed: () => context.read<Counter>().increment(),
                child: const Text('+'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              '3. Consumer — 仅此子树在 Counter 变化时重建',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Consumer<Counter>(
            builder: (context, counter, child) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text('Consumer 内 count: ${counter.count}'),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () => counter.increment(),
                        child: const Text('在 Consumer 内 +1'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
