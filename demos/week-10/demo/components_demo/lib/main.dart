// 第10周案例：AppBar、Form、Dialog、BottomSheet、事件处理（GestureDetector/InkWell）
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '第10周 常用组件',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const ComponentsDemoPage(),
    );
  }
}

class ComponentsDemoPage extends StatefulWidget {
  const ComponentsDemoPage({super.key});

  @override
  State<ComponentsDemoPage> createState() => _ComponentsDemoPageState();
}

class _ComponentsDemoPageState extends State<ComponentsDemoPage> {
  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第10周：常用组件'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _showSnackBar('菜单'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSnackBar('搜索'),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => _showSnackBar('更多'),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionTitle(context, '1. 登录表单（Form + TextFormField）'),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '用户名',
                    hintText: '至少3个字符',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return '请输入用户名';
                    if (v.length < 3) return '至少3个字符';
                    return null;
                  },
                  onSaved: (v) => _username = v,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: '密码',
                    hintText: '至少6个字符',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return '请输入密码';
                    if (v.length < 6) return '至少6个字符';
                    return null;
                  },
                  onSaved: (v) => _password = v,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _showSnackBar('登录: $_username，密码长度: ${_password?.length ?? 0}');
                    }
                  },
                  child: const Text('登录'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _sectionTitle(context, '2. 对话框与 BottomSheet'),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _showAlertDialog(context),
                  child: const Text('AlertDialog'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _showBottomSheet(context),
                  child: const Text('BottomSheet'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _sectionTitle(context, '3. 手势与 InkWell'),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _showSnackBar('GestureDetector 单击'),
                  onLongPress: () => _showSnackBar('GestureDetector 长按'),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(child: Text('GestureDetector', textAlign: TextAlign.center)),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Material(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    onTap: () => _showSnackBar('InkWell 点击'),
                    borderRadius: BorderRadius.circular(8),
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(child: Text('InkWell', textAlign: TextAlign.center)),
                    ),
                  ),
                ),
              ),
            ],
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

  void _showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void _showAlertDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('确认'),
        content: const Text('这是 AlertDialog 示例。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              _showSnackBar('已确认');
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('拍照'),
              onTap: () {
                Navigator.pop(ctx);
                _showSnackBar('拍照');
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('从相册选择'),
              onTap: () {
                Navigator.pop(ctx);
                _showSnackBar('相册');
              },
            ),
            ListTile(
              leading: const Icon(Icons.close),
              title: const Text('取消'),
              onTap: () => Navigator.pop(ctx),
            ),
          ],
        ),
      ),
    );
  }
}
