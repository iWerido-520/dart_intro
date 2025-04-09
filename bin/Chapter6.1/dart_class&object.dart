import 'dart:math';

class Point {
  double? x;
  double? y;
  double z = 0;

  Point(this.x, this.y);

  double distanceTo(Point other) {
    var dx = x! - other.x!;
    var dy = y! - other.y!;
    return sqrt(dx * dx + dy * dy);
  }
}

class ImmutablePoint {
  final double x;
  final double y;

  const ImmutablePoint(this.x, this.y);
}

class Person {
  final String _name;

  Person(this._name);

  String greet(String who) => 'Hello, $who. I am $_name.';
}

class Impostor implements Person {
  String get _name => '';

  String greet(String who) => 'Hi $who. Do you know who I am?';
}

class Queue {
  static const initialCapacity = 16;
}

class ProfileMark {
  final String name;
  final DateTime start = DateTime.now();

  ProfileMark(this.name);
  ProfileMark.unnamed() : name = '';
}

class PointWithStaticMethod {
  double x, y;
  PointWithStaticMethod(this.x, this.y);

  static double distanceBetween(
    PointWithStaticMethod a,
    PointWithStaticMethod b,
  ) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
}

void main() {
  // Using class members
  var p = Point(2, 2);
  assert(p.y == 2);
  double distance = p.distanceTo(Point(4, 4));

  // Using constructors
  var p1 = Point(2, 2);
  var p2 = Point(2, 2);
  var p3 = const ImmutablePoint(2, 2);
  var p4 = const ImmutablePoint(2, 2);
  assert(identical(p3, p4));

  // Getting an object's type
  print('The type of p1 is ${p1.runtimeType}');

  // Instance variables
  Point point = Point(0, 0);
  point.x = 4;
  assert(point.x == 4);
  //assert(point.y == null);

  // Implicit interfaces
  String greetBob(Person person) => person.greet('Bob');
  print(greetBob(Person('Kathy')));
  print(greetBob(Impostor()));

  // Class variables and methods
  assert(Queue.initialCapacity == 16);
  var a = PointWithStaticMethod(2, 2);
  var b = PointWithStaticMethod(4, 4);
  var distanceBetweenPoints = PointWithStaticMethod.distanceBetween(a, b);
  assert(2.8 < distanceBetweenPoints && distanceBetweenPoints < 2.9);
  print(distanceBetweenPoints);
}
