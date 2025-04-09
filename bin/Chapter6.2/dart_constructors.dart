class Point {
  double x;
  double y;

  // 生成式构造函数
  Point(this.x, this.y);

  // 命名构造函数
  Point.origin() : x = 0, y = 0;

  // 重定向构造函数
  Point.alongXAxis(double x) : this(x, 0);

  @override
  String toString() {
    return 'Point($x, $y)';
  }
}

class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);
  final double x;
  final double y;

  const ImmutablePoint(this.x, this.y);

  @override
  String toString() {
    return 'ImmutablePoint($x, $y)';
  }
}

class Logger {
  final String name;
  bool mute = false;
  static final Map<String, Logger> _cache = <String, Logger>{};

  // 工厂构造函数
  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

class PointA {
  double x = 1.0;
  double y = 2.0;

  @override
  String toString() {
    return 'PointA($x, $y)';
  }
}

class PointB {
  final double x;
  final double y;

  PointB(this.x, this.y);
  PointB.optional([this.x = 0.0, this.y = 0.0]);

  @override
  String toString() {
    return 'PointB($x, $y)';
  }
}

class PointC {
  double x;
  double y;

  PointC.named({this.x = 1.0, this.y = 1.0});

  @override
  String toString() {
    return 'PointC.named($x, $y)';
  }
}

class PointD {
  double? x;
  double? y;

  PointD(this.x, this.y);

  @override
  String toString() {
    return 'PointD($x, $y)';
  }
}

class Person {
  String name;

  Person(this.name);

  Person.fromJson(Map<String, dynamic> json) : name = json['name'];
}

class Employee extends Person {
  Employee() : super.fromJson({'name': 'defaultName'});
}

class Vector2d {
  final double x;
  final double y;

  Vector2d(this.x, this.y);
  Vector2d.named({required this.x, required this.y});
}

class Vector3d extends Vector2d {
  final double z;

  Vector3d(super.x, super.y, this.z);
  Vector3d.yzPlane({required super.y, required this.z}) : super.named(x: 0);
}

void main() {
  // 测试Point类
  var point1 = Point(1, 2);
  var point2 = Point.origin();
  var point3 = Point.alongXAxis(5);
  print(point1);
  print(point2);
  print(point3);

  // 测试ImmutablePoint类
  var immutablePoint1 = const ImmutablePoint(3, 4);
  var immutablePoint2 = ImmutablePoint.origin;
  print(immutablePoint1);
  print(immutablePoint2);

  // 测试Logger类
  var logger1 = Logger('test1');
  var logger2 = Logger.fromJson({'name': 'test2'});
  logger1.log('log message 1');
  logger2.log('log message 2');

  // 测试PointA类
  var pointA = PointA();
  print(pointA);

  // 测试PointB类
  var pointB1 = PointB(1, 1);
  var pointB2 = PointB.optional();
  print(pointB1);
  print(pointB2);

  // 测试PointC类
  var pointC = PointC.named(x: 3, y: 3);
  print(pointC);

  // 测试PointD类
  var pointD1 = PointD(4, 4);
  var pointD2 = PointD(null, null);
  print(pointD1);
  print(pointD2);

  // 测试Employee类
  var employee = Employee();
  print(employee.name);

  // 测试Vector3d类
  var vector3d1 = Vector3d(1, 2, 3);
  var vector3d2 = Vector3d.yzPlane(y: 4, z: 5);
  var x, y, z;
  print('Vector3d: ($x, $y, $z)');
  print('Vector3d yzPlane: ($x, $y, $z)');
}
