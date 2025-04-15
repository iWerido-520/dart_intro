// 定义一个包含可空类型字段的类
class Person {
  String? name;
  int? age;

  Person(this.name, this.age);

  // 方法中使用可空类型字段
  String introduce() {
    String result = 'My name is ';
    if (name != null) {
      result += name!;
    } else {
      result += 'unknown';
    }
    result += '. ';
    if (age != null) {
      result += 'I am ${age!} years old.';
    } else {
      result += 'My age is unknown.';
    }
    return result;
  }
}

// 定义一个函数，接收可空类型参数但未做空检查
void printMessage(String? message) {
  // 这里不做空检查，可能导致运行时错误
  print('Received message: $message');
}

// 定义一个返回可空类型值的函数
String? getOptionalMessage() {
  // 假设根据某些条件决定是否返回 null
  if (true) {
    return null;
  } else {
    return 'This is a message';
  }
}

// 定义一个类，其中包含可能未初始化的 late 字段
class LateInitializationExample {
  late String lateField;

  void initializeField(String value) {
    lateField = value;
  }

  void useLateField() {
    // 如果 lateField 未初始化就调用，会抛出异常
    print('The value of late field is: $lateField');
  }
}

// 定义一个函数，使用可空类型的集合
void processNullableList(List<int?> nullableList) {
  for (int? element in nullableList) {
    if (element != null) {
      print('Element value: $element');
    } else {
      print('Element is null');
    }
  }
}

void main() {
  // 创建 Person 实例
  var person = Person('Alice', 30);
  print(person.introduce());

  // 调用 printMessage 函数
  printMessage('Hello, world!');
  printMessage(null);

  // 获取可空消息
  String? message = getOptionalMessage();
  if (message != null) {
    print('The message is: $message');
  } else {
    print('No message received');
  }

  // 测试 late 字段初始化
  var lateExample = LateInitializationExample();
  // lateExample.useLateField(); // 这行会抛出异常，因为 lateField 未初始化
  lateExample.initializeField('Initialized value');
  lateExample.useLateField();

  // 测试可空类型的集合
  List<int?> nullableList = [1, null, 3];
  processNullableList(nullableList);
}
