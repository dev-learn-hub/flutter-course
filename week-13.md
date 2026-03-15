# 第13周：Flutter 应用架构与状态管理

## 周学习目标
理解 Flutter 应用架构设计，掌握多种状态管理方案（Provider、GetX、Bloc），学会在实际项目中选择和应用合适的架构模式。

---

## 📚 核心内容

### 讲授（2小时）

#### 一、应用架构基础

**经典 MVC 架构**
```
┌─────────────────────────────────┐
│          View (UI)              │
│    (Flutter Widgets)            │
└────────────┬────────────────────┘
             │
             ↓
┌─────────────────────────────────┐
│       Controller (Logic)         │
│   (状态管理和事件处理)           │
└────────────┬────────────────────┘
             │
             ↓
┌─────────────────────────────────┐
│         Model (Data)            │
│    (业务逻辑和数据处理)          │
└─────────────────────────────────┘
```

**MVP 架构（推荐）**
```
┌─────────────────────────────────┐
│          View (UI)              │
└────────────┬────────────────────┘
             │ (回调事件)
             ↓
┌─────────────────────────────────┐
│      Presenter (Mediator)       │
│    (处理 UI 和 Model 交互)       │
└────────────┬────────────────────┘
             │
             ↓
┌─────────────────────────────────┐
│         Model (Data)            │
│    (业务逻辑和数据处理)          │
└─────────────────────────────────┘
```

**MVVM 架构**
```
┌─────────────────────────────────┐
│          View (UI)              │
│         Data Binding            │
└────────────┬────────────────────┘
             │ (双向绑定)
             ↓
┌─────────────────────────────────┐
│      ViewModel (State)          │
│    (暴露状态和方法给 View)       │
└────────────┬────────────────────┘
             │
             ↓
┌─────────────────────────────────┐
│         Model (Domain)          │
│    (业务逻辑和数据处理)          │
└─────────────────────────────────┘
```

**分层架构**
```
┌────────────────────────────────────┐
│    Presentation Layer (UI)         │
│  - Widgets                         │
│  - Pages                           │
│  - Components                      │
└────────────┬───────────────────────┘
             │
┌────────────▼───────────────────────┐
│    Business Logic Layer            │
│  - State Management                │
│  - Controllers                     │
│  - Bloc/Providers                  │
└────────────┬───────────────────────┘
             │
┌────────────▼───────────────────────┐
│    Data Layer                      │
│  - Repositories                    │
│  - Data Sources                    │
│  - Models                          │
└────────────┬───────────────────────┘
             │
┌────────────▼───────────────────────┐
│    Infrastructure Layer            │
│  - API Clients                     │
│  - Database                        │
│  - External Services               │
└────────────────────────────────────┘
```

---

#### 二、Provider 状态管理

**Provider 基础**

首先在 `pubspec.yaml` 中添加：
```yaml
dependencies:
  provider: ^6.0.0
```

**ChangeNotifier 模式**
```dart
// Model
class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

// 使用 Provider
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 直接访问状态
            Text(
              'Count: ${context.watch<Counter>().count}',
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<Counter>().decrement(),
                  child: Text('-'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => context.read<Counter>().increment(),
                  child: Text('+'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => context.read<Counter>().reset(),
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```

**多个 Provider**
```dart
class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}

class ThemeProvider with ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

// 使用多个 Provider
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Counter()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}
```

**Selector 优化性能**
```dart
// 只监听 counter 的变化，不监听其他属性
Consumer<Counter>(
  builder: (context, counter, child) {
    return Text('Count: ${counter.count}');
  },
)

// 或使用 Selector，更灵活
Selector<Counter, int>(
  selector: (context, counter) => counter.count,
  builder: (context, count, child) {
    return Text('Count: $count');
  },
)
```

**FutureProvider**
```dart
class DataService {
  Future<List<String>> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    return ['Item 1', 'Item 2', 'Item 3'];
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataService(),
      child: MyApp(),
    ),
  );
}

class DataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureProvider<List<String>>(
        create: (context) => context.read<DataService>().fetchData(),
        initialData: [],
        builder: (context, child) {
          final data = context.watch<List<String>>();
          if (data.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(data[index]));
            },
          );
        },
      ),
    );
  }
}
```

