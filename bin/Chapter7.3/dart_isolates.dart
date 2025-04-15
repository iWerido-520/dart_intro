import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

// 实现一个简单的worker isolate，通过Isolate.run简化操作
Future<void> simpleWorkerIsolateExample() async {
  // 模拟JSON数据
  const String mockJson = '{"name": "example", "age": 10}';
  final jsonData = await Isolate.run(() {
    return jsonDecode(mockJson) as Map<String, dynamic>;
  });
  print('简单worker isolate示例 - JSON键的数量: ${jsonData.length}');
}

// 使用闭包创建worker isolate
Future<void> sendClosuresWithIsolatesExample() async {
  // 模拟JSON数据
  const String mockJson = '{"name": "example", "age": 10}';
  final jsonData = await Isolate.run(() async {
    return jsonDecode(mockJson) as Map<String, dynamic>;
  });
  print('使用闭包的worker isolate示例 - JSON键的数量: ${jsonData.length}');
}

// 基本端口示例
class BasicWorker {
  late SendPort _sendPort;
  final Completer<void> _isolateReady = Completer.sync();

  Future<void> spawn() async {
    final receivePort = ReceivePort();
    receivePort.listen(_handleResponsesFromIsolate);
    await Isolate.spawn(_startRemoteIsolate, receivePort.sendPort);
  }

  void _handleResponsesFromIsolate(dynamic message) {
    if (message is SendPort) {
      _sendPort = message;
      _isolateReady.complete();
    } else if (message is Map<String, dynamic>) {
      print('基本端口示例 - 处理来自worker isolate的消息: $message');
    }
  }

  static void _startRemoteIsolate(SendPort port) {
    final receivePort = ReceivePort();
    port.send(receivePort.sendPort);
    receivePort.listen((dynamic message) async {
      if (message is String) {
        final transformed = jsonDecode(message);
        port.send(transformed);
      }
    });
  }

  Future<void> parseJson(String message) async {
    await _isolateReady.future;
    _sendPort.send(message);
  }
}

// 健壮端口示例
class RobustWorker {
  final SendPort _commands;
  final ReceivePort _responses;
  final Map<int, Completer<Object?>> _activeRequests = {};
  int _idCounter = 0;
  bool _closed = false;

  Future<Object?> parseJson(String message) async {
    if (_closed) throw StateError('Closed');
    final completer = Completer<Object?>.sync();
    final id = _idCounter++;
    _activeRequests[id] = completer;
    _commands.send((id, message));
    return await completer.future;
  }

  static Future<RobustWorker> spawn() async {
    final initPort = RawReceivePort();
    final connection = Completer<(ReceivePort, SendPort)>.sync();
    initPort.handler = (initialMessage) {
      final commandPort = initialMessage as SendPort;
      connection.complete((
        ReceivePort.fromRawReceivePort(initPort),
        commandPort,
      ));
    };
    try {
      await Isolate.spawn(_startRemoteIsolate, initPort.sendPort);
    } on Object {
      initPort.close();
      rethrow;
    }
    final (ReceivePort receivePort, SendPort sendPort) =
        await connection.future;
    return RobustWorker._(receivePort, sendPort);
  }

  RobustWorker._(this._responses, this._commands) {
    _responses.listen(_handleResponsesFromIsolate);
  }

  void _handleResponsesFromIsolate(dynamic message) {
    final (int id, Object? response) = message as (int, Object?);
    final completer = _activeRequests.remove(id)!;
    if (response is RemoteError) {
      completer.completeError(response);
    } else {
      completer.complete(response);
    }
    if (_closed && _activeRequests.isEmpty) _responses.close();
  }

  static void _handleCommandsToIsolate(
    ReceivePort receivePort,
    SendPort sendPort,
  ) {
    receivePort.listen((message) {
      if (message == 'shutdown') {
        receivePort.close();
        return;
      }
      final (int id, String jsonText) = message as (int, String);
      try {
        final jsonData = jsonDecode(jsonText);
        sendPort.send((id, jsonData));
      } catch (e) {
        sendPort.send((id, RemoteError(e.toString(), '')));
      }
    });
  }

  static void _startRemoteIsolate(SendPort sendPort) {
    final receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    _handleCommandsToIsolate(receivePort, sendPort);
  }

  void close() {
    if (!_closed) {
      _closed = true;
      _commands.send('shutdown');
      if (_activeRequests.isEmpty) _responses.close();
      print('健壮端口示例 - --- port closed --- ');
    }
  }
}

void main() async {
  // 简单worker isolate示例
  await simpleWorkerIsolateExample();

  // 使用闭包创建worker isolate示例
  await sendClosuresWithIsolatesExample();

  // 基本端口示例
  final basicWorker = BasicWorker();
  await basicWorker.spawn();
  await basicWorker.parseJson('{"key":"value"}');

  // 健壮端口示例
  final robustWorker = await RobustWorker.spawn();
  print(await robustWorker.parseJson('{"key":"value"}'));
  print(await robustWorker.parseJson('"banana"'));
  print(await robustWorker.parseJson('[true, false, null, 1, "string"]'));
  print(
    await Future.wait([
      robustWorker.parseJson('"yes"'),
      robustWorker.parseJson('"no"'),
    ]),
  );
  robustWorker.close();
}
