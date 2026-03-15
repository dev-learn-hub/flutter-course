---
layout: default
title: "第12周大纲：Flutter 动画与交互体验"
permalink: /week-12/outline/
---

# 第12周：Flutter 动画与交互体验

## 周学习目标
掌握 Flutter 动画系统，理解 Animation、Curve、Tween 的概念，学会创建 Hero 动画和页面切换动画，实现流畅的用户交互体验。

---

## 📚 核心内容

### 讲授（2小时）

#### 一、动画基础概念

**Animation 类族**
```dart
// Animation 的三个核心属性
Animation<double> animation;
double value = animation.value;        // 当前值
AnimationStatus status = animation.status; // 状态
```

**AnimationStatus 状态机**
```dart
// AnimationStatus 的四个状态
AnimationStatus.dismissed  // 动画在开始
AnimationStatus.forward    // 动画正在向前播放
AnimationStatus.reverse    // 动画正在向后播放
AnimationStatus.completed  // 动画已完成
```

**基本动画示例**
```dart
class SimpleAnimationExample extends StatefulWidget {
  @override
  _SimpleAnimationExampleState createState() => _SimpleAnimationExampleState();
}

class _SimpleAnimationExampleState extends State<SimpleAnimationExample>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    
    // 创建 AnimationController
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this, // TickerProvider
    );

    // 创建 Animation
    _animation = Tween<double>(begin: 0.0, end: 100.0).animate(_controller);

    // 监听动画
    _animation.addListener(() {
      setState(() {});
    });

    // 监听动画状态变化
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Animation')),
      body: Center(
        child: Container(
          width: _animation.value,
          height: _animation.value,
          color: Colors.blue,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.forward();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
```

---

#### 二、Tween 与 Curve

**Tween 类型**
```dart
// 数值 Tween
Tween<double>(begin: 0.0, end: 100.0)

// 颜色 Tween
ColorTween(begin: Colors.blue, end: Colors.red)

// 偏移 Tween
Tween<Offset>(begin: Offset(0, 0), end: Offset(1, 1))

// 自定义 Tween
class CustomTween extends Tween<Size> {
  CustomTween({Size? begin, Size? end}) : super(begin: begin, end: end);

  @override
  Size lerp(double t) {
    return Size(
      begin!.width + (end!.width - begin!.width) * t,
      begin!.height + (end!.height - begin!.height) * t,
    );
  }
}
```

**Curve 曲线**
```dart
// 预定义曲线
_animation = Tween<double>(begin: 0.0, end: 100.0)
    .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

// 常见曲线
Curves.linear        // 线性
Curves.easeIn        // 缓入
Curves.easeOut       // 缓出
Curves.easeInOut     // 缓入缓出
Curves.bounceIn      // 反弹缓入
Curves.bounceOut     // 反弹缓出
Curves.bounceInOut   // 反弹缓入缓出
Curves.elasticIn     // 弹性缓入
Curves.elasticOut    // 弹性缓出
Curves.elasticInOut  // 弹性缓入缓出
```

**Curve 应用示例**
```dart
class CurveComparisonApp extends StatefulWidget {
  @override
  _CurveComparisonAppState createState() => _CurveComparisonAppState();
}

class _CurveComparisonAppState extends State<CurveComparisonApp>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  final List<String> curveNames = [
    'linear', 'easeIn', 'easeOut', 'bounceOut', 'elasticOut'
  ];
  final List<Curve> curves = [
    Curves.linear,
    Curves.easeIn,
    Curves.easeOut,
    Curves.bounceOut,
    Curves.elasticOut,
  ];

  @override
  void initState() {
    super.initState();
    
    _controllers = List.generate(
      curves.length,
      (index) => AnimationController(
        duration: Duration(seconds: 2),
        vsync: this,
      ),
    );

    _animations = List.generate(
      curves.length,
      (index) => Tween<double>(begin: 0.0, end: 300.0).animate(
        CurvedAnimation(parent: _controllers[index], curve: curves[index]),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Curve Comparison')),
      body: ListView.builder(
        itemCount: curves.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(curveNames[index]),
                SizedBox(height: 8),
                AnimatedBuilder(
                  animation: _animations[index],
                  builder: (context, child) {
                    return Container(
                      width: _animations[index].value,
                      height: 50,
                      color: Colors.blue,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (var controller in _controllers) {
            controller.forward();
          }
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
```