---

#### 三、GetX 状态管理

**GetX 基础**

在 `pubspec.yaml` 中添加：
```yaml
dependencies:
  get: ^4.6.5
```

**Simple Counter 示例**
```dart
import 'package:get/get.dart';

// Controller
class CounterController extends GetxController {
  final RxInt count = 0.obs;

  void increment() {
    count.value++;
  }

  void decrement() {
    count.value--;
  }

  void reset() {
    count.value = 0;
  }
}

// View
class CounterPage extends StatelessWidget {
  final controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              'Count: ${controller.count.value}',
              style: TextStyle(fontSize: 32),
            )),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: controller.increment,
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

// 应用入口
void main() {
  runApp(
    GetMaterialApp(
      home: CounterPage(),
    ),
  );
}
```

**GetX 路由导航**
```dart
// 导航到新页面
Get.to(NextPage());

// 带参数导航
Get.to(
  DetailPage(),
  arguments: {'id': 123},
);

// 获取参数
class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final id = args['id'];
    return Scaffold(
      body: Center(child: Text('ID: $id')),
    );
  }
}

// 返回上一页
Get.back();

// 清空所有路由后返回
Get.offAll(HomePage());
```

**GetX 服务和生命周期**
```dart
class ApiService extends GetxService {
  Future<ApiService> init() async {
    // 初始化 API 服务
    await Future.delayed(Duration(seconds: 1));
    print('API Service initialized');
    return this;
  }

  Future<List<String>> fetchData() async {
    // 模拟 API 请求
    await Future.delayed(Duration(seconds: 1));
    return ['Item 1', 'Item 2', 'Item 3'];
  }
}

// 在 main 中初始化服务
Future<void> main() async {
  await initServices();
  runApp(MyApp());
}

Future<void> initServices() async {
  print('Starting services ...');
  await Get.putAsync<ApiService>(() => ApiService().init());
  print('All services started');
}
```

---

#### 四、Bloc 状态管理

**Bloc 基础**

在 `pubspec.yaml` 中添加：
```yaml
dependencies:
  flutter_bloc: ^8.1.0
  bloc: ^8.1.0
```

**简单的 Bloc 示例**
```dart
// Events
abstract class CounterEvent {}

class IncrementPressed extends CounterEvent {}

class DecrementPressed extends CounterEvent {}

class ResetPressed extends CounterEvent {}

// States
abstract class CounterState {}

class CounterInitial extends CounterState {
  final int count;
  CounterInitial(this.count);
}

class CounterUpdated extends CounterState {
  final int count;
  CounterUpdated(this.count);
}

// Bloc
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int _count = 0;

  CounterBloc() : super(CounterInitial(0)) {
    on<IncrementPressed>((event, emit) {
      _count++;
      emit(CounterUpdated(_count));
    });

    on<DecrementPressed>((event, emit) {
      _count--;
      emit(CounterUpdated(_count));
    });

    on<ResetPressed>((event, emit) {
      _count = 0;
      emit(CounterUpdated(0));
    });
  }
}

// UI
class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bloc Counter')),
      body: BlocProvider(
        create: (context) => CounterBloc(),
        child: CounterView(),
      ),
    );
  }
}

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              int count = 0;
              if (state is CounterInitial) {
                count = state.count;
              } else if (state is CounterUpdated) {
                count = state.count;
              }
              return Text(
                'Count: $count',
                style: TextStyle(fontSize: 32),
              );
            },
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () =>
                    context.read<CounterBloc>().add(DecrementPressed()),
                child: Text('-'),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () =>
                    context.read<CounterBloc>().add(IncrementPressed()),
                child: Text('+'),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () =>
                    context.read<CounterBloc>().add(ResetPressed()),
                child: Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

**复杂的 Bloc：用户认证**
```dart
// Events
abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String username;
  final String password;
  LoginRequested(this.username, this.password);
}

class LogoutRequested extends AuthEvent {}

class CheckAuthStatusRequested extends AuthEvent {}

// States
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String username;
  AuthSuccess(this.username);
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}

class AuthLoggedOut extends AuthState {}

