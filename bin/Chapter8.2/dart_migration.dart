import 'package:collection/collection.dart';

// 示例1：基本的可空类型和不可空类型
void basicNullableAndNonNullableTypes() {
  // 不可空类型
  int nonNullableInt = 10;
  // 尝试赋值为null会报错，因为nonNullableInt是不可空类型
  // nonNullableInt = null;

  // 可空类型
  int? nullableInt;
  nullableInt = null;
  nullableInt = 20;
  print('基本的可空类型和不可空类型示例：nullableInt的值为 $nullableInt');
}

// 示例2：使用安全导航操作符?.
class Person {
  String? name;
  int? age;
}

void safeNavigationOperatorExample() {
  Person person = Person();
  // 使用安全导航操作符?.避免空指针异常
  print('安全导航操作符示例：person的名字长度为 ${person.name?.length}');
}

// 示例3：使用级联操作符..和空安全
class Car {
  String? brand;
  int? year;

  Car setBrand(String brand) {
    this.brand = brand;
    return this;
  }

  Car setYear(int year) {
    this.year = year;
    return this;
  }
}

void cascadeOperatorWithNullSafetyExample() {
  Car? car;
  // 使用空安全级联操作符..?
  car?.setBrand('Toyota')?.setYear(2023);
  print('级联操作符和空安全示例：car的品牌为 ${car?.brand}，年份为 ${car?.year}');
}

// 示例4：非空断言操作符!
void nonNullAssertionOperatorExample() {
  int? nullableNumber = 5;
  // 使用非空断言操作符!，如果nullableNumber为null会抛出异常
  int nonNullNumber = nullableNumber!;
  print('非空断言操作符示例：nonNullNumber的值为 $nonNullNumber');
}

// 示例5：在方法参数和返回值中使用空安全
int addNumbers(int? num1, int? num2) {
  // 使用空安全检查来处理可能为null的参数
  num1 = num1 ?? 0;
  num2 = num2 ?? 0;
  return num1 + num2;
}

void methodParametersAndReturnsWithNullSafetyExample() {
  int result = addNumbers(3, null);
  print('方法参数和返回值的空安全示例：结果为 $result');
}

// 示例6：迁移步骤中的示例，先处理简单的可空类型情况
class Book {
  String? title;
  int? pageCount;
}

void migrationStepExample1() {
  Book book = Book();
  // 模拟迁移过程中对可空类型的处理
  book.title = 'Effective Dart';
  book.pageCount = 200;
  print('迁移步骤示例1：book的标题为 ${book.title}，页数为 ${book.pageCount}');
}

// 示例7：处理集合类型的空安全
void collectionNullSafetyExample() {
  List<String>? stringList;
  // 使用集合相关的空安全操作
  stringList = ['apple', 'banana'];
  print('集合空安全示例：stringList的第一个元素为 ${stringList.firstOrNull}');
}

void main() {
  print('空安全示例开始');
  basicNullableAndNonNullableTypes();
  safeNavigationOperatorExample();
  cascadeOperatorWithNullSafetyExample();
  nonNullAssertionOperatorExample();
  methodParametersAndReturnsWithNullSafetyExample();
  migrationStepExample1();
  collectionNullSafetyExample();
  print('空安全示例结束');
}
