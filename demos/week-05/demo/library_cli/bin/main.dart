// 第5周案例：图书馆管理系统（命令行版）
// 覆盖知识点：类与对象、继承、异常处理

class Book {
  final String title;
  final String author;
  final String isbn;
  final int year;

  Book(this.title, this.author, this.isbn, this.year);

  @override
  String toString() => '[$isbn] $title — $author ($year)';
}

class DuplicateIsbnException implements Exception {
  final String isbn;
  DuplicateIsbnException(this.isbn);
  @override
  String toString() => 'DuplicateIsbnException: ISBN $isbn already exists';
}

class Library {
  final Map<String, Book> _books = {};

  void addBook(Book book) {
    if (_books.containsKey(book.isbn)) {
      throw DuplicateIsbnException(book.isbn);
    }
    _books[book.isbn] = book;
  }

  Book? findById(String isbn) => _books[isbn];

  List<Book> findByAuthor(String author) {
    return _books.values.where((b) => b.author == author).toList();
  }

  List<Book> listAll() => _books.values.toList();

  void removeBook(String isbn) {
    if (!_books.containsKey(isbn)) {
      throw StateError('Book with ISBN $isbn not found');
    }
    _books.remove(isbn);
  }

  int get count => _books.length;
}

void main() {
  final lib = Library();

  lib.addBook(Book('Dart 语言导览', 'Dart Team', '978-0-00-000001-1', 2024));
  lib.addBook(Book('Flutter 实战', '杜文', '978-0-00-000002-2', 2020));

  print('--- 全部图书 (${lib.count} 本) ---');
  for (final b in lib.listAll()) {
    print(b);
  }

  print('\n--- 按作者查询「杜文」---');
  for (final b in lib.findByAuthor('杜文')) {
    print(b);
  }

  print('\n--- 按 ISBN 查询 ---');
  final book = lib.findById('978-0-00-000001-1');
  print(book ?? '未找到');

  print('\n--- 异常演示：重复 ISBN ---');
  try {
    lib.addBook(Book('另一本书', '某人', '978-0-00-000001-1', 2023));
  } on DuplicateIsbnException catch (e) {
    print('捕获: $e');
  }

  print('\n--- 删除后再次列表 ---');
  lib.removeBook('978-0-00-000002-2');
  for (final b in lib.listAll()) {
    print(b);
  }
}
