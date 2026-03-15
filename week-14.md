# 第14周：Flutter 项目实践（第一部分）

## 周学习目标
掌握项目管理工具和流程，学会使用 Git 和 GitHub 进行版本控制，遵循代码规范，建立持续集成/持续部署（CI/CD）流程，为团队协作做准备。

---

## 📚 核心内容

### 讲授（2小时）

#### 一、项目结构规范

**标准 Flutter 项目结构**
```
my_flutter_app/
├── lib/                           # Dart 代码主目录
│   ├── main.dart                  # 应用入口
│   ├── config/                    # 配置文件
│   │   ├── app_config.dart        # 应用配置
│   │   └── theme.dart             # 主题配置
│   ├── models/                    # 数据模型
│   │   ├── user_model.dart
│   │   └── product_model.dart
│   ├── services/                  # 服务层
│   │   ├── api_service.dart       # API 调用
│   │   └── storage_service.dart   # 本地存储
│   ├── repositories/              # 仓储层
│   │   ├── user_repository.dart
│   │   └── product_repository.dart
│   ├── providers/                 # 状态管理（如使用 Provider）
│   │   ├── user_provider.dart
│   │   └── app_provider.dart
│   ├── blocs/                     # 业务逻辑（如使用 Bloc）
│   │   ├── authentication/
│   │   │   ├── auth_bloc.dart
│   │   │   ├── auth_event.dart
│   │   │   └── auth_state.dart
│   │   └── product/
│   │       ├── product_bloc.dart
│   │       ├── product_event.dart
│   │       └── product_state.dart
│   ├── screens/                   # 页面（也称 pages）
│   │   ├── home/
│   │   │   └── home_screen.dart
│   │   ├── login/
│   │   │   └── login_screen.dart
│   │   └── product_detail/
│   │       └── product_detail_screen.dart
│   ├── widgets/                   # 可复用组件
│   │   ├── common/
│   │   │   ├── app_button.dart
│   │   │   ├── app_text_field.dart
│   │   │   └── loading_widget.dart
│   │   └── product/
│   │       ├── product_card.dart
│   │       └── product_list.dart
│   ├── utils/                     # 工具函数
│   │   ├── constants.dart         # 常量定义
│   │   ├── logger.dart            # 日志工具
│   │   ├── validators.dart        # 验证器
│   │   └── extensions.dart        # 扩展方法
│   └── theme/                     # 主题相关
│       ├── colors.dart
│       ├── text_styles.dart
│       └── app_theme.dart
│
├── test/                          # 单元测试
│   ├── widget_test.dart
│   └── unit/
│       ├── models/
│       └── services/
│
├── integration_test/              # 集成测试
│   └── app_test.dart
│
├── assets/                        # 资源文件
│   ├── images/
│   ├── icons/
│   └── fonts/
│
├── pubspec.yaml                   # 项目配置
├── pubspec.lock                   # 依赖锁定文件
├── analysis_options.yaml          # 代码分析规则
├── .gitignore                     # Git 忽略文件
├── README.md                      # 项目说明
└── CHANGELOG.md                   # 更新日志
```

---

#### 二、代码规范（Dart Style Guide）

**命名规范**
```dart
// ✅ 类名：大驼峰
class UserProfile {}
class HomePage {}

// ✅ 方法/变量名：小驼峰
void getUserData() {}
String userName;

// ✅ 常量：小驼峰前缀 k
const String kAppName = 'My App';
const int kMaxRetries = 3;

// ✅ 文件名：蛇形命名
user_profile.dart
home_page.dart

// ❌ 错误的命名
class user_profile {}           // 类名应该大驼峰
String UserName;                // 变量名应该小驼峰
const int MAX_RETRIES = 3;      // 常量应该小驼峰
UserProfile.dart                // 文件名应该蛇形
```

