# 第11周知识点体系大纲

> 本周主题与目标（一句话）：掌握本地存储（SharedPreferences）、网络请求（http）、FutureBuilder 正确用法，能集成常用第三方库并处理异步与错误。

---

## 一、文件操作与 path_provider

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| path_provider | getApplicationDocumentsDirectory、getTemporaryDirectory | 获取应用文档/临时目录路径 |
| File 读写 | readAsString、writeAsString、exists、delete | 在应用目录下读写、删除文件 |
| JSON 文件 | jsonEncode、jsonDecode、toJson/fromJson | 将对象列表保存为 JSON 文件并读回 |

---

## 二、SharedPreferences

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| getInstance | SharedPreferences.getInstance() | 异步获取实例后 set/get |
| set/get | setString、getString、setInt、getInt、setBool、getBool | 存取简单键值对 |
| remove / clear | 删除键、清空全部 | 按需清除数据 |
| 适用场景 | 配置、简单状态；不适合大数据 | 知道何时用 SharedPreferences、何时用文件/数据库 |

---

## 三、网络请求与 http

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| GET 请求 | http.get(Uri.parse(url)) | 发起 GET 并读取 response.body、statusCode |
| timeout | .timeout(Duration(seconds: n)) | 设置超时并处理 TimeoutException |
| 错误处理 | statusCode 200/404/401、try-catch | 根据状态码与异常给出提示或重试 |
| POST/JSON | http.post、body: jsonEncode(map)、headers | 发送 JSON 请求体 |
| jsonDecode | dart:convert、response.body | 将响应体解析为 Map/List |

---

## 四、FutureBuilder

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| future 参数 | 传入 Future，不在 builder 内创建 | 避免每次 build 重新请求（在 initState 或 State 字段中创建） |
| ConnectionState | waiting、done | 在 builder 中根据 connectionState 显示加载/完成 |
| snapshot.hasError / hasData | 错误与数据分支 | 显示错误 UI 或数据列表/详情 |
| 刷新 | 新 Future 赋给 State 变量并 setState | 实现「重新加载」而不重复创建 Future |

---

## 五、StreamBuilder（可选）

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| stream 参数 | 传入 Stream | 与 FutureBuilder 类似，处理多次数据 |
| snapshot.data 变化 | 每次事件触发 builder | 展示流式数据（如计时、进度） |

---

## 六、第三方库集成

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| pubspec.yaml | dependencies: http: ^x.x、shared_preferences: ^x.x | 添加依赖并 flutter pub get |
| 使用方式 | import、调用 API | 使用 http、shared_preferences、path_provider 等 |
| 版本与文档 | pub.dev、CHANGELOG | 查版本约束与迁移说明 |

---

## 七、常见错误与最佳实践

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| FutureBuilder 重复请求 | future 在 build 中创建会每次重建 | 将 Future 存于 State 或在 initState 中初始化 |
| 网络超时与异常 | timeout、try-catch、用户提示 | 设置超时并友好提示网络错误 |
| SharedPreferences 不存大数据 | 大量数据用文件或数据库 | 合理选择存储方式 |

---

## 八、与本周 Demo / 课堂练习的对应

- **Demo**（`demos/week-11/demo/data_async_demo`）：SharedPreferences 存取、http GET（JSONPlaceholder 单条或列表）、FutureBuilder（loading/error/data）、Future 在 initState 中创建；对应大纲「本地存储、网络请求、FutureBuilder」。
- **课堂练习**（`week-11-exercise.md`）：当堂任务对应上述主块中的 2～3 个，验收与大纲一致。
