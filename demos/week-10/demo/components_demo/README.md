# 第10周 常用组件 Demo

第10周案例：AppBar（leading/actions）、Form + TextFormField（用户名/密码、validator、onSaved）、AlertDialog、showModalBottomSheet、GestureDetector、InkWell、SnackBar。

## 运行

```bash
flutter pub get
flutter run
```

## 说明

- **AppBar**：leading 菜单、actions 搜索与更多，点击触发 SnackBar。
- **Form**：GlobalKey<FormState>、两个 TextFormField（validator 校验、onSaved 保存），登录按钮 validate + save 后显示 SnackBar。
- **AlertDialog**：showDialog + AlertDialog，确定/取消与 Navigator.pop。
- **BottomSheet**：showModalBottomSheet，列表选项与 Navigator.pop。
- **GestureDetector / InkWell**：单击、长按与涟漪效果。
- 对应大纲：AppBar、Form、Dialog、事件处理。
