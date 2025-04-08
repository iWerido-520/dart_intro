// Importing core libraries
import 'dart:io';
import 'dart:math';
// Importing libraries from external packages
import 'package:test/test.dart';
// Importing files
//import 'path/to/my_other_file.dart';

enum PlanetType { terrestrial, gas, ice, earth }

void my_variables() {
  //https://dart.cn/language/#variables
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg',
  };
}

void my_control_flow_statements() {
  var year = 1977;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];

  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }
  for (final object in flybyObjects) {
    print(object);
  }
  for (int month = 1; month <= 12; month++) {
    print(month);
  }
  while (year < 2016) {
    year += 1;
  }
}

int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

class Spacecraft {
  String name;
  DateTime? launchDate;
  int? get launchYear => launchDate?.year;

  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }
  Spacecraft.unlaunched(String name) : this(name, null);

  void describe() {
    print('Spacecraft: $name');
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

/// Enum that enumerates the different planets in our solar system
/// and some of their properties.
enum Planet {
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true),
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true);

  const Planet({
    required this.planetType,
    required this.moons,
    required this.hasRings,
  });

  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}

class Orbiter extends Spacecraft {
  double altitude;
  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}

mixin Piloted {
  int astronauts = 1;
  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(super.name, DateTime super.launchDate);
}

class MockSpaceship implements Spacecraft {
  @override
  DateTime? launchDate;

  @override
  late String name;

  @override
  void describe() {
    // TODO: implement describe
  }

  @override
  // TODO: implement launchYear
  int? get launchYear => throw UnimplementedError();
}

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}

class MyDescribable extends Describable {
  @override
  void describe() {
    print('This is a description.');
  }
}

const oneSecond = Duration(seconds: 1);
Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}

Future<void> createDescriptions(Iterable<String> objects) async {
  for (final object in objects) {
    try {
      var file = File('$object.txt');
      if (await file.exists()) {
        var modified = await file.lastModified();
        print('File for $object already exists. It was modified on $modified.');
        continue;
      }
      await file.create();
      await file.writeAsString('Start describing $object in this file.');
    } on IOException catch (e) {
      print('Cannot create description for $object: $e');
    }
  }
}

Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
  for (final object in objects) {
    await Future.delayed(oneSecond);
    yield '${craft.name} flies by $object';
  }
}

Future<void> describeFlybyObjects(List<String> flybyObjects) async {
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('Could not describe object: $e');
  } finally {
    flybyObjects.clear();
  }
}

void main(List<String> arguments) async {
  print('Hello, World!');

  my_variables();

  my_control_flow_statements();

  var result = fibonacci(20);
  print(result);

  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  flybyObjects.where((name) => name.contains('turn')).forEach(print);

  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

  final yourPlanet = Planet.neptune;
  if (!yourPlanet.isGiant) {
    print('Your planet is not a "giant planet".');
  }

  var pilotedCraft = PilotedCraft('CraftName', DateTime.now());
  pilotedCraft.describeCrew();

  var mockSpaceship = MockSpaceship();
  var invocation = Invocation.method(#someMethod, []);
  mockSpaceship.describe();

  var myDescribable = MyDescribable();
  myDescribable.describeWithEmphasis();

  // 示例数据
  List<String> objectList = ['object1', 'object2'];
  Spacecraft spacecraft = Spacecraft('Voyager I', DateTime(1977, 9, 5));

  // 调用printWithDelay
  await printWithDelay('This is a delayed message');

  // 调用createDescriptions
  await createDescriptions(objectList);

  // 调用report
  var reportStream = report(spacecraft, objectList);
  await for (var value in reportStream) {
    print(value);
  }

  // 调用describeFlybyObjects
  await describeFlybyObjects(objectList);
}
