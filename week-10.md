# 第10周：Flutter 常用组件与功能（第一部分）

## 周学习目标
掌握 Flutter 中常用的高级组件（AppBar、表单、对话框等），理解事件处理机制，能构建功能完整的用户界面。

---

## 📚 核心内容

### 讲授（2小时）

#### 一、AppBar 组件详解

**基础 AppBar**
```dart
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        elevation: 4.0,
        centerTitle: true,
      ),
      body: Center(child: Text('Welcome')),
    );
  }
}
```

**高级 AppBar 配置**
```dart
AppBar(
  title: Text('Advanced AppBar'),
  leading: IconButton(
    icon: Icon(Icons.menu),
    onPressed: () => print('Menu'),
  ),
  actions: [
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () => print('Search'),
    ),
    IconButton(
      icon: Icon(Icons.more_vert),
      onPressed: () => print('More'),
    ),
  ],
  backgroundColor: Colors.blue,
  foregroundColor: Colors.white,
  elevation: 8.0,
  shadowColor: Colors.grey,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
  ),
)
```

**自定义 AppBar**
```dart
PreferredSize(
  preferredSize: Size.fromHeight(100.0),
  child: AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple],
        ),
      ),
      child: Center(
        child: Text('Custom AppBar', style: TextStyle(fontSize: 24)),
      ),
    ),
  ),
)
```

---

#### 二、表单（Form）组件

**Form 基础架构**
```dart
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
              hintText: 'Enter your username',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter username';
              }
              if (value!.length < 3) {
                return 'Username must be at least 3 characters';
              }
              return null;
            },
            onSaved: (value) => _username = value,
          ),
          SizedBox(height: 16),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter password';
              }
              if (value!.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
            onSaved: (value) => _password = value,
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                print('Username: $_username, Password: $_password');
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
```

**TextFormField 详解**
```dart
TextFormField(
  controller: _controller,
  keyboardType: TextInputType.emailAddress,
  textInputAction: TextInputAction.next,
  maxLength: 50,
  maxLines: 1,
  minLines: 1,
  decoration: InputDecoration(
    labelText: 'Email',
    hintText: 'user@example.com',
    helperText: 'We will never share your email',
    errorText: 'Invalid email', // 条件赋值
    prefixIcon: Icon(Icons.email),
    suffixIcon: Icon(Icons.clear),
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    filled: true,
    fillColor: Colors.grey[100],
  ),
  onChanged: (value) => print('Input: $value'),
  onSaved: (value) => print('Saved: $value'),
  validator: (value) {
    if (value?.isEmpty ?? true) return 'Field is required';
    if (!value!.contains('@')) return 'Invalid email';
    return null;
  },
)
```

**其他表单控件**
```dart
// Checkbox
Checkbox(
  value: _isChecked,
  onChanged: (value) {
    setState(() => _isChecked = value!);
  },
)

// Radio
Radio<String>(
  value: 'option1',
  groupValue: _selectedOption,
  onChanged: (value) {
    setState(() => _selectedOption = value!);
  },
)

// Switch
Switch(
  value: _isSwitched,
  onChanged: (value) {
    setState(() => _isSwitched = value);
  },
)

// Slider
Slider(
  min: 0,
  max: 100,
  value: _sliderValue,
  onChanged: (value) {
    setState(() => _sliderValue = value);
  },
)

// DropdownButton
DropdownButton<String>(
  value: _selectedValue,
  items: [
    DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
    DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
    DropdownMenuItem(value: 'Option 3', child: Text('Option 3')),
  ],
  onChanged: (value) {
    setState(() => _selectedValue = value!);
  },
)
```

---

#### 三、对话框（Dialog）

**AlertDialog**
```dart
showDialog(
  context: context,
  builder: (context) {
    return AlertDialog(
      title: Text('Confirm Action'),
      content: Text('Are you sure you want to proceed?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            print('Confirmed');
          },
          child: Text('Confirm'),
        ),
      ],
    );
  },
);
```

**SimpleDialog**
```dart
showDialog(
  context: context,
  builder: (context) {
    return SimpleDialog(
      title: Text('Choose an option'),
      children: [
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, 'Option 1');
          },
          child: Text('Option 1'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, 'Option 2');
          },
          child: Text('Option 2'),
        ),
      ],
    );
  },
);
```

**自定义 Dialog**
```dart
showDialog(
  context: context,
  builder: (context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Custom Dialog', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter text',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  },
);
```

**BottomSheet**
```dart
showModalBottomSheet(
  context: context,
  builder: (context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.camera),
            title: Text('Take a photo'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.photo_library),
            title: Text('Choose from gallery'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.clear),
            title: Text('Cancel'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  },
);
```

