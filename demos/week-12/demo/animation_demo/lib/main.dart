// 第12周案例：显式动画、Hero、隐式动画
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '第12周 动画演示',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _expanded = false;
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第12周：动画与交互'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionTitle(context, '1. 显式动画（AnimatedBuilder）'),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Center(
                child: Container(
                  width: 80 + 120 * _animation.value,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: _animation.value),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                      child: Text('显式动画', style: TextStyle(color: Colors.white))),
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                  onPressed: () => _controller.forward(),
                  child: const Text('播放')),
              const SizedBox(width: 8),
              FilledButton(
                  onPressed: () => _controller.reverse(),
                  child: const Text('反向')),
            ],
          ),
          const SizedBox(height: 24),
          _sectionTitle(context, '2. Hero 动画（点击卡片进入详情）'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _heroCard(context, 0, Colors.orange),
              _heroCard(context, 1, Colors.green),
              _heroCard(context, 2, Colors.purple),
            ],
          ),
          const SizedBox(height: 24),
          _sectionTitle(context, '3. 隐式动画（AnimatedContainer / AnimatedOpacity）'),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            width: _expanded ? 280 : 140,
            height: 80,
            decoration: BoxDecoration(
              color: _expanded ? Colors.red.shade300 : Colors.blue.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () => setState(() => _expanded = !_expanded),
                child: Text(
                  _expanded ? '点击收起' : '点击展开',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _visible ? 1.0 : 0.2,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.teal.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () => setState(() => _visible = !_visible),
                  child: Text(
                    _visible ? '点击淡出' : '点击恢复',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
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
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _heroCard(BuildContext context, int index, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(index: index, color: color),
          ),
        );
      },
      child: Hero(
        tag: 'hero_$index',
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              '$index',
              style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.index, required this.color});

  final int index;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情 $index'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Hero(
          tag: 'hero_$index',
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 12,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    '点击返回',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
