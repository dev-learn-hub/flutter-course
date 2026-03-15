# 图书馆管理系统（命令行版）

第5周案例：演示 Dart 类与对象、自定义异常、Library/Book 管理。

## 运行

```bash
dart run bin/main.dart
```

或：`dart run .`

## 说明

- `Book`：书名、作者、ISBN、出版年份；构造函数。
- `Library`：Map 存储图书，addBook、findById、findByAuthor、listAll、removeBook。
- `DuplicateIsbnException`：自定义异常，添加重复 ISBN 时抛出。
- 对应大纲：类与对象、异常处理、图书馆管理项目实践。