// Bloc
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<CheckAuthStatusRequested>(_onCheckAuthStatusRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      // 模拟 API 调用
      await Future.delayed(Duration(seconds: 2));
      if (event.username.isNotEmpty && event.password.length >= 6) {
        emit(AuthSuccess(event.username));
      } else {
        emit(AuthFailure('Invalid credentials'));
      }
    } catch (e) {
      emit(AuthFailure('Login failed: $e'));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoggedOut());
  }

  Future<void> _onCheckAuthStatusRequested(
    CheckAuthStatusRequested event,
    Emitter<AuthState> emit,
  ) async {
    // 检查本地存储或共享偏好设置
    emit(AuthInitial());
  }
}

// UI
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Login successful: ${state.username}')),
              );
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.error}')),
              );
            }
          },
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 24),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state is AuthLoading
                          ? null
                          : () {
                              context.read<AuthBloc>().add(
                                LoginRequested(
                                  usernameController.text,
                                  passwordController.text,
                                ),
                              );
                            },
                      child: state is AuthLoading
                          ? CircularProgressIndicator()
                          : Text('Login'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
```

---

#### 五、架构选择指南

| 方案 | 复杂度 | 学习曲线 | 适用场景 | 社区支持 |
|------|--------|---------|---------|---------|
| Provider | ⭐ | 简单 | 小到中型应用 | 强 |
| GetX | ⭐⭐ | 中等 | 快速开发 | 强 |
| Bloc | ⭐⭐⭐ | 陡峭 | 大型复杂应用 | 强 |
| Redux | ⭐⭐⭐ | 陡峭 | 超大型应用 | 中 |

**选择建议**
- **小型应用（<5 个页面）**：无需复杂状态管理或 Provider
- **中型应用（5-20 个页面）**：Provider 或 GetX
- **大型应用（>20 个页面）**：Bloc 或 Redux
- **快速原型/MVP**：GetX
- **企业级应用**：Bloc
- **团队新手**：Provider

---

#### 六、常见错误与最佳实践

**常见错误**
1. 过度设计，为简单应用使用复杂架构
2. 混合多种状态管理方案
3. 在状态管理中放入业务逻辑（应在 Repository 或 Service 中）
4. 忘记释放 Bloc 资源
5. 状态粒度太大或太小

**最佳实践**
```dart
// ✅ 正确：清晰的职责分工
// Repository（数据层）
class UserRepository {
  Future<User> getUser(String id) async {
    // 数据获取逻辑
  }
}

// Bloc（业务逻辑层）
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;

  UserBloc(this.repository) : super(UserInitial()) {
    on<FetchUserRequested>(_onFetchUserRequested);
  }

  Future<void> _onFetchUserRequested(
    FetchUserRequested event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    try {
      final user = await repository.getUser(event.id);
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}

// Widget（UI 层）
class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is UserLoaded) {
          return UserView(state.user);
        }
        if (state is UserError) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return SizedBox.shrink();
      },
    );
  }
}

