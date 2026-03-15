# 第10周知识点体系大纲

> 本周主题与目标（一句话）：掌握 AppBar 配置与自定义、Form/TextFormField 与验证、对话框与 BottomSheet、GestureDetector/InkWell 事件处理，能构建带表单与弹窗的完整界面。

---

## 一、AppBar 详解

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| 基础 AppBar | title、elevation、centerTitle | 使用 Scaffold.appBar 并配置标题与样式 |
| leading / actions | 左侧按钮、右侧按钮列表 | 添加菜单、搜索、更多等 IconButton |
| 自定义 AppBar | PreferredSize、flexibleSpace、渐变 | 实现渐变或自定义高度的 AppBar |

---

## 二、Form 与 TextFormField

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| GlobalKey<FormState> | 用于在外部调用 validate/save | 在 State 中声明 _formKey 并传给 Form |
| Form + TextFormField | 表单容器与输入项 | 用 Form 包裹多个 TextFormField |
| validator / onSaved | 校验与保存回调 | 编写 validator 返回错误文案、onSaved 保存值 |
| InputDecoration | labelText、hintText、prefixIcon、border | 配置输入框外观与边框状态 |

---

## 三、其他表单控件

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| Checkbox / Switch | 布尔选择 | 用 value + onChanged 绑定状态 |
| Radio | 单选 | 用 groupValue + value + onChanged |
| Slider | 滑动选择数值 | 设置 min/max/value/onChanged |
| DropdownButton | 下拉选择 | 提供 items 与 onChanged |

---

## 四、对话框与 BottomSheet

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| AlertDialog | 标题、内容、actions | 使用 showDialog + AlertDialog，用 Navigator.pop 关闭 |
| SimpleDialog | 选项列表 | 使用 SimpleDialogOption 并 Navigator.pop(context, value) |
| 自定义 Dialog | Dialog + 自定义内容 | 用 Dialog 包裹 Column 等实现自定义弹窗 |
| showModalBottomSheet | 底部弹出 | 使用 showModalBottomSheet 并 Navigator.pop 关闭 |

---

## 五、事件处理

| 知识点 | 简要说明 | 学生应能… |
|--------|----------|-----------|
| GestureDetector | onTap、onLongPress、onDoubleTap 等 | 为任意子组件添加点击、长按等手势 |
| InkWell | 带涟漪效果的点击区域 | 在 Material 下使用 InkWell 替代 GestureDetector 获得水波纹 |
| FocusNode | 焦点管理 | 为 TextField 设置 focusNode，在 dispose 中释放 |
| SnackBar | 轻提示 | 使用 ScaffoldMessenger.of(context).showSnackBar 显示提示 |

---

## 六、与本周 Demo / 课堂练习的对应

- **Demo**（`demos/week-10/demo/components_demo`）：自定义 AppBar（leading/actions）、简单登录 Form（用户名/密码、validator、onSaved）、AlertDialog 与 BottomSheet、GestureDetector/InkWell 示例、SnackBar；对应大纲「AppBar、Form、Dialog、事件处理」。
- **课堂练习**（`week-10-exercise.md`）：当堂任务对应上述主块中的 2～3 个，验收与大纲一致。
