import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:facerecognition/facerecognition_method_channel.dart';

void main() {
  MethodChannelFacerecognition platform = MethodChannelFacerecognition();
  const MethodChannel channel = MethodChannel('facerecognition');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
