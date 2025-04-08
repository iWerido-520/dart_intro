// 内置类型示例
void builtInTypesExample() {
  // 数字类型
  int intValue = 42;
  double doubleValue = 3.14;

  // 字符串类型
  String stringValue = 'Hello, Dart';

  // 布尔类型
  bool boolValue = true;

  // 列表（List）也是一种内置类型
  List<int> intList = [1, 2, 3];

  print(
    'Int value: $intValue, Double value: $doubleValue, String value: $stringValue, Bool value: $boolValue, Int list: $intList',
  );
}

// 记录（Records）示例
void recordsExample() {
  // 创建记录
  var person = (name: 'Alice', age: 30, city: 'London');

  // 访问记录的字段
  print(
    'Person name: ${person.name}, Age: ${person.age}, City: ${person.city}',
  );

  // 解构记录
  /*var (name, age, city) = person;
  print('Deconstructed: Name: $name, Age: $age, City: $city');*/
}

// 集合（Collections）示例
void collectionsExample() {
  // 列表（List）
  List<String> fruits = ['apple', 'banana', 'cherry'];
  fruits.add('date');
  print('Fruits list: $fruits');

  // 集合（Set）
  Set<int> numbersSet = {1, 2, 3};
  numbersSet.add(4);
  print('Numbers set: $numbersSet');

  // 映射（Map）
  Map<String, int> ages = {'Bob': 25, 'Charlie': 35};
  ages['David'] = 40;
  print('Ages map: $ages');
}

// 泛型（Generics）示例
class Box<T> {
  T? value;

  Box(this.value);

  T? getValue() {
    return value;
  }
}

void genericsExample() {
  Box<int> intBox = Box(10);
  Box<String> stringBox = Box('Generic string');

  print(
    'Int box value: ${intBox.getValue()}, String box value: ${stringBox.getValue()}',
  );
}

// 类型别名（Typedefs）示例
typedef StringCallback = void Function(String str);

void printString(StringCallback callback) {
  String message = 'This is a test string';
  callback(message);
}

void typedefsExample() {
  StringCallback printMessage = (String str) {
    print(str);
  };

  printString(printMessage);
}

// 类型系统示例
void typeSystemExample() {
  num numValue = 5; // num是int和double的父类型
  if (numValue is int) {
    print('The value is an integer');
  } else if (numValue is double) {
    print('The value is a double');
  }

  dynamic dynamicValue = 'A dynamic value';
  print('Dynamic value: $dynamicValue');
  dynamicValue = 10;
  print('Changed dynamic value: $dynamicValue');
}

void main() {
  builtInTypesExample();
  recordsExample();
  collectionsExample();
  genericsExample();
  typedefsExample();
  typeSystemExample();
}


/*// String -> int
var one = int.parse('1');
assert(one == 1);

// String -> double
var onePointOne = double.parse('1.1');
assert(onePointOne == 1.1);

// int -> String
String oneAsString = 1.toString();
assert(oneAsString == '1');

// double -> String
String piAsString = 3.14159.toStringAsFixed(2);
assert(piAsString == '3.14');

assert((3 << 1) == 6); // 0011 << 1 == 0110
assert((3 | 4) == 7); // 0011 | 0100 == 0111
assert((3 & 4) == 0); // 0011 & 0100 == 0000

const msPerSecond = 1000;
const secondsUntilRetry = 5;
const msUntilRetry = secondsUntilRetry * msPerSecond;

var n1 = 1_000_000;
var n2 = 0.000_000_000_01;
var n3 = 0x00_14_22_01_23_45; // MAC address
var n4 = 555_123_4567; // US Phone number
var n5 = 100__000_000__000_000; // one hundred million million!

var s1 = 'Single quotes work well for string literals.';
var s2 = "Double quotes work just as well.";
var s3 = 'It\'s easy to escape the string delimiter.';
var s4 = "It's even easier to use the other delimiter.";

var s = 'string interpolation';

assert(
  'Dart has $s, which is very handy.' ==
      'Dart has string interpolation, '
          'which is very handy.',
);
assert(
  'That deserves all caps. '
          '${s.toUpperCase()} is very handy!' ==
      'That deserves all caps. '
          'STRING INTERPOLATION is very handy!',
);

var s1 =
    'String '
    'concatenation'
    " works even over line breaks.";
assert(
  s1 ==
      'String concatenation works even over '
          'line breaks.',
);

var s2 = 'The + operator ' + 'works, as well.';
assert(s2 == 'The + operator works, as well.');

var s1 = '''
You can create
multi-line strings like this one.
''';

var s2 = """This is also a
multi-line string.""";

// These work in a const string.
const aConstNum = 0;
const aConstBool = true;
const aConstString = 'a constant string';

// These do NOT work in a const string.
var aNum = 0;
var aBool = true;
var aString = 'a string';
const aConstList = [1, 2, 3];

const validConstString = '$aConstNum $aConstBool $aConstString';
// const invalidConstString = '$aNum $aBool $aString $aConstList';

// Check for an empty string.
var fullName = '';
assert(fullName.isEmpty);

// Check for zero.
var hitPoints = 0;
assert(hitPoints == 0);

// Check for null.
var unicorn = null;
assert(unicorn == null);

// Check for NaN.
var iMeantToDoThis = 0 / 0;
assert(iMeantToDoThis.isNaN);

import 'package:characters/characters.dart';

void main() {
  var hi = 'Hi 🇩🇰';
  print(hi);
  print('The end of the string: ${hi.substring(hi.length - 1)}');
  print('The last character: ${hi.characters.last}');
}

var record = ('first', a: 2, b: true, 'last');
(int, int) swap((int, int) record) {
  var (a, b) = record;
  return (b, a);
}
// Record type annotation in a variable declaration:
(String, int) record;

// Initialize it with a record expression:
record = ('A string', 123);

// Record type annotation in a variable declaration:
({int a, bool b}) record;

// Initialize it with a record expression:
record = (a: 123, b: true);

({int a, int b}) recordAB = (a: 1, b: 2);
({int x, int y}) recordXY = (x: 3, y: 4);

// Compile error! These records don't have the same type.
// recordAB = recordXY;(int a, int b) recordAB = (1, 2);
(int x, int y) recordXY = (3, 4);

recordAB = recordXY; // OK.

var record = ('first', a: 2, b: true, 'last');

print(record.$1); // Prints 'first'
print(record.a); // Prints 2
print(record.b); // Prints true
print(record.$2); // Prints 'last'

(num, Object) pair = (42, 'a');

var first = pair.$1; // Static type `num`, runtime type `int`.
var second = pair.$2; // Static type `Object`, runtime type `String`.

(int x, int y, int z) point = (1, 2, 3);
(int r, int g, int b) color = (1, 2, 3);

print(point == color); // Prints 'true'.

({int x, int y, int z}) point = (x: 1, y: 2, z: 3);
({int r, int g, int b}) color = (r: 1, g: 2, b: 3);

print(point == color); // Prints 'false'. Lint: Equals on unrelated types.

// Returns multiple values in a record:
(String name, int age) userInfo(Map<String, dynamic> json) {
  return (json['name'] as String, json['age'] as int);
}

final json = <String, dynamic>{'name': 'Dash', 'age': 10, 'color': 'blue'};

// Destructures using a record pattern with positional fields:
var (name, age) = userInfo(json);

/* Equivalent to:
  var info = userInfo(json);
  var name = info.$1;
  var age  = info.$2;
*/

