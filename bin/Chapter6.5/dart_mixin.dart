// 定义Musical mixin
mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

// 定义Musician mixin并包含抽象方法
mixin Musician {
  void playInstrument(String instrumentName); // 抽象方法

  void playPiano() {
    playInstrument('Piano');
  }

  void playFlute() {
    playInstrument('Flute');
  }
}

// 定义Virtuoso类使用Musician mixin
class Virtuoso with Musician {
  @override
  void playInstrument(String instrumentName) {
    print('Plays the $instrumentName beautifully');
  }
}

// 定义NameIdentity mixin访问子类状态
mixin NameIdentity {
  String get name;

  int get hashCode => name.hashCode;
  bool operator ==(Object other) => other is NameIdentity && name == other.name;
}

// 定义Person类使用NameIdentity mixin
class Person with NameIdentity {
  String name;

  Person(this.name);
}

// 定义Tuner接口
abstract interface class Tuner {
  void tuneInstrument();
}

// 定义Guitarist mixin实现Tuner接口
mixin Guitarist implements Tuner {
  @override
  void playSong() {
    tuneInstrument();
    print('Strums guitar majestically.');
  }
}

// 定义PunkRocker类使用Guitarist mixin
class PunkRocker with Guitarist {
  @override
  void tuneInstrument() {
    print("Don't bother, being out of tune is punk rock.");
  }
}

// 定义Musician类
/*class Musician {
  void musicianMethod() {
    print('Playing music!');
  }
}*/

// 定义MusicalPerformer mixin并使用on关键字
mixin MusicalPerformer on Musician {
  void performerMethod() {
    print('Performing music!');
    //super.musicianMethod();
  }
}

// 定义SingerDancer类继承Musician并使用MusicalPerformer mixin
//class SingerDancer extends Musician with MusicalPerformer {}

// 定义mixin class
mixin class NewMusician {
  void newMusicMethod() {
    print('Playing new music!');
  }
}

// 使用mixin class作为mixin
class Novice1 with NewMusician {
  void testMethod() {
    newMusicMethod();
  }
}

// 使用mixin class作为类
class Novice2 extends NewMusician {
  void testMethod() {
    newMusicMethod();
  }
}

void main() {
  // 测试Musical mixin
  Maestro maestro = Maestro('John');
  maestro.entertainMe();

  // 测试Musician mixin
  Virtuoso virtuoso = Virtuoso();
  virtuoso.playPiano();

  // 测试NameIdentity mixin
  Person person = Person('Alice');
  print(person.hashCode);
  print(person == Person('Alice'));

  // 测试Guitarist mixin
  PunkRocker punkRocker = PunkRocker();
  punkRocker.playSong();

  // 测试MusicalPerformer mixin
  //SingerDancer singerDancer = SingerDancer();
  //singerDancer.performerMethod();

  // 测试mixin class
  Novice1 novice1 = Novice1();
  novice1.testMethod();
  Novice2 novice2 = Novice2();
  novice2.testMethod();
}

// 定义Maestro类使用多个mixins
class Maestro extends Person with Musical, Aggressive, Demented {
  Maestro(String maestroName) : super('') {
    name = maestroName;
    canConduct = true;
  }
}

// 定义Aggressive mixin（假设简单打印）
mixin Aggressive {
  void actAggressive() {
    print('Acting aggressively');
  }
}

// 定义Demented mixin（假设简单打印）
mixin Demented {
  void actDemented() {
    print('Acting demented');
  }
}
