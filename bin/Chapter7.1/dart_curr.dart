import 'dart:async';
import 'dart:isolate';
import 'dart:math';
//import 'dart:ui';

// 模拟一个耗时任务，计算斐波那契数列
int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

// 示例1：使用Isolate进行计算
Future<void> isolateExample() async {
  final ReceivePort receivePort = ReceivePort();
  await Isolate.spawn(isolateFunction, receivePort.sendPort);

  final SendPort sendPort = await receivePort.first as SendPort;
  final responsePort = ReceivePort();

  sendPort.send([responsePort.sendPort, 10]);

  final result = await responsePort.first;
  print('Isolate示例：斐波那契数列第10项的值为: $result');

  responsePort.close();
  receivePort.close();
}

void isolateFunction(SendPort sendPort) {
  final ReceivePort receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);

  receivePort.listen((message) {
    final SendPort responsePort = message[0] as SendPort;
    final int n = message[1] as int;
    final result = fibonacci(n);
    responsePort.send(result);
  });
}

// 示例2：使用compute进行计算
Future<void> computeExample() async {
  final result = await compute(fibonacci, 10);
  print('Compute示例：斐波那契数列第10项的值为: $result');
}

compute(int Function(int n) fibonacci, int i) {}

// 示例3：使用Stream进行异步数据处理
Future<void> streamExample() async {
  final Stream<int> stream = Stream.periodic(
    const Duration(milliseconds: 500),
    (count) => count,
  );
  final StreamSubscription<int> subscription = stream.listen((data) {
    print('Stream示例：接收到数据 $data');
    if (data >= 5) {
      //subscription.cancel();
    }
  });
}

// 示例4：使用Future进行异步操作
Future<void> futureExample() async {
  print('Future示例：开始异步操作');
  await Future.delayed(const Duration(seconds: 2));
  print('Future示例：异步操作完成');
}

// 示例5：使用async/await处理多个Future
Future<void> asyncAwaitExample() async {
  print('async/await示例：开始执行');
  final Future<int> future1 = Future.delayed(
    const Duration(seconds: 1),
    () => 1,
  );
  final Future<int> future2 = Future.delayed(
    const Duration(seconds: 2),
    () => 2,
  );

  final int result1 = await future1;
  final int result2 = await future2;

  print('async/await示例：结果1: $result1, 结果2: $result2');
}

// 示例6：处理Isolate之间的消息传递和错误处理
Future<void> isolateErrorHandlingExample() async {
  final ReceivePort mainReceivePort = ReceivePort();
  await Isolate.spawn(isolateWithErrorHandling, mainReceivePort.sendPort);

  final SendPort isolateSendPort = await mainReceivePort.first as SendPort;
  final ReceivePort responsePort = ReceivePort();

  isolateSendPort.send([responsePort.sendPort, 'error-trigger']);

  responsePort.listen((message) {
    if (message is String) {
      print('Isolate错误处理示例：接收到消息: $message');
    } else if (message is SendPort) {
      // 处理其他情况
    } else if (message is Error) {
      print('Isolate错误处理示例：捕获到错误: ${message.toString()}');
    }
  });

  mainReceivePort.close();
  responsePort.close();
}

void isolateWithErrorHandling(SendPort sendPort) {
  final ReceivePort receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);

  receivePort.listen((message) {
    try {
      final SendPort responsePort = message[0] as SendPort;
      final String input = message[1] as String;
      if (input == 'error-trigger') {
        throw Error();
      }
      responsePort.send('正常处理结果');
    } catch (e) {
      final SendPort responsePort = message[0] as SendPort;
      responsePort.send(e);
    }
  });
}

void main() async {
  print('主程序开始');

  await isolateExample();
  await computeExample();
  await streamExample();
  await futureExample();
  await asyncAwaitExample();
  await isolateErrorHandlingExample();

  print('主程序结束');
}
