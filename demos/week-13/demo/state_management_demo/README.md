# 第13周 状态管理 Demo（Provider）

第13周案例：Provider 状态管理 — ChangeNotifier、ChangeNotifierProvider、context.watch/read、Consumer。

## 运行

```bash
flutter pub get
flutter run
```

## 说明

- **Counter**：with ChangeNotifier，increment/decrement/reset 后调用 notifyListeners()。
- **ChangeNotifierProvider**：在 runApp 顶层 create Counter，子树可 watch/read。
- **context.watch**：监听 Counter 变化，重建当前 widget（显示 count）。
- **context.read**：仅获取 Counter 并调用方法，不监听，用于按钮回调。
- **Consumer**：仅 builder 子树在 Counter 变化时重建，用于局部优化。
- 对应大纲：应用架构（状态与 UI 分离）、Provider（ChangeNotifier、watch/read、Consumer）。