final buttons = [
  (
    label: "Button I",
    icon: const Icon(Icons.upload_file),
    onPressed: () => print("Action -> Button I"),
  ),
  (
    label: "Button II",
    icon: const Icon(Icons.info),
    onPressed: () => print("Action -> Button II"),
  )
];

typedef ButtonItem = ({String label, Icon icon, void Function()? onPressed});
final List<ButtonItem> buttons = [
  // ...
];

  List<Container> widget = [
    for (var button in buttons)
      Container(
        margin: const EdgeInsets.all(4.0),
        child: OutlinedButton.icon(
          onPressed: button.onPressed,
          icon: button.icon,
          label: Text(button.label),
        ),
      ),
  ];

class ButtonItem {
  final String label;
  final Icon icon;
  final void Function()? onPressed;
  ButtonItem({required this.label, required this.icon, this.onPressed});
  bool get hasOnpressed => onPressed != null;
}

extension type ButtonItem._(({String label, Icon icon, void Function()? onPressed}) _) {
  String get label => _.label;
  Icon get icon => _.icon;
  void Function()? get onPressed => _.onPressed;
  ButtonItem({required String label, required Icon icon, void Function()? onPressed})
      : this._((label: label, icon: icon, onPressed: onPressed));
  bool get hasOnpressed => _.onPressed != null;
}

final List<ButtonItem> buttons =  [
  ButtonItem(
    label: "Button I",
    icon: const Icon(Icons.upload_file),
    onPressed: () => print("Action -> Button I"),
  ),
  ButtonItem(
    label: "Button II",
    icon: const Icon(Icons.info),
    onPressed: () => print("Action -> Button II"),
  )
];

final constantSet = const {
  'fluorine',
  'chlorine',
  'bromine',
  'iodine',
  'astatine',
};
// constantSet.add('helium'); // This line will cause an error.

var gifts = {
  // Key:    Value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 'golden rings',
};

var nobleGases = {2: 'helium', 10: 'neon', 18: 'argon'};var gifts = Map<String, String>();
gifts['first'] = 'partridge';
gifts['second'] = 'turtledoves';
gifts['fifth'] = 'golden rings';

var nobleGases = Map<int, String>();
nobleGases[2] = 'helium';
nobleGases[10] = 'neon';
nobleGases[18] = 'argon';

typedef ListMapper<X> = Map<X, List<X>>;
Map<String, List<String>> m1 = {}; // Verbose.
ListMapper<String> m2 = {}; // Same thing but shorter and clearer.

typedef Compare<T> = int Function(T a, T b);

int sort(int a, int b) => a - b;

void main() {
  assert(sort is Compare<int>); // True!
}

class A<X extends A<X>> {}

class B extends A<B> {}

class C extends B {}

void f<X extends A<X>>(X x) {}

void main() {
  f(B()); // OK.

  // OK. Without using bounds, inference relying on best-effort approximations
  // would fail after detecting that `C` is not a subtype of `A<C>`.
  f(C());

  f<B>(C()); // OK.
}*/