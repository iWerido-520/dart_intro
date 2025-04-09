class Television {
  void turnOn() {
    _illuminateDisplay();
    _activateIrSensor();
  }

  set contrast(int value) {
    // 这里简单占位，实际应包含设置对比度的逻辑
    print('Setting contrast to $value in Television');
  }

  void _illuminateDisplay() {
    print('Illuminating display in Television');
  }

  void _activateIrSensor() {
    print('Activating IR sensor in Television');
  }
}

class SmartTelevision extends Television {
  @override
  void turnOn() {
    super.turnOn();
    _bootNetworkInterface();
    _initializeMemory();
    _upgradeApps();
  }

  @override
  set contrast(num value) {
    // 这里简单占位，实际应包含设置对比度的逻辑
    print('Setting contrast to $value in SmartTelevision');
  }

  void _bootNetworkInterface() {
    print('Booting network interface in SmartTelevision');
  }

  void _initializeMemory() {
    print('Initializing memory in SmartTelevision');
  }

  void _upgradeApps() {
    print('Upgrading apps in SmartTelevision');
  }
}

class A {
  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: ${invocation.memberName}');
  }

  void nonExistentMethod() {}
}

void main() {
  SmartTelevision smartTv = SmartTelevision();
  smartTv.turnOn();
  smartTv.contrast = 50;

  A a = A();
  // 尝试调用不存在的方法，触发noSuchMethod
  a.nonExistentMethod();
}