---

#### 四、事件处理机制

**手势识别（GestureDetector）**
```dart
GestureDetector(
  onTap: () => print('Tapped'),
  onDoubleTap: () => print('Double tapped'),
  onLongPress: () => print('Long pressed'),
  onPanUpdate: (details) {
    print('Position: ${details.globalPosition}');
  },
  onPanEnd: (details) {
    print('Velocity: ${details.velocity}');
  },
  child: Container(
    width: 100,
    height: 100,
    color: Colors.blue,
    child: Center(child: Text('Tap me')),
  ),
)
```

**InkWell 涟漪效果**
```dart
InkWell(
  onTap: () => print('Tapped with ripple'),
  onLongPress: () => print('Long pressed'),
  onHover: (isHovering) => print('Hovering: $isHovering'),
  splashColor: Colors.blue.withOpacity(0.5),
  highlightColor: Colors.blue.withOpacity(0.3),
  child: Container(
    padding: EdgeInsets.all(16),
    child: Text('Tap me with ripple effect'),
  ),
)
```

**焦点和输入事件**
```dart
class FocusExample extends StatefulWidget {
  @override
  _FocusExampleState createState() => _FocusExampleState();
}

class _FocusExampleState extends State<FocusExample> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      print('Focus gained');
    } else {
      print('Focus lost');
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      decoration: InputDecoration(labelText: 'Focus Test'),
    );
  }
}
```

**键盘事件**
```dart
RawKeyboardListener(
  focusNode: FocusNode(),
  onKey: (event) {
    if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
      print('Enter pressed');
    }
  },
  child: Text('Press a key'),
)
```

---

#### 五、常见错误与最佳实践

**常见错误**
1. 忘记在 TextFormField 中使用 validator
2. Dialog 不正确使用 Navigator.pop
3. 事件处理中内存泄漏（未释放 FocusNode）
4. AppBar 中放置过多操作按钮导致界面拥挤

**最佳实践**
```dart
// ✅ 正确：使用 GlobalKey 管理 Form 状态
class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: // ...
    );
  }
}

// ❌ 错误：没有 GlobalKey
class BadForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: // 无法访问表单状态
    );
  }
}
```

---

### 实操（2小时）

#### 实操任务

1. **创建自定义 AppBar**
   - 带有渐变背景的 AppBar
   - 左侧菜单按钮，右侧多个操作按钮
   - 实现按钮的点击事件

2. **构建用户登录表单**
   - 用户名输入框（验证长度 ≥ 3）
   - 密码输入框（验证长度 ≥ 6）
   - 记住密码 Checkbox
   - 登录按钮（提交表单）
   - 表单验证并显示错误信息

3. **实现对话框系统**
   - AlertDialog 确认对话框
   - CustomDialog 带输入框的对话框
   - BottomSheet 菜单选择

4. **开发事件处理演示**
   - GestureDetector 捕捉多种手势
   - InkWell 实现涟漪效果按钮
   - FocusNode 处理焦点变化

5. **综合案例：用户资料编辑应用**
   ```dart
   class UserProfileEdit extends StatefulWidget {
     @override
     _UserProfileEditState createState() => _UserProfileEditState();
   }

   class _UserProfileEditState extends State<UserProfileEdit> {
     final _formKey = GlobalKey<FormState>();
     String? _name;
     String? _email;
     String? _bio;
     bool _newsletter = false;

     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(
           title: Text('Edit Profile'),
           actions: [
             IconButton(
               icon: Icon(Icons.check),
               onPressed: _submitForm,
             ),
           ],
         ),
         body: Form(
           key: _formKey,
           child: ListView(
             padding: EdgeInsets.all(16),
             children: [
               TextFormField(
                 decoration: InputDecoration(
                   labelText: 'Full Name',
                   prefixIcon: Icon(Icons.person),
                   border: OutlineInputBorder(),
                 ),
                 validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                 onSaved: (value) => _name = value,
               ),
               SizedBox(height: 16),
               TextFormField(
                 decoration: InputDecoration(
                   labelText: 'Email',
                   prefixIcon: Icon(Icons.email),
                   border: OutlineInputBorder(),
                 ),
                 keyboardType: TextInputType.emailAddress,
                 validator: (value) {
                   if (value?.isEmpty ?? true) return 'Required';
                   if (!value!.contains('@')) return 'Invalid email';
                   return null;
                 },
                 onSaved: (value) => _email = value,
               ),
               SizedBox(height: 16),
               TextFormField(
                 decoration: InputDecoration(
                   labelText: 'Bio',
                   prefixIcon: Icon(Icons.description),
                   border: OutlineInputBorder(),
                 ),
                 maxLines: 3,
                 onSaved: (value) => _bio = value,
               ),
               SizedBox(height: 16),
               CheckboxListTile(
                 title: Text('Subscribe to newsletter'),
                 value: _newsletter,
                 onChanged: (value) {
                   setState(() => _newsletter = value!);
                 },
               ),
               SizedBox(height: 24),
               ElevatedButton(
                 onPressed: _submitForm,
                 child: Text('Save Changes'),
               ),
             ],
           ),
         ),
       );
     }

     void _submitForm() {
       if (_formKey.currentState!.validate()) {
         _formKey.currentState!.save();
         print('Name: $_name, Email: $_email, Bio: $_bio');
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text('Profile updated successfully')),
         );
       }
     }
   }
   ```

