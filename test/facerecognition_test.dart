import 'package:flutter_test/flutter_test.dart';
import 'package:facerecognition/facerecognition.dart';
import 'package:facerecognition/facerecognition_platform_interface.dart';
import 'package:facerecognition/facerecognition_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFacerecognitionPlatform
    with MockPlatformInterfaceMixin
    implements FacerecognitionPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FacerecognitionPlatform initialPlatform = FacerecognitionPlatform.instance;

  test('$MethodChannelFacerecognition is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFacerecognition>());
  });

  test('getPlatformVersion', () async {
    Facerecognition facerecognitionPlugin = Facerecognition();
    MockFacerecognitionPlatform fakePlatform = MockFacerecognitionPlatform();
    FacerecognitionPlatform.instance = fakePlatform;

    expect(await facerecognitionPlugin.getPlatformVersion(), '42');
  });
}
