// 模拟异步获取版本号的函数
Future<String> lookUpVersion() async {
  // 这里可以模拟一个耗时操作，比如网络请求或文件读取
  await Future.delayed(const Duration(seconds: 2));
  return '1.0.0';
}

// 模拟查找入口点的异步函数
Future<String> findEntryPoint() async {
  await Future.delayed(const Duration(seconds: 1));
  return 'entry_point';
}

// 模拟运行可执行文件的异步函数
Future<int> runExecutable(String entrypoint, List<String> args) async {
  await Future.delayed(const Duration(seconds: 1));
  return 0;
}

// 模拟刷新并退出的异步函数
Future<void> flushThenExit(int exitCode) async {
  await Future.delayed(const Duration(seconds: 1));
  print('Exiting with code $exitCode');
}

// 检查版本号的异步函数
Future<void> checkVersion() async {
  try {
    var version = await lookUpVersion();
    print('Version is $version');
  } catch (e) {
    print('Error looking up version: $e');
  }
}

// 模拟处理请求的函数
void handleRequest(String request) {
  print('Handling request: $request');
}

// 模拟请求服务器的流
Stream<String> requestServer = Stream.periodic(
  const Duration(seconds: 1),
  (count) => 'Request $count',
).take(3);

void main() async {
  // 调用检查版本号的异步函数
  checkVersion();
  // 打印版本号
  print('In main: version is ${await lookUpVersion()}');

  // 使用异步for循环处理流
  await for (final request in requestServer) {
    handleRequest(request);
  }

  // 调用多个异步函数并等待结果
  var entrypoint = await findEntryPoint();
  var exitCode = await runExecutable(entrypoint, []);
  await flushThenExit(exitCode);
}