**代码风格**
```dart
// ✅ 良好的缩进和格式
class UserController {
  final String name;
  final int age;

  UserController({
    required this.name,
    required this.age,
  });

  String getUserInfo() {
    return '$name, $age years old';
  }
}

// ✅ 使用 const 优化性能
const EdgeInsets kDefaultPadding = EdgeInsets.all(16);

// ✅ 使用有意义的变量名
String getUserEmail() {
  final String email = user.email;  // 明确
  return email;
}

// ❌ 不要使用模糊的变量名
String getUE() {                 // 什么是 UE？
  final e = user.email;          // e 太简短
  return e;
}

// ✅ 函数应简短，职责单一
Future<User> fetchUserData(String id) {
  return apiService.getUser(id);
}

// ❌ 函数做太多事
Future<User> fetchUserAndProcessData(String id) {
  // 获取用户
  // 验证数据
  // 转换格式
  // 保存到本地
  // 这个函数做了太多事
}
```

**文档注释**
```dart
/// 获取用户信息
/// 
/// 从 API 中根据用户 ID 获取用户信息。
/// 
/// 参数：
/// - [userId]：用户的唯一标识符
/// 
/// 返回：包含用户信息的 Future
/// 
/// 异常：
/// - [HttpException]：如果网络请求失败
/// - [FormatException]：如果响应格式不正确
/// 
/// 示例：
/// ```dart
/// final user = await getUserInfo('123');
/// print(user.name);
/// ```
Future<User> getUserInfo(String userId) async {
  // ...
}

/// 验证邮箱格式
/// 
/// 使用正则表达式检查邮箱格式是否有效。
bool isValidEmail(String email) {
  return email.contains('@');
}
```

**分析选项（analysis_options.yaml）**
```yaml
include: package:flutter_lints/flutter.yaml

linter:
  rules:
    # 错误规则
    - avoid_empty_else
    - avoid_null_checks_in_equality_operators
    - avoid_relative_lib_imports
    - avoid_returning_null_for_future
    - avoid_slow_async_io
    - cancel_subscriptions
    - close_sinks
    - comment_references
    - control_flow_in_finally
    - empty_statements
    - hash_and_equals
    - invariant_booleans
    - iterable_contains_unrelated_type
    - list_remove_unrelated_type
    - no_adjacent_strings_in_list
    - no_duplicate_case_values
    - prefer_void_to_null
    - throw_in_finally
    - unnecessary_statements
    - unrelated_type_equality_checks

    # 风格规则
    - always_declare_return_types
    - always_put_control_body_on_new_line
    - always_put_required_named_parameters_first
    - annotate_overrides
    - avoid_bool_literals_in_conditional_expressions
    - avoid_classes_with_only_static_members
    - avoid_double_and_int_checks
    - avoid_field_initializers_in_const_classes
    - avoid_function_literals_in_foreach_calls
    - avoid_init_to_null
    - avoid_null_checks_in_equality_operators
    - avoid_positional_boolean_parameters
    - avoid_private_typedef_functions
    - avoid_renaming_method_parameters
    - avoid_returning_null
    - avoid_returning_null_for_future
    - avoid_returning_this
    - avoid_setters_without_getters
    - avoid_shadowing_type_parameters
    - avoid_slow_async_io
    - avoid_types_as_parameter_names
    - avoid_types_on_closure_parameters
    - avoid_unnecessary_containers
    - avoid_void_async
    - await_only_futures
    - camel_case_extensions
    - camel_case_types
    - cascade_invocations
    - cast_nullable_to_non_nullable
    - constant_identifier_names
    - curly_braces_in_flow_control_structures
    - directives_ordering
    - empty_catches
    - empty_constructor_bodies
    - file_names
    - implementation_imports
    - leading_newlines_in_multiline_strings
    - library_names
    - library_prefixes
    - library_private_types_in_public_api
    - lines_longer_than_80_chars
    - no_leading_underscores_for_local_variables
    - null_closures
    - omit_local_variable_types
    - one_member_abstracts
    - only_throw_errors
    - overridden_fields
    - package_api_docs
    - package_prefixed_library_names
    - parameter_assignments
    - prefer_adjacent_string_concatenation
    - prefer_asserts_in_initializer_lists
    - prefer_asserts_with_message
    - prefer_collection_literals
    - prefer_conditional_assignment
    - prefer_const_constructors
    - prefer_const_constructors_in_immutables
    - prefer_const_declarations
    - prefer_const_literals_to_create_immutables
    - prefer_constructors_over_static_methods
    - prefer_contains
    - prefer_equal_for_default_values
    - prefer_expression_function_bodies
    - prefer_final_fields
    - prefer_final_in_for_each
    - prefer_final_locals
    - prefer_for_elements_to_map_fromIterable
    - prefer_foreach
    - prefer_function_declarations_over_variables
    - prefer_generic_function_type_aliases
    - prefer_getters_setters
    - prefer_if_elements_to_conditional_expressions
    - prefer_if_null_to_conditional_expressions
    - prefer_if_on_single_line_statements
    - prefer_initializing_formals
    - prefer_inlined_adds
    - prefer_int_literals
    - prefer_interpolation_to_compose_strings
    - prefer_is_empty
    - prefer_is_not_empty
    - prefer_is_not_operator
    - prefer_is_null_check_on_cascade_expressions
    - prefer_iterable_whereType
    - prefer_null_aware_operators
    - prefer_null_coalescing_operators
    - prefer_relative_import_paths
    - prefer_single_quotes
    - provide_deprecation_message
    - recursive_getters
    - sized_box_for_whitespace
    - sized_box_shrink_expand
    - slash_for_doc_comments
    - sort_child_properties_last
    - sort_constructors_first
    - sort_pub_dependencies
    - sort_unnamed_constructors_first
    - tighten_type_of_initializing_formals
    - tighten_type_of_local_variables
    - type_annotate_public_apis
    - type_init_formals
    - type_literal_in_constant_pattern
    - unawaited_futures
    - unnecessary_await_in_return
    - unnecessary_brace_in_string_interps
    - unnecessary_const
    - unnecessary_constructor_name
    - unnecessary_getters_setters
    - unnecessary_lambdas
    - unnecessary_library_directive
    - unnecessary_new
    - unnecessary_null_aware_operators
    - unnecessary_null_in_if_null_operators
    - unnecessary_null_to_getter
    - unnecessary_nullable_for_final_variable_declaration
    - unnecessary_overrides
    - unnecessary_parenthesis
    - unnecessary_statements
    - unnecessary_string_escapes
    - unnecessary_string_interpolations
    - unnecessary_this
    - unnecessary_to_list_in_spreads
    - unrelated_type_equality_checks
    - unsafe_html
    - use_build_context_synchronously
    - use_full_hex_values_for_flutter_colors
    - use_function_type_syntax_for_parameters
    - use_getters_to_define_computed_properties
    - use_if_null_to_convert_nullability
    - use_is_even_rather_than_modulo
    - use_key_in_widget_constructors
    - use_late_for_private_fields_and_variables
    - use_named_constants
    - use_raw_strings
    - use_rethrow_when_possible
    - use_setters_to_change_properties
    - use_string_buffers
    - use_test_throws_matchers
    - use_to_close_over_closure
    - use_full_hex_values_for_flutter_colors
    - void_checks
    - which_you_want_only_if_it_looks_like_when
