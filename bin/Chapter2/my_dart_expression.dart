// 元数据相关示例
import 'dart:mirrors';

// 变量相关示例
void variableExample() {
  // 声明变量的方式
  var name = 'John';
  dynamic age = 30;
  String city = 'New York';
  int count = 10;
  double price = 9.99;
  bool isStudent = true;

  //默认值
  int? lineCount;
  assert(lineCount == null);
  print(lineCount);

  // 可空变量
  String? nullableString;
  nullableString = 'This is a nullable string';

  // 最终变量
  final String finalString = 'This is a final string';
  const int constantValue = 42;

  const bar = 1000000; // Unit of pressure (dynes/cm2)
  const double atm = 1.01325 * bar; // Standard atmosphere
  var foo = const [];
  const baz = []; // Equivalent to `const []`

  const Object i = 3; // Where i is a const Object with an int value...
  const list = [i as int]; // Use a typecast.
  const map = {if (i is int) i: 'int'}; // Use is and collection if.
  const set = {if (list is List<int>) ...list}; // ...and a spread.

  print(
    'Name: $name, Age: $age, City: $city, Count: $count, Price: $price, Is Student: $isStudent',
  );
  print('Nullable String: $nullableString');
  print('Final String: $finalString, Constant Value: $constantValue');
}

// 操作符相关示例
void operatorExample() {
  int a = 5;
  int b = 3;

  // 算术操作符
  int sum = a + b;
  int difference = a - b;
  int product = a * b;
  int quotient = a ~/ b;
  int remainder = a % b;

  // 关系操作符
  bool isGreater = a > b;
  bool isLess = a < b;
  bool isGreaterOrEqual = a >= b;
  bool isLessOrEqual = a <= b;
  bool isEqual = a == b;
  bool isNotEqual = a != b;

  // 逻辑操作符
  bool logicalAnd = (a > 2) && (b < 4);
  bool logicalOr = (a > 6) || (b < 2);
  bool logicalNot = !(a > 4);

  assert(2 + 3 == 5);
  assert(2 - 3 == -1);
  assert(2 * 3 == 6);
  assert(5 / 2 == 2.5); // Result is a double
  assert(5 ~/ 2 == 2); // Result is an int
  assert(5 % 2 == 1); // Remainder
  assert('5/2 = ${5 ~/ 2} r ${5 % 2}' == '5/2 = 2 r 1');

  a = 0;
  b = ++a; // Increment a before b gets its value.
  assert(a == b); // 1 == 1

  a = 0;
  b = a++; // Increment a after b gets its value.
  assert(a != b); // 1 != 0

  a = 0;
  b = --a; // Decrement a before b gets its value.
  assert(a == b); // -1 == -1

  a = 0;
  b = a--; // Decrement a after b gets its value.
  assert(a != b); // -1 != 0

  final value = 0x22;
  final bitmask = 0x0f;

  assert((value & bitmask) == 0x02); // AND
  assert((value & ~bitmask) == 0x20); // AND NOT
  assert((value | bitmask) == 0x2f); // OR
  assert((value ^ bitmask) == 0x2d); // XOR

  assert((value << 4) == 0x220); // Shift left
  assert((value >> 4) == 0x02); // Shift right

  // Shift right example that results in different behavior on web
  // because the operand value changes when masked to 32 bits:
  assert((-value >> 4) == -0x03);

  assert((value >>> 4) == 0x02); // Unsigned shift right
  assert((-value >>> 4) > 0); // Unsigned shift right

  // Very long version uses if-else statement.
  String playerName(String? name) {
    if (name != null) {
      return name;
    } else {
      return 'Guest';
    }
  }

  /*var document;
  final button = document.querySelector('#confirm');
  button?.textContent = 'Confirm';
  button?.classList.add('important');
  var window;
  button?.onClick.listen((e) => window.alert('Confirmed!'));
  button?.scrollIntoView();*/

  print(
    'Sum: $sum, Difference: $difference, Product: $product, Quotient: $quotient, Remainder: $remainder',
  );
  print(
    'Is Greater: $isGreater, Is Less: $isLess, Is Greater Or Equal: $isGreaterOrEqual, Is Less Or Equal: $isLessOrEqual, Is Equal: $isEqual, Is Not Equal: $isNotEqual',
  );
  print(
    'Logical And: $logicalAnd, Logical Or: $logicalOr, Logical Not: $logicalNot',
  );
}

class MyMetadata {
  final String value;
  const MyMetadata(this.value);
}

@MyMetadata('example metadata')
class MyClass {}

void metadataExample() {
  var mirror = reflectClass(MyClass);
  var metadata = mirror.metadata;
  for (var meta in metadata) {
    if (meta.reflectee is MyMetadata) {
      var myMeta = meta.reflectee as MyMetadata;
      print('Metadata value: ${myMeta.value}');
    }
  }
}

// 库相关示例
// 假设我们有一个自定义库文件my_library.dart
// 在my_library.dart中
// library my_library;
//
int addNumbers(int a, int b) {
  return a + b;
}

// 在主文件中
//import 'package:your_package_name/my_library.dart';

void libraryExample() {
  int result = addNumbers(10, 20);
  print('Result from library function: $result');
}

void main() {
  variableExample();
  operatorExample();
  metadataExample();
  libraryExample();
}
