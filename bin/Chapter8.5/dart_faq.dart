// 演示非空断言操作符 (!)
void useNonNullAssertion() {
  String? nullableString = 'example';
  // 使用非空断言操作符，告诉编译器该变量不为 null
  int length = nullableString!.length;
  print('The length of the string is: $length');
}

// 演示可空类型和非空类型的函数参数处理
void processNonNullParam(int nonNullParam) {
  print('Processing non-null parameter: $nonNullParam');
}

void processNullableParam(int? nullableParam) {
  if (nullableParam != null) {
    print('Processing nullable parameter: $nullableParam');
  } else {
    print('The nullable parameter is null');
  }
}

// 演示 late 修饰符
class LateExample {
  late String lateVariable;

  LateExample(String value) {
    lateVariable = value;
  }

  void printLateVariable() {
    print('The late variable value is: $lateVariable');
  }
}

// 演示空安全中的类型提升
void typePromotionExample() {
  String? nullableStr = 'dart';
  if (nullableStr != null) {
    // 这里 nullableStr 被提升为非空类型
    int strLength = nullableStr.length;
    print('The length of the non-null string is: $strLength');
  } else {
    print('The string is null');
  }
}

// 演示可选命名参数和必需命名参数
void optionalNamedParams({int? optionalParam}) {
  if (optionalParam != null) {
    print('Optional named parameter value: $optionalParam');
  } else {
    print('No value provided for optional named parameter');
  }
}

void requiredNamedParams({required int requiredParam}) {
  print('Required named parameter value: $requiredParam');
}

// 演示函数返回值的空安全
int returnNonNullValue() {
  return 42;
}

int? returnNullableValue() {
  // 这里可以根据条件返回 null 或值
  return null;
}

void main() {
  useNonNullAssertion();

  processNonNullParam(10);
  processNullableParam(null);
  processNullableParam(20);

  var lateObj = LateExample('late initialized');
  lateObj.printLateVariable();

  typePromotionExample();

  optionalNamedParams();
  optionalNamedParams(optionalParam: 5);

  requiredNamedParams(requiredParam: 15);

  int nonNullResult = returnNonNullValue();
  print('Non-null return value: $nonNullResult');

  int? nullableResult = returnNullableValue();
  if (nullableResult != null) {
    print('Nullable return value: $nullableResult');
  } else {
    print('The return value is null');
  }
}
