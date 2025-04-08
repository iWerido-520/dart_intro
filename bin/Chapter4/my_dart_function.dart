// 判断原子序数是否属于稀有气体
bool isNoble(int atomicNumber) {
  Map<int, String> _nobleGases = {2: 'He', 10: 'Ne', 18: 'Ar'};
  return _nobleGases[atomicNumber] != null;
}

// 设置标志位
void enableFlags({bool bold = false, bool hidden = false}) {
  print('bold: $bold, hidden: $hidden');
}

// 生成消息
String say(String from, String msg, [String device = 'carrier pigeon']) {
  var result = '$from says $msg with a $device';
  return result;
}

// 打印元素
void printElement(int element) {
  print(element);
}

// 创建一个加法器函数
Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

// 测试函数相等性时用到的类
class A {
  static void bar() {}
  void baz() {}
}

// 同步生成器函数
Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) yield k++;
}

// 异步生成器函数
Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) yield k++;
}

void main() {
  // 测试isNoble函数
  print(isNoble(2));
  print(isNoble(5));

  // 测试enableFlags函数
  enableFlags(bold: true);
  enableFlags(hidden: true);
  enableFlags(bold: true, hidden: true);

  // 测试say函数
  print(say('Alice', 'Hello'));
  print(say('Bob', 'Howdy', 'smoke signal'));

  // 测试函数作为参数传递
  var list = [1, 2, 3];
  list.forEach(printElement);

  // 测试匿名函数
  const fruitList = ['apples', 'bananas', 'oranges'];
  var uppercaseList = fruitList.map((item) => item.toUpperCase()).toList();
  uppercaseList.forEach((item) => print('$item: ${item.length}'));

  // 测试闭包
  var add2 = makeAdder(2);
  var add4 = makeAdder(4);
  print(add2(3));
  print(add4(3));

  // 测试函数相等性
  void foo() {}
  Function x;
  x = foo;
  print(foo == x);
  x = A.bar;
  print(A.bar == x);
  var v = A();
  var w = A();
  var y = w;
  x = w.baz;
  print(y.baz == x);
  print(v.baz != w.baz);

  // 测试生成器
  for (int num in naturalsTo(5)) {
    print(num);
  }
  asynchronousNaturalsTo(3).listen((num) {
    print(num);
  });
}


/*bool isNoble(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}
isNoble(atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}
bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;
/// Sets the [bold] and [hidden] flags ...
void enableFlags({bool? bold, bool? hidden}) {
  ...
}
enableFlags(bold: true, hidden: false);
/// Sets the [bold] and [hidden] flags ...
void enableFlags({bool bold = false, bool hidden = false}) {
  ...
}

// bold will be true; hidden will be false.
enableFlags(bold: true);
const Scrollbar({super.key, required Widget child});
const Scrollbar({super.key, required Widget? child});
repeat(times: 2, () {
  ...
});
String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}
assert(say('Bob', 'Howdy') == 'Bob says Howdy');
assert(
  say('Bob', 'Howdy', 'smoke signal') ==
      'Bob says Howdy with a smoke signal',
);
String say(String from, String msg, [String device = 'carrier pigeon']) {
  var result = '$from says $msg with a $device';
  return result;
}

assert(say('Bob', 'Howdy') == 'Bob says Howdy with a carrier pigeon');
void main() {
  print('Hello, World!');
}
// Run the app like this: dart run args.dart 1 test
void main(List<String> arguments) {
  print(arguments);

  assert(arguments.length == 2);
  assert(int.parse(arguments[0]) == 1);
  assert(arguments[1] == 'test');
}
void printElement(int element) {
  print(element);
}

var list = [1, 2, 3];

// Pass printElement as a parameter.
list.forEach(printElement);
var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
assert(loudify('hello') == '!!! HELLO !!!');
void greet(String name, {String greeting = 'Hello'}) =>
    print('$greeting $name!');

// Store `greet` in a variable and call it.
void Function(String, {String greeting}) g = greet;
g('Dash', greeting: 'Howdy');
([[Type] param1[, ...]]) {
  codeBlock;
}
const list = ['apples', 'bananas', 'oranges'];

var uppercaseList =
    list.map((item) {
      return item.toUpperCase();
    }).toList();
// Convert to list after mapping

for (var item in uppercaseList) {
  print('$item: ${item.length}');
}
var uppercaseList = list.map((item) => item.toUpperCase()).toList();
uppercaseList.forEach((item) => print('$item: ${item.length}'));
bool topLevel = true;

void main() {
  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  }
}
/// Returns a function that adds [addBy] to the
/// function's argument.
Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

void main() {
  // Create a function that adds 2.
  var add2 = makeAdder(2);

  // Create a function that adds 4.
  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);
}
// Function tear-off
charCodes.forEach(print);

// Method tear-off
charCodes.forEach(buffer.write);
void foo() {} // A top-level function

class A {
  static void bar() {} // A static method
  void baz() {} // An instance method
}

void main() {
  Function x;

  // Comparing top-level functions.
  x = foo;
  assert(foo == x);

  // Comparing static methods.
  x = A.bar;
  assert(A.bar == x);

  // Comparing instance methods.
  var v = A(); // Instance #1 of A
  var w = A(); // Instance #2 of A
  var y = w;
  x = w.baz;

  // These closures refer to the same instance (#2),
  // so they're equal.
  assert(y.baz == x);

  // These closures refer to different instances,
  // so they're unequal.
  assert(v.baz != w.baz);
}
(String, int) foo() {
  return ('something', 42);
}
Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) yield k++;
}
Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) yield k++;
}
Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
  }
}
external void someFunc(int i);
*/