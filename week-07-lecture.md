---
layout: default
title: "第7周讲义：Dart Web 开发与 Flutter Web 入门"
permalink: /week-07/lecture/
---

本文为**第7周详细讲义**，侧重 Dart Web 与 Flutter Web 入门、运行与构建。课程大纲与目标见 [第7周大纲](../outline/)。

---

## 一、本讲目标与前置知识

- **目标**：掌握 Dart Web 与 Flutter Web 的基本概念与项目结构；能创建 Flutter Web 应用并用浏览器运行与构建；能运行本课程 [第7周案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-07)（Flutter Web 计数器）。
- **前置**：第3周 Flutter 环境；第6周异步与网络（便于在 Web 中调用 API）。  

---

## 二、Web 开发基础与 Dart Web 简述

- **HTML/CSS/JS**：结构、样式、交互；Dart Web 使用 dart:html 操作 DOM，编译为 JavaScript。
- **Dart Web 项目**：`dart create -t web 项目名`，目录含 `web/index.html`、`web/main.dart`；运行 `dart run web dev_server` 在浏览器中调试。
- **DOM 操作**：`querySelector('#id')`、`element?.text = '...'`、`onClick.listen(...)`；创建元素如 `DivElement()..text = '...'` 并 `document.body?.append(div)`。  
  本周案例以 Flutter Web 为主，Dart Web 可在大纲与实操中练习。

---

## 三、Flutter Web 概述与结构

- **Flutter Web vs Dart Web**：Flutter Web 使用 Flutter 框架，与移动端同一套代码，跨平台一致；Dart Web 更接近传统 Web 开发，直接操作 DOM。
- **项目结构**：与普通 Flutter 项目相同，含 `lib/main.dart`、`web/index.html`；支持 Chrome、Firefox、Safari。
- **运行**：`flutter run -d chrome` 在 Chrome 中调试；无 Chrome 时可用 `flutter run -d web-server` 再手动打开 URL。
- **构建**：`flutter build web --release`，产物在 `build/web/`，可部署到静态托管（GitHub Pages、Netlify 等）。

---

## 四、运行本课程第7周 Demo

1. 进入 `demos/week-07/demo/flutter_web_counter`，执行 `flutter pub get`。
2. 运行：`flutter run -d chrome`（需已安装 Chrome），或先 `flutter build web --release` 再用本地服务器打开 `build/web/index.html`。
3. 页面为计数器：加、减、重置；对应 StatefulWidget、`setState`、按钮与布局。
4. 阅读 `lib/main.dart`：`CounterPage`（StatefulWidget）、`_CounterPageState`、`_increment`/`_decrement`/`_reset`。

---

## 五、常见问题

- **找不到 Chrome 设备**：安装 Chrome 或使用 `flutter run -d web-server`，按终端提示的 URL 在浏览器打开。
- **build web 很慢**：首次会下载/编译，属正常；可仅做 `flutter pub get` + 代码阅读验证。
- **Dart Web 与 Flutter Web 选哪个**：课程以 Flutter 为主线，建议先掌握 Flutter Web；Dart Web 可作对比了解。

---

## 六、与大纲、课堂练习的链接

- **大纲**：[第7周大纲](../outline/)。  
- **课堂练习**：[第7周课堂练习](../exercise/)。  
- **案例**：[demos/week-07](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-07)。
