extension type IdNumber(int id) {
  // Wraps the 'int' type's '<' operator:
  operator <(IdNumber other) => id < other.id;
  // Doesn't declare the '+' operator, for example,
  // because addition does not make sense for ID numbers.
}

extension type E(int i) {
  E.n(this.i);
  E.m(int j, String foo) : i = j + foo.length;
}

extension type NumberE(int value) {
  // Operator:
  NumberE operator +(NumberE other) => NumberE(value + other.value);
  // Getter:
  NumberE get myNum => this;
  // Method:
  bool isValid() => !value.isNegative;
}

extension type NumberI(int i) implements int {
  // 'NumberI' can invoke all members of 'int',
  // plus anything else it declares here.
}

extension type Sequence<T>(List<T> _) implements Iterable<T> {
  // Better operations than List.
}

extension type Id(int _id) implements Object {
  // Makes the extension type non - nullable.
  static Id? tryParse(String source) => int.tryParse(source) as Id?;
}

extension type const Opt<T>._(({T value})? _) {
  const factory Opt(T value) = Val<T>;
  const factory Opt.none() = Non<T>;
}

extension type const Val<T>._(({T value}) _) implements Opt<T> {
  const Val(T value) : this._((value: value));
  T get value => _.value;
}

extension type const Non<T>._(Null _) implements Opt<Never> {
  const Non() : this._(null);
}

extension type MyString(String _) implements String {
  // Replaces 'String.operator[]'
  //@redeclare
  int operator [](int index) => codeUnitAt(index);
}

extension type NumberT(int value) implements int {
  // Doesn't explicitly declare any members of 'int'.
  NumberT get i => this;
}

void main() {
  // IdNumber 相关测试
  int myUnsafeId = 42424242;
  myUnsafeId = myUnsafeId + 10;
  var safeId = IdNumber(42424242);
  // safeId + 10; // Compile - time error: No '+' operator.
  // myUnsafeId = safeId; // Compile - time error: Wrong type.
  myUnsafeId = safeId as int;
  print(safeId < IdNumber(42424241));

  // E 相关测试
  E(4);
  E.n(3);
  E.m(5, "Hello!");

  // NumberE 相关测试
  var num = NumberE(1);
  var sum1 = num + num;
  print(sum1.isValid());
  // num1.isNegative(); // Error: 'NumberE' does not define 'int' member 'isNegative'.
  // var diff1 = num1 - num1; // Error: 'NumberE' does not define 'int' member '-'
  var diff2 = num.value - 2;
  // var sum2 = num1 + 2; // Error: Can't assign 'int' to parameter type 'NumberE'.

  // NumberI 相关测试
  var numberI = NumberI(5);
  print(numberI + 3);

  // Sequence 相关测试（此处仅定义，未实际测试操作）

  // Id 相关测试（此处仅定义，未实际测试操作）

  // Opt、Val、Non 相关测试（此处仅定义，未实际测试操作）

  // MyString 相关测试（此处仅定义，未实际测试操作）

  // NumberT 相关测试
  var v1 = NumberT(1);
  int v2 = NumberT(2);
  var v3 = v1.i - v1;
  var v4 = v2 + v1;
  var v5 = 2 + v1;
  // v2.i; // Error: Extension type interface is not available to representation type

  // 类型测试
  var n = NumberE(1);
  if (n is int) {
    print(n.value);
  }
  if (n case int x) {
    print(x.toRadixString(10));
  }
  switch (n) {
    case int(:var isEven):
      print("$n (${isEven ? "even" : "odd"})");
  }

  int i = 2;
  if (i is NumberE) {
    print("It is");
  }
  if (i case NumberE v) {
    print("value: ${v.value}");
  }
  switch (i) {
    case NumberE(:var value):
      print("value: $value");
  }
}