```

---

#### 三、Git 版本控制

**Git 基础命令**
```bash
# 配置 Git
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# 初始化仓库
git init
git clone https://github.com/user/repo.git

# 查看状态
git status
git log                          # 查看提交历史
git diff                         # 查看改动
git diff --staged               # 查看暂存区改动

# 提交代码
git add .                        # 暂存所有改动
git add filename                 # 暂存特定文件
git commit -m "Commit message"   # 提交
git push origin main             # 推送到远程

# 分支管理
git branch                       # 查看本地分支
git branch -a                    # 查看所有分支
git branch feature-name          # 创建分支
git checkout feature-name        # 切换分支
git checkout -b feature-name     # 创建并切换分支
git merge feature-name           # 合并分支
git branch -d feature-name       # 删除分支

# 撤销操作
git restore filename             # 撤销工作区改动
git restore --staged filename    # 取消暂存
git reset HEAD~1                 # 撤销上一次提交
git revert commit-hash           # 创建新提交撤销指定提交
```

**提交规范（Conventional Commits）**
```
<type>(<scope>): <subject>

<body>

<footer>
```

类型：
- `feat`: 新功能
- `fix`: 修复 Bug
- `docs`: 文档变更
- `style`: 代码风格（不影响功能）
- `refactor`: 代码重构
- `perf`: 性能优化
- `test`: 测试相关
- `chore`: 构建工具、依赖更新等

```bash
# 示例
git commit -m "feat(auth): add login functionality"
git commit -m "fix(ui): fix button alignment issue"
git commit -m "docs: update README"
git commit -m "refactor: simplify data model"
```

**Git 工作流**
```
Main Branch (Protected)
    ↑
    │ (Pull Request)
    │
