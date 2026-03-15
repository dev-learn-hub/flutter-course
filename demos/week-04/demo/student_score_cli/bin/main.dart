// 第4周案例：学生成绩管理系统（命令行版）
// 覆盖知识点：Map、List、函数、字符串插值、类型

void main() {
  // Map<String, List<int>>：学生姓名 -> 成绩列表
  final Map<String, List<int>> scores = {};

  // 添加学生与成绩
  addScore(scores, '张三', [85, 90, 78]);
  addScore(scores, '李四', [92, 88, 95]);
  addScore(scores, '王五', [76, 82, 80]);

  // 查询与统计
  print('--- 全部学生成绩 ---');
  printAll(scores);
  print('--- 张三的成绩 ---');
  printStudent(scores, '张三');
  print('--- 统计 ---');
  print('平均分: ${averageAll(scores).toStringAsFixed(1)}');
  print('最高分: ${highestAll(scores)}');
  print('最低分: ${lowestAll(scores)}');
  print('--- 按平均分排序（从高到低）---');
  printSortedByAverage(scores);
}

void addScore(Map<String, List<int>> data, String name, List<int> grades) {
  data[name] = List.from(grades);
}

void printAll(Map<String, List<int>> data) {
  for (final entry in data.entries) {
    final avg = _average(entry.value);
    print('${entry.key}: ${entry.value}，平均 ${avg.toStringAsFixed(1)}');
  }
}

void printStudent(Map<String, List<int>> data, String name) {
  final g = data[name];
  if (g == null) {
    print('未找到 $name');
    return;
  }
  print('$name: $g，平均 ${_average(g).toStringAsFixed(1)}');
}

double _average(List<int> grades) {
  if (grades.isEmpty) return 0;
  return grades.reduce((a, b) => a + b) / grades.length;
}

double averageAll(Map<String, List<int>> data) {
  if (data.isEmpty) return 0;
  var total = 0.0;
  var count = 0;
  for (final list in data.values) {
    for (final g in list) {
      total += g;
      count++;
    }
  }
  return count > 0 ? total / count : 0;
}

int highestAll(Map<String, List<int>> data) {
  int? max;
  for (final list in data.values) {
    for (final g in list) {
      if (max == null || g > max) max = g;
    }
  }
  return max ?? 0;
}

int lowestAll(Map<String, List<int>> data) {
  int? min;
  for (final list in data.values) {
    for (final g in list) {
      if (min == null || g < min) min = g;
    }
  }
  return min ?? 0;
}

void printSortedByAverage(Map<String, List<int>> data) {
  final list = data.entries.toList();
  list.sort((a, b) => _average(b.value).compareTo(_average(a.value)));
  for (final e in list) {
    print('${e.key}: ${_average(e.value).toStringAsFixed(1)}');
  }
}
