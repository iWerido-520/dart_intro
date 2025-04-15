// 定义一个简单的类，包含可空和不可空属性
class Person {
  String name; // 不可空类型，必须有值
  int? age; // 可空类型，age 可以为 null

  Person(this.name);
}

// 函数，展示可空类型作为参数和返回值的情况
String? describePerson(Person person) {
  String description = '姓名: ${person.name}';
  if (person.age != null) {
    description += ', 年龄: ${person.age}';
  } else {
    description += ', 年龄未知';
  }
  return description;
}

// 函数，展示非空断言（!）的使用
int calculateSquare(int? number) {
  // 使用非空断言，假设 number 不会为 null，
  // 如果实际上为 null 会在运行时抛出异常
  return number! * number!;
}

// 函数，展示空值检查运算符（??）的使用
int getAgeOrDefault(Person person) {
  // 如果 person.age 为 null，则返回默认值 18
  return person.age ?? 18;
}

// 函数，展示条件成员访问（?.）的使用
void printPersonCity(Person? person) {
  // 如果 person 为 null，不会尝试访问其 city 属性，避免空指针异常
  print(person?.city);
}

extension PersonExtension on Person {
  String? get city => null; // 简单模拟获取城市信息，这里返回 null
}

void main() {
  // 创建一个 Person 实例
  Person person = Person('Alice');
  // person.age 初始化为 null
  String? personDescription = describePerson(person);
  print(personDescription);

  // 为 person.age 赋值
  person.age = 25;
  personDescription = describePerson(person);
  print(personDescription);

  // 计算可空类型数字的平方
  int? num = 5;
  int square = calculateSquare(num);
  print('数字 $num 的平方是: $square');

  // 测试空值检查运算符（??）
  int age = getAgeOrDefault(person);
  print('年龄或默认值: $age');

  // 测试条件成员访问（?.）
  Person? nullPerson = null;
  printPersonCity(nullPerson);
  printPersonCity(person);
}
