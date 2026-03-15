# Flutter 框架基础 Demo（第8周）

第8周案例：应用结构（main、MaterialApp）、StatelessWidget（ProfileCard）、StatefulWidget（CounterSection）、基础组件（Text、Container、Padding、Icon、ElevatedButton、Scaffold、AppBar）。

## 运行

```bash
flutter pub get
flutter run
```

可选设备：`flutter run -d chrome` 或 `flutter run -d windows`。

## 说明

- **MyApp**：StatelessWidget，MaterialApp 配置。
- **ProfileCard**：StatelessWidget，展示姓名与角色（无状态）。
- **CounterSection**：StatefulWidget，计数器通过 setState 更新；对应生命周期 build/setState。
- 对应大纲：Flutter 应用结构、Stateless vs Stateful、常用基础组件。
