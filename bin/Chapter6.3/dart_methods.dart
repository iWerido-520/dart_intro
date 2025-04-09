import 'dart:math';

class Point {
  double x;
  double y;

  Point(this.x, this.y);

  double distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }

  @override
  String toString() {
    return 'Point($x, $y)';
  }
}

class Rectangle {
  double left;
  double top;
  double width;
  double height;

  Rectangle(this.left, this.top, this.width, this.height);

  double area() {
    return width * height;
  }

  bool contains(Point point) {
    return point.x >= left &&
        point.x < left + width &&
        point.y >= top &&
        point.y < top + height;
  }
}

class Counter {
  int _count = 0;

  void increment() {
    _count++;
  }

  int get count => _count;
}

class Person {
  String name;

  Person(this.name);

  String greet(String who) => 'Hello, $who. I am $name.';
}

class Impostor implements Person {
  String get name => '';

  String greet(String who) => 'Hi $who. Do you know who I am?';

  @override
  set name(String _name) {
    // TODO: implement name
  }
}

class Logger {
  final String name;
  bool mute = false;

  Logger(this.name);

  void log(String msg) {
    if (!mute) {
      print('$name: $msg');
    }
  }
}

class MathUtils {
  static double distance(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
}

void main() {
  // 测试Point类的方法
  var point1 = Point(1, 1);
  var point2 = Point(4, 5);
  print(point1.distanceTo(point2));
  print(point1);

  // 测试Rectangle类的方法
  var rect = Rectangle(0, 0, 10, 5);
  print(rect.area());
  print(rect.contains(Point(5, 2)));

  // 测试Counter类的方法
  var counter = Counter();
  counter.increment();
  print(counter.count);

  // 测试Person和Impostor类的方法
  String greetBob(Person person) => person.greet('Bob');
  print(greetBob(Person('Alice')));
  print(greetBob(Impostor()));

  // 测试Logger类的方法
  var logger = Logger('TestLogger');
  logger.log('This is a test log');
  logger.mute = true;
  logger.log('This log should be muted');

  // 测试MathUtils类的静态方法
  var p1 = Point(2, 3);
  var p2 = Point(5, 7);
  print(MathUtils.distance(p1, p2));
}
