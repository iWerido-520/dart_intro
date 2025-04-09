// 定义枚举类型Color
enum Color { red, green, blue }

// 定义枚举类型TColor，包含一个构造函数和一个属性
enum TColor {
  red('FF0000'),
  green('00FF00'),
  blue('0000FF');

  final String hexCode;

  const TColor(this.hexCode);
}

// 定义枚举类型Weekday
enum Weekday { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

// 定义枚举类型Color2并实现一个方法
enum Color2 {
  red,
  green,
  blue;

  String getDescription() {
    switch (this) {
      case Color2.red:
        return 'The color of passion';
      case Color2.green:
        return 'The color of nature';
      case Color2.blue:
        return 'The color of the sky';
    }
  }
}

// 定义枚举类型FileAccessMode
enum FileAccessMode { read, write, execute }

// 定义枚举类型FileAccessMode2并实现一个方法
enum FileAccessMode2 {
  read,
  write,
  execute;

  bool isReadable() {
    return this == FileAccessMode2.read;
  }
}

// 定义枚举类型Status
enum Status { idle, running, paused, completed }

// 定义枚举类型Status2并实现一个方法
enum Status2 {
  idle,
  running,
  paused,
  completed;

  bool isActive() {
    return this == Status2.running || this == Status2.paused;
  }
}

// 定义枚举类型PaymentMethod
enum PaymentMethod { cash, creditCard, debitCard, paypal }

// 定义枚举类型PaymentMethod2并实现一个方法
enum PaymentMethod2 {
  cash,
  creditCard,
  debitCard,
  paypal;

  String getDisplayName() {
    switch (this) {
      case PaymentMethod2.cash:
        return 'Cash';
      case PaymentMethod2.creditCard:
        return 'Credit Card';
      case PaymentMethod2.debitCard:
        return 'Debit Card';
      case PaymentMethod2.paypal:
        return 'PayPal';
    }
  }
}

void main() {
  // 测试枚举类型Color
  Color myColor = Color.red;
  print(myColor);

  // 测试枚举类型TColor
  TColor tColor = TColor.green;
  print('The hex code of ${tColor} is ${tColor.hexCode}');

  // 测试枚举类型Weekday
  Weekday weekday = Weekday.saturday;
  print(weekday);

  // 测试枚举类型Color2及其方法
  Color2 color2 = Color2.blue;
  print(color2.getDescription());

  // 测试枚举类型FileAccessMode
  FileAccessMode accessMode = FileAccessMode.write;
  print(accessMode);

  // 测试枚举类型FileAccessMode2及其方法
  FileAccessMode2 accessMode2 = FileAccessMode2.read;
  print('Is readable? ${accessMode2.isReadable()}');

  // 测试枚举类型Status
  Status status = Status.completed;
  print(status);

  // 测试枚举类型Status2及其方法
  Status2 status2 = Status2.running;
  print('Is active? ${status2.isActive()}');

  // 测试枚举类型PaymentMethod
  PaymentMethod paymentMethod = PaymentMethod.paypal;
  print(paymentMethod);

  // 测试枚举类型PaymentMethod2及其方法
  PaymentMethod2 paymentMethod2 = PaymentMethod2.creditCard;
  print(paymentMethod2.getDisplayName());
}
