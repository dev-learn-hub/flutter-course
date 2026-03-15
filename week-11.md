---
layout: default
title: "第11周大纲：Flutter 常用组件与功能（第二部分）"
permalink: /week-11/outline/
---

# 第11周：Flutter 常用组件与功能（第二部分）

## 周学习目标
掌握文件操作、网络请求、异步编程，学会使用 FutureBuilder 处理异步数据，集成第三方库，实现完整的应用功能。

---

## 📚 核心内容

### 讲授（2小时）

#### 一、文件操作

**文件系统基础**
```dart
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileManager {
  // 获取应用文档目录
  Future<Directory> getAppDocumentsDirectory() async {
    return await getApplicationDocumentsDirectory();
  }

  // 获取应用临时目录
  Future<Directory> getAppTempDirectory() async {
    return await getTemporaryDirectory();
  }

  // 读取文件
  Future<String> readFile(String filename) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$filename');
      if (await file.exists()) {
        return await file.readAsString();
      }
      return 'File not found';
    } catch (e) {
      return 'Error reading file: $e';
    }
  }

  // 写入文件
  Future<void> writeFile(String filename, String content) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$filename');
      await file.writeAsString(content);
    } catch (e) {
      print('Error writing file: $e');
    }
  }

  // 追加内容到文件
  Future<void> appendFile(String filename, String content) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$filename');
      await file.writeAsString(content, mode: FileMode.append);
    } catch (e) {
      print('Error appending to file: $e');
    }
  }

  // 删除文件
  Future<void> deleteFile(String filename) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$filename');
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      print('Error deleting file: $e');
    }
  }

  // 列出目录中的文件
  Future<List<String>> listFiles() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final files = dir.listSync();
      return files
          .map((f) => f.path.split('/').last)
          .toList();
    } catch (e) {
      return [];
    }
  }
}
```

**JSON 文件操作**
```dart
import 'dart:convert';

class UserData {
  final String name;
  final String email;
  final int age;

  UserData({
    required this.name,
    required this.email,
    required this.age,
  });

  // 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'age': age,
    };
  }

  // 从 JSON 创建
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      email: json['email'],
      age: json['age'],
    );
  }
}

class JsonFileManager {
  final FileManager _fileManager = FileManager();

  // 保存对象列表为 JSON
  Future<void> saveUsers(List<UserData> users) async {
    final jsonString = jsonEncode(
      users.map((user) => user.toJson()).toList(),
    );
    await _fileManager.writeFile('users.json', jsonString);
  }

  // 读取 JSON 并转换为对象列表
  Future<List<UserData>> loadUsers() async {
    try {
      final jsonString = await _fileManager.readFile('users.json');
      final jsonList = jsonDecode(jsonString) as List;
      return jsonList
          .map((json) => UserData.fromJson(json))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
```

**SharedPreferences 本地存储**
```dart
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  // 保存字符串
  static Future<void> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  // 读取字符串
  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  // 保存整数
  static Future<void> saveInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  // 读取整数
  static Future<int?> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  // 保存布尔值
  static Future<void> saveBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  // 读取布尔值
  static Future<bool?> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  // 删除键
  static Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  // 清除所有数据
  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
```

---

#### 二、网络请求

**HTTP 请求基础**
```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://api.example.com';

  // GET 请求
  static Future<Map<String, dynamic>> getRequest(String endpoint) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl$endpoint'),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(
        Duration(seconds: 10),
        onTimeout: () => throw TimeoutException('Request timeout'),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 404) {
        throw Exception('Resource not found');
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized');
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Get request failed: $e');
    }
  }

  // POST 请求
  static Future<Map<String, dynamic>> postRequest(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 201 || response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Post failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Post request failed: $e');
    }
  }

  // PUT 请求
  static Future<Map<String, dynamic>> putRequest(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl$endpoint'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Put failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Put request failed: $e');
    }
  }

  // DELETE 请求
  static Future<void> deleteRequest(String endpoint) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl$endpoint'),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(Duration(seconds: 10));

      if (response.statusCode != 204 && response.statusCode != 200) {
        throw Exception('Delete failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Delete request failed: $e');
    }
  }
}
```

**使用公开 API 的例子**
```dart
class WeatherService {
  // 获取天气信息（使用免费 API）
  static Future<Map<String, dynamic>> getWeather(String city) async {
    try {
      final response = await http.get(
        Uri.parse('https://wttr.in/$city?format=j1'),
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to fetch weather');
      }
    } catch (e) {
      throw Exception('Weather request failed: $e');
    }
  }

  // 获取 JSON 数据
  static Future<List<dynamic>> getJsonPlaceholderPosts() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to fetch posts');
      }
    } catch (e) {
      throw Exception('Posts request failed: $e');
    }
  }
}
```

