void main() {
  // For循环示例
  var message = StringBuffer('Dart is fun');
  for (var i = 0; i < 5; i++) {
    message.write('!');
  }
  print(message);

  // For-in循环示例
  var candidates = [
    {'name': 'Alice', 'yearsExperience': 3},
    {'name': 'Bob', 'yearsExperience': 7},
    {'name': 'Charlie', 'yearsExperience': 4},
  ];
  for (final candidate in candidates) {
    print(
      '${candidate['name']} has ${candidate['yearsExperience']} years of experience.',
    );
  }

  // While循环示例
  var isDone = false;
  while (!isDone) {
    print('Working...');
    // 模拟任务完成
    isDone = true;
  }

  // Do-while循环示例
  var atEndOfPage = false;
  do {
    print('Printing line...');
    // 模拟到达页面末尾
    atEndOfPage = true;
  } while (!atEndOfPage);

  // Break示例
  while (true) {
    if (shutDownRequested()) break;
    processIncomingRequests();
  }

  // Continue示例
  for (int i = 0; i < candidates.length; i++) {
    var candidate = candidates[i];
    if (candidate['yearsExperience'] != 5) {
      continue;
    }
    print('Interviewing ${candidate['name']}...');
  }

  // If语句示例
  if (isRaining()) {
    print('Bring a raincoat.');
  } else if (isSnowing()) {
    print('Wear a jacket.');
  } else {
    print('Put the car top down.');
  }

  // If-case语句示例
  var pair = [1, 2];
  if (pair case [int x, int y]) {
    print('Was coordinate array $x,$y');
  } else {
    throw FormatException('Invalid coordinates.');
  }

  // Switch语句示例
  var command = 'OPEN';
  switch (command) {
    case 'CLOSED':
      executeClosed();
      break;
    case 'PENDING':
      executePending();
      break;
    case 'APPROVED':
      executeApproved();
      break;
    case 'DENIED':
      executeDenied();
      break;
    case 'OPEN':
      executeOpen();
      break;
    default:
      executeUnknown();
  }

  // Switch表达式示例
  var charCode = 47; // 斜杠的ASCII码
  var token = switch (charCode) {
    47 || 42 || 43 || 45 => operator(charCode),
    44 || 59 => punctuation(charCode),
    >= 48 && <= 57 => number(),
    _ => throw FormatException('Invalid'),
  };
  print(token);

  // 异常处理示例
  try {
    breedMoreLlamas();
  } on OutOfLlamasException {
    buyMoreLlamas();
  } on Exception catch (e) {
    print('Unknown exception: $e');
  } catch (e) {
    print('Something really unknown: $e');
  }

  // Finally示例
  try {
    breedMoreLlamas();
  } finally {
    cleanLlamaStalls();
  }
}

bool isRaining() => false;
bool isSnowing() => false;
void executeClosed() => print('Executing closed command.');
void executePending() => print('Executing pending command.');
void executeApproved() => print('Executing approved command.');
void executeDenied() => print('Executing denied command.');
void executeOpen() => print('Executing open command.');
void executeUnknown() => print('Executing unknown command.');
String operator(int charCode) => 'Operator';
String punctuation(int charCode) => 'Punctuation';
String number() => 'Number';

class OutOfLlamasException {}

void breedMoreLlamas() => throw OutOfLlamasException();
void buyMoreLlamas() => print('Buying more llamas.');
void cleanLlamaStalls() => print('Cleaning llama stalls.');
bool shutDownRequested() => false;
void processIncomingRequests() => print('Processing incoming requests.');

