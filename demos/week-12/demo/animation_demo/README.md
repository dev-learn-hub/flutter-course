# 第12周 动画演示 Demo

第12周案例：显式动画（AnimationController + Tween + CurvedAnimation + AnimatedBuilder）、Hero 动画（列表卡片 → 详情页）、隐式动画（AnimatedContainer、AnimatedOpacity）。

## 运行

```bash
flutter pub get
flutter run
```

## 说明

- **显式动画**：Controller 在 initState 中创建、dispose 中释放；Tween + CurvedAnimation；AnimatedBuilder 根据 animation.value 更新宽高与透明度，避免整页 setState。
- **Hero**：主页三张卡片与详情页使用相同 tag（hero_0、hero_1、hero_2），实现共享元素过渡。
- **隐式动画**：AnimatedContainer 随 _expanded 切换宽高与颜色；AnimatedOpacity 随 _visible 切换透明度。
- 对应大纲：动画基础、Tween/Curve、AnimatedBuilder、Hero、隐式动画。
