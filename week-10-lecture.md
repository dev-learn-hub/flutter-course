---
layout: default
title: "第10周讲义：Flutter 常用组件与功能（第一部分）"
permalink: /week-10/lecture/
---

本文为**第10周详细讲义**，侧重 AppBar 配置、Form/TextFormField 与验证、对话框与 BottomSheet、GestureDetector/InkWell 事件处理。课程大纲与目标见 [第10周大纲](../outline/)。

---

## 一、本讲目标与前置知识

- **目标**：掌握 AppBar 的 leading/actions 与自定义；掌握 Form、GlobalKey<FormState>、TextFormField 的 validator/onSaved；会使用 AlertDialog、SimpleDialog、showModalBottomSheet；理解 GestureDetector 与 InkWell 的用法；能运行本课程 [第10周案例](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-10)（components_demo）。
- **前置**：第8周 Flutter 框架基础（Scaffold、AppBar、StatefulWidget）；第9周布局（Column、ListView 等）。  

---

## 二、AppBar 详解

- **基础**：Scaffold 的 `appBar` 接收 AppBar；`title`、`elevation`、`centerTitle` 等。
- **leading**：左侧组件，常用 IconButton(Icons.menu) 作菜单；`onPressed` 中处理点击。
- **actions**：右侧组件列表，如搜索、更多 IconButton；每个需 `onPressed`。
- **自定义**：使用 PreferredSize 指定高度，AppBar 内用 `flexibleSpace` 放渐变 Container 等。本课程 Demo 中为 leading + actions 点击后显示 SnackBar。  

---

## 三、Form 与 TextFormField

- **GlobalKey<FormState>**：在 State 中声明 `final _formKey = GlobalKey<FormState>();`，传给 Form 的 `key`；通过 `_formKey.currentState!.validate()` 触发表单校验、`_formKey.currentState!.save()` 触发所有 onSaved。
- **Form**：包裹多个 TextFormField（或其它表单控件），形成一组可统一校验与保存的输入。
- **TextFormField**：`decoration`（InputDecoration：labelText、hintText、prefixIcon、border）；`validator` 返回 String?，非 null 表示错误文案；`onSaved` 在 save() 时被调用，可把值存到 State 的变量。
- **校验顺序**：先 validate()，全部通过后再 save()，再执行业务逻辑（如提交、SnackBar）。本课程 Demo 为登录表单：用户名 ≥3 字符、密码 ≥6 字符，登录按钮内 validate → save → SnackBar。  

---

## 四、其他表单控件

- **Checkbox / Switch**：`value` 与 `onChanged`，在 onChanged 中 setState 更新状态。
- **Radio**：`value`、`groupValue`、`onChanged`，同一 groupValue 下为一组单选。
- **Slider**：`min`、`max`、`value`、`onChanged`。
- **DropdownButton**：`value`、`items`（DropdownMenuItem 列表）、`onChanged`。  

---

## 五、对话框与 BottomSheet

- **AlertDialog**：`showDialog(context, builder: (ctx) => AlertDialog(title, content, actions))`；actions 中 TextButton 或 ElevatedButton，关闭用 `Navigator.pop(ctx)`；需传结果时 `Navigator.pop(ctx, value)`。
- **SimpleDialog**：类似，children 为 SimpleDialogOption，onPressed 中 Navigator.pop(ctx, value)。
- **自定义 Dialog**：`Dialog(child: ...)` 包裹自定义布局，内部按钮 Navigator.pop 关闭。
- **showModalBottomSheet**：从底部弹出，builder 返回 SafeArea + Column 等；选项用 ListTile，onTap 中 Navigator.pop(ctx)。本课程 Demo 中有 AlertDialog 与 BottomSheet 示例。  

---

## 六、事件处理

- **GestureDetector**：包裹任意子组件，`onTap`、`onLongPress`、`onDoubleTap` 等；无视觉效果，仅响应手势。
- **InkWell**：需在 Material 下使用，有涟漪效果；`onTap`、`onLongPress` 等；常用 borderRadius 与圆角一致。
- **SnackBar**：`ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(...)))`，用于轻提示。本课程 Demo 中 AppBar 按钮、登录成功、Dialog 确定、BottomSheet 选项、GestureDetector/InkWell 点击均会触发 SnackBar。  

---

## 七、运行本课程第10周 Demo

1. 进入 `demos/week-10/demo/components_demo`，执行 `flutter pub get`。
2. 执行 `flutter run`（或 `flutter run -d chrome` 等）。
3. 操作：AppBar 左侧菜单与右侧按钮；填写表单并点击登录（校验不通过会显示错误）；点击 AlertDialog、BottomSheet 按钮并操作；点击 GestureDetector、InkWell 区域观察 SnackBar。
4. 阅读 `lib/main.dart`：_formKey、Form、TextFormField、validator/onSaved、showDialog、showModalBottomSheet、GestureDetector、InkWell、ScaffoldMessenger。  

---

## 八、常见问题与最佳实践

- **Form 必须用 GlobalKey<FormState>**：否则无法在外部调用 validate/save。
- **Dialog 关闭**：务必在适当回调中调用 `Navigator.pop(context)`，否则弹窗无法关闭。
- **FocusNode**：若使用 FocusNode，应在 State 的 dispose 中调用 `focusNode.dispose()`，避免内存泄漏。
- **校验与保存顺序**：先 validate() 再 save()，避免无效数据被保存。  

---

## 九、与大纲、课堂练习的链接

- **大纲**：[第10周大纲](../outline/)。  
- **课堂练习**：[第10周课堂练习](../exercise/)。  
- **案例**：[demos/week-10](https://github.com/dev-learn-hub/flutter-course/tree/main/demos/week-10)。