---

#### 三、AnimatedBuilder 与 AnimatedWidget

**AnimatedBuilder**
```dart
class FadeInExample extends StatefulWidget {
  @override
  _FadeInExampleState createState() => _FadeInExampleState();
}

class _FadeInExampleState extends State<FadeInExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fade In Animation')),
      body: Center(
        child: AnimatedBuilder(
          animation: _fadeAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: _fadeAnimation.value,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Fading In',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
```

**AnimatedWidget**
```dart
class ScalingWidget extends AnimatedWidget {
  ScalingWidget({
    required Animation<double> animation,
  }) : super(listenable: animation);

  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: animation.value,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
      ),
    );
  }
}

class ScalingAnimationApp extends StatefulWidget {
  @override
  _ScalingAnimationAppState createState() => _ScalingAnimationAppState();
}

class _ScalingAnimationAppState extends State<ScalingAnimationApp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scaling Animation')),
      body: Center(
        child: ScalingWidget(animation: _scaleAnimation),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.forward();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
```

---

#### 四、Hero 动画

**基础 Hero 动画**
```dart
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );
          },
          child: Hero(
            tag: 'image_hero',
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Center(
                child: Text('Tap me'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: Hero(
          tag: 'image_hero',
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
            child: Center(
              child: Text('I grew up!'),
            ),
          ),
        ),
      ),
    );
  }
}
```

**图片 Hero 动画**
```dart
class ImageHeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Gallery')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 6,
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageDetailPage(imageIndex: index),
                ),
              );
            },
            child: Hero(
              tag: 'image_$index',
              child: Container(
                color: Colors.primaries[index % Colors.primaries.length],
                child: Center(
                  child: Text(
                    'Image $index',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ImageDetailPage extends StatelessWidget {
  final int imageIndex;

  ImageDetailPage({required this.imageIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Detail')),
      body: Center(
        child: Hero(
          tag: 'image_$imageIndex',
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.primaries[imageIndex % Colors.primaries.length],
              child: Center(
                child: Text(
                  'Image $imageIndex\nTap to close',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

---

#### 五、页面切换动画

**自定义页面转换**
```dart
class CustomPageRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  CustomPageRoute({required this.builder});

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}

// 使用自定义路由
Navigator.push(context, CustomPageRoute(builder: (context) => NextPage()));
```

**常见页面转换效果**
```dart
// 淡入淡出
class FadePageRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  FadePageRoute({required this.builder});

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}

// 缩放过渡
class ScalePageRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  ScalePageRoute({required this.builder});

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(scale: animation, child: child);
  }
}
```

---

#### 六、隐式动画（Implicit Animation）

**常见隐式动画组件**
```dart
// AnimatedContainer
AnimatedContainer(
  duration: Duration(milliseconds: 500),
  width: _isExpanded ? 300 : 100,
  height: 100,
  color: _isExpanded ? Colors.red : Colors.blue,
  curve: Curves.easeInOut,
)

// AnimatedOpacity
AnimatedOpacity(
  duration: Duration(milliseconds: 300),
  opacity: _isVisible ? 1.0 : 0.0,
  child: Container(width: 100, height: 100, color: Colors.blue),
)

// AnimatedPositioned
AnimatedPositioned(
  duration: Duration(milliseconds: 500),
  left: _isLeft ? 0 : 200,
  top: 100,
  child: Container(width: 100, height: 100, color: Colors.blue),
)

// AnimatedAlign
AnimatedAlign(
  duration: Duration(milliseconds: 500),
  alignment: _isRight ? Alignment.centerRight : Alignment.centerLeft,
  child: Container(width: 100, height: 100, color: Colors.blue),
)