// ❌ 错误：混合关注点
class BadBloc extends Bloc<Event, State> {
  Future<void> handleEvent(event, emit) async {
    // 直接在 Bloc 中进行 API 调用
    final response = await http.get(Uri.parse('...'));
    // 解析 JSON
    final data = jsonDecode(response.body);
    // 保存到本地数据库
    // ... 太多职责
  }
}
```

---

### 实操（2小时）

#### 实操任务

1. **Provider 计数器应用**
   - 创建 Counter model（使用 ChangeNotifier）
   - UI 通过 Consumer 监听状态变化
   - 实现加、减、重置功能

2. **GetX 待办事项应用**
   ```dart
   class Todo {
     final String id;
     final String title;
     final bool completed;
     
     Todo({
       required this.id,
       required this.title,
       this.completed = false,
     });
   }

   class TodoController extends GetxController {
     final todos = <Todo>[].obs;

     void addTodo(String title) {
       todos.add(Todo(
         id: DateTime.now().toString(),
         title: title,
       ));
     }

     void toggleTodo(String id) {
       final index = todos.indexWhere((t) => t.id == id);
       if (index >= 0) {
         final todo = todos[index];
         todos[index] = Todo(
           id: todo.id,
           title: todo.title,
           completed: !todo.completed,
         );
       }
     }

     void deleteTodo(String id) {
       todos.removeWhere((t) => t.id == id);
     }
   }
   ```
   - 显示待办事项列表
   - 添加、完成、删除待办事项
   - 使用 Obx 监听状态

3. **Bloc 用户登录应用**
   - 创建 AuthBloc（处理登录事件）
   - 创建登录界面（使用 BlocBuilder）
   - 显示加载状态和错误消息
   - 登录成功后导航到主页

4. **项目架构设计：新闻应用**
   - 分层设计（UI、Business Logic、Data）
   - 选择状态管理方案
   - 实现新闻列表、详情、分类等功能
   - 处理网络请求和本地缓存

5. **综合案例：电商应用核心模块**
   ```
   需求：
   - 商品列表（可搜索、过滤）
   - 商品详情
   - 购物车（添加、删除、数量修改）
   - 订单确认
   
   架构要求：
   - 使用选定的状态管理方案
   - 清晰的分层结构
   - 可维护和可扩展
   ```

---

## 📝 课后作业

### 必做作业

1. **对比三种状态管理方案**
   - 用 Provider、GetX、Bloc 分别实现相同功能
   - 分析优缺点和适用场景
   - 撰写对比分析报告

2. **完整的用户认证系统**
   - 注册、登录、登出流程
   - 令牌管理和持久化
   - 受保护的路由
   - 错误处理

3. **购物车功能实现**
   - 商品管理（添加、移除、数量修改）
   - 价格计算
   - 收藏功能
   - 订单历史

4. **应用架构设计文档**
   - 架构图
   - 模块说明
   - 数据流向
   - 扩展性考虑

### 选做作业

5. 集成推送通知系统
6. 实现离线数据同步
7. 创建可重用的 Bloc 模板库

---

## 📚 学习资源

### 官方文档
- Provider：https://pub.dev/packages/provider
- GetX：https://pub.dev/packages/get
- Bloc：https://bloclibrary.dev/

### 推荐教程
- Flutter 状态管理完全指南
- 架构模式对比分析
- 大型项目最佳实践

### 示例项目
- [Provider Example](https://github.com/flutter/samples/tree/master/provider_shopper)
- [Bloc Library Examples](https://github.com/felangel/bloc/tree/master/examples)
- [GetX Complete Example](https://github.com/iampawan/GetX)

---

## ✅ 学习检查清单

### 知识点检查
- [ ] 理解 MVC、MVP、MVVM 架构
- [ ] 掌握分层架构设计
- [ ] 理解 Provider 工作原理
- [ ] 掌握 ChangeNotifier 和 Consumer
- [ ] 理解 GetX 响应式编程
- [ ] 掌握 Obx 和 GetBuilder
- [ ] 理解 Bloc 事件驱动模式
- [ ] 掌握 BlocBuilder 和 BlocListener
- [ ] 理解状态管理方案选择标准
- [ ] 了解性能优化策略

### 实战能力检查
- [ ] 能设计应用整体架构
- [ ] 能使用 Provider 管理状态
- [ ] 能使用 GetX 快速开发
- [ ] 能使用 Bloc 构建复杂应用
- [ ] 能实现分层数据流
- [ ] 能优化应用性能
- [ ] 能处理复杂业务逻辑

### 代码质量检查
- [ ] 职责分工清晰
- [ ] 代码解耦合
- [ ] 易于测试
- [ ] 易于维护和扩展
- [ ] 代码遵循设计模式规范

---

## 🔍 常见问题解答

### Q1：如何选择状态管理方案？
根据应用复杂度：简单用 Provider，中等用 GetX，复杂用 Bloc。

### Q2：Provider 中 watch vs read 的区别？
watch 监听变化会触发重建，read 仅读取当前值不监听。

### Q3：Bloc 中如何处理异步操作？
使用 `on<Event>` 方法并用 `emit` 发出状态。

### Q4：如何避免状态管理中的内存泄漏？
确保正确释放 Controller、Bloc 等资源，使用 BlocProvider 自动管理。

---

**预计完成时间**：4小时课内 + 7小时课外  
**难度等级**：⭐⭐⭐⭐⭐  
**重要程度**：⭐⭐⭐⭐⭐
