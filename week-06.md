# 第6周：Dart 异步编程与网络请求

## 周学习目标
理解异步编程模型，掌握 Future、async-await 语法，学会网络请求和数据解析，能编写实际的服务端程序。

---

## 📚 核心内容

### 讲授（2小时）

#### 一、异步编程基础
- **同步 vs. 异步**
  - 同步：阻塞，一步接一步
  - 异步：非阻塞，并发执行
- **Future 介绍**
  ```dart
  Future<String> fetchData() {
    return Future.delayed(Duration(seconds: 2), () => 'Data loaded');
  }
  
  fetchData().then((data) {
    print('Received: $data');
  }).catchError((error) {
    print('Error: $error');
  });
  ```

#### 二、async-await 语法糖
```dart
Future<void> loadData() async {
  try {
    String data = await fetchData();
    print('Data: $data');
  } catch (e) {
    print('Error: $e');
  }
}
```
- **await 的作用**：暂停函数执行直到 Future 完成
- **async 的作用**：声明异步函数，返回 Future

#### 三、Stream 流
```dart
Stream<int> countStream() async* {
  for (int i = 0; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;  // 产生值
  }
}

countStream().listen((value) {
  print('Received: $value');
});
```

#### 四、网络请求
- **HTTP 库**
  ```dart
  import 'package:http/http.dart' as http;
  
  Future<String> fetchPost(int id) async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
    );
    
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load post');
    }
  }
  ```

- **POST 请求**
  ```dart
  Future<void> createPost(String title) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'title': title, 'body': 'Content', 'userId': 1}),
    );
    print('Status code: ${response.statusCode}');
  }
  ```

#### 五、JSON 数据处理
```dart
import 'dart:convert';

class Post {
  int id;
  String title;
  String body;
  
  Post({required this.id, required this.title, required this.body});
  
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

// 解析 JSON
String jsonString = '{"id": 1, "title": "Hello", "body": "Content"}';
Map<String, dynamic> jsonMap = jsonDecode(jsonString);
Post post = Post.fromJson(jsonMap);
```

#### 六、dio 库高级用法
```dart
final dio = Dio();
dio.options.baseUrl = 'https://api.example.com';
dio.options.connectTimeout = Duration(seconds: 10);

// 拦截器
dio.interceptors.add(
  InterceptorsWrapper(
    onRequest: (options, handler) {
      print('Request: ${options.path}');
      return handler.next(options);
    },
    onResponse: (response, handler) {
      print('Response: ${response.statusCode}');
      return handler.next(response);
    },
  ),
);

final response = await dio.get('/users');
```

#### 七、错误处理与超时控制
```dart
try {
  final response = await http.get(
    Uri.parse('https://api.example.com/data'),
  ).timeout(Duration(seconds: 10));
} on TimeoutException {
  print('Request timeout');
} on SocketException {
  print('No internet connection');
} catch (e) {
  print('Error: $e');
}
```

### 实操（2小时）

#### 实操任务
1. 使用 `http` 库进行 GET 请求
2. 使用 `http` 库进行 POST 请求
3. 解析 JSON 数据并转换为 Dart 对象
4. 编写 HTTP 服务器程序
   ```dart
   import 'package:shelf/shelf.dart';
   import 'package:shelf/shelf_io.dart' as shelf_io;
   
   Future<void> main() async {
     var handler = const Pipeline()
       .addMiddleware(logRequests())
       .addHandler(_echoRequest);
     
     var server = await shelf_io.serve(handler, 'localhost', 8080);
     print('Server running on http://localhost:8080');
   }
   
   Response _echoRequest(Request request) {
     return Response.ok('Hello World');
   }
   ```
5. 处理错误和异常
6. 实现带超时控制的网络请求

---

## 📝 课后作业

### 必做作业
1. 仿写教材第 8 章示例程序
2. 编写天气数据获取程序
   - 调用公开天气 API
   - 解析 JSON 数据
   - 显示温度、湿度、风速等
3. 编写 HTTP 服务器程序
   - 实现基本的路由（GET /、GET /users/:id、POST /users）
   - 返回 JSON 数据
   - 包含错误处理
4. 实验报告

---

## 📚 资源
- http 包：https://pub.dev/packages/http
- dio 包：https://pub.dev/packages/dio
- shelf 包：https://pub.dev/packages/shelf
- JSONPlaceholder API：https://jsonplaceholder.typicode.com

---

**预计完成时间**：4小时课内 + 6小时课外  
**难度等级**：⭐⭐⭐⭐  
**重要程度**：⭐⭐⭐⭐⭐
