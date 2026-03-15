# 第12周具体方案

> 基于 `planning/02-Weekly-Content-Template.md` 第七节生成。按步骤 1～8 执行并勾选检查项。

---

### 基本信息

- **周次**：第12周  
- **主题**：Flutter 动画与交互体验  
- **核心内容（一句话）**：Animation、隐式/显式动画、Hero 动画、页面切换  
- **全学期中的阶段**：Flutter 基础进阶（承接第11周数据与异步，为第13周状态管理、第14周项目实践打基础）  

---

### 步骤 1：全学期课程大纲

- 前一周主题：第11周 Flutter 常用组件与功能（第二部分）  
- 后一周主题：第13周 Flutter 应用架构与状态管理  
- 备注：第12周聚焦动画系统（Animation、AnimationController、Tween、Curve、AnimatedBuilder、AnimatedWidget、Hero、自定义页面转换、隐式动画 AnimatedContainer/AnimatedOpacity 等），与第10周组件与事件、第11周数据展示衔接，为第13周架构与状态管理提供交互与过渡体验基础。  

**检查**：☑ 已阅读 index.md  ☑ 已记录与前后周衔接  

---

### 步骤 2：本周课程大纲

- **本周学习目标**：掌握 Flutter 动画系统，理解 Animation、Curve、Tween 的概念，学会创建 Hero 动画和页面切换动画，实现流畅的用户交互体验。  
- **讲授要点**：动画基础概念（Animation 类族、value/status、AnimationStatus 状态机）；Tween 与 Curve（Tween<double>/ColorTween/Tween<Offset>、CurvedAnimation、Curves.linear/easeIn/easeOut/bounceOut/elasticOut 等）；AnimatedBuilder 与 AnimatedWidget（避免频繁 setState、listenable）；Hero 动画（tag 唯一、列表到详情的过渡）；页面切换动画（PageRoute、buildTransitions、SlideTransition/FadeTransition/ScaleTransition）；隐式动画（AnimatedContainer、AnimatedOpacity、AnimatedPositioned、AnimatedAlign、AnimatedDefaultTextStyle）；常见错误与最佳实践（controller.dispose、AnimatedBuilder 优于 addListener+setState、Hero 标签唯一、动画时长与曲线）。  
- **实操任务**：基础动画演示（方块大小/颜色变化、不同 Curve 对比）；Hero 动画应用（产品卡片列表、点击展开详情、Hero 过渡）；页面转换动画（自定义滑动/淡入/缩放、多页面不同转换、返回反向动画）；隐式动画应用（AnimatedContainer 展开收起、AnimatedOpacity 淡入淡出、组合隐式动画）；综合案例：动画登录界面（FadeTransition、SlideTransition、多 Controller）。  
- **作业要求**：必做：创建加载动画（自旋转、脉冲、进度条）；开发 Hero 相册应用（网格、全屏详情、Hero 过渡）；实现自定义页面转换（至少 3 种）；构建交互卡片组件（隐式动画展开/收起、点击缩放）。选做：游戏动画场景（跳跃、碰撞等）；下拉刷新动画；复杂组合动画。  

**检查**：☑ 已阅读 week-12.md  ☑ 已提取目标/要点/实操/作业  

---

### 步骤 3：前几周已有内容

- **前置依赖**：第10周 Form、Dialog、事件处理（GestureDetector、InkWell）；第11周 FutureBuilder、数据展示与界面更新。第12周在 Flutter 中系统讲解动画 API（AnimationController、Tween、Curve、AnimatedBuilder、Hero、PageRoute、隐式动画），与第10周交互、第11周 UI 更新形成完整「界面—数据—动效」链条。  
- **可复用的表述或结构**：第3～11周大纲/讲义/课堂练习的段落结构、周聚合页四链接表格式、步骤 8 提交须包含 week-XX-page 及本周全部相关文件；第11周 Demo 的 StatefulWidget 与 setState 可延续到动画中的 Controller 与 AnimatedBuilder。  

**检查**：☑ 已阅读前几周内容  ☑ 已列前置依赖  ☑ 已注明可复用处  

---

### 步骤 4：知识点体系大纲

- 产出文件：`planning/week-12-knowledge-map.md`  
- 简要：主块七块（动画基础、Tween 与 Curve、AnimatedBuilder 与 AnimatedWidget、Hero、页面切换与 PageRoute、隐式动画、常见错误与最佳实践）；与 demo/课堂练习对应已写。  

**检查**：☑ 已创建 knowledge-map  ☑ 未超纲  ☑ 知识点有「应能…」描述  

---

### 步骤 5：素材准备

- **素材清单**（主题 / 链接 / 用途 / 版本或日期）：
  - Animation：https://api.flutter.dev/flutter/animation/Animation-class.html — 讲义动画基础
  - AnimationController：https://api.flutter.dev/flutter/animation/AnimationController-class.html — 控制器与生命周期
  - Hero：https://api.flutter.dev/flutter/widgets/Hero-class.html — Hero 动画
  - Curves：https://api.flutter.dev/flutter/animation/Curves-class.html — 曲线

**检查**：☑ 已搜索并保存素材  ☑ 清单含链接与用途  

---

### 步骤 6：案例编写与运行验证

- demo 路径：`demos/week-12/demo/animation_demo/`  
- 项目名：`animation_demo`（显式动画 AnimatedBuilder、Hero 列表→详情、AnimatedContainer/AnimatedOpacity 隐式动画）  
- 本地验证结果：`flutter pub get`、`flutter analyze` 通过。  

**检查**：☑ demo 已创建且可运行  ☑ 对应知识点  ☑ 已本地验证  

---

### 步骤 7：讲义与课堂练习编写

- 讲义文件：`week-12-lecture.md`（独立，permalink `/week-12/lecture/`），含 AnimationController/TickerProvider、Tween/Curve、AnimatedBuilder、Hero、PageRoute、隐式动画、运行 Demo、常见问题。  
- 课堂练习文件：`week-12-exercise.md`（permalink `/week-12/exercise/`），三则当堂练习：运行 Demo 并说明 Controller/Hero；修改时长或曲线；增加 Hero 卡片或隐式动画。  

**检查**：☑ 讲义结构完整  ☑ 已引用知识点/案例  ☑ 讲义 permalink 正确  ☑ 已创建课堂练习且 permalink 正确  

---

### 步骤 8：组合与发布

- **将课堂练习加入周聚合页**：在 `week-12-page.md`「本章资源」表中添加「课堂练习」一行，链接 `./exercise/`；将讲义链接改为 `./lecture/`（若采用独立讲义）。当前 week-12-page 仅有三行（大纲、讲义、案例），需补第四行。  
- 周聚合页链接检查：大纲 / 讲义 / 案例 / 课堂练习  
- **推送与部署**（必做）：提交时须包含 `week-12-page.md` 及本周全部相关文件，再推送到 main，触发 GitHub Pages 部署；在 GitHub Actions 中确认部署工作流成功。  
- **线上验证**（必做）：实际访问课程 GitHub Pages 发布地址，从首页进入「第12周」聚合页，逐链点击「大纲、讲义、案例、课堂练习」，确认无 404 且内容正确。  

**检查**：□ 已在聚合页添加课堂练习链接  □ 四链接正确  □ 提交已包含 week-12-page 及本周全部相关文件  □ 已推送到 main 且 Pages 部署成功  □ 已访问发布站点并逐链验证  

---

**本周方案状态**：□ 进行中  □ 已完成  

**完成日期**：（填写）
