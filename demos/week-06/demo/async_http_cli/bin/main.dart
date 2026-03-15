// 第6周案例：异步 HTTP GET 与 JSON 解析
// 覆盖知识点：Future、async-await、http.get、jsonDecode、fromJson

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  @override
  String toString() => 'Post#$id [$title] (userId: $userId)\n  $body';
}

Future<Post> fetchPost(int id) async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/$id');
  final response = await http.get(
    url,
    headers: {'User-Agent': 'Dart/async_http_cli'},
  ).timeout(const Duration(seconds: 10));

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return Post.fromJson(json);
  }
  // 若 API 不可用（如 403/网络限制），用本地 JSON 演示 fromJson，保证可运行
  final fallback = '{"id":$id,"userId":1,"title":"Demo post (API unreachable)","body":"JSON 解析与 fromJson 演示。"}';
  return Post.fromJson(jsonDecode(fallback) as Map<String, dynamic>);
}

Future<void> main() async {
  print('--- 请求 JSONPlaceholder post id=1 ---');
  try {
    final post = await fetchPost(1);
    print(post);
  } on TimeoutException catch (e) {
    print('超时: $e');
  } catch (e) {
    print('错误: $e');
  }

  print('\n--- 请求 post id=2 ---');
  try {
    final post = await fetchPost(2);
    print(post);
  } catch (e) {
    print('错误: $e');
  }
}