**错误处理和重试**
```dart
class RetryableHttpClient {
  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 1);

  static Future<http.Response> getWithRetry(Uri url) async {
    for (int i = 0; i < maxRetries; i++) {
      try {
        final response = await http.get(url).timeout(
          Duration(seconds: 10),
        );
        if (response.statusCode == 200) {
          return response;
        }
      } catch (e) {
        if (i < maxRetries - 1) {
          await Future.delayed(retryDelay * (i + 1));
        } else {
          rethrow;
        }
      }
    }
    throw Exception('Max retries exceeded');
  }
}
```

---

#### 三、异步编程与 FutureBuilder

**Future 基础**
```dart
// 基本 Future
Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 2), () {
    return 'Data loaded';
  });
}

// 异步函数
Future<int> calculateSum() async {
  await Future.delayed(Duration(seconds: 1));
  return 1 + 2 + 3;
}

// 链式调用
Future<void> chainedFutures() {
  return fetchData()
      .then((data) {
        print('First: $data');
        return calculateSum();
      })
      .then((sum) {
        print('Second: $sum');
      })
      .catchError((error) {
        print('Error: $error');
      });
}

// Async/Await 方式
Future<void> asyncAwaitWay() async {
  try {
    final data = await fetchData();
    print('First: $data');
    final sum = await calculateSum();
    print('Second: $sum');
  } catch (error) {
    print('Error: $error');
  }
}
```

**FutureBuilder 组件**
```dart
class DataScreen extends StatelessWidget {
  Future<List<String>> _fetchItems() {
    return Future.delayed(Duration(seconds: 2), () {
      return ['Item 1', 'Item 2', 'Item 3'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FutureBuilder Example')),
      body: FutureBuilder<List<String>>(
        future: _fetchItems(),
        builder: (context, snapshot) {
          // 检查连接状态
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading data...'),
                ],
              ),
            );
          }

          // 检查是否有错误
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: Colors.red),
                  SizedBox(height: 16),
                  Text('Error: ${snapshot.error}'),
                ],
              ),
            );
          }

          // 有数据
          if (snapshot.hasData) {
            final items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                  leading: Icon(Icons.check_circle_outline, color: Colors.green),
                );
              },
            );
          }

          // 默认状态
          return Center(child: Text('No data'));
        },
      ),
    );
  }
}
```

**Stream 和 StreamBuilder**
```dart
class StreamCounter {
  // 创建 Stream
  static Stream<int> countStream() {
    return Stream.periodic(Duration(seconds: 1), (count) => count)
        .take(10); // 只发出前 10 个值
  }

  // 自定义 Stream
  static Stream<String> customStream() async* {
    for (int i = 0; i < 5; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield 'Event $i';
    }
  }
}

class StreamBuilderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StreamBuilder Example')),
      body: StreamBuilder<int>(
        stream: StreamCounter.countStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            return Center(
              child: Text(
                'Count: ${snapshot.data}',
                style: TextStyle(fontSize: 32),
              ),
            );
          }

          return Center(child: Text('Done'));
        },
      ),
    );
  }
}
```

---

#### 四、第三方库集成

**常用第三方库**

在 `pubspec.yaml` 中添加：
```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # HTTP 请求
  http: ^1.1.0
  
  # JSON 序列化
  json_serializable: ^6.6.0
  
  # 路由管理
  get: ^4.6.5
  
  # 图片加载和缓存
  cached_network_image: ^3.2.3
  
  # 日期和时间
  intl: ^0.18.0
  
  # 日志
  logger: ^1.3.0
  
  # 本地存储
  shared_preferences: ^2.1.1
  
  # 文件选择
  file_picker: ^5.3.0
  
  # 权限管理
  permission_handler: ^11.4.3

dev_dependencies:
  build_runner: ^2.3.3
  json_serializable: ^6.6.0
```

**使用第三方库的例子**