/*var message = StringBuffer('Dart is fun');
for (var i = 0; i < 5; i++) {
  message.write('!');
}

var callbacks = [];
for (var i = 0; i < 2; i++) {
  callbacks.add(() => print(i));
}

for (final c in callbacks) {
  c();
}

for (final candidate in candidates) {
  candidate.interview();
}
for (final Candidate(:name, :yearsExperience) in candidates) {
  print('$name has $yearsExperience of experience.');
}
var collection = [1, 2, 3];
collection.forEach(print); // 1 2 3
while (!isDone()) {
  doSomething();
}
do {
  printLine();
} while (!atEndOfPage());
while (true) {
  if (shutDownRequested()) break;
  processIncomingRequests();
}
for (int i = 0; i < candidates.length; i++) {
  var candidate = candidates[i];
  if (candidate.yearsExperience < 5) {
    continue;
  }
  candidate.interview();
}
candidates
    .where((c) => c.yearsExperience >= 5)
    .forEach((c) => c.interview());

if (isRaining()) {
  you.bringRainCoat();
} else if (isSnowing()) {
  you.wearJacket();
} else {
  car.putTopDown();
}
if (pair case [int x, int y]) {
  print('Was coordinate array $x,$y');
} else {
  throw FormatException('Invalid coordinates.');
}
var command = 'OPEN';
switch (command) {
  case 'CLOSED':
    executeClosed();
  case 'PENDING':
    executePending();
  case 'APPROVED':
    executeApproved();
  case 'DENIED':
    executeDenied();
  case 'OPEN':
    executeOpen();
  default:
    executeUnknown();
}
switch (command) {
  case 'OPEN':
    executeOpen();
    continue newCase; // Continues executing at the newCase label.

  case 'DENIED': // Empty case falls through.
  case 'CLOSED':
    executeClosed(); // Runs for both DENIED and CLOSED,

  newCase:
  case 'PENDING':
    executeNowClosed(); // Runs for both OPEN and PENDING.
}

var x = switch (y) { ... };

print(switch (x) { ... });

return switch (x) { ... };

// Where slash, star, comma, semicolon, etc., are constant variables...
switch (charCode) {
  case slash || star || plus || minus: // Logical-or pattern
    token = operator(charCode);
  case comma || semicolon: // Logical-or pattern
    token = punctuation(charCode);
  case >= digit0 && <= digit9: // Relational and logical-and patterns
    token = number();
  default:
    throw FormatException('Invalid');
}

token = switch (charCode) {
  slash || star || plus || minus => operator(charCode),
  comma || semicolon => punctuation(charCode),
  >= digit0 && <= digit9 => number(),
  _ => throw FormatException('Invalid'),
};

// Non-exhaustive switch on bool?, missing case to match null possibility:
switch (nullableBool) {
  case true:
    print('yes');
  case false:
    print('no');
}

sealed class Shape {}

class Square implements Shape {
  final double length;
  Square(this.length);
}

class Circle implements Shape {
  final double radius;
  Circle(this.radius);
}

double calculateArea(Shape shape) => switch (shape) {
  Square(length: var l) => l * l,
  Circle(radius: var r) => math.pi * r * r,
};

// Switch statement:
switch (something) {
  case somePattern when some || boolean || expression:
    //             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Guard clause.
    body;
}

// Switch expression:
var value = switch (something) {
  somePattern when some || boolean || expression => body,
  //               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Guard clause.
}

// If-case statement:
if (something case somePattern when some || boolean || expression) {
  //                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Guard clause.
  body;
}

throw FormatException('Expected at least 1 section');
throw 'Out of llamas!';
void distanceTo(Point other) => throw UnimplementedError();
try {
  breedMoreLlamas();
} on OutOfLlamasException {
  buyMoreLlamas();
}
try {
  breedMoreLlamas();
} on OutOfLlamasException {
  // A specific exception
  buyMoreLlamas();
} on Exception catch (e) {
  // Anything else that is an exception
  print('Unknown exception: $e');
} catch (e) {
  // No specified type, handles all
  print('Something really unknown: $e');
}
try {
  // ···
} on Exception catch (e) {
  print('Exception details:\n $e');
} catch (e, s) {
  print('Exception details:\n $e');
  print('Stack trace:\n $s');
}
void misbehave() {
  try {
    dynamic foo = true;
    print(foo++); // Runtime error
  } catch (e) {
    print('misbehave() partially handled ${e.runtimeType}.');
    rethrow; // Allow callers to see the exception.
  }
}

void main() {
  try {
    misbehave();
  } catch (e) {
    print('main() finished handling ${e.runtimeType}.');
  }
}
try {
  breedMoreLlamas();
} finally {
  // Always clean up, even if an exception is thrown.
  cleanLlamaStalls();
}
try {
  breedMoreLlamas();
} catch (e) {
  print('Error: $e'); // Handle the exception first.
} finally {
  cleanLlamaStalls(); // Then clean up.
}

// Make sure the variable has a non-null value.
assert(text != null);

// Make sure the value is less than 100.
assert(number < 100);

// Make sure this is an https URL.
assert(urlString.startsWith('https'));

assert(
  urlString.startsWith('https'),
  'URL ($urlString) should start with "https".',
);
*/
