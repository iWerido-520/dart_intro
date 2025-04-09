// 定义类A
/*class A {
  int value = 0;
}

// 为A类定义扩展方法
extension AExtensions on A {
  void increment() {
    value++;
  }

  int doubleValue() {
    return value * 2;
  }
}

// 定义类IterableExtension<T>
class IterableExtension<T> on Iterable<T> {
  T elementAtOrDefault(int index, [T defaultValue]) {
    if (index >= 0 && index < length) {
      return elementAt(index);
    } else {
      return defaultValue;
    }
  }
}

// 定义类num
class num {
  num this.value;
}

// 为num类定义扩展方法
extension NumExtensions on num {
  num add(num other) {
    return num(this.value + other.value);
  }

  num subtract(num other) {
    return num(this.value - other.value);
  }
}

// 定义类StringExtensions
class StringExtensions on String {
  String reverse() {
    return split('').reversed.join('');
  }

  bool isPalindrome() {
    return this == reverse();
  }
}

// 主函数
void main() {
  // 测试类A的扩展方法
  A a = A();
  print('初始值: ${a.value}');
  a.increment();
  print('增加后的值: ${a.value}');
  print('值的两倍: ${a.doubleValue()}');

  // 测试Iterable的扩展方法
  List<int> list = [1, 2, 3];
  print('索引1处的元素: ${list.elementAtOrDefault(1)}');
  print('索引5处的元素（默认值为10）: ${list.elementAtOrDefault(5, 10)}');

  // 测试num类的扩展方法
  num num1 = num(5);
  num num2 = num(3);
  num sum = num1.add(num2);
  num difference = num1.subtract(num2);
  print('两数之和: ${sum.value}');
  print('两数之差: ${difference.value}');

  // 测试String的扩展方法
  String str = 'hello';
  print('反转后的字符串: ${str.reverse()}');
  String palindrome = 'racecar';
  print('$palindrome 是否是回文: ${palindrome.isPalindrome()}');
}*/

// 为String类定义扩展方法
extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }

  double parseDouble() {
    return double.parse(this);
  }
}

// 为String类定义另一个扩展方法
extension StringUtils on String {
  bool get isBlank => trim().isEmpty;
  String reverse() {
    return split('').reversed.join('');
  }
}

// 为List<T>定义泛型扩展方法
extension MyFancyList<T> on List<T> {
  int get doubleLength => length * 2;
  List<T> operator -() => reversed.toList();
  List<List<T>> split(int at) => [sublist(0, at), sublist(at)];
}

void main() {
  // 使用String的扩展方法
  print('42'.parseInt());
  print('42'.parseDouble());
  print('  '.isBlank);
  print('hello'.reverse());

  // 使用List的扩展方法
  List<int> list = [1, 2, 3, 4];
  print(list.doubleLength);
  print(-list);
  print(list.split(2));
}