```dart
// 使用 Logger 记录日志
import 'package:logger/logger.dart';

final logger = Logger();

void logExample() {
  logger.d('Debug message');
  logger.i('Info message');
  logger.w('Warning message');
  logger.e('Error message', error: Exception('Test error'));
}

// 使用 Intl 格式化日期
import 'package:intl/intl.dart';

void dateExample() {
  final now = DateTime.now();
  final formatted = DateFormat('yyyy-MM-dd HH:mm').format(now);
  print(formatted);
}

// 使用 CachedNetworkImage 加载网络图片
import 'package:cached_network_image/cached_network_image.dart';

Widget cachedImageExample() {
  return CachedNetworkImage(
    imageUrl: 'https://example.com/image.jpg',
    placeholder: (context, url) => CircularProgressIndicator(),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}

// 使用 FilePicker 选择文件
import 'package:file_picker/file_picker.dart';

Future<void> pickFile() async {
  final result = await FilePicker.platform.pickFiles();
  if (result != null) {
    final file = result.files.single;
    print('File: ${file.name}, Size: ${file.size}');
  }
}

// 使用 PermissionHandler 请求权限
import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermission() async {
  final status = await Permission.camera.request();
  if (status.isGranted) {
    print('Camera permission granted');
  } else if (status.isDenied) {
    print('Camera permission denied');
  } else if (status.isPermanentlyDenied) {
    openAppSettings();
  }
}
```

---

#### 五、常见错误与最佳实践

**常见错误**
1. 在 FutureBuilder 中多次调用 Future（应该在外部创建，传入 future 参数）
2. 不处理网络请求的异常
3. 忘记在网络请求中设置超时
4. SharedPreferences 中存储大量数据（应使用数据库）
5. 未正确处理文件权限

**最佳实践**
```dart
// ✅ 正确：将 Future 定义在 State 的属性中
class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late Future<List<String>> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _futureData,
      builder: (context, snapshot) {
        // ...
      },
    );
  }
}

// ✅ 正确：使用 async/await 处理网络请求
Future<Map<String, dynamic>> fetchUserData(String id) async {
  try {
    final response = await http.get(
      Uri.parse('https://api.example.com/users/$id'),
    ).timeout(Duration(seconds: 10));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw HttpException('Failed with status ${response.statusCode}');
    }
  } on SocketException {
    throw Exception('Network error');
  } on TimeoutException {
    throw Exception('Request timeout');
  } catch (e) {
    throw Exception('Unknown error: $e');
  }
}

// ❌ 错误：每次 build 调用 Future
FutureBuilder<List<String>>(
  future: fetchData(), // 错误！每次都会重新调用
  builder: (context, snapshot) {
    // ...
  },
)
```

---

### 实操（2小时）

#### 实操任务

1. **文件操作应用**
   - 创建文本编辑器，支持保存和读取文件
   - 使用 SharedPreferences 保存最近编辑的文件列表
   - 实现文件删除功能

2. **网络请求应用**
   ```dart
   // 获取免费 API 数据
   // 使用 JSONPlaceholder API
   Future<List<dynamic>> fetchPosts() async {
     final response = await http.get(
       Uri.parse('https://jsonplaceholder.typicode.com/posts'),
     );
     if (response.statusCode == 200) {
       return jsonDecode(response.body);
     } else {
       throw Exception('Failed to load posts');
     }
   }
   ```
   - 显示文章列表
   - 点击查看文章详情
   - 实现刷新功能
   - 添加错误处理

3. **天气应用**
   - 使用公开天气 API
   - 展示当前天气信息
   - 支持城市搜索
   - 使用 FutureBuilder 处理异步加载

4. **TODO 列表应用（持久化存储）**
   ```dart
   class TodoApp extends StatefulWidget {
     @override
     _TodoAppState createState() => _TodoAppState();
   }

   class _TodoAppState extends State<TodoApp> {
     List<String> todos = [];
     final TextEditingController _controller = TextEditingController();

     @override
     void initState() {
       super.initState();
       _loadTodos();
     }

     Future<void> _loadTodos() async {
       final dir = await getApplicationDocumentsDirectory();
       final file = File('${dir.path}/todos.json');
       
       if (await file.exists()) {
         final content = await file.readAsString();
         setState(() {
           todos = List<String>.from(jsonDecode(content));
         });
       }
     }

     Future<void> _saveTodos() async {
       final dir = await getApplicationDocumentsDirectory();
       final file = File('${dir.path}/todos.json');
       await file.writeAsString(jsonEncode(todos));
     }

     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(title: Text('TODO List')),
         body: Column(
           children: [
             Padding(
               padding: EdgeInsets.all(16),
               child: Row(
                 children: [
                   Expanded(
                     child: TextField(
                       controller: _controller,
                       decoration: InputDecoration(
                         hintText: 'Add a new todo',
                         border: OutlineInputBorder(),
                       ),
                     ),
                   ),
                   SizedBox(width: 8),
                   ElevatedButton(
                     onPressed: () {
                       if (_controller.text.isNotEmpty) {
                         setState(() {
                           todos.add(_controller.text);
                           _controller.clear();
                         });
                         _saveTodos();
                       }
                     },
                     child: Text('Add'),
                   ),
                 ],
               ),
             ),
             Expanded(
               child: ListView.builder(
                 itemCount: todos.length,
                 itemBuilder: (context, index) {
                   return ListTile(
                     title: Text(todos[index]),
                     trailing: IconButton(
                       icon: Icon(Icons.delete, color: Colors.red),
                       onPressed: () {
                         setState(() {
                           todos.removeAt(index);
                         });
                         _saveTodos();
                       },
                     ),
                   );
                 },
               ),
             ),
           ],
         ),
       );
     }
   }
   ```

