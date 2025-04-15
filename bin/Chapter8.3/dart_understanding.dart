// 定义一个类，用于演示空安全相关特性
class ExampleClass {
  // 非空类型的实例字段，必须在构造体开始执行前被初始化
  int nonNullableField = 0;
  // 可空类型的实例字段
  String? nullableField;
  // late修饰的非空类型字段，延迟初始化
  late String lateField;
  // late final修饰的字段，延迟初始化且只能赋值一次
  late final String lateFinalField;

  // 构造函数
  ExampleClass({
    required this.nonNullableField,
    this.nullableField,
    required String initialLateField,
    required String initialLateFinalField,
  }) : lateField = initialLateField,
       lateFinalField = initialLateFinalField;

  // 定义一个方法，接收一个可空字符串参数，并处理它
  void processNullableString(String? str) {
    // 使用避空运算符调用方法
    print(str?.length);
    // 使用新的空判断级联操作符
    //str?.toUpperCase()?.trim()?..print();
    // 使用空判断索引操作符
    List<String?> list = [str];
    print(list[0]?.length);
  }

  // 定义一个方法，返回一个字符串
  String getMessage() {
    if (nullableField != null) {
      // 空检查的类型提升，这里nullableField的类型被提升为非空
      return nullableField!.toUpperCase();
    } else {
      return 'No value';
    }
  }

  // 定义一个方法，用于演示绝对的赋值分析
  int calculateValue() {
    int result;
    if (nonNullableField > 10) {
      result = nonNullableField * 2;
    } else {
      result = nonNullableField + 5;
    }
    return result;
  }

  // 定义一个方法，用于演示未初始化变量相关规则
  void checkInitialization() {
    // 局部变量必须确保在使用前被赋值
    int localVar;
    if (nonNullableField % 2 == 0) {
      localVar = 10;
    } else {
      localVar = 20;
    }
    print(localVar);
  }
}

// 定义一个泛型类，演示泛型与可空性的交互
class GenericBox<T> {
  T? object;
  GenericBox.empty();
  GenericBox.full(this.object);

  // 从盒子中取出对象，使用as T进行转换
  T unbox() => object as T;
}

// 定义一个函数，接收必需的命名参数
void requiredNamedParamFunction({
  required int requiredParam,
  String? optionalParam,
}) {
  print('Required param: $requiredParam');
  if (optionalParam != null) {
    print('Optional param: $optionalParam');
  }
}

// 定义一个抽象类，包含抽象字段
abstract class AbstractCup {
  abstract Beverage contents;
}

// 定义一个具体类，实现抽象类
class ConcreteCup implements AbstractCup {
  @override
  Beverage contents;

  ConcreteCup(this.contents);
}

// 定义一个Beverage类，用于演示抽象字段相关
class Beverage {}

void main() {
  // 创建ExampleClass实例
  var example = ExampleClass(
    nonNullableField: 5,
    nullableField: 'test',
    initialLateField: 'delayed value',
    initialLateFinalField: 'final delayed value',
  );
  // 调用方法
  example.processNullableString('hello');
  example.processNullableString(null);
  print(example.getMessage());
  print(example.calculateValue());
  example.checkInitialization();

  // 演示泛型类
  var box = GenericBox<String?>.full(null);
  print(box.unbox());

  // 调用包含必需命名参数的函数
  requiredNamedParamFunction(requiredParam: 10, optionalParam: 'optional');
  requiredNamedParamFunction(requiredParam: 20);

  // 演示Map的索引操作符
  var map = {'key': 'value'};
  // 这里会报错，因为map['key']返回的是可空类型
  // print(map['key'].length);
  // 使用!操作符解决
  print(map['key']!.length);

  // 演示List相关改动
  // 创建一个非空列表
  var nonNullableList = List<int>.filled(3, 0);
  // 尝试设置更大的长度会抛出异常
  // nonNullableList.length = 5;
  // 创建一个可空列表
  var nullableList = List<int?>.filled(3, null);
  //nullableList.length = 5;
  print(nullableList);

  // 演示Iterable相关改动
  var iterable = [1, 2, 3].iterator;
  // 在迭代前调用current会抛出异常
  // print(iterable.current);
  iterable.moveNext();
  print(iterable.current);
  iterable.moveNext();
  print(iterable.current);
  iterable.moveNext();
  print(iterable.current);
  // 在迭代结束后调用current会抛出异常
  // iterable.moveNext();
  // print(iterable.current);
}
