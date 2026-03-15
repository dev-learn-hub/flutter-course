# 第7周：Dart Web 开发与 Flutter Web 入门

## 周学习目标
掌握 Dart Web 编程基础，理解 Flutter Web 架构，能创建简单的 Web 应用，为后续移动开发奠基。

---

## 📚 核心内容

### 讲授（2小时）

#### 一、Web 开发基础回顾
- **HTML/CSS/JavaScript 的角色**
  - HTML：结构
  - CSS：样式
  - JavaScript：交互
- **Dart Web 的优势**
  - 强类型语言
  - 编译到 JavaScript
  - 更好的代码组织

#### 二、Dart Web 编程
- **DOM 操作**
  ```dart
  import 'dart:html';
  
  void main() {
    var heading = querySelector('#heading');
    heading?.text = 'Hello Dart!';
    
    querySelector('#btn')?.onClick.listen((_) {
      print('Button clicked');
    });
  }
  ```

- **事件处理**
  ```dart
  var input = querySelector('#input') as InputElement;
  input.onChange.listen((event) {
    print('Input changed: ${input.value}');
  });
  ```

- **创建 DOM 元素**
  ```dart
  var div = DivElement()
    ..className = 'container'
    ..text = 'Content'
    ..style.color = 'blue';
  
  document.body?.append(div);
  ```

#### 三、Dart Web 项目结构
```
my_app/
├── web/
│   ├── index.html
│   ├── styles.css
│   └── main.dart
├── lib/
│   └── app.dart
├── pubspec.yaml
└── README.md
```

#### 四、Flutter Web 概述
- **Flutter Web vs. Dart Web**
  - Flutter Web：使用 Flutter 框架，跨平台一致体验
  - Dart Web：更灵活，接近原生 Web 开发
- **支持的平台**
  - Chrome、Firefox、Safari
  - 响应式设计自适应
- **性能特点**
  - CanvasKit 模式：最佳性能
  - HTML 渲染模式：更小的包大小

#### 五、Flutter Web 应用结构
```
my_flutter_web_app/
├── lib/
│   ├── main.dart
│   └── pages/
├── web/
│   ├── index.html
│   └── favicon.png
├── pubspec.yaml
└── analysis_options.yaml
```

#### 六、Web 调试与部署
- **开发服务器**：`flutter run -d chrome`
- **构建发布版本**：`flutter build web --release`
- **部署选项**
  - 静态托管（GitHub Pages、Netlify）
  - 服务器托管（Firebase、Heroku）

---

### 实操（2小时）

#### 实操任务
1. **Dart Web 项目创建**
   ```bash
   dart create -t web my_dart_web
   cd my_dart_web
   dart pub get
   dart run web dev_server
   ```

2. **创建 Dart Web 应用**
   - HTML 与 Dart 交互
   - 实现简单的计数器

3. **创建 Flutter Web 应用**
   ```bash
   flutter create -p web my_flutter_web
   cd my_flutter_web
   flutter run -d chrome
   ```

4. **Flutter Web 计数器应用**
   - 使用 StatefulWidget
   - 实现加、减、重置功能
   - 响应式设计

5. **实现天气查询 Web 应用**
   - Dart Web 版本
   - Flutter Web 版本
   - 调用天气 API
   - 展示结果

6. **性能测试**
   - 使用 Chrome DevTools
   - 分析编译大小

---

## 📝 课后作业

### 必做作业
1. 创建 Dart Web 计数器应用
2. 创建 Flutter Web 待办事项应用
3. 天气查询 Web 应用（任选 Dart Web 或 Flutter Web）
4. 对比报告：Dart Web vs. Flutter Web vs. 传统 Web 框架

---

## 📚 资源
- Dart Web：https://dart.dev/web
- Flutter Web：https://flutter.dev/docs/get-started/web
- 官方示例：https://github.com/flutter/samples

---

**预计完成时间**：4小时课内 + 5小时课外  
**难度等级**：⭐⭐⭐  
**重要程度**：⭐⭐⭐