5. **综合案例：新闻应用**
   - 使用 API 获取新闻列表
   - 展示新闻文章
   - 缓存文章数据（使用 SharedPreferences）
   - 实现刷新和加载更多
   - 处理网络错误和超时

---

## 📝 课后作业

### 必做作业

1. **构建文件管理应用**
   - 创建、读取、修改、删除文本文件
   - 显示文件列表
   - 搜索文件功能

2. **开发天气查询应用**
   - 输入城市名称查询天气
   - 使用 FutureBuilder 加载数据
   - 显示当前温度、湿度、风速等
   - 错误提示和加载状态

3. **实现 API 数据展示**
   - 使用 JSONPlaceholder 或其他免费 API
   - 分页加载数据
   - 列表展示和详情查看
   - 刷新功能

4. **完善 TODO 应用**
   - 本地存储待办事项
   - 标记完成/未完成
   - 编辑待办事项
   - 按日期分类

### 选做作业

5. 创建用户注册应用（POST 请求）
6. 实现图片缓存和预加载
7. 开发离线应用（有网络时同步，无网络时使用本地数据）

---

## 📚 学习资源

### 官方文档
- Future：https://api.flutter.dev/flutter/dart-async/Future-class.html
- FutureBuilder：https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html
- StreamBuilder：https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html
- http 包：https://pub.dev/packages/http
- shared_preferences：https://pub.dev/packages/shared_preferences
- path_provider：https://pub.dev/packages/path_provider

### 推荐教程
- Dart 异步编程完全指南
- Flutter 网络请求最佳实践
- 本地存储方案对比

### 免费 API
- JSONPlaceholder：https://jsonplaceholder.typicode.com/
- OpenWeatherMap：https://openweathermap.org/
- REST Countries：https://restcountries.com/

---

## ✅ 学习检查清单

### 知识点检查
- [ ] 理解 Future 和 async/await
- [ ] 能够使用 FutureBuilder 处理异步操作
- [ ] 理解 Stream 和 StreamBuilder
- [ ] 掌握 HTTP 请求方法（GET、POST、PUT、DELETE）
- [ ] 能够处理网络异常和超时
- [ ] 理解 JSON 序列化和反序列化
- [ ] 掌握文件读写操作
- [ ] 能够使用 SharedPreferences 存储数据
- [ ] 了解常用第三方库的使用
- [ ] 理解异步错误处理

### 实战能力检查
- [ ] 能创建调用 API 的应用
- [ ] 能实现数据缓存机制
- [ ] 能处理网络请求的各种状态
- [ ] 能使用 FutureBuilder 优雅地展示异步数据
- [ ] 能集成和使用第三方库
- [ ] 能实现离线应用功能

### 代码质量检查
- [ ] 异常处理完整
- [ ] 网络请求设置了超时
- [ ] FutureBuilder 正确使用
- [ ] 资源正确释放
- [ ] 代码遵循 Dart 命名规范

---

## 🔍 常见问题解答

### Q1：FutureBuilder 为何每次都重新加载？
Future 在每次 build 时如果重新创建就会重新执行。应该将 Future 定义为 State 的属性，在 initState 中初始化。

### Q2：如何处理网络请求超时？
```dart
http.get(url).timeout(Duration(seconds: 10), onTimeout: () {
  throw TimeoutException('Request timeout');
});
```

### Q3：如何避免 JSON 解析错误？
使用 try-catch，或定义模型类并使用 json_serializable。

### Q4：SharedPreferences 适合存储大数据吗？
不适合。大数据应使用数据库（如 sqflite）。

---

**预计完成时间**：4小时课内 + 6小时课外  
**难度等级**：⭐⭐⭐⭐  
**重要程度**：⭐⭐⭐⭐⭐
