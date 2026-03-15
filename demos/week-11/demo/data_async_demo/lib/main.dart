// 第11周案例：SharedPreferences、http 请求、FutureBuilder
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '第11周 数据与异步',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const DataAsyncPage(),
    );
  }
}

class DataAsyncPage extends StatefulWidget {
  const DataAsyncPage({super.key});

  @override
  State<DataAsyncPage> createState() => _DataAsyncPageState();
}

class _DataAsyncPageState extends State<DataAsyncPage> {
  static const _prefKey = 'saved_text';
  String _savedText = '';
  final _textController = TextEditingController();
  late Future<Map<String, dynamic>> _futurePost;

  @override
  void initState() {
    super.initState();
    _loadSaved();
    _futurePost = _fetchPost();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _loadSaved() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => _savedText = prefs.getString(_prefKey) ?? '');
  }

  Future<void> _saveText() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefKey, _textController.text);
    await _loadSaved();
    _textController.clear();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('已保存到 SharedPreferences')));
    }
  }

  Future<Map<String, dynamic>> _fetchPost() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'))
          .timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      }
    } catch (_) {}
    return jsonDecode('{"id":1,"title":"Demo post (local)","body":"当 API 不可用时使用本地数据。"}') as Map<String, dynamic>;
  }

  void _refreshPost() {
    setState(() => _futurePost = _fetchPost());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第11周：本地存储 · 网络 · FutureBuilder'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionTitle(context, '1. SharedPreferences'),
          Text('已保存内容: $_savedText', style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintText: '输入后点击保存',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              FilledButton(onPressed: _saveText, child: const Text('保存')),
            ],
          ),
          const SizedBox(height: 24),
          _sectionTitle(context, '2. FutureBuilder（网络请求）'),
          FutureBuilder<Map<String, dynamic>>(
            future: _futurePost,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('加载中…'),
                      ],
                    ),
                  ),
                );
              }
              if (snapshot.hasError) {
                return Card(
                  color: Colors.red.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.error_outline, color: Colors.red, size: 48),
                        const SizedBox(height: 8),
                        Text('错误: ${snapshot.error}', style: const TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                );
              }
              if (snapshot.hasData) {
                final post = snapshot.data!;
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${post['title']}', style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 8),
                        Text('${post['body']}', style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: _refreshPost,
            icon: const Icon(Icons.refresh),
            label: const Text('重新加载'),
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
}
