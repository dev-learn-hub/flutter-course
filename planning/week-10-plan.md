# 第10周具体方案

> 基于 `planning/02-Weekly-Content-Template.md` 第七节生成。按步骤 1～8 执行并勾选检查项。

---

### 基本信息

- **周次**：第10周  
- **主题**：Flutter 常用组件与功能（第一部分）  
- **核心内容（一句话）**：AppBar、导航、表单、对话框、事件处理  
- **全学期中的阶段**：Flutter 基础（承接第9周布局系统，为第11周本地存储、网络、FutureBuilder 打基础）  

---

### 步骤 1：全学期课程大纲

- 前一周主题：第9周 Flutter 布局系统详解  
- 后一周主题：第11周 Flutter 常用组件与功能（第二部分）  
- 备注：第10周聚焦常用高级组件与交互（AppBar 详解、Form/TextFormField 与验证、Dialog/BottomSheet、GestureDetector/InkWell、焦点与事件），与第9周布局衔接，为第11周数据持久化与网络请求提供界面与表单基础。  

**检查**：☑ 已阅读 index.md  ☑ 已记录与前后周衔接  

---

### 步骤 2：本周课程大纲

- **本周学习目标**：掌握 Flutter 中常用的高级组件（AppBar、表单、对话框等），理解事件处理机制，能构建功能完整的用户界面。  
- **讲授要点**：AppBar 组件详解（基础 AppBar、高级配置 leading/actions/backgroundColor/elevation/shape、自定义 PreferredSize/flexibleSpace）；表单 Form（GlobalKey<FormState>、Form 与 TextFormField、validator/onSaved、InputDecoration、其他控件 Checkbox/Radio/Switch/Slider/DropdownButton）；对话框 Dialog（AlertDialog、SimpleDialog、自定义 Dialog、showModalBottomSheet）；事件处理机制（GestureDetector 手势、InkWell 涟漪、FocusNode 与焦点、键盘事件）；常见错误与最佳实践（Form 必须用 GlobalKey、Dialog 正确 Navigator.pop、FocusNode 需 dispose）。  
- **实操任务**：创建自定义 AppBar（渐变、leading/actions、点击事件）；构建用户登录表单（用户名/密码验证、记住密码 Checkbox、提交与验证）；实现对话框系统（AlertDialog、CustomDialog、BottomSheet）；事件处理演示（GestureDetector、InkWell、FocusNode）；综合案例：用户资料编辑应用（Form、多字段、CheckboxListTile、提交与 SnackBar）。  
- **作业要求**：必做：自定义登录界面、用户反馈表单、弹窗系统、事件处理演示应用；选做：多步注册流程、表单草稿、自定义组件库。  

**检查**：☑ 已阅读 week-10.md  ☑ 已提取目标/要点/实操/作业  

---

### 步骤 3：前几周已有内容

- **前置依赖**：第8周 Flutter 框架基础（StatelessWidget/StatefulWidget、Scaffold、AppBar、基础组件）；第9周布局系统（Row/Column、ListView 等，用于表单与对话框排版）。第10周在既有布局与组件之上系统讲解 AppBar 定制、Form 验证、Dialog 与事件处理。  
- **可复用的表述或结构**：第3～9周大纲/讲义/课堂练习的段落结构、周聚合页四链接表格式、步骤 8 提交须包含 week-XX-page 及本周全部相关文件。  

**检查**：☑ 已阅读前几周内容  ☑ 已列前置依赖  ☑ 已注明可复用处  

---

### 步骤 4：知识点体系大纲

- 产出文件：`planning/week-10-knowledge-map.md`  
- 简要：主块五块（AppBar、Form/TextFormField、其他表单控件、对话框与 BottomSheet、事件处理）；与 demo/课堂练习对应已写。  

**检查**：☑ 已创建 knowledge-map  ☑ 未超纲  ☑ 知识点有「应能…」描述  

---

### 步骤 5：素材准备

- **素材清单**（主题 / 链接 / 用途 / 版本或日期）：
  - AppBar：https://api.flutter.dev/flutter/material/AppBar-class.html — 讲义 AppBar 配置
  - Form / TextFormField：https://api.flutter.dev/flutter/widgets/Form-class.html — 表单与验证
  - AlertDialog：https://api.flutter.dev/flutter/material/AlertDialog-class.html — 对话框
  - GestureDetector：https://api.flutter.dev/flutter/widgets/GestureDetector-class.html — 事件处理

**检查**：☑ 已搜索并保存素材  ☑ 清单含链接与用途  

---

### 步骤 6：案例编写与运行验证

- demo 路径：`demos/week-10/demo/components_demo/`  
- 项目名：`components_demo`（AppBar leading/actions、Form 登录 validator/onSaved、AlertDialog、BottomSheet、GestureDetector/InkWell、SnackBar）  
- 本地验证结果：`flutter pub get`、`flutter analyze` 通过。  

**检查**：☑ demo 已创建且可运行  ☑ 对应知识点  ☑ 已本地验证  

---

### 步骤 7：讲义与课堂练习编写

- 讲义文件：`week-10-lecture.md`，permalink `/week-10/lecture/`；含 AppBar、Form/TextFormField、其他表单控件、Dialog/BottomSheet、事件处理、运行 Demo、常见问题与最佳实践。  
- 课堂练习文件：`week-10-exercise.md`，permalink `/week-10/exercise/`；3 个当堂练习（运行 Demo 并指认 Form/Dialog/SnackBar、修改校验或 AppBar、新增表单字段或 BottomSheet 选项）。  

**检查**：☑ 讲义结构完整  ☑ 已引用知识点/案例  ☑ 讲义 permalink 正确  ☑ 已创建课堂练习且 permalink 正确  

---

### 步骤 8：组合与发布

- **将课堂练习加入周聚合页**：在 `week-10-page.md`「本章资源」表中添加「课堂练习」一行，链接 `./exercise/`；将讲义链接改为 `./lecture/`（若采用独立讲义）。当前 week-10-page 仅有三行（大纲、讲义、案例），需补第四行。  
- 周聚合页链接检查：大纲 / 讲义 / 案例 / 课堂练习  
- **推送与部署**（必做）：提交时须包含 `week-10-page.md` 及本周全部相关文件，再推送到 main，触发 GitHub Pages 部署；在 GitHub Actions 中确认部署工作流成功。  
- **线上验证**（必做）：实际访问课程 GitHub Pages 发布地址，从首页进入「第10周」聚合页，逐链点击「大纲、讲义、案例、课堂练习」，确认无 404 且内容正确。  

**检查**：□ 已在聚合页添加课堂练习链接  □ 四链接正确  □ 提交已包含 week-10-page 及本周全部相关文件  □ 已推送到 main 且 Pages 部署成功  □ 已访问发布站点并逐链验证  

---

**本周方案状态**：□ 进行中  □ 已完成  

**完成日期**：（填写）
