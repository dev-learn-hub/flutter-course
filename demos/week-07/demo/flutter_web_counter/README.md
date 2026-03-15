# Flutter Web 计数器

第7周案例：Flutter Web 入门，StatefulWidget 计数器，加、减、重置。

## 运行

```bash
flutter pub get
flutter run -d chrome
```

或构建 Web 产物：`flutter build web --release`，输出在 `build/web/`。

## 说明

- `CounterPage` 为 StatefulWidget，`_count` 状态，`_increment`/`_decrement`/`_reset` 通过 `setState` 更新。
- 对应大纲：Flutter Web 计数器应用、StatefulWidget、响应式设计入门。