Feature/Fix Branch
    ↓
Development
    ↓
Staging (可选)
    ↓
Production
```

---

#### 四、GitHub 协作工作流

**创建仓库和管理分支**
```
1. 在 GitHub 创建仓库
2. Clone 到本地
3. 创建特性分支（feature/*, bugfix/*, etc.）
4. 在特性分支上开发
5. 推送到远程
6. 在 GitHub 上创建 Pull Request
7. 代码审查
8. 合并到 main/develop
```

**Pull Request 模板**
```markdown
## 描述
简要描述这个 PR 的目的和变更。

## 相关 Issue
Fixes #123

## 变更类型
- [ ] 新功能
- [ ] Bug 修复
- [ ] 破坏性变更
- [ ] 文档更新

## 测试
描述如何测试这个变更。

- [ ] 新增了测试用例
- [ ] 现有测试通过
- [ ] 在本地测试过

## 检查清单
- [ ] 代码遵循风格指南
- [ ] 自评审通过
- [ ] 添加了必要的注释
- [ ] 更新了相关文档
- [ ] 没有新增警告
```

**Issue 模板**
```markdown
## 描述问题
清楚地描述问题是什么。

## 重现步骤
1. 打开...
2. 点击...
3. 查看...

## 预期行为
应该发生什么

## 实际行为
实际发生了什么

## 截图/日志
如适用，添加截图或日志

## 环境
- Flutter 版本：
- Dart 版本：
- 设备/模拟器：
- 操作系统：

## 附加信息
其他有用的信息
```

---

#### 五、CI/CD 流程

**GitHub Actions 示例**
```yaml
# .github/workflows/flutter.yml
name: Flutter Build and Test

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main, develop ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Flutter
      uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.10.0'
    
    - name: Install dependencies
      run: flutter pub get
    
    - name: Format code
      run: dart format --set-exit-if-changed lib test
    
    - name: Analyze code
      run: flutter analyze
    
    - name: Run tests
      run: flutter test
    
    - name: Build APK
      run: flutter build apk --release
```

**本地测试前的检查**
```bash
# 格式检查
dart format --set-exit-if-changed lib

# 代码分析
flutter analyze

# 运行单元测试
flutter test

# 运行集成测试
flutter test integration_test/app_test.dart

# 构建 APK
flutter build apk --release

# 构建 iOS
flutter build ios --release
```

---

#### 六、常见工具和最佳实践

**推荐工具**
- **版本控制**：Git + GitHub
- **代码编辑**：VS Code + Flutter 扩展
- **代码审查**：GitHub Pull Request
- **项目管理**：GitHub Projects / Jira
- **CI/CD**：GitHub Actions / GitLab CI
- **文档**：GitHub Wiki / Markdown
- **依赖管理**：pub.dev / Pubspec

**最佳实践**
```dart
// ✅ 正确的项目设置

// pubspec.yaml
name: my_flutter_app
description: A professional Flutter application

environment:
  sdk: '>=3.0.0 <4.0.0'
  flutter: '>=3.10.0'

dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0
  http: ^1.1.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0
  mockito: ^5.3.1

# .gitignore - 忽略必要的文件
/build/
/ios/Pods/
/android/.gradle/
/.dart_tool/
/pubspec.lock
*.iml
.DS_Store
.env
.env.*

# 项目说明文档 - README.md
# 项目名称

## 功能描述

## 环境要求

## 安装和运行

## 项目结构

## API 文档

## 开发指南

## 部署说明

## 常见问题

## 许可证
```

---

### 实操（2小时）

#### 实操任务

1. **项目初始化**
   ```bash
   flutter create my_professional_app
   cd my_professional_app
   
   # 创建标准目录结构
   mkdir -p lib/models
   mkdir -p lib/services
   mkdir -p lib/screens
   mkdir -p lib/widgets
   mkdir -p lib/utils
   
   # 初始化 Git 仓库
   git init
   git add .
   git commit -m "initial: project structure setup"
   ```

2. **配置代码规范**
   - 创建 `analysis_options.yaml`
   - 配置 Dart 格式化规则
   - 设置 pre-commit hook

3. **GitHub 仓库设置**
   - 在 GitHub 创建仓库
   - 配置分支保护规则
   - 创建 PR 和 Issue 模板
   - 添加 README.md 和 CONTRIBUTING.md

4. **实现 CI/CD 流程**
   ```yaml
   # 创建 .github/workflows/flutter.yml
   # 配置自动化测试和构建
   # 验证工作流正确运行
   ```

5. **团队协作演练**
   - 创建特性分支
   - 提交规范的提交信息
   - 创建 Pull Request
   - 代码审查流程
   - 合并和解决冲突

6. **综合案例：建立项目框架**
   ```
   任务：
   - 创建规范的项目结构
   - 实现基础的 Main 页面
   - 设置路由系统
   - 配置主题和国际化基础
   - 创建通用的网络请求客户端
   - 编写单元和集成测试
   - 配置 CI/CD 流程
   - 编写完整的项目文档
   ```

---

## 📝 课后作业

### 必做作业

1. **建立完整的项目框架**
   - 按规范创建目录结构
   - 配置代码分析规则
   - 创建基础的模型和服务类

2. **GitHub 仓库配置**
   - 创建仓库并配置分支保护
   - 添加项目文档（README、CONTRIBUTING 等）
   - 创建 Issue 和 PR 模板

3. **实现 CI/CD 流程**
   - 配置 GitHub Actions 工作流
   - 自动化代码检查、测试、构建
   - 验证工作流正常运行

4. **撰写项目文档**
   - README（功能、环境、运行方式）
   - CONTRIBUTING（开发指南、贡献流程）
   - API 文档（重要接口说明）
   - 部署指南（发布流程）

### 选做作业

5. 配置自动部署流程
6. 集成代码覆盖率检测
7. 设置自动变更日志生成

---

## 📚 学习资源

### 官方文档
- Dart Style Guide：https://dart.dev/guides/language/effective-dart/style
- Flutter 项目结构：https://docs.flutter.dev/development/best-practices/structure
- GitHub Actions：https://docs.github.com/en/actions
- Conventional Commits：https://www.conventionalcommits.org/

### 推荐阅读
- Clean Code（代码规范）
- The Pragmatic Programmer（最佳实践）
- Git 操作指南：https://git-scm.com/book/zh/v2

### 工具
- Flutter DevTools
- Dart Code Analysis
- GitHub CLI

---

## ✅ 学习检查清单

### 知识点检查
- [ ] 理解 Flutter 项目标准结构
- [ ] 掌握 Dart 命名规范
- [ ] 理解代码分析规则配置
- [ ] 掌握 Git 基本命令
- [ ] 理解 Git 工作流
- [ ] 掌握 GitHub Pull Request 流程
- [ ] 理解 CI/CD 概念
- [ ] 能配置 GitHub Actions
- [ ] 理解 Conventional Commits
- [ ] 了解项目文档的重要性

### 实战能力检查
- [ ] 能建立规范的项目结构
- [ ] 能正确使用 Git 进行版本控制
- [ ] 能创建和管理 GitHub 仓库
- [ ] 能配置代码检查和测试
- [ ] 能实现自动化构建流程
- [ ] 能编写清晰的项目文档
- [ ] 能进行有效的代码审查

### 代码质量检查
- [ ] 代码遵循命名规范
- [ ] 使用了文档注释
- [ ] 代码分析无错误
- [ ] 有适当的测试
- [ ] 项目文档完整
- [ ] 版本管理规范

---

## 🔍 常见问题解答

### Q1：如何解决 Git 合并冲突？
手动编辑冲突文件，保留需要的部分，然后提交。

### Q2：什么时候应该创建新分支？
每个功能或 Bug 修复都应该创建新分支。

### Q3：如何编写好的提交信息？
使用 Conventional Commits 格式，简洁明了，描述改动内容。

### Q4：怎样保证代码质量？
使用代码分析工具、编写测试、进行代码审查。

---

**预计完成时间**：4小时课内 + 5小时课外  
**难度等级**：⭐⭐⭐⭐  
**重要程度**：⭐⭐⭐⭐⭐