// AnimatedDefaultTextStyle
AnimatedDefaultTextStyle(
  duration: Duration(milliseconds: 500),
  style: _isBold
      ? TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
      : TextStyle(fontSize: 16),
  child: Text('Animated Text'),
)
```

**使用隐式动画的完整示例**
```dart
class ImplicitAnimationExample extends StatefulWidget {
  @override
  _ImplicitAnimationExampleState createState() =>
      _ImplicitAnimationExampleState();
}

class _ImplicitAnimationExampleState extends State<ImplicitAnimationExample> {
  bool _isExpanded = false;
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Implicit Animation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: _isExpanded ? 300 : 100,
              height: _isExpanded ? 300 : 100,
              color: _isExpanded ? Colors.red : Colors.blue,
              curve: Curves.elasticInOut,
              child: Center(
                child: Text(
                  'Tap me',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 32),
            AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: _isVisible ? 1.0 : 0.0,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Toggle',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() => _isExpanded = !_isExpanded);
            },
            child: Icon(Icons.zoom_in),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              setState(() => _isVisible = !_isVisible);
            },
            child: Icon(Icons.visibility),
          ),
        ],
      ),
    );
  }
}
```

---

#### 七、常见错误与最佳实践

**常见错误**
1. 忘记调用 `_controller.dispose()`，导致内存泄漏
2. 在动画中频繁 setState，性能下降
3. 使用过多复杂动画导致 UI 卡顿
4. Hero 标签不唯一
5. 动画时长设置不合理

**最佳实践**
```dart
// ✅ 正确：使用 AnimatedBuilder 避免不必要的 setState
class GoodAnimation extends StatefulWidget {
  @override
  _GoodAnimationState createState() => _GoodAnimationState();
}

class _GoodAnimationState extends State<GoodAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 100).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(width: _animation.value, height: _animation.value);
      },
    );
  }
}

// ❌ 错误：每次动画更新都调用 setState
class BadAnimation extends StatefulWidget {
  @override
  _BadAnimationState createState() => _BadAnimationState();
}