---

## 📝 课后作业

### 必做作业

1. **创建自定义登录界面**
   - AppBar 自定义样式
   - 表单验证（邮箱格式、密码强度）
   - 记住密码功能
   - 提交后显示成功提示

2. **开发用户反馈表单**
   - 多个 TextFormField（名称、邮箱、反馈内容）
   - 评分 Slider（1-5）
   - 类别 DropdownButton（Bug、功能建议、其他）
   - 是否推荐 Radio
   - 提交表单并验证

3. **实现弹窗系统**
   - AlertDialog 确认操作
   - 自定义 Dialog 带表单
   - BottomSheet 菜单
   - SnackBar 提示信息

4. **事件处理演示应用**
   - 创建可拖拽的方块（使用 GestureDetector）
   - 双击、长按、单击的不同响应
   - 检测键盘事件并处理

### 选做作业

5. 创建完整的用户注册流程（多步表单）
6. 实现表单自动保存草稿功能
7. 创建自定义组件库（复用表单元素）

---

## 📚 学习资源

### 官方文档
- AppBar：https://api.flutter.dev/flutter/material/AppBar-class.html
- Form 和 TextFormField：https://api.flutter.dev/flutter/widgets/Form-class.html
- Dialog：https://api.flutter.dev/flutter/material/AlertDialog-class.html
- GestureDetector：https://api.flutter.dev/flutter/widgets/GestureDetector-class.html

### 推荐教程
- Flutter 表单处理完全指南
- Material Design 设计规范
- 事件处理最佳实践

### 代码示例
- [Flutter 官方示例](https://github.com/flutter/samples)
- Form 验证示例
- Dialog 和 BottomSheet 实现

---

## ✅ 学习检查清单

### 知识点检查
- [ ] 能够创建和自定义 AppBar
- [ ] 理解 Form 和 TextFormField 的关系
- [ ] 掌握表单验证方法
- [ ] 能够使用 Checkbox、Radio、Switch
- [ ] 能够创建和使用各类对话框
- [ ] 理解 Dialog、AlertDialog、SimpleDialog 的区别
- [ ] 能够使用 BottomSheet
- [ ] 理解 GestureDetector 的各种事件
- [ ] 能够处理焦点和键盘事件
- [ ] 了解内存泄漏风险（FocusNode）

### 实战能力检查
- [ ] 能创建带验证的登录表单
- [ ] 能实现多种对话框交互
- [ ] 能处理复杂的手势事件
- [ ] 能设计友好的表单界面
- [ ] 能调试事件处理问题

### 代码质量检查
- [ ] 表单使用了 GlobalKey<FormState>
- [ ] 验证规则合理且清晰
- [ ] Dialog 正确处理返回值
- [ ] 资源正确释放（如 FocusNode）
- [ ] 代码遵循 Flutter 命名规范

---

## 🔍 常见问题解答

### Q1：如何验证邮箱格式？
```dart
validator: (value) {
  const pattern = r'^[^@]+@[^@]+\.[^@]+$';
  final regex = RegExp(pattern);
  if (!regex.hasMatch(value ?? '')) {
    return 'Invalid email format';
  }
  return null;
}
```

### Q2：Form 中多个字段如何分别处理？
```dart
// 通过 onSaved 保存每个字段
TextFormField(
  onSaved: (value) => _fieldName = value,
),
// 调用 save() 触发所有 onSaved
_formKey.currentState?.save();
```

### Q3：如何实现自定义验证？
```dart
validator: (value) {
  // 自定义验证逻辑
  if (_isUsernameTaken(value)) {
    return 'Username already taken';
  }
  return null;
}
```

### Q4：FocusNode 为何需要手动释放？
FocusNode 是一个资源，未释放会导致内存泄漏。必须在 dispose() 中调用 dispose()。

---

**预计完成时间**：4小时课内 + 6小时课外  
**难度等级**：⭐⭐⭐⭐  
**重要程度**：⭐⭐⭐⭐⭐
