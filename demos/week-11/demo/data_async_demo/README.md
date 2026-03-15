# 第11周 数据与异步 Demo

第11周案例：SharedPreferences 存取、http GET、FutureBuilder（loading/error/data）、Future 在 initState 中创建、重新加载。

## 运行

```bash
flutter pub get
flutter run
```

## 说明

- **SharedPreferences**：保存/读取字符串，演示 setString、getString。
- **FutureBuilder**：future 在 initState 中赋值，避免每次 build 重新请求；分支处理 waiting、hasError、hasData。
- **http**：GET jsonplaceholder.typicode.com/posts/1；若失败或非 200 则使用本地 JSON 保证演示可运行。
- **重新加载**：setState 中替换 _futurePost，触发 FutureBuilder 使用新 Future。
- 对应大纲：本地存储、网络请求、FutureBuilder。
