import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'facerecognition_platform_interface.dart';

/// An implementation of [FacerecognitionPlatform] that uses method channels.
class MethodChannelFacerecognition extends FacerecognitionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('facerecognition');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