class _BadAnimationState extends State<BadAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _value = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _controller.addListener(() {
      setState(() => _value = _controller.value * 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(width: _value, height: _value);
  }
}
```

---

### 实操（2小时）

#### 实操任务

1. **基础动画演示**
   - 创建方块大小变化动画
   - 方块颜色渐变动画
   - 使用不同的 Curve 对比效果

2. **Hero 动画应用**
   ```dart
   // 列表项点击时的 Hero 动画
   // 点击展开到详情页面
   // 返回时缩小回列表
   ```
   - 创建产品卡片列表
   - 点击卡片展开到详情页
   - 使用 Hero 动画过渡

3. **页面转换动画**
   - 实现自定义页面转换（滑动、淡入等）
   - 创建多个页面通过不同的动画转换
   - 实现页面返回时的反向动画

4. **隐式动画应用**
   - 使用 AnimatedContainer 实现展开/收起效果
   - 使用 AnimatedOpacity 实现淡入淡出
   - 组合多个隐式动画

5. **综合案例：动画登录界面**
   ```dart
   class AnimatedLoginPage extends StatefulWidget {
     @override
     _AnimatedLoginPageState createState() => _AnimatedLoginPageState();
   }

   class _AnimatedLoginPageState extends State<AnimatedLoginPage>
       with TickerProviderStateMixin {
     late AnimationController _fadeController;
     late AnimationController _slideController;
     late Animation<double> _fadeAnimation;
     late Animation<Offset> _slideAnimation;

     @override
     void initState() {
       super.initState();
       
       _fadeController = AnimationController(
         duration: Duration(milliseconds: 500),
         vsync: this,
       );

       _slideController = AnimationController(
         duration: Duration(milliseconds: 800),
         vsync: this,
       );

       _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
           .animate(_fadeController);

       _slideAnimation = Tween<Offset>(
         begin: Offset(0, 0.3),
         end: Offset.zero,
       ).animate(CurvedAnimation(
         parent: _slideController,
         curve: Curves.easeOut,
       ));

       _fadeController.forward();
       _slideController.forward();
     }

     @override
     void dispose() {
       _fadeController.dispose();
       _slideController.dispose();
       super.dispose();
     }

     @override
     Widget build(BuildContext context) {
       return Scaffold(
         body: FadeTransition(
           opacity: _fadeAnimation,
           child: SlideTransition(
             position: _slideAnimation,
             child: Padding(
               padding: EdgeInsets.all(24),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                     'Welcome',
                     style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                   ),
                   SizedBox(height: 32),
                   TextField(
                     decoration: InputDecoration(
                       labelText: 'Email',
                       border: OutlineInputBorder(),
                     ),
                   ),
                   SizedBox(height: 16),
                   TextField(
                     decoration: InputDecoration(
                       labelText: 'Password',
                       border: OutlineInputBorder(),
                     ),
                     obscureText: true,
                   ),
                   SizedBox(height: 32),
                   ElevatedButton(
                     onPressed: () {},
                     child: Text('Login'),
                   ),
                 ],
               ),
             ),
           ),
         ),
       );
     }
   }
   ```

---

## 📝 课后作业

### 必做作业

1. **创建加载动画**
   - 实现自旋转圆形加载动画
   - 实现脉冲加载动画
   - 实现进度条动画

2. **开发 Hero 相册应用**
   - 展示图片网格
   - 点击图片展开到全屏详情
   - 使用 Hero 动画过渡

3. **实现自定义页面转换**
   - 创建至少 3 种页面转换效果（滑动、淡入、缩放）
   - 创建多个导航示例

4. **构建交互卡片组件**
   - 使用隐式动画实现卡片展开/收起
   - 卡片点击时有缩放动画
   - 卡片内容平滑过渡

### 选做作业

5. 创建游戏动画场景（如跳跃、碰撞等）
6. 实现下拉刷新动画
7. 创建复杂的组合动画效果

---

## 📚 学习资源

### 官方文档
- Animation：https://api.flutter.dev/flutter/animation/Animation-class.html
- AnimationController：https://api.flutter.dev/flutter/animation/AnimationController-class.html
- Hero：https://api.flutter.dev/flutter/widgets/Hero-class.html
- Curves：https://api.flutter.dev/flutter/animation/Curves-class.html

### 推荐教程
- Flutter 动画完全指南
- Hero 动画最佳实践
- 性能优化与动画

### 工具
- Flutter Gallery（官方示例应用）
- Animation Inspector（调试工具）

---

## ✅ 学习检查清单

### 知识点检查
- [ ] 理解 Animation 和 AnimationController
- [ ] 掌握 Tween 的使用
- [ ] 理解 Curve 的作用
- [ ] 能够使用 AnimatedBuilder
- [ ] 能够使用 AnimatedWidget
- [ ] 理解 Hero 动画原理
- [ ] 能够创建自定义页面转换
- [ ] 掌握隐式动画组件
- [ ] 理解 AnimationStatus
- [ ] 了解性能优化

### 实战能力检查
- [ ] 能创建基础动画
- [ ] 能实现 Hero 动画
- [ ] 能自定义页面转换
- [ ] 能组合多个动画
- [ ] 能优化动画性能
- [ ] 能处理动画的完整生命周期

### 代码质量检查
- [ ] 正确释放 AnimationController
- [ ] 使用 AnimatedBuilder 避免不必要的 rebuild
- [ ] Hero 标签管理合理
- [ ] 动画时长和曲线设置合理
- [ ] 代码遵循 Flutter 规范

---

## 🔍 常见问题解答

### Q1：如何避免动画卡顿？
使用 AnimatedBuilder 或 AnimatedWidget 避免频繁 setState，保持动画更新隔离。

### Q2：Hero 动画为什么不工作？
确保两个页面中的 Hero 使用相同的 tag，且 tag 在页面内唯一。

### Q3：如何处理复杂的组合动画？
使用 TickerProviderStateMixin 和多个 AnimationController，或使用 Interval 控制时序。

### Q4：动画应该持续多长时间？
遵循 Material Design 规范：简单交互 200-300ms，复杂动画 300-500ms，过渡动画 500-700ms。

---

**预计完成时间**：4小时课内 + 6小时课外  
**难度等级**：⭐⭐⭐⭐⭐  
**重要程度**：⭐⭐⭐⭐⭐
